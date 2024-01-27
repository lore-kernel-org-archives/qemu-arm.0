Received: by 2002:a17:906:3554:b0:a35:2c0b:b7b4 with SMTP id s20csp79175eja;
        Fri, 26 Jan 2024 20:05:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4FPxNTnTNl6lgY4Rp2a8UbB/b4EBoYw5jGqSCfkVMYL65OE6besuNtEihn1/JeV1Vfdi9
X-Received: by 2002:a05:620a:2786:b0:783:8a50:48d8 with SMTP id g6-20020a05620a278600b007838a5048d8mr1002915qkp.107.1706328349783;
        Fri, 26 Jan 2024 20:05:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706328349; cv=none;
        d=google.com; s=arc-20160816;
        b=p4YLK3xjdejy25GgAKIsF/qEkj6zd7ZhfcQrxBvn+gFBTEZp8lsVa47vppZDtHKSTI
         B5KnIWIejSG9cGiZ490Uesol/DtSt8FYsWGJmKRPZNmtFQ3AkFuhKcFWhK7cMH9xdR/1
         LM4LVfg0hCJhHYix08hdI/8LlSFOf21TGaCUFsAb6i75rTIpceKsXKA4IhXwZKiciJ0m
         0zG4l30RdMT0LDzk1jarVfDNFzc9HAIIJeNmIjed9OmFcMMjdWuMxoWMQVl6mlo/N+uH
         1l+tmKdRtVrZvmHhEa0YnvoK2Jr4/PfZ4UyEPJOLNNi8U6YtriwcT9ulQCzo2sxmKMdI
         gO9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=BAOsItuQ/gF3bbUxSX4LRTRNpXMVaHIAeAj7sbM1MNk=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=OTMgJ07H+PZxScRJPWvHkMg6EeGRZfpthr18nVQage0fXa1Ve73IPiucxapVWWGB7H
         r/DpS9vGV6mdAuB4LdHkzfM6adLYUgqmCOrPkS9nqvHB0nZIe/I4HYBIrX7HDQn/fpfo
         MhMu1UMEwhj6krdPRzDR0pN7c0WL/JUNobeugs8t1eTx8Gl/BQzo4+MceqXDJj+wvTtR
         j2hnME5YlUY85DIHF2DngfiqsXnbvptsp2MdfBiwY+wUwyrCdWFtDCxdzM+htDuf5bZR
         cp6pbWeqKvB8G6oKzOl2FQzZ2GqYaxw/cHqEXyUX8lD3weXDJ30qRgDuYS9W51XBZ0U9
         Lyww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hzOmBU9f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k23-20020ae9f117000000b007839190f0c4si2688673qkg.209.2024.01.26.20.05.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 20:05:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hzOmBU9f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTZwd-00058Q-GR; Fri, 26 Jan 2024 23:05:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rTZwc-00058A-7x
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 23:05:26 -0500
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rTZwZ-0001ql-8T
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 23:05:26 -0500
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-20503dc09adso671209fac.2
 for <qemu-arm@nongnu.org>; Fri, 26 Jan 2024 20:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706328322; x=1706933122; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BAOsItuQ/gF3bbUxSX4LRTRNpXMVaHIAeAj7sbM1MNk=;
 b=hzOmBU9fgaXylMAI1OXlvee8bwy5+Th3ZLHvxyXGoU9z4Hzo5bbqInZlzGQLLmCPDB
 4qH/mFZBvxumjOnm0zZ8SrjEJg9mWg81SFCZ/d/xhPQUw+h/lTIx/Xlq/tKeV52A5nmz
 N/9c3uevDajP9iO9+UlpeXhqX4i0bpuh82u4EWpk7C0bofiRgK2CkWF1ebVEtxAHhx4w
 7upxwhibo8crHVdTswKvFW3TFYwl/1hkeS7GRjZ7JovlkM8wZeLsuTSTj4N2y/foOYqs
 PWYBZzYYGvbLiKNJ1SFUm0qYoHLbB8cRAszay6mXhdE7FRKe1mQJoOnNVsly2u8C1qPe
 tXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706328322; x=1706933122;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BAOsItuQ/gF3bbUxSX4LRTRNpXMVaHIAeAj7sbM1MNk=;
 b=GL7CqzDddOxM++qVGoodXP3Ri9DgF67AlqcGuulvm4Grm2ch9hMZ86XuOVGB4w1EjL
 /yfF+/GbGnIjytRtb1B+l46WuyIsWl7zCoAXWPQIZb48ovjxHvnVQSyAZbCKj8A+EOiH
 x9B3wYPTfxCC9eAWCMY2+BQcogqCZW/YmPEV+5BS3TJ8EHyeDZauf3HvJsbBinY7VQL9
 Q1e1QKa0P25XeQ9KijMIcQFjwSNrJ5fY+5J28nwZiYDDl/LfhzN01L6B0Q6r3HQhmEvS
 3JHXEtwPpoALaQCqmvBN2fZLsTpV0n4klMNF3dy76tyy2nQS6W2l0hXEgr6f7Cn0ZY6J
 bUGQ==
X-Gm-Message-State: AOJu0YzCq5ziBXtK+65o61VrzaJt2UZfcnYu/zJNhFY+Vu5F6sh/+ow9
 nrmX+QxyhIE0RAB0ENVPYQtK+7nSLXf2bjyeus+SLE3gwAp7cGxkxeGsWjqpCPY=
X-Received: by 2002:a05:6359:4c18:b0:175:5673:2694 with SMTP id
 kj24-20020a0563594c1800b0017556732694mr881216rwc.44.1706328321744; 
 Fri, 26 Jan 2024 20:05:21 -0800 (PST)
Received: from ?IPV6:2001:8003:c96c:3c00:b5dc:ba0f:990f:fb9e?
 ([2001:8003:c96c:3c00:b5dc:ba0f:990f:fb9e])
 by smtp.gmail.com with ESMTPSA id
 fa9-20020a056a002d0900b006d98505dacasm1814464pfb.132.2024.01.26.20.05.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jan 2024 20:05:21 -0800 (PST)
Message-ID: <96b28d3c-c35f-42f9-ae43-7b733043a7e5@linaro.org>
Date: Sat, 27 Jan 2024 14:05:16 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Reinstate "vfp" property on AArch32 CPUs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240126193432.2210558-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240126193432.2210558-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: SkOhs1Jp9FM4

On 1/27/24 05:34, Peter Maydell wrote:
> In commit 4315f7c614743 we restructured the logic for creating the
> VFP related properties to avoid testing the aa32_simd_r32 feature on
> AArch64 CPUs.  However in the process we accidentally stopped
> exposing the "vfp" QOM property on AArch32 TCG CPUs.
> 
> This mostly hasn't had any ill effects because not many people want
> to disable VFP, but it wasn't intentional.  Reinstate the property.
> 
> Cc:qemu-stable@nongnu.org
> Fixes: 4315f7c614743 ("target/arm: Restructure has_vfp_d32 test")
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/2098
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
