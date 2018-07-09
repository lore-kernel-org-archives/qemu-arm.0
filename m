Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp2426930wrq;
        Mon, 9 Jul 2018 06:15:28 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcI/s0bywIPuLP+tmg+xzVDKpHX6oYaXB+bBaLerqeQOoeSvxiUou3Ax1A2C4x9PMdSd5AX
X-Received: by 2002:ac8:317b:: with SMTP id h56-v6mr19477494qtb.191.1531142128773;
        Mon, 09 Jul 2018 06:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531142128; cv=none;
        d=google.com; s=arc-20160816;
        b=itIofCiDQzVyGvCqwyZRnthjwQhFysvedf6Rz1dF/N6SgCr60a+/KLtZbhyjjEcrQc
         ecMc9onqPV6pE3ya5pTxm2tTZo4dsYt9vcVCbs++MjgMk2+uZSYEe4+9UVFAehpxzxXX
         lSS6F5nHRmuHQzPHtKP7E3qX1vPyRImNPi3+FEAzzWnbvyTrVZaLciAlIkujOjfzAX+3
         rUdHPq1Uzu2IcXdqe2q6lA9zVy5vkITbUXU0OIc2ty6PfUZ2Yqp2peF5Am+xkW8sNL3i
         Su9SRh95AEb+QgzNDy1/+2OOd+7yKCzY5mA8TdOygZWjyGiXvqIHP3uDQhoRMyC7wH/l
         JWIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=ivc5Sg4+H7RzMkgjsmd4KWPshpbKGTG3ukJ5srGXJUA=;
        b=ua77n0jV0rE4OKSBAA9UXmtXmEIh7f5bVPNPcPamRoNxsKxWbWc3g1PYxdZim/LM3k
         oQlkqIUwHWWbCHlph+1CQD7C63jNbPg16Sv5Pqo/O5XI6oOoRjYTCXMexqN2V4nk1fFi
         o997mikwzUKziq0K6Cvum5jaT7Bwn+6+/RzrRZsEs+KERt79HT/9jwLy0jJFekvH0uaY
         2wc0njnvrixpBWHnMQvD7iGS3feVZ9JNiWEEhEKEM7/Y/rXI8KK61DipcxDpvNWDKGPJ
         qqx4ATDTYWoz7hL84a3EzG+GXb26sUyMMYc23be6CP7tsqwAsnK5VqWTNrJUc98eAgJk
         9BAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eOlWQOIi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q15-v6si8416001qke.4.2018.07.09.06.15.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Jul 2018 06:15:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eOlWQOIi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41871 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcW0m-0000dq-8d
	for alex.bennee@linaro.org; Mon, 09 Jul 2018 09:15:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fcVzY-0008UA-VD
	for qemu-devel@nongnu.org; Mon, 09 Jul 2018 09:14:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fcVzY-0001Z2-2C
	for qemu-devel@nongnu.org; Mon, 09 Jul 2018 09:14:12 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:34945)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fcVzX-0001Yr-RK
	for qemu-devel@nongnu.org; Mon, 09 Jul 2018 09:14:11 -0400
Received: by mail-oi0-x243.google.com with SMTP id i12-v6so35770775oik.2
	for <qemu-devel@nongnu.org>; Mon, 09 Jul 2018 06:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ivc5Sg4+H7RzMkgjsmd4KWPshpbKGTG3ukJ5srGXJUA=;
	b=eOlWQOIirWLB7IEGNFX9RR54vT8mtUs4ovjHwI2U6Jcax9+8a+AtASLnwW+N4GszWB
	jdAcLxT7jc+f9vLhpMSL0h3JaXgTHMf6gpskInV77b/0g44dxCkrco/GASPcK3nky1gm
	E/ZiksLwm7be1mUbD4fAEYf47M1kQgroN2dyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ivc5Sg4+H7RzMkgjsmd4KWPshpbKGTG3ukJ5srGXJUA=;
	b=ZVr8fVwbBwOjKgF6jqk/IvUD7Xx10ONC4XdmcPOOvLRK1yifOvRQ9JuG0bX72FRQXC
	0AVSn0/sKKHYXYBSv1Vr2tk6bMJ1aURNUEsarcXoWsEFTEJ4jECCstcR+lQOuMDnIMBI
	pAD8YgEEMzQ1ibBoM8UHwu26Kh2zSKMTepU6/XqFywVfdQHDdt0pdMJSGiB+smGnGtZT
	NoY8wGhfmjxjPnKcWifQU4HM3YEGpH5vs9SOaX/oiPt+upn97jG81RhBdMgMagA0ylrN
	DJvFdn3eHLEZX3ttYC/qYODFY45mBJTS+KHvE705HJVNJXRuCQ8QuRuKIE3TtloMx/H4
	xVRw==
X-Gm-Message-State: APt69E1YgezcRCdtixl0KQgHDhffgjjmh6COuoumE908I1MtWaIYkfrc
	K1dX6aAXgRKoajbfSZM83F7wsWMzjZoBPimdJJ0eQw==
X-Received: by 2002:aca:a982:: with SMTP id
	s124-v6mr23041511oie.80.1531142051170; 
	Mon, 09 Jul 2018 06:14:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP;
	Mon, 9 Jul 2018 06:13:50 -0700 (PDT)
In-Reply-To: <20180706162155.8432-1-f4bug@amsat.org>
References: <20180706162155.8432-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Jul 2018 14:13:50 +0100
Message-ID: <CAFEAcA_ZyBRy9S2zg+P5VbYR5NDYacX5NCGO26MkdFfTeS4SZA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-devel] [PATCH for-3.0 0/1] Fix the Nokia N810 tablet MMC
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
X-TUID: 6wChEd220qp2

On 6 July 2018 at 17:21, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrot=
e:
> Hi Peter,
>
> This bug was previously reported here:
> http://lists.nongnu.org/archive/html/qemu-devel/2018-06/msg01824.html
>
> Diff before/after ecd219f7abb using -append "console=3DttyS1 printk.time=
=3D0"
> option to boot http://people.linaro.org/~peter.maydell/n8x0-images.tgz
>
>  mmci-omap mmci-omap.0: command timeout (CMD5)
>  mmc0: host does not support reading read-only switch. assuming
> write-enable.
>  mmc0: new SDHC card at address 4567
> -Waiting for root device /dev/mmcblk0p1...
>  mmcblk0: mmc0:4567 QEMU! 1.81 GiB
>   mmcblk0: p1 p2
> -EXT3-fs: barriers not enabled
> -EXT3-fs (mmcblk0p1): mounted filesystem with writeback data mode
> -VFS: Mounted root (ext3 filesystem) readonly on device 179:1.
> -kjournald starting.  Commit interval 5 seconds
> -devtmpfs: mounted
> -Freeing init memory: 132K
> -mmci-omap mmci-omap.0: command timeout (CMD52)
> -mmci-omap mmci-omap.0: command timeout (CMD52)
> -mmci-omap mmci-omap.0: command timeout (CMD8)
> -mmci-omap mmci-omap.0: command timeout (CMD5)
> -mmci-omap mmci-omap.0: command timeout (CMD5)
> -mmci-omap mmci-omap.0: command timeout (CMD5)
> -mmci-omap mmci-omap.0: command timeout (CMD5)
> -mmci-omap mmci-omap.0: command timeout (CMD55)
> -mmci-omap mmci-omap.0: command timeout (CMD55)
> -mmci-omap mmci-omap.0: command timeout (CMD55)
> -mmci-omap mmci-omap.0: command timeout (CMD55)
> -mmci-omap mmci-omap.0: command timeout (CMD1)

FWIW my n8x0 image still produces these command timeout complaints
even with your patch (and it doesn't oops either way). Probably
just a different kernel version.

thanks
-- PMM
