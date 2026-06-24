Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C577CDB479
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Jun 2026 15:35:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcPdh-0008E5-3T; Wed, 24 Jun 2026 11:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcPdc-0008D6-U9
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 11:35:41 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcPdb-0006SB-Em
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 11:35:40 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-8453a67659fso864302b3a.1
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 08:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782315337; x=1782920137; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oyZGgmZF8KsNgLtLwsGOTMIW5evFRVfivAlqhHtBoZU=;
 b=wrOPez9o4jaHapy6Pnp/mpohyFvHVf4wZrndU1AJbIgA1GjQUaAzBZZWA/sD9Uf7Zt
 Bjjj+vBfk7qzzecUKC1qQpecoG07A5mGQjY+bP0L+1kYudxC16hCQSogHGxfEc3jIuXK
 NPdQI86YgYAQ7tY2QFHF8+uXaIFpWhw/IyLeOR6QbnWxl/mjerAtfYhjY2O5R4jntuxm
 WU4j9F3hxi/nP2VoU6O1xYh7rOvWNUQCaTR9KcneEdzCHpd0eH9jh3IFQurQ2KPjork6
 6ei0quNwbg/Z4bxwlHnL4K73WkS/1+BYNl6GBHhGtcDomUSzde6rA6m6KwduLwnUki0Q
 LleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782315337; x=1782920137;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oyZGgmZF8KsNgLtLwsGOTMIW5evFRVfivAlqhHtBoZU=;
 b=j9pnyQgGI59EKOnxSs2Jde6ZmIYaFPOE8G6dVrHDEnbTqkJ6+fn69r8wtfiljIck0E
 opzi16lN5D/bavByKeT4rfdaPD+cByJGsGVbzqX0dnjbjub/jBF2FKdgDRZcTmxpUnzs
 YJdwJKOLj50Eg3w1DRjfhNm/iqgsLS397eJvyI9mCoQYbmn4wmBVdvr8fInRsaW6RgrC
 uxyNEnH+xb3zs6VDTEl6nL78WaF5BadKveix5Ey40jElkuWJblQzO613WVMPIT0FVft9
 IEbyFhNBRbRXzPdo1u/woLroHc4pDS0yxD6sXzGYvjHtoWr55yO90mCiNTusCxwkwD5N
 Bd6g==
X-Forwarded-Encrypted: i=1;
 AFNElJ+JLz+Lo9KigYVqTA1ndLVIKdW/8yK1G/M7U5sjDBVHCGE0pJkmG8/ig7nz3VN3gOaIXnzXO1rJhw==@nongnu.org
X-Gm-Message-State: AOJu0Yxm6SJgjEPM69tL5wI1dhS+C60U5/te7cOvvLnzG9cmyi0hVoED
 gHebEiGl9kkCvueS5n5w7CppgX+VnLbGJV0w+e7eawsOw91+qSpwVx1USZRB+kkYbZI=
X-Gm-Gg: AfdE7cnIYsuGFq50CcDuGKsiGBWfAGU8yhgdURSk+5rgRQwckqTHchJuD0JqpaKm5Dn
 gko9DzYE0C8HKPkBigkdIRPaec+ILLy7joTUzfLucRtZAVbi60z74yuLxYxNBB3Nw0gnQSCZI4N
 RZIfIzSqhGn31DFkqhLHx9+VQGB4f9pxpv3RJi0yd7Y7MNgCIwepVgYQR52KBm0tn95ZGQ0DRa2
 SaBFamrLyt4BpD5EVXrd6NA+s8Zh73gShLj4mAvmXhjXB+8sWTVtAA6E4ZfeWdj3fOVrWBGR09s
 Rg+4gIsl9GyHPgJ+e0wlFWOJ7/VBMMIBJ+ryhhy79c1mCrkyn7+29123ra61H4+PioeiztdvR+b
 lBdHMHi3/HpwNMjCecPYkzeiEyIA0aXepVN03szNSdGLBqq6uIBerSPP+WSQ55g/LpG5O1riY/e
 x/RkhAxn4s9oxS3djDflnJ79Y37xNMcr5Srw6LD6nC/mboa6E3szaQOmB82A==
X-Received: by 2002:a05:6a00:1aca:b0:845:396f:5be7 with SMTP id
 d2e1a72fcca58-845a26cfbd3mr5044626b3a.5.1782315337501; 
 Wed, 24 Jun 2026 08:35:37 -0700 (PDT)
Received: from [192.168.0.4] (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-845a4120e30sm2676165b3a.50.2026.06.24.08.35.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 08:35:37 -0700 (PDT)
Message-ID: <65014f92-1da6-4aa4-9b4a-10a92db1ac71@linaro.org>
Date: Wed, 24 Jun 2026 08:35:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] target/arm/tcg: Allow vector FP conversions with
 FPRCVT
To: Jim MacArthur <jim.macarthur@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Alex Bennee <alex.bennee@linaro.org>
References: <20260624-jmac-fprcvt-v2-0-dc6cf8e512b6@linaro.org>
 <20260624-jmac-fprcvt-v2-2-dc6cf8e512b6@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260624-jmac-fprcvt-v2-2-dc6cf8e512b6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

On 6/24/26 06:37, Jim MacArthur wrote:
> FEAT_FPRCVT allows the vector forms of FCVTXX and [US]CVTF in streaming
> mode which would otherwise only be available in nonstreaming mode.
> 
> Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 18 ++++++++++++++++--

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

