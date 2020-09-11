Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp231923lfq;
        Fri, 11 Sep 2020 12:32:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUqWWwqfIqQQ2T0dlQ7HQl4u043NsdMle59A1PZU1nyoOraxzwyCutFB0OHFjDQ26Z6U7R
X-Received: by 2002:ac8:5305:: with SMTP id t5mr3511616qtn.278.1599852770724;
        Fri, 11 Sep 2020 12:32:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599852770; cv=none;
        d=google.com; s=arc-20160816;
        b=R979Ftn17aF9R5sqDsHeC+7u9pciZcUANDd/INX2EldV/igkk7RaoFdQ7F3toyEnxo
         C9S/1XOUP/xK8zzaQSVYuzyrtPUg+GK3N3uXrP1ZVjKrLctEYGTuoq8tGdY/DXYIS81V
         iuXVbsBR7IBxB8tdzIGdiJOf8vCRQ4oOGbK0PF43UP1InLtiKtVSCMSxenoX8EwOka5C
         v6yAwTBBUmHxsgYPU0mVXDrnJBzBs0qwuU1GRpDwlgSfc3RIqLX9NIqlCc4CvYkVvyXJ
         vUFguvF0jMo+E1xnUYkBttIDbiOpmb9wbE6B8Ansos1G6JBjKe/exn80VzS/QLbYZQ2w
         3Jaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=9Q7Y8X4tEBGZBhcUzxSkpKyUE7cjbzl0G3J6ilMIXKY=;
        b=OJ8Lj5IyPpJZhBqQJKTblnUrUHPeFjcxBHESF2P1ibuSddbzVATEd8xYs6+5wPx+Mo
         D+LLm66I0Vdrpvt0LuJFn4eKAlRsmb5lT1LsaCkPPixhrqj2gWJpOEN4CWow0yV+IBXZ
         zRwNh/WiM0ASa60yAj/qsOabbB/3Xdq8sE/GwCpcNHbpIi2aQLjfjybK9eHk71uj+GV5
         gMesiiJioyHcPqwzxJNU0AD0gfYPnE7nmWq5qVAsOP4E7KKOqilfFJE2wtYKqT6tJlFh
         7Bh2JNT/9Cz73Is5tY6rIYEPjbxVpImsZTFC6UtXC9UYXVakx1k0znAb3/XJd9Ttnfpv
         RNIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rRf5qHtx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o7si2312970qvx.195.2020.09.11.12.32.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Sep 2020 12:32:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rRf5qHtx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGomw-0001fT-2h
	for alex.bennee@linaro.org; Fri, 11 Sep 2020 15:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGomb-0001RD-Nu
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 15:32:29 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:46222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGoma-0000dh-7X
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 15:32:29 -0400
Received: by mail-pl1-x642.google.com with SMTP id d16so1322670pll.13
 for <qemu-arm@nongnu.org>; Fri, 11 Sep 2020 12:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=9Q7Y8X4tEBGZBhcUzxSkpKyUE7cjbzl0G3J6ilMIXKY=;
 b=rRf5qHtxWaUKe47odM3bVssDZIWg71GI7UvPZRYzozV94x5IJ2FHgz3E1gTbon+Eer
 BhBEwPNVglu9rBeADUM4mY4cau9NjofOlLTE0XKgjzYM8i1DV4fIQg1DFZyZO/fzbQ1K
 JZCDY9zEWm8v9XjqRcWjw6ALMKcKm0ch+qw9DpzB6LfoYnQ9Pz3Z8Ulu7zUqfg0niIbb
 nb2sgnill/2Y4SICk8Jyb5Wz/mskEBWRuxRdFfDGh2oBlBShpmLLgpzR5xK0hRNtWdh9
 x4VZYh1tJQI/IrIR2rM9Go5cqGQdpiycnbvKMMuVmqFPZ9GmgMqsTY5Jo3OIDDqL/qYj
 yCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9Q7Y8X4tEBGZBhcUzxSkpKyUE7cjbzl0G3J6ilMIXKY=;
 b=hMPDhvnCZCk1YasE2erg2dw2P3iTFhZ+mn97zOMHik7XQRIT8fhReMzLuGqyzdug/x
 Hfum+vJpT66eYve9Ft/BU/7vFTdwnrK0xKL9DB9v6meWiThpth6HcvBW6CA1gntsRtGi
 HO1ITbE+6yGFw7PwGqnBDmuCZE+VXvWDXXq+iWQbvwZTy5+cOOSGSccdI63bdAzjJc6O
 GP+JYGFgLdBHbOvfAZTXhVW3JgShKAwp54qnBSdNoim7YoxU30SvMk+wcGyuEXL9oBXE
 gMut36H/5qVS+y6ocL/6buIsfB6VaiPaazocY8xvtzLAsdakm8RVeauuAA37ykS06RPf
 oUAQ==
X-Gm-Message-State: AOAM5303KRN3b50DO9DyFEaWIVakGyjZM6OHaLkMvTcLV7B6qkCTFPvW
 BAXoIMeXZlQoSgwjj3NouIh9NA==
X-Received: by 2002:a17:902:bb84:: with SMTP id
 m4mr3437829pls.90.1599852745706; 
 Fri, 11 Sep 2020 12:32:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id k5sm3101343pfp.214.2020.09.11.12.32.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 12:32:24 -0700 (PDT)
Subject: Re: [PATCH 5/5] target/arm: Make isar_feature_aa32_fp16_arith()
 handle M-profile
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200910173855.4068-1-peter.maydell@linaro.org>
 <20200910173855.4068-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7b490e9a-5cf0-0be5-fd6e-e3612674b3dc@linaro.org>
Date: Fri, 11 Sep 2020 12:32:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200910173855.4068-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.469,
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
X-TUID: 6ydzwn6+aN80

On 9/10/20 10:38 AM, Peter Maydell wrote:
> +static inline bool isar_feature_aa32_mprofile(const ARMISARegisters *id)
> +{
> +    return FIELD_EX32(id->id_pfr1, ID_PFR1, MPROGMOD) != 0;
> +}
> +
>  static inline bool isar_feature_aa32_fp16_arith(const ARMISARegisters *id)
>  {
> -    return FIELD_EX32(id->mvfr1, MVFR1, FPHP) >= 3;
> +    /* Sadly this is encoded differently for A-profile and M-profile */
> +    if (isar_feature_aa32_mprofile(id)) {
> +        return FIELD_EX32(id->mvfr1, MVFR1, FP16) > 0;
> +    } else {
> +        return FIELD_EX32(id->mvfr1, MVFR1, FPHP) >= 3;
> +    }

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

