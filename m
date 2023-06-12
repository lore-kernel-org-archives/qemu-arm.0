Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp160923ejb;
        Mon, 12 Jun 2023 15:18:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4d1lqYQa9FHmBo/rVZ/mR9TZVY9aaihcKq5enXsuyM7Olvvk4vgxfldkXgC742QPDmufkT
X-Received: by 2002:a1f:4a82:0:b0:45a:f5be:9c18 with SMTP id x124-20020a1f4a82000000b0045af5be9c18mr3308977vka.12.1686608283412;
        Mon, 12 Jun 2023 15:18:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686608283; cv=none;
        d=google.com; s=arc-20160816;
        b=bMwkwHyMYuf7aAIMXPzYmqPGQqaOy4IHM8E1YkCMMek4smZUkNvszMMDp/N/j2XGmI
         Za8ezuKh5unSRAzKu30+4HtTcrS3mvxOb7rf+z007d6Ua9IOVgGJ3DpztueWnOq9jF3p
         e35904h+o8ymwVkieqw+w/ZVYK7XUwIYUqyoaXeXotqby8VsZ5LAE8cbDw/2d0CCgt+v
         k6d7uokn0OEbesddHHPCTIAWp6QcN8D3yHe6ZZZYuNI5RiSUeGTmQo+Ah6ZxOy1ITikR
         LoYrcdku4zlJTXJYKoQudyS+114QflMFFoQMTLg3uuFHs8QeCy3nzAOsGBdE8hDbi7s1
         Ot3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=b0f5TjXlgRyoRtOMkfcy9jl0thKSw7AmRg3kqPelvws=;
        b=jLscffOSr45gZrSRXsC2WDCJefdEXsSuJJWJYm+uQBHljVfWGELjLBFW6O77MwVITc
         ih/6jTMYg6ndmKQ7DXhUROMT4kkm0tBK12hG9KZjTbW2xOSruBP38KHE4nf7x5BGZJ5O
         9npi0b5biQYHovCGDa8b3dzfL7Y/PrWU3yi9WM753Dfd5Kg+yWgyDSZ/P0n1XqXBKdWb
         N+bU0WSRbO2TJ5QxA8h3tYHxHdrP+LqV3uAjIEHmRsjQfHXafNUeEVNoXgCe6Qcg8jT4
         ZDjrGz/4Upw4aPwq4AZBiolTWbWMCxfFQ2L/9XdcdQXLBj5iqp8Zst6AeXwKB9BQ05O4
         SHVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="h522zqq/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eq15-20020ad4596f000000b005e869240425si6845212qvb.300.2023.06.12.15.18.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Jun 2023 15:18:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="h522zqq/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q8pqq-0006ug-5I; Mon, 12 Jun 2023 18:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8pqo-0006tr-0u
 for qemu-arm@nongnu.org; Mon, 12 Jun 2023 18:17:26 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8pqm-0004ra-Di
 for qemu-arm@nongnu.org; Mon, 12 Jun 2023 18:17:25 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9745c5fed21so711626766b.3
 for <qemu-arm@nongnu.org>; Mon, 12 Jun 2023 15:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686608242; x=1689200242;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b0f5TjXlgRyoRtOMkfcy9jl0thKSw7AmRg3kqPelvws=;
 b=h522zqq/PIgZLUffQUjDgZZJ/lrgKZOjiwxvNuveiOJFddL/2sfPW9JJDyrwolSKZR
 V1pbWMpUiKn6da6TV5KlDo/ef9sxHXE51YHEn7YqovbxWQEVbYGV4b+wtVSJ9JIaqp7P
 hl/WEfxjGaqmWb2FPh7lveye96rM1+zRKkgSAD951KarsQMmpL30YMulu/7P9MaZ1zPT
 FC/f0Vdn8n9vFAPDc2SW1OHmxAYMxgrglHBIkxUCAbzlhAGbheYHaeJBssrnsZ4tAfs4
 Us5E/02eDQhGajzAvHbYoIxTyxU8gNFeLtVmUyGsPMZOb5/O+x9pKMBx+aWpNKtGol3o
 6iZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686608242; x=1689200242;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b0f5TjXlgRyoRtOMkfcy9jl0thKSw7AmRg3kqPelvws=;
 b=BLSSL9wXD2aKzH+bSWkc0SvLhPxepVlWVW4lHvyMEeVKHpB/uZQ4CugDuqm3oWswTl
 6z4LnflRyVVPDLx46ptJcgRaAFUjU8WIK2DDKowxLEcVfdXRftWx7dU+EOtDPoy3sX9r
 PMevrQtzWXg0t7DRzlL9/0TbZbi39wblmSswsrpqyvlxf8F5Hp5w2xYf09+ip6H2fkU2
 douglBELMsnKVhdp3z2p8FeTpo13Rb+hT+nGcKBrEdKXzu/OtJghp0V07ofPrYMv63VK
 RXsDRm/7wQt1icK8EQCUwPZ8x9uYO4gxWyhvinDpkfvaHZ68Kg8b/uhSj4ycK4u0mJIt
 48Zg==
X-Gm-Message-State: AC+VfDx71CddrwcSURiRAsx+302LDgmlvQDu80pvmLOZfWw6NxANmeTU
 tT/sumkNfQmFd5t/2gp+2M25Wg==
X-Received: by 2002:a17:907:318d:b0:974:6176:2223 with SMTP id
 xe13-20020a170907318d00b0097461762223mr12259944ejb.13.1686608242167; 
 Mon, 12 Jun 2023 15:17:22 -0700 (PDT)
Received: from [10.10.0.115] ([185.140.244.249])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a170906229600b009745c628bcdsm5752124eja.93.2023.06.12.15.17.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 15:17:21 -0700 (PDT)
Message-ID: <239a543f-6d97-eb14-ba4f-284093fccfba@linaro.org>
Date: Mon, 12 Jun 2023 15:23:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH] imx_serial: set wake bit when we receive a data byte
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230608154129.133169-1-martin@kaiser.cx>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230608154129.133169-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.096, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: CDmXWqqmyOy9

Hi Martin,

On 8/6/23 17:41, Martin Kaiser wrote:
> The linux kernel added a flood check for rx data recently in commmit
> 496a4471b7c3 ("serial: imx: work-around for hardware RX flood"). This
> check uses the wake bit in the uart status register 2. The wake bit
> indicates that the receiver detected a start bit. If the kernel sees a
> number of rx interrupts without the wake bit being set, it treats this as
> spurious data and resets the uart port. imx_serial does never set the
> wake bit and triggers the kernel's flood check.
> 
> This patch adds support for the wake bit. wake is set when we receive a
> new character (it's not set for break events). It seems that wake is
> cleared by the kernel driver, the hardware does not have to clear it
> automatically after data was read.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   hw/char/imx_serial.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
> index ee1375e26d..44125d5f47 100644
> --- a/hw/char/imx_serial.c
> +++ b/hw/char/imx_serial.c
> @@ -321,6 +321,9 @@ static void imx_put_data(void *opaque, uint32_t value)
>   
>   static void imx_receive(void *opaque, const uint8_t *buf, int size)
>   {
> +    IMXSerialState *s = (IMXSerialState *)opaque;
> +
> +    s->usr2 |= USR2_WAKE;
>       imx_put_data(opaque, *buf);
>   }
>   

Shouldn't we mask this bit for interruptions now?

-- >8 --
diff --git a/include/hw/char/imx_serial.h b/include/hw/char/imx_serial.h
index 91c9894ad5..b823f94519 100644
--- a/include/hw/char/imx_serial.h
+++ b/include/hw/char/imx_serial.h
@@ -71,6 +71,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(IMXSerialState, IMX_SERIAL)

  #define UCR4_DREN       BIT(0)    /* Receive Data Ready interrupt 
enable */
  #define UCR4_TCEN       BIT(3)    /* TX complete interrupt enable */
+#define UCR4_WKEN       BIT(7)    /* WAKE interrupt enable */

  #define UTS1_TXEMPTY    (1<<6)
  #define UTS1_RXEMPTY    (1<<5)
diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
index ee1375e26d..c8ec247350 100644
--- a/hw/char/imx_serial.c
+++ b/hw/char/imx_serial.c
@@ -80,7 +80,7 @@ static void imx_update(IMXSerialState *s)
       * TCEN and TXDC are both bit 3
       * RDR and DREN are both bit 0
       */
-    mask |= s->ucr4 & (UCR4_TCEN | UCR4_DREN);
+    mask |= s->ucr4 & (UCR4_WKEN | UCR4_TCEN | UCR4_DREN);

      usr2 = s->usr2 & mask;
---
