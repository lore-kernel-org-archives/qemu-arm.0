Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q12sm2068247wmj.6.2021.10.08.03.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 03:49:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 98B7C1FF96;
	Fri,  8 Oct 2021 11:49:39 +0100 (BST)
References: <877deoevj8.fsf@linaro.org>
 <CAK8P3a3rKZLq3UuE=w9W5A9G9tfmPvc-ObnWVX=PJKQKrTX5dA@mail.gmail.com>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Laurent Vivier <laurent@vivier.eu>, Richard Henderson
 <richard.henderson@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, assad.hashmi@linaro.org, "Eric W.
 Biederman" <ebiederm@xmission.com>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Arnd Bergmann
 <arnd.bergmann@linaro.org>
Subject: Re: Approaches for same-on-same linux-user execve?
Date: Fri, 08 Oct 2021 11:44:20 +0100
In-reply-to: <CAK8P3a3rKZLq3UuE=w9W5A9G9tfmPvc-ObnWVX=PJKQKrTX5dA@mail.gmail.com>
Message-ID: <87lf33dc58.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: y+Tu1zIcB81l


Arnd Bergmann <arnd@arndb.de> writes:

> On Thu, Oct 7, 2021 at 4:32 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>>
>> I came across a use-case this week for ARM although this may be also
>> applicable to architectures where QEMU's emulation is ahead of the
>> hardware currently widely available - for example if you want to
>> exercise SVE code on AArch64. When the linux-user architecture is not
>> the same as the host architecture then binfmt_misc works perfectly fine.
>>
>> However in the case you are running same-on-same you can't use
>> binfmt_misc to redirect execution to using QEMU because any attempt to
>> trap native binaries will cause your userspace to hang as binfmt_misc
>> will be invoked to run the QEMU binary needed to run your application
>> and a deadlock ensues.
>
> Can you clarify how the code would run in this case? Does qemu-user
> still emulate every single instruction, both the compatible and the incom=
patible
> ones, or is the idea here to run as much as possible natively and only
> emulate the instructions that are not available natively, using either
> SIGILL or searching through the object code for those instructions?

qemu-user only every does a complete translation. The hope is of course
our translator is "fairly efficient" so for example integer SVE
operations should get unrolled into a series of AdvSIMD instructions on
the backend.

ARM's armie takes a different approach with the trap and emulate of
SIGILL instructions. This works well for the occasional "new"
instruction but will be less efficient overall if your instruction
stream is entirely novel.

>> Trap execve in QEMU linux-user
>> ------------------------------
>>
>> We could add a flag to QEMU so at the point of execve it manually
>> invokes the new process with QEMU, passing on the flag to persist this
>> behaviour.
>
> This sounds like the obvious approach if you already do a full
> instruction emulation. You'd still need to run the parent process
> by calling qemu-user manually, but I suppose you need to do
> something like this in any case.
>
>> Add path mask to binfmt_misc
>> ----------------------------
>>
>> The other option would be to extend binfmt_misc to have a path mask so
>> it only applies it's alternative execution scheme to binaries in a
>> particular section of the file-system (or maybe some sort of pattern?).
>
> The main downside I see here is that it requires kernel modification, so
> it would not work for old kernels.
>
>> Are there any other approaches you could take? Which do you think has
>> the most merit?
>
> If we modify binfmt_misc in the kernel, it might be helpful to do it
> by extending it with namespace support, so it could be constrained
> to a single container without having to do the emulation outside.
> Unfortunately that does not solve the problem of preventing the
> qemu-user binary from triggering the binfmt_misc lookup.

I wonder how that would interact with the persistent ("P") mode of
binfmt_misc. The backend is identified at the start and gets re-used
rather than looked up each time.

>
>        Arnd


--=20
Alex Benn=C3=A9e
