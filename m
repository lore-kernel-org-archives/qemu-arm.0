Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp993072lff;
        Mon, 9 Aug 2021 22:20:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy64QyxDf7OETDW0h16QZBXZExNodZjUYGbSu/lsHh4711A0cqumT5f9Vv4o9d+V/gQaMnJ
X-Received: by 2002:a37:40cf:: with SMTP id n198mr26950775qka.180.1628572808374;
        Mon, 09 Aug 2021 22:20:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628572808; cv=none;
        d=google.com; s=arc-20160816;
        b=ApJ3D6rk4zN00JWyspUjGQdko3zHmNqPDDrP5BrSmV9CGQGATxlmNIVlOY8Sl5TSkR
         c6ll3aK98A2UTd6EEkJRYZuUtN91+JZQeb0Lo/JVkXIPnH9lCb1yjz7x/YIEZp7EwaHK
         P20XHFXFy/CYI+6BgfVwEjIL0gUkRMdxh79MrAezytxUfiAHu6asYAr3ZxvtHYQ/91J/
         TyYCvrT5lqD6KRyWnOFjJjqHX1lEdwM6MD/fCTygEQ6uzVyAwZzCAuKwGvyEJzKd7IjS
         jyVZI1s8WL6+s4yc1zODXdZ98cVJtNo2j8goebtC1+9ydljvfB1OAEV0iKIJC9RFmxny
         4n2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=W+Ek/FQM1vnO/sLlgjELhxHO6P+5qop+j3W5LXxENUE=;
        b=tQb8XSPnnUO7GvzJN4LhpecPLViDlzrIZfrdHT/lX4XAFtvY3kntKEmfXLKDaYa9+4
         qO8wLprD4K5b3r3GidYonYvxQGxCOJH4pllCG4NGJz0kGzWg4jE8nGU915mu7AlCihzv
         5o3953RDESzGvKjRTF4UNP6FP/lNDZqObIlnGxJLF6UBuJQLIisrZHG5vSHCN5+NEKPi
         8TglWVODQ5uEZ9Qrbl6AjbpOKkpRGoKyZ3C658EGtCasItSw3QM9zU4KaNj9ct22eEdg
         TyVnjgx/x0kzog2Iy2EP3ctkwyHyoHMZGaBnVw+vPRT0OKhE9UzWlVON0ydpJ6m/ATyo
         RnWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dyZv1VR2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m17si13105783qkp.184.2021.08.09.22.20.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Aug 2021 22:20:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dyZv1VR2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mDKBL-0001Xy-L7
	for alex.bennee@linaro.org; Tue, 10 Aug 2021 01:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mDKBB-0001V1-3S; Tue, 10 Aug 2021 01:19:57 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:45003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mDKB9-0004qL-8c; Tue, 10 Aug 2021 01:19:56 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 d131-20020a1c1d890000b02902516717f562so1633062wmd.3; 
 Mon, 09 Aug 2021 22:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W+Ek/FQM1vnO/sLlgjELhxHO6P+5qop+j3W5LXxENUE=;
 b=dyZv1VR2yymH8YTar4/0N1ssWsBC/jl9xRNA6Uk1DBeWMhyfMnqbpUIWlHoa0y+lsW
 d4PUoDd5kZ5AwU1/dAo9tpqgIkkNYnUjFKzvmd5pBpDC665nDxOPhmR3Lh/lfWVqWnlN
 NlbDban/6Ly2fe2K966J/qBBl3hN4u7BgsZUQzvkW8nG7mWx5ZN2RTj2otzVj9DcHDb+
 L6uMsMwkQdWSdk/nuSbxoZV+cv1MLvSOElDqmowngNcOYD8mO+WEsofW/DESFN2faViX
 d7ZxkRrnrcaxEvMJS2g9dGnyG3+TCL0YLZOsTjuzNdn8RajIXfl9AAv0KoJ3V+SdCRH+
 RxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W+Ek/FQM1vnO/sLlgjELhxHO6P+5qop+j3W5LXxENUE=;
 b=h6G/tOtABb6PpXshdRXVFGXR2iCH31hTiaaqipcyzqjBowpOZJnyS0rtpM1k3jpEfu
 1RgC+2XZ1V8Wx1uZhvw7DCAAC9M/Rb1uSDnRXVQvMForttpxLo5KtD7BrlmOqIBL6lIv
 v73LsFmiRG/tbjXI6+m67UGtixW40SpME6LUzh2U4NeiR8JPU1tOUapELqWnEf/lj4vt
 cSICysahOJbyFvNRYF6AWLFvoYSg0yD7CY7+mSAcS6tozIcMMQ3DZgUz5y1sIQeZ8bbM
 G5MLwROgWtlPvTb7VQIdbR6TrcTQzJDwf/vpZpFCvhkMRQF8Y1t/B6HWE2kyqxW7/Tzt
 At1A==
X-Gm-Message-State: AOAM5304t/SM5apZlLLoMhxyEKGT1ZjELkCRbQ+o7qtvn0hnXR+Tsykd
 db/3j0U9hQHY67dKSTOZR1A=
X-Received: by 2002:a05:600c:3b15:: with SMTP id
 m21mr20474630wms.99.1628572793124; 
 Mon, 09 Aug 2021 22:19:53 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id t1sm1485328wma.25.2021.08.09.22.19.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 22:19:52 -0700 (PDT)
Subject: Re: [PATCH] fsl-imx6ul: add SAI1/2/3 and ASRC as unimplemented devices
To: Guenter Roeck <linux@roeck-us.net>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210810041059.553384-1-linux@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ddf1935f-bcbb-aedd-4d8c-8f7a2522f1ea@amsat.org>
Date: Tue, 10 Aug 2021 07:19:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810041059.553384-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zx7FlSzmeebr

Hi Guenter,

On 8/10/21 6:10 AM, Guenter Roeck wrote:
> Define SAI1/2/3 and ASRC as unimplemented devices to avoid random
> Linux kernel crashes.

Relevant dmesg output could be useful.

> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/arm/fsl-imx6ul.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
> index e0128d7316..48b60eb3ce 100644
> --- a/hw/arm/fsl-imx6ul.c
> +++ b/hw/arm/fsl-imx6ul.c
> @@ -534,6 +534,13 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
>       */
>      create_unimplemented_device("sdma", FSL_IMX6UL_SDMA_ADDR, 0x4000);
>  
> +    /*
> +     * SAI

"Audio SSI (Synchronous Serial Interface)"

> +     */
> +    create_unimplemented_device("sai1", FSL_IMX6UL_SAI1_ADDR, 0x4000);
> +    create_unimplemented_device("sai2", FSL_IMX6UL_SAI2_ADDR, 0x4000);
> +    create_unimplemented_device("sai3", FSL_IMX6UL_SAI3_ADDR, 0x4000);

Hmm I see these named SSI[123] in the datasheet.

  The Synchronous Serial Interface (SSI) is a full-duplex serial
  port that allows communication with external devices using a
  variety of serial protocols. The SSI supports a wide variety of
  protocols (SSI normal, SSI network, I2S, and AC-97), bit depths
  (up to 24 bits per word), and clock/frame sync options.

  The three SSIs may support three audio streams (possibly at
  different sample rates) simultaneously. SSI1, SSI2 and SSI3 are
  located on the Shared Peripheral Bus. Since the SDMA can directly
  access SSI1...SSI3 (being on the Shared Peripheral Bus), they can
  be used for high-bandwidth data transfers in order to optimize
  bus bandwidth consumption.

Since QEMU models SPI devices in hw/ssi/, having the devices named
"sai*" is OK.

> +
>      /*
>       * PWM
>       */
> @@ -542,6 +549,11 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
>      create_unimplemented_device("pwm3", FSL_IMX6UL_PWM3_ADDR, 0x4000);
>      create_unimplemented_device("pwm4", FSL_IMX6UL_PWM4_ADDR, 0x4000);
>  
> +    /*
> +     * ASRC

"Audio ASRC (asynchronous sample rate converter)"

Preferably updating the descriptions:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +     */
> +    create_unimplemented_device("asrc", FSL_IMX6UL_ASRC_ADDR, 0x4000);
> +
>      /*
>       * CAN
>       */
> 

