Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2879665ejb;
        Wed, 4 Oct 2023 12:22:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhjRxYumgC73en3v+0AygqpLNIHI1aSbXOT3EuSjvs60Pd7/65jlorGN5MYtLMe7QlKnvM
X-Received: by 2002:ac8:5b09:0:b0:418:16d6:5a8d with SMTP id m9-20020ac85b09000000b0041816d65a8dmr4189824qtw.19.1696447346558;
        Wed, 04 Oct 2023 12:22:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696447346; cv=none;
        d=google.com; s=arc-20160816;
        b=mniV8IYs6mbuAkBtP1ey6loZcpy2JU5PWPfhHGnbR9ircEhxd7MO5wwwEcsrvlZuUb
         65APnA5QOvz6Imva1tHdg6ihsms2ce2bf/yLTTI8sX9EZM485s/AthJHSZGVeZ7nCuMy
         QQ0o0UVOUbFV3vbTwMdtsMputs5qxwUN5xIkxSpmZ6ux3ZJUnrhpN56eKWjTJZ9dUqbm
         Z6ENDN0aTisoZEGxDUuXc+DPuQsQkkCgU2CsNziqdca6KkEiC+L0scYTNflb9xFbu3jx
         qG1zTDMpZIYli1MgqYeE+AyHLpcBW9Sax1iW0Ee6rTGLXzzehDYFHLTuqbxX+D3gveoF
         yYxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=7/FXvH4AVeLIX4JBWjI7WQhiI1KBXoKB/o0+b6JzizA=;
        fh=Iqw+C3zUdjRbqvq8+6x0+40nrEuEq3eUeL/fW1XE9rM=;
        b=0VnvLOF/mXQzGMvfNNXNAlTS08mi7g6NORXCbgHJ0aXOLqhGHtdmctECBJpfX+PIlN
         aJCsZH4X3+xQXP5OsW6gNa85C4o/j+9RC4pIpwzQOrlEE49MZTqqgZfE2tfYarL/LCGR
         RdK4AIonkHhVn4PV/HQ+BFeTmmkpYKgHNky7bfjCjZeymv3JZ+eGfuBUz7a/mDi2EOez
         l9gxqQJ/5qjHZdad0B1OLBDHSy9g47hi7gAqDufVMtJI9Urrp0a1rQhJ4gG/idmeRXf+
         EbGSVQmMiH2R2jBJIZkaxWaNPsYMQ0EpVQ+lq2iADbEFRD4xsRRuZqHHJWBGHpblvDaE
         k0fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=jvHFkOjN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10-20020a05622a044a00b00410a29261efsi1809476qtx.287.2023.10.04.12.22.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 12:22:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=jvHFkOjN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qo7Ro-0003Yx-7V; Wed, 04 Oct 2023 15:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1qo7Rl-0003SU-CU; Wed, 04 Oct 2023 15:22:13 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1qo7Rg-0002TI-9K; Wed, 04 Oct 2023 15:22:12 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-504a7f9204eso234096e87.3; 
 Wed, 04 Oct 2023 12:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696447324; x=1697052124; darn=nongnu.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7/FXvH4AVeLIX4JBWjI7WQhiI1KBXoKB/o0+b6JzizA=;
 b=jvHFkOjNnTnwV9vJ3BDhc8fugyevOcuLIwfHyj/8zR67YefLLPdj/9414XuHWFJiv/
 LIcyAAjNBOOMfKKK1RZOBOOlhSv5RlXX9i+YB3JIAfuFJunwgQWe5ycdghs9N5NAbTg5
 eb6AEsGH/16T4QUacAWQPnr2lZWyFwee8MG4IU9goJyaTCElb5gvUl/zsnr19CLUMjtw
 af0jnQxcq8YHqAMjWZX948TBEMY1UupbvDlzTt4OcoABJNHwjlwnwkhcYeWYB7LtqY/I
 JXnnBRF2DebOSiBf8talSN+jlOWz15lXukAH5SFagBfdWxgoyipm3f4vb4cEfjBn+o7m
 nRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696447324; x=1697052124;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7/FXvH4AVeLIX4JBWjI7WQhiI1KBXoKB/o0+b6JzizA=;
 b=fvoGko9DyPr6m+yABfEDCXmfWPQSO54C2TNezchiyySz7cdLU4F1lnIw87YrxosHwF
 aJp1b/rk8UgHlFHhPrhPHtQv0oBGtdadA5mhFVtRKHqOIYaOUAeSzfv35Ec4DkSgPbtB
 pMQZ0r6BAjZXUE7D9Ujxhc0yoqr0RNdtKYSavqMwsSZTbEDBDEV/EOIeWB5TejauJLIw
 0WclXBYSFLzI4GoSNb+Evmyb9G0qeuEtq7Ns4J4qK3Gi3IoeEUtp4+BxlzIi3GkUMWZB
 ICB81iY1b0ECUwkaJ53XNU9cB3j2ZsuWyBy2fAjekmA4UWik8RjLLctvmqihwKABY43M
 +5vg==
X-Gm-Message-State: AOJu0Yyt79nAI03L1jWaFxecL+Jq+u7b+s6ClwHIKK6BC8uDW0pzJH/v
 ituMkw1T+S8xEpFplk/F2ks=
X-Received: by 2002:a05:6512:3095:b0:503:2a53:7480 with SMTP id
 z21-20020a056512309500b005032a537480mr3187139lfd.49.1696447324370; 
 Wed, 04 Oct 2023 12:22:04 -0700 (PDT)
Received: from fralle-msi (217-76-87-243.cust.bredband2.com. [217.76.87.243])
 by smtp.gmail.com with ESMTPSA id
 c22-20020ac25316000000b00502d7365e8fsm715351lfh.137.2023.10.04.12.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Oct 2023 12:22:04 -0700 (PDT)
Date: Wed, 4 Oct 2023 21:22:02 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Tong Ho <tong.ho@amd.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alistair@alistair23.me,
 edgar.iglesias@gmail.com, peter.maydell@linaro.org
Subject: Re: [PATCH] xlnx-bbram: hw/nvram: Use dot in device type name
Message-ID: <20231004192202.GF18959@fralle-msi>
References: <20231003052139.199665-1-tong.ho@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003052139.199665-1-tong.ho@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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
X-TUID: nE2G5GIGG0Lx

On [2023 Oct 02] Mon 22:21:39, Tong Ho wrote:
> This replaces the comma (,) to dot (.) in the device type name
> so the name can be used with the 'driver=' command line option.
> 
> Signed-off-by: Tong Ho <tong.ho@amd.com>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  include/hw/nvram/xlnx-bbram.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/nvram/xlnx-bbram.h b/include/hw/nvram/xlnx-bbram.h
> index 87d59ef3c0..6fc13f8cc1 100644
> --- a/include/hw/nvram/xlnx-bbram.h
> +++ b/include/hw/nvram/xlnx-bbram.h
> @@ -34,7 +34,7 @@
>  
>  #define RMAX_XLNX_BBRAM ((0x4c / 4) + 1)
>  
> -#define TYPE_XLNX_BBRAM "xlnx,bbram-ctrl"
> +#define TYPE_XLNX_BBRAM "xlnx.bbram-ctrl"
>  OBJECT_DECLARE_SIMPLE_TYPE(XlnxBBRam, XLNX_BBRAM);
>  
>  struct XlnxBBRam {
> -- 
> 2.25.1
> 
> 
