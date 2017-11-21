Received: by 10.223.159.82 with SMTP id f18csp987180wrg;
        Tue, 21 Nov 2017 10:05:18 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZ9C6kLcmbUY9JTL9RGzvBgENgIdQ62aw8CG+yYI6DEN0liUy0CFb1s0Du/Ru0Wb5vf61nA
X-Received: by 10.129.121.150 with SMTP id u144mr11204247ywc.467.1511287518581;
        Tue, 21 Nov 2017 10:05:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511287518; cv=none;
        d=google.com; s=arc-20160816;
        b=KVslA8qKPGqGDToRN+HuLjnqSX/KxH0p1Rv6mfmkqgFC291Y0XeK8W3zimgl91zLFU
         aIv3cg0cQii/SG8d5P2AB48yRha/9J2hSSdcC/3krPowujI+sjjGYQPKRIop+1eHNa+x
         0ty10uCf8O3mtztCzzXuy47vjanwrsGu01brfmIoyS063jRo/LX7s5xebXq41FvI9/CF
         Wkmoxt1+HcGv+RVtDKx5t/IEFwAMEmVgWVftROn3IJjsXmwGvWYabHeIoiuvAF1ZplZ8
         nmAThpHAfIg8fS30DE5zkBSLlPf5GV9crEkcv1Kft57AbfaeJ3nHMaIMBCY8WtE8qqRR
         rU/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=IVx1sMLQZ1wkH/AbyTbX7V31YVMnTIaTuowVO41rJ/M=;
        b=XnOPHgbb0wZp98i9SFej/+nYbudF4knwF0Cj1rov07N3Wr7odOpd+xusSBsBpc4OKe
         YQtdaeytTJAybGnRFITs/8IJd1mTxwZY7jwM5P3AfzAWvmGguOok/GkfH45N7AOwd8m9
         kUV8wa1JfffxZzeyMZGj5a/pPlo0B6KyAg14iJg6oKeXNFpRIUpYcNXhRU93a2Aqai0O
         6U4YTJCkwTElmNrge66W6klDJG/dU4h77Wmp0rkHOcpNtF3tLXcKDO+GkTY0n7cGcnRH
         +LTU0ZrMgH/fF9oL8jTIX5Ora6pb27GWW0aPLXII9ZO2Gi/on9YEeyDz1wKqVyA7Fxpu
         9Cqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gvVMtTNk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c17si3059770ywk.477.2017.11.21.10.05.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Nov 2017 10:05:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gvVMtTNk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35866 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHCv8-0007Ou-2p
	for alex.bennee@linaro.org; Tue, 21 Nov 2017 13:05:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHCuy-0007Ne-2X
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 13:05:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHCux-0006dC-7G
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 13:05:08 -0500
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:45110)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eHCux-0006cy-2Y
	for qemu-arm@nongnu.org; Tue, 21 Nov 2017 13:05:07 -0500
Received: by mail-ot0-x243.google.com with SMTP id u10so11284901otc.12
	for <qemu-arm@nongnu.org>; Tue, 21 Nov 2017 10:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=IVx1sMLQZ1wkH/AbyTbX7V31YVMnTIaTuowVO41rJ/M=;
	b=gvVMtTNkyPPGBABKcV+dJRegmCtLSbQkpaQLGv+bXloeYezJlC+zkSAKrhQDqjHulI
	3euEMXQMDhk6mQLA7gVgUYucPCDuefIjmrjrh9ukEDOUt90G4FvoM5qLMhZ+xr3ZWVD0
	DESk65Z4bvJmBKej2Wfg8vPstDDP+ATa8n3EY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=IVx1sMLQZ1wkH/AbyTbX7V31YVMnTIaTuowVO41rJ/M=;
	b=Zo0juy0BU692dSFDgJQU7n8+IkcnFZFLwUeQgt9eyXf7nfQ6ImOe/mH7SJNCKwY4H4
	CpR/NmGeMfk/GrDdnHKJ7m+pzwbCPS/hq4h0jo0r9vYs/fUp2bn2o+ULpjCSNbUVU+B9
	J+SfyMw070DcfWlV2QqVaVDAWD6SwY7xvYPZNGdRpqXBw72XDurI+CLEe9PYLAoLnTe/
	oM3ZTuU4PiPTFl5v60aKdybh9gOrliprAH6/YEapVEiwiLEU3ufSCQ13V4DY2ssw0BIi
	3lVCxWMMCgH39+Wio9CE3nYaCdIQfWbT9+C3S2mkWmL5H4pM00UO21R7EFN7GdfmoI0/
	hfBQ==
X-Gm-Message-State: AJaThX7Zqn1QFto5Xm9eQVR7fs3M4uacBbkyFKisnd7WgjBwYw01/q9/
	+8uRftU9t50qNjcN3zKnUGYwsRj4RytLnFlJ/uSsTQ==
X-Received: by 10.157.37.61 with SMTP id k58mr11562170otb.110.1511287506333;
	Tue, 21 Nov 2017 10:05:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 21 Nov 2017 10:04:45 -0800 (PST)
In-Reply-To: <20171106154813.19936-13-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
	<20171106154813.19936-13-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Nov 2017 18:04:45 +0000
Message-ID: <CAFEAcA9YDiTNPX4gxG9uidUbMarLK7gHaeBOFs-+a=6qsuothA@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [PATCH v3 12/30] sdhci: Implement write method of
 ACMD12ERRSTS register
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q8cXe4i7JZeH

On 6 November 2017 at 15:47, Andrey Smirnov <andrew.smirnov@gmail.com> wrot=
e:
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  hw/sd/sdhci.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index f561cc44e3..53e5e011a7 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -1139,6 +1139,9 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t v=
al, unsigned size)
>          s->admasysaddr =3D (s->admasysaddr & (0x00000000FFFFFFFFULL |
>                  ((uint64_t)mask << 32))) | ((uint64_t)value << 32);
>          break;
> +    case SDHC_ACMD12ERRSTS:
> +        MASKED_WRITE(s->acmd12errsts, mask, value);
> +        break;
>      case SDHC_FEAER:
>          s->acmd12errsts |=3D value;
>          s->errintsts |=3D (value >> 16) & s->errintstsen;
> --
> 2.13.6

Is this part of the stock SDHCI spec that we just forgot to implement?
Assuming it is,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
