Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp837322lfo;
        Thu, 3 Mar 2022 08:17:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySfcJ5UMOwmwf/C29Owm5PjFxGDexVccHFGphy+fWTPI+Ml5tSU13SWVZpwtJioaxpZEld
X-Received: by 2002:a81:2f17:0:b0:2ca:9e14:d664 with SMTP id v23-20020a812f17000000b002ca9e14d664mr36564320ywv.29.1646324243618;
        Thu, 03 Mar 2022 08:17:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646324243; cv=none;
        d=google.com; s=arc-20160816;
        b=0KsllLBKOVs3d0EI//hDBflEVDyh0SmXP5Fk5ZK1ezXFXrC/cFEjSR3Cu8p9pfE/YZ
         eHLQaRM6w5IRmO/zNuDFqtQJTxEdPO+KmxuSWij1kdCQvUeaqp/ExPT8ZHKdy5sFOQ0N
         uc7Aw24Ppm2hgrwSpRhLBzdcHtlNS2TIeXA4b2TXpv9Q+sGRUG2hB1n4fx+6/VXc6H7x
         RokqgGmdNKQf7OUNIZ4aeCzis1eK4g9ScyhLig+lqCnBOh0qXvmb6EUzIBXA+33izD0y
         9Flduo3kSeTXt3thNPD1X+HqqMh8SLzuAA9fir1SDAqGibwqtKxa0hMmKA8QptWLij1k
         ry0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=FM2TjJErwdheSh2ZQedrla9XQeExtxgiIX9eoydPkZg=;
        b=oTphRj/1Wf5PXkxR79Yp02wJqSOokIfpwJnbl9VFk9DLFRU754qalP2ik3xcxWt7Mx
         SxvaAxgZ747a2LfCr1beEl4VB+XwZR7r+qtbr4X8/JOndpNQAtdk6VxiXuW4KKg60DQL
         EG/xJEq6XvjXx7IH8cVlS8IhnzDNlx1nUUxuAjgUimC6A7jnW52r3RDACHCMYyh46g9n
         AhHu5+Iz7enuQdJthupi6ZfYE2PXPNrCk1wmC1VWMkdMwA0Xuu3tGgu4fjXIxogiQVuE
         xnj7uz9O/oJPucqyGHSkYyKb6zJeJVl1uMr53FQDPIPEsJJVnLY0a8mokWtFyqlkglH7
         WqPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LFnMSehv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h69-20020a816c48000000b002d0e61b004dsi2059755ywc.20.2022.03.03.08.17.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Mar 2022 08:17:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LFnMSehv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nPo8p-0004v0-2Q
	for alex.bennee@linaro.org; Thu, 03 Mar 2022 11:17:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPo2r-0002LJ-1G
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:11:13 -0500
Received: from [2607:f8b0:4864:20::633] (port=40495
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPo2o-0000ED-40
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:11:12 -0500
Received: by mail-pl1-x633.google.com with SMTP id z11so4945257pla.7
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 08:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=FM2TjJErwdheSh2ZQedrla9XQeExtxgiIX9eoydPkZg=;
 b=LFnMSehvCpqUIp+rX6o32OrZJjg6TWn08tUcjD6J3dE7E6YxchB4dItK8cOw67Jqek
 faGSKIL7AVPGXkiFTYhHKojWWslBG0ZqTlq8QKpWe1aOyJ1sXFFMm1SKM4Uin+A4l7da
 a5du/cXrV56ZMBS5K63x/xenWNR2QV3miEC+ZLy5exHP6EKZ8kpbL9cMWh5yRt8aoTJL
 zj0J/0xwQkGVIBpGCpbFycKwrKBQGvWDVWq/EqFiYL0AnBqoyJZFezeawXtX90lwRyek
 /huNhcSdnNl5acE74HoTT/T0unyKBl8aUfxcPL8tMVW4V301PvVDDyi4sZtiOSzNHNKv
 ImDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FM2TjJErwdheSh2ZQedrla9XQeExtxgiIX9eoydPkZg=;
 b=w/VgO8WKwLAnhJuHKYL2k3KFEBR3JathHYT4IGyx/uvrx9tV43s3haq+H8zRl578ZI
 yWGqfh4Q8aIsorrhtj2Tue7fRWBEOoZQPPUfGhaIFzmkMXuHvByqeud49pbov67LA+7s
 xM+SPB+dt+u6oMr0yemThv6K8h2K4EHuNTxL42zJ7vDgYaeq7yTlIm0GYT2yla7UvCLE
 3NqM9ZmWc8wWZjZhxnZS7Z875UuvCiDG4jatSmCgn3azB8vDnYI/VjBQloScMJbfa3IH
 4KaK6ABZsQ6yAN/cR/MYb0WVGSPWbNkwJPgFVBlygV4B3ZsFERU65SRVvMXK1PZcrTFZ
 FojQ==
X-Gm-Message-State: AOAM532CNOYLwtfYk2p1nGtRQkqW7TKNWJzKkMl0vg9X3sdk6T6tSO0y
 Ru7uzBJ0CwQM3axuwB21S+fvKg==
X-Received: by 2002:a17:90a:5302:b0:1b9:ba0a:27e5 with SMTP id
 x2-20020a17090a530200b001b9ba0a27e5mr5944556pjh.91.1646323868668; 
 Thu, 03 Mar 2022 08:11:08 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:e819:4400:f268:c391?
 (2603-800c-1201-c600-e819-4400-f268-c391.res6.spectrum.com.
 [2603:800c:1201:c600:e819:4400:f268:c391])
 by smtp.gmail.com with ESMTPSA id
 s21-20020a63dc15000000b00378c9e5b37fsm2379559pgg.63.2022.03.03.08.11.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 08:11:08 -0800 (PST)
Message-ID: <172ac53f-6e0d-7559-30d8-255c74a5dda1@linaro.org>
Date: Thu, 3 Mar 2022 06:11:05 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] target/arm/translate-neon: Simplify align field check
 for VLD3
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220303113741.2156877-1-peter.maydell@linaro.org>
 <20220303113741.2156877-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220303113741.2156877-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6Jc/SiUExcbs

On 3/3/22 01:37, Peter Maydell wrote:
> For VLD3 (single 3-element structure to one lane), there is no
> alignment specification and the alignment bits in the instruction
> must be zero.  This is bit [4] for the size=0 and size=1 cases, and
> bits [5:4] for the size=2 case.  We do this check correctly in
> VLDST_single(), but we write it a bit oddly: in the 'case 3' code we
> check for bit 0 of a->align (bit [4] of the insn), and then we fall
> through to the 'case 2' code which checks bit 1 of a->align (bit [5]
> of the insn) in the size 2 case.  Replace this with just checking "is
> a->align non-zero" for VLD3, which lets us drop the fall-through and
> put the cases in this switch in numerical order.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-neon.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Richard Henderson <richard.henderson@linaro.org>

r~
