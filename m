Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp408080lfg;
        Fri, 9 Jul 2021 00:31:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHVHf35Xq3kj0QVO+vjcBgGeD79VqMJzME3RJyIv6njPNEDuB4jilM0LbAbifWt6XKVUOc
X-Received: by 2002:a05:6402:5212:: with SMTP id s18mr10547950edd.370.1625815904917;
        Fri, 09 Jul 2021 00:31:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625815904; cv=none;
        d=google.com; s=arc-20160816;
        b=ZWnayj7xpy5s4bVXuJebt08lDZnYsKXRk94xyRhgMVxNEFuhun+x+WmnBXCXSv2MW8
         lIgl0xM3AB2amLK9VSPslJQO2ZilWr3173n2Jj6xb5RffqeglY9+sUasTaDq030hbBE8
         RXzrvHII+Muy/tjTOOcQR/knsQYlBywxheXhBTtPQKX56imAKNa1j52ByEtZ3kaJDvua
         gfCTpnWwCcTp+urZFXSxkXzdH/jlcMkpWATo+D7T4aqGe7aCqGryaqBI2jZpMVCywHKp
         v7dFgML8+l8hZIsgupeA6sV/pjIyrfZKoQntoZFi30xQYDL70AHFOb5DtoLpkH/GjGuG
         nwbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=LedikUQXLlSQ3Ni+3siFiEH08l/ftZdwtjHvkBfF4QU=;
        b=vVOT3b6gniEWjAEri3QTPHznD0fXNiKFpIQHTeKhwG/jUkI/zyQJnHSAUnLvtjXUAj
         83JCpF7Ny3yzuB006G3k8QUZ1/fuGoYpWFoFGK8qoy54WCQd++n0LPsI+XXKVYgCl9Vn
         JWpj/BqQLgJekc2J28A17zbjmEUgsHYRi27rzyEQ5lutE5vO29eNnSSsr+3+keb93CDP
         OL+aLzw32a3tslCUgmcLSWg3fIBHDWAwH+1w9V/Wy5ukG//Y3JeCw0D2EmKQwUc+MV6D
         gkQWgQg/keYRBoS5pu3fvhEuIKfSAIr8saYE/dPAPh90kvYEJwdOG2XmxOpoZ4L3Zu9B
         3S7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=i79VvBNx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y19si4042404edi.515.2021.07.09.00.31.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jul 2021 00:31:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=i79VvBNx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1kz9-0000je-Up
	for alex.bennee@linaro.org; Fri, 09 Jul 2021 03:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1kwt-0006e0-PK; Fri, 09 Jul 2021 03:29:23 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1kws-00062y-AD; Fri, 09 Jul 2021 03:29:23 -0400
Received: by mail-wr1-x42f.google.com with SMTP id g16so897863wrw.5;
 Fri, 09 Jul 2021 00:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LedikUQXLlSQ3Ni+3siFiEH08l/ftZdwtjHvkBfF4QU=;
 b=i79VvBNxuvXfvyN7URTPUubRuRxTt7h5QT1prrKvFfuhgpMoMPu00KEegrnd90VYPV
 TGzDP/LgvHi6OOAzgW5+wJnBh2fpVi7IqylWYpFWuiTHzAQt6wqr3BqlOTAN8K3BzrSb
 jexVcb877AvR6XnnxKTuZDZ/eCy1AwRH/ZeW13Q8D2d+scWJgDZ41fZy9r4b0UHs/rtV
 jUHI0SHc5FME2YXKQAv1pj0p5eu2JEExpsLGd8yeAjxC+mf/k+KvrGR0A5ZJqOK2je/n
 p4CYO0TwAEzBnDNUhKix/4xDe75ofbXp2fmqeUU/ghONs93TG00lzj/vJcyt3nFovYEX
 kGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LedikUQXLlSQ3Ni+3siFiEH08l/ftZdwtjHvkBfF4QU=;
 b=COuvU0NWiiHHgIXcQtm57EUvFCKCJ5LE096An72A87yQm1upw1gp+HHbBi791P1MuP
 50RnYePIFUsygaHACS86RQmR7KeBA4IOFKLNb5IbDKROrEz6aXebOCTaWrHAuFWZQZ2F
 rUGzriolzvm4LGz16R1AwOR9dlkGGO09vGj2I5krtxBuOK29Aqn39GwV5aCwMSjHhV/A
 sVi3uz+VF3mneWMpTVEt96t8Xs+5uGTQXO2LRQ+aKxfOY9aMoRVmFwNoV/AnnfQLtHFd
 WxmeAfUdGhPTD3hoxAPGEjVKYBIMzMO6a5dujNTR/hNWnLznJHbGWwRkkfRUD5LeDOuq
 7Prg==
X-Gm-Message-State: AOAM533XuraEmF5MeEcWvfrSPG/kpJD11GFH3pMr6/647QYDMCJNHNKY
 wMZTJD6kQTY/SWfY8usjasE=
X-Received: by 2002:a5d:46cb:: with SMTP id g11mr21324857wrs.192.1625815760623; 
 Fri, 09 Jul 2021 00:29:20 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id q5sm3996392wmc.0.2021.07.09.00.29.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 00:29:20 -0700 (PDT)
Subject: Re: [PATCH 2/2] watchdog: aspeed: Fix sequential control writes
To: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org
References: <20210709053107.1829304-1-andrew@aj.id.au>
 <20210709053107.1829304-3-andrew@aj.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d222c518-13de-f4c5-3eb6-2045d7a26fba@amsat.org>
Date: Fri, 9 Jul 2021 09:29:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709053107.1829304-3-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, clg@kaod.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Nd2tzWUe3NNW

On 7/9/21 7:31 AM, Andrew Jeffery wrote:
> The logic in the handling for the control register required toggling the
> enable state for writes to stick. Rework the condition chain to allow
> sequential writes that do not update the enable state.
> 
> Fixes: 854123bf8d4b ("wdt: Add Aspeed watchdog device model")
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  hw/watchdog/wdt_aspeed.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index faa3d35fdf21..69c37af9a6e9 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -166,6 +166,8 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
>          } else if (!enable && aspeed_wdt_is_enabled(s)) {
>              s->regs[WDT_CTRL] = data;
>              timer_del(s->timer);
> +        } else {
> +            s->regs[WDT_CTRL] = data;

What about simplifying by moving here:

               if (!enable && aspeed_wdt_is_enabled(s)) {
                   timer_del(s->timer);
               }

>          }
>          break;
>      case WDT_RESET_WIDTH:
> 

