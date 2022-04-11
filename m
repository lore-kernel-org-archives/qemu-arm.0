Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1622603lfq;
        Mon, 11 Apr 2022 06:28:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxS0PGk7pM+OJY8r6eXGWV6Yv8/0D+BbQETFpnCWF0JDdDmYhM7/NLqbXorYvXR7yAnIas4
X-Received: by 2002:a05:622a:1aaa:b0:2e1:a40d:8253 with SMTP id s42-20020a05622a1aaa00b002e1a40d8253mr25661976qtc.135.1649683707676;
        Mon, 11 Apr 2022 06:28:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649683707; cv=none;
        d=google.com; s=arc-20160816;
        b=sg24OHbPDdPiTutiNtMG5TVZKuTQOB/i/IuzK3seTnG2/PN/cHT/VQhF5ApMbmdPYE
         E3k0tFGshiXZGLlNtRE+v4ilneW6GO7jDRtvh64dlN28VHujmu51UJBacUt6j+txrrcG
         Hs7q1tc2etktt8KTtbh8ZeRu2QNUzJkHGqRpDrQuKHd0lXHRtB09xapV5Rz1R9qDzFhN
         rSwFpm0x1LOHjGMyRcI7xQ0fNl67Ikv3gLUjsXRgj7buDCQ6/vEsy6Jl4aEuMJLr0ZAW
         DZQegnht7oA5S63Lcuw7A0i0hewpb3wY3bwQLxZ3LKg0lE+Qi6UksVwcaAxywMRAR5Qk
         Gb+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Epo2ERKbOm4RHSL9/kKh/72aj5Dko3zjQ6Gy9qpXIos=;
        b=fYNZdYJWM+cLJQkZmWFRIUF2dHRZT9M/gRQEwOTe3vo8EasW3X3G/sJCVjmVIpT6JL
         EBJdaGwJs5DOQC+iEDkxL4QXOOT575NaJcCAzb7zappuApp6CMNM31GSll8uFhx5GG0q
         XgZSLgvkfrjYc6UJAOVaMF97X9AlG/ZJZePTHtnrYV8VZr0J6BdKYMGwG7Ikfg4vHczc
         Ot03tnM8mLSHiDAVm87MciWK1NzxPnpV/yeePb41s3jo68LP4FUzCwMJgoeyaohU6Z0R
         ru8PhiwuPfMxIz5cJzKo4NpEYLQ7O77v68qtheIhEXTJq80qL0MO/Vzp+ZV0XVfjrEun
         YaGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=l2eumJSS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b21-20020ac87555000000b002e2058adb69si4106411qtr.415.2022.04.11.06.28.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 06:28:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=l2eumJSS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndu5j-0002AU-6E
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 09:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndu5P-0002AF-GI
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 09:28:07 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:44606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndu5O-0008TQ-2V
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 09:28:07 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id k36so5783787ybj.11
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 06:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Epo2ERKbOm4RHSL9/kKh/72aj5Dko3zjQ6Gy9qpXIos=;
 b=l2eumJSSqfSGOOGVJOCu5Nw2Fvq/yhr1I/QsLL46qP/+Gm6FI7luW/IYEZ5jUkydLw
 tWk3kewbPsbxoCvJX9ZsreuIvaoWBHAIjQlqyLDYaRN/F80pfhYJH1t4QqTqpUHT9onz
 K1X4apg6YHd0YbkWZwmATkhcC2zGE1R1w3JixS0EH1Anz3QTtc2n0y/BpBcFnfxHZ8Zs
 m39dzd1RKH1dGsEub6lfGnTOc+2oL4+cZHJga+BT3aR9dkxU06jYeRESBbkjaB3OwYS+
 MgxwRhv4jI9c7AYuDOyIkyKHpVSw88w+g7azSdQlhm1JMI7E2JMO8Ys/Vllm98MNRakS
 qX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Epo2ERKbOm4RHSL9/kKh/72aj5Dko3zjQ6Gy9qpXIos=;
 b=455VECU5L3LPUxTU0xGanZBObMIXD3RyVKPeSfjRn5gq45liVNyxQWOp3Mb0pOSJHw
 +t6BnHCNrrI4dVHcsgMkSxaSwb5mfGSbWH49vVwmahrmFr8NDlsN/onQquCnEOppPe2m
 tSgSsDhEKMljp5PZGSiKrcDqDc8AnraOnXRGVY2GvznExgzHGjtn7DTenHsvm5002YDm
 7ss3yNC6mCW9BHZhiKVEC/PerqwOJWbf4ZctY+E4GnpiXqCBjZk38WbAC8hbr4iFXjgH
 wGddIRCxVF+1Vgkfh7E0XGFvVAnUjPBUwgkireSbO6qR1W1OY95eQKzZ9kvJSSZxyCQ1
 cIZw==
X-Gm-Message-State: AOAM531eLtQGMtBDrGM6ajr0JjMm4Tdbrj3QTRdBzsiIt53tlf3swlFS
 tNQg8DRqxBzRC57NNPkc8x9Ks2qRnQjnRdNbIW4mbQ==
X-Received: by 2002:a05:6902:1502:b0:63d:4d6f:dc1 with SMTP id
 q2-20020a056902150200b0063d4d6f0dc1mr21934635ybu.140.1649683684632; Mon, 11
 Apr 2022 06:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-10-richard.henderson@linaro.org>
In-Reply-To: <20220409000742.293691-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 14:27:53 +0100
Message-ID: <CAFEAcA93NoE8F2DaRvNXUB2Oa_4RgWkY8mdYZLNMqxZU79rUHA@mail.gmail.com>
Subject: Re: [PATCH 09/16] target/arm: Enable FEAT_Debugv8p4 for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b2N1b1jZTs1b

On Sat, 9 Apr 2022 at 01:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This extension concerns changes to the External Debug interface,
> with Secure and Non-secure access to the debug registers, and all
> of it is outside the scope of QEMU.  Indicating support for this
> is mandatory with FEAT_SEL2, which we do implement.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu64.c   | 2 +-
>  target/arm/cpu_tcg.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 6b6422070d..f20fb6d9e1 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -854,7 +854,7 @@ static void aarch64_max_initfn(Object *obj)
>      cpu->isar.id_aa64zfr0 = t;
>
>      t = cpu->isar.id_aa64dfr0;
> -    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 8);  /* FEAT_Debugv8p2 */
> +    t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 9);  /* FEAT_Debugv8p4 */
>      t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5);    /* FEAT_PMUv3p4 */
>      cpu->isar.id_aa64dfr0 = t;
>
> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
> index ac91bbea9b..a443e8c48a 100644
> --- a/target/arm/cpu_tcg.c
> +++ b/target/arm/cpu_tcg.c
> @@ -79,8 +79,8 @@ void arm32_max_features(ARMCPU *cpu)
>      cpu->isar.id_pfr2 = t;
>
>      t = cpu->isar.id_dfr0;
> -    t = FIELD_DP32(t, ID_DFR0, COPDBG, 8);        /* FEAT_Debugv8p2 */
> -    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 8);       /* FEAT_Debugv8p2 */
> +    t = FIELD_DP32(t, ID_DFR0, COPDBG, 9);        /* FEAT_Debugv8p4 */
> +    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 9);       /* FEAT_Debugv8p4 */
>      t = FIELD_DP32(t, ID_DFR0, PERFMON, 5);       /* FEAT_PMUv3p4 */
>      cpu->isar.id_dfr0 = t;
>  }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
