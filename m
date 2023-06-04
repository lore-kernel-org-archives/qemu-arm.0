Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2194425ejb;
        Sun, 4 Jun 2023 03:48:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5jUGknRUNvrdpWa3J/SRABsuqWbzQFk8Xph2GQwgot+zhT2svobxKybAlLhm03n11ay6Nh
X-Received: by 2002:ad4:5c82:0:b0:625:87e4:1689 with SMTP id o2-20020ad45c82000000b0062587e41689mr5699617qvh.20.1685875725622;
        Sun, 04 Jun 2023 03:48:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685875725; cv=none;
        d=google.com; s=arc-20160816;
        b=E++YHyhzptO8PrzEAULMiIghNqOOHSz7YisXEXelQx6YE58THAsKZg5TJTZ6kOnInV
         r+tsLGa9GikjfJDsSXMIwV9n3QsUQk5gQBXIJ412ZxiD1rhG24AHWr/gnDGZEdUAVpfD
         rpG4MSkoKTJHM444Azz+VT+u/byUIS7NKMpP5mu6+rBx9/dJpXmnfuWkSgoqDuMEiFCp
         5eCS+BCoZZ47m+JbpiUMwIE/fvBZwiJa89N/HLUYKz8kvsuCrB0WRJWZFVmnGcpLlQxR
         xXmgjVQ8GwZHe35csoxxmNBQP+C7sTLayTPOB3t85Q0VmPxJBbl5t/KMfz6NTYz0ahMO
         49FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=QF9ALbL85YEZKM9prANZA7wyWclxiwfrpiuXG4JSc9w=;
        b=eS4RnyOQgIhh/uC5bg092BSlMRBFEfxwG/6MutZgRJCJJVvvM/WFHNDv+693hgzLAu
         b1JFRZMp1S3Vjf9NYEuZNQTuu3FcAHE1brIAY3zG9z+H/p+A++Hws35SMrAU2XDR9ifu
         La1RYlaAlaVYgP44YBsldKgVjjoiQY/wmKhAvNlNW5VWqRmcKic5EvnRb7+jhp8MKsTD
         q6QukWRUmi6qZ9Y+rE/nTznh/Qv19l/yUh5lbTGZqUNdxBkfi4y9qKTGAaEd6EbYjuOl
         IkZ/ADtSXGnhtp6LAa+nXrCJIYzT1Gpznatv1R9vTGe36kQ2/+fpyl7RsBDwOO1qtQxV
         D1rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="BX/2+5Jm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jv14-20020a05621429ee00b005eda1d1d9aasi3318403qvb.598.2023.06.04.03.48.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 04 Jun 2023 03:48:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="BX/2+5Jm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5lHo-00073U-Qs; Sun, 04 Jun 2023 06:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1q5lHn-000738-Ff; Sun, 04 Jun 2023 06:48:35 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1q5lHk-0001AF-7A; Sun, 04 Jun 2023 06:48:35 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3C05360FE7;
 Sun,  4 Jun 2023 10:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FB0DC433EF;
 Sun,  4 Jun 2023 10:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685875701;
 bh=a1e6BEUxyE1uoEC9a5NX1ZcyZMNXNjVMojKljRrdW6o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BX/2+5JmUycGVLsyJEf4SFILNMwrZqP2vqlayyf4byPj8wUU9/DlTyJz9BX4OU/0E
 zLUrkJ8lxWqh+/ThK22HVepJN/mlsFQj7YRhNLzTdqZkSERdR12JrhdNW1IZQBgsHb
 XSh0dlvmoMS0kLt7OnTOMfMy/HxOuzLxg8ZcJOSeVhOApiCiARaD3WRNMG2w8Tz+Si
 OPYRus4q1hIc+f00ZodqjPIaUk3nyzbOI4YNez0/nT1dHVdH1KbOupV3WFNeuuzDar
 NZzkB9zKen8j6+MKeWeijo0X3RjF/IeLyu1V2I/GeNoIZh38LtZVs0KYXS5LMLlYHr
 SMazVMFEdklEQ==
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so4706971e87.2; 
 Sun, 04 Jun 2023 03:48:21 -0700 (PDT)
X-Gm-Message-State: AC+VfDyKcWvAl8nBFI6ASdoDnxuIINxsaUb3NcD1YOXVBpYXZPpvu5rO
 RvdW6q/EMOF5FNAIPGjmZ/VthM0GIvLgQAvDxnE=
X-Received: by 2002:a2e:9b0a:0:b0:2af:160d:888a with SMTP id
 u10-20020a2e9b0a000000b002af160d888amr2893423lji.1.1685875699639; Sun, 04 Jun
 2023 03:48:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
 <CAMj1kXHp7QHftNw6t3ww8wgL9rAUHEauS0S04d=Rfey7EO3bcg@mail.gmail.com>
In-Reply-To: <CAMj1kXHp7QHftNw6t3ww8wgL9rAUHEauS0S04d=Rfey7EO3bcg@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 4 Jun 2023 12:47:26 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEP97e57XBEuLZFQ4Ra31AQYcKWU+cfve0FeVPPX+zg=Q@mail.gmail.com>
Message-ID: <CAMj1kXEP97e57XBEuLZFQ4Ra31AQYcKWU+cfve0FeVPPX+zg=Q@mail.gmail.com>
Subject: Re: [PATCH 00/35] crypto: Provide aes-round.h and host accel
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=ardb@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: U5DtJbuy7Ups

On Sat, 3 Jun 2023 at 15:23, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Sat, 3 Jun 2023 at 04:34, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > Inspired by Ard Biesheuvel's RFC patches for accelerating AES
> > under emulation, provide a set of primitives that maps between
> > the guest and host fragments.
> >
> > There is a small guest correctness test case.
> >
> > I think the end result is quite a bit cleaner, since the logic
> > is now centralized, rather than spread across 4 different guests.
> >
> > Further work could clean up crypto/aes.c itself to use these
> > instead of the tables directly.  I'm sure that's just an ultimate
> > fallback when an appropriate system library is not available, and
> > so not terribly important, but it could still significantly reduce
> > the amount of code we carry.
> >
> > I would imagine structuring a polynomial multiplication header
> > in a similar way.  There are 4 or 5 versions of those spread across
> > the different guests.
> >
> > Anyway, please review.
> >
> >
> > r~
> >
> >
> > Richard Henderson (35):
> >   tests/multiarch: Add test-aes
> >   target/arm: Move aesmc and aesimc tables to crypto/aes.c
> >   crypto/aes: Add constants for ShiftRows, InvShiftRows
> >   crypto: Add aesenc_SB_SR
> >   target/i386: Use aesenc_SB_SR
> >   target/arm: Demultiplex AESE and AESMC
> >   target/arm: Use aesenc_SB_SR
> >   target/ppc: Use aesenc_SB_SR
> >   target/riscv: Use aesenc_SB_SR
> >   crypto: Add aesdec_ISB_ISR
> >   target/i386: Use aesdec_ISB_ISR
> >   target/arm: Use aesdec_ISB_ISR
> >   target/ppc: Use aesdec_ISB_ISR
> >   target/riscv: Use aesdec_ISB_ISR
> >   crypto: Add aesenc_MC
> >   target/arm: Use aesenc_MC
> >   crypto: Add aesdec_IMC
> >   target/i386: Use aesdec_IMC
> >   target/arm: Use aesdec_IMC
> >   target/riscv: Use aesdec_IMC
> >   crypto: Add aesenc_SB_SR_MC_AK
> >   target/i386: Use aesenc_SB_SR_MC_AK
> >   target/ppc: Use aesenc_SB_SR_MC_AK
> >   target/riscv: Use aesenc_SB_SR_MC_AK
> >   crypto: Add aesdec_ISB_ISR_IMC_AK
> >   target/i386: Use aesdec_ISB_ISR_IMC_AK
> >   target/riscv: Use aesdec_ISB_ISR_IMC_AK
> >   crypto: Add aesdec_ISB_ISR_AK_IMC
> >   target/ppc: Use aesdec_ISB_ISR_AK_IMC
> >   host/include/i386: Implement aes-round.h
> >   host/include/aarch64: Implement aes-round.h
> >   crypto: Remove AES_shifts, AES_ishifts
> >   crypto: Implement aesdec_IMC with AES_imc_rot
> >   crypto: Remove AES_imc
> >   crypto: Unexport AES_*_rot, AES_TeN, AES_TdN
> >
>
> This is looking very good - it is clearly a much better abstraction
> than what I proposed, and I'd expect the performance boost to be the
> same.

Benchmark results for OpenSSL running in emulation on TX2:

Without acceleration:

$ ../qemu/build/qemu-x86_64 apps/openssl speed -evp aes-128-ctr
version: 3.2.0-dev
built on: Thu Jun  1 17:06:09 2023 UTC
options: bn(64,64)
compiler: x86_64-linux-gnu-gcc -pthread -m64 -Wa,--noexecstack -Wall
-O3 -DOPENSSL_USE_NODELETE -DL_ENDIAN -DOPENSSL_BUILDING_OPENSSL
-DNDEBUG
CPUINFO: OPENSSL_ia32cap=0xfed8320b0fcbfffd:0x8001020c01d843a9
The 'numbers' are in 1000s of bytes per second processed.
type             16 bytes     64 bytes    256 bytes   1024 bytes
8192 bytes  16384 bytes
AES-128-CTR      25146.07k    50482.19k    69373.44k    76236.80k
78391.98k    78381.06k


With acceleration:

$ ../qemu/build/qemu-x86_64 apps/openssl speed -evp aes-128-ctr
version: 3.2.0-dev
built on: Thu Jun  1 17:06:09 2023 UTC
options: bn(64,64)
compiler: x86_64-linux-gnu-gcc -pthread -m64 -Wa,--noexecstack -Wall
-O3 -DOPENSSL_USE_NODELETE -DL_ENDIAN -DOPENSSL_BUILDING_OPENSSL
-DNDEBUG
CPUINFO: OPENSSL_ia32cap=0xfed8320b0fcbfffd:0x8001020c01d843a9
The 'numbers' are in 1000s of bytes per second processed.
type             16 bytes     64 bytes    256 bytes   1024 bytes
8192 bytes  16384 bytes
AES-128-CTR      28774.46k    81173.59k   162346.24k   206301.53k
224214.22k   225600.56k
