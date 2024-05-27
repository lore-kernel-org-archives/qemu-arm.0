Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp3005548ejb;
        Mon, 27 May 2024 00:05:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUKkMqLCJuh4uqaxYxRQV6hKv4Xw7saQ8o9k72iiVFA7BTH9aoLXXUiHO3o5YnvXtMEQEey5eFWV/+200mWu3BeoGML1HpM
X-Google-Smtp-Source: AGHT+IFDiz9hmeSKtR8P0h3WE6l1tv85b3Rs/s8juMMgBP4P9Uj+s9SQl0csYqtZ/jwsWmy/NWkh
X-Received: by 2002:a05:6214:3a8c:b0:6ad:7d09:88a1 with SMTP id 6a1803df08f44-6ad7d098cf1mr27166526d6.49.1716793520938;
        Mon, 27 May 2024 00:05:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716793520; cv=none;
        d=google.com; s=arc-20160816;
        b=GHd8qPS7az5mG9BSpQEkjJstqHiTP09GKEbNwWR7CyNT1THFpxQkged0wQtCjiG5YG
         x7dgioTeqMHx4KGhBiJF6d8z0k5/SQgkusyy7w0wWVrY0Rs8naemFzwTUvQhxMf9aiCt
         O8mkxHyWS/y1mMxJyzwbz64976ZOgE4uwGMHXm/Au5fMN0zryHeh9akiHckS5ZmJnpua
         8lX7V4bcDchvN52cw9tWPIMHys/0jmdcpS64eKKw4DCv/vaiqVoXnOpGllMf4ThU1iQx
         t+KMbetzjhI3bsLX882UZaSgcr7kgOo/G7HRg93JdAu2rJFDo5c0PeFU87767yC+of92
         kdVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=sUN+hBq6elNx/aMrQCnyEWtQdzIQfoahXjvsGkN14Zc=;
        fh=2cT/sR9zZpqbbODO1yx0is4uRhVN1S9hccetPRHttQo=;
        b=AReFhs3gnnNqKxwVsHrKJjI7z0raxwAgoZl0+nfPrUiB3IrRFuDf9QCMoAFoVNF10r
         MmJI6A8RimIQlh1GUKyNw6Y4io+2wVtlhe7IFRPEsm8KOK+hkdT72091rq3lnRx0QbFz
         re7Ub9ITEwa7boyz1MgH59z5cKQQRBzF5hzhvXQDPGx2qze5/n0JTUnyVoh9j4VFa7PJ
         PBwdWVypK7pagWLNSlReisxT24HiywWV7zpT77u/vXoJQn3LxlxGuYAtly4GkB7mg6PE
         RXutNecznJljcsJjiZdtOEdmlCgraL3I0euENzFnjGv1U/U613ebdtk5RnJcsTeqkoCn
         mSsw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@lmichel.fr header.s=pharaoh header.b=ISVkyPt9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac1625f56bsi76309896d6.375.2024.05.27.00.05.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2024 00:05:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@lmichel.fr header.s=pharaoh header.b=ISVkyPt9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBUPO-0000Lm-GZ; Mon, 27 May 2024 03:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1sBUPM-0000Ka-9m; Mon, 27 May 2024 03:04:36 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1sBUP9-0002ON-Gy; Mon, 27 May 2024 03:04:36 -0400
Received: from localhost (sekoia-laptop.home.lmichel.fr [192.168.61.102])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 27BD7C60180;
 Mon, 27 May 2024 09:04:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1716793458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sUN+hBq6elNx/aMrQCnyEWtQdzIQfoahXjvsGkN14Zc=;
 b=ISVkyPt9F7IbIUn/ZA9Ea3Opzx6jG2ceNSZ9uHG1VCbNVhez+jNMv4J+Q78sZ8+Hlm7jQ0
 9G+PLgfgC1bSYmJ0TDxb4wV4tAC2VpRChXvpmNLmuBQl1Bd6NJ4R4SUDo4sCLvSU5UM2zk
 1my4BkykGv3ISA7gEEAbUX/q4yEV0oYuBhjsXTaD0tjur4VD75yggiRmCu4dEnhDX+IIBK
 CWnn2JJkVL8/0NrWMvY2iZbM0PTBbR2IUBgvQ88tjUPaChFHKQ/hQK+nogAtuN1DvqVuGu
 ss+pICKgV3pPuLpPJelfTSAscjdmFlQDsxG/5azsxss+yl6Z7BKYPTe6CBGAGQ==
Date: Mon, 27 May 2024 09:04:17 +0200
From: Luc Michel <luc@lmichel.fr>
To: =?utf-8?B?SW7DqHM=?= Varhol <ines.varhol@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Damien Hedde <damien.hedde@dahe.fr>, Paolo Bonzini <pbonzini@redhat.com>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 3/4] hw/clock: Expose 'qtest-clock-period' QOM
 property for QTests
Message-ID: <ZlQwcWKiuuYhjU22@michell-laptop.localdomain>
References: <20240523194441.21036-1-ines.varhol@telecom-paris.fr>
 <20240523194441.21036-4-ines.varhol@telecom-paris.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240523194441.21036-4-ines.varhol@telecom-paris.fr>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: FZ/s+7uu9L1c

On 21:41 Thu 23 May     , Inès Varhol wrote:
> Expose the clock period via the QOM 'qtest-clock-period' property so it
> can be used in QTests. This property is only accessible in QTests (not
> via HMP).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> ---
>  docs/devel/clocks.rst |  3 +++
>  hw/core/clock.c       | 16 ++++++++++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
> index 177ee1c90d..19e67601ec 100644
> --- a/docs/devel/clocks.rst
> +++ b/docs/devel/clocks.rst
> @@ -358,6 +358,9 @@ humans (for instance in debugging), use ``clock_display_freq()``,
>  which returns a prettified string-representation, e.g. "33.3 MHz".
>  The caller must free the string with g_free() after use.
>  
> +It's also possible to retrieve the clock period from a QTest by
> +accessing QOM property ``qtest-clock-period`` using a QMP command.
> +
>  Calculating expiry deadlines
>  ----------------------------
>  
> diff --git a/hw/core/clock.c b/hw/core/clock.c
> index e212865307..216b54b8df 100644
> --- a/hw/core/clock.c
> +++ b/hw/core/clock.c
> @@ -13,6 +13,8 @@
>  
>  #include "qemu/osdep.h"
>  #include "qemu/cutils.h"
> +#include "qapi/visitor.h"
> +#include "sysemu/qtest.h"
>  #include "hw/clock.h"
>  #include "trace.h"
>  
> @@ -158,6 +160,15 @@ bool clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider)
>      return true;
>  }
>  
> +static void clock_period_prop_get(Object *obj, Visitor *v, const char *name,
> +                                void *opaque, Error **errp)
> +{
> +    Clock *clk = CLOCK(obj);
> +    uint64_t freq_hz = clock_get(clk);
> +    visit_type_uint64(v, name, &freq_hz, errp);
s/freq_hz/period

Otherwise:

Reviewed-by: Luc Michel <luc@lmichel.fr>

> +}
> +
> +
>  static void clock_initfn(Object *obj)
>  {
>      Clock *clk = CLOCK(obj);
> @@ -166,6 +177,11 @@ static void clock_initfn(Object *obj)
>      clk->divider = 1;
>  
>      QLIST_INIT(&clk->children);
> +
> +    if (qtest_enabled()) {
> +        object_property_add(obj, "qtest-clock-period", "uint64",
> +                            clock_period_prop_get, NULL, NULL, NULL);
> +    }
>  }
>  
>  static void clock_finalizefn(Object *obj)
> -- 
> 2.43.2
> 

-- 
