Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3092769lfq;
        Mon, 11 Jan 2021 16:10:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjIX+Eqkt9fWAsi7tAhpfF7FC1jN+keetsKCaeuzbKjyR65fB5r6d2csVosqIEbxhasiwn
X-Received: by 2002:a25:287:: with SMTP id 129mr2968962ybc.145.1610410217879;
        Mon, 11 Jan 2021 16:10:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610410217; cv=none;
        d=google.com; s=arc-20160816;
        b=QIWjP7UULKfC4nwPiaOsvjC3KjCKbZg6hwZYS4J6at+0agFWZEi6WyuBbeXFJhn5iI
         h1DTq5TeVlXWCAn+4NE3ZDrniLzIE2g9/BqfffhUFY0a9hoQq5Hu3FUbF6nvz7CaLoGX
         xfL0Bndm6AG8rCdx+ACe9La5gy6URdygTOpvVbFHTaLTHeMkgOxsYnr1wb5Q20QhP41l
         WVEKbcsLr7BwJ90227Yqd48kk8LUjrQQnl7A+ALKVgyeweMMFQc4vezmNDomXg1utqt1
         tcoy8GudNXLKrDCqCvrg4AEYh6WvqUB3FfoiaRP5MxwmTRTn7nONB4AcDLXk8T/FKY90
         dnXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=B4R9c4QGGtVFWzG5gQIOM9OZ64Swp1/U+9Tebu3m9Rg=;
        b=t7A2P9qvt6yCztnHBqZxekz4ryNhZNG7qrndLHCFPKewT37ziR6wKw8KPHve7Eex/o
         qU/QPDkIAt+687eJagTQCoBxdY7hCdGZrpEAcnq0ArO25Ublo9PTGOicc7PB8zym9zY2
         dvDoxDyHfbPJPY35Xyrndg5rz0mS5mE3HiW5ze/nYDvBTwuVOZL4JDp+RBu0JN2sQ5QG
         6ziW1o5/ctY/5/HDijupdyUO38wWX+iHRytEX7142XA37BT2ZNphz347HQKQq21yiVft
         zOb4OpMK1cYIGy2uH+e6wyx0+pqq75hKnLd9Y4/UGdIukbTDDHoOESFnP435S6p6FlR/
         4HoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lj25ddbb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s13si1498328ybi.63.2021.01.11.16.10.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 16:10:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lj25ddbb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz7GL-0008Kw-A5
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 19:10:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz7E3-00071u-GR
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 19:07:57 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:37238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz7E0-0004Zk-1e
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 19:07:55 -0500
Received: by mail-pg1-x531.google.com with SMTP id z21so237988pgj.4
 for <qemu-arm@nongnu.org>; Mon, 11 Jan 2021 16:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B4R9c4QGGtVFWzG5gQIOM9OZ64Swp1/U+9Tebu3m9Rg=;
 b=lj25ddbbf1k3byjAibmah1THDxMzi+F4XrQB6wgzMc2y7jT2j3vsO5ktjpL8btfMKg
 M7hfz2Fz0X98aYBwhd4/zC7Z8er2fto5Wm4bwLkmWRS1OTc/Y5WhR7DynLpBrlzWnDqH
 BJZpQKjzc4/GkTISLEPtNGQp1UyXSdrsKjYomEkgQvi9CyW9r+v+qF2El+//pQ3hzfc9
 1D48QYa6dslhcv7NwcO1zY4eKdFaCaY+oCGlZnC7HsODRY/zrjETQest4pO8tpSshEwr
 1Ps4gKqJZpogergUPRtlesJ9ex6xj3NeWNEECfqfz0u27wMKbhHtyDUbSLe9t+1ubxmK
 n2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B4R9c4QGGtVFWzG5gQIOM9OZ64Swp1/U+9Tebu3m9Rg=;
 b=qVpKrQdhbkGlqqs31RricS+Ox9onR+BioIDtOjbQV4p/MRo5OSleMuTmDVMuXMDYwd
 G2CgQx78Po5a9H84wPtf9UVggAOPdVtdk/EyyGtcja8ErEeQ8j7VO3nl46vQWJf7+zVk
 Ji/KbQOBqRoq6IEros3YsNTtAc/wACOgC37qogBJ9l1+sD28ce/4wOJC+y/b0t3RFzZF
 +pZzzDIDKvRvjMkhpJMoqR8g8x/Jd0WF7uYv6m9W9bElVi18BQPPts4ZbqE66a0L2b1H
 6NQ8LbX4YaxM5T7VZzPCgsELQaZiW7hlUhIelJstnmscL6q/9dqhaGbuqR0YGoP6PWqC
 kICA==
X-Gm-Message-State: AOAM531n1WHZRgblWqb2noW+uKwVpXi9dqCIwuc4i9+y0yHjyI1/ES4+
 svstJG3mHSngI8JBPkCbepSUXA==
X-Received: by 2002:a62:e314:0:b029:19e:4cc:dc6f with SMTP id
 g20-20020a62e3140000b029019e04ccdc6fmr1785969pfh.33.1610410070704; 
 Mon, 11 Jan 2021 16:07:50 -0800 (PST)
Received: from [10.25.18.119] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id b17sm581477pjz.44.2021.01.11.16.07.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 16:07:49 -0800 (PST)
Subject: Re: [PATCH 13/18] target/arm: generalize 2-stage page-walk condition
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <3337797.iIbC2pHGDl@basile.remlab.net>
 <20201218103759.19929-13-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c7cf803a-44b7-6b92-dfb4-227c9178d932@linaro.org>
Date: Mon, 11 Jan 2021 14:07:46 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218103759.19929-13-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eozqlnsUUvbF

On 12/18/20 12:37 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> The stage_1_mmu_idx() already effectively keeps track of which
> translation regimes have two stages. Don't hard-code another test.
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/helper.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
