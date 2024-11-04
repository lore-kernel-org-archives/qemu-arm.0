Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2016288njc;
        Mon, 4 Nov 2024 02:51:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXXj57D4wwv1PXaXq3nq/2beR1YnaZCtnP1vrAZspx5eH4cJow8iR309meg8hL4A87RiC/rZHzgQLlUpg==@linaro.org
X-Google-Smtp-Source: AGHT+IH5gsByQsCnmR6Pg52P2WRKqONKB9N7p1+se73hehZaXx7+//ib8u/451vjV+KZ+c6TJDyr
X-Received: by 2002:a05:6214:3d8d:b0:6cb:c9d0:df32 with SMTP id 6a1803df08f44-6d1856743demr413303036d6.11.1730717481698;
        Mon, 04 Nov 2024 02:51:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730717481; cv=none;
        d=google.com; s=arc-20240605;
        b=cmAr+aP+JzINoDAr1iE+tiKKIBsHuvdy9e5OxKW71iDS+D5wHa1mHnRxn//oHPzIiP
         AyZ1MH0h6ORfufsTbw1WaZsQ2AVFLaHYXoNUQ72Gq5fB99vXxs2rBxGlEY0G/prPdlYQ
         DjqnID0YmdAdBhp7ua4BoNI4r3P3AGfd3RvCeNLjtU0a78Zfi4z1D5gEvM4MarjZuTr6
         oDslNX4WhVYr+TQFX5WlFTMFj+9GbTKKiiD+xgMdqrUJ67kKSw1tieoaKOsXoGLMdpk1
         H+bayAah0lwxFlvULuVBB/NYCWE9p3pr9k/Sdm4+RULifr61GhB3F8L60qGvAv1ENLXv
         S8+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=gclXQ6NgDPQejj3W6tl371AcJXzxEWWNEMLWWOTGKfk=;
        fh=m9OvsrGtZFt3abekDa9v1zTXSUUbwxKRvZELSe1r5b0=;
        b=lo1rMURNAIF+2Mt3BXqZWs4MOzdjuI/Aeg7Ghzk0qGTxmHFzsPGaS/tf4Ulxnyz4G4
         ++hIJkabNYolzvKG/6d5e4bWxmNLRHXKz5Cm7JjgiHIOsuF9q2/oTs8RcXSMG972mAgK
         5fB75iDaapFTM6XmXeqJYU4mVw5xG7ClwhFvVukxd6jsFGLCYmxoAayZdpUvhRNX542j
         g6Qu68ug29byBsQsmEayhYGYkZeiGjEKJTcK2uSJiYYcBqtjGXxzk+6VjSWG6wCNpSel
         pyXT6BfrsfLJdV+FB2oeUv07LWzk6BhWYsOcVdzEjJmuVVAOXh9Id7b22rW9XrabV50+
         18NQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E2seSSsm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d35416af7esi102662816d6.298.2024.11.04.02.51.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2024 02:51:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E2seSSsm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t7ufp-0001EQ-Gr; Mon, 04 Nov 2024 05:51:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t7ufk-0001Dj-UC
 for qemu-arm@nongnu.org; Mon, 04 Nov 2024 05:51:00 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t7ufg-0003Q5-RC
 for qemu-arm@nongnu.org; Mon, 04 Nov 2024 05:50:59 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5cec9609303so2056247a12.1
 for <qemu-arm@nongnu.org>; Mon, 04 Nov 2024 02:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730717453; x=1731322253; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gclXQ6NgDPQejj3W6tl371AcJXzxEWWNEMLWWOTGKfk=;
 b=E2seSSsms6uNeODnYpAA0rDx0BVgbGmhqzldTbPwUXlF7y0ik2ft5JdG5OKJw4cs0W
 mg3KjodX9zDHI8CPiCEyBl39LGxpDBEzzSK5Z1AR7+n1lljHsvASS2rWdMkLBalA+vHm
 A1AResLYdN3njaYJMRjBzfjwYRmy8W0+FN9Lern488pmiCz7rC0lkgeXEAS47kaJH0j6
 s6/XAlvaxFkx9esQzwZJ56FMCg6ClzcvtLeyKTlbWu64K9Cu3bvJVX+NEEWIVE0X0xc6
 uwZS3ZG+/ndK0PrJ06m14ijzclwqR12q2Et1daaw64mqT1KnI+C06lddfapIIEGZOmFc
 hJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730717453; x=1731322253;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gclXQ6NgDPQejj3W6tl371AcJXzxEWWNEMLWWOTGKfk=;
 b=tOt1Xj6kUwAMv+OM4vN3xfHDK7NlGpk3qrximpzsMBmYOM7vty6j/FZrldsZJVvT4x
 xBbZ/mnArbnmfb7PLKx8vxSZIAyQ1OEK/+89zR+Qgf7qwn9GHANUOIT3vm1YGgOvzbTy
 jqw0LEm+cg0j67lut0yAr4CzdwOSh8GHi9SPRfInLYvlqQm2SL78rHM1ssrY5LX3ZQIh
 R2Q+CSWoRdYE95Q9eOcITxnoBGd9ElO2etaUMXU/AV8hR7gGkMigu+LRrqaCGQF2He9/
 CQeR0aKQl8+YcpzciLEJAnFcZ7T/Bv/heTGiqnRx7Be6eBH1BVNQTJRKYnpnR9RypTVv
 dZkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVurCQFfXNQ08Zd7IUhSyLG1Lu027glLRkI5+SelON6wZYeHaUdH0y+LHzOKVGXUbdGlALdwmhIhw==@nongnu.org
X-Gm-Message-State: AOJu0YwQxAQ5IBb9N+5ZE6d4t1lcIP9IDzzk/V17CYVwMZMokttgWhft
 NgzZIf5qMc7LDsgsKDIXKZBfgkGODs/m1FTwuxHcRPxAz1u20VdZDDt+swXcReTy3TDLjPmA1MG
 j1YI=
X-Received: by 2002:a05:6402:40c4:b0:5ce:b113:f38d with SMTP id
 4fb4d7f45d1cf-5ceb113f6acmr11890018a12.28.1730717453059; 
 Mon, 04 Nov 2024 02:50:53 -0800 (PST)
Received: from [192.168.21.227] ([91.223.100.66])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ceac76fb46sm4066687a12.26.2024.11.04.02.50.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 02:50:51 -0800 (PST)
Message-ID: <0e767aee-f9c6-4efe-a91d-40fef98a285b@linaro.org>
Date: Mon, 4 Nov 2024 10:50:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] target/arm: Add new MMU indexes for AArch32 Secure
 PL1&0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20241101142845.1712482-1-peter.maydell@linaro.org>
 <20241101142845.1712482-3-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241101142845.1712482-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: kMJAjDwjNddt

On 11/1/24 14:28, Peter Maydell wrote:
> Our current usage of MMU indexes when EL3 is AArch32 is confused.
> Architecturally, when EL3 is AArch32, all Secure code runs under the
> Secure PL1&0 translation regime:
>   * code at EL3, which might be Mon, or SVC, or any of the
>     other privileged modes (PL1)
>   * code at EL0 (Secure PL0)
> 
> This is different from when EL3 is AArch64, in which case EL3 is its
> own translation regime, and EL1 and EL0 (whether AArch32 or AArch64)
> have their own regime.
> 
> We claimed to be mapping Secure PL1 to our ARMMMUIdx_EL3, but didn't
> do anything special about Secure PL0, which meant it used the same
> ARMMMUIdx_EL10_0 that NonSecure PL0 does.  This resulted in a bug
> where arm_sctlr() incorrectly picked the NonSecure SCTLR as the
> controlling register when in Secure PL0, which meant we were
> spuriously generating alignment faults because we were looking at the
> wrong SCTLR control bits.
> 
> The use of ARMMMUIdx_EL3 for Secure PL1 also resulted in the bug that
> we wouldn't honour the PAN bit for Secure PL1, because there's no
> equivalent _PAN mmu index for it.
> 
> Fix this by adding two new MMU indexes:
>   * ARMMMUIdx_E30_0 is for Secure PL0
>   * ARMMMUIdx_E30_3_PAN is for Secure PL1 when PAN is enabled
> The existing ARMMMUIdx_E3 is used to mean "Secure PL1 without PAN"
> (and would be named ARMMMUIdx_E30_3 in an AArch32-centric scheme).
> 
> These extra two indexes bring us up to the maximum of 16 that the
> core code can currently support.
> 
> This commit:
>   * adds the new MMU index handling to the various places
>     where we deal in MMU index values
>   * adds assertions that we aren't AArch32 EL3 in a couple of
>     places that currently use the E10 indexes, to document why
>     they don't also need to handle the E30 indexes
>   * documents in a comment why regime_has_2_ranges() doesn't need
>     updating
> 
> Notes for backporting: this commit depends on the preceding revert of
> 4c2c04746932; that revert and this commit should probably be
> backported to everywhere that we originally backported 4c2c04746932.
> 
> Cc:qemu-stable@nongnu.org
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/2326
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> The regime_has_2_ranges() part is correct but does leave a minor
> beartrap for the future if we ever do for some reason need to
> identify "has 2 ranges" in an AArch32 codepath...
> ---

Series:
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
