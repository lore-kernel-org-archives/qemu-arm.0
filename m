Received: by 10.223.172.38 with SMTP id v35csp1122659wrc;
        Thu, 14 Sep 2017 10:15:29 -0700 (PDT)
X-Received: by 10.55.134.134 with SMTP id i128mr3597557qkd.214.1505409329539;
        Thu, 14 Sep 2017 10:15:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505409329; cv=none;
        d=google.com; s=arc-20160816;
        b=cFQTrIS+zdrz2/FDGtZTtbX+pR1rVtdSpOqpv1jqRfmDfociss4Trk2HYTBHtqeRw+
         vsNtEsJB3O9AL0brLQhTAh13/MtWb5uKJ2J1kopoLj8X/BcUIOoyMJrCRmjk5Z2FPwaF
         ++HXBzlegebQEoKE965ak/kT/mOJOzch+WG49tKF2R6aknJbBIxqFJc0Kwm4CBEn5A+4
         zKKXCcDEo/Bk+EU9djAfsIFYRsua/r6GN6euUSf30a3MCpeKh4B9WqeD2bh1o5qG/OBU
         2xomR3cYujARjdcD5YGQIQjobWh9ffMf6vFS/3dB4kajvggNpsKX8otL8CuSpUiDNSfG
         xhUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=E4RL7bxWmZLacx8RtxssyG8Qu5ATu6Dp6UYNutGi5eM=;
        b=LzlMQ5g8odToef+E29rJiuKNaEXK07Mc1C+G+5Eo9eec72qm+UTxUFqJKYauCnDal2
         mQnoOK4ARnNSYYoexUbxAsPSEtrgdj/92NuD0Begj0ImsR6JwBtd9FCZlCGpQcA15PAP
         2BU39FN1czqbDgXJ9AlwJ8pbZ86/Wze7WsY3VMHGGYcsWOZ09T8vtPMGpkxZq182vFal
         3KJlYNu1nRHZYtjtL9ojkdsvJCinDgxOTLpEoQcKefdLeH3HB+QGBzCz7ju3bV5IFFMT
         7uRbSdm74tZmBBljtj1lOKRnqxclREt62dydgK7OqaTbZ5AcHECUxaHiEMF96giJiC0K
         sF/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HUpdaLES;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t4si11312693qte.290.2017.09.14.10.15.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Sep 2017 10:15:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HUpdaLES;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49064 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsXjb-0007Nz-6w
	for alex.bennee@linaro.org; Thu, 14 Sep 2017 13:15:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dsXjT-0007LX-PL
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 13:15:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dsXjQ-0007sg-0r
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 13:15:19 -0400
Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229]:44214)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dsXjP-0007rc-O5
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 13:15:15 -0400
Received: by mail-wr0-x229.google.com with SMTP id v109so8341wrc.1
	for <qemu-arm@nongnu.org>; Thu, 14 Sep 2017 10:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=E4RL7bxWmZLacx8RtxssyG8Qu5ATu6Dp6UYNutGi5eM=;
	b=HUpdaLESsP9zWqlgQbcgVeT176JabDD8f/amChfj3NgQgVOwhhIHFIO/pjuXFOkcoi
	oaOoRSGaMux1sLhCxi1I1vXk0OXBoLoc7Nd+R5sxAG7Trozpsr2en1ss6qV9DJgOLDro
	nPHH2h6jiGNBz80aKbf62qRvgxi64gqrXZ09A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=E4RL7bxWmZLacx8RtxssyG8Qu5ATu6Dp6UYNutGi5eM=;
	b=nWpoo3eWTULoXFKExoxk2millUYCw0jeS9o4MBT3/YA//sNFY+xVXtJu3AoLExbFTO
	dFUVHZLeB12KfesO0GAXEyPJDQ/W+74l8NAphLH9n5kfC2RmLF3Kn4zbmt/vuUGaF98D
	ehIe8zOIxx5k/TsjXFMZ7sgoFNQNMjW4d/RtnDAqTcdKgLOe7DQavyBfU5cbfZ0/5H0Q
	QUPvioDDtMU0bXkeF7Lj3zkypy1N+gvSvPJiI3zcx9V1ujDiICWkyeXrMetW7NtCCM1L
	yDFPfKSa5jxYr0o+EEnM1efhJWu4yaUO+H1UjCHti8OJuCaQ2hje5C1tmv1AigTflwSV
	SBfA==
X-Gm-Message-State: AHPjjUjHyH8/SB0KQBcklBGw7TeJdSxoiXiVzkW7LupAhgedj6ib8dgL
	MYe0/MxHStO6VQ1UdiSUywUWPXBEwVSiMUy0JT2+/A==
X-Google-Smtp-Source: ADKCNb53DbnaVv7aoGf7upALFKbxn6So3cWthMZiJaKEIVkfPTsvtAWEWGwzPtgVBW2bDCD4PbPHrsQ88BNsyG9lw1w=
X-Received: by 10.223.175.100 with SMTP id z91mr20330667wrc.177.1505409314736; 
	Thu, 14 Sep 2017 10:15:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Thu, 14 Sep 2017 10:14:54 -0700 (PDT)
In-Reply-To: <1504812251-23438-6-git-send-email-sundeep.lkml@gmail.com>
References: <1504812251-23438-1-git-send-email-sundeep.lkml@gmail.com>
	<1504812251-23438-6-git-send-email-sundeep.lkml@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Sep 2017 18:14:54 +0100
Message-ID: <CAFEAcA_D=4M2vyo4m2xPi_hFDCmoKHk5kLY3s1ota602ywgHTQ@mail.gmail.com>
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::229
Subject: Re: [Qemu-arm] [Qemu devel v8 PATCH 5/5] msf2: Add Emcraft's
 Smartfusion2 SOM kit
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
Cc: Alistair Francis <alistair23@gmail.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OOOOBOPP1j+h

On 7 September 2017 at 20:24, Subbaraya Sundeep <sundeep.lkml@gmail.com> wrote:
> Emulated Emcraft's Smartfusion2 System On Module starter
> kit.
> +static void emcraft_sf2_machine_init(MachineClass *mc)
> +{
> +    mc->desc = "SmartFusion2 SOM kit from Emcraft (M2S010)";
> +    mc->init = emcraft_sf2_s2s010_init;
> +    mc->ignore_memory_transaction_failures = true;

Please don't set ignore_memory_transaction_failures in new boards.
This is a legacy-old-code-only flag.

New boards should define enough devices, either properly
or using create_unimplemented_device(), to make whatever code
they're being tested against run.

This is a firm requirement for this code to go into master,
because once we let a board in with the flag set it's almost
impossible to clear it because we don't know what guest
code that previously worked on the board will now break.

thanks
-- PMM
