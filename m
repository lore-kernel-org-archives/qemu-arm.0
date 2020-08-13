Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp871041lfy;
        Thu, 13 Aug 2020 13:57:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrhlyPCA1IC1+X1etZmvMto5z422VG4TbinmSfDYS+fLNJYZ495uUK7PjfSN8nBl7Vn4lk
X-Received: by 2002:a5b:411:: with SMTP id m17mr9695935ybp.492.1597352222193;
        Thu, 13 Aug 2020 13:57:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597352222; cv=none;
        d=google.com; s=arc-20160816;
        b=xcQmzpRkSJQxivrX75qx0v+fUfPpnAt3Jy5viVS2FSepIg9w9AamOBvd/KibNqpNUi
         aZp7n6MsERx7up12/+/DPKn+1V75xVDm70NmaZquQi++8tKD7/eRQHco4MCVKRZiQ0wr
         6PrFo8pEWJ4BCqS+/OPpZj3FUkw/55OglAribAfRuxoR9Ut3VIBtQPC0k3YG9QJ5DiFO
         fs6wgY5ZePBz9bXvLN0l8dWwxj2bHOgFYnU42Fa7Mic9zQnGQe7u0pmY3LDRsXv8vVjO
         YajoMoGTFC9K19A7SAXR/oPVimf+Mo0WDxbr68AabkJU8yNrTS1Cru2tfSwNgis2LLNp
         WZcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=9DlQfSwfQPql/XtPjOtP2x2qFbQl3utLpcCKTEXfhNM=;
        b=UzTSgO8NBBFivUKMQyvaTOHyDRIr2BG5tZdxfnpCw9sQhIXZR2Tky7HkoD4gfpSkvm
         1sBwGfTtNBKMUS7wZkt6uTg8tVyA+Wlz26zrChTDXRLtvgD35BJDNJXVzqun807da90E
         ll27VhXyAJsHs6P6wsqtodwz2ymBqrVxtk3lFTml+xQGjpEYKpOl4Y6zuefgW3BDyVwT
         HuCBqMdAa3nBsbB10RX2XYzFV1D7413oEzE3pOqnJ1/PufsdpLFScddPO6G0cxLY9N+a
         XOJwZXZa14lTPqFHPgr7Ox08vWCDvxrdwQyp4ve6+I9bBCs+M+PgM8pbd1Ubc1FpmobQ
         6vhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="szfdNpV/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 127si6154882ybc.335.2020.08.13.13.57.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Aug 2020 13:57:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="szfdNpV/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6KHV-0001Yb-KV
	for alex.bennee@linaro.org; Thu, 13 Aug 2020 16:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6KGh-00019J-P0
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 16:56:11 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:54332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6KGf-0001IA-Ku
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 16:56:11 -0400
Received: by mail-pj1-x1042.google.com with SMTP id mt12so3345342pjb.4
 for <qemu-devel@nongnu.org>; Thu, 13 Aug 2020 13:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9DlQfSwfQPql/XtPjOtP2x2qFbQl3utLpcCKTEXfhNM=;
 b=szfdNpV/I71nmSuxiEcQ3Sre/B7P4LGn5Q5MjnsGgCODu/uSyJgwXd+6GXwL7If+Gf
 yj6uYWAKsy/EUDF027+HhkUEpSBej3LEh1cAHkL3gPTcppuh+q2vBg6lXpr3YKQYCkEt
 WksscQSiCcAZhAAZVUpifnMJH+ebGhhqJMRG8bLFp0fAh4cqNSHTwQJYSzPmdEX3yWfn
 VUvnQPRfQ0pyLcJp1nqoa3mfhXXHb/w9K97EBSAnCo7IOeNQza2KZBux84KfqK2aydH+
 tNtM+L+E4q1g3bIPq4x/kk3A1SnFkeplAIdbwFaYykOC9/KH4Ho4a//3lvbkgwC96z/D
 ctoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9DlQfSwfQPql/XtPjOtP2x2qFbQl3utLpcCKTEXfhNM=;
 b=Nc9VVAOIiM0uJ/n7gzYruE+IJGO0tkQh+H0Cbwm7/08PyOhoFjEB8dnqBL9T3TmiTy
 tFp2roT9G2YjTS0sd3TmxSCrs8Hh6PtUEGqnSBWznhkKfTAM4yIvOS5yaOiJCUPGiLkC
 QQK+Y0GhEuDq1kFS+Blr2Gql6M6BDbvbyon9e7AdFTYtPcSK90l8KxbGs8+ACPxZHq+h
 Hf3ZTAqrP7BK+z1IydE9oyJtdtIi0pfcZs4FdxjpprgLMjcrPPDsdEKodejwGnhqSEjE
 euSDPuVzFIv3Vd/YcuLS5GAZAbmJ3T3FlEWIa0uLWfyp6k/I5zhUAl4KVSCXKE0LdjWp
 4SUQ==
X-Gm-Message-State: AOAM530OBjydIJJSdT5138igLSxbQ6WXwwL3mwCO/vIcvbRJ41xm5ITu
 ZkVBZFblMqfHDgGYDU8mC1XLuQ==
X-Received: by 2002:a17:90b:3197:: with SMTP id
 hc23mr6642230pjb.110.1597352167911; 
 Thu, 13 Aug 2020 13:56:07 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id u15sm6235699pgm.10.2020.08.13.13.56.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2020 13:56:07 -0700 (PDT)
Subject: Re: [PATCH 1/1] target/arm: adjust CPTR_EL2 according to HCR_EL2.E2H
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20200811060749.159-1-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <23e615df-8e29-6e4c-a1bd-5f8ba414f471@linaro.org>
Date: Thu, 13 Aug 2020 13:56:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200811060749.159-1-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DYN7g2oK+7ew

On 8/10/20 11:07 PM, LIU Zhiwei wrote:
>      if (el <= 2 && !arm_is_secure_below_el3(env)) {
> -        if (env->cp15.cptr_el[2] & CPTR_TZ) {
> -            return 2;
> -        }
> -        if (env->cp15.cptr_el[2] & CPTR_TFP) {
> -            return 0;
> +        if ((arm_hcr_el2_eff(env) & HCR_E2H) == HCR_E2H) {
> +            int zen = extract32(env->cp15.cptr_el[2], 16, 2);
> +            switch (zen) {
> +            case 0:
> +            case 2:
> +                return 2;
> +            case 1:
> +                if ((arm_hcr_el2_eff(env) & HCR_TGE) == HCR_TGE) {

Since the outer if checks that we're in non-secure state, and (by nature of
sve) we know we're in aarch64 mode, then we don't need to use arm_hcr_el2_eff
and can just use env->cp15.hcr_el2.

Add a comment

>     /* Since we exclude secure first, we may read HCR_EL2 directly. */

like we do in vae1_tlbmask.

You do not need to write

    if ((x & bit) == bit)

just use

    if (x & bit)

here.

With those changes,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
