Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp223792lfp;
        Fri, 15 Jul 2022 08:39:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tz2SHhVwIefectejqy92gVb1q3QiD8mGa49o1Hg0G/77pLGmtuwMf+HyNsZ5R9Tz1ElL0N
X-Received: by 2002:a05:622a:201:b0:31e:e040:3754 with SMTP id b1-20020a05622a020100b0031ee0403754mr1415885qtx.538.1657899575630;
        Fri, 15 Jul 2022 08:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657899575; cv=none;
        d=google.com; s=arc-20160816;
        b=GArbio/JCSSCQqWcI7Kp/OVpM0jYjqC5vNTAs7YlNdYOrsed7copGklssr/SzLRTUb
         oQhC8sErK23qUvs5YDFAyylA0Np0JcPEiG3c0w+j0b3IQSyHFolow3eprDxbZDYDvNfN
         1YGmp8t9IbrMshfsthKisVHcE1op1ngMsq5HlQJNiyhdST7WHAv+4dWQImcbXnXHN8Zc
         4pLBgOzeoE9VMnVumdf+CxbJW5uOO4fnz6g4dHZYNuuH/fSuNrbb3zOeoNRWS8GNZnWL
         /jq2Xo5AWM32lC9/SHWIvvODEFOINYaJIDLTNSl7V2OgPGT2Nr8nFar70iLGNblRQIMw
         BsFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=bQ28LxSKCjjYmzSLGbZc3jd+smOUB2hYE7Be/XzSJtU=;
        b=tQKXXDT2qG+TNR0ICSbMjFmIOdLvHC3nK+f8zCSbd8nZVSP/xYoAbeaMjVW/r3mo6n
         1ehuTCYbE56BezwRpB36KIFRddUTlqCrSimJa60O8n2/hTGSQ7yEyllr/R0GooGvDl0O
         I++gil0ZdWW9aS3Q83sFeI1lMzSmpEaGDBwiJPGsE8T+C8qbWAntmcBkpiHSnGPDDlZd
         iZRdh6DaTtHOjCmrzbGXtjyUfIoZSMwgNl2vrng+x9ig/fIMRcae9KgErk+5nO7MWyc9
         4vS+YH+VxmPGmQYDyoyfGAXaahMc9arze4L/7yw+lTVPM7g/SDD139npbzZlGXUAvfSM
         F3oQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=owos9V7E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t22-20020a05620a451600b006b2563c8f58si2912312qkp.762.2022.07.15.08.39.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jul 2022 08:39:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=owos9V7E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oCNPj-0003aK-4r
	for alex.bennee@linaro.org; Fri, 15 Jul 2022 11:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCNOf-0001u4-JB
 for qemu-arm@nongnu.org; Fri, 15 Jul 2022 11:38:29 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:37593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCNOe-0002cz-4w
 for qemu-arm@nongnu.org; Fri, 15 Jul 2022 11:38:29 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-31cf1adbf92so50609267b3.4
 for <qemu-arm@nongnu.org>; Fri, 15 Jul 2022 08:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bQ28LxSKCjjYmzSLGbZc3jd+smOUB2hYE7Be/XzSJtU=;
 b=owos9V7E6Xio/bZoTJc5F0nCNV1Akdm6p1kAOHxBCxaMDcJdk8IrVLHh9DU4elj1L3
 nuJ3HZZt+pNn8rFOyLlUznV8JlMOUIhLm2iuHkeCdnBcI1BDsgpweDRPny5Hr9da+0pf
 sXMN5hEmxkgeN3X8uk/xnj7pAZNQG0fHxZnLRGRnOaqv1c4hRn+jXvKHime/0OpjZNJx
 2a4uotOJWe79OMM1vVTkT1ZNk5WV97JPfV46nv4iZLLncalSreXQ3vhMtVCSOPB5GmpO
 l9LmBn4cEEQfweVcJ2M2S5IuRkmBQaZ2RG30mAX24sgnFhBFqB78a4ylgeI1OWZBxrnc
 rN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bQ28LxSKCjjYmzSLGbZc3jd+smOUB2hYE7Be/XzSJtU=;
 b=GeGb/Enp9Ow0h3X97eEkJvmRKvd53HbB+N2Cis3OXwfDp6tBTu9eZaX3joHZDAVQ5k
 JHga0shpkA14/2uggvvfHVIe3hqVVyUExbFckIwraGXXICmGbPKBuL/rqRSzW0aoRmHm
 iEU7a3a25oeH/WzflWw0UDp2MWYIkNcmVKxYrxCpDTGv+45J6qwLGpAeAkiXFNkCpC8G
 3fXaP2b4zd98eNTT1G/iaJaNranhXMWMoKxLganIQ1yP7V9F/tGT7Ew1ZoOkWP06xq/p
 qQ21p0NWUSwlEWGuSVT+CSdJSpqhfSctd4gyq9l/wNU1jovJSZBGe6E4A06znBUQJjcA
 Un1w==
X-Gm-Message-State: AJIora/EdHG/jP6IW827osMkDySHCwhzw7HjtRnX5yakSfrbNdqiU9A/
 fhR7EAMbA8Ya8uZ9CQ+CZZBWg3vbeBfuaQIzVFBWEA==
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr16440026ywb.257.1657899507196; Fri, 15
 Jul 2022 08:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220714182836.89602-1-wuhaotsh@google.com>
 <20220714182836.89602-3-wuhaotsh@google.com>
In-Reply-To: <20220714182836.89602-3-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jul 2022 16:37:48 +0100
Message-ID: <CAFEAcA8G2HxqNXHg-Yo-nSpVikTOmZFvhD1T12kR8L8PftNw4Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] hw/i2c: Read FIFO during RXF_CTL change in NPCM7XX
 SMBus
To: Hao Wu <wuhaotsh@google.com>
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, f4bug@amsat.org, bin.meng@windriver.com, 
 qemu-block@nongnu.org, armbru@redhat.com, thuth@redhat.com, 
 Titus Rwantare <titusr@google.com>, Corey Minyard <cminyard@mvista.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 27LwSWcaQ9S2

On Thu, 14 Jul 2022 at 19:28, Hao Wu <wuhaotsh@google.com> wrote:
>
> Originally we read in from SMBus when RXF_STS is cleared. However,
> the driver clears RXF_STS before setting RXF_CTL, causing the SM bus
> module to read incorrect amount of bytes in FIFO mode when the number
> of bytes read changed. This patch fixes this issue.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Titus Rwantare <titusr@google.com>
> Acked-by: Corey Minyard <cminyard@mvista.com>
> ---
>  hw/i2c/npcm7xx_smbus.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/i2c/npcm7xx_smbus.c b/hw/i2c/npcm7xx_smbus.c
> index f18e311556..1435daea94 100644
> --- a/hw/i2c/npcm7xx_smbus.c
> +++ b/hw/i2c/npcm7xx_smbus.c
> @@ -637,9 +637,6 @@ static void npcm7xx_smbus_write_rxf_sts(NPCM7xxSMBusState *s, uint8_t value)
>  {
>      if (value & NPCM7XX_SMBRXF_STS_RX_THST) {
>          s->rxf_sts &= ~NPCM7XX_SMBRXF_STS_RX_THST;
> -        if (s->status == NPCM7XX_SMBUS_STATUS_RECEIVING) {
> -            npcm7xx_smbus_recv_fifo(s);
> -        }
>      }
>  }
>
> @@ -651,6 +648,9 @@ static void npcm7xx_smbus_write_rxf_ctl(NPCM7xxSMBusState *s, uint8_t value)
>          new_ctl = KEEP_OLD_BIT(s->rxf_ctl, new_ctl, NPCM7XX_SMBRXF_CTL_LAST);
>      }
>      s->rxf_ctl = new_ctl;
> +    if (s->status == NPCM7XX_SMBUS_STATUS_RECEIVING) {
> +        npcm7xx_smbus_recv_fifo(s);
> +    }
>  }

I don't know anything about this hardware, but this looks a bit odd.
Why should we care what order the driver does the register operations
in? Do we really want to read new fifo data regardless of what value
the driver writes to RXF_CTL ? Should the logic actually be "if the
new device register state is <whatever> then read fifo data", and
checked in both places ?

thanks
-- PMM
