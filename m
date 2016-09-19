Received: by 10.80.163.71 with SMTP id 65csp660469edn;
        Mon, 19 Sep 2016 06:18:55 -0700 (PDT)
X-Received: by 10.237.41.129 with SMTP id o1mr23516567qtd.134.1474291135532;
        Mon, 19 Sep 2016 06:18:55 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m9si17131137qtb.117.2016.09.19.06.18.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Sep 2016 06:18:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55349 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1blyTG-0007Q2-Up
	for alex.bennee@linaro.org; Mon, 19 Sep 2016 09:18:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1blyEn-000468-D3
	for qemu-devel@nongnu.org; Mon, 19 Sep 2016 09:03:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1blyEl-0005lf-8Q
	for qemu-devel@nongnu.org; Mon, 19 Sep 2016 09:03:56 -0400
Received: from mail-yw0-x233.google.com ([2607:f8b0:4002:c05::233]:33862)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1blyEl-0005lT-4W
	for qemu-devel@nongnu.org; Mon, 19 Sep 2016 09:03:55 -0400
Received: by mail-yw0-x233.google.com with SMTP id g192so146547056ywh.1
	for <qemu-devel@nongnu.org>; Mon, 19 Sep 2016 06:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=/K4R1gU3PPV1m8tX98AcJnwl+3YdilsRCpuhkfX8C9U=;
	b=fhcni/qjJRfcJAzSSt5HmlS5X583pYMV2hHbqfgpQ+LDoOwFXvfCSNH5QMn5TV4A7E
	tlQzqI0JeXxFR7DDbAHcvP+F+Rt4had8tKGMxkeulchlcFS7qdr6ldQ3HUYKwkghYlm6
	NA1CNioJkOv1wPYQb4650VBk7ZS0155NAnark=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=/K4R1gU3PPV1m8tX98AcJnwl+3YdilsRCpuhkfX8C9U=;
	b=VanCUFaRLu/tGBuG30Dj3KV1fH182RXS3RA0/ChXUAaLsxtsE210uEi2alNIZzelei
	wpS2pPkyKKUWkNXB5B7iF+sR+/jXRszKLh2zYtwCZkc7aMRNkTmzR/Ij6sn4OUaj3I7w
	pz7rVnk+xAh5g7neE1sJQNrpuL6afwgG92r4gIQZEV3JYwuYn6QxkxJZrjqAp6/3KRij
	A53AgdIAFM6oZ+n2G7A2mJ2lsd6OZnHN7eey9CNnh34Yeza7bSMZ0vlcJhNo9jH4GBjg
	4AimspCu8IPkuMIr3LKQ5+t9V23wrakUlnQFrwgm28jbgc7MYWQWeGKuUjZh7LPVTyLi
	O6Qg==
X-Gm-Message-State: AE9vXwMU/UBALYWWp36id1en6q+bx9qWUJlseWb193Vznby3/rN4Ak7zEAKHJntIo6a8DxWGEzy0M2YHtAgLDqrH
X-Received: by 10.129.55.208 with SMTP id e199mr24196515ywa.256.1474290234702; 
	Mon, 19 Sep 2016 06:03:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Mon, 19 Sep 2016 06:03:34 -0700 (PDT)
In-Reply-To: <1473438177-26079-1-git-send-email-clg@kaod.org>
References: <1473438177-26079-1-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Sep 2016 14:03:34 +0100
Message-ID: <CAFEAcA-eLD3K0PHHvaqsheR65fwwCDZpmuXAYfWX+b+_EPD2ow@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::233
Subject: Re: [Qemu-devel] [PATCH v5 00/14] arm: add ast2500 support
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HBCQQvSd4Ltv

On 9 September 2016 at 17:22, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> The AST2500 SoC being very close to the AST2400 SoC, the goal of the
> changes below is to modify the existing platform palmetto-bmc and the
> AST2400 SoC to take into account the small differences and avoid code
> duplication. This is mostly inspired by the realview and the rpi2
> platforms.
>
> First patches rework the 'palmetto-bmc' platform and the 'ast2400' SoC
> models to provide room to other platforms and SoCs which have a common
> design.
>
> The last patches add support for the new AST2500 SoC in the required
> controller (SDMC and SCU) and define a new platform for an Aspeed
> evaluation board.
>
>
> In v5, I have included a couple of improvements, suggested by Peter,
> which let the Memory Controller decide if the setting of RAM size is
> correct. The value is propagated to the controller through a property.
>
> Thanks,
>
> C.



Applied to target-arm.next, thanks.

-- PMM
