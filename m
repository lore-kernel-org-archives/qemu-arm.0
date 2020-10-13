Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp2240563lfa;
        Tue, 13 Oct 2020 12:08:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/zF/BVh6o/+iB3u60D2359JnzU+wscl89bymTxL2wl0Tkhyqe/V4jiLuCUT0vBt1jgEeG
X-Received: by 2002:a25:ad49:: with SMTP id l9mr1759032ybe.455.1602616086131;
        Tue, 13 Oct 2020 12:08:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602616086; cv=none;
        d=google.com; s=arc-20160816;
        b=cyMtNPYQ7yqlZAdt7w7ORuYQ2iXw2UF7DFBNUpQwBSSoraF3ACIsA54m3vky2SVS8X
         UshN3ggt+GyIZYkBza7K5IjrF6M5UutT0/8RPMERKZbMztRwl/L7dOLbfYXmMmNXc/2P
         ZlI3mKUAPXhvxdwe/btxw4oe15BS5rupuYUDdTCeRDbhYF+hYxzrJfJpK3qNg4YbFekR
         XXDlVIMkOjPEqVogOMyEvGEfB+XS6xB+rlFHmN6Fm6l3yw45J50cwMb3pPVbMtq2akXF
         w1iGBh8lyNAJ1FviS+abFRezDyGy9IAt4p/x0dU4CIVWwd3nKWU+2b4nFKvRpfYwzico
         OKkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=TDs51atH4eIgDdH3rjjCtdaHC2R8L6bgkFqfRU3lOI0=;
        b=ld7qm7bi3PvAU15HRYDfdsiOT9TApdmchogHf7VqY6gVTdWqoug/P9zlT+WSPMUJ6N
         gAq6oMF9Oca2YxhutzFuACgL1aM3LKzbhgZl16RGnGG9nPDhySdGHJYQj+4HdlqO4eZx
         UnqORspIF4Ef2ZSqg5y7T1eDGD5teohBPNPYkk166jIliuZBoCEsufJGktV+Oy1Jr6yJ
         UC27QFkAtVJwSt2zMOTM8tqulGanEHY4S74XLY4rUvuruoDGDllT9CuvfKJK9i004Dyo
         NZCC0gPYi9mB1TykR3qajgGibiRQQJBS1dvFSarPyhJSbBZikJaRK6P+7O+UomK7RKus
         FriA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W5MWQbtN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9si732797ybk.385.2020.10.13.12.08.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Oct 2020 12:08:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W5MWQbtN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kSPeX-0005Qb-Hb
	for alex.bennee@linaro.org; Tue, 13 Oct 2020 15:08:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kSPeI-0005QJ-Eq
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 15:07:50 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:40304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kSPeG-0005tu-LP
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 15:07:50 -0400
Received: by mail-pl1-x644.google.com with SMTP id d23so367015pll.7
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2020 12:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=TDs51atH4eIgDdH3rjjCtdaHC2R8L6bgkFqfRU3lOI0=;
 b=W5MWQbtNpdyNSKzcpUmnUuAix8eFvnvX0fcBv7UOzxB1rIfdn5TCsn7WoYlPucvgWH
 ak0N2mIpy0oBoi7nSEyp4hw7IMm/JNJelQzX0GT2S0n+oZIJM/O1ugkE4lBh0GtWZ06e
 7YoKTpD25nvZTF5SExiADkmVa5Ox2OLXLAAbyOR7uEWEzKhHAC2eexoOLKxS/31HvuD7
 kaqQhVMg260jpIvy3jyVwqHhgHA6WhLSrjZUBFpzM0PyHheAeSQ7GwyIxSKGIKwxXePh
 Du7A4Mc+stk/VDB4xI/CmvgaLHYEPktYmlfVLfE5oOuqfDBBsC9XFU+X4lx3co0fReHd
 pJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TDs51atH4eIgDdH3rjjCtdaHC2R8L6bgkFqfRU3lOI0=;
 b=Xz+bQ06iKh1etsKAZ+2jzMTDW29hxvxbXrLvohERd7o2yuT4dw5HczFk81E0Lq2jbS
 kpPUzWyCkX3537qRRHMQPV5U0dVZDOBH0iTtCoY8xVMEBTmrhsq0+wsYMad4ENiTcYbY
 C7ce9EosEN/FzkZEBLbAAzdfOvh88fe8teN09juOG9XObNwwSC706AnG1YRPrweNKzso
 ic+UhpbcenhrCNaPnc4vs7Fgki9NJhUDAkT9N5jEBkA29WLqVETqVBB2Wp0JwEa169KF
 1y9C4DArAUCkK+zQz/yBbuKiVzWGFlaQTrMdWvZK7W112RgcQWbxRVBNCzacFRjWZf+V
 r3CQ==
X-Gm-Message-State: AOAM533AyLeX+q2P/TJstOaCE0x6ZIrON3WSRZf7kLqXAMJUrWM4O3LH
 A/dldB46BjqJ+Fz5EqktM7WDPQ==
X-Received: by 2002:a17:902:fe18:b029:d4:d4d7:782 with SMTP id
 g24-20020a170902fe18b02900d4d4d70782mr1140758plj.1.1602616067060; 
 Tue, 13 Oct 2020 12:07:47 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id w14sm383155pfu.87.2020.10.13.12.07.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 12:07:46 -0700 (PDT)
Subject: Re: [PATCH 08/10] target/arm: Fix has_vfp/has_neon ID reg squashing
 for M-profile
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201012153746.9996-1-peter.maydell@linaro.org>
 <20201012153746.9996-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <614adbe6-c16c-f18d-c444-a474e6b6f559@linaro.org>
Date: Tue, 13 Oct 2020 12:07:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201012153746.9996-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kSriIeIbl8P+

On 10/12/20 8:37 AM, Peter Maydell wrote:
> In arm_cpu_realizefn(), if the CPU has VFP or Neon disabled then we
> squash the ID register fields so that we don't advertise it to the
> guest.  This code was written for A-profile and needs some tweaks to
> work correctly on M-profile:
> 
>  * A-profile only fields should not be zeroed on M-profile:
>    - MVFR0.FPSHVEC,FPTRAP
>    - MVFR1.SIMDLS,SIMDINT,SIMDSP,SIMDHP
>    - MVFR2.SIMDMISC
>  * M-profile only fields should be zeroed on M-profile:
>    - MVFR1.FP16
> 
> In particular, because MVFR1.SIMDHP on A-profile is the same field as
> MVFR1.FP16 on M-profile this code was incorrectly disabling FP16
> support on an M-profile CPU (where has_neon is always false).  This
> isn't a visible bug yet because we don't have any M-profile CPUs with
> FP16 support, but the change is necessary before we introduce any.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.c | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
