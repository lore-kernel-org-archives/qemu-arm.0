Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp381732ejc;
        Fri, 13 Jan 2023 05:17:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs5xjEyoERyhYG1FcUU0QrCDJOfVZGdppSVl9yhPqdRugfcldZRjTDgxTgw1ZQR6ETCo45E
X-Received: by 2002:ac8:5481:0:b0:3a7:e2df:e868 with SMTP id h1-20020ac85481000000b003a7e2dfe868mr96444800qtq.41.1673615873144;
        Fri, 13 Jan 2023 05:17:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673615873; cv=none;
        d=google.com; s=arc-20160816;
        b=XyEAamwhwMjT8WI8wuU0RQx3u8wRCx8a8atNcJjXhySlk/2u1/AQxCf+FeKJyRruf8
         UkPv4cxZdnrd6s8NXweid6LSAxelOajj86d8rvFcqGJ6ke9KrzrV8H3P0/3ugUvYLCij
         OMcrFTaN4KPB9PRxZkSnhMqm6a/5nicMe/f4fLaUZbromr8f5K0d5wGmO3N0xmTgT6T2
         uNiaOSP8gfEb9ru9WVoB4UxRUzAXLEUBzL49XSXc7JTp7XiLttjRs1+iSBMX1gYvJq9F
         RYYCjpKqWrtxkp44MHvERrCMHyAG+GY9pVfbSlWQqZIV3VisxUfwK+G0MsfZDM/gCVMt
         62fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=O+x1ewfry7Yn4tG+ORJPQF7FxEIr7PRfmPrjUm2JgHw=;
        b=eT64wyEd6uKIEgesTrwKrs0qok9bSu27BBxf9bpo6PmvHzUbeaRQrphoGEEysPFPYM
         busn5ddiNLDfJ71MPAFJIySVzJDgpSvLgZOpQ/sjm7ImpQ8N6zy4hDpNi2oAXRWE78a8
         p700wcVcqv1l1CJ9fA3ksSF/BNToD2Hvd0x38zMug6TpBzv4lbV88O+9XyF//80YEw8C
         UKmdMnATNa9y/VgEBP7SbXp2TtDwjyDbfnsplVhHy/nG+Is44IpK2befudSZCRxR+L37
         X0IHbMfU+maGbSFuOs35FiImFAwTall2HNUlFAp/hSJP2T92PYXnWIdYDnyMng+yimXu
         ZUow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZAKvONlv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e26-20020ac84b5a000000b003ab5d6cd6c1si11890485qts.591.2023.01.13.05.17.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Jan 2023 05:17:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZAKvONlv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pGJvx-0007cG-5P; Fri, 13 Jan 2023 08:17:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGJvt-0007bm-O4
 for qemu-arm@nongnu.org; Fri, 13 Jan 2023 08:17:21 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGJvs-0007qh-1i
 for qemu-arm@nongnu.org; Fri, 13 Jan 2023 08:17:21 -0500
Received: by mail-pf1-x42b.google.com with SMTP id y5so16153002pfe.2
 for <qemu-arm@nongnu.org>; Fri, 13 Jan 2023 05:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O+x1ewfry7Yn4tG+ORJPQF7FxEIr7PRfmPrjUm2JgHw=;
 b=ZAKvONlvGkajF2EVCCBvD0PePWt/kyhrTUfz1WmgSJlbnD7N7FWkGICvGVRiESrc+4
 nXQ4JEVseQ959m31DknilRDk2h9Ox1YHxPTzgKVy2kD5gt8/7evSdXDmdv/iwBdBAGHg
 6eixCDtTPnvL27Sb+47hGH81FtfZ6ZVY1YCMf+uRkPbLhNrnjC3alV5nMXUPd819/wuA
 E517JzTztH6G3E1tP8c/WyAv+fgdPFpxgWAYyj1S/d+RMuRQTzbJrsVjxyR0elbmXdrm
 QGPuWOfVSbbhcN2iNIIp+vvZZJhosrBVOeJVSgz1RKBkKu7MRvkgYGJjWz6f+nSrpY+2
 PELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O+x1ewfry7Yn4tG+ORJPQF7FxEIr7PRfmPrjUm2JgHw=;
 b=RdhiYYiGAu+1yAYDxCcBunAQM6B2VDL023oIWWi/SGkjJg3mvnglsuG4eRs2ymfZTF
 /oCaOU9vtzjpiwPM0YVTyHyuEyDHKSH2RZFDRScdNe7quvbDdHerEz1Ny1UGsnrBrrRi
 20wotmlDrv7C28uz2o1DmRvb8hCbXsHlJJrZsdmb/YFdEODYWKohvdMEz8PgGk40F8//
 RV/YNuiU0jmY2Mjh3oibjXTNMYYFyJOPj1yjpoLpCFNHcJFVd01b1jttCpc9bZCW8ku7
 9XipY6rZPXvBXfKg5Glb/nfLS26IHcppLbwo1SyIoktFda9Kna3opQIXWdDBdHEEObhc
 5jEA==
X-Gm-Message-State: AFqh2krAE5qGO5wWiyg+jABtXZ9nwE8UXb4Dry1OoTTcPne8QYUPpCAY
 /PIBVMkfVgT8yEgyqeE6ZvUQ0QhRh/El6l0fRPirjg==
X-Received: by 2002:aa7:9485:0:b0:582:bdaa:b575 with SMTP id
 z5-20020aa79485000000b00582bdaab575mr3310962pfk.51.1673615837536; Fri, 13 Jan
 2023 05:17:17 -0800 (PST)
MIME-Version: 1.0
References: <20230105221251.17896-1-eiakovlev@linux.microsoft.com>
 <20230105221251.17896-3-eiakovlev@linux.microsoft.com>
In-Reply-To: <20230105221251.17896-3-eiakovlev@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jan 2023 13:17:06 +0000
Message-ID: <CAFEAcA_z=rtYmaGWDWNib8tr_L==exWk5iBwkzsGMirRohFNog@mail.gmail.com>
Subject: Re: [PATCH 2/3] target/arm: provide RAZ/WI stubs for more DCC
 registers
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9rmpS8yPWglb

On Thu, 5 Jan 2023 at 22:13, Evgeny Iakovlev
<eiakovlev@linux.microsoft.com> wrote:
>
> Qemu doesn't implement Debug Communication Channel, however when running
> Microsoft Hyper-V in software-emulated ARM64 as a guest, it tries to
> access some of the DCM registers during an EL2 context switch.

I've occasionally thought about implementing the DCC as something
the QEMU user could connect to a QEMU chardev. But that would be
a lot of faff for no very obvious benefit, so making these registers
RAZ makes sense for now.

> Provide RAZ/WI stubs for OSDTRRX_EL1, OSDTRTX_EL1 and OSECCR_EL1
> registers in the same way the rest of DCM is currently done. Do
> account for access traps though with access_tda.

OSECCR_EL1 isn't part of DCC; it's a different bit of the external
debug interface.

> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
> ---
>  target/arm/debug_helper.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
> index b244e146e2..2a7c3d7e38 100644
> --- a/target/arm/debug_helper.c
> +++ b/target/arm/debug_helper.c
> @@ -673,6 +673,18 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
>        .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,
>        .access = PL0_R, .accessfn = access_tda,
>        .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "OSDTRRX_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
> +      .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 0, .opc2 = 2,
> +      .access = PL1_RW, .accessfn = access_tda,
> +      .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "OSDTRTX_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
> +      .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 2,
> +      .access = PL1_RW, .accessfn = access_tda,
> +      .type = ARM_CP_CONST, .resetvalue = 0 },
> +    { .name = "OSECCR_EL1", .state = ARM_CP_STATE_BOTH, .cp = 14,
> +      .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 2,
> +      .access = PL1_RW, .accessfn = access_tda,
> +      .type = ARM_CP_CONST, .resetvalue = 0 },

A brief comment or two here would be nice.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
