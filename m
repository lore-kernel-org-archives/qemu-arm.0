Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2614437ejb;
        Wed, 24 May 2023 08:01:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7G40Dq8OAJ3bxsbZVkQZl5aRBC4U04BN+nobGMP0slR2KKpQK/8J07xBPb/6f90md7SIrA
X-Received: by 2002:a05:6214:4118:b0:623:9690:5b0c with SMTP id kc24-20020a056214411800b0062396905b0cmr23455154qvb.5.1684940473304;
        Wed, 24 May 2023 08:01:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684940473; cv=none;
        d=google.com; s=arc-20160816;
        b=norXOcANoJ/EU526yRaBOACiOARcKgxUxoSEtlp5uWYx8ekktQ5u0zcr4TmB6pwvd9
         tSMEH5+i1a5C9yTUf7pJ3KucKeN3k77k003n3DEP1R/9j7T4/EqgmYHh5EEqz2Dx6rre
         qgID8HMdc0f/MbRGVdF16EEKYoY9bW0C2o40rzNrOvu8bkQy8DsTj9OXcmm0b6zsvQU2
         3+w4aeC25BZUKsv/GiIY7N6U5m/VWPwX6uTM6NGw2Tund6Gtc9N9jOZICRCuKsakeHm1
         JZW0/2F49l3mWq0k7Gaxo5HRFbJ6L525c3PUp0D5Kq2jOrzuG5BecIKQ9siok0o0j7vq
         oZYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=VB5rrKpg2kwiSO5u9KvwpG1D/nfQhK/Z+OVFOvPmyYI=;
        b=v32YlRDeEDLr75AHlH+9M704G6PuYqsnPjBQf6zoe5PSHWyKjXDn+NlFEomehP0zr8
         JQGTtDevaEoX5K5Qp9RSuPizB6MNIBESdeNlj6sErk8/rVBOD2UStIApXbE9HpImAKso
         GtrSa+pGHgCue0u9kr9mYRhEelPtUK+JupNlUn/rBj1/K+T8KxaHFyUA5j8GSt6IJACm
         qDNx3kyhIXT3NZvwKpxaw4OtgoUAigwhJFG8rHCew4ypXilpOm6NFnn99QdwHwuAH6VY
         WsiTUucJLC3m5OHC4CsrrwPKqmSiqlSf/5OTv7lPG98B1uPN3LJ7nK41XvRk+R90DGDc
         oXEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r8C6DA2m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jt6-20020a05621427e600b0057e60499689si6680254qvb.208.2023.05.24.08.01.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 08:01:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r8C6DA2m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1pxt-0006XC-TW; Wed, 24 May 2023 10:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1pxq-0006Rq-Mp
 for qemu-arm@nongnu.org; Wed, 24 May 2023 10:59:46 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1pxp-0006Uw-12
 for qemu-arm@nongnu.org; Wed, 24 May 2023 10:59:46 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-64d604cc0aaso805410b3a.2
 for <qemu-arm@nongnu.org>; Wed, 24 May 2023 07:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684940382; x=1687532382;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VB5rrKpg2kwiSO5u9KvwpG1D/nfQhK/Z+OVFOvPmyYI=;
 b=r8C6DA2md+iGCGpYvaKCXwsK3EJdOrMm5XBRfcjz95CHgqGcdgUn7hloPNtwab8Dtt
 pXDKMrbOtU8izbMIiOjm01VEhmB6wS3mtiqRkQIOxIdvSVeGfksM3bHnpzeB777ko0wh
 UYxhOVkse1xhQMsttc+LrNrqwlkn7duWe8bK7hT5EaZhQNovvXrmpU6CIk7Vw1/OSAjx
 BWduAheLH4Ita6o9wcuMIbXT6encn11vLtdXwfjT02yhuk2iIGENGaiPWAv+khlSO46L
 94svh283s8Sl6c8GVhpymi/m1X9+aAyE9Lhn6bwOifO9WwaLI9n6ybsDvvcd/2jYYBpx
 Oc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684940382; x=1687532382;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VB5rrKpg2kwiSO5u9KvwpG1D/nfQhK/Z+OVFOvPmyYI=;
 b=kwnkvtW2sRkPNuvfsa71xTXkmBtsVxH3aTwHQ8TP3pVaoHz9IV/35SbAj7BRGVXG35
 zVI016+LBbWF8k20wZ7gX/d/oSpiWu+bXSFI++KGv6NOfuHkk3hGUDqHRMZaO0jwR5Wi
 MLlyn/8bctwxcS43yeq5kLy6Ep2eO/hDQq4ZXIXaTnEmm7WOnxPDwNV+JN76E9rng/+d
 Igw9RMhrqtbVs28pHCH5mfNpMu+EtH5wB7mFsmf9atbVCJ4mn20G7F++a+txqVnbgGEM
 +3Fl+YNYUZFe8HL3sWYQvcxPtEhfA5VfxjZGJb5QlCGWpshHuugLSny+hvGxwLpvxPL9
 fqBg==
X-Gm-Message-State: AC+VfDzCZy6i+deZ7yYnaPBu5z/JuokwTc8B1F9DE2HmhRLxOxLRmE33
 yHcqKs2XgKYfLle4navoPlV5tg==
X-Received: by 2002:a05:6a00:1a13:b0:646:3c2:4d30 with SMTP id
 g19-20020a056a001a1300b0064603c24d30mr3692689pfv.30.1684940382539; 
 Wed, 24 May 2023 07:59:42 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:6b03:9af2:33c1:3d6b?
 ([2602:ae:1598:4c01:6b03:9af2:33c1:3d6b])
 by smtp.gmail.com with ESMTPSA id
 j18-20020aa78d12000000b0063b7a0b9cc5sm7529916pfe.186.2023.05.24.07.59.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 07:59:42 -0700 (PDT)
Message-ID: <9d8da7ed-e9ce-4dc6-1f80-6ff1e093e12e@linaro.org>
Date: Wed, 24 May 2023 07:59:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/5] Add Bochs to list of vga_interfaces
Content-Language: en-US
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230524102729.810892-1-marcin.juszkiewicz@linaro.org>
 <20230524102729.810892-3-marcin.juszkiewicz@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230524102729.810892-3-marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Tp0LsymwZmnl

On 5/24/23 03:27, Marcin Juszkiewicz wrote:
> arm/sbsa-ref uses Bochs-display graphics card and without it being
> present in vga_interfaces "-vga none" argument handling cannot be added.
> 
> Signed-off-by: Marcin Juszkiewicz<marcin.juszkiewicz@linaro.org>
> ---
>   include/sysemu/sysemu.h | 2 +-
>   softmmu/vl.c            | 6 ++++++
>   2 files changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
