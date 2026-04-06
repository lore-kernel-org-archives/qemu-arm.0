Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1764E9D82F
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 03:00:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9aCH-0000jU-Gc; Sun, 05 Apr 2026 23:00:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w9aCF-0000iT-Qy
 for qemu-arm@nongnu.org; Sun, 05 Apr 2026 23:00:15 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w9aCE-0005Jr-22
 for qemu-arm@nongnu.org; Sun, 05 Apr 2026 23:00:15 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-823c56765fdso1678105b3a.1
 for <qemu-arm@nongnu.org>; Sun, 05 Apr 2026 20:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775444410; x=1776049210; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jvg9WPTn9JS4NULEzSmYzeBGSc5qvShIbDaAIH8k2nQ=;
 b=Yc9ezDsXT4YS66UfjepMCfJ1LTC8NO11tl7jMKyQCaNPXP58cJ+9OeD0yR3QkzWXI2
 UW3lxnM7sX4ftxKakSpQgbHYnWMA8v1G+s0/Z7OlGgjm6vniufbbCEiS3yi4SBnPA/Dc
 pEkP5RN4iOcnrK9jS4426UJxSQATlid2MNYaVc0SZf80qp3Dze9z7zHICp+2mOlk3Ssh
 +MTMuyZgbHVIvvuRpLSwbpkvJ5+AOQD9IKOXb1ax/PQ2ldZz3yiOH/9hq8sn+jSd1FWP
 Jgks7jUfs3o0tpNsSwpH4fjOf6jsxgJ4IGyeUtFuagIp3L99rzNphq6CoRZ2izsfE3Hz
 ojwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775444410; x=1776049210;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jvg9WPTn9JS4NULEzSmYzeBGSc5qvShIbDaAIH8k2nQ=;
 b=dR4T3JT7sdEn83UUfu00nCt9nMK/h5O4ZCeB+eT2AoIFTRHLPZH/ZKYalSi7TN0vvY
 lDx8630sTrRkEMv0weaxSzyWnehiJKIXEdTtJK2sw6YeK5RPVqnlup67ezZ8nYFyQQni
 mmcRY2BJldLziH+vtih53JN3zRrTSdq31JJhRtHdWwmuTfX5JsBK2q9G5AYKDACkTbG7
 2Z5gqQP4MsBiYlkLz2bl8bDdkFYzlRUF/oGWIWS2tRElZmO2SyLFQtrK8p+JQ6lMWN0T
 a3Ym3hZTHHzHiB1cZBO35+84TaXiyCsyp+oshG9j2YwEsFBc5cYqZFx8JwmuK4+Tl5qB
 L3PA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVc9uJ3Uv0Ya2wVmSqLTv6OIdKy7oAwe4T27DkNy9acd/63mb361qRLuKikFPYEfo9m7obPn/fWsg==@nongnu.org
X-Gm-Message-State: AOJu0YxsL/htFL8CF9xUPXgA8kEmGGh8sovDvoiktwRFEjrP17ZXQXLV
 HZMga7iTvSHNBGnroMFM8aKZ4gHkeOK4Zi8sx7YPhVl19Mc1zGVw1yyuYSZHWVfB+1M=
X-Gm-Gg: AeBDiesV6Y1uaKqJO+GcOpt/DLCtyVQb9wb6tw1ul04rZvAnN/YySro3j/HORQ+wAXb
 GAZlM1ifptVGhbwhcqO9qZn+7Q+l7gu0jdWJD8f80ZyJk6edYnPZpWw7nsedJSEAgXVTcrrwpRl
 LQcEuhJpP2i0jv4/cOK1Elgg6NyU38VCDCNmfGuR/O5cD+FKoecA6MmylGmkP5APmuCbArH6afQ
 bgdwNBfTs+6T/hVaZ+Zf15inhnMNpVt9wRgghOXD7ImNhZ2cO+mKov5wWSQGVNQTVpXSM0AaLid
 X5gL44scBFxVzHgvwPY5DzvQECDKX7pIvnxw3EMj9VJkignkbNvKUHq3bjgGOW6yAkK3YidA65U
 OtgYThUsT1whW773wE7XSO641suwC19rithHIP7FO20HlJCOqSL2KlFd6W6uRCnNt6s/1seab1L
 hjyTbIqEQfr71kKCJzsw90ZXYAwLziO8nCG/Hu84NU+p9j2cw3DJgQ5mCLD6hYULXz+W0=
X-Received: by 2002:a05:6a00:1406:b0:82a:7dfd:9757 with SMTP id
 d2e1a72fcca58-82d0da44b00mr10089236b3a.4.1775444409878; 
 Sun, 05 Apr 2026 20:00:09 -0700 (PDT)
Received: from [192.168.1.105] (124-150-69-109.tpgi.com.au. [124.150.69.109])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82cf9b3dcb3sm12170536b3a.16.2026.04.05.20.00.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Apr 2026 20:00:09 -0700 (PDT)
Message-ID: <fbe27b77-b369-4218-8354-4b5d0d5db139@linaro.org>
Date: Mon, 6 Apr 2026 13:00:02 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 28/35] target/arm: ensure aarch64 DISAS_WFE will exit
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
References: <20260320130607.2071996-1-alex.bennee@linaro.org>
 <20260320130607.2071996-29-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260320130607.2071996-29-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/21/26 00:05, Alex Bennée wrote:
> This mirrors the logic for DISAS_WFE in 32 bit world.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
> index 073454b9195..d79c8ab431b 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -10917,6 +10917,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>           case DISAS_WFE:
>               gen_a64_update_pc(dc, 4);
>               gen_helper_wfe(tcg_env);
> +            tcg_gen_exit_tb(NULL, 0);
>               break;
>           case DISAS_YIELD:
>               gen_a64_update_pc(dc, 4);

This appears to be wrong since 252ec405768 (2014).

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

