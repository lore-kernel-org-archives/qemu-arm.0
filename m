Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp320473ocg;
        Fri, 7 Oct 2022 02:29:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM65ngg5hv6DTB3H8AO+gMjQ1QVNJGNXcSLel6qnDjnbOvAkwGU/xSHky64dvfrRiyDcleYP
X-Received: by 2002:a05:620a:102d:b0:6e2:cf74:1241 with SMTP id a13-20020a05620a102d00b006e2cf741241mr3019777qkk.92.1665134987094;
        Fri, 07 Oct 2022 02:29:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665134987; cv=none;
        d=google.com; s=arc-20160816;
        b=GJpNgNvZgazMqQpi2pGQuMF5hDF2H6n7kbPf4vNcx8UC4R6s02ntJKPdIMLgKby31R
         91F4jGYz7MPRNx6tKoqJMRVJHFwRAlX8uzNCDbawtg6MMktZWvxmiual5ibgpfQ9/yiA
         8zdL0cFVTRMDtwLwZ1WdOBrKTWJfXc65KGFB93x2REJCCquzA13ddY9WzwHTL42qdC3W
         YhhT6lJDM0Ek7P5/o0NBh9s0rkQA1TXYWtZ60+vvsgVmEKfFzRezt+EPFh0ypqcp3Ugu
         LWhhvXJApW12Jf2s2g05+uK8HcF/DYONHE2ztvJiZ+UMONHAS3dYWSX6C1VHWVcEjNjt
         eqAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=BdMCYTCIJXpxF2dZ4tfztJSQ18pf6vOBS4zdHGeHeOA=;
        b=OHjIm48Jgxnz1QBJ1d/itTLeR6PQQBqacYv+VX2MiJYSVwTsoxT634oOEcWKVW9JMW
         Tut6KvMOIXRj4oet50g+6nyvWpImVhzeQgSCrR209SVxyQw3xiUqy6yQ0pHxgXv4bmHY
         uhWQh02+brP6ye7bhmSQEnLBhiEYmGPft8P6pwPOWoI1GAdrhL1FjPkrRh2Gd5ldXVrA
         C2wU4fNyYIFRqSAuB90myCekc7vFSuWA85fgnAGfhEzU5LAqcWEV5Lw9opnacsfjZxqz
         9mN9vGB+BMv5eZ/w/7gbhewFqVaWnFKU30ptZaIO2uR3+8QMYmKDKaBUB/6l4hG/wRKW
         fGUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SeDvxRYv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7-20020a0562140d0700b004b196120342si625474qvh.337.2022.10.07.02.29.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Oct 2022 02:29:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SeDvxRYv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogjfu-0000xC-MK
	for alex.bennee@linaro.org; Fri, 07 Oct 2022 05:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogjad-0006MP-HT
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 05:24:19 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:38469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogjaa-0007hJ-Bd
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 05:24:18 -0400
Received: by mail-pg1-x52c.google.com with SMTP id 129so4153865pgc.5
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 02:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BdMCYTCIJXpxF2dZ4tfztJSQ18pf6vOBS4zdHGeHeOA=;
 b=SeDvxRYvSuLIaLe0gdip0fS8oVq0xLSFQUjKVpt9j2oGNy1Ho00G0uzQFy1WgCGojm
 eD/3vHqFtQS5GcRynqRKH2FLWR5iKas7nSE6DVnNLfs3Cxf7YXZArBlBp6wF5mYOde6k
 /b4z/cmXxKsfGPS6f0RmWMEjR0AcrIAQBlRRqb5haVI266CQovTeTwzFR6nqkOxmJJMs
 asjAnm5nbuHUiynVVclwHntO0RocAopLwRpJafZTTyGoMoe/YgHQ7723UTaY/Wfr6g3w
 QNWQAneUX3N16hKAPemibJ5PB1JsU4uH3JbIXcT8lkDAdKghzlqXUir81jqWlF1P82vX
 apuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BdMCYTCIJXpxF2dZ4tfztJSQ18pf6vOBS4zdHGeHeOA=;
 b=tQuwm4liNjNbmK+/FkSO8wQHHcm3JKH27U/6Ukiyb3yzRePhw8RqjXAIL+a7LSoi2r
 cGLFCy9ESeYeDRotgvZyn02CXiHF/Il7Ygq28vp4y/XYoSY79MC8TOwq6yXZol72qkAa
 mjF+oM85bOVjTDOGAAm+1ek8MyLhg/YylIr7idktRNXyKutH9X+RaNOlNgS+u8oFLfkU
 rYIeDdDZ2TbCX6KkOjrqFDSj+oVPdeYOp4faQrgTtvIi0Zyo1TGYbsMWxS4DN81rrtf4
 p4G1gsivIE1nxz2TJsdSoA5P2p0KNKaftW7d3LrQWp87BigiiFSz+ic8k1ZiqLMZhqLK
 oPBw==
X-Gm-Message-State: ACrzQf1gAFAUDfHl+suTVpKF+6jPPNgo2JiNKQgjlO4mZSNC9LIcR9H/
 Hi2HMgvIxfcj2nv7xiWz1bIOoRx5mJqX46YCOsSjlA==
X-Received: by 2002:a63:89c3:0:b0:452:f2ad:52b9 with SMTP id
 v186-20020a6389c3000000b00452f2ad52b9mr3655314pgd.105.1665134654939; Fri, 07
 Oct 2022 02:24:14 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-33-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-33-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 10:24:03 +0100
Message-ID: <CAFEAcA94XFJ1d0Trn08cMvxnDCxd+SGwJuG1ZQZaUb9g_FZg_Q@mail.gmail.com>
Subject: Re: [PATCH v3 32/42] target/arm: Extract HA and HD in
 aa64_va_parameters
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: NxMznJqaF+JD

On Sat, 1 Oct 2022 at 17:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h | 2 ++
>  target/arm/helper.c    | 8 +++++++-
>  2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index a50189e2e4..e95b6b1b8f 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1014,6 +1014,8 @@ typedef struct ARMVAParameters {
>      bool using64k   : 1;
>      bool tsz_oob    : 1;  /* tsz has been clamped to legal range */
>      bool ds         : 1;
> +    bool ha         : 1;
> +    bool hd         : 1;
>  } ARMVAParameters;
>
>  ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 19a03eb200..70ae3816b9 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -10280,7 +10280,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
>                                     ARMMMUIdx mmu_idx, bool data)
>  {
>      uint64_t tcr = regime_tcr(env, mmu_idx);
> -    bool epd, hpd, using16k, using64k, tsz_oob, ds;
> +    bool epd, hpd, using16k, using64k, tsz_oob, ds, ha, hd;
>      int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
>      ARMCPU *cpu = env_archcpu(env);
>
> @@ -10298,6 +10298,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
>          epd = false;
>          sh = extract32(tcr, 12, 2);
>          ps = extract32(tcr, 16, 3);
> +        ha = extract32(tcr, 21, 1) && cpu_isar_feature(aa64_hafs, cpu);
> +        hd = extract32(tcr, 22, 1) && cpu_isar_feature(aa64_hdbs, cpu);
>          ds = extract64(tcr, 32, 1);
>      } else {
>          /*
> @@ -10322,6 +10324,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
>              hpd = extract64(tcr, 42, 1);
>          }
>          ps = extract64(tcr, 32, 3);
> +        ha = extract64(tcr, 39, 1) && cpu_isar_feature(aa64_hafs, cpu);
> +        hd = extract64(tcr, 40, 1) && cpu_isar_feature(aa64_hdbs, cpu);
>          ds = extract64(tcr, 59, 1);
>      }
>
> @@ -10393,6 +10397,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
>          .using64k = using64k,
>          .tsz_oob = tsz_oob,
>          .ds = ds,
> +        .ha = ha,
> +        .hd = ha & hd,

This is a bitwise operation on two bools, should be && ?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
