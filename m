Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3375619njb;
        Tue, 9 Jul 2024 08:51:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXhhz6vA3SLBqb4o4W4eFI0HXSUQJwi8zftnY4C55Yt2pfvxCO0UcF/LCQ1klxIY+1+98fy1cUnMlR/VFFg/epncaSSuAKY
X-Google-Smtp-Source: AGHT+IHVyqIcjJ3W0UaP/XHJDy7hOAVv78zet6S1/8iNUqE+t0nHS5VpcmflvVDDyPms58e5WMY5
X-Received: by 2002:a05:620a:70d1:b0:79f:4ae:613a with SMTP id af79cd13be357-79f19bee2b7mr264104285a.70.1720540305153;
        Tue, 09 Jul 2024 08:51:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720540305; cv=none;
        d=google.com; s=arc-20160816;
        b=IEtpzRqCN6BcG/3uWThSn+6oAgHmu7z8EwK/pZhP95OuCQoMcUbUlkrA0QR54L0MOg
         4SA4FiP+BeI3NluhXK0+mHIXxrVXvSrfidgomABuE66Xk29oC+Hg0mNvlZXFvAk57GHF
         Z/ZPGLfQntw3npASRobhRTeBHVVbX4CdCx1LFLSt1nCduiUty3+cXRNIEoU1wbdEjzEt
         08xfqm2u/Z51x+mVXOlcMCZls66OMJuXr3wBZ8/HrQWmvJUQm5fyxA3zblAORETPqodI
         YyVPVl1HgH320492USHU0LNIu3mTW5HwaBq6Kvg2EAFpIBOYGe5ePXHHbUy/ya1Ab03D
         h4zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=LlhSgxXmeIbp9/lrJEjIjrQkX2Q1dIcFiuiUW83SnM4=;
        fh=8BV3R0MBVx/T0Rd9cpj1SwO5893NjIths/DFgyJK0NE=;
        b=gD9ABWh9EWOfSpDpe/1P1yAv8QazIA/NPpfgFlqFcV4u0QIRAzjH0diMzPg8ASZPs4
         2oYvKJbxaOtFfI+WaMKuBPNAbFaVceg77wIGV0jIlSrEwvm7h4qYiWv+3j9P51BMERXS
         9LHstWmpWIaYZpcIDY0uFBIm3FzQQbGkFn8+/tV5x/98wJbvJaItpAWgRol/P5G/hiOT
         QKZtn9Vv8Ohv/ePPtQO8Sap5u16h3DxR/iYMJy448RXeCM8VAyCk/KovIPJKB/Dn7gtV
         PEJv708fhrE+MpjTq8leog5/sS+6yCN15I88przTKBB7u26NuNtKwEICbg3nTbJkVePj
         n3zw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SE6vLJXr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79f190b6e05si238877785a.469.2024.07.09.08.51.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 08:51:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SE6vLJXr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRD7g-0005Kn-Gc; Tue, 09 Jul 2024 11:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRD7c-00056v-WD
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 11:51:17 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRD7a-0003Hb-Cs
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 11:51:16 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1fb457b53c8so34073275ad.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 08:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720540271; x=1721145071; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LlhSgxXmeIbp9/lrJEjIjrQkX2Q1dIcFiuiUW83SnM4=;
 b=SE6vLJXr2tMjtOWeccvU0CoMse2LcEoZRn4FeXW05CHVqwfQ1QlWE8AYMLXuWDCAV1
 mbK8GQPOSspntpfi26cN9U7j0j6ihK7L1s2j1PBgve4IJ2xms81KDr0oVsrReYG5Srie
 gzRkJvCt1bXVADTlW+V5zXlSlGgwtvbddaq291Zl7NWYcbakfaIAB47tpDIOK6tVibEc
 CGLmtAElUXmRZIkkoa5X25LH+4IuyKKV4GdPHA8bWKEqTy2OjJSeX46zSC3l6uOrzGVf
 mQga8LdvmXgNwMKoVF5pQEmkizFIUGV4IhajgeFIJ1tw/XylXs1q/2rrgtDOTS/aEoY5
 K2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720540271; x=1721145071;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LlhSgxXmeIbp9/lrJEjIjrQkX2Q1dIcFiuiUW83SnM4=;
 b=fW/fEgjGONaTGTednuUl9AnM74Zdt6TIoIpX/iOUZiy4WlapTipsRKqqdokKXmSw1T
 cH9L2Pw8BeYCMKNc8tZ6zPxNG9fpvFuEX7cLODJhp/9yvlz8ZQy86Wk5xlfe8r7cZhRS
 U9650b8a375K7SXTKIhNap98pUZw6P3lDbd2cRtEcLFzXVzLhs15CC/pnRA6AZruQb58
 B1ovafsstjbnEuKSrxJYrFVzCzx4Oij6NHlrfV2GHBJgdJ/pyCnLusQqCj17o7ozPEbM
 /b3ExK8mcZD1pZK+fQFIkpC344axVX1LwBnwqFYvOI7T0nAi8RJ6gVYuaLyPA+yjA2a5
 nNEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS6+xIDktuNVtAgiUzIiZEQXxRUNFkBLC7QbO8k4M4CBfxdeKLpzEpWv8om/KQBSxnc0bQ0AS89advManknVxcfuzE
X-Gm-Message-State: AOJu0YzrrLv8YoGdLdR9+VXUaD2SklAwPKMNBm1LHQRBYAXvE+ni2riZ
 gufjozSzXsePGPUXi/jkGoWVSBrrDt4nMJbLHz+M59T3sI61D/yipJMdpGefhQw=
X-Received: by 2002:a17:902:9f8f:b0:1fb:7f2c:5644 with SMTP id
 d9443c01a7336-1fbb6d59c22mr19592045ad.31.1720540270809; 
 Tue, 09 Jul 2024 08:51:10 -0700 (PDT)
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fbb6a3fd26sm18288665ad.117.2024.07.09.08.51.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 08:51:10 -0700 (PDT)
Message-ID: <5b37a1af-e066-4916-9071-c9bf0c84d837@linaro.org>
Date: Tue, 9 Jul 2024 08:51:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] target/arm: LDAPR should honour SCTLR_ELx.nAA
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240709134504.3500007-1-peter.maydell@linaro.org>
 <20240709134504.3500007-3-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240709134504.3500007-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: f7HCVm3YAkVt

On 7/9/24 06:45, Peter Maydell wrote:
> In commit c1a1f80518d360b when we added the FEAT_LSE2 relaxations to
> the alignment requirements for atomic and ordered loads and stores,
> we didn't quite get it right for LDAPR/LDAPRH/LDAPRB with no
> immediate offset.  These instructions were handled in the old decoder
> as part of disas_ldst_atomic(), but unlike all the other insns that
> function decoded (LDADD, LDCLR, etc) these insns are "ordered", not
> "atomic", so they should be using check_ordered_align() rather than
> check_atomic_align().  Commit c1a1f80518d360b used
> check_atomic_align() regardless for everything in
> disas_ldst_atomic().  We then carried that incorrect check over in
> the decodetree conversion, where LDAPR/LDAPRH/LDAPRB are now handled
> by trans_LDAPR().
> 
> The effect is that when FEAT_LSE2 is implemented, these instructions
> don't honour the SCTLR_ELx.nAA bit and will generate alignment
> faults when they should not.
> 
> (The LDAPR insns with an immediate offset were in disas_ldst_ldapr_stlr()
> and then in trans_LDAPR_i() and trans_STLR_i(), and have always used
> the correct check_ordered_align().)
> 
> Use check_ordered_align() in trans_LDAPR().
> 
> Cc:qemu-stable@nongnu.org
> Fixes: c1a1f80518d360b ("target/arm: Relax ordered/atomic alignment checks for LSE2")
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
