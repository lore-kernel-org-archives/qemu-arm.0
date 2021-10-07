Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id g1sm9593418wmk.2.2021.10.07.07.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 07:53:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 02AA51FF96;
	Thu,  7 Oct 2021 15:53:16 +0100 (BST)
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Laurent Vivier <laurent@vivier.eu>, Richard Henderson
 <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, assad.hashmi@linaro.org,
 Eric W. Biederman <ebiederm@xmission.com>, James Bottomley
 <James.Bottomley@HansenPartnership.com>, Arnd Bergmann
 <arnd.bergmann@linaro.org>
Subject: Approaches for same-on-same linux-user execve?
Date: Thu, 07 Oct 2021 15:32:19 +0100
Message-ID: <877deoevj8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 3UZFXKJhug1D

Hi,

I came across a use-case this week for ARM although this may be also
applicable to architectures where QEMU's emulation is ahead of the
hardware currently widely available - for example if you want to
exercise SVE code on AArch64. When the linux-user architecture is not
the same as the host architecture then binfmt_misc works perfectly fine.

However in the case you are running same-on-same you can't use
binfmt_misc to redirect execution to using QEMU because any attempt to
trap native binaries will cause your userspace to hang as binfmt_misc
will be invoked to run the QEMU binary needed to run your application
and a deadlock ensues.

There are some hacks you can apply at a local level like tweaking the
elf header of the binaries you want to run under emulation and adjusting
the binfmt_mask appropriately. This works but is messy and a faff to
set-up.

An ideal setup would be would be for the kernel to catch a SIGILL from a
failing user space program and then to re-launch the process using QEMU
with the old processes maps and execution state so it could continue.
However I suspect there are enough moving parts to make this very
fragile (e.g. what happens to the results of library feature probing
code). So two approaches I can think of are:

Trap execve in QEMU linux-user
------------------------------

We could add a flag to QEMU so at the point of execve it manually
invokes the new process with QEMU, passing on the flag to persist this
behaviour.


Add path mask to binfmt_misc
----------------------------

The other option would be to extend binfmt_misc to have a path mask so
it only applies it's alternative execution scheme to binaries in a
particular section of the file-system (or maybe some sort of pattern?).

Are there any other approaches you could take? Which do you think has
the most merit?

Thanks,

--=20
Alex Benn=C3=A9e
