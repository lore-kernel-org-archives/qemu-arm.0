Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp791196ejf;
        Fri, 23 Feb 2024 12:10:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUy0iWcjzuBi54CX85gxieAdhkrQxZtrhErIdhUFyMLF4HodJg+nZzTl6ZGr3HhKmiVI8KnOZcHqcDPoF45xa1NaCTk7bdH
X-Google-Smtp-Source: AGHT+IE4x6CGhgGTWdwsVZSkbv0Xj9CxV50r/niFPz1z77v90FfEGzzxYP8kzRB4e+FzXBvrGY9O
X-Received: by 2002:a37:e202:0:b0:787:1635:1dd1 with SMTP id g2-20020a37e202000000b0078716351dd1mr987228qki.68.1708719015132;
        Fri, 23 Feb 2024 12:10:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708719015; cv=none;
        d=google.com; s=arc-20160816;
        b=duoPAXyvCZI+lm2+M9c/IAmJ+pVvaFK/w+qwebZl072d0z6ytzO+waPlYgBpKWCAgr
         FUtu6UlfYeNUilYotOl/TuzgpjEnt5CqfED2ljRPRb3Ttj8QKRlpR5KZlmZpIZcjBycb
         NgWYY7g6qt56axGUcX65hpKld3BoTbkDgMz92HX7OiLrgLeyH+AUJPI7tameReimuJYQ
         FXHO696aqxhDG38txjFwjQ7bvNXhI7d4r8X22CgXzkdFQZ/syQS2ajj9/a4Sl7Fa/wlh
         2JcUm6p18TUXmvT6IdTTP8MOIRRsqkexfP+aTw/PU3YuixnPT+HU/UtfaSJO722AE4Ir
         J0jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=pfOUAy1mh5dsDQ4iDIJnm3V+EpuC9KpvDAEDhgMgZYc=;
        fh=Iyzj45y6/+Z7q8LvihJ85Xi/yiKABCU7kGgjb+iFI3E=;
        b=PHwCMgRrpwZx4/iElADD1GqhbwA+WxLJjMB80WSSZUwB+predjeLB6IPN/Pw3d4jnV
         Xme/LVT2WpI790sIIVy+zPGxZcnd/I0s9DexqhHQ176Osd8kJ85cX0o7m5Oo0qGdXo76
         h7LTR9OgbGd+HPK2Y88onINflbfYXF9SA36eAOJC6Ios22k4w/v0Nxav0IEw1QjjQRjX
         DLbi1g4eOWe48I6XVr3KoOUO8Xt1qWUKbytAIKYXj4HtVSCqEnxEiAjpW4WJaJQRq/4F
         8NncxQLbZnuBVZoDqZJKHslBRM3FfB4XQ9pf7hvux11l7cCg2dafwvIdi805Uk9pDtYi
         fB9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XB2VpLDO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x16-20020a05620a449000b0078726dd3ecbsi17334286qkp.761.2024.02.23.12.10.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 12:10:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XB2VpLDO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdbrG-000852-IE; Fri, 23 Feb 2024 15:09:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rdbgo-0000h6-Fd
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 14:58:34 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rdbgk-0001CH-Gq
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 14:58:34 -0500
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-5dc949f998fso537772a12.3
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 11:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708718308; x=1709323108; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pfOUAy1mh5dsDQ4iDIJnm3V+EpuC9KpvDAEDhgMgZYc=;
 b=XB2VpLDOWVoFHUf60usdZZPZxTbNf36AOhITfNiLKKz8pG5rqNunVN22ZX8rQfmZ84
 Wx6it62B5WYY/EkpqLN4JnijwxW1Q6krwlDFjilNgZln3CMKQ777ys1bHKtBsL0fDHpl
 /Of5JPklT3OoJ2DT2H98UNTIRWxb7wT1Q/WmhJtqjzHIiw3zuCvwPaHXYRA+abSSmG0v
 GZBEKHetOPWME9gYuLtHvi2MC1ISLZ9mI2txU87FFs463kWZYp3RuqqQrKbYn++TyFZL
 JFAYnRV3DrhoOV0lOxhjcG7A3fPW8meDDG4E27gE/j0BQwShVuzXGONE5zOvwiUPiAKM
 aK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708718308; x=1709323108;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pfOUAy1mh5dsDQ4iDIJnm3V+EpuC9KpvDAEDhgMgZYc=;
 b=TOSVI3v+6BiL/yXnye4JMxDXXqAvWpGzWMDk0hWj+WxTzJ4szOmjQj2w8vT2oVtl21
 mEBW9oE61aAXz2Pznv4f4xOfMOrE9B2/q/8DvSt9nmSKq0ZxXHDRVDxG1Mw3TQqd66fx
 0QbqaA7/iDW8jQIAddjZ7d0y0oqB94yv62//SJjQFGkZB0rlA6eyJga3Jo964++1DuRN
 5Z+eaTDvm61RXyvVgCe3vmgAC6Z3mnZmXATj3qQFm11tsZiy8+rf/GmYIOce0HuLUZQz
 R5o0K2mDQEN9Udx5HifWDOmgBdygJXqCCofXtimNoL7vpjENXxPe8/Wk4+W1UOfbLnFd
 nZtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw2QMfmU0PXEq44RQqowQHOM2elCzmA07ScolgCa1+ihBe2+9PoP7BXCWWUQUlqS9qcJ+VcBrwvwf+y+V1Glgpsvuc
X-Gm-Message-State: AOJu0YzbCXRgaSCC2QjEsBXdPBwsvHkz26cEz6co+rjDkG16VSTqpjA1
 6kkHhnWWr/bhIZI+6Gx+5Z1rLi8L8l8czODqZ9U82mFiYqHFpus0P3lqiKcE5sg=
X-Received: by 2002:a17:90b:4c49:b0:29a:9316:6f4f with SMTP id
 np9-20020a17090b4c4900b0029a93166f4fmr908513pjb.23.1708718308326; 
 Fri, 23 Feb 2024 11:58:28 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 oe4-20020a17090b394400b0029724370ea9sm1907224pjb.47.2024.02.23.11.58.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Feb 2024 11:58:27 -0800 (PST)
Message-ID: <1ea2e320-9ca0-4efb-94f0-3f9aa6f585ea@linaro.org>
Date: Fri, 23 Feb 2024 09:58:24 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 07/21] target/arm: Add support for NMI in
 arm_phys_excp_target_el()
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
 <20240223103221.1142518-8-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240223103221.1142518-8-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
X-TUID: WrhQ7ARR3YDR

On 2/23/24 00:32, Jinjie Ruan via wrote:
> According to Arm GIC section 4.6.3 Interrupt superpriority, the interrupt
> with superpriority is always IRQ, never FIQ, so handle NMI same as IRQ in
> arm_phys_excp_target_el().
> 
> Signed-off-by: Jinjie Ruan<ruanjinjie@huawei.com>
> ---
> v3:
> - Remove nmi_is_irq flag in CPUARMState.
> - Handle NMI same as IRQ in arm_phys_excp_target_el()
> ---
>   target/arm/helper.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
