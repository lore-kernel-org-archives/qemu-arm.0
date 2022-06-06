Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1516884lfb;
        Mon, 6 Jun 2022 10:03:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQa49ndMSgLYqwYhxv6pMjCI9PI601rxNji3kPmgL13PDtmVvYZSFKK44C0ZKtDm/bEd27
X-Received: by 2002:a05:6214:1d25:b0:464:55a9:48df with SMTP id f5-20020a0562141d2500b0046455a948dfmr29476768qvd.113.1654534992081;
        Mon, 06 Jun 2022 10:03:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654534992; cv=none;
        d=google.com; s=arc-20160816;
        b=tf4Za+fJwfTOGFlWeSS+kzqSLyiK5B2T6EKMBIqFogroq56xRPj1VFwzuDev36gd1n
         jWvBL747RylwFOLQJby46Bqwhlgb3CPxPQArWqUpWf8hAgha4hr5WjqD9pRlJ4681Fvo
         ojN+NCe+3btq7dkHEASSBg70NHe4IwM0Dkn5zfu9UcKJPffqi2bySsxVRJB8F/6HTvF+
         g9y2ASQ5qlyxuc6LLf3W6gJ80dDo1RJZnFugAC872y+aqPde9m93XhdMG0x9BwobRqYK
         dfFlx4fC7vx8FikcFVKA95vfnkx+zWSke+cNXLrdUMaY7A5r6RvUPbMpC7pgT30IaXWx
         EfZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=pSan1ApKReif7NwnhO+c6usmPgQvaZsObStfMLnTGBU=;
        b=0pkeGGg5nLfMI2wvG7TdLTuYAPs8uvIUVMWsVkiGsgmolS2NCBhqHNb7AbjuJRGOXR
         a5f7BCx2m4tdbWvfIfeE2QLwqR5GaOBWLFObOXN+7k8R5tMHOrHIiAb/milcXpqoY/tt
         C6PUY8Xk/1N1FTF6NEiGqgSDZ+hAzmVB/8odqgXYemBUCuqgbkiBAdHGlfrpaL5qBeWu
         tOqFXXKnP06sNBJ4/Ws2KxJSaMi5hbJzLGR2RpL9BD5S3R0fSYL3cVig4E+LH6P9Gnre
         US3Mjidfq2518U7mvwmie52+e0fYUOzkKL7pgIQU4mDKDaDx7T6V8xANH4hO0o8sYAof
         /Mdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X9Rd2gVs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl7-20020a05620a1a8700b006a6b664560esi2493162qkb.62.2022.06.06.10.03.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 10:03:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X9Rd2gVs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyG8F-00027U-Gg
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 13:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyG7v-00025f-JG
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 13:02:51 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:39664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyG7s-0000BD-RP
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 13:02:51 -0400
Received: by mail-yb1-xb36.google.com with SMTP id f34so26768982ybj.6
 for <qemu-arm@nongnu.org>; Mon, 06 Jun 2022 10:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pSan1ApKReif7NwnhO+c6usmPgQvaZsObStfMLnTGBU=;
 b=X9Rd2gVsT1wA4bEa6pYAPkGigkqBl+7Zc5DEDxq3yzVQ206gPAeios5RsAuGBMgpPU
 1Puf4rfNfxRbDQ5mhird3lucqu4VG5eKYumOfY29n3GtGjdtodABCDxjru2xHHvz3oBo
 zunJhxlDRFB+6ZYF30Lg7qdBdt4qKJKSj7E+OEvRBJVLT1l0GFXXZUprC0chXe4XVGPA
 oNLsRZ5flEXO5jV3cBcw5muGAWYNzlsrNmXPEH4qcNa+CCQrZIrD7TaP3acvoS1iO91I
 SENtbaBNqu1dxuSra3PpOk3238GXvTG/DLfmQgs8qA4/Sh3yVM5CBwStQT9KasSKPMfp
 YcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pSan1ApKReif7NwnhO+c6usmPgQvaZsObStfMLnTGBU=;
 b=vpyIJByVBDzyitc1gdsQMW0paVSq3lPLTA6FvHask3JFSEoI76i5mEd1OyHnlJblCs
 mdOrDa/EDiwmvmmDBgo9QwSj7i09Ma7oTXwOcCewliJoZjEEM/ssBGy7Pz130h1VHBQV
 bCOMJXjrOyXi5TYUuNliM1zpHgtvo19tQD+zlACbER+eQwOqPJfWaX4B4mG6OLagwpye
 71qY8ZcD+pGOP2kCuIBcEL3GJJIV2Og2r3zMqJwECvZ/nxEvstuV49VNOIis6ZDQg5ry
 d7PqZ1gV08unNP0ZQC3bS9VVLeRGfuiIGJVJdE9Mjqdccthm7Y2Ue9gZ7wAOevndW3mb
 KUwQ==
X-Gm-Message-State: AOAM533OhkLy8zsNIuv2kszTa61KF+nEyNc6QeRj/lP/TW8TeAPS1ygv
 qW/eB43oVcKXH0/U3R+LVmYomMMOow2i2a2aAfNMLw==
X-Received: by 2002:a25:1bc3:0:b0:65d:46e8:6322 with SMTP id
 b186-20020a251bc3000000b0065d46e86322mr24816060ybb.140.1654534967322; Mon, 06
 Jun 2022 10:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <8C1AB09A-AFB3-469A-8333-C3D1802D14AE@fb.com>
 <CAFEAcA8LnnAnTqSw5Mm_01KAORn9qVnNsWbouXpJ6X_B=sZ0hw@mail.gmail.com>
 <ec17bc9d-e1cb-3315-6b5e-88ec6d75c7bb@kaod.org>
In-Reply-To: <ec17bc9d-e1cb-3315-6b5e-88ec6d75c7bb@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 18:02:36 +0100
Message-ID: <CAFEAcA_vo-WmhpjpXcqE6qzS5xwoTfOm=d+jk9e2bG3Ob3Ye1g@mail.gmail.com>
Subject: Re: Help: How do I make a machine with 2 separate ARM SoC's?
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Peter Delevoryas <pdel@fb.com>,
 Cameron Esfahani via <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6o6qeMsPa3JY

On Mon, 6 Jun 2022 at 16:37, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On the CPU topic, I think we will need to change the GIC device
> to stop using qemu_get_cpu() in the CPU interface init routine
> and in the GIC realize routine, since this is global to the machine.
> I am having the same problem when trying to model a multi SoC board
> with a GIC device on each chip.
>
> What would be a good approach to loop only on the CPUs related
> to a GIC device ? Could we tag the CPUs and the GIC in some way
> to filter the unrelated CPUs ? Or pass a CPU list to the GIC
> device ?

GICv2 or GICv3 ?

Guessing GICv3, I think probably the right approach is to
have the GICv3 device have an array of QOM link properties,
and then the SoC or board code links up the CPUs to the
GIC device object.

thanks
-- PMM
