Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3711369ejc;
        Tue, 29 Aug 2023 07:39:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTGH3xmgSm4j0DTp2DtI7KLbRgwGZumL25QOWYD+sZW3dnNBvHzjxTOftEjijuXu+2+sML
X-Received: by 2002:a05:620a:2556:b0:768:1db5:d9d1 with SMTP id s22-20020a05620a255600b007681db5d9d1mr31552128qko.5.1693319977826;
        Tue, 29 Aug 2023 07:39:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693319977; cv=none;
        d=google.com; s=arc-20160816;
        b=0JodW6jP1+Pf+j4jpoNhhrLKnG9F9sDFHUsxRuU4gCpl4weeF5me5GzoWDYZa0W56b
         HJMjXo+V/DXmolVoSdJddT+qOUoSYo8h5Y1BqeUPmL4iLwAWCLgqtcABoFKit3jEH0FU
         Z3GD8zCcoThPt2t5AJ/uDY1CB2TYTXGuI94E3tPx66P2sbjRTKsy8LjDWwHvi4djvuoM
         NMqBxJNTbX4jImB+acZvLKx1fOPUbCr/Hf6MTNYTk7i7Oo8u1tmO8xc/hIN3RoeyukMe
         5ObabqdiTD7bhCXjoCTtW+0oZCPfPf3umxjcBSEMHe+FamJTUSPfjxLzQQ08zaUkUWiC
         W5dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=QpepGGqSgl/CR37j9UuaeqGKMp5ps+QZ97hpG/Z0owM=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=QC5sK7lbBuiZ7VIHAy/cI9VOz0sfqADP8PYP4QHkpHGEXcyrCMPP4/t5kyg4lW7CIn
         /8kEVzCz0sCOk4ohPvuLxarCcKYBOkHe8CJ8s4G6VH2brZcaqcY/lm+pdOWRADU/Q3B3
         wvSh5kWmbLu93UsjwM0ldPQ2wBC1etiuXVm6op9zxlZ6XiQlKshROa7ZeQjJ5ZAhGPet
         bxpdiADEsVKVURahg1XQNOrDFCMGZTrTwtftqgxX6ACSoZoEVj/yPWsh6TV2T1nP9XzY
         RtM1iQupEEW/6w3Pj6PJAyYeQaID6gV3ciUqXWtiG6DKCpypTScG8GpAX0MVpgPOTr2m
         IpKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S+Xqj4e8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9-20020a05620a28c900b0076d9e089c17si6585620qkp.664.2023.08.29.07.39.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 07:39:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S+Xqj4e8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qazsR-000758-Te; Tue, 29 Aug 2023 10:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qazsL-00073p-GR
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 10:39:27 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qazsI-0001jx-FK
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 10:39:25 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5230a22cfd1so5754533a12.1
 for <qemu-arm@nongnu.org>; Tue, 29 Aug 2023 07:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693319960; x=1693924760;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QpepGGqSgl/CR37j9UuaeqGKMp5ps+QZ97hpG/Z0owM=;
 b=S+Xqj4e8GRWbyh04a7MXCzRdYQ6w0359VcQcqw6hOOGefsdXZY5EJ1vEh3+ODGKpvd
 WGl8PpwanF+LZshgr7U5BnbrnuU1effk4c1YGYs9iY+oDb5aU9W1LuMcgZrX1agqVmZ2
 /+5DGIvwyOYf/lNU1ZNkRVLsjb0C40TAsMOcPukcAsH3nKy6LbMo64ln3OMBCWdfk9cK
 rI7R0WCHz/e1qDGJqQY2VNmakFl5JeyApGJyYCzMeK/Q9p0R8LiRIYEaW1wG2HnHBp0q
 JiPl0XRPeCKuBX63s4pxESHTEAeOLe+ySYJF9wc54O094/3W8rUEY/kcD9c8lajZ2bSb
 btcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693319960; x=1693924760;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QpepGGqSgl/CR37j9UuaeqGKMp5ps+QZ97hpG/Z0owM=;
 b=PQw61Jkk413XjbBLsdBPA7Db7R/vkDCQ29og27EC1rJuAmDDxx/EUhxdZSV9xalJUq
 xzl2yKmKYwvlf3GxytH+ExrAU9D1k/76KNxtWFNq6xVwZB80MbYhLb8lAAKw1sxFWdTh
 AxbmaoAdKFImONeDn2UmWGPFiujWRg9ZlStTysLGvHUBL6EK5oymUH1PC1cTEIj7HgNx
 YR0jCIkIWygBAXdWmKTfH5P5NOF6b0+TDJ1wHD9xs0k21fbDPCvb1j209PygqQgcIwni
 xupz41g6s7zi0j22g63NQCoOCm1J09WcMEj8HbSbXYNwVuuXypCr9oQC82qnXL0HY7PO
 qDXg==
X-Gm-Message-State: AOJu0Yxm0/9q7M/bTesOadfXk17kr37knziDssxtqiVXLwz4WC44KOwb
 qut3gNoOTPj2bZJIzZ6pkrzMtS8ArCFVNmcr5scJpA==
X-Received: by 2002:a05:6402:398:b0:525:7091:124c with SMTP id
 o24-20020a056402039800b005257091124cmr22339415edv.19.1693319960096; Tue, 29
 Aug 2023 07:39:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230822170209.1130173-1-richard.henderson@linaro.org>
 <20230822170209.1130173-3-richard.henderson@linaro.org>
In-Reply-To: <20230822170209.1130173-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Aug 2023 15:39:09 +0100
Message-ID: <CAFEAcA-T9FLFXr9XVc4a_9ddKmrXJY69YvU7MkcLO389QwDUoA@mail.gmail.com>
Subject: Re: [PATCH 2/3] linux-user/aarch64: Fix normal SIGILL si_code
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: d0KKcJerxWHn

On Tue, 22 Aug 2023 at 18:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Most illegal instructions use ILL_ILLOPC.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/cpu_loop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
> index 2e2f7cf218..22c9789326 100644
> --- a/linux-user/aarch64/cpu_loop.c
> +++ b/linux-user/aarch64/cpu_loop.c
> @@ -110,7 +110,7 @@ void cpu_loop(CPUARMState *env)
>              /* just indicate that signals should be handled asap */
>              break;
>          case EXCP_UDEF:
> -            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->pc);
> +            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->pc);
>              break;
>          case EXCP_PREFETCH_ABORT:
>          case EXCP_DATA_ABORT:

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
