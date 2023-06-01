Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp600969ejb;
        Thu, 1 Jun 2023 10:13:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5P2kCJM4j1U/+zr3dbq0b+T97Cm2lhYHyv/jL8lhXvzJ1MGnoKB5PBucpFFTGupiVehpss
X-Received: by 2002:aca:1b0f:0:b0:398:51fc:8a4a with SMTP id b15-20020aca1b0f000000b0039851fc8a4amr4801657oib.16.1685639605305;
        Thu, 01 Jun 2023 10:13:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685639605; cv=none;
        d=google.com; s=arc-20160816;
        b=RRvARCLsvHfCytPUtka9XaNywhGkp1qip+RORLBUUigoxQZil5R5vii1FDIIvswb+3
         +U2WBQtSef+UnZXnRyC78kftRrPK7U57FPdemsMF91mZYMkYBeHfPdHdRnViW0jXwV32
         r2pnc1rX49v1PeUSL7dVDfw2ZCQ1tt+oZLJt68erMOB/3q/2PiBykW7LIg00ernXWA0p
         cODEVHpHyW2MzXwgyOfP5dRyZ3g+u8fgzxPkTUNwsngzKh0pHxoJwPjMwFwcwCQu2/Uq
         Jyg5WiJtCSgI7F5pq8/LkT8ItxzjZ/DmWTOi7iyFWbC4iEEluH2V6gevRh4gKkjhXcnH
         b1SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ivMHhB7iOV6+PmdYQPkSePUraaS2ym/i690T5eSkWCo=;
        b=N9JPae7EHtfJfR5xk4oApNSZfoba1oLINCTf8JFi3dCn3Er8gFH/iOibP+Y08ySY48
         0c8pbTMy0/7y2S808iFxgx9f/p8n/mIMCTJr7HSmuHRO37qGOxQUjCJpxKXmomWBh3gG
         anzndCwkpw9Q0NR8NDp6nM5/5z5IKI9Gx+SzqlGTWWj0vZW0Lcf2fL+tEFacsBJNBfBD
         hUmZU30b+U1jsOYU5DU6iFeqwrrIUrUjj1uOIdr7gTSkWKK+0bvkxzbaQtyJvtMpFw/5
         nbS/SxU8UI5TJ5KnzuIxY0rrA1D9MuWeHPaoK8SYRzR3hfoxrD22NtQBs/F+39YpRGf7
         MDjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=QNi7MEY7;
       spf=pass (google.com: domain of ardb@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <ardb@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [2604:1380:4641:c500::1])
        by mx.google.com with ESMTPS id s7-20020a05680810c700b003924bf9c833si638627ois.315.2023.06.01.10.13.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Jun 2023 10:13:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of ardb@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) client-ip=2604:1380:4641:c500::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=QNi7MEY7;
       spf=pass (google.com: domain of ardb@kernel.org designates 2604:1380:4641:c500::1 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F3C8C6481A;
	Thu,  1 Jun 2023 17:13:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66FCDC4339C;
	Thu,  1 Jun 2023 17:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685639604;
	bh=JvQL6Ij4GYJBpmlRzXvWsOCbEAPXdtU4JKFO6R7yHx0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QNi7MEY7W/x/w1Nq9pJvdzPqfAM9QU+cDG/A9rzCswhZWHSigQrukR34u5mDERXBL
	 lY8lsMu68LlXU4oRUzxbJ1NIzu7sqD5GyYoAujS75dtAUCjEIvxbOJtVESnbSR8N8l
	 Ax5o78Hl2tGKZpt5BHXMBavsySJQNfm4wgB0fvMH6/neljE035P/jSbq0VDKr5S7zi
	 8L7AO/TeZ+r6YBUT5UWqKpMeJvKy/iuYUu7JEwSlDtLVNj1rXVahM1Qagv4oO7iTjw
	 LIoG9cvdd5/0z0PTy3LlW/+iyeBxYJ+QoKWrJhAiXy/YgO2LtWSjl+L12dgRXCWBMV
	 TWB7/kVC5dwZA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4eed764a10cso1436341e87.0;
        Thu, 01 Jun 2023 10:13:24 -0700 (PDT)
X-Gm-Message-State: AC+VfDzSpkeyMMIdoBbbXfv4UtATjLb3u+RrJdNiS+ec8jBKL0WTu25c
	cGO+u2sn/kB6Xl4FOMRMj7MoSntCLEOZSVbpZ2I=
X-Received: by 2002:ac2:5a06:0:b0:4f4:b28f:6b9c with SMTP id
 q6-20020ac25a06000000b004f4b28f6b9cmr376808lfn.29.1685639602381; Thu, 01 Jun
 2023 10:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230601123332.3297404-1-ardb@kernel.org> <20230601123332.3297404-3-ardb@kernel.org>
In-Reply-To: <20230601123332.3297404-3-ardb@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 1 Jun 2023 19:13:10 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHmiqA-3hi2KLpSDZzaWFwSmz-x61sRgJqawt7TNPZqnA@mail.gmail.com>
Message-ID: <CAMj1kXHmiqA-3hi2KLpSDZzaWFwSmz-x61sRgJqawt7TNPZqnA@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/i386: Implement PCLMULQDQ using AArch64 PMULL instructions
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: J3Uw1KaeEM66

On Thu, 1 Jun 2023 at 14:33, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> Use the AArch64 PMULL{2}.P64 instructions to implement PCLMULQDQ instead
> of emulating them in C code if the host supports this. This is used in
> the implementation of GCM, which is widely used in IPsec VPN and HTTPS.
>
> Somewhat surprising results: on my ThunderX2, enabling this on top of
> the AES acceleration I sent out earlier, the speedup is substantial.
>
> (1420 is a typical IPsec block size - in HTTPS, GCM operates on much
> larger block sizes but the kernel mode benchmarks are not the best place
> to measure its performance in this mode)
>
> tcrypt: testing speed of rfc4106(gcm(aes)) (rfc4106-gcm-aesni) encryption
>
> No acceleration
> tcrypt: test 5 (160 bit key, 1420 byte blocks): 10046 operations in 1 seconds (14265320 bytes)
>
> AES acceleration
> tcrypt: test 5 (160 bit key, 1420 byte blocks): 13970 operations in 1 seconds (19837400 bytes)
>
> AES + PMULL acceleration
> tcrypt: test 5 (160 bit key, 1420 byte blocks): 24372 operations in 1 seconds (34608240 bytes)
>

User space benchmark (using OS's qemu-x86_64 vs one built with these
changes applied)

Speedup is about 5x


ard@gambale:~/build/openssl$ apps/openssl speed -evp aes-128-gcm
Doing AES-128-GCM for 3s on 16 size blocks: 1692138 AES-128-GCM's in 2.98s
Doing AES-128-GCM for 3s on 64 size blocks: 665012 AES-128-GCM's in 3.00s
Doing AES-128-GCM for 3s on 256 size blocks: 203784 AES-128-GCM's in 3.00s
Doing AES-128-GCM for 3s on 1024 size blocks: 49397 AES-128-GCM's in 3.00s
Doing AES-128-GCM for 3s on 8192 size blocks: 6447 AES-128-GCM's in 3.00s
Doing AES-128-GCM for 3s on 16384 size blocks: 3058 AES-128-GCM's in 3.00s
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
AES-128-GCM       9085.30k    14186.92k    17389.57k    16860.84k
17604.61k    16700.76k



ard@gambale:~/build/openssl$ ../qemu/build/qemu-x86_64 apps/openssl
speed -evp aes-128-gcm
Doing AES-128-GCM for 3s on 16 size blocks: 2703271 AES-128-GCM's in 2.99s
Doing AES-128-GCM for 3s on 64 size blocks: 1537884 AES-128-GCM's in 3.00s
Doing AES-128-GCM for 3s on 256 size blocks: 653008 AES-128-GCM's in 3.00s
Doing AES-128-GCM for 3s on 1024 size blocks: 203579 AES-128-GCM's in 3.00s
Doing AES-128-GCM for 3s on 8192 size blocks: 29020 AES-128-GCM's in 3.00s
Doing AES-128-GCM for 3s on 16384 size blocks: 14716 AES-128-GCM's in 2.99s
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
AES-128-GCM      14465.66k    32808.19k    55723.35k    69488.30k
79243.95k    80637.77k
