Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id o138sm1524289wmg.36.2017.09.19.02.47.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Sep 2017 02:47:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 84FAF3E02BD;
	Tue, 19 Sep 2017 10:47:52 +0100 (BST)
References: <HE1P18901MB00282662006060701CFB5A71A9630@HE1P18901MB0028.EURP189.PROD.OUTLOOK.COM>
User-agent: mu4e 0.9.19; emacs 25.3.50.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: theUser BL <theuserbl@hotmail.com>
Cc: "qemu-arm\@nongnu.org" <qemu-arm@nongnu.org>
Subject: Re: [Qemu-arm] Will the Google Fuchsia modifications of arm qemu be added?
In-reply-to: <HE1P18901MB00282662006060701CFB5A71A9630@HE1P18901MB0028.EURP189.PROD.OUTLOOK.COM>
Date: Tue, 19 Sep 2017 10:47:52 +0100
Message-ID: <87a81rdnp3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: pTrU/+R0CMjh


theUser BL <theuserbl@hotmail.com> writes:

> Google writes a new operating system with a new kernel for it.
> The complete operating system is called "Fuchsia" and the kernel was called "Magenta" and later renamed to "Zircon".
> Here an litte overview of it:
> https://fuchsia.miraheze.org/wiki/Main_Page
>
> The Magenta/Zircon part includes not only the kernel, it have additional parts (like the GNU-tools of GNU/Linux).
>
> To build Magenta/Zircon this page describes it:
> https://fuchsia.googlesource.com/magenta/+/HEAD/docs/getting_started.md
> The easiest way to run Magenta/Zircon in an virtual machine, is to installing the toolchain, which includes qemu
> https://fuchsia.googlesource.com/magenta/+/HEAD/docs/qemu.md
>
> Magenta/Zircon existing as x86_64 and arm64 versions.
> Two qemus are in the toolchain: qemu-system-x86_64 and qemu-system-aarch64.
> The first one is also an modified version of qemu, but I don't see any difference to the original qemu.
> But the last one (aarch64) is really needed, to run the arm-version. The original qemu can't run the ARM64 Magenta/Zircon.
>
> So, do you know, what changes they have done?

You can see where they forked from:

  git merge-base upstream/master fuchsia/master
  1ab5eb4efb91a3d4569b0df6e824cc08ab4bd8ec

Which is v2.10.0

Looking at the diffs between the two they don't seem overly great. There
is some build messing about to do with libsdl, some changes to boot and
creation of some PCI devices in the virt board. There is something with
the option rom and also some __APPLE__ compile fixes.

> And will they later be added to the original qemu?

Only if someone goes to the trouble of cleaning up the patches and
submitting them to the mailing list - that has to be driven either by
Google themselves or someone willing to dig into understanding what the
patches are trying to do and supporting them during the up-streaming
process.

That said ARM M-profile is an area of active development in QEMU, mainly
supporting things like IoT devices. It's a little unclear if the Fuschia
RTOS is targeting M profile or A profile class processors though. A
profile is already pretty well supported although still a little behind
on the later revisions instruction support.

> Here is the source of the modified qemu:
> https://fuchsia.googlesource.com/third_party/qemu/+/master
> https://github.com/fuchsia-mirror/third_party-qemu
>
> Greetings
> theuserbl


--
Alex Bennée
