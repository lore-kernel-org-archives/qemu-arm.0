Received: by 10.25.21.156 with SMTP id 28csp55145lfv;
        Thu, 11 Aug 2016 03:40:30 -0700 (PDT)
X-Received: by 10.237.40.132 with SMTP id b4mr9814502qtd.109.1470912030595;
        Thu, 11 Aug 2016 03:40:30 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i35si1177079qtb.125.2016.08.11.03.40.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Aug 2016 03:40:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47463 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bXnPZ-0008VW-Te
	for alex.bennee@linaro.org; Thu, 11 Aug 2016 06:40:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40121)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXnKi-0003Qy-ML
	for qemu-devel@nongnu.org; Thu, 11 Aug 2016 06:35:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXnKg-0002Ja-SC
	for qemu-devel@nongnu.org; Thu, 11 Aug 2016 06:35:27 -0400
Received: from mail-ua0-x22d.google.com ([2607:f8b0:400c:c08::22d]:36021)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bXnKg-0002JL-Om
	for qemu-devel@nongnu.org; Thu, 11 Aug 2016 06:35:26 -0400
Received: by mail-ua0-x22d.google.com with SMTP id 97so113023237uav.3
	for <qemu-devel@nongnu.org>; Thu, 11 Aug 2016 03:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=PQ84OgD/p/49y4aa/BP2DL7bvz0aQmRCjBQXlfUG9v0=;
	b=h2PSgNtUqIhuW/qvuj0kRvUqtluDyErrIvdZ+XdCpmuAnYPJHm6PKMtDgFAE85IGRq
	C1V3+Mvqs/cvRerQJ45FkOu8nMz1727jIyfHgQBmq7UrE7zQ2WrONWVA4Dr2RoVLGKrL
	R+ANc+F0boylYSRG6O//W4o1ZoqEgwCbmXd+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=PQ84OgD/p/49y4aa/BP2DL7bvz0aQmRCjBQXlfUG9v0=;
	b=e/9s27EbLqEaB4cAD1kKpVpvoqvFeHuHjynzc8o3rPczLRiYHFTRIYIT2znKRsfNQ4
	/5FPvwzeXUZqPXimiMuQjTSdD+Nfh0iuzP3o7AVlhnH6QNfmVBNRfqxTbfDyWvZBMho5
	MFYiKqud/2cwUqKOJz3+q5vNUfxel9h6Ku7YliYEN4/gF5To4wi9wr3+izbxTdERcwcV
	mO731cRiju0rFjUn2YkSDNreSJwaOZiH0tpWyo7yCQLCU/mlqORdr/Wje5ech6Zkj1xk
	tT3t7b2y5K4PEXvo4mXnckzC+glghIwVEHQ1sCohH3Ge/+18pHNFPnWha6cl3XcH5bW3
	R9rg==
X-Gm-Message-State: AEkoouu0g02aGNwYnd9tBBptd9hkrAzhNRj/LU8s4S8b9L7XbyC6pEmbcS3XwJhBk1rA90uWUB4dSqRTAM5vE+IJ
X-Received: by 10.31.21.201 with SMTP id 192mr464083vkv.6.1470911726355; Thu,
	11 Aug 2016 03:35:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.150.17 with HTTP; Thu, 11 Aug 2016 03:35:05 -0700 (PDT)
In-Reply-To: <1470158147-16378-11-git-send-email-clg@kaod.org>
References: <1470158147-16378-1-git-send-email-clg@kaod.org>
	<1470158147-16378-11-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Aug 2016 11:35:05 +0100
Message-ID: <CAFEAcA9OOW5JOoU1MinoQFYFYUUgyTRKvDoD8_XgHdqU49yn8Q@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22d
Subject: Re: [Qemu-devel] [PATCH v3 10/10] palmetto-bmc: remove extra
 no_sdcard assignement
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
X-TUID: gm84ZJdUJY2u

On 2 August 2016 at 18:15, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/arm/aspeed.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index e71500c64bd3..6d7b70df70da 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -145,7 +145,6 @@ static void palmetto_bmc_class_init(ObjectClass *oc, =
void *data)
>      mc->no_sdcard =3D 1;
>      mc->no_floppy =3D 1;
>      mc->no_cdrom =3D 1;
> -    mc->no_sdcard =3D 1;
>      mc->no_parallel =3D 1;
>  }
>
> --
> 2.7.4
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
