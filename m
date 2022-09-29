Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp1009775ocs;
        Thu, 29 Sep 2022 06:15:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5roFG1WDFMQW0Cp/xqn2F5t5k9lpggGngFLU2vZH+U+B34DY3dBj2xBSZkdTtoh6pNtv34
X-Received: by 2002:a05:620a:14aa:b0:6cb:e3a2:311b with SMTP id x10-20020a05620a14aa00b006cbe3a2311bmr2116677qkj.266.1664457310050;
        Thu, 29 Sep 2022 06:15:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664457310; cv=none;
        d=google.com; s=arc-20160816;
        b=F+BD+xvtTotaIAHTdbIH1hEOaJPDFv11c6HTysZfJSa1dzrxwKuzDEcIc6PfpOJube
         RoZcYpi3v6NQehzXqToq32D+iQ9OOWrkksMu9QIue4rI1RlQC/tLu2MyTWHAxWPSiTky
         SE5hAoFjrMTFkp8CrBxjkAX+eiB6mZfLuzEtNUoDZkrqnIwZUwGBU9wAh35HXUooAYO7
         KB30FPUGOPQjMtode0+TkB2fpSceY4CfyEUvh9YvUUl80LH0/MHX2FMXsdPDK1SkEAD2
         DtC9LnuL7EGhKjNQyalnGGNnFAOnTGF/pb979GtR1fnzqWpcX1Erz4muAtqW3wecrC2U
         p+3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=8SuG+DFph+UQuEzJIs4sdUk7OdEe2rwwYl9qbu1x0mg=;
        b=HsMiV8ZbRbblDV6SyP52a/4U1uPQRPpb99hmA/q0fZ1izaRHuJMAwtQGhzPI5oNOrr
         dKpg4SDNmUzAGHFoAZxGcNd1n46IMshn04lnpyd5CDAmNeEOCmO62FSjuk5dG8KeLN/u
         iPKeooIdTHfLMH5ElyM/dTi5UaMJzTHNV5aqiJDPt+9i8irVl5KMPMHCl1FXUrs2vZva
         qL1n6lUKE0fvPI54nEalbH9ubBj1uupCQQ6SoGCRgUdCNR6GoOvGbsRXMOe880U9Vrvl
         aacutW29EajHkrZ0liPmFgs20epufwU4L52YmvXeDIKI9juXcaB6UOUw1bhNqoZjXZ7H
         1QsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KcqISa9m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a15-20020ac8434f000000b0031f2a4b508esi1311919qtn.128.2022.09.29.06.15.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Sep 2022 06:15:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KcqISa9m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odtNd-0002su-Dy
	for alex.bennee@linaro.org; Thu, 29 Sep 2022 09:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odryS-00065V-By
 for qemu-arm@nongnu.org; Thu, 29 Sep 2022 07:45:06 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:35604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odryQ-0001ba-Oz
 for qemu-arm@nongnu.org; Thu, 29 Sep 2022 07:45:03 -0400
Received: by mail-ej1-x62b.google.com with SMTP id sd10so2251723ejc.2
 for <qemu-arm@nongnu.org>; Thu, 29 Sep 2022 04:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=8SuG+DFph+UQuEzJIs4sdUk7OdEe2rwwYl9qbu1x0mg=;
 b=KcqISa9mhCyLnsHbPqakSD6eqLysrHya8quhFg+Vy4ArPHzyo26kiua4p92hA5Hnd5
 GD2gGf3pcEIcbB+FyLVPTC7ZLJINi/1/77NfCLY1L4yA3NeQXdHrDJ/3nuOXPhzcOE9c
 imXXBEGUHAsTSx6y/6gZSIRdN8guwGcE4ZvvxOvgbTqfbFH8qOtDSW3vfxD7ToO/dczd
 ievuymyM/OVX8ZNHOVpSBnFDG9VfSA4LuJal90jMIisNRr2Ry0OCW3M3dchwPsVOhflj
 yoLzQxq1kjp0JhOlZ3WtGiOd2C8cPacQcjqnAAitusxwEdO1uFBNObNduIOnNh3WFwC9
 X83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8SuG+DFph+UQuEzJIs4sdUk7OdEe2rwwYl9qbu1x0mg=;
 b=5KsA/Q9NaPWlVreqDehxkVEyOewFEH74bFgm9U2P9IFfv3WwP6N6kQqd2nvhwSGZz6
 c2w8D10lSXvgemn0WF979MOkym5I0o9l/i77UbTJkyS3//rPb8Wk4VUnwsoqvOP8jhqg
 GFuOddPtf4SElFUJnznGTRcy/H1uxWYMa6TG4uAl/7YRr8KjjgjWqFPKTbfAhnS0gO+2
 uIisEvRVB443MnwT2mgIVgNlAb2CKN4mPrXYdNAuHN1XehNQsOjOLa9S9tU6oRs9s5L2
 UKz3jibx04Cs336udILsdbyWrEVmjE4mvq/N138GD3clAZmiB1HpzzSDOsTtan3WuF8I
 Ex5g==
X-Gm-Message-State: ACrzQf30qHr7tH/Fwn13vwOaGEqJbCVyxRQjqLNhIJtbtoCADfDpqPUK
 dRFcyDeoNQCiaF3nKMTSWGcd9tb49x5ubTaVsAMCcA==
X-Received: by 2002:a17:907:728e:b0:782:8e91:64c8 with SMTP id
 dt14-20020a170907728e00b007828e9164c8mr2537637ejc.36.1664451900905; Thu, 29
 Sep 2022 04:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220928164719.655586-1-clg@kaod.org>
 <20220928164719.655586-2-clg@kaod.org>
In-Reply-To: <20220928164719.655586-2-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Sep 2022 12:44:49 +0100
Message-ID: <CAFEAcA831iWjFSYt3UrKT0zA1MBfJn5BVSpEbVrOWj3Yw6yn_Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/arm: Disable VFPv4-D32 when NEON is not
 available
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: uzW6FhocxlY6

On Wed, 28 Sept 2022 at 17:47, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> As the Cortex A7 MPCore Technical reference says :
>
>   "When FPU option is selected without NEON, the FPU is VFPv4-D16 and
>   uses 16 double-precision registers. When the FPU is implemented with
>   NEON, the FPU is VFPv4-D32 and uses 32 double-precision registers.
>   This register bank is shared with NEON."
>
> Modify the mvfr0 register value of the cortex A7 to advertise only 16
> registers when NEON is not available, and not 32 registers.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  target/arm/cpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 7ec3281da9aa..01dc74c32add 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1684,6 +1684,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Er=
ror **errp)
>          cpu->isar.id_isar6 =3D u;
>
>          if (!arm_feature(env, ARM_FEATURE_M)) {
> +            u =3D cpu->isar.mvfr0;
> +            u =3D FIELD_DP32(u, MVFR0, SIMDREG, 1); /* 16 registers */
> +            cpu->isar.mvfr0 =3D u;
> +

Architecturally, Neon implies that you must have 32 dp registers,
but not having Neon does not imply that you must only have 16.
In particular, the Cortex-A15 always implements VFPv4-D32
whether Neon is enabled or not.

If you want to be able to turn off D32 and restrict to 16
registers, I think you need to add a separate property to
control that.

thanks
-- PMM
