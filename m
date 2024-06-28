Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp207383njm;
        Fri, 28 Jun 2024 09:02:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVPz/CrfhjbQKGjkJ40kk5F6INGXehxEqGBd7qznlUJMbhbssfqT/fAwf91gm6Ysp0R7EOQAj8Cgi1DYH6X7P84QWo1Tbeh
X-Google-Smtp-Source: AGHT+IHt/4/5OmMUtaSnDWAuPAFncUokHgDAJbPtj4ZknblXy9UaEZAUo3fuVS2NwjGyYTjtb0Cd
X-Received: by 2002:a9d:7b43:0:b0:6f9:62e9:9f93 with SMTP id 46e09a7af769-700b12a1d3emr17956562a34.35.1719590574085;
        Fri, 28 Jun 2024 09:02:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719590574; cv=none;
        d=google.com; s=arc-20160816;
        b=a8lAsnUtLw4pPsq5j+mkjZQzIFL/lrk5cw9sOnOXLrdFESI69QM4GWH66GrGz0IRok
         axoo/GgD1jRU4z9rOqIPToRDSmDlS0GpCJlW5LPLg3iaFbJ8JiFBmoH1kp7TMbQz1d+6
         S87CU+6ubnM/U4vvG+dd82XjhIHadwsjJ1OcdMDkNBdPeB0yl2gqFi8s2o/v9Tl3sHvk
         81FdwP2kgzEbN0VXnixhvVRuGE6+LFuFWRZ3vza/gABTf4yS+F5vxOxGAkKxEeNeqgFS
         9lj0kz92scRRtkiVoK2Frf1340ee+uZE8KoYBhYCyLC9fvDxmq5e+o8RgkWC1ZAJhNGc
         4atA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=PcscZ4C0HsYscMyQSfmVuPsZtBmqdTuyKlPKREymHEY=;
        fh=bcSAqNGrwbxZLR33lM8pMEmI8J9bZAxfJdIRlZ3MwXU=;
        b=bXlqfH/iAjuY1U/snZQHecPm+tuX9lu7avFGK2u/NZ8YpuRzUaS+7veH1YHhoTuQdm
         cM6ruSdS4y7nWm6FXCf58QgRR+xX3/9Aasr0JONjFYoCJEZcguYbfcI/ht7tdYeR38Hd
         YEO1HCM04gIbaC/8mkwT19aWs1FTjH7mbCym5vu3PIYevZMHtri8Gxh8e/n8FTzJfo60
         q1n8PUJm3CdjQ0rnz6ENF2+ypzUFjQvzoFKE7S+1lIhLiRiYf/SeUvZ7p9m3mF9bbXvP
         RvLM1Aagf7fO4oJxmbF03AGwZVJE/Z7IzKduS4vCyvB/MAXwLw2+V3gfCG2hHteJCAmA
         OZIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nTWHuHxV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-4f292265f9csi314521e0c.243.2024.06.28.09.02.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jun 2024 09:02:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nTWHuHxV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sNE3Y-000739-FM; Fri, 28 Jun 2024 12:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sNE3X-00072Z-7V
 for qemu-arm@nongnu.org; Fri, 28 Jun 2024 12:02:35 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sNE3V-0003Mr-Bz
 for qemu-arm@nongnu.org; Fri, 28 Jun 2024 12:02:34 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1f6a837e9a3so4454795ad.1
 for <qemu-arm@nongnu.org>; Fri, 28 Jun 2024 09:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719590552; x=1720195352; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PcscZ4C0HsYscMyQSfmVuPsZtBmqdTuyKlPKREymHEY=;
 b=nTWHuHxVYIjlPIi4qKnxaa8XRuQ6eNjjLfpMSLSU2lFuBmrXE6QraXCo+PU0fkMdgj
 LNC+Yc6OciUO1xLAWBlnWJrrx+GqWU+itkgKnZ1Lw9M/2ETYxUYlYdmNkKwnLm5cm8oz
 KykN04QY7CYrYjLytFKJt/Vv33Q4tJSVA5+bTL6DeoKCZ+dCF4YvkwU6JOwfYj6X1YRj
 9lun9LeVBliqx6WZM/dWg6aGzVfqszl8iG7OdaC9pO9ik/bAVjHN0+dKwa+lQ9vvsNop
 weMOJY5Ng2LSEGmAHT2QGXnusQqAJM+jrV6aIlbey11bovWTCuEtx96dapIyBVIRovD4
 hXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719590552; x=1720195352;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PcscZ4C0HsYscMyQSfmVuPsZtBmqdTuyKlPKREymHEY=;
 b=ef1DwZDhyEMiVMwn8PxQh1HP5Ib+OTZW7mmqy2LnjKFxiRSjgMw7+mNPM+cX0pYE2t
 AnmVR22YbdZiNUcZKY36WZlFL1ZnXe4HcvpR0kfog/fOMuF9UCPytMUnJErOZVmTY0x3
 o52YP2RdiqGYqlsrnBuxlS/20BzgZ+yRZoqrVUUmIhq3mWw2cFho8rXz8TD77WYRzLjS
 4K8ed2FJ4sj6RgSmcmYuX0/2UtSXMOqO9L4kyVrS/8J9yavJPMYLZieq2IJ1Ers2IB7H
 2Q+yhircZ9tIFJ/Bz5rK+wCL2U+Uw0zcqp+8R9SX0CeQMSuFJ4NGtkToC1g3dBeRXrVD
 tFMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWf9lynz/KvutXTqm+raz42MYM5zW49IGYdYAGjFkeTwhNaO6K3NJhq3St/EaIP3EhTL04D/xMbzi3qXesSD23FWhL
X-Gm-Message-State: AOJu0YzhlhZj/ZERaBWHDi2Oq82MTl71CPpg5zVvv/snIpRU3wx3eCmP
 ZKwAo4GD7mEV6aEZw0EXixZERVFlMRUfW1qrmlYtloTLLeK+AHCjdM/+vtdmCTI=
X-Received: by 2002:a17:902:f685:b0:1f6:ed89:6bca with SMTP id
 d9443c01a7336-1fa23fb2970mr171922935ad.39.1719590551580; 
 Fri, 28 Jun 2024 09:02:31 -0700 (PDT)
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac15b892bsm16902395ad.303.2024.06.28.09.02.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jun 2024 09:02:31 -0700 (PDT)
Message-ID: <6f45f5c1-787d-4ca2-b93a-170b1eaa673d@linaro.org>
Date: Fri, 28 Jun 2024 09:02:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] target/arm: Implement store_cpu_field_low32() macro
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240628142347.1283015-1-peter.maydell@linaro.org>
 <20240628142347.1283015-6-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240628142347.1283015-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
X-TUID: dWuOx3vjkAQh

On 6/28/24 07:23, Peter Maydell wrote:
> We already have a load_cpu_field_low32() to load the low half of a
> 64-bit CPU struct field to a TCGv_i32; however we haven't yet needed
> the store equivalent.  We'll want that in the next patch, so
> implement it.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/translate-a32.h | 7 +++++++
>   1 file changed, 7 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
