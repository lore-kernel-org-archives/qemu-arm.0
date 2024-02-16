Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id b14-20020a05600010ce00b0033d06dfcf84sm1946480wrx.100.2024.02.16.03.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 03:40:22 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id E001C5F83F;
	Fri, 16 Feb 2024 11:40:21 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mark Charney OS <mark.charney@os.amperecomputing.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,  "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>,  Aaron Lindsay OS <aaron@os.amperecomputing.com>,
  "richard.henderson@linaro.org" <richard.henderson@linaro.org>
Subject: Re: QEMU 8.2.0 aarch64 sve ldff1b returning 1 byte when 16 are
 expected
In-Reply-To: <BL1PR01MB7795E154CD5AE6ADA60C0D53A87C2@BL1PR01MB7795.prod.exchangelabs.com>
	(Mark Charney's message of "Wed, 31 Jan 2024 20:44:55 +0000")
References: <BL1PR01MB7795E154CD5AE6ADA60C0D53A87C2@BL1PR01MB7795.prod.exchangelabs.com>
User-Agent: mu4e 1.11.28; emacs 29.1
Date: Fri, 16 Feb 2024 11:40:21 +0000
Message-ID: <87mss04oyi.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ORohhulUb7xW

Mark Charney OS <mark.charney@os.amperecomputing.com> writes:

> Using QEMU v8.2.0 (and also the HEAD of the git master branch), I
> encountered an unexpected situation: an ldff1b is returning 1 byte
> when I run with the QEMU user level plugin (and setting FFR as if
> there was a fault).
>
> However the ldff1b actually loads 16 bytes when: (a) I run this same
> test natively on a system with SVE support (no QEMU involved) or (b)
> when I run this test interactively (logged in to a console) in GDB
> running on the QEMU (with no plugin involved).
>
> I was wondering if this one-byte-per-ldff1b was a known/expected
> behavior with plugins?  I guess it is legal to only return one byte,
> but I was wondering why QEMU did this and if there was some way to get
> QEMU to return 16 bytes in the absence of faults (or as many bytes as
> it can up until the fault).

Could it be a change with the location w.r.t a page boundary between the
two cases?

>
> There is *no* page boundary being crossed in the examples of interest,
> and no MMIO, so a partial data return is not expected. The page
> referenced is mapped and previously referenced.
>
> Talking to Alex Bennee, he pointed out:
>
>> I'm wondering if this is a result of the fix in 6d03226b422
>> (plugins: force slow path when plugins instrument memory ops). This
>> will always force the slow path which is where we instrument the
>> operation.
>
> I attempted to revert this commit locally and no longer got memop
> callbacks for any SVE load operations, first fault, nonfault or not
> "normal" predicated SVE operations. But I believe ldff1b are returning
> 16 bytes (judging by the control flow).
>
> Our goal is to use QEMU for tracing with a home-grown plugin.  For our
> purposes, we were expecting to observe control flow like what we see
> on SVE-enabled hardware where ldff1b returns 16 bytes in the absence
> of faults.
>
> If necessary, I can provide a reproducer, that includes:
>   - a sve strcpy loop from one of Alex's talks.

Yeah lets add the test case.

>   - a simple user level plugin

It should show up with execlog as well right?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
