Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp363600lfb;
        Thu, 31 Mar 2022 13:46:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUFmD+PaAd6wlQW2Im/qzsTHnrun4Pe/RCC1VoQprF2iJHFioFgioze9jAT52iQW6WtC5n
X-Received: by 2002:a25:6608:0:b0:633:ab22:55f0 with SMTP id a8-20020a256608000000b00633ab2255f0mr5942924ybc.323.1648759599104;
        Thu, 31 Mar 2022 13:46:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648759599; cv=none;
        d=google.com; s=arc-20160816;
        b=lUp03kkd7FHlzw71wxdbXV4lpeHCPYcRzItoMo5fU7SwF2PWm6RBF1a2z/RlXrVOpY
         OHydNIGHaeW0euL6QkYjd1CrCJFWdqOz/en0zqEvq+MOgkLK/kMMaPWAtMCwNDA24toa
         Dxs+TOvDUXgOc2K5fZfYsaj5uq2d93vR/Mt37RAqMLlJ40woj9MubSh1M9C0KzPnBMeC
         lwGsDl+jKs2n9A3L978I/h8Nl6KSzVhVdLPU2NxuqjU4Vit1WqYpc74Ae8qYiWZekflU
         4F+mZsoSrn42JYkw/fjb4hTR4fOrCm799QiDF+6MoFshmzturUGH2HzA39FXH4LoF+Ji
         6fLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=pgLuxk/hWJgSZSHSCQLNUoqnt8YBtdp6eK3oOlKZtjw=;
        b=HmMxd2DrjmuvGcrjqN0S/W8/Ayu60/CArbTti2w8Tmyj2YnXzlbs7f0jyUSbTZrqne
         A58dWvTX6JO5P55m6b880AogjyfFTD7TGJgK8Yn5cO8jXeohtvG5tHcq/pTZZaXliwXN
         sutd+jMYDMvNrW6wj9VdFyT6nTYww5VV0XpcKl4P0u3UBb12AteKJNsEvTtIC3gzjVyW
         Fg6fuv0DuOJxNc+zoq3ykiCM3MWmGAA2GKPmabpzbAR3kXRc+WpuVOAjFfcHgnFjMyX3
         xcAbfcTsQZIdmWOSSP9/TE2ZqagFlcuLv6bptWSf5xUv6XH09Lyn7aEo6L0QR5gj/L4i
         GKHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="kcS/4aPE";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p22-20020a257416000000b00633994044c5si653002ybc.303.2022.03.31.13.46.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Mar 2022 13:46:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="kcS/4aPE";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1na1gk-0007jX-Ek
	for alex.bennee@linaro.org; Thu, 31 Mar 2022 16:46:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1na1eX-000695-JL; Thu, 31 Mar 2022 16:44:21 -0400
Received: from [2607:f8b0:4864:20::429] (port=34399
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1na1eV-0007NY-78; Thu, 31 Mar 2022 16:44:21 -0400
Received: by mail-pf1-x429.google.com with SMTP id h19so718631pfv.1;
 Thu, 31 Mar 2022 13:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pgLuxk/hWJgSZSHSCQLNUoqnt8YBtdp6eK3oOlKZtjw=;
 b=kcS/4aPEOgybLZ9FJlWhdtQTtaA29OLqQamtv4TtMANsqbAB8SzDCt0WuQ1tqU1QBY
 T/owuFuXt4eeSSHFHv9ODNB6KrZBt2Y8TvnO6aqDFadk/OSJxBTK7JTnanncBTAAL9hV
 O977B+q5m0zU6oK0dfRnRJI6+Jl4vBn9hL9vgVkbE2NmFQxbrpmm/QQaY8cEQ1gieZQj
 ZT9GO8kHsj3ULUMb+Puzpwd+GtfyFCGWRzt5qeNnUuzeRBQsHFsTo7sJEglyBWZK4+dn
 hrA7jP8Grr/cS5o8mjxjO4JiHzAKjgPkb7KRb+fO+M7qO4ob284PiuB2r0D7/MyQT40q
 CyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pgLuxk/hWJgSZSHSCQLNUoqnt8YBtdp6eK3oOlKZtjw=;
 b=ekSMXUdQcaT6J+t9EsNmvVYblDWSmF4jsLAgAmLnE9/ixaXpR3ulAM5HH/KtGU+DWJ
 cR22dh8krD+zN4wjklWydoSyD/eusxOutUxMTeSr89pcth07Cz+JJDElXOUjHNLCEDGE
 7damuiUL16mXCzV/+L8tBOifGxFMBXamdpvOwiIrjoOF5of3pb+w9k48Ah8iOD74Q3Uv
 HnHi6C1X8HEDh5JzUADDNqi03el5cBsfjY8lqtztuQtOCdCI9r74Q46+Z/6a0fZkSjtx
 ecGbPGYQb4JOKj+Bl11uvAT8FtqI4f+wHGTGI3upLH7OxRtgCBG352m2fHvgZDgQkgPT
 Pwzg==
X-Gm-Message-State: AOAM532LSmqONzbz5PQ4yQME6UDoNdXt1aFFfjiGMCOXwOZXusjGiByy
 IJy7uz7g5eUuD7eC2ft6KQc=
X-Received: by 2002:aa7:82d9:0:b0:4fa:2c7f:41e with SMTP id
 f25-20020aa782d9000000b004fa2c7f041emr41185917pfn.1.1648759457505; 
 Thu, 31 Mar 2022 13:44:17 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:f49c:562:b5cb:b2b5?
 ([2600:70ff:f07f:0:f49c:562:b5cb:b2b5])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a056a00170d00b004fb1450229bsm383575pfc.16.2022.03.31.13.44.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 13:44:16 -0700 (PDT)
Message-ID: <7300ef1f-8702-733d-2a50-4253345fde45@gmail.com>
Date: Thu, 31 Mar 2022 22:44:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 3/4] hw/i2c: add slave mode for aspeed_i2c
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20220331165737.1073520-1-its@irrelevant.dk>
 <20220331165737.1073520-4-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220331165737.1073520-4-its@irrelevant.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Arun Kumar Kashinath Agasar <arun.kka@samsung.com>,
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 Klaus Jensen <k.jensen@samsung.com>, Jeremy Kerr <jk@ozlabs.org>,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Matt Johnston <matt@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /Vx5j+Gvo7tM

On 31/3/22 18:57, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Add slave mode functionality for the Aspeed I2C controller. This is
> implemented by creating an Aspeed I2C Slave device that attaches to the
> bus.
> 
> This i2c slave device only implements the asynchronous version of
> i2c_send() and the event callback.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>   hw/i2c/aspeed_i2c.c         | 95 +++++++++++++++++++++++++++++++++----
>   hw/i2c/trace-events         |  2 +-
>   hw/misc/meson.build         |  2 +
>   include/hw/i2c/aspeed_i2c.h |  8 ++++
>   4 files changed, 97 insertions(+), 10 deletions(-)

> @@ -558,14 +565,19 @@ static void aspeed_i2c_bus_write(void *opaque, hwaddr offset,
>               bus->controller->intr_status &= ~(1 << bus->id);
>               qemu_irq_lower(aic->bus_get_irq(bus));
>           }
> -        if (handle_rx && (bus->cmd & (I2CD_M_RX_CMD | I2CD_M_S_RX_CMD_LAST))) {
> -            aspeed_i2c_handle_rx_cmd(bus);
> -            aspeed_i2c_bus_raise_interrupt(bus);
> +
> +        if (handle_rx) {
> +            if (bus->cmd & (I2CD_M_RX_CMD | I2CD_M_S_RX_CMD_LAST)) {
> +                aspeed_i2c_handle_rx_cmd(bus);
> +                aspeed_i2c_bus_raise_interrupt(bus);

Eventually split this hunk into a separate patch to have better readability.

> +            }
>           }

> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index 6fb69612e064..c1c1abea41dd 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -122,6 +122,8 @@ softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_rng.c'))
>   
>   softmmu_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_ahb_apb_pnp.c'))
>   
> +softmmu_ss.add(when: 'CONFIG_I2C', if_true: files('i2c-echo.c'))

This change belongs to the next patch.
