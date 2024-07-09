Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3150675njb;
        Tue, 9 Jul 2024 01:41:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVi25hBaLYCNJ2zKoePMSjkcLiudzMbn5SNvybBtOX4AdS+pH3BA5p2d1MuxHUhqYN+/WQaGX4KPPfPShmfH3DcO+2viT+X
X-Google-Smtp-Source: AGHT+IFV0WowS2zKf9NfCoEzyTj5rSE5N+4YqvYkZv79i9QGttK9Nqab/6K3olKiwva2sPH4maQr
X-Received: by 2002:a05:6214:f05:b0:6b2:c840:7a2 with SMTP id 6a1803df08f44-6b61c1b2b52mr22493366d6.45.1720514472791;
        Tue, 09 Jul 2024 01:41:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720514472; cv=none;
        d=google.com; s=arc-20160816;
        b=QYgEuc0Dyu0BNAFcJZSQ2Cgvs6VK93WtMzu7Yg94+tUnD7z6RrYo5/7ghDLJJSAcYe
         TCUZVO9r/Q8YglXsnK6Kf2cc4xy/gj6J+zThaKo0ihUxtRXowfvClqGRmdTo0vqRObTl
         Bc2tQu61zxnDrYRS9B4NV97Ke34cSPTMjJD1s27aCX7wG+msWYAIWTfAZysdbqORFiS8
         n4UCbrdEG8skTy3zZDJGJ8BM1wESwKo9K5Xql9avtOEHf/bOo+JGxnHNoFvK0bmJq8zO
         q9PSAku8H3x8hKOI4sqhzGH1Zar8333u+Jm9m5BhKruuRxcUpCJkIuyJU23zAOtKovkN
         JFyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=FhSf7CTcys91uU+fZIOIoIf+mr8ywHbnC1+R5UJxBYs=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=kFidumDj9OmJuDcbOu8LG7YzOqLxtc7LCY3iPP8dMml0nNOCKeo352jNp0B/Eb3KQb
         Hf9JqRwF/Po28s2z2kZ8SEMpvKiXlN1vYjiAOjsE9gj+lfx1Het0aMSwovoXu/bWWDlB
         EFXFcaxSeab6AsQLJI5+2nQrdIEnWpKdWTVtfbn+l1j/Hldfz4LPl9svYD2ekP6Ia1L8
         PSSRLIuTiPJnGWepbG+8RTeMfrM6fym9uOgliZ0jP22VEzVh7UNGY8bUFiwSvuClnM8Y
         NCXRkSpehOBQz1p3vIJv+jcHnsIbxXsdh6U7w+iOPBhQh7EDrwz2LDv1Ejnq5IAUOLK4
         LQbA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yj+e7Bh3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b61ba19208si17844826d6.163.2024.07.09.01.41.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 01:41:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yj+e7Bh3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sR6PI-0007wn-Fj; Tue, 09 Jul 2024 04:41:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sR6PG-0007vA-NQ
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 04:41:02 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sR6P2-0002WV-9u
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 04:41:01 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4265b7514fcso19514255e9.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 01:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720514446; x=1721119246; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FhSf7CTcys91uU+fZIOIoIf+mr8ywHbnC1+R5UJxBYs=;
 b=yj+e7Bh38qY8oGn2xXDaqFZLfswfiJH9j64NvJ9X2ZlyFQVJ1ZPF+uht6aDTGE+KkV
 gcaThWcOu3g6RNQJqySqbDRQKCDGaI/kmusqX2kuLTrlSCKvj+925d1I5BLKcOl88J1u
 DfMfbwI0FDa/GSMi7ZHDRdBAo3jfTIbPth+fkI81g6Tr+RdJAHaik6DY/Gy+SGb7D2HQ
 i7aAmTmN3FnuwFxxkm6YdHizTPCwu+0FnxQWRkKtFyjp5D/kRZkThyXHEsbqkjM8DQ+N
 2UQXH+5mzGvqco2rVxRvkmlUagHazDJHmEuUuVg0jRyiKXiO1VwjA5Y6xZrxHqQ2H8DA
 5VNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720514446; x=1721119246;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FhSf7CTcys91uU+fZIOIoIf+mr8ywHbnC1+R5UJxBYs=;
 b=cFqMU/Y1d3Fc5JzpjGOkqisTy3sV+f2r0y4r+7h5STPlqOMTeQ0QjamQofD4V+1Bnz
 5aqopJz0qkBrOXRb7OXn2PBB4sC8giQgXa1yjs4vZNxXSPBNFgqxpfphB43BoQlx2/2+
 5KGPr/93EaE2tbDezVYlu76wWGpTYR6+/QusEvYWzt5u7r07cjVEy6Eb/C0ASeasXaBb
 9QdRPq3PyTDXhCN/bPjvRpCmaI/F7jmKrygVYBOvB1+VCwsF/EK7t28vRIztNzD4a28u
 1v4RdCP3E719gvWq5GBDH+EWosJxG5AxsfPpAnqQSgAKopiyg5lZ2FrAASUOZL+SobqY
 rrRg==
X-Gm-Message-State: AOJu0YyL7trExdWropowiGVwNALixMceTv8R6+jCcg/ic/5UGlN40Tj3
 OU9cQc0MiGmUWHwVOfjl8sRvBJ/3xTnvPYckHPgo8czEKnVJadhOGbJo9Cf2R7c=
X-Received: by 2002:a05:600c:68cd:b0:424:71f7:77f2 with SMTP id
 5b1f17b1804b1-42672338066mr12289875e9.16.1720514446179; 
 Tue, 09 Jul 2024 01:40:46 -0700 (PDT)
Received: from [192.168.69.100] (vau06-h02-176-184-43-20.dsl.sta.abo.bbox.fr.
 [176.184.43.20]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42668b87496sm78307215e9.8.2024.07.09.01.40.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 01:40:45 -0700 (PDT)
Message-ID: <974ae42c-11b1-4411-89de-7a72396d9683@linaro.org>
Date: Tue, 9 Jul 2024 10:40:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] target/arm: Convert PMULL to decodetree
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20240709000610.382391-1-richard.henderson@linaro.org>
 <20240709000610.382391-7-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240709000610.382391-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: No9eePwzVwAA

On 9/7/24 02:06, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 94 +++++-----------------------------
>   target/arm/tcg/a64.decode      |  3 ++
>   2 files changed, 15 insertions(+), 82 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

