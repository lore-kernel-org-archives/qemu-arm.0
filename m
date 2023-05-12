Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp4847368ejq;
        Fri, 12 May 2023 07:50:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7lgV7cg/zlEAXrEtKlJbkG37O7P6T4EIzOJg4Ff094vz51FrQLuK2AGAL5386MFLUE9hnt
X-Received: by 2002:a05:622a:1443:b0:3f4:f44d:9678 with SMTP id v3-20020a05622a144300b003f4f44d9678mr5874562qtx.50.1683903038148;
        Fri, 12 May 2023 07:50:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683903038; cv=none;
        d=google.com; s=arc-20160816;
        b=DcaCOhmolohA/n2KDMNZzDwFOXGQbGkfIE1TTP4tz8z6hU8Ffyz1un3PZkm0fSicDO
         AjQlBmcXvO6uQ5r/dn7SABULAh1IOITh0mbK/Q7sgN7QBz1a9V+yHtQpKbgR6eG6Q5mB
         Jo5cfZDEqykMuvKk0sQ6uG2RpT6iJ/L+wGQ+bO+O1Mk90v3Dkm7QhtyoBvXjgWMdtgAd
         U/JfsNzHtKuP+8GizwNIJP9YFpOsDYwHjhIRulA+sc5l0dt0yimrArLuXJn5mGF7qWm6
         syigv3/rIFbhLN/f6vxMwcvM2XXEcP07q/tMfGVfnMEZG7SGUROsn9ZeAG1d4oISv6RO
         9XyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4qnti8siutSgVf30v9QlmjlzOkQl22orD0PbS3NH+ZE=;
        b=ceVFMETz6RGoUvyamCWZhpzZzsCqHOkKyoeQ1ECZTzcKAQzV1auyYQj12GSuQ0qmRs
         iZSEcRSmOCocn5SbBAl3yL3pYhemGXWnWNbm8PbIRWL9xmpKlIRcmMC/vkfiZVFXa3lK
         xgO/dlR1WgMukcg2h0szB1bVhy1TDF1uEmN+IJenF9mAaIgCd0TAk1yXKO7nHa/tc8nL
         Sp+UUIkc5b7ZdIZXRKIDWCKEgw6Y7Im+mN0kXT+ylBMTb+V8F4DelggRsbDfhatKUjUT
         AnbN52T9jAZAL3705JUFd4SITwwv5GCnxY/RS8pq1TkBttM7cbFfA59kfikqXDNU4Bcj
         5X5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I5p+rxRT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3-20020a05620a070300b0075169f11ccbsi8675052qkc.91.2023.05.12.07.50.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 May 2023 07:50:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I5p+rxRT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pxU6K-0007ZZ-Ms; Fri, 12 May 2023 10:50:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxU6J-0007Yn-Eg
 for qemu-arm@nongnu.org; Fri, 12 May 2023 10:50:31 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxU6I-0006wu-1k
 for qemu-arm@nongnu.org; Fri, 12 May 2023 10:50:31 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-50be17a1eceso18785127a12.2
 for <qemu-arm@nongnu.org>; Fri, 12 May 2023 07:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683903027; x=1686495027;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4qnti8siutSgVf30v9QlmjlzOkQl22orD0PbS3NH+ZE=;
 b=I5p+rxRTHPOIP/UwWPqyEleHcruPYz34omiH4e5IbBwVkGwcQuAvDqoYdav5yI8gQL
 NA7OYutt/bISFFcQPyi5uP/fsU99xu3WKzy23uf3tWLJOT2jxM97Gepyarh/PWZGMdPw
 vupMinE/+3Gtw9MneGottjIER8JtDGkcW+xsI9gsh8ucvWZwWMdQySecaQ93ThlZF1dY
 J9bfEyiejEqPHbqU909eIP+RZOfu837qCkJ2/YvarQW2SmQiXmlAhnz5+PG73ObqntZi
 +deb+aHKmrIPWAoB22co+vsl6LSclFTMthEWdBZEqEV6nhWbAAquQz3nQLMB8AOO5TD8
 8V3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683903027; x=1686495027;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4qnti8siutSgVf30v9QlmjlzOkQl22orD0PbS3NH+ZE=;
 b=QDEBeg+bjYM7Zh3u4GwxivW+ViVqllHkgrXrlf9bJsObk3Yp718C+te73241AA6YNc
 CTyb0FyAb7Wy3JfLRHj1FxCgUQOIZ/iQJ2yPhZ+mMSoej+J3Nyfw+TDnU8XMPlEFesS2
 6h31dN8cmIzQZXYOjozgHuw2mhGrlPYCLdQHO2eqqxdQ4h9D6bGyq70ORcjsQH2Lzdin
 jPA6L7Z4O3DFI/tDqY0gvikRpAfAEBWt5t6WLa01zhr0DsKaMPfez0vl/E3U4Vfl4gUY
 FXlDqib9WLjMQ1fzeJNGZmpi0OnnxJEAZewwLwfBYH92fvfgcqC9J2sjdAZL4zR2RUqN
 Nr/A==
X-Gm-Message-State: AC+VfDyoFiYey69WSAYwlo2bgt6TGIPUksXu1ZD8L6E4hPvDSIwZbho+
 8XfWOmyhAlSLvzvHMtZrYsH/JHCC+kA19Xgxh+QPlw==
X-Received: by 2002:a05:6402:1492:b0:500:50f6:dd34 with SMTP id
 e18-20020a056402149200b0050050f6dd34mr23988955edv.1.1683903027288; Fri, 12
 May 2023 07:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230506183417.1360427-1-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20230506183417.1360427-1-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 May 2023 15:50:16 +0100
Message-ID: <CAFEAcA-d2_3xXMNwMG+-WOw=y=zandSM24-GfcJ8s=3etqACcQ@mail.gmail.com>
Subject: Re: [PATCH] sbsa-ref: switch default cpu core to Neoverse-N1
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Leif Lindholm <quic_llindhol@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: kFD7/OHgsnr8

On Sat, 6 May 2023 at 19:34, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> The world outside moves to newer and newer cpu cores. Let move SBSA
> Reference Platform to something newer as well.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  hw/arm/sbsa-ref.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 0b93558dde..a1562f944a 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -852,7 +852,7 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
>
>      mc->init = sbsa_ref_init;
>      mc->desc = "QEMU 'SBSA Reference' ARM Virtual Machine";
> -    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a57");
> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("neoverse-n1");
>      mc->max_cpus = 512;
>      mc->pci_allow_0_address = true;
>      mc->minimum_page_bits = 12;

Seems reasonable; Leif, any objection?

thanks
-- PMM
