Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1BACD8CB9
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 16:19:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXLcX-00022a-P3; Wed, 10 Jun 2026 12:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wXLcV-00021K-If
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 12:17:35 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wXLcT-0001lD-MB
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 12:17:35 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2c0c3546924so46716205ad.3
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 09:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781108252; x=1781713052; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jQ6eBmS4m9+eIVxpKApBcTK2xl/OEnuu93Yd4iL+9CU=;
 b=ZTDo57CAH+OCM64L2duJlnbd7aOCcwZeFQO+EAQXHfBR2ZP04Uk40UI+RddvIP8Mti
 gx2qz3chZcD4zXgiD9SOz9CKOqWsdcaDPYTr1ELaSENGv+k2sA5TrGVCMMhdglQ6SE8U
 6VAoU6uLwcwMX6CV26aCzigupWbi5WtlvYtQlzDj0lod8ylh1hM0CtyZlbm+aVClSnkH
 RkN2ZtNhbR4zYtuvO7FqH9WpTSkek7iQbLO1UkIlwu4vhIDvwlR2zIlqgd+YbJrHA0dh
 BKDrVr0HzGyMPoPHOBi9hFBkVcqn+jm+0YoUWWFofscWhRITfAa9mlOFlfbna8S/N0Np
 uN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781108252; x=1781713052;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jQ6eBmS4m9+eIVxpKApBcTK2xl/OEnuu93Yd4iL+9CU=;
 b=cE5KRuXsFsAnStlPnC3cIdHja4WuznQhhqZOjT4JxTjbEWOFJ4aK9wZM6oYLdZRcCd
 bVV+Puj5H2NnAXLd18LJigmZM+TPMgD/IzT5Dts2+HpCYv00ihBrfz0Y11y1Lst0FaGN
 Y6RtEvftIozvvHxsavHetD21KZTRB3mkmRo64V7THS43FzufHOLPMaOWTlkgcgAuvrzS
 Xt2IM1CKVaqb9opNGvIgI74g4zBfdDVAZpv926UhccTKdaayL3ARiV5F9uSItCYVfHz2
 BopqcGOvzKyTsrhhKorz819RC7WwYIdBmNujNC7ZU5m4X3cMMsP+zATrZPwGjFYa3s8N
 jJYQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+NaD4Ntceg+ohyM68PxlEcfCwRxWZCywfY3rJ5/aWiWAVpzjlZDAQNq59cuzJT2mTpSd7ngooKmQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxz0x2oussg3DgHpkW137QZg3IScmhuomp6yJg3YMTWmC1zOqkT
 +Pf7H0YFYrMcXv7gv01ZDdecme72SLrvr5pAz7gnAmgc3SI8JB9IHMLAKz2o8A56JrQ=
X-Gm-Gg: Acq92OESSrWPB8dj9AWsSc/KIdKH3cUfAnuG6MP/E/gv1HCMkow1QPBA48dbdGp2Nsp
 zbpN9C+xfPYI0ZRGgMZdY63u4sTLdVwNXL99Rd1aA+EGcrUD8n5iLVvAKYsTUQdTIpoBb29BcNN
 oZAqUowiWV1JSKj7f+DRDlwP5lX9fG9Vw1dSB+CDImRhUAV3PA6KeOhrdshQgOP7dTndZ5ONu9C
 cSWoQWNHfohj0OYD3f50+ZJYS9NFHYpTx9rzGoZs46PQSF1c4XmflH7L0X2KyOAgsrR5632tHFv
 gqnG2NjdiFe3llaoMhnR3se9OsEDMGfuI/4jmtgneslA6eYspF8rjxLCNeQdojsrHzy3ArcM6ge
 qYmUOf0rNdT05hgjJY+/IvX5iZndXMEkHvPCsFFFOs+3ayYgoX72gpIbFXl7WyVTfJfbdzXZbg8
 rXmtfcA3Dhl5ANrlHfCcWr4pnReugaSRuH6GViPxTRK79syGM=
X-Received: by 2002:a17:902:e78f:b0:2c0:a373:89bf with SMTP id
 d9443c01a7336-2c1e80f9975mr288427405ad.1.1781108251634; 
 Wed, 10 Jun 2026 09:17:31 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c2da386d07sm367725ad.62.2026.06.10.09.17.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2026 09:17:31 -0700 (PDT)
Message-ID: <07fb4b71-623f-4106-b85f-801902d0e9a2@linaro.org>
Date: Wed, 10 Jun 2026 09:17:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] target/arm: Setup new registers for GPC3
To: Jim MacArthur <jim.macarthur@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20260603-jmac-gpc3b-v2-0-115c51936962@linaro.org>
 <20260603-jmac-gpc3b-v2-2-115c51936962@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260603-jmac-gpc3b-v2-2-115c51936962@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 6/3/26 11:26, Jim MacArthur wrote:
> Adds GPCBW_EL3. A custom write function is necessary to flush TLBs
> when this register is written. Also allows write to the GPCBW bit of
> GPCCR_EL3.
> 
> Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
> ---
>   target/arm/cpu.h    |  7 +++++++
>   target/arm/helper.c | 19 +++++++++++++++++++
>   2 files changed, 26 insertions(+)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 85552b573c..9944dc9727 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -546,6 +546,7 @@ typedef struct CPUArchState {
>           /* RME registers */
>           uint64_t gpccr_el3;
>           uint64_t gptbr_el3;
> +        uint64_t gpcbw_el3;
>           uint64_t mfar_el3;
>   
>           /* NV2 register */
> @@ -1228,6 +1229,8 @@ void arm_v7m_cpu_do_interrupt(CPUState *cpu);
>   typedef struct ARMGranuleProtectionConfig {
>       /* GPCCR_EL3 */
>       uint64_t gpccr;
> +    /* GPCBW_EL3 */
> +    uint64_t gpcbw;
>       /* GPTBR_EL3 */
>       uint64_t gptbr;
>       /* ID_AA64MMFR0_EL1.PARange */
> @@ -2098,6 +2101,10 @@ FIELD(GPCCR, NA6, 27, 1)
>   FIELD(GPCCR, NA7, 28, 1)
>   FIELD(GPCCR, GPCBW, 29, 1)
>   
> +FIELD(GPCBW, BWSIZE, 37, 2)
> +FIELD(GPCBW, BWSTRIDE, 32, 5)
> +FIELD(GPCBW, BWADDR, 0, 25)
> +
>   FIELD(MFAR, FPA, 12, 40)
>   FIELD(MFAR, NSE, 62, 1)
>   FIELD(MFAR, NS, 63, 1)
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 9dd8fdfa41..05fca2a271 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -4993,6 +4993,10 @@ static void gpccr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                      R_GPCCR_SPAD_MASK | R_GPCCR_NSPAD_MASK | R_GPCCR_RLPAD_MASK;
>       }
>   
> +    if (cpu_isar_feature(aa64_rme_gpc3 , env_archcpu(env))) {

Space before ,

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

