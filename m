Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp839669njb;
        Tue, 13 May 2025 15:59:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWWpsRR2iSfJEgqB4zYGzL2p+GDzcsc6/m74u0FYrrC7HSXre/u+2UtS+qxSTLGmfIipOH/y5OAmOEAuQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH0inRKRHO/5cMoU6mOBlmjjJKgAhyf6Sv47abY2DOKnCU85o7l6hmEyUWSXwui12ntcmSz
X-Received: by 2002:a05:622a:4d96:b0:476:8e3e:2da3 with SMTP id d75a77b69052e-49495cdede4mr24924761cf.30.1747177152995;
        Tue, 13 May 2025 15:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747177152; cv=none;
        d=google.com; s=arc-20240605;
        b=QerY3ZNM5dgT9OmB6P1n2raUyRPtQSyyET1SClrBbIaww+06LqT0XCp3E5EJFGapLj
         LF0be5QuGi2w1GC6KjDxUkkrHgv6pM3iCOA5xtAMNIfujHe9aSZ0IIC92SmOuYp646Jz
         nQHCIaHv1w77C3mwwWlEkiVfqPt2lQm0G6Lwocyj8q9enxsktOe2Qg2PGSjUCM8P+3D8
         UOyZQkrKKO+hpUu+62fpkbaW1ExYybUCwAv1b6nS/oFWZHdrDzpRYuG/5bclEDA4m6pZ
         +97K+HeVx/acZDL76M6mXTWevKVPSnGOxBpuyuzFvi6URbnHsZtOFbScfLNFouIDtotg
         1vMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=f+I0vjqOWs/SbzRNgV8IUlGqptpf8N7fkihxNxFiO4c=;
        fh=VUaHZALjklSODsPgl9JLRLnco3anBg4lbd3ZckofjsU=;
        b=CUBG2gkX7nR9HT9a4qBOHrglefjrCJtW859jgYW4mz5lwIRL9mM5LzuzYS+B//tpQg
         HzK6H/Eg5ot6OHszBY27HXEiCeQ8QR+JI9mBPipz1E3JT9DG/tmEi8/y1q7ebbeY6CoL
         e2lCkoeFuUE0UqQxgLhJ9EtRQfIrQtMVTJEtOQpq8qWXi2+7j4+QH4ySvJzLsvFbsAIb
         sLE2zJXl3wdRMRgc9bimO7KTFcl38r0F6l08gKV7mO2Lb5vQA58uS+amTcxUphMbs0sr
         Sb2jiAufQT0Zgg8/NUj4rZ48FxmItIHrPeh527yy0d7k5OLwBNcejTbghq1sHvCeArR2
         zxxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oCWqJ5nR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49452587825si125038371cf.432.2025.05.13.15.59.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 15:59:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oCWqJ5nR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEyaZ-000798-3W; Tue, 13 May 2025 18:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uEyaO-0006xn-Ve
 for qemu-arm@nongnu.org; Tue, 13 May 2025 18:58:57 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uEyaL-0003vB-Iz
 for qemu-arm@nongnu.org; Tue, 13 May 2025 18:58:55 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-af548cb1f83so5326416a12.3
 for <qemu-arm@nongnu.org>; Tue, 13 May 2025 15:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747177132; x=1747781932; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f+I0vjqOWs/SbzRNgV8IUlGqptpf8N7fkihxNxFiO4c=;
 b=oCWqJ5nRZYUp2k1w0ojQzlU84vfH5vTuOmZS5ZuGhaupjaWjDuPju0omp9gao4+HcT
 lb1fe+nGtDCXR33Q4HOMi3k9fwLnDRuSBTQdf7XG8uRHY0cG2/Hngtyj+BJNbcB2t62W
 5omWFbVetq/YHccdjQ3o4opHOPoVKoRJ1dLswckCQ0ppYvtEIm+YG8vErcWRjArtBJsg
 uRUPspuyZXmgpjG872bKUDfwNCd3YBMF/lc5OdwU3WzCxRJJJQlNb6TVit4Hs/UeE52t
 bTAE2Xwgqq+mqgKrjMG5ccJN3A4v4VKuEFo/36FfX9YQCkBi6HacIOwWz+VVuzBgu/FE
 v7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747177132; x=1747781932;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f+I0vjqOWs/SbzRNgV8IUlGqptpf8N7fkihxNxFiO4c=;
 b=lrAXJ75H3ojoD3QcQseI+3ORWmEVCmWUq2MI4DJbtYb4ipLJN1EsZIjohbrhnZf5uH
 uQPyhW/mIRpsqYLentB5JnXMnBcx5rsKzzTyIEm49EJMUzs7z63Eb2WH13WzAv9PsTSb
 BGdsQYwBi24NeWr0+11h+qvQ9kn3OPGxGDNj2z+Umqwp8RlnWzAvfg8cPq2N5KHJ0EI/
 TK2KOr0lGD2mCnKQ7CT4j+iBIggCq5J94lrRCuoHDasI+qtmxGssFQlLZGBdWu6moi1Z
 YOrqblik/95mxqyUlYVLIJn+tkrTNatwwClP41R3ZpX+lp5Q6ZBDlMwNpdnzFfNrxpEh
 VsNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaKW+Le4fZR5jJBia8+MFgZkTJz09fNpCbJrjsC6+vx4lMWmUviQr0WJVkd15hFAN4CVjE5MLEQQ==@nongnu.org
X-Gm-Message-State: AOJu0YxJEK2cwNz00jnZpoD4Ok5nne8tg8UrgBGCAUe3LH6gNbnq2e9Q
 MoPiqBxYwJy7e6IWlK5wVrwqcxI8qraRaDJqvT+yqR8IYFes6SzQGzOol+3irc8=
X-Gm-Gg: ASbGncuq1Z+dj6gjWOB2NXnTd3K5UhnRj0xG6xB1J5MM6NSyj7/GsuPyNGcMkdA94qd
 ri64yeBoUSPtu5PJOaXv5xaFbxdNNqA2dRlNvr1xLSGopCU5ANRx5iZ2YtsGCqTB1ragKzrKd14
 0cyjvuS5qWkJfPYf/k6flesfW7axhZKNePkJRTvyJ79zuihzFkpzxNIBiilt97U4nTRxH4EAX3N
 fgfq9IstOxRQzJLFug6W/7nBJf/vYe/yK6xakAYdw4l5xWuz9T5AYQqDsRGGYWWo6mIMcEg7sgn
 WWLUlUW8liyXQlpjhFfHQ7d+oVxScVHCPS7wA2TYmuhft64wjPUcXwUl1n0LR8NB
X-Received: by 2002:a17:902:d2ce:b0:22e:56f4:e187 with SMTP id
 d9443c01a7336-231981401a7mr14226185ad.22.1747177132152; 
 Tue, 13 May 2025 15:58:52 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22fc82720a3sm86969595ad.149.2025.05.13.15.58.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 15:58:51 -0700 (PDT)
Message-ID: <d57661e5-112f-4805-8a4f-75780d679fb7@linaro.org>
Date: Tue, 13 May 2025 15:58:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/19] target/arm/hvf_arm: Avoid using poisoned CONFIG_HVF
 definition
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250513173928.77376-1-philmd@linaro.org>
 <20250513173928.77376-3-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250513173928.77376-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x532.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Gr3ULmtsykdy

On 5/13/25 10:39 AM, Philippe Mathieu-Daudé wrote:
> In order to allow non-target specific code to include
> "hvf_arm.h", define the stubs in hvf-stub.c.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   MAINTAINERS            |  1 +
>   target/arm/hvf_arm.h   | 16 ----------------
>   target/arm/hvf-stub.c  | 20 ++++++++++++++++++++
>   target/arm/meson.build |  1 +
>   4 files changed, 22 insertions(+), 16 deletions(-)
>   create mode 100644 target/arm/hvf-stub.c

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

