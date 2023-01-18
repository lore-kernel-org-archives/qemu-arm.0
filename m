Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp126516ejc;
        Tue, 17 Jan 2023 18:26:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuGb/N2RWoIuVHkw8WVSmS3FSkydc6KPqT3V8l+4YtpkkEZVLk9x2UOKZPnI+CKjK4nt0oJ
X-Received: by 2002:a05:622a:4319:b0:3b6:5fc7:f554 with SMTP id el25-20020a05622a431900b003b65fc7f554mr1637912qtb.7.1674008787972;
        Tue, 17 Jan 2023 18:26:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674008787; cv=none;
        d=google.com; s=arc-20160816;
        b=sDNAb6DKvr9DEISgEX7whVVC3tbEOMSVxJF9BUnOge2ufJvLytprAbsZxFJfS7vo3Q
         E8BXC9SLw95kFY67o4oLk6BMgvjrspn9ntNuL3KnvKMUs9fNFdP8lfK6dxdyJFAPcQG4
         7q3v9Y2uv53S/dC/zkYYDuZj2fQMogiktiTlsGQyV0a8PwlH+rkjz4EKb+EtcXCtx/SN
         k9ae6Jye9ya0BIqPSoVKyrUdcHph76vP8qvaGuVe/alx/Uq4IBxYuGWg9L0RDNuBdI8h
         VCZUOiVugbSSdJe9HZL21eL5vFbwSmKz/ufTg0KPPJxflM/MVkgYVddHwxGYumWpmWI9
         /Rmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=aowHZ/Chib5HFLR9En2Y6Cutjd1jA9ZWpfIzHxayofI=;
        b=I3hwWnyZB8vIsOycxq7LmawHehaC5BhcUCTjo2DDHlfldkKSTdbqpDfVWRW8Y4U9x+
         jrSxq2f+q+lcXB7GCdwa9Gv+onx+lnDRJA6uWIZFUlYkRQhGobGbyjy7RzPxgIWyUGm/
         6SjWwlBzeTNpoV3AC/u8Rn97FkLKQKF/ypLDBSTh5ZWb9CvB2ea4GoYmgq9edPswbuer
         9xvpfnsR5eakIerk0KMAAYR5/gB2IQ04qVCYHZzfI8Z3iJTXh1M8a+O6LJHwQLEE71/J
         nis9eBgtzdgWDN9EDnjWBLWZjvJRkpzSwTLfGye2ezF6qDP3hHAsqn6JsKUE61ZGXZlN
         ijyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=Q0pb4uCG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cd3-20020a05622a418300b003a541211888si3277626qtb.358.2023.01.17.18.26.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 18:26:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=Q0pb4uCG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHy9X-0008Hm-IE; Tue, 17 Jan 2023 21:26:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pHy9T-00088j-3W; Tue, 17 Jan 2023 21:26:11 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pHy9R-0004eN-Cz; Tue, 17 Jan 2023 21:26:10 -0500
Received: by mail-ed1-x52c.google.com with SMTP id b4so28247003edf.0;
 Tue, 17 Jan 2023 18:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aowHZ/Chib5HFLR9En2Y6Cutjd1jA9ZWpfIzHxayofI=;
 b=Q0pb4uCGRYi9XSyZirKvDUSN9hG1nTRxCHGfZTyvar8nhIEgOoBa8cQczo44Q4qdpK
 SBffl0tN5u8FBLI+I+LL0qLLgQ/UC6t2iIpFGKe8Di/CzZM/4KcuiqjgB5IHM7dCdGYV
 hzSTbs3grs/nji/F4kdq6L9FURDJ8EY+VE0Cs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aowHZ/Chib5HFLR9En2Y6Cutjd1jA9ZWpfIzHxayofI=;
 b=yo3kOcIc113Uxfm2dJN2dvfFXxhdUZsQ48YGm7An50EX+GsBFknroYXCHA1NxDT7SL
 036kYu/yW3Dowsy528sXbtqAyXuik+ypDl+ktGzPaEuGYIPtSiwHLkl3AVKg6T2q7t3u
 rgvLpEVCsrWxFh5yxWpSUpQsmHTp5xAIdgFe7d6ZoG2dzhp3nZHC5eU19FNQszEJHShe
 fDif4U5Zdx4vHJr8fSpB4FFPRy2WGxnYtIiWa9dymQv1c1/HUIcFJVxXu6vSfrihenr4
 sc3AKM2wzCV5S0YFggKrt3ZGY7VApFvX5pHBeeWz4gLQEdopWUf6ZjF320KNKetYxR/i
 ftpQ==
X-Gm-Message-State: AFqh2koJ0SjVPs6ruXLU83cNGFOMc96K15rDB1KdxZK/0pCKu226OQf6
 lH5qbth3Ox91/TVbipVxiA9/jKlTYazOCLBpLOX2OE0b
X-Received: by 2002:a05:6402:40f:b0:48e:f679:e749 with SMTP id
 q15-20020a056402040f00b0048ef679e749mr549392edv.261.1674008767270; Tue, 17
 Jan 2023 18:26:07 -0800 (PST)
MIME-Version: 1.0
References: <20230117232427.74496-1-peter@pjd.dev>
 <20230117232427.74496-6-peter@pjd.dev>
In-Reply-To: <20230117232427.74496-6-peter@pjd.dev>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 18 Jan 2023 02:25:55 +0000
Message-ID: <CACPK8XeVw5bBr6OPQEf_sU+KFu1FrmH5iVWmSLr_1L-XWT3Tow@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] hw/nvram/eeprom_at24c: Make reset behavior more
 like hardware
To: Peter Delevoryas <peter@pjd.dev>
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, 
 hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=joel.stan@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: zUq4pwvRue/r

On Tue, 17 Jan 2023 at 23:24, Peter Delevoryas <peter@pjd.dev> wrote:
>
> EEPROM's are a form of non-volatile memory. After power-cycling an EEPROM,
> I would expect the I2C state machine to be reset to default values, but I
> wouldn't really expect the memory to change at all.
>
> The current implementation of the at24c EEPROM resets its internal memory on
> reset. This matches the specification in docs/devel/reset.rst:
>
>   Cold reset is supported by every resettable object. In QEMU, it means we reset
>   to the initial state corresponding to the start of QEMU; this might differ
>   from what is a real hardware cold reset. It differs from other resets (like
>   warm or bus resets) which may keep certain parts untouched.
>
> But differs from my intuition. For example, if someone writes some information
> to an EEPROM, then AC power cycles their board, they would expect the EEPROM to
> retain that information. It's very useful to be able to test things like this
> in QEMU as well, to verify software instrumentation like determining the cause
> of a reboot.
>
> Fixes: 5d8424dbd3e8 ("nvram: add AT24Cx i2c eeprom")
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/nvram/eeprom_at24c.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
>
> diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> index f8d751fa278d..5074776bff04 100644
> --- a/hw/nvram/eeprom_at24c.c
> +++ b/hw/nvram/eeprom_at24c.c
> @@ -185,18 +185,6 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
>      }
>
>      ee->mem = g_malloc0(ee->rsize);
> -
> -}
> -
> -static
> -void at24c_eeprom_reset(DeviceState *state)
> -{
> -    EEPROMState *ee = AT24C_EE(state);
> -
> -    ee->changed = false;
> -    ee->cur = 0;
> -    ee->haveaddr = 0;
> -
>      memset(ee->mem, 0, ee->rsize);
>
>      if (ee->init_rom) {
> @@ -214,6 +202,16 @@ void at24c_eeprom_reset(DeviceState *state)
>      }
>  }
>
> +static
> +void at24c_eeprom_reset(DeviceState *state)
> +{
> +    EEPROMState *ee = AT24C_EE(state);
> +
> +    ee->changed = false;
> +    ee->cur = 0;
> +    ee->haveaddr = 0;
> +}
> +
>  static Property at24c_eeprom_props[] = {
>      DEFINE_PROP_UINT32("rom-size", EEPROMState, rsize, 0),
>      DEFINE_PROP_BOOL("writable", EEPROMState, writable, true),
> --
> 2.39.0
>
