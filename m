Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp8039136lff;
        Wed, 15 Jan 2020 23:57:02 -0800 (PST)
X-Received: by 2002:a1c:28d4:: with SMTP id o203mr4634482wmo.123.1579161422853;
        Wed, 15 Jan 2020 23:57:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579161422; cv=none;
        d=google.com; s=arc-20160816;
        b=vYrG4InTINAvBlz2FaZdzu495Govl2Dy7eBl930+G+1264SakAvtrgkGHh1nSjaImc
         MJoChIqs6kX2tbeUbvKw8PaurlHE1VehK1FyblKJAnFAHRcUY8H5S40Wmt9TdX/qIz3b
         1OCXBwprBCZArzsW0vFxIw+wCyHJufUdqKrYCp2gwLZtgP6ivjinxunTDxdnjkrnqEPb
         pzQv07zKbFYK9F2tC1PXNP8WOwrZ0vffZgGi+k094uIfLJoJL6XEygzzzlK7C1C9ZY5p
         5bBFQ/NpwZlYEQSVq1rWzgnPN/frnBo5+X9JlOvVgbfO1/sJ4fF5IXL+TbuOJZVE8ytJ
         K42w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=f4mxqX9LLsSLzuRn9mQiTps97UO/GJpJd6GT88WP5as=;
        b=tRtCwZZZJLBoZhppSs7wU/SpIKwOcNMkYcMCodl7DAHe/yeUG1AGjz3vgtulmFDM/u
         4+M3hugkVH+UaI8eUIJU0np/r0s9WhD0Q7biiGa6kepC+UbmxwBDszhjTDjIkM4q+bcW
         K4dgwSsl6u9+iC1J/yFQ9UBVXU3VM+Uk0q+kqf6XbfDK5o04QvvFPxUmKLbS2jAnUM1r
         RKtQG3MOcmCWoyijDKxjLokCI1qCT2G1YZS6pychRhmA6o384Z0q5tWWP21q6mTYspDH
         yHEbFjHDvHa8DL9hOpN+yrjA4oRAN5ppYNheZayBhUCAuGZdmxQx52+Rm61kCRjh3Ob7
         L6LQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@livius-net.20150623.gappssmtp.com header.s=20150623 header.b=eWx8eefF;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of ilg@livius.net) smtp.mailfrom=ilg@livius.net
Return-Path: <ilg@livius.net>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h192sor1476314wme.7.2020.01.15.23.57.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 Jan 2020 23:57:02 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of ilg@livius.net) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@livius-net.20150623.gappssmtp.com header.s=20150623 header.b=eWx8eefF;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of ilg@livius.net) smtp.mailfrom=ilg@livius.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=livius-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=f4mxqX9LLsSLzuRn9mQiTps97UO/GJpJd6GT88WP5as=;
        b=eWx8eefF7kMfRVqF5A5gY4hrH54bhDEPrVaCZkRBvACD9GXrTqyWzy8r8mfV4nbOK2
         ACjSv1HZcLtPNvPC1F3Qoq92VO6vvxZqURPO0OXPiOj0icCjvA9kVNXcuNAVC78t/d4H
         9Cvfbv0JaH52ZES0mymQZG7hyWC+bNx04bxQW78G5sBsV8KFGLLYfXdmJEzqCJ/6Yno2
         gu/0NFNn0kebgi4CxaC5p45NjF1bV44cpkCA8JK/IU+7yMi7QmcGnDJYeShNNqV1gqlR
         5BuuPzRlLfLhmYsv6DCLE8HNG4VLDKWzXX2zuKESzZICBANb0/OtV3iPxFgkYAEpxelk
         30vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=f4mxqX9LLsSLzuRn9mQiTps97UO/GJpJd6GT88WP5as=;
        b=HB+od0GY1fLLhfHV394MYfcVZxj+iLue4xHxLQYDtIiCgGvTGGJk5H/B5vBKco9mTt
         w4W0IBaTG355YKjbR6gOeVGcGjUTMdfWpN7VKLYyxdaU8JaJgd2jwI0ZtPsav9d16dn3
         xywJ8AoCKdzpgz/+39rICARfuaZWBJsw+oF+r8jV8EbT0gNglO0AxdDfB+DYSmXQavbr
         Qdy4nAA59ZhWxUWBiPXaAW1WxbYNGC3rt3n+WunUFzgDzo/3cnMSR+CsGYE6n9LVXEyw
         okIaXBzUmJGD1v4h5b1pKnZakpbXASK7c0oYmU/6ErUioVUz6TsJVwrwnt3H3Y/ytJg7
         t34Q==
X-Gm-Message-State: APjAAAX1WpL3BcHBf3StUl2LnO8GZfGK1D2LrsmFPfldMRAlB5DpSw8W
	vRdYXmhoRj8AieQAV4NLvc5gbg==
X-Google-Smtp-Source: APXvYqzZTNDvCFYCKFTGI8zeYUUtaiIHKereRkn7eyDQgAbvzQqZJLLhI3qnE1HRpAMmNxKW9qvZ+w==
X-Received: by 2002:a1c:4008:: with SMTP id n8mr4388826wma.121.1579161422474;
        Wed, 15 Jan 2020 23:57:02 -0800 (PST)
Return-Path: <ilg@livius.net>
Received: from wks.local ([188.26.232.206])
        by smtp.gmail.com with ESMTPSA id o15sm28550179wra.83.2020.01.15.23.57.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jan 2020 23:57:01 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: Semihosting, arm, riscv, ppc and common code
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <1a1cecb5128134e681b9145b9c6bc10a8db00ea9.camel@kernel.crashing.org>
Date: Thu, 16 Jan 2020 09:57:00 +0200
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 keithp@keithp.com,
 qemu-arm@nongnu.org,
 QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3724D35F-AC4B-44A9-9537-FCCA930D463E@livius.net>
References: <11d88b2741eac3f634d5aed9e3355c974b533f7b.camel@kernel.crashing.org>
 <AE7841A1-B4D6-4D6D-9AFD-01C4604D7BC4@livius.net>
 <cd9a2de94700a2781f176247131dceba690d8f31.camel@kernel.crashing.org>
 <87sgkimkma.fsf@linaro.org>
 <1309ca0ab6405d88cfd949c73130ad0f2af944a6.camel@kernel.crashing.org>
 <87wo9tkjxz.fsf@linaro.org> <81f25a9e-a52c-ca8d-4d4b-ca36fcee73ed@linaro.org>
 <C4EE0480-C366-419B-84F1-3BEB794D1598@livius.net>
 <1a1cecb5128134e681b9145b9c6bc10a8db00ea9.camel@kernel.crashing.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
X-TUID: 7ePpw05Lt36S



> On 16 Jan 2020, at 04:04, Benjamin Herrenschmidt =
<benh@kernel.crashing.org> wrote:
>=20
> ... I agree, which is also why I want to use the same interface for
> powerpc, it will simply make life easier for everybody.


I don't know the current implementation in QEMU, but I suggest you also =
take a look at the current Arm specs:

	https://static.docs.arm.com/100863/0200/semihosting.pdf

The implementation in OpenOCD is:

	=
https://github.com/xpack-dev-tools/openocd/blob/xpack/src/target/semihosti=
ng_common.c

> The calls
> aren't perfect but they do work sufficiently well to be useful and I
> haven't yet been convinced that it can't be extended if necessary.

In theory it can, in practice it'll not be easy.

Imagine that you decide to use Arm semihosting for your architecture, =
and implement it in QEMU.

Then you try to convince other tool developers to do the same. If you =
ask them nicely, they might copy/paste the Arm code, and you're done, =
major commercial tools will have Arm semihosting support for your =
architecture and it becomes a de facto standard.

If at a later time you decide to extend the protocol, you have to go =
again to all commercial tool vendors and ask them to implement the =
extension. You'll need good reasons to convince them.

In my case it was easier to convince SEGGER to add Arm semihosting =
support to their RISC-V JTAG, because we had a long relationship, but =
even so I doubt they'll be happy to implement extensions.

---

Anyway, from my experience, for practical cases the Arm semihosting is =
more than enough, once you have a functional implementation for the =
client side you simply forget about it, and you can use it for any =
architecture.

My implementation is the following:

	=
https://github.com/micro-os-plus/semihosting-xpack/blob/xpack/src/syscalls=
-semihosting.cpp


Regards,

Liviu

