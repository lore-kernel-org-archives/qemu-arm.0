Received: by 10.28.173.206 with SMTP id w197csp3870097wme;
        Tue, 9 Jan 2018 08:17:09 -0800 (PST)
X-Google-Smtp-Source: ACJfBotqmvAaBuvdi9TkDQWeRZaEai0T27+cXjuvgEVY159Yp9jF2mME6KbMRkVG741YmeSP0NDu
X-Received: by 10.37.216.144 with SMTP id p138mr14364596ybg.61.1515514629271;
        Tue, 09 Jan 2018 08:17:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515514629; cv=none;
        d=google.com; s=arc-20160816;
        b=IWKNzz1cV+B2nr+oAQ9Aq80hLvp5XWzobPh+uN87mItyDikUGbnbN04ExRrxGqPhxP
         HEuMxF8b9aXXQO18u+Gj20lVpbqajwhj5zq9KofYCHpXzw9oy9sJe3Vu1NS/vIPawefk
         d5R8xBkiEAAJEWQeeibTrzxFXqob5UD5pNqaPIUF5yteXXanjZa5N2kDwV9tNJ04yozT
         FvcG7JNDy0A4Y4jLx4ChRIC9Krs6n2IOKp37AnTDDYdvEVHw+u/HQm7p9timu0yEBhVZ
         YGaq3rTH3AJiV2s9BDY6hMbUWP2T+f7nihGSKf+vohZy2ZPIWZ9fj41D1qMZniha9ZwE
         mPpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=riONP+hYfj+bRcH7uf4jEu/rlB6vRsEP4Emo8kPNtgk=;
        b=SG9Nz5JWR7MIAVkY005UZvTr6zvfWE/s/PWZg/AOutio1RtcjnOqbA4Bd0rMGWWD6/
         +56X8HHPspTqxKiE2c7U1n5YO3J3b53NYLv+HHogH/E9t6AhU1cQBYcrl5d7v6tFu/Fo
         fDY9cRawdxTVlLAOgjj8Vxg0LeXjxg8uKN+51yciWBtML0XbGgQU7pDG7w5AdPUMoQa8
         Pr1qKUPXVYwUXW3wcK70yM1kgCgZ2H1cZW5HuP7IOd2SmMG24IrLyuMXOT7m0tqQLx9W
         FJmpPuugIIjCAzKWj4tauAKF5CiATJeplHg/DL1cUxFdTSSExeBJyKzFsQSZ8/i1IeoN
         48HA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FE+qZ48x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y197si1243841ywd.601.2018.01.09.08.17.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 08:17:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FE+qZ48x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60499 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYwaK-000246-Mm
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 11:17:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYwa8-00023k-Dw
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 11:17:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYwa7-0000Tk-OB
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 11:16:56 -0500
Received: from mail-oi0-x231.google.com ([2607:f8b0:4003:c06::231]:32809)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eYwa7-0000TA-Jl
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 11:16:55 -0500
Received: by mail-oi0-x231.google.com with SMTP id y141so4474725oia.0
	for <qemu-arm@nongnu.org>; Tue, 09 Jan 2018 08:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=riONP+hYfj+bRcH7uf4jEu/rlB6vRsEP4Emo8kPNtgk=;
	b=FE+qZ48xpWbC8Vt31Wq4dUCO0nrJS5S80GkvvZVwCJeWdVy3PFJBSz1W/SdGTROnu1
	IVy79ZjjPrhoFxyVBVDUvojyzCGClwxVDrAJiDiMk5ELhvEG2n30Rex5FxU4EfbryNaZ
	tSzlCj5qDTb+OFey/3eUdvtg9Zjh7ukNLS4Z0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=riONP+hYfj+bRcH7uf4jEu/rlB6vRsEP4Emo8kPNtgk=;
	b=M2pK5be5A6KsnwWJ3jxfVHgNRn9cYRmX0gCe0T3pzPVOiluqePxxYqO/MMzUn1oOv+
	tEQCPXcqxpAJUmSFaR/JZoMZvUutSyzPNCk4fW4NJzVvxj/XCCprB4kw3D5l1iKmpbt2
	YMXLicY9Ntp27sFtKNYpwU8v125Z07vgZJNZedpZiiDiKuJtuzKA7MA6Iv9wVKOV7mSe
	sh+oF8l4OHLrwwyIze0actBJIpiAq9UNch2sUWUNToSCvowZFxzvXYjSJ5oI9TOD/MRZ
	peKvSDrYSrwLX61ZOa+JSJxsluan5b59T97CHPmv/p3tYwmX94C9nNppQw3U5NVxqmqU
	orNA==
X-Gm-Message-State: AKwxytePY//0IRciPzgift/0FNTjDQbZ7Wlu/JYgBWrisYMrFDsFBtu3
	IpYpJxOyuiTqMvnzmMwqjHKf8Wyg5FW2v8MaKXOlBA==
X-Received: by 10.202.173.84 with SMTP id w81mr1090691oie.299.1515514614943;
	Tue, 09 Jan 2018 08:16:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Tue, 9 Jan 2018 08:16:34 -0800 (PST)
In-Reply-To: <d7f23db3-6669-76fe-661e-a5b506cfbeaf@amsat.org>
References: <1515506513-31961-1-git-send-email-peter.maydell@linaro.org>
	<d7f23db3-6669-76fe-661e-a5b506cfbeaf@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jan 2018 16:16:34 +0000
Message-ID: <CAFEAcA9ME7MpBySJ1XFZ+fSb9JrT1mKL9Ns3uVviuOpbteHA6g@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::231
Subject: Re: [Qemu-arm] [PATCH 0/4] Reset SD cards attached to legacy-API
 controllers
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>,
	qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T23nLwuYdwsu

On 9 January 2018 at 16:13, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> w=
rote:
> I didn't test migrating a card (but have a "sdcard migration qtest"
> entry in my TODO).

I usually test not by actually migrating but using 'savevm foo' in
the monitor to save a snapshot and then -loadvm foo on the command
line to resume it.

thanks
-- PMM
