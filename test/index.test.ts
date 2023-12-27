import { sum } from '../src';

function delay(ms: number) {
    return new Promise(resolve => {
        setTimeout(resolve, ms);
    });
}


test('basic', async () => {
    const rand = Math.floor(Math.random() * 300)
    console.log(`random number in basic test is: ${rand}`)
    await delay(rand * 1000)
    if (rand < 30) {
        // expect(sum()).toBe(1);
        expect(sum()).toBe(0); // conflict apple
    } else {
        expect(sum()).toBe(0);
    }

}, 300000 /* optional timeout */);

test('basic again', async () => {
    const rand = Math.floor(Math.random() * 200)
    console.log(`random number in basic again test is: ${rand}`)
    await delay(rand * 1000)
    expect(sum(1, 2)).toBe(3);
}, 300000 /* optional timeout */);
