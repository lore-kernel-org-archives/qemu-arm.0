Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp100613ejk;
        Tue, 28 May 2024 10:27:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWmTOZGYzE5h3Po5HMpOp/+XFDDojgjlgg5NhDlaK3Lgv6dkJVkqa/9VUV+7Wv6odeCgqv7IqXMy1h6qWn2TvMefOTUHNmq
X-Google-Smtp-Source: AGHT+IGeY2k2SZmMCpurExoizbXgS0Erk7s5qNUPS8eb+cICuvTJyYb/xqlnpEYfOmNBQGgKTFT1
X-Received: by 2002:a05:6214:4b0b:b0:6ab:6d0b:eceb with SMTP id 6a1803df08f44-6abcd0fb626mr180601276d6.37.1716917269422;
        Tue, 28 May 2024 10:27:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716917269; cv=none;
        d=google.com; s=arc-20160816;
        b=R4BDJ7osoauIvotKQOWEmHiAviPcXa7nr4NHTIpJJCyFWpy7NL4kp1sGZZA9P/PhIE
         iuvN2ztnfrzpToz/Mr4C6RECm4CozRdiy2KGVanq92IS0PK9s/Vfb0Wt5hXSprR6Qab0
         QqpCHDy4QLS2OAmmHyTTFbqiheKIjttVQgt++DgzXyExUZxYtQo70B4k64fyT4eVMHci
         j5s2wwIZ4fcXqgFD8jfhcncQLzWXtZQaRZqYHLqFxmJxbqXG+HQyR3Y/fxA/6OaEqY2I
         kI8fbRf5gaMVcmSna4EvNIX1X1G3O2ofJExO7c0zZ7vwaiGyAgYB6Ncd8KsztTF6SOx9
         LUgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=6bBlwiUJeQIH7DSXgOBC1Z5vxVVOeQRW7eyy+qteuh8=;
        fh=cy/p4ehKyAYhgbXf0B4vE3acaRiVXEAVEF8IVW9cy9o=;
        b=W2DPHB8H7//5nWNyzGSjfAuZBBkabdayUaYC5up/sMDCUaEaYdjcxe5cl+v6U4Nk2H
         nnV5/Jrem0U4twSB73yvfNbJGFJAEXe3+3AMpnjAieIJpxNvLVK4N/aa3iA5B+TC1k6g
         XrrTAronBaI15yyqBBph9+TZM2bCUrFN1a/HqV+yrwXkdhMKKvqqaBsy9l9NeBxzCKfX
         h/goeA2+IR8gm4gxM9kYXh2oZRNUjPlJT/NzhsZOCVoq3/udvgp0/vJxfoX9Axmse83N
         0qmLXr8lomr2GiPncqwpR9pQ+/r6CMMaESTWKqiRPz3TlhVCHH6L58RLMh4TFnYh/BhM
         Bqig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xEBBeb8P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fd794c410si26534181cf.270.2024.05.28.10.27.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 10:27:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xEBBeb8P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sC0bR-0003ez-Vt; Tue, 28 May 2024 13:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC0bQ-0003e6-IS
 for qemu-arm@nongnu.org; Tue, 28 May 2024 13:27:12 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC0bO-0002mS-Cw
 for qemu-arm@nongnu.org; Tue, 28 May 2024 13:27:12 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1f32b1b5429so7905635ad.2
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 10:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716917227; x=1717522027; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6bBlwiUJeQIH7DSXgOBC1Z5vxVVOeQRW7eyy+qteuh8=;
 b=xEBBeb8PK6VMNFWsHWSGFNAVMjyuQAvfgdqIjt7tKDXAmcJqqTQWKgetH9WH7U6T+A
 JvTYT4cUM866fNJQSKtRNZMljeP2VGJwxcWV13ACate/9pHSzJup6zmfe8rZmCxRAnXw
 cNB6wrBSlTXUAFWo6SfiU7UbyDmDlWp4C5dGJXkjqYB1UY9YMK2dYELuQiP6bN8VE7r3
 4DfyEc9kTrzzEc37HemVuGXWaSIF/aN+jZhNzhYG8FJirXYGKjPmY0jpZOcDgmDTobUk
 gHi5aCL4xq7wFRbHZPH9FiEGae4hOFQaLbFkhtuK9iB81yVnHBjKUVzEcKJ0OByVja2P
 dqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716917227; x=1717522027;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6bBlwiUJeQIH7DSXgOBC1Z5vxVVOeQRW7eyy+qteuh8=;
 b=SK04m7GkjSY+OM/5eXWu+iqjH87jsbc0CFn47hmCgg23Y+m/npv+0zk6IyA34bYPqC
 R8lwSpnNl2e6kpexZOdd5ayxlljr7feVlxPEYfWqR9BT2gairxfQ/KJYwuRUV+B93OOc
 mrsf4VRwwncHlqNx6SMsjF5n0j1jAHrVqwkE1cFl/MjGh39nk8RPXMgNjE/HsgTBAYI8
 R8lEttFyh16BYP2CAmTts7hvQK+h60KBZIOLqW7zn8/2BfOi8KrGjlca5YU+4c3JVTkp
 +3QzqGlDU8UR6KntgvrKwvTeurYpuohxoFNwc3gbHlUi5qwuy+v5TAF2p+u04e21GxF9
 xKBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgKRuwtVyUDnkkowBWkZuCGrhygYlyreaxnq1Gds45zGaOnF2TkaK7fuIIp96dwLmT9rANprhIQ/g0yS7XTexUMYiq
X-Gm-Message-State: AOJu0YxFafpWV6vyAOacq1eljrvNjYPK6hBm0UmakjTW4nzkynRcta1C
 tjlLaOhgRN3iO7eRMb1XaPcH12T+RDmG5nQGg63M+D7iQvN0qA0Rn0d4ryG93dk=
X-Received: by 2002:a17:902:d509:b0:1f4:be9b:d30f with SMTP id
 d9443c01a7336-1f4be9bdadamr52760765ad.68.1716917227337; 
 Tue, 28 May 2024 10:27:07 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c75e663sm84820665ad.29.2024.05.28.10.27.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 10:27:06 -0700 (PDT)
Message-ID: <ee96e58f-28d9-4fbb-a0b3-1ec385fdadf2@linaro.org>
Date: Tue, 28 May 2024 10:27:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 65/67] target/arm: Convert SQDMULH, SQRDMULH to
 decodetree
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-66-richard.henderson@linaro.org>
 <CAFEAcA9MKmvgT6Q4qn8ELSA0pXEO2w2poHELW3Ed6xCs6cKstw@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9MKmvgT6Q4qn8ELSA0pXEO2w2poHELW3Ed6xCs6cKstw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: jwfPdb8Xi1cz

On 5/28/24 09:10, Peter Maydell wrote:
>> +void HELPER(neon_sqdmulh_idx_s)(void *vd, void *vn, void *vm,
>> +                                void *vq, uint32_t desc)
>> +{
>> +    intptr_t i, j, opr_sz = simd_oprsz(desc);
>> +    int idx = simd_data(desc);
>> +    int32_t *d = vd, *n = vn, *m = (int32_t *)vm + H4(idx);
>> +
>> +    for (i = 0; i < opr_sz / 4; i += 16 / 4) {
>> +        int32_t mm = m[i];
>> +        for (j = 0; j < 16 / 4; ++j) {
>> +            d[i + j] = do_sqrdmlah_s(n[i + j], mm, 0, false, false, vq);
>> +        }
>> +    }
>> +    clear_tail(d, opr_sz, simd_maxsz(desc));
>> +}
>> +
>> +void HELPER(neon_sqrdmulh_idx_s)(void *vd, void *vn, void *vm,
>> +                                 void *vq, uint32_t desc)
>> +{
>> +    intptr_t i, j, opr_sz = simd_oprsz(desc);
>> +    int idx = simd_data(desc);
>> +    int32_t *d = vd, *n = vn, *m = (int32_t *)vm + H4(idx);
>> +
>> +    for (i = 0; i < opr_sz / 4; i += 16 / 4) {
>> +        int32_t mm = m[i];
>> +        for (j = 0; j < 16 / 4; ++j) {
>> +            d[i + j] = do_sqrdmlah_s(n[i + j], mm, 0, false, true, vq);
>> +        }
>> +    }
>> +    clear_tail(d, opr_sz, simd_maxsz(desc));
>> +}
> 
> Missing H macros in these helpers ?

No.  The only index that's not identical across the vector is M, and H is handled once at 
the beginning.  Otherwise n[] and d[] have the same operation applied to all indicies, and 
it doesn't matter which order in which these happen.


r~

