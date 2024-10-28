Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp36877njj;
        Mon, 28 Oct 2024 23:11:21 -0700 (PDT)
X-Received: by 2002:a05:600c:3b93:b0:430:5356:ac8e with SMTP id 5b1f17b1804b1-4319ac705camr91533945e9.5.1730182281400;
        Mon, 28 Oct 2024 23:11:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730182281; cv=none;
        d=google.com; s=arc-20240605;
        b=Mvw1yAL8OJmt3Ts5llklVoS+uAL0s1MBhZkgqCjwhHXMlEX0f+pxRDSMkRl7JPAdFM
         KeEdI2LLovJRo769kk1JYOF6gq+p/GQLqon69zZauUO5OnsnCJlP2vqVrAtDorARdAKU
         dy0m054pAuHwi1sjcrPhnaLBB1l0Qgy0eytLi16306w5DYDSu/c12SkSVWYFk1Z47Zki
         oMW7cPOlwCVi8xbQY0yRoWjFvL1KU4wEBWxb3Dsvwf9SkHyBG8YzHXfiaCtOTI2+OCzR
         NT587vY1jWUHLClnMbr155vD+yESa/0+HUGiam7w+yTT6ntFKHFWARR4HMOj87RbeuXN
         7t0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=jE2BT7EGIKvBQJ3ORlP36YhCMobQCHTdfKNvbMTdSpc=;
        fh=cV0x2MJ9gtIrfnrUMYB6k0QkF3vl+EU6F4WwtejqRuE=;
        b=CxzEODkIgMamoBYWNV/LCI2c6oZ/Jyynh38eI4rfyhGqX3/g2N2tBlN2V9g34UEp4C
         g1SUHjGgd2TasdhhRBopEFAuigu0wAiW2zKqte4Qa89UeE6TlNeqHxO91iE6LgjxCCGV
         NB1MSeJcokYBEeene6w78WEDt+o9BATJvt9ZPhlNLSxarpoKveW17RMP2dLFxcvoicPp
         zgXr8jGqnojPqqOdaE0vOgspd7IuNFDV36H5JUlXe10R5N+NwiXupkoBu8n6ZSwDfYFG
         G0utxKTKSQkF4HFIWVC4WXWxOPjb9a7uLUY6KiypKwV3LdvxFtySQYHZm8MQwduazE+w
         6+ng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g7Ne+WFA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43193842fedsor38967495e9.0.2024.10.28.23.11.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Oct 2024 23:11:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g7Ne+WFA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730182281; x=1730787081; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jE2BT7EGIKvBQJ3ORlP36YhCMobQCHTdfKNvbMTdSpc=;
        b=g7Ne+WFA5Mj/NwfWcJfZ+YgdU3ImGLFuGF9dFNzZu1yWUyB2NwR1vDsromrKeaANvF
         KMIDwpVhweqHypdQln8t/JD3otEvvi3EOiD8DJUnaTfqGL47l0D3aVPks+LaI4chNJcy
         KGM/kq0Xu21j8TeMi8W0TXEbruBw6029Q32v60bqX885yuB42yicoos/KyoqKCx4F1vN
         fIzgECsYy3IoM3sqjGeS1G7Ki2z6xVMW7d19IsgLTPl2+IJLGvGnkJ9V/2tbu3ZjeerB
         J+e952ZZ0grNq2h2YXxmhARcX60eYwCSVMi3FkJ+9Rz04i9zrgx5kVPPmdg0HMIJZd46
         0WWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730182281; x=1730787081;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jE2BT7EGIKvBQJ3ORlP36YhCMobQCHTdfKNvbMTdSpc=;
        b=NF9FX2ayKIJStpgvv5uiC9UdB9RRiPtKtwWeOhgpKsVip/D5hGk0+SmNItdMzD3JN6
         6tvgLF62KzU9sEyMDjjbiTijYTYdPxUGvtCBsxZHirYH0C6DX/Nq7MZukXKNJgqFMDOx
         YNzbh0FhhP+p2Ik3FTmXB/B/m0NojaEqF2l4ZnK0aDlxYvEOppvzQCAzxCpRDBJeGJ4W
         XES4ea1HFx0ZR2qR9ooG9b+O3PZRl/MtLWxm81VOHH+dZ0xJwhVQeiWhbL1qly2FWIaS
         VG/Axufkfb4RPrZ2mfu76j0u3zbDbUySAckC1EI9z7KqgxdgL2fxBCTvBIOes+u4tys6
         YA2w==
X-Gm-Message-State: AOJu0YyrPNhYlTnebQT07xhKrk+lIyDjsu8SyXHjfxUfBXQcZTe3MDht
	7LGNRgCQat/gcQbPA42nPX9OVZZvkTNbD7da7GGk40ojc5p7V0v8aMhBE7EA3xZphw==
X-Google-Smtp-Source: AGHT+IECOb9SHYbyTj00TCPx1nQpVJVfrB/mxIKC34O7m01vTfaIa2d9yxZMNlvFjH71EN91MovWIg==
X-Received: by 2002:a5d:4c4f:0:b0:37d:446a:4142 with SMTP id ffacd0b85a97d-38061158e44mr7282810f8f.32.1730182280800;
        Mon, 28 Oct 2024 23:11:20 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.21.227] ([90.197.151.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b566f11sm161756735e9.20.2024.10.28.23.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 23:11:19 -0700 (PDT)
Message-ID: <be77ed82-f936-4fe6-9fd4-87a0fada176f@linaro.org>
Date: Mon, 28 Oct 2024 12:28:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/21] softfloat: Remove fallback rule from pickNaN()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
 <20241025141254.2141506-22-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241025141254.2141506-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: hWy3oBYuFG+l

On 10/25/24 15:12, Peter Maydell wrote:
> Now that all targets have been converted to explicitly set a NaN
> propagation rule, we can remove the set of target ifdefs (which now
> list every target) and clean up the references to fallback behaviour
> for float_2nan_prop_none.
> 
> The "default" case in the switch will catch any remaining places
> where status->float_2nan_prop_rule was not set by the target.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/fpu/softfloat-types.h  | 10 +++-------
>   fpu/softfloat-specialize.c.inc | 23 +++--------------------
>   2 files changed, 6 insertions(+), 27 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
