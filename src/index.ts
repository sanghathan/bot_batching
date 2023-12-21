function sayHello(name: string): string {
    return `Hello, ${name}!`;
}

const greeting = sayHello("TypeScript");
console.log(greeting);

export const sum
    = (...a: number[]) =>
        a.reduce((acc, val) => acc + val, 0);
