Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1706710lfm;
        Thu, 9 Jul 2020 12:04:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQEXijVrARGNs10PM69cu0hgnz1xmI/x34rd2SlEbcDynd0V5IqPd/0SKJv2D7Z2NNe54B
X-Received: by 2002:ab0:2894:: with SMTP id s20mr28259907uap.55.1594321450766;
        Thu, 09 Jul 2020 12:04:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594321450; cv=none;
        d=google.com; s=arc-20160816;
        b=D+NROXmOtXHtx3wUp7ZIcjrBau5C6F0oU9zFCKga7fMT1D1WjnkmlAHlqcq7Jee4AL
         9VUcCEwVF6XoPZsXAFvHjc1/+IfCk+VVomdbPzT6T0XjkSHvRKDMJnFwyMx8uQR7FL3E
         qVYDhtZnEvbaMLXp9UnG/s7KYeQRnagerrEMDFT/SIXyjE/6MhMEbqL1iX8I1A9UJZL8
         PUytZNeC570qTZGItyYiwBQ/NFSqXPnKdvz4pyajvtMkwgrZKzsO8mozFxhewhRAvnzw
         pvptW6GZnpR1tNVnsYvyEpquwrOuAQcxepgVdaqEh677gOncAuETYrKdFnSIg9gSorwR
         jC8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=4KilTC9iLGIGPk+lqxRO0Srirg34En2SnOqSV4mFp28=;
        b=DJfVQqIf7x5gXoFOY0RGYD/syPx4JkP4Jl/5xRD+rQ0Jdx92X7L5G/4JUMyHI97v3N
         b654olYE4hHieAsFklsi++vxwGyS/gtuQGqEJrW7wA5auO+WQIJMWyp5XaC1A5c5rgjg
         +VXOIpsHIaRw6Je+SBNzSPhjX7PQdGDFYS3ZRrXbsPYKIbYGQIL6kNrV/wthexLUZ5yI
         N7MDnsvJCR5tmWYLMC0c2kp/rWzaIcKRdq5C3CMxUGHDXaiSe9ltq0fTP+FQ4Lu4iQAJ
         Br9csF6ObwjS/VgP8nXkjCN1fk9EbKNQhoRJqT6dorHy6kK0I9WiDt//Aie1UIGAiIrZ
         cJ9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="x5/fEET4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n20si479373vsp.22.2020.07.09.12.04.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jul 2020 12:04:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="x5/fEET4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtbq6-00037T-2b
	for alex.bennee@linaro.org; Thu, 09 Jul 2020 15:04:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtbpy-00036o-Bl
 for qemu-arm@nongnu.org; Thu, 09 Jul 2020 15:04:02 -0400
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41]:34798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtbpw-0003qs-FW
 for qemu-arm@nongnu.org; Thu, 09 Jul 2020 15:04:02 -0400
Received: by mail-oo1-xc41.google.com with SMTP id j1so549054oof.1
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2020 12:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4KilTC9iLGIGPk+lqxRO0Srirg34En2SnOqSV4mFp28=;
 b=x5/fEET41wS3OHXK/fV0y+sKgHliKCwF3ZBpLXOG2hnhi+Hl7LVkyPghFqC1tHE2y3
 b4lcaYNjxk9WfS1cCAVUzDj2stJJfOR1Gb9dOO6BMLw8NsFe+rdNcXNDNTQQe216cCRL
 7RaTEx/LRC0DXClRtcGrOwcMD49C3aABaBDLjoSd1iWQGKuVhlTyAoONlfM5nciTESxY
 ilsS6F84Autw/lr0+r5GbA5mIDD4nAISqt0IL24MTaLfEmCyFj/etgDzjovAELipwN+G
 PWdj3yOXFDAtKwN1U+bZxHg0Cus9jQqhFIVgukXcp7QQnoH66Ycf3U5eA23x2nNVA+EY
 KBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4KilTC9iLGIGPk+lqxRO0Srirg34En2SnOqSV4mFp28=;
 b=Gp1DJnaiZzFpeQbQcbEMsGaDS5WBOqn1cW/Ch3k7qlS4gk3ryutqpJi1H+8d0zERdp
 JoFbFs1e7yuvQHTFg1po+afizobAz1ld2RwFLRo9qFApNoAVp6XxhkxVfwv6Pxoq6Xq/
 v/EcdpOJPvGrNKulJ3t9Jzj2t2DNWTBfvHsvneUAIHmrRuh5YrGfEioPbpn051r4fxr0
 e24T+WwpraWFFrELZeYr3IHmPtcWtF8HrYvNHs3L5T9Uz1acG5gYFvA2Uy+Mmx2rCoMr
 b7w5C3h2B/gNymQgfhIzKNqE8awovPMX/7JxT2vINQyscj3pu5B7r27tjAmXxmwN/WwY
 Sg7A==
X-Gm-Message-State: AOAM531VFIkQ0BwVf1nv8+VnaZs1G77/jD0ZtPtZzFmS6cP1/swI2lMs
 Zstcq7sFSf25d94rLIqQAh4M56YF7bpMFovg1pHPZA==
X-Received: by 2002:a4a:2f15:: with SMTP id p21mr55958729oop.20.1594321439306; 
 Thu, 09 Jul 2020 12:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200703201911.26573-1-f4bug@amsat.org>
 <20200703201911.26573-5-f4bug@amsat.org>
In-Reply-To: <20200703201911.26573-5-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jul 2020 20:03:48 +0100
Message-ID: <CAFEAcA9Bzer-jiPy4jqpc3ycp=d-wdd=LQcdhT8eCxqMQWG-Mw@mail.gmail.com>
Subject: Re: [PATCH 04/18] hw/arm/armv7m: Mark the device with no migratable
 fields
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c41;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cKbsRqoUOZva

On Fri, 3 Jul 2020 at 21:19, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> This device doesn't have fields to migrate. Be explicit
> by using vmstate_qdev_no_state_to_migrate.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/armv7m.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index 3308211e9c..3f78fccc12 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -366,6 +366,7 @@ static void bitband_class_init(ObjectClass *klass, vo=
id *data)
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>
>      dc->realize =3D bitband_realize;
> +    dc->vmsd =3D vmstate_qdev_no_state_to_migrate;
>      device_class_set_props(dc, bitband_properties);
>  }

The commit message implies that this is changing the
TYPE_ARMV7M device, but it's actually affecting TYPE_BITBAND.
Code change looks good.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
