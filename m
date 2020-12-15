Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3848945lfq;
        Tue, 15 Dec 2020 13:53:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhFc8SHATUEG4n2mCOkV7kZmTJbUGlmapp4UQBsxi/0l4lPwPXwaQ7J4/H+s8SFBIBJDFM
X-Received: by 2002:a25:d1c4:: with SMTP id i187mr46013521ybg.7.1608069231087;
        Tue, 15 Dec 2020 13:53:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608069231; cv=none;
        d=google.com; s=arc-20160816;
        b=UUvcBm8X2f3eV6qqMHRr/ziYW/DRU5aRgrTyMBtQa8NV5zb7JGKoVLLBLSPwO2a+Xn
         O97EoUASQFBuAE+P6db5lMQOgL4uhYwqDsPsWzsP9MkPIRGXiMyy4Tadv9JnqYmdb06N
         33qU5dFPEAW1OZWlyBcIuBNZeAfuSrH869XBbg3JnlVOqHW7me0JycoUjO6l67FUubVf
         rOTO9vBxM4XuoYqecc7WHEv8ty8RR5fRtarOxcvg+YfFIe8hcG5WEcl6/5BfxVlv4uwg
         VO+A0V1XEDOl2ksGyHhbaIrTKTGk5NZB0TOqEtctUPGyJmqyYr3FmzilFFRqI0BMK3c7
         xaBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=/yFxPiSM6GCFfzUAxqJN+y0mpvMWm6NgB9vP+R0K//4=;
        b=MYmOGoNiyTpbT3ugSeScfLYSXNVz15+sXiZ05DDGBNEOmV+AO8579u88uEeZi7q4cM
         DHTgJ7bA9RYDV4L7oR4gZj5RbPgET+J+d9fLDrhQn4iXxAvdHX3pq+FzHjgQcR0KIsXA
         Bx7H5Z6d1VSNtjhI1t8u0NxY9WKTwuMqxJd2ld+gpIfiYtuGYCJqITtQgtNatCa1fXP8
         NkdDu40YUKGC4EAJbJVOKS/cijrGb34VF/y+yJ9z9FsQOg7lQQfsinfWt021Y2BOVwN6
         /zvbQgxNS8SGy235tD4+8pe7kTuGSM07g4l1WxouEaTqQV0jziADwoVT06E8fDueFXQ6
         BNpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="FBv/iKG0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b1si127171ybq.405.2020.12.15.13.53.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Dec 2020 13:53:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="FBv/iKG0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kpIGU-0004EH-G0
	for alex.bennee@linaro.org; Tue, 15 Dec 2020 16:53:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpIGA-0004Df-M3
 for qemu-arm@nongnu.org; Tue, 15 Dec 2020 16:53:30 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:46808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpIG8-0003Ds-Na
 for qemu-arm@nongnu.org; Tue, 15 Dec 2020 16:53:30 -0500
Received: by mail-oi1-x243.google.com with SMTP id q205so12317620oig.13
 for <qemu-arm@nongnu.org>; Tue, 15 Dec 2020 13:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/yFxPiSM6GCFfzUAxqJN+y0mpvMWm6NgB9vP+R0K//4=;
 b=FBv/iKG0FmqsO/o8akgboY7dkQ2cT5qWreho/vI6ClruxKaDlN3N5pAgWThXbYktBo
 4mc9vRCAxSqLoH9km3nsTnGXBYweSK2PXtgfyOtfThDQHK8COl7aEb2JJ2rUpnLgL5LN
 lWm1B34fEVpHkNSsoqLQilu+XuxazBlu9k/ulo4u1TlCj1pJigy4P7NqRlMitJBlcYcl
 GINCUs/43m09mKW2YjSofU2OD6i07KqGzEeCLSULmWCs+nNNpXKyl6QQ6OH2E5kSPXK4
 V6dM6gw6ooc3ee5FHunocRizdPQM8/pD3sxeFbvDNJ7sLw5y30exHUveXLh7+QDJ/QQJ
 PPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/yFxPiSM6GCFfzUAxqJN+y0mpvMWm6NgB9vP+R0K//4=;
 b=HPFELwy7OgEboqZ4avGxU7mMok3IT0hht1AH4g+TcquV6qUTqMr0+T1BS26PYClr+E
 FP7TlSkc7ZhhoX/iSSJ7R8z2C/5SRyQEM7DgSzL9suXxAD45b4P/OCHB3uvTWK8/KWIi
 9aoQdVgk1wk+NE/wc1+rZxLovaUWY1dd8UdfaYLPqGTPUOjcpgjup2fsuws8oWedeHIe
 imsE6FceHqo0Bv+d00H8ieoYmuY7Wxvdy8Den+6pr+LK6kANcsTkMqKpQpMv1biEHpg/
 v9TZZPXeHy/96kj3zMdEcLVCTiYZ6i++pNMXMxa4/pmvzgP2pOr0bTMMmMGsWpjbvq6i
 Gc8A==
X-Gm-Message-State: AOAM531Gtjwpita7N3aU9snaP5bvgolg8ddQ8uIk+qZLW/jhGOOue/Rs
 kE7bwXn5pVOjzE5Ei2x0s6h1yCgLQSLjoMun
X-Received: by 2002:aca:4c1:: with SMTP id 184mr541495oie.157.1608069207354;
 Tue, 15 Dec 2020 13:53:27 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id f10sm40861oti.11.2020.12.15.13.53.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 13:53:26 -0800 (PST)
Subject: Re: [PATCH 3/3] target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64
 CPU type
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
References: <20201214202329.26765-1-rebecca@nuviainc.com>
 <20201214202329.26765-4-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8f35d417-753e-5949-aedb-bea3b68b66a9@linaro.org>
Date: Tue, 15 Dec 2020 15:53:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201214202329.26765-4-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 88HJ18j96raf

On 12/14/20 2:23 PM, Rebecca Cran wrote:
> +++ b/target/arm/cpu64.c
> @@ -620,6 +620,7 @@ static void aarch64_max_initfn(Object *obj)
>          t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);
>          t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);
>          t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2); /* v8.5-CondM */
> +        t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2);
>          t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);

When the value is not 1, we have generally added a comment to clarify exactly
which extensions this covers.  Though it's slightly annoying that F.c has
renamed all of the extensions.

With that added,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
