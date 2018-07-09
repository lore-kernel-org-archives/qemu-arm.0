Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp2419424wrq;
        Mon, 9 Jul 2018 06:08:26 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcDxsop4aVkXpbVaV5WRqH4fttzCk5NBVwps2cwWKaPtiiCkBfGL1xSbjhzY+wbFkrXOAtQ
X-Received: by 2002:ac8:855:: with SMTP id x21-v6mr18934231qth.42.1531141706233;
        Mon, 09 Jul 2018 06:08:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531141706; cv=none;
        d=google.com; s=arc-20160816;
        b=nDIr+jE7myuUXSc7eDBGe1KrAZZCfbse6uYQ3w6seQSbG29SYirXfID3SHHLcod7uH
         SbL3DjTs0QlR86K14NnG9S59OJY0ncALSAi4+o9p9YpiN7TWR1sRtD28lOKLyct3c7T7
         RGbvmYI/kNGNbhBaot8Ac3Y9PJTsKL7Z7RUKGVrH0HAFsurV7C8DqpZiFX7BbrbFkELV
         iqU+nlFgEZW9hrAfkv3zwBA0+eu6BmCDvfj/WLGiD07+86dG2uEZrFKnse4J7KjcZT04
         NquDfWlLyK9ioMMb08wFqWQgKfpFqHamwfdyR3vfnLvLzmoRQ/iFF/YusoRdOZvdjMdJ
         yojQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=mtmDtXYtIR5Jz16UYaloW9i64UL3Kw7XTZDXB5CMuow=;
        b=yd8eczb1la0c2q111b1TmvtqwoLpNTf1rm5/ZV+ayYH+yYCERzuY00mZY6Y3hOeLIk
         oqTe1e/bGZyG9G2JDS9+wL1GUU00nMVNyRdrQvmtmmkgJjiv60z0M4bIRnoBYHXcrwoN
         WSRAoiYK/mFPWMnmeytT7hP4tAENa/571iBB6MQqHxqCVFNbFGRRjyxdWzhR84vPct3G
         LA5vYNlUkNUg/GBvEatGTzuiCY08cdOR6AE5enwGEymMeVsoFUJRHSkzXNfZnIJKNJ7B
         qc6PYNKjR4YkOvYvHqbdYylmzrOkuWF7mmrYEAb8cjBwlv9zCG/AHn4DfmHp2Kc5EcG5
         vUpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OHMrC374;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f15-v6si4149491qve.92.2018.07.09.06.08.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Jul 2018 06:08:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OHMrC374;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41822 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcVtx-0006fQ-PI
	for alex.bennee@linaro.org; Mon, 09 Jul 2018 09:08:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35357)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fcVte-0006fA-KP
	for qemu-devel@nongnu.org; Mon, 09 Jul 2018 09:08:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fcVtd-0007iX-P5
	for qemu-devel@nongnu.org; Mon, 09 Jul 2018 09:08:06 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:32975)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fcVtd-0007iI-JB
	for qemu-devel@nongnu.org; Mon, 09 Jul 2018 09:08:05 -0400
Received: by mail-oi0-x241.google.com with SMTP id c6-v6so35767424oiy.0
	for <qemu-devel@nongnu.org>; Mon, 09 Jul 2018 06:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=mtmDtXYtIR5Jz16UYaloW9i64UL3Kw7XTZDXB5CMuow=;
	b=OHMrC374AGe76ZR5HFChLlDqFnKhhr973sxCwDEzXHgtq6tRRQZMQwkWw2UJEOjpG7
	F3wYlos/37FXyScBeMZsznO2LoCn9dVIRIyX3DDkRzW25WsznnzIVGtG+nNAUBq+yFc1
	q/dXdLn7nnoOptC2uDhejMOlMUD3CaYYf98Rs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=mtmDtXYtIR5Jz16UYaloW9i64UL3Kw7XTZDXB5CMuow=;
	b=Hk2qheEa7few7ld9tJejV8uU9yEVNNc2/EaYv3d3hZ7Wo5ow4bUDlQXDULQ6V/ivmR
	JdXzVD/vRtenv9kid9DT/SDTTku9dRScEr2nWT2r2eqS2yNmRgrr3GI3AbYdb/9vEnCk
	B7VZ3wPlM6CJgQxllnVt7NmRCDPwImPsSZPx763J+2FDLMqNxDO9QxPVpJ7DAzf+8WmV
	LXO3UxZXeUDYKJr4IYJvhnf/kvvT/DXwFsUp4BljqNuR679jvj+gcIWz3XZHnFElCA1t
	OKHk6Nnuvn6sT1xtyONmRYB7bS+iMLUpvhp9yEQEonNrjCfWJMFd8kI/i3iKUOa3xMJR
	W1Ug==
X-Gm-Message-State: APt69E3JcJICU9zp1ubMNFZr3iDwsKFXCZ2PYply/H6cHcpKbWB4W9si
	dqz82dDTi4r+tOSWaff6RXkbpzZCnlSAOw1aLUmBWA==
X-Received: by 2002:aca:f409:: with SMTP id
	s9-v6mr24326078oih.102.1531141685036; 
	Mon, 09 Jul 2018 06:08:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP;
	Mon, 9 Jul 2018 06:07:44 -0700 (PDT)
In-Reply-To: <20180706162155.8432-2-f4bug@amsat.org>
References: <20180706162155.8432-1-f4bug@amsat.org>
	<20180706162155.8432-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Jul 2018 14:07:44 +0100
Message-ID: <CAFEAcA8zeJYCD_1fee==nCYo8tWk61wzQoiR_KEA8CZ_GzyBaw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-devel] [PATCH for-3.0 1/1] hw/sd/omap_mmc: Split
 'pseudo-reset' from 'power-on-reset'
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Fm/9FpayPazl

On 6 July 2018 at 17:21, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrot=
e:
> DeviceClass::reset models a "cold power-on" reset which can
> also be use to powercycle a device; but there is no "hot reset"
> (a.k.a. soft-reset) method available.
>
> The OMAP MMC Power-Up Control bit is not designed to powercycle
> a card, but to disable it without powering it off (pseudo-reset):
>
>   Multimedia Card (MMC/SD/SDIO) Interface [SPRU765A]
>
>   MMC_CON[11] Power-Up Control (POW)
>   This bit must be set to 1 before any valid transaction to either
>   MMC/SD or SPI memory cards.
>   When 1, the card is considered powered-up and the controller core
>   is enabled.
>   When 0, the card is considered powered-down (system dependent),
>   and the controller core logic is in pseudo-reset state. This is,
>   the MMC_STAT flags and the FIFO pointers are reset, any access to
>   MMC_DATA[DATA] has no effect, a write into the MMC.CMD register
>   is ignored, and a setting of MMC_SPI[STR] to 1 is ignored.

This text says that the card "is considered powered-down (system
dependent)", so it's not entirely invalid to reset the card here.
Still, if the guests get confused by it I guess that the n8x0
systems didn't do that, and certainly resetting the other parts
of the controller state is wrong.

Strictly I guess we should also check the enable flag for the other
things this text calls out:
 * accesses to MMC_DATA[DATA]
 * writes to MMC.CMD (we already do this)
 * setting MMC_SPI[STR] to 1 (we don't emulate MMC_SPI)

but we should probably consider that a separate bug. (And the
n8x0 boards are pretty much unmaintained currently, so I don't
care very much whether we fix it or not. I don't have any working
test images -- I have one of uncertain vintage which seems to
be flaky when it gets to the mmc card init, but I think it
makes a bit more progress with this patch now.)

Applied to target-arm.next, thanks.

thanks
-- PMM
