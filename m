Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1454091ejm;
        Fri, 21 Apr 2023 15:48:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350ancBIDkcahxalS6WVo9Fp5JblSoEmhsLLn6cF3aqsmZA/iA04/wr1XieCyCJkA1KWx34YS
X-Received: by 2002:ac8:57c3:0:b0:3ef:61d9:bc6d with SMTP id w3-20020ac857c3000000b003ef61d9bc6dmr5022657qta.14.1682117329600;
        Fri, 21 Apr 2023 15:48:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682117329; cv=none;
        d=google.com; s=arc-20160816;
        b=PX9HNJy4NnSMHrBkiRo5kvYkT4s85/9Pyc/9r/DRWbYgh4ydoCF5u1b9g2zPL9mH6m
         6h4M00VR5x8bZdFvR64az407aTSxiNkapLxNRzxoyKJzPgfq7bfiWIj2YbSH9rwpdgz/
         hDPVWsp9JkKOePgtmaZpOgSn5fW3v4VBuNT6u2feNu5DnyGZsGPjUo2BrrJph9J8s/cO
         CZ7w0CKZnNQVdmtnvjupeVW1UmzA4eZMzx/sJw+rcEKuqj3fdh6oyCPsqid3gYfyeAYR
         an10a8PnLfo2y4hgfzsiGqjB836nVXqmGZh15WstCYPqRg22S1HZ0yvBYHbms5FiLgyH
         bIqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xllKdc616qtY9+IAX7UEbQTG2zDbOiMc6Fuh3bTnLBM=;
        b=Tay+Z2hk3CWRyey2OXrnPDwSR/x/MP9zGsgrL3SZ7D19II1BaZUD/5WEdryerCPrZD
         i1xRCw5mM0890+a59MTBihqNqRmRYSEi587BF6V541ZgrzD1h4aFVvCTsma/bbZQ/U34
         tiIqIgJq+ItsPn3c3Alk4PYbCAPTg1DKRuT/ikryDDBVmTMZQ2WyLaXYVmLgZjaZzGg5
         AshOV6aKgG/N1x5W+2pnB0PyFptKUCQ/edvfexNj4IGoETwB4pn9+23LoxWn9nXCnDf5
         Skwj6Ga+LDPk92RykcnH00lpI17wqjzY7dFyGx1KGOlF3xcD9y6GjAc3jjnjoHu/fl7q
         EaMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r0DB3J3N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12-20020ac87f4c000000b003ed330f5d3dsi4054056qtk.678.2023.04.21.15.48.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Apr 2023 15:48:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r0DB3J3N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ppzYe-0007hx-7j; Fri, 21 Apr 2023 18:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzYc-0007hH-2H
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 18:48:46 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzYY-0002Zp-8k
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 18:48:44 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f1957e80a2so24129445e9.1
 for <qemu-arm@nongnu.org>; Fri, 21 Apr 2023 15:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682117321; x=1684709321;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xllKdc616qtY9+IAX7UEbQTG2zDbOiMc6Fuh3bTnLBM=;
 b=r0DB3J3N4MibownfG8sScOh3nVc4b+HGTEu5i5934CCBkgWwtOu3RB+NzShQKkcZje
 eNPMta6vuBvHBOQyuImKc8B7JgHWSVK0MbAUgCXPpzP6fOsr4xmb0aEXE3Yd0q18isQU
 9IyeWBqHOewqZttJ6jZh+nzY4xh59JtWNn1ilj8vzkveZX1SIN4kZucKcTMJ1E7lKzGf
 aF3UB7Hcu6PHH16Yq+KrTCKx7IXXBDrLDINF/8PNJ8QsEZZQOkLybxtzYKWL11YH0nP4
 n/i3udZa+xvYWmHtJXDD96YVUw7t2KBhpkBSj7Q4NgC65JR+7JebNe/2htugbivMFyQj
 9Crg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682117321; x=1684709321;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xllKdc616qtY9+IAX7UEbQTG2zDbOiMc6Fuh3bTnLBM=;
 b=jxx04Qn0ku0WAwhzzNm2Gbb7hbMqhQGLYpMRM8MKCh0mJjNx0puCrREEqCfl4h3xaB
 PH8RSJmW1dcTBDWlGFv03BTyXD+zkQCmP7CbOfJ9yD5js+1cfhvEasBDvJSIzPdEytqm
 xuufemS4iUUuyjS9EB3aukXamhWVRl6Fqn+k5olunM1dzIp3mV350dieCswsDeATDW0K
 lCkuxDgPVn9SKJWoR1SeAsnvza7gb3A60ieJGo4B022plnkgbWV7CwO4sDQeTq3CxyfJ
 5sNObzEHNj2cCQhDJ2q6t4jTr0WYF8ofLNH3Uv78p1fsdhFC/Z/QHPlGs3mBprbkTRz5
 +PPg==
X-Gm-Message-State: AAQBX9eQIQ1SiPHRfdRxBxWXlvVr8ppkgJCHGMg4CCvh0H1CoZ57iXd+
 BVnEy4p68fGjlN/1u6G0cvEqnQ==
X-Received: by 2002:a05:600c:35c8:b0:3f1:96a8:3560 with SMTP id
 r8-20020a05600c35c800b003f196a83560mr1167706wmq.10.1682117320976; 
 Fri, 21 Apr 2023 15:48:40 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 m10-20020a5d56ca000000b002c54c9bd71fsm5305862wrw.93.2023.04.21.15.48.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:48:40 -0700 (PDT)
Message-ID: <8d199023-fb40-655b-2c5d-0fc3e345a580@linaro.org>
Date: Sat, 22 Apr 2023 00:48:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 15/54] tcg: Split out tcg_out_extrl_i64_i32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-16-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: T9bcGr3UBUjj

On 11/4/23 03:04, Richard Henderson wrote:
> We will need a backend interface for type truncation.  For those backends
> that did not enable TCG_TARGET_HAS_extrl_i64_i32, use tcg_out_mov.
> Use it in tcg_reg_alloc_op in the meantime.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                        |  4 ++++
>   tcg/aarch64/tcg-target.c.inc     |  6 ++++++
>   tcg/arm/tcg-target.c.inc         |  5 +++++
>   tcg/i386/tcg-target.c.inc        |  9 ++++++---
>   tcg/loongarch64/tcg-target.c.inc | 10 ++++++----
>   tcg/mips/tcg-target.c.inc        |  9 ++++++---
>   tcg/ppc/tcg-target.c.inc         |  7 +++++++
>   tcg/riscv/tcg-target.c.inc       | 10 ++++++----
>   tcg/s390x/tcg-target.c.inc       |  6 ++++++
>   tcg/sparc64/tcg-target.c.inc     |  9 ++++++---
>   tcg/tci/tcg-target.c.inc         |  7 +++++++
>   11 files changed, 65 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

