Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp697006njb;
        Fri, 6 Dec 2024 00:35:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWHUNJtk6ChwVU2a3CqP4eQBrtZGuz6/+ileZL4puaaENfjFmnwX4zYjYyfWhfVFtaJTQM1c3V07M1zng==@linaro.org
X-Google-Smtp-Source: AGHT+IGcmMRsxy+FT8yVLBHUhvOJnEM1WQjnRhxjR2kIABED0K42x012pGdJ8V7Wic0Imt08LAB1
X-Received: by 2002:a05:620a:4153:b0:7b1:11a2:189b with SMTP id af79cd13be357-7b6bcaf1374mr396181785a.35.1733474156927;
        Fri, 06 Dec 2024 00:35:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733474156; cv=none;
        d=google.com; s=arc-20240605;
        b=HrNJKUsXmxbBv0wZkI2/T279iQe9bab6QgCYs4HJMZduCwQDJn6M9GHC+7ID9gNq0k
         VGS/8KJK5Bg134skCPyWYADnP3rRZqkGxchkjjZDHId84hV47lRC/3T8EwzniEpLjAV9
         c/oMBnxr2r7nBSM9oHwn6uuzkXPJ/xz1hF8eWY2WwbeLtFXZulz1kgD14tshIawK9B66
         Iyn+bOBJHYe//2t6k3NXkHFtRAiSgSbLZcspbXogVvDe3/iQaJT/DfOSxWEr03zjBWOq
         yOGwiD4LGGjHt5qKXdGOkzvZvWPYBz0bxeHNesIcARxPhaKm3aESIoeRS+/g6UyXPWHc
         +/Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sbEGoxRaiX7JPEjTqysHojsMZpJv727XRzSofmqRROQ=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=P9VFjb4wOzCioYGAHveqasNzi8rx4GHqd8gtYTK9SJPa2MP5jUQho7nyp9RvMwdkq9
         cMHPcdZSquyfW8X5rO4+7pcQnWybEiGTndamxtITVw2JcPuIDKV1Lu1vBsttp6AQjelj
         pI5GOVfHdobWadQidXiNqEH7ZkrcE/ijfuTmcT/4+T1VDv3HHejxSwaPnF9EmQLLLFtA
         kP8Kxotqrr7HzglNcFB2WhTCQMLCnYcHBX8UO+x/FTMDZaknScFH5olyW6poyo1FP8+a
         u/Rc7qfLfBrvgeZSVCUKVvWOt90cBTnEnUj4h1mOq67jVfdV+PQ3xKWdgNTZEqSQ2TtA
         hc5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UgEg3CXZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5aaacffsi369725285a.457.2024.12.06.00.35.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 00:35:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UgEg3CXZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJTny-00085c-Tx; Fri, 06 Dec 2024 03:35:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tJTnp-00083F-0i
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 03:35:09 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tJTnn-0000RQ-Fs
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 03:35:08 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-434aabd688fso11785585e9.3
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 00:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733474105; x=1734078905; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sbEGoxRaiX7JPEjTqysHojsMZpJv727XRzSofmqRROQ=;
 b=UgEg3CXZXyZ8TopxqLzpGB+1pyZpaffoctVBlNwjhTyMOccTmIxBizqXrTeIGagJco
 59R1DSiuYZE0myyTZycEc1UZe4e3YMBqALT9Nz8GsBx7FzJXOv/kATfCvMPOv2+7Jd5g
 EK13W/mywPd/CWQ9Zd6vwc45cFoVc38I/W8w3jpFrYgYF27fOH8xiJJKmli9VHufkVRR
 wtRrcO3c33GeW95A3Qz82E1MZnswCHFU/B7z6/FXnVLppKN7lvaBHv5mtsJW4/WYSzeV
 BoAb/5EXvMScX+Hd/RUMRfRYuqo8oAdtbqDaUoaufBFXOMgWjbhxmjBvibeeX+dwuGfe
 cFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733474105; x=1734078905;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sbEGoxRaiX7JPEjTqysHojsMZpJv727XRzSofmqRROQ=;
 b=agZ/Ufv7GPYNQITqIF4VW2Le8ZJKSJmxzwCJ5HgRQvQ+RKEX7Wttz5qaIdxRdNVv3I
 n+Lea60etwo1esVlw8qGRKB55fBJLkZxUjuK/aqjMwBSa1gIVCLSPsvPqEqMdFZIQDJz
 fP18TT7IfDngzlcA0Mine4jdX+QZ0cwWbNaH+Pe0ixxT3g6akYstmhTFRK/psmG1DN98
 jSdHjssf7ERXcNTwnyhwhwLxE0g9pxlo6uRoJ4QqcLOsEbFLzSNoQMKS/Sx/nnTuIi/J
 upsqfjK3YgwqCpxj9CqSHei51gSuHtsVyZr3l3qyAAX9Z/7jk60Ub1iaY3LuTjNcqEK2
 FRYg==
X-Gm-Message-State: AOJu0YytRX+s2u73DDVqhg7Q/ra94vWfkgKla1m7XRwWX0iRkFR8HV8H
 EBO3mnVMu+krtlKV19Udu/LfgWD6x5Za5RTdinc9B8afFh5S3nDLIBuqTpdEKVA=
X-Gm-Gg: ASbGnct2z5ml4fGg8P8IG2lH7vocieTB94O0ibKnyHY1mMc7miSeUAqHJ/voS5kdi/K
 GzTu5SoEZRXbbZHXsckZLiwkXG+1LdBHnCAAgMPV/YTKQbBrRIBaqvb78TgioQDIV43oupn1f4U
 XKcuYCr+KAc5Fc4qx+d6na+C3MZ4VfbbVDEPbG87wVt31LusX7cJbJXaoCeJkLQ0GwkcrDUQtXJ
 FpU9a1XAHhEms0SOSKbIrjUHrNz05d3FybDOliErif5pXSclNvNIZEI8PPknlBySsZ8au6UdyLW
 h0U5gos5Ke1rLlVwjQ==
X-Received: by 2002:a5d:64ab:0:b0:386:2a3b:8aa with SMTP id
 ffacd0b85a97d-3862b3d08d7mr1490004f8f.37.1733474105396; 
 Fri, 06 Dec 2024 00:35:05 -0800 (PST)
Received: from [192.168.69.223] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3861ecf4164sm4095330f8f.9.2024.12.06.00.35.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2024 00:35:04 -0800 (PST)
Message-ID: <8c158a63-8a50-48a7-8a7f-6dfcb0a9d4ab@linaro.org>
Date: Fri, 6 Dec 2024 09:35:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] target/arm: Introduce fpst alias for helper.h
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20241206031224.78525-1-richard.henderson@linaro.org>
 <20241206031224.78525-2-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241206031224.78525-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: GNd8PCOvUQky

On 6/12/24 04:12, Richard Henderson wrote:
> This allows us to declare that the helper requires
> a float_status pointer and not a generic void pointer.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper.h | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

