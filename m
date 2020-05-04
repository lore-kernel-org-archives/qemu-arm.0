Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp701051lfb;
        Mon, 4 May 2020 11:08:42 -0700 (PDT)
X-Google-Smtp-Source: APiQypKVPfB41FWhFttCQ3ja1LaPZXwjZ3Nwdpqt3OOThuZbFHIXge2lYq6CHbGtyulHRjEJ+MiY
X-Received: by 2002:a37:bd47:: with SMTP id n68mr433198qkf.379.1588615722488;
        Mon, 04 May 2020 11:08:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588615722; cv=none;
        d=google.com; s=arc-20160816;
        b=J4EfUcEbOXANSSOHhheXPTeOOHAeSMYDYUP9rgh7hFVanBL8yyh1FGEusgISNk93Xi
         x/AT827h8B0j+N6Rvyo5vcXMvBo3nrX03+6BOdS8EPSEAoBdezo6txtuQ7Bxps11VYOR
         zx7gcJQ2/Xvzi9ylSp1V4UZdb+EO9u7mTwHTMhDAyPgmyZ07CTTPEUelnXm7TD0kIsbn
         Lk339YAk33gZd0bNVAqvIJjQwH6Lkga767VqMJIY7wZ2BOXem0FI+Ml3jQBPFAunFePs
         6XAX1q/MqPvnHyEV2uT7YwQpTXMlQ2+0idiScTh5fplde0dGa/mjikP6wecxpuVGHyX9
         MK3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=qbdHUTIG1XQ0SccWx4aQ4x20USpOl3NWAwKSe/b3WMw=;
        b=wNRZ8AEHoiP4p4K+/tP775K15GEP4qDCe2lGW8M9oMrY4EqxwNel8L0urhxLJ5SDBE
         9ZgOoi8SiN3zb3l0jcsavhOc9Mr9PALbJMVNPvKowqMhIj10cZKSqJZXhoxNG75Le5RL
         o2fll+PGzCI4EX3QsUlU2x6jzKefrXrYku9drizp/8qTVUAIk3eoS2kW9OwKsnCTw44M
         0m9Cs3fxK6mYdk+bhqXLz2OL/25m/6ucj9l1QAIK7BwR9m+W20yByKkVpxzmLM396Xdc
         lEIUuLdRGqjLytuymJ/d29iqD86nKfKfWgDNL1aycu2hvuZokEmZz13vclVXdJbYMqG3
         CUCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="zoI8/lzn";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id p44si6738362qte.301.2020.05.04.11.08.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 11:08:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="zoI8/lzn";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVfWD-00014D-Nz
	for alex.bennee@linaro.org; Mon, 04 May 2020 14:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVfW1-000110-Jy
 for qemu-arm@nongnu.org; Mon, 04 May 2020 14:08:29 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:45718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVfVz-0002Ku-5C
 for qemu-arm@nongnu.org; Mon, 04 May 2020 14:08:28 -0400
Received: by mail-pl1-x643.google.com with SMTP id u22so40830plq.12
 for <qemu-arm@nongnu.org>; Mon, 04 May 2020 11:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qbdHUTIG1XQ0SccWx4aQ4x20USpOl3NWAwKSe/b3WMw=;
 b=zoI8/lzn9zXO7Hayf0PY6hVjLFnb8JGBM6wYT1zJdDKzPaTpJzRlzbo9iRa/891X7k
 ze2XVvgbq1R7blZkfwYykQorqHCApZ/m9cvU46mYuf8vmuuhlVfau8q2piTGvXY2Z0+d
 z9XgXEKC1OJ+Z5Idr7KLlj0h6tbGxryo2GohGu+RBRTbi5Xbf9Xdek0yYwrWnHtw/xuR
 wN17aS1PBlwNer3jFIOzeVmYH5pKWxs9bLiLnCG4kHoFyKuB2V55naPZQj49VPwCwbvq
 10rDQ2RLHbwC/+2d6gBmxMir6BrgsanmVv+WnZUVGC+A8zR0vVOHXeULXKwFSyGfzm2W
 XB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qbdHUTIG1XQ0SccWx4aQ4x20USpOl3NWAwKSe/b3WMw=;
 b=QvcfbA1xz76BN/cLLU6wk9Ob+aaHcy0rVVjYvtAr/1Vg6rZpKMuethRcwZnHWsKWqw
 LR+1K0AfbanWD1sMVppa+PlgSZFre7zVN+EZk26H3utTsHx1Wg95WwrzrskuoAwQlco5
 ZwRBEjBc/9dA6NyAqpgB/R7fa2Y3J8uZJJs1XqN4v6rXV8vZK4l25MTvYp9jNPSBfBNr
 KLpZtXWryIbKwnqKn+4X3yHfquBQGl+X4OX21F3WFT20P5Bf2ggcBXlxaliMr42zWHQj
 4J/Lufqfj/aVkPlMNkqU3Szg4wFaQ0aFOI+of1or+yJgpjVbPDq0CMpUxAZdGRrPOqJf
 WMDw==
X-Gm-Message-State: AGi0PuY0NhMYpFXtzByLHZ+HUsVVzRobVxgoc8Y34eL9FJl61IFOmqDy
 NHOnMBVEgBmSzpSaOz+WIHmO7w==
X-Received: by 2002:a17:902:7241:: with SMTP id
 c1mr401449pll.113.1588615705303; 
 Mon, 04 May 2020 11:08:25 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id a12sm9263327pfr.28.2020.05.04.11.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 11:08:24 -0700 (PDT)
Subject: Re: [PATCH v3 3/5] target/arm/cpu: Use ARRAY_SIZE() to iterate over
 ARMCPUInfo[]
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200504172448.9402-1-philmd@redhat.com>
 <20200504172448.9402-4-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eedbc418-970b-e8ac-576d-7bfc27c4b361@linaro.org>
Date: Mon, 4 May 2020 11:08:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504172448.9402-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X1cuucl718lk

On 5/4/20 10:24 AM, Philippe Mathieu-Daudé wrote:
> +    if (cpu_count) {
> +        size_t i;
> +
> +        for (i = 0; i < cpu_count; ++i) {
> +            arm_cpu_register(&arm_cpus[i]);
> +        }
> +    }

You can use int instead of size_t to avoid the i < 0 type warning.


r~
