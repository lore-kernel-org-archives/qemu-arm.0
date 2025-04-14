Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2108663njc;
        Mon, 14 Apr 2025 09:12:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUfeSgvnyfpqzkcZHW2dHCehWg32Bq/kkLRbNAAAxbFjMgSO83bvpon5m9M3nqnuZ6OmZCY7G3hRgtQsQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFgjFiiUiuq5ZWvZlGhidAFCqh9DKFc6RdXnMYyanW+JrhIsit1FQ3DVx9Ql+GJZBypLu8f
X-Received: by 2002:a05:6102:5f05:b0:4c3:64bc:7d00 with SMTP id ada2fe7eead31-4c9e504cf3cmr8984572137.24.1744647153400;
        Mon, 14 Apr 2025 09:12:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744647153; cv=none;
        d=google.com; s=arc-20240605;
        b=W3GPwPhAXljjyn8tXE9k5Bj2iixVD4JpJ0vHdAktChleklWoIiHx1z9LDs4ZFdgZkd
         AbFe27eRs/9fU7YggA4gDi22SEXG1kJD6mAbajQJ2FPapDvGXWxAeSWQB5rXl+K/qSlT
         7XcEGlLeb+h0RlCXXhoQxQ/VJW2EpcS5s/WYhS51xs9QJNkMLA0KBO9XnWC7Ij2wekpd
         J8o3vxzzOXZgtWmruTwYoh6EboDhQ9roe/5DsjspaAJNBi5D1T68eFlPpgkNQ63UHglD
         h2YibYgNlkO/rZouLL7t7t/Ygs2JqfvVr9Put/zk3WGAosjWLFiSJiF1cUOXN/P3tGo+
         AE3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=WqBFC1T5vvtFmaKrfZy+y6npmm7hcx4NUKeeI8wQlmk=;
        fh=CtMalJvqHl+KOnFl95sXmsNoc/0A9MC35kVAxPh4KPQ=;
        b=IpodwhKiKQFDlQqWAbOA4nK5Wlr+sF7Sc9EsK2SnwS3gTzlO2LPTDaw2fpK1pYvN3b
         C4nCCjX/qlXU13XQLAgSSmx/pc1dkZFmyAoFdKQVhzAN1T4ZJQ2GJDGFHyhAZN4ZPCoO
         r4DLRAbPP6VXUyCJq/qyhF2y3nfGdo83BOZdHrIYRYJP6uXbtsgGnq8wGnuY4EJRfxMW
         gaFNiqI8qsdWeTzKbrTKB3MA2Mtn0WeM/b8+kfS/+oAucymhDWWkH9ON+4+OCmUnXQOV
         N4w84tKaC+RmeSgDwBkTjzkCCdEGszhknvVA76hUGAJn695A2mp6IVX34i4CWXVEM9kI
         HIJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rBMF3+sF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c9c98c1cd9si3498940137.368.2025.04.14.09.12.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Apr 2025 09:12:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rBMF3+sF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u4MPn-000242-8e; Mon, 14 Apr 2025 12:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u4MPH-00020b-9t
 for qemu-arm@nongnu.org; Mon, 14 Apr 2025 12:11:43 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u4MP9-0000WV-Gn
 for qemu-arm@nongnu.org; Mon, 14 Apr 2025 12:11:34 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so29106845e9.1
 for <qemu-arm@nongnu.org>; Mon, 14 Apr 2025 09:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744647085; x=1745251885; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WqBFC1T5vvtFmaKrfZy+y6npmm7hcx4NUKeeI8wQlmk=;
 b=rBMF3+sFBVP7HTPZGM15azdw41CrySc8otZPZjALRj/mTsJZEYKMWgN/jR5nyxbYFj
 TrctYwgL3N+xfenGJGpOa45T4mzPgM8Xg41lo/cCplMUtMETYNdWAEFIvu3Ixzc9Ki3F
 kixP7e49lv27OGwI32dNaoNxg1fiEO0BarYT7WfzRjQ06J17MGm+araNK5u60JSQ8hAz
 PVWT/dWswpMVEQM6TRwO84Eg52OrKdvCSAvbVSdui42fGGPMUDQlI3w2JBXjSVMEQ57w
 ivcTgeknY3CFjkYs1Jrpv5OEyqDivEmjEU5shLweJZK0VVWeCn2x4j36C6FRuhHYFkwc
 7CRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744647085; x=1745251885;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WqBFC1T5vvtFmaKrfZy+y6npmm7hcx4NUKeeI8wQlmk=;
 b=F7ep4nL6ecR3jR14FGidGVFC2MN0pJPl821js5DKnBIlt/QJ9HFg8mYIq9NwlO0KQ/
 fXeG01fr1oFnWc8Jyn2IX8M7wt+vWb8Bfn9ZggVThDRkFc1rFfDoMBvQkSqOYa2Be/9A
 9tUWIuNYM5P6fORGqGtyRD8/kIcEZY7qZYrJo5xF64ppwRbA6TPKclym73m0P8G/CsPr
 cqqIfrnLJoX4y64fpRmL2jbjuyPF6W15XJQZqoBu3QW1A5Ek0L8W0oi9hJw1Pbnr4I9U
 P5pXpFpRfycNOer9OxRdtAW7OxW6pEQjCggLeclRzqlVmRBsVAhW7EePsnKrTWm7/Kvf
 hOQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFhHG73ateIpPSTUt8gsh8SG/a5/tjRxwKdPhqppxGuL6NwS9fFHPQQD/wxk3QSNKuKs2KFYdTtg==@nongnu.org
X-Gm-Message-State: AOJu0YyMKwiWTnMt1pJfjeSOT7HmcAQUsuUvORfucWdDWpXGcdjiwzNB
 9k7OFPCs8htwnGQHtMypaFlXv8WhAA/6McXg5X6otNTi4JzFgIQmyp+j7Yut2+U=
X-Gm-Gg: ASbGnctVyAQGTtRGbcgMAykSeVB/cZEHNJz4ixyPZae5FkLR+wXLS4EURcG4q+MPRxD
 V0tae7V+ZPbBn/Ka3kXm7i8N4+MLVUaxRbphDZslsYlISK6ftrEBel0O7a8/nUz6V9lwXV9PCAD
 7rmEWU0RPlbbdB02FwcB0NBUyO6AwfS8KtukmWM8wezikhX20WSJmAC6LI6SEgjVc/a1C2PFl3+
 +FHfCdqoC5Lg5+BzMNZO1PSaMVBia9WnsDzIHltV1VopjIcGdxacvfOVjHNGKc1s8XKr+wQ9TWO
 0KbtJXLixaE+8E6NQJgDmHlQRO1tkoWxvHwL8M5/rngOL/9BbK9IF8zsREO08IbOcMY3dNrk40K
 EVtYsX7Kq
X-Received: by 2002:a05:600c:3b27:b0:439:8878:5029 with SMTP id
 5b1f17b1804b1-43f99889ac5mr232165e9.2.1744647084720; 
 Mon, 14 Apr 2025 09:11:24 -0700 (PDT)
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf445772sm11501941f8f.91.2025.04.14.09.11.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 09:11:24 -0700 (PDT)
Message-ID: <a8d305e6-3658-4ee6-98dd-167b41a184cd@linaro.org>
Date: Mon, 14 Apr 2025 18:11:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add functional tests that are not covered yet
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>, qemu-arm@nongnu.org
References: <20250414121520.213665-1-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250414121520.213665-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: h7ZAIOAr2dvY

On 14/4/25 14:15, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> Some functional tests are currently not covered by the entries
> in MAINTAINERS yet, so scripts/get_maintainers.pl fails to suggest
> the right people who should be CC:-ed for related patches.
> Add the uncovered tests to the right sections to close this gap.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

