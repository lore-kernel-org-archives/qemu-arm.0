Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7507250lff;
        Wed, 15 Jan 2020 14:02:36 -0800 (PST)
X-Received: by 2002:a7b:cb0a:: with SMTP id u10mr2171249wmj.165.1579125756775;
        Wed, 15 Jan 2020 14:02:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579125756; cv=none;
        d=google.com; s=arc-20160816;
        b=wZ/NBTpA20mdK+9thclwkBdFgafpMsp/7fP20iUgU+GbDxfZparSD1CCOLaj8w7h5f
         3Rbfq05JRrL0Gbleehj7rPJAFGrMOOXKsdLb8ks1iGOLcSlq0yMARpNNBc1D9q8Pz/+g
         FbQsy7/RdFS0rSBdNye5AU4wr4PjG4MHJ6fe80vLcuKLikoylSOvA+c++IAy5+3GG6vP
         8y0QS+TN219FsehtnIgeEzr28h1uxXnagR6/YW1wGWelA1yhMbGvKAw2FE2Hoe1YK8Id
         Lm79OQI2tIzH0l2d+PnEJSIcy/FtOfG6fFbwwVAK3y0+bj3ZPOFYjFTJ03A2dOnbPrF+
         Ybmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=BVP4NRhPFSHrJjIPjsLJjDTukdxB17WP9oLbQhCIBco=;
        b=sm0d1n8EX7rTJu99kr14uuIU2IbVtDUYptujIu8WwNMGj9cJhq7m+cEm4Y5wHVHD/6
         HGrZAraKUUw51S7bQTytbrbXWCMrIhMzHEai9XAblCHLSXcPc8Pp1Sjx+5jDYpgNGfwV
         Xc8/4VryftTRggthHbY5haYB8nTUG7362JzAfTQMfBqV6Itk8wM+KwivrTsD2ppAfnUN
         5jv13DMCDLuCk/7vDBzSPHwNOFvZ/krYqNovDHLtzqreuHCmaX5nhQ98m98yzaPEEVH1
         PT7yoOl9NVyMx6xSg7A7zcWXSWNuz9HIjh8E9BsZPhW/uFOT5uAw9u6xose5ddaZ3LX5
         58+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@livius-net.20150623.gappssmtp.com header.s=20150623 header.b=Czam+KsK;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of ilg@livius.net) smtp.mailfrom=ilg@livius.net
Return-Path: <ilg@livius.net>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g10sor791078wmc.17.2020.01.15.14.02.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 Jan 2020 14:02:36 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of ilg@livius.net) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@livius-net.20150623.gappssmtp.com header.s=20150623 header.b=Czam+KsK;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of ilg@livius.net) smtp.mailfrom=ilg@livius.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=livius-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=BVP4NRhPFSHrJjIPjsLJjDTukdxB17WP9oLbQhCIBco=;
        b=Czam+KsK9C95nTf5qjQT9KAkUSAzIcYuTDwzhpTwj6u9yRv9OyTZYG3l9tTQw3d2x+
         zMjmX1KW86zl5B39fT73/mSd6Vwp6DYH7n+/zME4sFY3CNz2ikTffFv0/3ZvllRiP6pL
         KypTnMzXip1BvG22i8d5TglYMtdZE2Xcf9hafFZTU0Ys87+Kkwr5Wbii7fC7c9iUR5bf
         33WxaoxlIgPgSBdiiQzdHCArFB7A+8l++1yXlVERq2ge34+bcevxQBYqrg9F6OBC3R1I
         Uz9RMqy9TBIrdT1PdyJTxUbH523xcYqlaPcDN/033v7cxDL3C/a1EBNpGpl06bkc+Lo9
         +mUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=BVP4NRhPFSHrJjIPjsLJjDTukdxB17WP9oLbQhCIBco=;
        b=IuRPWNomdfDSrA6hMMSAPYRxS9ZSC0C3RNeU4ySNrRAMOtEvpVV2WO5mC3KnGZBeGz
         p3uxS/ZwDQ8u7xrHHPVRTJe2NvL9OyPwAnpH6z7kB/mXn1vIX+GzuHJsTUyPWmHo6cK3
         1GXLL3KuKeAsh8fAjJ/85QynwWeezkEq1bYvnLA4PGHRDfH+svhTlmNE4DnPwUrZ0ds8
         pyKpougK/N7PRsc+PgucXzGKTR789rCzAtK8c0S5kv+4gv+wP3tIsh7cqC157W8TCjre
         oV9Pzs5EUSaPanMVZP4AgVqvXOJhMRmkLkE34ZoO+/y29DeyxeYdsP9yO214rE1d6tHd
         a7mA==
X-Gm-Message-State: APjAAAUoc4jY5oTQJHHHmm2Utj+ZpyZT4T1WKPxmz5YcLZ0DR1rkmp1r
	Qkp5o97qIKiX7kSO0htMLynpyQ==
X-Google-Smtp-Source: APXvYqwc6ILREdvaPjw/6hgXNUkja5UGYqX1XBZwxQPckqc9HhSxHwL67CkmahIVcr4JRhvxsikXEA==
X-Received: by 2002:a05:600c:211:: with SMTP id 17mr2294170wmi.60.1579125756350;
        Wed, 15 Jan 2020 14:02:36 -0800 (PST)
Return-Path: <ilg@livius.net>
Received: from wks.local ([188.26.232.206])
        by smtp.gmail.com with ESMTPSA id z4sm1665107wma.2.2020.01.15.14.02.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jan 2020 14:02:35 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: Semihosting, arm, riscv, ppc and common code
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <81f25a9e-a52c-ca8d-4d4b-ca36fcee73ed@linaro.org>
Date: Thu, 16 Jan 2020 00:02:34 +0200
Cc: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 keithp@keithp.com,
 qemu-arm@nongnu.org,
 qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C4EE0480-C366-419B-84F1-3BEB794D1598@livius.net>
References: <11d88b2741eac3f634d5aed9e3355c974b533f7b.camel@kernel.crashing.org>
 <AE7841A1-B4D6-4D6D-9AFD-01C4604D7BC4@livius.net>
 <cd9a2de94700a2781f176247131dceba690d8f31.camel@kernel.crashing.org>
 <87sgkimkma.fsf@linaro.org>
 <1309ca0ab6405d88cfd949c73130ad0f2af944a6.camel@kernel.crashing.org>
 <87wo9tkjxz.fsf@linaro.org> <81f25a9e-a52c-ca8d-4d4b-ca36fcee73ed@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
X-TUID: mN5RwsP0fFR8



> On 15 Jan 2020, at 23:28, Richard Henderson =
<richard.henderson@linaro.org> wrote:
>=20
> For risc-v, the odd nop-full semi-hosting call sequence

That unfortunate call sequence was the least worst compromise that the =
RISC-V design team could agree on. :-(

The actual problem was that the RISC-V instruction set has a single =
BREAK op code, without any way to parametrise it, and they refused to =
spend another op code for an extra BREAK.

> was chosen to work with
> jtag debuggers on real silicon.

Yes, I know at least two, SEGGER J-Link of OpenOCD.=20

But again, there is nothing in the silicon related to the odd call =
sequence or the ABI, everything is implemented in the debuggers. The =
silicon has only to break to the debugger, then it's up to the debugger =
to decide if this is a semihosting call or a regular break.

> ... they did have the opportunity to do better, and did not.

I don't know why you present Arm semihosting as a disaster. It is not =
perfect, but it is functional, and common unit tests use only a small =
subset of the calls.

And there is no 'window of opportunity', if the RISC-V guys will ever =
want to reinvent the wheel and come with an official 'RISC-V =
semihosting' specs, they can do it at any time, and this will have no =
impact on existing devices, everything will continue to work as before, =
only the debuggers/emulators will need to be upgraded.

But the only immediate effect such a move will have is that software =
efforts in test frameworks will be increased, to support another =
protocol, while the advantages will be minimal.


Regards,

Liviu
