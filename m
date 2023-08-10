Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp816917ejc;
        Thu, 10 Aug 2023 10:02:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKQfQNGEqX6E6z90/s7uDMf+4Cl86ybG/c3zI2YVO5K1vrPt75aj5Uh7XyeNEy4Bws/fvx
X-Received: by 2002:a05:620a:e82:b0:767:1b8e:811e with SMTP id w2-20020a05620a0e8200b007671b8e811emr2597818qkm.17.1691686978668;
        Thu, 10 Aug 2023 10:02:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691686978; cv=none;
        d=google.com; s=arc-20160816;
        b=EdwgFkcHb15h/iKoqLfb51E5SUDmHr3a6Hl6mhYJZeyveGMqFZ0uDwe45I4PMn51Qi
         DZFyAV/4qdQtqRAksZgnnlaWmSP62gWSaLugFnbGpvRpO7rCOeNq4jXE1q4owAZ/1ifM
         5hXVAGRrmFgOVmSVQzZmfngBVlroHqxiSGMneY/d1RpIKIvon7MV8oqpJhYEzlsYGiDd
         kdP86eWK7UiAaRnRUGTpTmSR5dGg8U/mrJRGhA9//HLKvvEHi5UOue9hMH8+Hn69Iph9
         o5afHZq79VhWzgNHH0aHIaiO3NjJ5bcL/83AXtb0Zt4GjvG5gWWHOgZ71N3jNGzQRTJJ
         fS6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=C1Jlf91BI9+pnbD1iVp4V+lXHBleNlxeJ8wB8wOxR44=;
        fh=suv5xTjx36fqisDPVLYE9Wxpju9TBVv1sbkAE72NWoc=;
        b=KM8CPCe3iEqE4NacR9ECWnqMBvHSMoIlnmUB3IeBSDW8EqWCkmAIMOmXt0XOwnv62O
         0KsO2jqXKnlJ6PZNgdy3jMeUWOYnE9c8Bc7u9SmpgT0bzZ7fh6tYdFs+K4lXM3TYAzfm
         +uYgFrODofDPEAG6tNhS55n+7cyhByaRvqp5jlxvlpX5ut+TnGxa+GnuAOVw4BTO5tjt
         f+McX/YRTJQ5Zkbd/3uCnHtj5S8IxD2wcWQmTTVqFJHuW3mHmJfZJi7yrOIXauw9iIsh
         71Gri8ylpASAJJWUVNEiEiM2mJQqCOUiMbvTdDoPV2n/ho9IxQ6YAp80qW3odc/o84/1
         2uuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Uqvls/yr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11-20020a05620a288b00b0075cd3df8118si1176076qkp.603.2023.08.10.10.02.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Aug 2023 10:02:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Uqvls/yr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qU92u-0004Kt-Cj; Thu, 10 Aug 2023 13:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qU92s-0004KQ-E5
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 13:01:59 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qU92q-00059E-Vd
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 13:01:58 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1bc5acc627dso8772175ad.1
 for <qemu-arm@nongnu.org>; Thu, 10 Aug 2023 10:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691686915; x=1692291715;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C1Jlf91BI9+pnbD1iVp4V+lXHBleNlxeJ8wB8wOxR44=;
 b=Uqvls/yrkUNM2yKwScYWcA20luF1lJyVB3CwaCAf2zsEUJ4wkD6jHwpaD9mUvGutGU
 52ZvO/jeqUMtjqjSQ8Ioe7dqCrTHx3aaENugJVWR9561jsIkTde+dduchgE30NK+LZSg
 BGNvfSdI7vVjxs44jH+l8Z+xEjSGJ2rFvcmgi/8QOUmc7PU21M3Om6lJzF+p8eZ7NLZl
 i86wAP0Kz8b3rQCWTb50dRUWoNnD2SY3+OwIBXa4h7QMwmK73JbieATBUG9QSODwRf5E
 HLn/YWJE20YQpW+AaNeZG3Ef5O22kBT3IaSz8i3O/cI4Gw280Z7OSCKlmvYrLxImtgie
 +S1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691686915; x=1692291715;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C1Jlf91BI9+pnbD1iVp4V+lXHBleNlxeJ8wB8wOxR44=;
 b=jdOEOZtIeCqVwBgiokRNoxJ8EBWFMovOcN3+li6NESzg3x1tsbwSpIJslU+YqkHC5L
 px9JPmXdkJ1xqNsmWRxWCRmmDXJ91QJ9DS3+wWwYFGV8lrQzZ06Bi9nxJ/maaVptcZ27
 BZ0oXZbA+VoxhuESuc4KQwEJRYm934Tp6GQ/FR88oujBIrWIsl+UuNHRB2shNspOr0OH
 J9whN+vPMPluWpDtT9O0gkGu6a4xgbV6MqK5OFwXdN38xOKjwvnQ1iOkXA1QFutoMKZ9
 wWr3AFQuVaGvbF0Vw3capaCQxS00SQ+vtVFjCvNT9AlZsxqli0OFRO5B9xywBRbzwkXj
 Titg==
X-Gm-Message-State: AOJu0YzOV6G7tBzD9IW8g5L3XwP6iiBD3uQf8H/oi5IzJ8rqvV8f2N0H
 6U1p3zzrSuyGjyhuxHJ9Zem/0g==
X-Received: by 2002:a17:902:a414:b0:1bd:b0b8:623f with SMTP id
 p20-20020a170902a41400b001bdb0b8623fmr784855plq.11.1691686915012; 
 Thu, 10 Aug 2023 10:01:55 -0700 (PDT)
Received: from ?IPV6:2602:47:d483:7301:9e4d:b830:d4fd:9164?
 ([2602:47:d483:7301:9e4d:b830:d4fd:9164])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a170902f7d100b001bb889530adsm2024032plw.217.2023.08.10.10.01.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Aug 2023 10:01:54 -0700 (PDT)
Message-ID: <71a7293a-6cda-c195-8c84-55b40f1fca57@linaro.org>
Date: Thu, 10 Aug 2023 10:01:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 12/24] tcg/aarch64: Implement negsetcond_*
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-13-richard.henderson@linaro.org>
 <CAFEAcA9dqnaqGrLz804UB8zHSnbCEWwhv1nzvdt_j0CS3=mCSg@mail.gmail.com>
 <6dbafe59-f7ce-12f6-e8c7-eefc7665f598@linaro.org>
 <CAFEAcA8j=AejoxGSO7wKQH9uM68jpL59KrgfSCQj78-sY3yxjw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8j=AejoxGSO7wKQH9uM68jpL59KrgfSCQj78-sY3yxjw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.156,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: DnvY4xk2gUiu

On 8/10/23 09:58, Peter Maydell wrote:
> On Thu, 10 Aug 2023 at 17:55, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 8/10/23 09:39, Peter Maydell wrote:
>>>> +    case INDEX_op_negsetcond_i32:
>>>> +        a2 = (int32_t)a2;
>>>> +        /* FALLTHRU */
>>>
>>> I see this is what we already do for setcond and movcond,
>>> but how does it work when the 2nd input is a register?
>>> Or is reg-reg guaranteed to always use the _i64 op?
>>
>> For reg-reg, a2 < 31, so the sign-extend does nothing.
> 
> OK. Do we document somewhere what a TCGArg is?

No.  I should do that...


r~

