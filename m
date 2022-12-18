Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3026943ejb;
        Sun, 18 Dec 2022 13:55:55 -0800 (PST)
X-Google-Smtp-Source: AA0mqf79/EEi0zbY0airkaRssv3FEf3O2RbTAZ1h0+hlTBnqSNq7WPzHST9yLwJlgQHxJQJFCiEf
X-Received: by 2002:a0c:e585:0:b0:4df:5465:b289 with SMTP id t5-20020a0ce585000000b004df5465b289mr36982216qvm.21.1671400555529;
        Sun, 18 Dec 2022 13:55:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671400555; cv=none;
        d=google.com; s=arc-20160816;
        b=wrCJA6/fHQeSaG3MvXnsl9PPMLLahtMJBJCVJbAuBJgISWt6PRYa1rt0+oufpKLkLM
         4mPJRzhMobdhnbg/CwAotHC/v1IqdjwmdLJtSVxKP8PIjq4ZgU3fDskctDHgW/AAWfcw
         Tmy2b1nZCyS6i12yHc/YDVo1sIAt2W8cOlXpP+i6ztf1zjoix6wUuWZHdZMCTkrnGnD1
         GQZiTd5VCX1TBPLt4nzJvJNUmHvMkZgUrMYnmR8YZ1uQlfOCdwD7JcXHlPY0MxFlq+y6
         thR+XVdDRA/0yQKklP1Ab/ui/98Y2AmIFVK1vHgW4AyHPf1Tc9wDuBkaXYJ4mtfptKM5
         5HhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=gQAsn3ZOCdJ0wukywg3wvkm1clR5BI06sXUCBzj7Ce4=;
        b=ZiniqDmI8Cuh7UKFTDMTz7w/vYnY/TW8xUQGXD1yLsGfHCqJTupIwrf1qkG6/kqI+b
         VNayQ+Y5biF1MHPT67q84+DQkfkXJHYgbO2yWODMnZmMVbudedRxqkCoYBAe82uMC9El
         GjlJ2PJQ2MyrGyaG+be1q9fVUTxuUV/aL1zMRGuMKdLgfnaYuoSJhrR9gwpwcFovckPI
         tEppyILEke0jFAqbd0+J2CqGr94pOkUL39NWnmThNtT2Hp6JugzZWB02hndFsMEmXawd
         LZZTSHWEPPAPgwOsuOvj0rOGuSPChCrD4L5SW40R4x5b1pC/ojbx2p+xK6bDGXYibUFI
         uv4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BW9WV9RE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hf4-20020a0562140e8400b004c6fde7f98csi3484752qvb.434.2022.12.18.13.55.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Dec 2022 13:55:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BW9WV9RE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p71d2-000822-Aj; Sun, 18 Dec 2022 16:55:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p71d0-0007z6-2a
 for qemu-arm@nongnu.org; Sun, 18 Dec 2022 16:55:26 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p71cw-000163-Ve
 for qemu-arm@nongnu.org; Sun, 18 Dec 2022 16:55:25 -0500
Received: by mail-ej1-x634.google.com with SMTP id ud5so17576917ejc.4
 for <qemu-arm@nongnu.org>; Sun, 18 Dec 2022 13:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gQAsn3ZOCdJ0wukywg3wvkm1clR5BI06sXUCBzj7Ce4=;
 b=BW9WV9REQGLW4ppfMh8VRdzMvP1rt0mxHePdSS6O9OPzkb6xu2NjlUfJrEahjyzg1p
 6q1K/R9SaQKibDep8mrdtPqiVEAskGYmPRnJg53lHYo+j/j+7mCgJr3aJ6vHPkBY8V7l
 CVI6YOE7I2d6CxL5KZBEDHciiQAqMz9YJAKLLRw16qBzTpeLe8U1OKPlQTZ498/ClN/b
 XQZKU8Nv/nucDA6rmNhRazXC9mHJKLos26RqgkOzYq1dOdJ8tz2H2psWFEFTC+PyMKhi
 mUestIWSf8D7f+hjtUxg0Ylc2kuMbWwQgN2u0lYnjDJP4c0hSDfu2toP4OskLpFJwzoS
 SaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gQAsn3ZOCdJ0wukywg3wvkm1clR5BI06sXUCBzj7Ce4=;
 b=PH3e11s4RCjrr4FsLw+lHVOM/kuIgNFBKKnQhDukK/SB6xe0+BEHV6nX9zMrLdfX9A
 lUbZyaiuLg9IlZOLamwJo/DSoIoMiQ8V6aQPw2+NHtIDBZ4mZnRVOITjNE6uB5ucWpLI
 YSABEtV9f9nM8odNd3K0CrTHjVMUtBmiCLFb0I/9fVeXcZ8FyuwQ8rXlXICXlYXN05MC
 7E6kKh0hARLVoACRSnKZfPuH0uBylVzOiB0z+dv7fWsm8xGYQXmEsDXUkAREKnYsMkKK
 YeD/zZrcuX6R5B+cRrpeRq/gAfCuwKRvs8F5BK0X0hmUDfUMhZj8I0lWqtF8JB7zaLhd
 t56A==
X-Gm-Message-State: ANoB5pkBHcIPvnjmX3CG6EvkxhLxHJrKkae8pQ9Pe5p9BQ+XQ4xZwrGs
 EyPVgzGPKl4gOXwwZ8m9rvrAMg==
X-Received: by 2002:a17:907:1de3:b0:7c0:e5dd:6e5f with SMTP id
 og35-20020a1709071de300b007c0e5dd6e5fmr36922391ejc.4.1671400521313; 
 Sun, 18 Dec 2022 13:55:21 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 rs13-20020a170907036d00b0077a1dd3e7b7sm3590150ejb.102.2022.12.18.13.55.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 13:55:20 -0800 (PST)
Message-ID: <42ea0781-b963-8dff-6c1f-f5d342f38618@linaro.org>
Date: Sun, 18 Dec 2022 22:55:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 5/7] hw/arm: Add AXP-209 to Cubieboard
Content-Language: en-US
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
References: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
 <20221218211918.3592-6-strahinja.p.jankovic@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221218211918.3592-6-strahinja.p.jankovic@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: wepAhvPEhiUg

On 18/12/22 22:19, Strahinja Jankovic wrote:
> SPL Boot for Cubieboard expects AXP-209 connected to I2C0 bus.
> 
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> ---
>   hw/arm/cubieboard.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
> index 5e3372a3c7..afc7980414 100644
> --- a/hw/arm/cubieboard.c
> +++ b/hw/arm/cubieboard.c
> @@ -20,6 +20,7 @@
>   #include "hw/boards.h"
>   #include "hw/qdev-properties.h"
>   #include "hw/arm/allwinner-a10.h"
> +#include "hw/i2c/i2c.h"
>   
>   static struct arm_boot_info cubieboard_binfo = {
>       .loader_start = AW_A10_SDRAM_BASE,
> @@ -34,6 +35,7 @@ static void cubieboard_init(MachineState *machine)
>       BlockBackend *blk;
>       BusState *bus;
>       DeviceState *carddev;
> +    I2CBus *i2c;
>   
>       /* BIOS is not supported by this board */
>       if (machine->firmware) {
> @@ -80,6 +82,10 @@ static void cubieboard_init(MachineState *machine)
>           exit(1);
>       }
>   
> +    /* Connect AXP 209 */
> +    i2c = (I2CBus *)qdev_get_child_bus(DEVICE(&a10->i2c0), "i2c");

Preferably using I2C_BUS() instead of the cast:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +    i2c_slave_create_simple(i2c, "allwinner.axp209", 0x34);
> +
>       /* Retrieve SD bus */
>       di = drive_get(IF_SD, 0, 0);
>       blk = di ? blk_by_legacy_dinfo(di) : NULL;

