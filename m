Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2541359ejf;
        Tue, 27 Feb 2024 00:35:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVcfrpcaZrgZfTzIVEw55X0LTHO0fg6OJn2kwr/Sik4M5xGJljAMdSTZgCGoYmH1Ps/t8zC/2eocCs+ZLw93EqhEbqTQH78
X-Google-Smtp-Source: AGHT+IEU0cLJPWwuw2sGN9oIpVO8RdCQe8Cs6QEWfWmCOYNrcShX5eybHkR1XW9YhzPQwHiqvhMg
X-Received: by 2002:a05:6214:2b0c:b0:68f:e80f:a27c with SMTP id jx12-20020a0562142b0c00b0068fe80fa27cmr1929025qvb.47.1709022946273;
        Tue, 27 Feb 2024 00:35:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709022946; cv=none;
        d=google.com; s=arc-20160816;
        b=bknfCTt1hJ7ck5dASK0FxEJlALd3e7HMKQtQQFPUYjHVLJawkR27PZM98czeXqEY/n
         kPKTMqV/gG4uUGjD4R55evfqEL3Zk6us22rrShzSyuhcGZvgaDGHdX2/sUwDo+3u4++i
         QI0U3YoYBYKNRx4hnfqZBPiMVDYnrGZH6iXzNwRdEVK9nlEZklhmlaWE9OEgzA9x/Fnu
         RNl/vqTglqyOMg0oDnK83YSbCKPuCnhUINTgs9HgyLfZW0Epy4zQEafG4aCR8+u6ynJr
         hWaVEiZyS8q0HH+MHK+YO3B4nlJmLXnmuOQSUoDhCNkv6ahGr0Wv02TyOyjnJZrlJMNc
         mJKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7A2N/cn8tcziVfpedH/RKKGfL+dxT5FGgBXITiVvAUs=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=ChvTanyhivX0UUP+XNIDcJlZl161BEzGCN9PZjh324sXrVaQdEjf39r3L5vFOO1zOp
         SE3InQmq78fXAU665UH1UJF8bePhuPtJMtunzLjB6VY7N01eO42RPzOjQFFwzxwknrc1
         vo5XcOKxuEIe9A46eYo18cTpCrhcSJ2vq+tobFYB2VVPzRU6g+n6S/f5haYj5jFQbigO
         WUe6X+4wHbE0+JH1vwRKcd3zQDPcWPyoxMwMlBLVNIE93ufA5icJko1gO+ztW2HBdxNC
         EE5Q+1ka/T36m2W5WF+AtYnMVlNho0QK+4oCycwem/PeSU9W0gH2xtNShMIpxRFQ7pRZ
         ZboQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rfaqXUXx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kc22-20020a056214411600b0068fe284de30si7081783qvb.111.2024.02.27.00.35.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 00:35:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rfaqXUXx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1resvs-0002jj-LJ; Tue, 27 Feb 2024 03:35:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1resve-0002hZ-R7
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:35:14 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1resvb-0006Hc-Rc
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:35:10 -0500
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a3e72ec566aso504361266b.2
 for <qemu-arm@nongnu.org>; Tue, 27 Feb 2024 00:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709022905; x=1709627705; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7A2N/cn8tcziVfpedH/RKKGfL+dxT5FGgBXITiVvAUs=;
 b=rfaqXUXx3NrmvGEiMkZ8NMdwbsQ9gHb8ULR7QwvhMh2fH0JNVqsjqzM3rO2VOxEmdX
 VrCa1HL190kWYDFJXEzdt8VnAESakk5cx1W1bJIHsILH/iBKCffCGrwZpBymQrdoDNmR
 E1GYOkPquvUY754kYpklDb2z6QpXq/DRlonEsZtw0aEZV+0wDNJV74+ogFsLEIOjPBAx
 ljH+4UWExqS7MhHIlsxnv9P9idYy3AhEMgpGOR6UCQoub4b6556j3Qy81CCRG/awPEdq
 /gcBv7VDOYyKyY+RcC/5ALFW3O55UqegV7eU9aGfGeh1w8K6l/YuxUQGM7BtLyj8CFKD
 R9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709022905; x=1709627705;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7A2N/cn8tcziVfpedH/RKKGfL+dxT5FGgBXITiVvAUs=;
 b=AqpL87SqOIADwUjxhdSQAbRdt+DLvnOY1DPlwLqD8di6syq91i3eoNq3DYbkavP+c7
 EswcSpSadEX7JwgdBN2sECwv3MM4maXf/Qh4x6Bo4zZiiAiIDKDkeiLuYmmqhlsoduWF
 LMclm+n/BkL+BaYvDbxAT/BMx2aiBTM5+mo7Pult4aEbD25vg+jD+XaY8MLt77rM1zAm
 sWeeU/Njys3dA96KBjlQWT6ib4QMn/7h7RROwHTd952iCEnbXzebHdl9TZBTP1/sd6T6
 Z/NpizHgT8r/4R16WnCdrJTX9jUSGmW+3jN/sq0RNzuWa8Fz9m9sSxvcrn0z2NXe7aa+
 JIAg==
X-Gm-Message-State: AOJu0Yy4QeN59JyE0JlhCpl6UzBgz79eXRqHQUYiP0L+cwaqsbulma/J
 zcQEUj8iVoOvLo6EO0JqWWhAdJEesCd4q+vBi+MohegR9yTsYsKTq5l2spJcmzI=
X-Received: by 2002:a17:906:6c8a:b0:a43:a566:c188 with SMTP id
 s10-20020a1709066c8a00b00a43a566c188mr886562ejr.57.1709022905549; 
 Tue, 27 Feb 2024 00:35:05 -0800 (PST)
Received: from [192.168.69.100] (mic92-h03-176-184-33-214.dsl.sta.abo.bbox.fr.
 [176.184.33.214]) by smtp.gmail.com with ESMTPSA id
 m16-20020a170906235000b00a3d153fba90sm524141eja.220.2024.02.27.00.35.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 00:35:05 -0800 (PST)
Message-ID: <68f05bef-62ce-44c1-bf6d-343dc87b338e@linaro.org>
Date: Tue, 27 Feb 2024 09:34:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] hw: Remove sysbus_address_space()
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20240226173805.289-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240226173805.289-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: Tsv2QM1GhZXI

On 26/2/24 18:37, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (6):
>    hw/arm: Inline sysbus_create_simple(PL110 / PL111)
>    hw/display/pl110: Pass frame buffer memory region as link property
>    hw/arm/exynos4210: Inline sysbus_create_varargs(EXYNOS4210_FIMD)
>    hw/display/exynos4210_fimd: Pass frame buffer memory region as link
>    hw/i386/kvmvapic: Inline sysbus_address_space()
>    hw/sysbus: Remove now unused sysbus_address_space()

Series queued.
