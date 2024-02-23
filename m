Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp839346ejf;
        Fri, 23 Feb 2024 14:05:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUZcNRJg5bdnjhkRKPTuFxSPRs7mmpefO9E9UG2aG0gxNAJhrD/1zlx0GmJncec6otgYbITzDn8gbuTqOl3yyTCZXVqFQPX
X-Google-Smtp-Source: AGHT+IG1bXPmTRPnWpo5Ww0jFM3hkHZqRn58iVf8AVZ4jahPxAbojhMbzwx96iAesf6Sc7fAKRS/
X-Received: by 2002:a05:620a:4588:b0:787:5541:a037 with SMTP id bp8-20020a05620a458800b007875541a037mr1385473qkb.63.1708725909417;
        Fri, 23 Feb 2024 14:05:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708725909; cv=none;
        d=google.com; s=arc-20160816;
        b=EZlyGOFIW6/BXVDJXQnXYRm7/J97E0ZP9wCpWLZOHXjOW0qVN7Ko/uh8vm8jVhk0qs
         q48o7M195OP5+SK/rch7O6N0JiKxMOHS2T9kdPijiu5ps52PoWUnwe11McqIw878rbHL
         LQY2uFsbNl8Tf3YBXE0WVmiJru2JtfL3Qfzuacae4BOJn0fzyx0bxfZCA7SyhorJlqx1
         aR92+WN5bGo4XEc7ymzubxuD8NPnAm92Mb6prwWdAVc1RYx6cK7vHhDYbou4ezhJcCJl
         SsUJGq8k8pdl2YI1QNNUpYrhf/HaLb84wUQs4X+b+oCCiC9EK0mIfp+SC9OnFZHmRRM5
         OhHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=R+kqVhz6zPOGLRJQmu/yaid8WatTjhMmtCkTPkb18Hk=;
        fh=wOOXvM/plGtd4rjbWimrECS+VdjJmrbsIQ5azQyRjI8=;
        b=Owti3M9y8CNaZxrYe8PJf1ack5QbegTt9UyC+7KH9ljUnAaMKORTctBWs9aFC2vRNA
         CMZLkoHWthQOfJ2PpHude4q2YoLLIbAh3SarE4OteaCFyGVV3M1PKDw4slMxXA4/cuPo
         qCZ3ERjd3oLGbK67gtEhGY2dLHWVd+04NP4SF8YVyn252H6eucFrjssJPuGpdkwEQ2uN
         YJsecvYwvo/BdJWb9WMNpv15789IADT5+Y6VhFOc3u4ZLEOp/CXWwitIApyLpcfohEwY
         kQATI3f0L7NIebfEY/qRwJCWKWmqu6/LMiQ1DEn16wDg1iGP26Z7l9h6CPbEqQaAK7nB
         yLbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Spu6q+ZQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br8-20020a05620a460800b00787b3495e86si2254123qkb.83.2024.02.23.14.05.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 14:05:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Spu6q+ZQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdde7-00033T-64; Fri, 23 Feb 2024 17:03:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rddR6-0004MU-TS
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 16:50:28 -0500
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rddR4-0000kD-IP
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 16:50:28 -0500
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-599f5e71d85so887094eaf.3
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 13:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708725025; x=1709329825; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R+kqVhz6zPOGLRJQmu/yaid8WatTjhMmtCkTPkb18Hk=;
 b=Spu6q+ZQzAVkeFOso/ZSRQ+PMb204Ks0SjYqcrseH1YHMvujSC43p8X2HSClNjd+Lm
 vBJHLGzEJMEeyqmUtaRSS9dLV4GyMLZX0OqEmTQjbxlzSkYhISO9LDFbxOi/FdrD5jWy
 jIjz/z8MhTl6zD7An/GrzOsOvAzjLG5aXmcNY1X8T9emyLq6PG5BFZlBYckBOJzHu0D8
 qDLWngMmhgesdNIqr+yQ7Xaw7yMoKJVKp5wi9xWJr8EJIhLU2t1/zCipRIWc/p7guG6K
 CotGPHFmEx7HbS3Yx/jpBRysv4BGVJgNhLLjNVeHOslCsOnESMDFMjFNDxlzK5kAe+bD
 JYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708725025; x=1709329825;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R+kqVhz6zPOGLRJQmu/yaid8WatTjhMmtCkTPkb18Hk=;
 b=o5KrHEnTcwJgeX9bbaawIN2+8mDHuitFicLy4sHSbOh1b7TOTMYqmDtDuUHUDIdNSv
 g3UAbT9PitmICsGIwbXrxow9Brnlu4uKkfx8JV3FMDLoCopr73tMuzjeAhlpFhMBPus3
 n3qC3Ha2btp3hrUGzrPAJH3DsbT2C70fHL+TIHZVMPIR61AqH76a+h3cJsDjvhxnJFb+
 r17ScUGl5jD06xwnsWIKt17WCtzteekx3+nobKeVS8y9GNusikqopFNOT8LumOS0+wZb
 ZTMPyx/M4W59lNF7GPfGHm0W3i+3oGQgo+KMxbuhepkYN2ReLwAyOuVgdRZTzxWelAV5
 AFpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhlmlp6CWfZvGfTN6ZMmyETahsYoui0dZCsQLf5DtnftZfLItVEDApKol77bZrY3YFe7VGDto8yzOIocipMVt1+Rnc
X-Gm-Message-State: AOJu0Yy2e7kmNjVtwOEkJ/+oQJLThv3iQyuEfegvn+gNFR2IrH7Q/I7V
 rQa1pOTu4WzQ2BSb/tCnyK4RjB0oInaJzejMh2mx2faXWAxO3er6LsBaUQsYy2c=
X-Received: by 2002:a05:6358:483:b0:17b:335c:fa68 with SMTP id
 x3-20020a056358048300b0017b335cfa68mr776291rwi.17.1708725025159; 
 Fri, 23 Feb 2024 13:50:25 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 d188-20020a6336c5000000b005dc89957e06sm12691396pga.71.2024.02.23.13.50.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Feb 2024 13:50:24 -0800 (PST)
Message-ID: <73af6d15-17a5-4dc2-8eac-b0339e3765ba@linaro.org>
Date: Fri, 23 Feb 2024 11:50:22 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 21/21] hw/arm/virt: Add FEAT_GICv3_NMI feature
 support in virt GIC
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
 <20240223103221.1142518-22-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240223103221.1142518-22-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc35.google.com
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
X-TUID: XxGB/xpJ/iZM

On 2/23/24 00:32, Jinjie Ruan via wrote:
> A PE that implements FEAT_NMI and FEAT_GICv3 also implements
> FEAT_GICv3_NMI. A PE that does not implement FEAT_NMI, does not implement
> FEAT_GICv3_NMI
> 
> So included support FEAT_GICv3_NMI feature as part of virt platform
> GIC initialization if FEAT_NMI and FEAT_GICv3 supported.
> 
> Signed-off-by: Jinjie Ruan<ruanjinjie@huawei.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
