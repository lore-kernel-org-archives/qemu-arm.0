Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp1208277ejc;
        Wed, 27 Dec 2023 15:00:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFND2C8H4QHxEgC/RmJy4jvcajmHv+Gp2SAo8R37KAO7ZScrjQpjKYAydpTKxzgtINUuzXh
X-Received: by 2002:a05:620a:1228:b0:77f:3bb5:b7dd with SMTP id v8-20020a05620a122800b0077f3bb5b7ddmr13360162qkj.31.1703718004275;
        Wed, 27 Dec 2023 15:00:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703718004; cv=none;
        d=google.com; s=arc-20160816;
        b=ixpGbW5HYqgEikLD/hjv9AJbfPfjjXe4qV0oPU0CXIvuCanyBTt5K21V3/4ce77YuX
         MiOANE5vQvrzyPN5HpoyHcbNza38TnG6ZdyV552+1jkN79RrOr7lx3kGrtrzMnF2seNg
         gYn+JkevqFvgzcSHYqBg9RjtWlnyaFXaLeab1JIm6sdYopf3djwqpf36iUWyfOAKEU4l
         Qr2P3AIazfx4UGuuDGIsz0w0sSZUQeqli3I8EqO4uH7uip5i3THL/HuPEnGX2VGByvQG
         3GDsYldx9XZRwxt6lmCH8M7QKr8Nti66sG7ptmWdIoTdZ5PhVtpyYK8DRi39x0eMIyPi
         4cSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=U7Cg0qgeJDO8hUitgUPQBXjPq3+kZodNws2iN2GZNj4=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=HQX7w/YWZpaXjFvBnMCwQ1VuVWlwEDZAV72Z12OeseRI6t4uRD9uYUEB/Pb1qPbCLH
         UakmOeA+C9yK4mtGbdxxVUAra3pFlogkd0KYTC9Oh0KXn9mg5bAcCYBUzuhE7NHTEOIg
         2Ovb33B0DoIShC3Mu/ykA0d3QuStR8K5EVn3hDTeKIumb0MfLGg42bcstxFDOSPU0SCN
         /LeCbG3VxVPvvXT3OL2dO/XTBQZ+1FAG5GADxQfwvA8RtMvWSgUtwSx8mUOv8CqUgRfQ
         NW+LG+0q4kFkGKwotGFs5H/ziNFBIzQFgfPYgRML9eMeFMtEWQQPLZbrR673qKd7F6hb
         yAkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dut30aZC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8-20020a05620a260800b007816e434d6fsi992898qko.342.2023.12.27.15.00.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 15:00:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dut30aZC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rIcsU-0004vr-7Q; Wed, 27 Dec 2023 17:59:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIcsS-0004vE-C6
 for qemu-devel@nongnu.org; Wed, 27 Dec 2023 17:59:52 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rIcsI-0003zQ-OR
 for qemu-devel@nongnu.org; Wed, 27 Dec 2023 17:59:52 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1d3dee5f534so43346875ad.1
 for <qemu-devel@nongnu.org>; Wed, 27 Dec 2023 14:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703717981; x=1704322781; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U7Cg0qgeJDO8hUitgUPQBXjPq3+kZodNws2iN2GZNj4=;
 b=dut30aZCH/cOCdrbAnENE68W343zyz6yvuHyjWZOZpjAO8pF8HvCjbfXFEo1lTrkKo
 G2xBSm8qfPVvgylWFbw8GKBGAsYgVb4+JE9xPJH9u/Sqqn1MMGSsDJr0sCh+KPSJR/j4
 g0mE7cZEihGUaGp0dnrhO5LQkT77sY8sNCppyBdc34yu4O0NSvAfBP/WYOxwhdgC1Ahb
 r5vLAv/VqcxlWEbkW1UaXPxDt9CcLFxuKFw+B6pzOURD2DjtjY/NekGGZmeWBEsP2sWX
 BHr0bg82H1xJPZ8y0N0nn8amIaIDoeSoULfdTOtY8//W4NaHzIgSjncxB7DHrjtmMr8h
 3MWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703717981; x=1704322781;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U7Cg0qgeJDO8hUitgUPQBXjPq3+kZodNws2iN2GZNj4=;
 b=OZOmHkZVbqeBv3w6fqpaQCQ/5ruhia/iKKiCYx8/ZM+dz5WIs07rq/SjxGI+9Ed+qW
 l+bXCp1LfmEFZedjIMYuh2hEV0gAOMMjwsi4Dcap3fOBthdkoukld3cUeY16nskSB2Tq
 FuK44fDmk41o3VWGbyZyi8chCS0EmFYQ/dOuFh2asMDXQkbSUqrrrt3lE2py6TLsb752
 6DlMRW+tAMC/txAtEG/YmK3TevkrIicqrv8FgkkK0SAvdrkn+uTwhjv86hyozfZM0znR
 f5LD+6DXOMb7fhmaR/dSkGIlDevhkX8CI4zw4SNqtorgtWHP9n4o2YPeSl6myqnFQbK0
 +SFA==
X-Gm-Message-State: AOJu0Yy+B/k+rn+4+1ZEhgomMFlIFdawn2J3HdvZu7u0M+M6FCjMJjek
 gI/1oQ0QxZskknSQql4hKF4F+Y/Zyr6Op8RT51yft7SM7JjX1Q==
X-Received: by 2002:a17:903:18d:b0:1d0:acd4:e711 with SMTP id
 z13-20020a170903018d00b001d0acd4e711mr9981088plg.15.1703717981527; 
 Wed, 27 Dec 2023 14:59:41 -0800 (PST)
Received: from ?IPV6:2001:8003:c020:6900:12c1:9684:874a:fb3a?
 ([2001:8003:c020:6900:12c1:9684:874a:fb3a])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a170902e88c00b001d06df5c1absm12529753plg.86.2023.12.27.14.59.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Dec 2023 14:59:41 -0800 (PST)
Message-ID: <537ff3f4-2c7f-4b9f-ba15-460f74c88407@linaro.org>
Date: Thu, 28 Dec 2023 09:59:38 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/35] target/arm: Handle HCR_EL2 accesses for FEAT_NV2
 bits
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-23-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231218113305.2511480-23-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rP805I7OKHpO

On 12/18/23 22:32, Peter Maydell wrote:
> FEAT_NV2 defines another new bit in HCR_EL2: NV2. When the
> feature is enabled, allow this bit to be written in HCR_EL2.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu-features.h | 5 +++++
>   target/arm/helper.c       | 3 +++
>   2 files changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
