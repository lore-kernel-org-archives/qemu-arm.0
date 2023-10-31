Received: by 2002:a17:906:70a:b0:9d0:bf65:29fa with SMTP id y10csp335359ejb;
        Tue, 31 Oct 2023 07:46:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZBF18FnFOIVkHxv4UCG8ABZHL0s/c9WxuYT2eO9fQOp7YIbTaKfcFwkcuYRYJf7IZPhXy
X-Received: by 2002:a05:620a:12dc:b0:76d:ada0:4c0 with SMTP id e28-20020a05620a12dc00b0076dada004c0mr13063573qkl.76.1698763586454;
        Tue, 31 Oct 2023 07:46:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698763586; cv=none;
        d=google.com; s=arc-20160816;
        b=NW1wbUYZ4rEAUrS71Jup3tjcRmoujpijdYg7CbyrAo3TfKfOrXJzRRNZzP1+0wWkA2
         UCU3MFBvY0AGA1DPI6y7Ai0B+Ury1HAOnvcBbWbwb+cV177zNaOmH8B4TwYonyufZSSG
         9eUrbmQ3Xs4vZnJtkMZyT2mI+MbmqY58usfkzPD2DMPn87T+Xczh269YUBmhGxyS4s4Z
         p1R6q9xZcmBy6WNaReu15UBPqhi9lhjEJnF0B902MOQQEjgQciV9EXwnCA+h2fWSGi7X
         3pApKvOy8Muu+RblsWiv94AmMem0NBFlI534mapYlHWKEogKh/y5+Kk6Vig8b1hItecg
         0lPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=047RgtvcukIz4kNat8Lzm0vKAlPYTcxs4B7MYJWhp5k=;
        fh=prcxYYbx+RM02aNBYXa1Zw568hdCKvxWihZ3BRWh01Q=;
        b=olAjq6UsEg0PMNPX8eM4JW4sIzQk1dz+Ufs5PCEyTRsWsELMGjApevhnh0iTfCCDrL
         Q7asJGv4Ecx4u7tFF7cp3Mg/KhaqrJtfreiHgoOe/2Ci3lrDsb0sJM/quRgDc3neTvz7
         qn2lAHB6GJUBI0bhH4qJKS2P25BU4R7g0vtlXb/+cdOjKSRWbW3ji+D/j8cais9idVu0
         VGwnLpfMTiBhb9a+1uc5sF0g+ZFRqYqcwafwAkApHldrSzV6M4TLqwZxI7SFBbs89zhh
         3st9SfrtLPIIUV4elecaUyHnHQZebLZzCepoKjrtIvmJyHrpc53hp+ACo47AVho7Td0f
         +NyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TOv1+0Zi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az9-20020a05620a170900b0077891c42486si1255811qkb.546.2023.10.31.07.46.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Oct 2023 07:46:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TOv1+0Zi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxpzm-0005oU-4J; Tue, 31 Oct 2023 10:45:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxpzi-0005dQ-8z
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 10:45:27 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxpze-0002Tt-Uy
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 10:45:25 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9be02fcf268so851055066b.3
 for <qemu-arm@nongnu.org>; Tue, 31 Oct 2023 07:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698763520; x=1699368320; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=047RgtvcukIz4kNat8Lzm0vKAlPYTcxs4B7MYJWhp5k=;
 b=TOv1+0Zi8889niqs39eR8iDgcqd+aEcG2mGG6aC6nPqkdvjgRPvxglB8n2Wz6223rQ
 qkvkhylKrZlfLGl20tp37vSDHhLB/IwGm0WU7B1mWE6T4GqT1kTVVz+GxvPnjsZLd7qW
 vcfI9x90lifpCaoxEIKxMAeL8qEWIzA7sqVYHPSS23HidFI5NZSwvip3IdkIe/YQX2kX
 Q9J0Hgpbe8EAhWHVBh/aIRsmutxfISlD48gvPvSfMMxuQNfJsmQqBH5UAcYH0BPachFa
 XtpteTC69cl6c4jsq2E40FZIChZQQc3cqrzA9bzyh29mR3/TSzCJaSRo6U3PbAAAYtYj
 6OxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698763520; x=1699368320;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=047RgtvcukIz4kNat8Lzm0vKAlPYTcxs4B7MYJWhp5k=;
 b=hVAZHMKPUERl8k9jCdwp68CanLHs1I1VSMq7QS9QgZ2DDcmPjDIS6V5LMJWgPQPNjG
 nGVP4v9kGJbM6AKFJpeLw3prWXUdEuhykljeZphfyYoDyNvL6IYX6KtkIpu9hGmu515L
 bT35mb4DPWwRRUV6czyDP5xmjLFWoJ0ACObbnNrobvxsVGZTA4RCjzvKndAsHZ19Md6w
 05yfLW29S5mNrf+AVSL4+zLHYJrcdqyg9Q09HIq9p/lE4J43A1nmN68M0/RSrVBxopre
 TWExDZ7kojBY05rql91kfJRLTegslQJ4bdO4Ig+xHJLbca4VVO3VPUyuMX8489PzyTnR
 sKXA==
X-Gm-Message-State: AOJu0YyOhXRYvkkGEoz3fqPEITIazQigQrKbZeRH14aKjB7FhZOrm3os
 1uOirE8jpI9ichUWbZFZU6kwQQ==
X-Received: by 2002:a17:907:984:b0:9c7:56ee:b6e5 with SMTP id
 bf4-20020a170907098400b009c756eeb6e5mr10989315ejc.40.1698763519808; 
 Tue, 31 Oct 2023 07:45:19 -0700 (PDT)
Received: from [192.168.69.115] (gjh33-h01-176-171-208-14.dsl.sta.abo.bbox.fr.
 [176.171.208.14]) by smtp.gmail.com with ESMTPSA id
 l11-20020a170906414b00b009b2ca104988sm1084560ejk.98.2023.10.31.07.45.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Oct 2023 07:45:19 -0700 (PDT)
Message-ID: <63c917c8-0a40-e922-45a8-105a9694f2c8@linaro.org>
Date: Tue, 31 Oct 2023 15:45:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v2] target/arm: Fix SVE STR increment
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-stable@nongnu.org
References: <20231031143215.29764-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231031143215.29764-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.053,
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
X-TUID: tTMzTvrCLBmw

On 31/10/23 15:32, Richard Henderson wrote:
> The previous change missed updating one of the increments and
> one of the MemOps.  Add a test case for all vector lengths.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: e6dd5e782be ("target/arm: Use tcg_gen_qemu_{ld, st}_i128 in gen_sve_{ld, st}r")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate-sve.c    |  5 ++--
>   tests/tcg/aarch64/sve-str.c       | 49 +++++++++++++++++++++++++++++++
>   tests/tcg/aarch64/Makefile.target |  6 +++-
>   3 files changed, 57 insertions(+), 3 deletions(-)
>   create mode 100644 tests/tcg/aarch64/sve-str.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

