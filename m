Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp475780njc;
        Thu, 8 Aug 2024 04:59:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxPh2v17yz6W4JI404DboR/F82umk2sivDmj3YFUgOC75nV5B8jhdt/9uDx72xQkG9bJJzdME+s9A61+89HckJJdkvRF24
X-Google-Smtp-Source: AGHT+IFyd5e6ln/7WRW9eJDckibWiaYPnOEHGp9Od4mAh5MF+QNp0s4XO7xjaI3XND2l4imEUGwJ
X-Received: by 2002:a0c:f40e:0:b0:6b0:613a:984a with SMTP id 6a1803df08f44-6bd6bd7d49cmr16190806d6.44.1723118374692;
        Thu, 08 Aug 2024 04:59:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723118374; cv=none;
        d=google.com; s=arc-20160816;
        b=EGHFGu9CbSU4Y/MnkVa6jJfPt5QY6/1pRBDvGvCp5y/KSCRCnmn+BwX/P+saha5cWW
         OIx0hTBPZcfQTrhjrp8Dq/3LwUp+n8cTFPMRoGk9iMh4X3pwFZEcXGtbnCzG/vaDEFiL
         xE7JTUSnRB1yXBdIgQ0sKo4ULC2aDA5AiHAxJTxFaahqWlJoLGXE+DeybN/T0GVVib5I
         LJd0JdaifvBwAoQ2AJTGDEHUBE87hKpgJy0uvaLWR2j4ICCNhi5CGbAUYGFJKSXssyDg
         B/gpdYG39bp8dwGgZeTJ0pk7Qq0GhyQhJWIO+oywfuif3bZ26H/OPGQjHYDH53/iyQXD
         Yzaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=p2kHhxkm4v+vOLndDzJt4d+R3ZTo3VK4AICux0NZ0co=;
        fh=LK3MbWQgNNbNf3+o20VXtXLsiX3ccTjhFh5irX8Z2rs=;
        b=xhMmFeDP8PJrJDyRTEg6KNGm/M9PAR5tEaEnbXdTSfIzSxYFLIPq+hVOy0Fyx1PH2b
         CMJfAXb7mH8nYyGmV1vzYkFKf6CTG4jXYWRWackNL/K1GnWuoIoMEJ4Q8cFoTT/lXUPY
         khPAOxBIDVJH3FqKGROUHOenLeE4TdVwx5a6bMIFwjIAwP3lhBezuFnJYAkLsBBmhAhj
         VYmVPjwVpOWD29mmGCO5ryTcPlPHXORXUOhCHKPNmpurfrwSIjewZyREmduOAr9NAx3L
         +MUvJj2ORVBcm+bf5md0KKUM8tls/yQSmq1LWv+GOwGgQ1P6smhPby2unOImSzs0C6Gy
         ergQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W5ULSrwF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bbbb8ecb59si42901336d6.316.2024.08.08.04.59.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2024 04:59:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W5ULSrwF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sc1na-0001kG-Kc; Thu, 08 Aug 2024 07:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sc1nY-0001ji-Mr
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 07:59:17 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sc1nW-0000sh-Ht
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 07:59:16 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5b8c2a61386so1080567a12.2
 for <qemu-arm@nongnu.org>; Thu, 08 Aug 2024 04:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723118352; x=1723723152; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=p2kHhxkm4v+vOLndDzJt4d+R3ZTo3VK4AICux0NZ0co=;
 b=W5ULSrwFTzOF8sgISc3srVhhQS/99sPdm//q1jtBZ7Ob8BCIGOM/QSo/N2YjERqQT0
 Nx1ByGCO0ez3MiOsUOphDFT+0uV14b4EV6Cu/EafIqDI1nPN302hGEgk5yFJ+I3/cQ2s
 OMbVz5jJIxMIxZ70gfAuyfTD/oe3NhDU1ZY+H+Y7WcZslqtIcd3S35LP4ySxwHBu5Gc0
 9REAalf+jWWe5jP7PNku6tFbnqpj3Lr5G57GGw2hD00sED+vOEP0K+YnKbLXNX3c+Bpf
 nOpUZt2KEZFWdrvouYNG4qnP5Irj3djBPYjy4a1wLk9iThPjaMdE3OR0wXyZVyLeZaBS
 YzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723118352; x=1723723152;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p2kHhxkm4v+vOLndDzJt4d+R3ZTo3VK4AICux0NZ0co=;
 b=RCXzn6h4I+UqxbGP3RqeS6yLmY8YQUINvG8QiMn5Wt7hIrviTQAzempof2MWRgYZWY
 8nF46478mZ3/+kU6fzKLU0AbqBEBHZyLeVBs0d7q/C3PRUEnPxhurT0lEOS6KxmX0OIp
 xjY2lavVtZi1AeCrFP3L2o9oZc0RjtMrKUzcxB5b3JIiI6bhynkH1X806U/uU8knqhZi
 Xhf0s/Or8t5lzuw1tHfMb9/jDz9CqiRtzKBPM7h21MEVMFHuGnsSPEhOI4MB/b3cWGdA
 6XL67H0InT5MTHxCO59mWxmFhDkHucm8uWXWrjnwxQt/KZyGmWQzScmfACZ5OULWzBDL
 0JlA==
X-Gm-Message-State: AOJu0Yynh2jl786YqOT7tZd19jNWwrcrIuNxlq0CVKb0iLLd/sovH/mF
 M2r6OHpIi71s9ummJLln7o50JpJouUPQvmjwXQ7D40PYmdC57AlXRvmA0ifYVZyB0LevoHM3eWN
 5Rb4Yc2G3bAE166HPpKcpaEE6Av6Z5EkwzmMnMGZXPm19rncn
X-Received: by 2002:a05:6402:4407:b0:5a2:5bd2:ca50 with SMTP id
 4fb4d7f45d1cf-5bbb23dedd8mr1410624a12.25.1723118352182; Thu, 08 Aug 2024
 04:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <7ef15cde-1d49-4f7f-81fd-5c81b6f564a9@free.fr>
In-Reply-To: <7ef15cde-1d49-4f7f-81fd-5c81b6f564a9@free.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Aug 2024 12:59:00 +0100
Message-ID: <CAFEAcA_rzS_WH92evZFfPJ-NGSkBpmaHWMRPX9yxkmrSUptKnQ@mail.gmail.com>
Subject: Re: Question about Raspberry Pi A+ entry point
To: Ludovic Delabre <ludovic.delabre@free.fr>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: oJ7Gs9YAFDfP

On Thu, 1 Aug 2024 at 13:05, Ludovic Delabre <ludovic.delabre@free.fr> wrote:
> I'm working as an a hobbyist OS developer on a multi-architecture targets which includes a Raspberry Pi A+.
>
> Every examples of bare bones I could find out there, sets their kernel's start address at 0x8000.
>
> But when I invoke QEMU using a flatten kernel image:
> qemu-system-arm -s -S -m 512 -M raspi1ap -kernel kernel.img

> My problem is that the entry point address (FIXUP_ENTRYPOINT_LO) is 0x10000 instead of the expected 0x8000.

If you pass a non-ELF file to the -kernel option you are saying
"I want to be booted using the Linux kernel booting ABI", which
for 32-bit is documented here:

https://docs.kernel.org/arch/arm/booting.html

That says:
# The kernel should be placed in the first 128MiB of RAM. It is
# recommended that it is loaded above 32MiB in order to avoid the
# need to relocate prior to decompression, which will make the
# boot process slightly faster.
#
# When booting a raw (non-zImage) kernel the constraints are
# tighter. In this case the kernel must be loaded at an offset
# into system equal to TEXT_OFFSET - PAGE_OFFSET.

Strictly speaking QEMU probably ought to load at 0x8000[*], but
in practice the expectation is that guest code loaded with
-kernel should, like a zImage kernel, be able to handle being
loaded anywhere in the first 128MB of RAM, and either be
position-independent or else relocate itself to the address it
needs to run from.

If you don't like the built-in loader's behaviour you can use
the "generic loader" (-device loader) instead -- you can
either pass an ELF file to be loaded wherever the ELF file
specifies, or else specify a load address for a raw binary.
(NB that unlike the -kernel option you will get all CPUs executing
at once so it's then up to your boot code to sort them out and
put the secondaries into a pen.)

[*] The QEMU bootloader has loaded code to 0x10000 ever since it
was first added in 2006, so I am very reluctant to change it now:
there's almost certainly code out there that assumes the current
behaviour.

thanks
-- PMM
