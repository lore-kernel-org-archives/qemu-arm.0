Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp634284ejb;
        Wed, 2 Aug 2023 14:32:58 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHk0b4sVVh3OL2xHXBP+6bDi2LMh12NyQY3l2Ty48ur5xmhgHlczKOKC6ErHpCo3Kcny2J/
X-Received: by 2002:a67:e891:0:b0:447:b88e:ca61 with SMTP id x17-20020a67e891000000b00447b88eca61mr2738725vsn.10.1691011977950;
        Wed, 02 Aug 2023 14:32:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691011977; cv=none;
        d=google.com; s=arc-20160816;
        b=GI0IpiCuxcwDcM7atvcaskWti+a6JFm7DJrDcF4/uA1gPpz8+gOFROn71xKAWdO0f8
         MOIkf1y2T7C6A499G2SHWYEgnxxNkdEZjmZaqNGS1kU1eHwAn7Kv31yF7JgLx1cHxhlj
         BMcZfEcXU0lKZvDN9nPrvZLP6ITICAidtqzV+eQbN1m9+l8y3Qvx3Ana7owbOOJqpnQW
         40TX9bcqq7gQuyIdNQV2BchXQGNZROE7+pYdE9qLOg796HXPDSRb5rHJbGNFnKcWV9MB
         xipT/TUJSluPKY3vptbDGDFQ5J25nvWQpsWAIENBN52YC+r39km8c16YAVrzouRYla2e
         +2Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=IYoCKeQ8x7siip3i9rK4jjWLNzifaWvfhs7yTZyvE+8=;
        fh=UhaWr4zIl5c8v1+3jSy6xCtVeBIHKP0KDuO5vLuhDdI=;
        b=1J2/J0JvPe3xMwKlqyi6Q9rw8HoiEwnA4xSVk8nUWua2DKMIG7Us22ovu9NASgZYID
         BcG1EOU2vJTRY40cJzBCUnmapvRpIWJVvW2XOajSpOgiPw2KGooD64khQ9DkaCOerQNl
         KOodIAhh150uEf2W36dIrUB8vHxbonQ64PLO+f/wn3ZD9TGNWnxuu7kQQGTR5RFVav6N
         O3MEtfTdB/oNMza4bpF7LUU0u1lPso7ZjXV13qhss0nLuOVjcJNknK0Q2LYdigQhdq04
         g53hLukXEPSFGh3m4aXPzlebT2CV+Kdg8uMAUI7itL2PqxpONZEpBtVsKuqt8g1XrQWN
         bpEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CCQ1FPkw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k12-20020a0cf28c000000b006236b1ac5c3si7574702qvl.265.2023.08.02.14.32.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Aug 2023 14:32:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CCQ1FPkw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRJSe-0002g4-Fa; Wed, 02 Aug 2023 17:32:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qRJSX-0002fG-R8
 for qemu-arm@nongnu.org; Wed, 02 Aug 2023 17:32:45 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qRJSS-0005d3-2Q
 for qemu-arm@nongnu.org; Wed, 02 Aug 2023 17:32:44 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-313e742a787so186842f8f.1
 for <qemu-arm@nongnu.org>; Wed, 02 Aug 2023 14:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691011956; x=1691616756;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IYoCKeQ8x7siip3i9rK4jjWLNzifaWvfhs7yTZyvE+8=;
 b=CCQ1FPkwDWoxkv2wi1ldd8SHM3XAM3IxIkeV69G4XdACtJyQIYs5wma9RT898gQDBa
 gYqBQq7FK68ILIudl1LNcWIvUrT28LJBeyoPujcszgTgxLR+PFXr3nmJBhQzj5qwqpMl
 UwU5ZPFvdt2EKzADIIMWuuDlNlm6oakTNkuCuiK2n0T163hB7OqVr4fwpdw+gU9881Xh
 /h7vjZeRFKWt3whYYScdINexEC2ttQ9MC2q4VkZ+ZpOCgxJkI2scZppxcqVR7XG6E1C3
 6NNWBUwiednaCtQWFDpnb6cIciYBgTiGBRy/ZAeT4nV9xNzgVFUkKyk6dduTtLiWWhnx
 70ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691011956; x=1691616756;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IYoCKeQ8x7siip3i9rK4jjWLNzifaWvfhs7yTZyvE+8=;
 b=QR2xaO4j+k7BJsMYqzI6/7681p0hZfs6IHNfrEOeuz3jA7cvBCfVK/29qn9SdcamLM
 iz9XVZtW+lUjIB84N7eWM5T3KF2hHY6CFbPixhRlyuwzPEe5ZG3x3Yjq5C9mRWf13Brl
 qdlTC5hY+XmRg+oPM9MqSGkSO/qsug6T/sHPJmnlF4ymKtFSVnaknfe3Cvl8WvhaLwg5
 Z07y175Ibw9Vcu3902QOPocM7CP1Qb61WJmWqpgwTjeAi6nE/Bse6Vc+HSlLx6v2BAI7
 uj+ERdDP6WA1wy8vlijVdXdq/qJAlgBQ0WZudxakZkSxLdmdTzv8MmAt4y1hsCUgyOzd
 q98w==
X-Gm-Message-State: ABy/qLagdSRPw1qTZBts1sdV3CMesenz9S5DtARbnIgNnlMtpx8Z5sSc
 HR01hS+cTxy0DnP9IblDwGHjiagc2YwtUdgwLiQ=
X-Received: by 2002:adf:e7cb:0:b0:317:59a6:6f68 with SMTP id
 e11-20020adfe7cb000000b0031759a66f68mr6478600wrn.0.1691011956677; 
 Wed, 02 Aug 2023 14:32:36 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.158.229])
 by smtp.gmail.com with ESMTPSA id
 f18-20020adff992000000b003176eab8868sm20018316wrr.82.2023.08.02.14.32.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 14:32:36 -0700 (PDT)
Message-ID: <14c9fd15-6925-79e4-3120-87e302de0e1c@linaro.org>
Date: Wed, 2 Aug 2023 23:32:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/5] Refactor i.MX6UL processor code
Content-Language: en-US
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <cover.1691010283.git.jcd@tribudubois.net>
 <649a1160b36c58ea89daf02a11b12f2dff164fee.1691010283.git.jcd@tribudubois.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <649a1160b36c58ea89daf02a11b12f2dff164fee.1691010283.git.jcd@tribudubois.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: asjqemYF216R

Hi Jean-Christophe,

On 2/8/23 23:08, Jean-Christophe Dubois wrote:
> * Add Addr and size definition for all i.MX6UL devices in i.MX6UL header file.

I'm OK with your patch, but some addr/size are added, while other
are changed. It is hard to review. Having one patch for changes
and another for additions would help review.

> * Use those newly defined named constants whenever possible.
> * Standardize the way we init a familly of unimplemented devices
>    - SAI
>    - PWM (add missing PWM instances)
>    - CAN
> * Add/rework few comments
> 
> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
> ---
>   hw/arm/fsl-imx6ul.c         | 149 +++++++++++++++++++++++------------
>   include/hw/arm/fsl-imx6ul.h | 150 +++++++++++++++++++++++++++++++++---
>   2 files changed, 240 insertions(+), 59 deletions(-)


> diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
> index 9ee15ae38d..5d381740ef 100644
> --- a/include/hw/arm/fsl-imx6ul.h
> +++ b/include/hw/arm/fsl-imx6ul.h

For example here:

> +    FSL_IMX6UL_SNVS_HP_SIZE         = (4 * KiB),
> +
>       FSL_IMX6UL_USBPHY2_ADDR         = 0x020CA000,
> -    FSL_IMX6UL_USBPHY2_SIZE         = (4 * 1024),

> -    FSL_IMX6UL_USBPHY1_SIZE         = (4 * 1024),
> +    FSL_IMX6UL_USBPHYn_SIZE         = 0x100,

Don't we also need:

-- >8 --
--- a/hw/usb/imx-usb-phy.c
+++ b/hw/usb/imx-usb-phy.c
@@ -210,7 +210,7 @@ static void imx_usbphy_realize(DeviceState *dev, 
Error **errp)
      IMXUSBPHYState *s = IMX_USBPHY(dev);

      memory_region_init_io(&s->iomem, OBJECT(s), &imx_usbphy_ops, s,
-                          "imx-usbphy", 0x1000);
+                          "imx-usbphy", 0x100);
      sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
  }

---

?

Thanks,

Phil.
