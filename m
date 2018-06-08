Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp781881wrq;
        Fri, 8 Jun 2018 04:55:12 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJPrSnk1MD4s3Rwa6mD/PTpAutgTeXZLihVbTi7bDmFGvsHBVf0JlC3NE7BJs1LRMCHG/wm
X-Received: by 2002:aed:2798:: with SMTP id a24-v6mr5722683qtd.40.1528458912679;
        Fri, 08 Jun 2018 04:55:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528458912; cv=none;
        d=google.com; s=arc-20160816;
        b=rmOyjADxHFW8uVTuQb6uiehntRFb0YI0cJQvV6/xBFnfpL8tp2UgvW803TIINxB67A
         R4fkhQZhWMZ3QYGveODqg22bfFzhEemH+goeZX3Dkn9WybRC2HVos8E/STBt4uVjdxBe
         n9t+eEWsAdxzvxo5NTJ5PyyKNlDN2hrysAFdzhVDTOFLztVTTN33ptpr9dRnCNbwcuoF
         ZlAEqvfxe+q7V1tuPF9oDGVUdxDVOf6eFPqQQAUWq4o8hKUQ+vNA27rc4RpUzxI03CLv
         XQU5udgtLxxr3Emcmx8W0MuFAqQ/XBRm3ABbgcI/qOxnIGt6u2KlHy0xSp73W93tJxye
         bmow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=Ea37MvRMnCX2d1wyfLFa19vFsRxnAI/3DzNID2gq3vM=;
        b=xtJscfKDtPMLZM/V6Pu1yn9w6XHLucV+QLCQzn5wgz5cwJCgaPZ2aL9nxv1EYRaDLD
         BWQZ2UHIJqSwsZX1dUjSez4RkrNObiS5gHAjF00+71cdqbHQAdWw4mVoeNKcn1KYGXQe
         lZfQlrnbbzsOMuB+NVjcvouSo30I05S2v4dnfOH4lk1oRlarS05cM37A7I8uoH003j6/
         /qmpYmCVNh0eGRVuICq0LUgUn42wpVorB8JRLvn/jFPdhc+97n8mnbtb9ydkvz5sNyKL
         Sq5/warsRCKTIxqHkcwlCvAs0bldLGC4AOze5DW39ggXEHO2ISSrq019z745WAOJS96w
         8TWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iuN00Iqo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a19-v6si7237633qvm.282.2018.06.08.04.55.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Jun 2018 04:55:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iuN00Iqo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34858 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fRFz6-0004mG-3b
	for alex.bennee@linaro.org; Fri, 08 Jun 2018 07:55:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36390)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fRFyu-0004lJ-1S
	for qemu-arm@nongnu.org; Fri, 08 Jun 2018 07:55:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fRFyt-0000AT-4E
	for qemu-arm@nongnu.org; Fri, 08 Jun 2018 07:55:00 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:35886)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fRFys-00009Y-Mx
	for qemu-arm@nongnu.org; Fri, 08 Jun 2018 07:54:59 -0400
Received: by mail-ot0-x244.google.com with SMTP id c15-v6so5505263otl.3
	for <qemu-arm@nongnu.org>; Fri, 08 Jun 2018 04:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Ea37MvRMnCX2d1wyfLFa19vFsRxnAI/3DzNID2gq3vM=;
	b=iuN00IqoBZeFoWLRPtsEXJ/OFlMLqgwuDGP8u2CjL6tQ9A9uCBBvh3iHrwFCMf8tBu
	QXb+1RCX2ocYs5LadZJFXIHlxIm+kmmdCEBGav7Tkdeb/fh4SRvUkoVHh6f/i1w2yUWh
	rw/bTVh+CMzHH842CTj/W/yn0WAv36Iryfs78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Ea37MvRMnCX2d1wyfLFa19vFsRxnAI/3DzNID2gq3vM=;
	b=RBRIg1NU+m3+9bPvlXQTTzbbATpShvGQe/qr0YWZ+/QTV4DNpBF5yYTbf0H93JBREk
	LAawUvIAY3eHJdDv2w7FPAcCA7k2c7EjbEDeplUCBJFSR3QJoyOaPVYmonmIkJ1yK7ND
	e1qbDmQVZ21cz4L29NDsxzeHlvT/ZXrHv+5xGHt6hwPNIVsrjMUqpdKwH9jXLYegCXOE
	HbYIWdIc+pS56hO2y5T4N5xfIAiAey1NSjblUCxWWA+4vom3y3sb/5e5luPKPRI/LjYG
	FeMRlHoaMFkcsMMbY6cwjzIBc8ypp8raalxuuLvPXzKaV9a51qRZ9wYHr1JtJUq9q814
	XbNQ==
X-Gm-Message-State: APt69E2HE0wdyxqmxTkYP5O2diuVVumLbtkG0h+RS9Yc7Ub7GXfpn+RR
	o2CaMjW07bqbrS/JPb7R+ighR6lvFojB1e6sw7yAaQ==
X-Received: by 2002:a9d:34db:: with SMTP id
	t27-v6mr3693438otd.316.1528458897880; 
	Fri, 08 Jun 2018 04:54:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Fri, 8 Jun 2018 04:54:37 -0700 (PDT)
In-Reply-To: <20180606152128.449-1-f4bug@amsat.org>
References: <20180606152128.449-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jun 2018 12:54:37 +0100
Message-ID: <CAFEAcA-9=j8_VmMmAuUbk37uvWKkFEs77NFT3jv4TbWDk4=ZYg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH 00/11] misc: Add trailing '\n' to qemu_log()
 calls
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>, Laurent Vivier <laurent@vivier.eu>,
	QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Walle <michael@walle.cc>, Michael Clark <mjc@sifive.com>,
	qemu-ppc <qemu-ppc@nongnu.org>, Paul Burton <paul.burton@mips.com>,
	qemu-arm <qemu-arm@nongnu.org>, Yongbok Kim <yongbok.kim@mips.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3u/88M+rZN6x

On 6 June 2018 at 16:21, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrot=
e:
> Nothing very exciting here.
> I sometimes miss to notice some trace events, running with -d unimp,trace=
...
> then using 'grep ^...'. This is only due to a missing '\n' :)
>
> Philippe Mathieu-Daud=C3=A9 (11):
>   hw/sd/milkymist-memcard: Add trailing '\n' to qemu_log() call
>   hw/digic: Add trailing '\n' to qemu_log() calls
>   xilinx-dp: Add trailing '\n' to qemu_log() call
>   ppc/pnv: Add trailing '\n' to qemu_log() calls
>   hw/core/register: Add trailing '\n' to qemu_log() call
>   hw/mips/boston: Add trailing '\n' to qemu_log() calls
>   stellaris: Add trailing '\n' to qemu_log() calls
>   target/arm: Add trailing '\n' to qemu_log() calls
>   target/m68k: Add trailing '\n' to qemu_log() call
>   RISC-V: Add trailing '\n' to qemu_log() calls
>   RFC target/xtensa: Add trailing '\n' to qemu_log() calls
>
>  hw/arm/stellaris.c        | 11 ++++++-----
>  hw/char/digic-uart.c      |  4 ++--
>  hw/core/register.c        |  2 +-
>  hw/display/xlnx_dp.c      |  4 +++-
>  hw/mips/boston.c          |  8 ++++----
>  hw/ppc/pnv_core.c         |  4 ++--
>  hw/sd/milkymist-memcard.c |  2 +-
>  hw/timer/digic-timer.c    |  4 ++--
>  target/arm/helper.c       |  4 ++--
>  target/m68k/translate.c   |  2 +-
>  target/riscv/op_helper.c  |  6 ++++--
>  target/xtensa/translate.c |  6 +++---
>  12 files changed, 31 insertions(+), 26 deletions(-)


Applied to target-arm.next, since about half of these are arm
and the rest are trivial and have got ack/review by the relevant
maintainers.

thanks
-- PMM
