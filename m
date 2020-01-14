Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5459267lff;
        Tue, 14 Jan 2020 04:44:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqymPQaunL4y312AHlgOzo8LsKDsI3LSikzRBxqxF8t8glYDmZPM5T6zaH3DDWuSUj96fc5H
X-Received: by 2002:a05:6402:170d:: with SMTP id y13mr22983319edu.126.1579005885694;
        Tue, 14 Jan 2020 04:44:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579005885; cv=none;
        d=google.com; s=arc-20160816;
        b=T73ZVEaVzaC92RU/yMWJBaRCfWPiRcqCmSZBPjFvqqe2ncGZOuht90gu0cmhQP9th9
         E19l0sWtSAJkmi+BIU5obYFxRS8d5XUeULWFM150bHRMfyaQYGBghQFZk82VR5ZPDXqC
         afeR19i4vz6Ua22y0QRBgJ74Vzcl/S00dwwdpzkrW3FmxwuyxxziyFHPMRTyB9gmrDDJ
         6w5BWugJ/Z2UD+/yVLecnfPZFTB+M7jDFSdtJHtMl3eBWLXAIwlxQfOF9MQy+HZupdBR
         7QH/aFAL3iGifMklDROSH6rFaA2UQkNnh1OQgg41pdCZu7M9UV49w5LEDR9MT0lZwnvt
         zaMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=zoV8XFb70US4wtfbY1n94Er2azORQJIzo99CIq35yg8=;
        b=fxTgvc2PmgsSkqoNOKXBj+vhQ9ru2RDamwZPpP8VFcRmQf/Ro7dQGWm7IVW0UQ4UYD
         p/DvCsRf4bktcfhQpWlKr6TR6KrAPcx5dpGml5LbThGbVl8w1XjLw6hTUVSBKxIX169o
         pWgCvjwsGZWNGHq8xjHNwYT3MADKFh1O8T2xZ7hMV+Prr8ly22rAv14Kyc4mjZqbIsxm
         cNzM50VFMnP/t+YR8cJ9mTZDYYouoZjQIjZLmwcwnMon6I0v7cFXLmGkgpA9aooQZgSS
         EK31ZvfUQw55wlKf4OtnFtvpHPOEXEh/uogMkWf8KXQ4Q3Fz7HzyjFqKJtyOwFKXjGus
         sytQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Af+9bxMb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u2si9679861edy.95.2020.01.14.04.44.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 04:44:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Af+9bxMb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irLYq-0001vv-JK
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 07:44:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38599)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1irLYf-0001tI-LT
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 07:44:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1irLYc-00077U-3R
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 07:44:33 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59956
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1irLYb-00077I-W3
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 07:44:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579005869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zoV8XFb70US4wtfbY1n94Er2azORQJIzo99CIq35yg8=;
 b=Af+9bxMbxZd+CcEY11D4/h/dyNH2toLJUXUB0IzsfcWkQLAG6lSP+3gMGCmwct1WTHSmzi
 LlGkm8e6Ix1Zl6QcH6hopLaHG3HjKppcz8udGUPnioYXONFofEi0YERP5PXjGV45/gaS9K
 9zcu+b97tvFW9YiaZoJoggcWAFap7Jg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-y5svMMgtNEqynZMXJ7YoFg-1; Tue, 14 Jan 2020 07:44:28 -0500
Received: by mail-wr1-f71.google.com with SMTP id z15so6465237wrw.0
 for <qemu-arm@nongnu.org>; Tue, 14 Jan 2020 04:44:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7j8CwUwkHJam8aVjm733nleoJ5Yw969ctuPEeETw7z4=;
 b=B/D6De7AiOtTmxAuOcvQx/AxUfZsWdImS6f1F5z8nd3mFWo+7x7bNAiceO9th7EYk4
 1lcfOpCElKetkpsrOomOfEHN3wUQ7prnSyc93vixQbKjA5yXP+Xco7I26zuA9DdtYHyY
 NJ+9ui+jg/zfVbr5lVcfsLXt8DHJwL3LKeE8IcvVjnrmg5f+dVOFD4VI/LVC99ALFCwb
 t6yPdr21MVgbkScrQrCfwjf5cVgnrGZ++4oBY+l9Pb/kHYzPbmyzTk1Nf4tQmAGq/VbU
 vRs6EmWUZJDvBjhUVdori8nE2oKw2ujSq7+HHicFhJ60yRcyndd+xTjAYQllzdSzuOhv
 Lm+w==
X-Gm-Message-State: APjAAAWnfoyEEbMPCFAWtFC02UfMJns8OWMU5x1Go4HI4fvh7sCqLJUQ
 rda1lUgRPSv4s4RuxeRDQ2mYequgq9CVlpvx7F2g71tNk24alD7h2NB0SVRyEawSlYBd6wOAwjt
 JFlLA9ueflci9
X-Received: by 2002:a1c:4857:: with SMTP id v84mr27888918wma.8.1579005867444; 
 Tue, 14 Jan 2020 04:44:27 -0800 (PST)
X-Received: by 2002:a1c:4857:: with SMTP id v84mr27888876wma.8.1579005867071; 
 Tue, 14 Jan 2020 04:44:27 -0800 (PST)
Received: from [10.0.1.197] (lfbn-mon-1-1103-34.w90-48.abo.wanadoo.fr.
 [90.48.206.34])
 by smtp.gmail.com with ESMTPSA id b137sm19520346wme.26.2020.01.14.04.44.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2020 04:44:26 -0800 (PST)
Subject: Re: [PATCH] target/arm: add PMU feature to cortex-r5 and cortex-r5f
To: Clement Deschamps <clement.deschamps@greensocs.com>,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20200114105918.2366370-1-clement.deschamps@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <03110090-dd50-b124-e60a-9cf136e8f7fd@redhat.com>
Date: Tue, 14 Jan 2020 13:44:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200114105918.2366370-1-clement.deschamps@greensocs.com>
Content-Language: en-US
X-MC-Unique: y5svMMgtNEqynZMXJ7YoFg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vh33KZkEkMIR

On 1/14/20 11:59 AM, Clement Deschamps wrote:

Maybe describe here:

The PMU is not optional on cortex-r5 and cortex-r5f (see
the "Features" chapter of the Technical Reference Manual).

> Signed-off-by: Clement Deschamps <clement.deschamps@greensocs.com>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
> See cortex-r5 TRM - 1.3 Features
>=20
> PMU is not optional on cortex-r5 and cortex-r5f
> ---
>   target/arm/cpu.c | 1 +
>   1 file changed, 1 insertion(+)
>=20
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index d62fd5fdc6..64cd0a7d73 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2121,6 +2121,7 @@ static void cortex_r5_initfn(Object *obj)
>       set_feature(&cpu->env, ARM_FEATURE_V7);
>       set_feature(&cpu->env, ARM_FEATURE_V7MP);
>       set_feature(&cpu->env, ARM_FEATURE_PMSA);
> +    set_feature(&cpu->env, ARM_FEATURE_PMU);
>       cpu->midr =3D 0x411fc153; /* r1p3 */
>       cpu->id_pfr0 =3D 0x0131;
>       cpu->id_pfr1 =3D 0x001;
>=20

