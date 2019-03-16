Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id g24sm6047544wmh.45.2019.03.16.05.01.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 16 Mar 2019 05:01:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 904931FF87;
	Sat, 16 Mar 2019 12:01:43 +0000 (UTC)
References: <CABgYhWf=unSbmTksO+gkUuX+UL3g8HvEuDAeDdxBQVbzci05DQ@mail.gmail.com> <CAFEAcA8xqO=iV9oJWWdPHhhDFRmAoegMpwUZQUszXLwG7zS=Hw@mail.gmail.com> <CABgYhWdu-H6zfWjwwtJbFK6TJa89tqERtX=djYpFobWjir_C6A@mail.gmail.com>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-arm] QEMU user mode for cortex M
In-reply-to: <CABgYhWdu-H6zfWjwwtJbFK6TJa89tqERtX=djYpFobWjir_C6A@mail.gmail.com>
Date: Sat, 16 Mar 2019 12:01:43 +0000
Message-ID: <87sgvnt4d4.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: tcx2C3FOv37J


Massimiliano Cialdi <cialdi@gmail.com> writes:

> I have tried to follow some websites, such as, for example,
> https://gnu-mcu-eclipse.github.io/qemu/options/,
> http://sushihangover.github.io/arm-cortex-m-semihosting-with-qemu/ or
> https://balau82.wordpress.com/2010/11/04/qemu-arm-semihosting/ without
> success
>
> I have my exetutable compiled with
> /opt/gcc-arm-none-eabi-8-2018-q4-major/bin/arm-none-eabi-gcc -std=3Dgnu11
> -mcpu=3Dcortex-m7 -mthumb -mfloat-abi=3Dhard -mfpu=3Dfpv5-d16 -fno-common
> -specs=3Drdimon.specs -Wl,--cref,-Map=3Dmain.map main.c -o main.elf

I thought you wanted to target a cortex-m4?

Have a look at how test-armv6m-undef is built. It is the simplest
dumbest M profile image you can build with a kernel that maps to 0 and a
simple reset vector at the start of the vector table:

>
> then I try to execute qemu:
> ~/Downloads/qemu/qemu-3.1.0/arm-softmmu/qemu-system-arm -d
> unimp,guest_errors -machine virt -monitor null -serial null  -semihosting
> -nographic -semihosting-config enable=3Don,target=3Dnative -kernel
> main.elf

I don't know what the virt machine defaults to for CPU but I'm fairly
sure it's not an m-profile CPU.
> write access to unsupported AArch32 64 bit system register cp:12 opc1: 15
> crm:8 (non-secure)
>
>
> and nothing happend. Where am I wrong? I'm wrong at the compilation stage,
> at the execution stage or both? Is there something wrong with the command
> line parameters? Which one? How do I force a cortex-m4? How can I force t=
he
> Cpu without having to choose any machine?

It's hard to say without seeing what your test is doing. However I can force
a cortex-m4 on a microbit and run the following ok:

  ./qemu-system-arm  -monitor none -display none \
                     -chardev file,path=3Dtest-armv6m-undef.out,id=3Doutput=
 \
                     -semihosting -M microbit \
                     -cpu cortex-m4 \
                     -kernel tests/test-armv6m-undef
                     -d in_asm,cpu,nochain


>
> best regards
> Max
>
> On Fri, Mar 15, 2019 at 11:05 AM Peter Maydell <peter.maydell@linaro.org>
> wrote:
>
>> On Thu, 14 Mar 2019 at 22:30, Massimiliano Cialdi <cialdi@gmail.com>
>> wrote:
>> >
>> > hello,
>> > I would like to try some algorithms on cortex M (especially cortex M4).
>> I don't need to emulate the whole machine, I just need the user mode.
>> > To test the feasibility, I wrote the trivial "hello world".
>> >
>> > I can compile it with arm-none-eabi-gcc, but the newlib associated with
>> it does not implement any syscall.
>> > So I tried, on ubuntu, with the cross compiler arm-linux-gnueabihf-gcc
>> and its libc6, but the latter is only distributed for cortex A.
>> >
>> > What do you suggest? Should I recompile the libc6 for cortex M (or do I
>> find it pre-compiled)? Should I implement (and how?) syscalls on newlib?
>> >
>> > In summary, I would need a step-by-step guide to running Cortex M code
>> on QEMU arm user mode.
>>
>> User-mode in Cortex-M is a weird thing to do, because what QEMU
>> gives you is the A-profile Linux syscalls. It's a hybrid that
>> we only continue to provide because it happens to be used and
>> useful to the gcc folks doing compiler testing. I would
>> recommend against using it, personally.
>>
>> System emulation mode will get you something that actually
>> works the way the real hardware does. You can then do
>> output either via the UART or via semihosting (you need to
>> enable the latter on the commandline).
>>
>> thanks
>> -- PMM
>>


--
Alex Benn=C3=A9e
