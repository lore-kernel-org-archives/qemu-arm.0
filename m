Received: by 10.28.71.27 with SMTP id u27csp1685578wma;
        Tue, 13 Feb 2018 11:13:22 -0800 (PST)
X-Google-Smtp-Source: AH8x226VFIQ65iwWv0cCyiCA2Ogqkg6mJcgp9/kZd1b8BqGS5cxOlXZV6r6IrJE26DElkw4xnh8M
X-Received: by 10.129.200.75 with SMTP id k11mr1508300ywl.162.1518549202515;
        Tue, 13 Feb 2018 11:13:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518549202; cv=none;
        d=google.com; s=arc-20160816;
        b=ELaH34iISnO5aozNua5F06lq3Fwbamu/f03KNI5OSOv912XRifJNzCGt7ZgHDtHqdJ
         u8R4pm9WMA5mvGh7h8dB+Yduxn8YNPbd3tpE/+FskSVRdCMWh8BNYHr3VxdMUEtK9ezF
         Gce/YoHN/xU5hILEdZDxF6HV2MWKQN1JlWrinpMy3XHyfa1b257XZJdidMtPPAoFmeae
         ojeSJCUWIElqaN4lv9HyPvbj7VHUlweTyiZM2s9DgHyAG3FkREntWMhTDDFKg0poNuTX
         BeJQgNxiwi4C+ogjs74NbfCf94146m7O/TmrHpvxnd2kqzXj5Pl79/kuXH1OGGPdBIQ6
         n6aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=AlCV+lrauQz1FeUWfQwnKfDKD4g5fvs/idx/DqxsdA4=;
        b=zOALa47pWzV8fo75knXpgUBusuU+/2PQLx7hA0shOfS27HJ0KHUXa2/nCC9VHt8GiE
         F7CeEWQLkzr0c8/KDTHL4IGoSJGGAXUd4skBqsQ4gdf9DWyAtkHnu0m1niFC0y7tr3fy
         3ZjAtyyB/E2nrvgKkTcPJhnJR6G66v2DSsY9PNc6u1gulAq08oL5zHqnFIbYYqAxybxY
         r+rmRshqpL93P0OzNuyGaG0nHFK7e8WYsG1iYOW4fav9IDeaPBhnRQGT6DVz4Tvxze3+
         d1GqhbYjJgZHYsBz/axOcE+nqbWL8AVFCw+Z3ITa+HyfqH+tBkS8lML/jDhK85tgGGCC
         wgCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ix6BtSk6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p190si1568443ywd.69.2018.02.13.11.13.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Feb 2018 11:13:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ix6BtSk6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40135 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elg13-0005Hy-RV
	for alex.bennee@linaro.org; Tue, 13 Feb 2018 14:13:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1elg0t-0005HU-IH
	for qemu-arm@nongnu.org; Tue, 13 Feb 2018 14:13:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1elg0s-0006Fr-Fk
	for qemu-arm@nongnu.org; Tue, 13 Feb 2018 14:13:11 -0500
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:36642)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1elg0s-0006FX-AE
	for qemu-arm@nongnu.org; Tue, 13 Feb 2018 14:13:10 -0500
Received: by mail-ot0-x241.google.com with SMTP id m20so18249154otf.3
	for <qemu-arm@nongnu.org>; Tue, 13 Feb 2018 11:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=AlCV+lrauQz1FeUWfQwnKfDKD4g5fvs/idx/DqxsdA4=;
	b=Ix6BtSk67lWLW48UpFZWFyPaJRSnqPkc53hPfpy6RliM2Vt4e2gVLgoqGzuZnJc9IC
	OR1LnwPXBWP608tB0c1EQftHE4nPZkOfExYuacBgK3LFQF32Y51a/XpAPKy8VIcP9UEl
	eyeJxasRRIYg8KzEThhXvPwBTYaeVPy/GkZ1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=AlCV+lrauQz1FeUWfQwnKfDKD4g5fvs/idx/DqxsdA4=;
	b=Gk/UDZiKIflcR+rT8Q3H6U4eRi+dilD0YZj/LcslcERrKpH7tOkgQlog8ITwTNvEr9
	BTkHNhPmiuMWZCAqOSPQRTuhFf/MuDFYdXT6JrclbPkw/DFj6QBtCzl5IaBsKzeS4a78
	CVgWcT8+veeXh+1Lx+LblzmbgVRsIGzdx2J+sETCJ2swaV5+7dw+g+vJAWPsEjNg4b+H
	CcF3K2Rrd62vkbTy1m1bK+M+orrVIk6F8tBKalObv0SNpAXAr66cr4JTEljhPX8hC766
	pLsYXKzim67Cx7n3a9EY3dHEOEtMAaseo5J/GcQQQhA7Cw8uPY2PvrVTkodloO4lNZAw
	rIDg==
X-Gm-Message-State: APf1xPBug7CTf3zurIdIAJOHjOMRQqyJFaOzeZbtiL0aZBQTeN8CeHhW
	QMZroS1P2cyK81D3yumfWD2nd5GMBPTsWw31pDtZ5n0z
X-Received: by 10.157.16.77 with SMTP id o13mr1664904oto.54.1518549189604;
	Tue, 13 Feb 2018 11:13:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.18.136 with HTTP; Tue, 13 Feb 2018 11:12:49 -0800 (PST)
In-Reply-To: <20180209085755.30414-1-f4bug@amsat.org>
References: <20180209085755.30414-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Feb 2018 19:12:49 +0000
Message-ID: <CAFEAcA-xztCCo3tPe8MtYhnC4r1ij1czUzvCyBAZwWHKnx1LNw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-arm] [PATCH v2 0/2] aspeed: simplify using the
 'unimplemented device'
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 729lIhAYzEoO

On 9 February 2018 at 08:57, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> Since v1:
> - corrected buggy UART base address (noticed by Peter)
> - tested using openbmc-build provided by Andrew
> - added C=C3=A9dric R-b
>
> tested with:
>
>   $ qemu-system-arm -M romulus-bmc -m 512 \
>     -drive file=3Dimage-bmc,if=3Dmtd,format=3Draw -nographic
>
> using this image:
>
>   https://openpower.xyz/job/openbmc-build/1240/distro=3Dubuntu,target=3Dr=
omulus/artifact/deploy/images/romulus/image-bmc
>
> (which is a good candidate for an Avocado / pyexpect test).
>
> Philippe Mathieu-Daud=C3=A9 (2):
>   hw/arm/aspeed: directly map the serial device to the system address
>     space
>   hw/arm/aspeed: simplify using the 'unimplemented device' for
>     aspeed_soc.io
>
>  include/hw/arm/aspeed_soc.h |  1 -
>  hw/arm/aspeed_soc.c         | 35 +++++------------------------------
>  2 files changed, 5 insertions(+), 31 deletions(-)

Applied, thanks.

-- PMM
