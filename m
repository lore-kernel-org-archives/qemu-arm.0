Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396E41076371
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Apr 2026 05:40:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w7oJ4-000111-Hq; Wed, 01 Apr 2026 01:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w7oJ3-00010e-8n
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 01:39:57 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w7oJ1-0003dn-Kz
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 01:39:57 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-82c28f0a4ecso4530837b3a.3
 for <qemu-arm@nongnu.org>; Tue, 31 Mar 2026 22:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775021994; x=1775626794; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XqueuQwqQtL5mX0BN5SGNY61bqH8nYM8SRr+yt9YG+4=;
 b=vdY4tnB9qluH2xPM4AuTyyE564t1+GqyF5OhT9/H34TIs9/PM3YONuMEV2j+3Eofll
 X5UZMeFfnvQWUMgo1FbPzSuQGshNf+72sG+mX+6jAhTBNjYblCBACPg6Rfx4lZybnOy6
 vil1LcvqQGX0NsJGhAr2hqBm7oSuPiTxjfNseyoWPHc6RP5C9Iawv14b4dtinD9j9XTN
 wgVHi7N4BLp6pjc7efYhlWBhxD+McNFSO6mlztkeToHL0+v5K3iN0y6nrMfj9EwtuOv5
 DD/v9Og6i2pF2Iuy4j2vBLKy8HgZvYsJWb/W3DsRs3X3d/TaM4SVvpmS5LJY/eJH60rK
 7UGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775021994; x=1775626794;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XqueuQwqQtL5mX0BN5SGNY61bqH8nYM8SRr+yt9YG+4=;
 b=hBPwKnp1P+jsXrU28PwB3OwZefRRNQa+xGehoXnDlnQbJHwBT40TOy2ni7L8BaUBel
 x9TIOlZK8MigzSDj2OAqGxzZlhbt0sc1biTyzNFMOQleMVdnsdLYn6nUGJxtzHKElcd3
 dCUJ6N7tc41Q/eZwAjLi3SGYTfS63d7cz7KnlJFrQABzLrWb9CeDDQjF0u2t9DuF8nYC
 1CndmBprq43KnBrhZNphgNFPY+1x8vmnuyBGeLn96BnFuC1WLUigNTZZblvdm7U3NcmZ
 L//tfu0jh1eJusbA/AQXLivxhYUVoB1lZTrlKEGSenkrM2IDueCPKUpD/j88WvpMP2v/
 Le1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvWBT3lq8TcTRwcbCGTjAXPUzgPMUR0tV54hhyUjgBqePrztBDE4ohdkxADhoPcd94QWeHzfwwCg==@nongnu.org
X-Gm-Message-State: AOJu0Yxs00BOKEfqYHuld4Y5KxcFuSGtaaIEFlhTbjEBzBbYZqdVz2Zp
 IFX/3kSrT8+seZ+qTsnK4H9xaP0Q/l9ekQgiteJT0iJYB1RKum+AA5iLqmjRQ25/JlU=
X-Gm-Gg: ATEYQzzOdu9uufKw8bjqnAyIl4VUcb+KugBbAixkub5sJfEzaVuZKQDx/2hNXyT5Y/r
 63u7+xmwrMDMrMsMomzhmQSuD4jyk7kmSGUy/zUZi2TQnw2qWlY0zSc8CU2HjDAoqJ/9qNo0jQz
 e3ebAnfdFsKgEqAbJRcKfP3s0cFpq8/g5qpkxO1RflfihbiZa8c9qJ4MwdcTlv0srGYuOqVaEx5
 6A25QoJhgigr/WAMuTivVCAqUL+BLCnHDk6JIafV17SLUtSjwKGEc3l7+kSV9OitGgQVZA6ZN2v
 /eNo2Ndh4Rha2HF/cbLJs172rYMMKKxuK+yCwiEbqerdviONy2ekK5d4aj+jQnDtjzsoOy0t0XJ
 kZ4tFn37IOnsQZV+Qgi0jtw8pSzSH9YrUiWwbIZ8e3GGV3sgKuIoD7GfeH3C/aYO7aCWs0s+TFw
 tDIBg4SOYLX4nx8DX0EX59pYkl2Sf86SpOpyUlTf7FsQJ3fsW9CjZUytSHjSBRYt5OjbbosQea2
 i4=
X-Received: by 2002:a05:6a00:278a:b0:82c:68f6:a18 with SMTP id
 d2e1a72fcca58-82ce89b58cdmr2456807b3a.34.1775021993955; 
 Tue, 31 Mar 2026 22:39:53 -0700 (PDT)
Received: from [192.168.68.76] (122-150-206-208.dyn.ip.vocus.au.
 [122.150.206.208]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82cec36da5fsm1537393b3a.2.2026.03.31.22.39.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 22:39:53 -0700 (PDT)
Message-ID: <ce24436b-ce06-4f15-bcb9-4c7a7ee10c94@linaro.org>
Date: Wed, 1 Apr 2026 15:39:44 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 02/35] target/arm: migrate system/cp trap syndromes to
 registerfields
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
References: <20260320130607.2071996-1-alex.bennee@linaro.org>
 <20260320130607.2071996-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260320130607.2071996-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

On 3/20/26 23:05, Alex Bennée wrote:
>   static inline uint32_t syn_cp14_rt_trap(int cv, int cond, int opc1, int opc2,
>                                           int crn, int crm, int rt, int isread,
>                                           bool is_16bit)
>   {
> -    return (EC_CP14RTTRAP << ARM_EL_EC_SHIFT)
> -        | (is_16bit ? 0 : ARM_EL_IL)
> -        | (cv << 24) | (cond << 20) | (opc2 << 17) | (opc1 << 14)
> -        | (crn << 10) | (rt << 5) | (crm << 1) | isread;
> +    uint32_t res = syn_set_ec(0, EC_CP14RTTRAP);
> +    res = FIELD_DP32(res, SYNDROME, IL, is_16bit ? 0 : 1);

!is_16bit.

> +    res = FIELD_DP32(res, SYNDROME, IL, is_16bit ? 0 : 1);
...
> +    res = FIELD_DP32(res, SYNDROME, IL, is_16bit ? 0 : 1);
...
> +    res = FIELD_DP32(res, SYNDROME, IL, is_16bit ? 0 : 1);

Likewise.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

