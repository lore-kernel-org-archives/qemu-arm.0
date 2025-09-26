Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2476ACAC5B0
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Sep 2025 00:45:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1wZi-0007US-SV; Thu, 25 Sep 2025 20:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v1wZf-0007Tu-Kk
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 20:44:35 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v1wZS-0000tp-CW
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 20:44:35 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-77e6495c999so1729153b3a.3
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 17:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758847451; x=1759452251; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aOQ2on0sdHmvkvs5kV3n78531hzg3jHGKjG2QwgxWVc=;
 b=s9xNxoYMn1Xaq4L9dGvhppEnFvXgHCFHgC3RyMixEAE+ll6NaE0cjMHE6pFc1h63VR
 i35CmNheXB30TCgPba1i59l5TkBw6xFVmenTpR6QBd8+MwCGk6Hk0VUehjRLqfeVaE0t
 /6/qjKpdWOVpefei/EV+Ag7ILyPKU9GyXv+erA+lQ6we3O4NTJ8Rm2FG4Vv5Zaxcn+NA
 +80uYxKrgmTamV4mBr5KysWZL0iIxT6ESD+atUHMJQldMElGQ1Dw/mU7SYjXRqpw8ut/
 Pp1i/DcVIjtU8eRovA59+7bpfGOTw/6LWQAplOIrSIMYIAwgSuQIg1Ipp3DYN14fFTvA
 XFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758847451; x=1759452251;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aOQ2on0sdHmvkvs5kV3n78531hzg3jHGKjG2QwgxWVc=;
 b=JzXHF6IgPem/1LwXIFontmmHmAAiAsapT2r2JU1RknQLmkIso5skdhH9kFHCAHjghN
 XAgCkVPoyoKZwJprdG/DCiqgg/vk7X7E/vbreM/FIjmExz4mRvEEo70GHverXDyd14E5
 +5QqlP/5OQl5NstUHnxT7OfwTm5IsSEteb+KPsTvTyIKKIKCYQWMBd25mFwEeM/UW9Ys
 jmlY1BHg+mvR9U/73bZ6jVh/4/iK77eDqR13TP73ZgMKEGsHdVNBz6HDs1WTtK3HmvWs
 xBvSmzJXSPZNVSMpvf95vC3bEpGgFHAC1uZ4/+ToI5uMfUDIVyfAioIT1ZHNxVu8BCxU
 bOUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM0l1MlQhjro9267QHWt4GPd+FhFJk5gYX6OP3NTXud2NQdtqEpzdAntRJ2dRF/826iK5rsFh88A==@nongnu.org
X-Gm-Message-State: AOJu0YwX3g6v5ExXZ/F1B5WBTYyAKb5Cf2enbfMGTv5OLVez0Dvo7wLo
 Yb8TMO1pcdBVB7prkYX/H/UdHzXVZBpGRQbax8urn2dgzE0Zo7i81s12BfRuam/U72E=
X-Gm-Gg: ASbGncvlrCTPs+bT0Awm6CJ+4x1WvKrgolllLoCg1cogA+ujTl63RrkXmsBq13OIVIF
 X+NnCVMaC0l3Yx2IuXhLjLUmLWnou+HKKTip++34pfsypub54Y6c58IPNo1x+UQPwAOH+q+U/ar
 FaobRVz0aRMvA4b2lgTEPTpmxNROF/TOpDzA4kToSCr75JDNHrElf7Cu1JrjzPZcSBve5Cj2YfX
 RhFrqUFUAoLeJY7VRuJcqChJBpOhNN/xzHekpyBHQD3hsa2DV9mznl13Mh0EZ+Hc/vGEch8G7Bn
 NEZKWQGSa7fsleOD9m8oqsmZdFa6WZSVYgickN1iHGikbFHIWvPFJcf5lc70Iqi+4r6CHp57Vr+
 CB6ZlavA+IycG1UJAsyQNTQO6k5IpTogcSgaL
X-Google-Smtp-Source: AGHT+IEbePRjOkGDneGHqZXxVcGYjNNtyohHWF/XopAofqSBWE1cF+FGHKuqH3H2oV6KaFq37fG5Zg==
X-Received: by 2002:a05:6a00:2e98:b0:77f:620f:45bd with SMTP id
 d2e1a72fcca58-780fcdd2201mr5708373b3a.7.1758847450665; 
 Thu, 25 Sep 2025 17:44:10 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.132])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-781023cb369sm2981427b3a.40.2025.09.25.17.44.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 17:44:10 -0700 (PDT)
Message-ID: <80a57c75-cd17-42e4-a678-aaadb6a47a92@linaro.org>
Date: Thu, 25 Sep 2025 17:44:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] accel/tcg: Use cpu_is_stopped() helper to access
 CPUState::stopped
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, Mads Ynddal
 <mads@ynddal.dk>, Alexander Graf <agraf@csgraf.de>,
 Cameron Esfahani <dirty@apple.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20250925025520.71805-1-philmd@linaro.org>
 <20250925025520.71805-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250925025520.71805-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 9/24/25 19:55, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   accel/tcg/tcg-accel-ops-rr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
> index 2fb46439971..f84342e0449 100644
> --- a/accel/tcg/tcg-accel-ops-rr.c
> +++ b/accel/tcg/tcg-accel-ops-rr.c
> @@ -197,7 +197,7 @@ static void *rr_cpu_thread_fn(void *arg)
>       qemu_guest_random_seed_thread_part2(cpu->random_seed);
>   
>       /* wait for initial kick-off after machine start */
> -    while (first_cpu->stopped) {
> +    while (cpu_is_stopped(first_cpu)) {
>           qemu_cond_wait_bql(first_cpu->halt_cond);
>   
>           /* process any pending work */


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

