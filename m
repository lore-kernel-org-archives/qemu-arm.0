Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp560091ejj;
        Mon, 25 Mar 2024 01:40:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXhW6l6y8SGSinMYQW93ifPTCBSIbLBM5KoagtQt+ocUIfHGlVIX74biLcqt36QMIrkv7GXsSLLmJRNA1LkBlNzfAKvS4xe
X-Google-Smtp-Source: AGHT+IGR0Ll7tRSVUeg7Zja9WLmC5B2wN46JDJF4ItxoB1D7EQjEDuh+fToksS1RBVGoP9vMzjhk
X-Received: by 2002:a05:6214:2586:b0:696:7134:fd8e with SMTP id fq6-20020a056214258600b006967134fd8emr6194305qvb.63.1711356029394;
        Mon, 25 Mar 2024 01:40:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711356029; cv=none;
        d=google.com; s=arc-20160816;
        b=OR0UyFc50DhUWnmDU8+u5JOQcU4xBXE3HnQzYRTckFANIH8GHU7EGPmd/zkkX/Ttjr
         KNt/UGM4btYvkFpETXzTFIaAISZY8UHTspgW8LbWPyaSilLRU6XSaqx55s9A8IHf9m39
         COY5sWxd0W2eS7lXZZxagJCXfgJv8tJA8eVqH+xNwPIAX4BfqmcF86zy6WCUbOy83FOI
         iCyfGIZF5qWC4KOIPb+U205Rz3+ozEWpIRHemJBmX9RIq+JGQ7whLVzb3yfCHNvpc+xI
         TQ6SL0Cxc86hRMPdpr+UA0ydio9Mj7oHPCPbHnjNh/bbafcnixmNVW/MKf/snmcSQcav
         IJnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=vHRuwnOdguxqhxPoHLzR5N48+FWlPiQSh+ab6PKX8OA=;
        fh=h/fW11Tg+WOndcWhLvcQNSWpw/oBT+AnHC+/NuGFZ5E=;
        b=BNE/aeVCJg2LTDwljW7iTPpkdqXY9/BTzJ/shlzmrdLla37tYBbqmopQGvnFLtiltB
         UeVF240DzkhNI4utInuGX96YVbPA7OXQ64kYciPoXmxqnp+nVSpWiSLt5/xZgXFtEVf/
         bNKGu1+AGqR1cVXJtkds5YUEyovbmSR8sxq3aOb3XYzIYTasqbx0iGjEBMwndfcIlo6V
         3UI0fIzGikTBJjLq2jK4PLdjelX7zK8lV7x81BHmCt/FbOpAAm15X63vyunYSb2eKQ8f
         r2Mvu99P+VJSY9MkDZIuqrrCR3cMPee3lP+TLfMrbzBkx4G6kfDPC9pRIVFiW5z7xPcS
         VVdw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@lmichel.fr header.s=pharaoh header.b=ZKSJvgVZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gf9-20020a056214250900b00690068429b1si7244025qvb.349.2024.03.25.01.40.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 01:40:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@lmichel.fr header.s=pharaoh header.b=ZKSJvgVZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rofsS-0008Ur-6L; Mon, 25 Mar 2024 04:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1rofsP-0008UM-Ea; Mon, 25 Mar 2024 04:40:17 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1rofsM-0005Gc-Dp; Mon, 25 Mar 2024 04:40:17 -0400
Received: from localhost (sekoia-laptop.home.lmichel.fr [192.168.61.102])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id DC89AC60172;
 Mon, 25 Mar 2024 09:40:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1711356009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vHRuwnOdguxqhxPoHLzR5N48+FWlPiQSh+ab6PKX8OA=;
 b=ZKSJvgVZXP4JQ2sDJWMoaBecgMICCivMlVUz0p1bylsqGQzATDtZRgRoKuEhuJgoaxbceJ
 7Ncd7IiPQTPUgwsKoUOjpFJl6DJvhKkzoFKfQj1EZpg7Di0eQ9x1bIndNz+VrdXmGPrp9K
 Y9uvKLdSWTEKyHfhRJdBLCnbPx3fxe9kn8WCVBNPocMM2ZW+zpB/XFgcjedcjLzT0q8cuX
 69wYaA4KvdDXiZh8FlKH9xk7ANfw4CmzXqxmE4uH8H2HAwsEpmpIZ5WmJB0p8H0uh1I1ZR
 MG2mH/4G5Cf7K/YPyFjUDLZDWHdnVF88yB8i+DHMgTCzzKGfLBhowqRrQwmz2Q==
Date: Mon, 25 Mar 2024 09:40:09 +0100
From: Luc Michel <luc@lmichel.fr>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Luc Michel <luc.michel@amd.com>,
 Damien Hedde <damien.hedde@dahe.fr>,
 =?utf-8?B?SW7DqHM=?= Varhol <ines.varhol@telecom-paris.fr>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, qemu-arm@nongnu.org
Subject: Re: [PATCH-for-9.0 1/2] hw/clock: Let clock_set_mul_div() return
 boolean value
Message-ID: <ZgE3fZx7qNkYATms@michell-laptop.localdomain>
References: <20240322155810.5733-1-philmd@linaro.org>
 <20240322155810.5733-2-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240322155810.5733-2-philmd@linaro.org>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eIN8vH7xywOk

On 16:58 Fri 22 Mar     , Philippe Mathieu-Daudé wrote:
> Let clock_set_mul_div() return a boolean value whether the
> clock has been updated or not, similarly to clock_set().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Acked-by: Luc Michel <luc@lmichel.fr>

> ---
>  include/hw/clock.h | 4 +++-
>  hw/core/clock.c    | 8 +++++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/clock.h b/include/hw/clock.h
> index bb12117f67..eb58599131 100644
> --- a/include/hw/clock.h
> +++ b/include/hw/clock.h
> @@ -357,6 +357,8 @@ char *clock_display_freq(Clock *clk);
>   * @multiplier: multiplier value
>   * @divider: divider value
>   *
> + * @return: true if the clock is changed.
> + *
>   * By default, a Clock's children will all run with the same period
>   * as their parent. This function allows you to adjust the multiplier
>   * and divider used to derive the child clock frequency.
> @@ -374,6 +376,6 @@ char *clock_display_freq(Clock *clk);
>   * Note that this function does not call clock_propagate(); the
>   * caller should do that if necessary.
>   */
> -void clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider);
> +bool clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider);
>  
>  #endif /* QEMU_HW_CLOCK_H */
> diff --git a/hw/core/clock.c b/hw/core/clock.c
> index d82e44cd1a..a19c7db7df 100644
> --- a/hw/core/clock.c
> +++ b/hw/core/clock.c
> @@ -143,14 +143,20 @@ char *clock_display_freq(Clock *clk)
>      return freq_to_str(clock_get_hz(clk));
>  }
>  
> -void clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider)
> +bool clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider)
>  {
>      assert(divider != 0);
>  
> +    if (clk->multiplier == multiplier && clk->divider == divider) {
> +        return false;
> +    }
> +
>      trace_clock_set_mul_div(CLOCK_PATH(clk), clk->multiplier, multiplier,
>                              clk->divider, divider);
>      clk->multiplier = multiplier;
>      clk->divider = divider;
> +
> +    return true;
>  }
>  
>  static void clock_initfn(Object *obj)
> -- 
> 2.41.0
> 
