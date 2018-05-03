Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id u35-v6sm15526830wrc.29.2018.05.03.12.48.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 May 2018 12:48:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 24A183E00FC;
	Thu,  3 May 2018 20:48:22 +0100 (BST)
References: <1524153386-3550-1-git-send-email-abdallah.bouassida@lauterbach.com>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org, khaled.jmal@lauterbach.com
Subject: Re: [PATCH v6 0/3] target/arm: Add a dynamic XML-description of the cp-registers to GDB
In-reply-to: <1524153386-3550-1-git-send-email-abdallah.bouassida@lauterbach.com>
Date: Thu, 03 May 2018 20:48:22 +0100
Message-ID: <87zi1g8qrd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ubbJaKfA5iGI


Abdallah Bouassida <abdallah.bouassida@lauterbach.com> writes:

> The previous version:
> http://patchwork.ozlabs.org/project/qemu-devel/list/?series=3D33714

I was trying to do some testing but I was finding it very hard to do at
gdb kept throwing up errors like:

(gdb) x/10i $pc
=3D> 0xffffff8008097760 <check_and_switch_context>:       Cannot access mem=
ory at address 0xffffff8008097760
Detaching from program: /home/alex/lsrc/qemu/kernel-v8-plain.build/vmlinux,=
 Remote target
Ending remote debugging.

However this seems to be the same on master as well so I wonder there is
a regression somewhere.

What was the last QEMU master commit you've tested these patches on?
I'll do some more digging tomorrow.

--
Alex Benn=C3=A9e
