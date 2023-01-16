Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1346644ejc;
        Mon, 16 Jan 2023 04:23:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvyTrwAN1Y7A5SGecenn+CfJ/RyC+f3s1HpysAD+sTVwzbN4hCvnuYgi86M38wVPh+pOe9Y
X-Received: by 2002:ac8:514e:0:b0:3b2:9d96:9cee with SMTP id h14-20020ac8514e000000b003b29d969ceemr17291840qtn.15.1673871825291;
        Mon, 16 Jan 2023 04:23:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673871825; cv=none;
        d=google.com; s=arc-20160816;
        b=0UeUGGlbt1Ms8WGV10hLaWP3BW3AxAEkEaxy54dXhIhGYSL2X1VHEb4ZXK71SvDBnK
         Z3ZEKc+UfOXIMZRL7TnJVaqjzPyXnq3Kci0x7UQss4ZLmOCpy4JUnATIFBq6Y8b2jzhs
         V2zaZtXeHpaMUZ9GKy3M6hKnBCttW59gtT9vLQO0Ei5Sdjpro3/Iy9SlRcwTXlQhNbAT
         U19bLbtVjK6vQpjA2kX8VWwZMIhD+HHyyVYWHiwXPpkO5fDITPRDNzHoD7Up4NHa5i3B
         Gtsq0n/CBZLCgbmmEwQdOkeIc/+ImeIOn2eCzBMAGNlOqjliOuua1J8u2Hh2C0uxXVtG
         X0Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=64P7Y6yjODvx3789VOcRGXmV1/qot5F9OF92fbX+2KI=;
        b=XnB1cwsNtF1W4TBWZ1QLnv71+mAFOeCT8cicTnKd55rFw/MCUQGyg2MX5fVgGqvkGt
         9uC84Cb0UJruaU8c4P3W0M1pReAlqFOjbO2q62G34Oa8nbfne3oMSVleppB+fkzkuSNo
         BYg0hFWqce1QwSH6OWZ8KTJzAIUY0aZf+WvEW7zI11dGlXws4zrxOEhnUQYvE91OIxYP
         Afxs0DOeVrwiRj4zBgeQkOPEi54Kt4uuzN3TH5ap3w2r+xJ5KerLw+eaVf+O4QZLa2Zs
         bs25k1jJ+bVCK+23Pj3eB64h7bpobFAQN3nfpzipDnYO7AcvRZCo6ejZBAdbHUaGnVkQ
         3nbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qRWc8Hec;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h24-20020ac85158000000b003b24d335c00si7352790qtn.617.2023.01.16.04.23.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jan 2023 04:23:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qRWc8Hec;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHOW7-0004a4-4E; Mon, 16 Jan 2023 07:23:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHOW2-0004Z7-4c
 for qemu-arm@nongnu.org; Mon, 16 Jan 2023 07:23:08 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHOW0-0001rE-LH
 for qemu-arm@nongnu.org; Mon, 16 Jan 2023 07:23:05 -0500
Received: by mail-wm1-x32a.google.com with SMTP id l8so2737065wms.3
 for <qemu-arm@nongnu.org>; Mon, 16 Jan 2023 04:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=64P7Y6yjODvx3789VOcRGXmV1/qot5F9OF92fbX+2KI=;
 b=qRWc8HecGeQ14bzdihy+V9zBGr/ePmRvJDI0OE+up1jBxS6lUM4wLvM60yJkjhMAOo
 G/5YxcUOaql5j1du/IRdFScJdIWp0FOlzl1Fl6WWNoslpRFTvUUsRotm3dm9elmGQC4c
 f5bJ0aMYnVnjbPAfAgQLZbgGsbJJsUtj6jCe1ncezHBr2QwjzmLkl8o9nc/w9pDrMUrl
 JZPqtY1/OzUJS1bSWOAvSpfaQAD6Jcfk0rpg1pVAJj/QRyY5F8ouWrwk+23SOc0km6+2
 CVuujbf54b1RJWI38Tsgajy6m8Lm9fUQW1760fMVaiu2sWKEpxxRAMm21gVWFN1TxP2N
 8DiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=64P7Y6yjODvx3789VOcRGXmV1/qot5F9OF92fbX+2KI=;
 b=V68Dl7WnBayL6IWZ0JWmeJWNCmj93R6ohIeXQY61jk8738QAWynAxklo7JJN3t+aHe
 1FLJGZMFEE1CUDQ0DluZIj/VkErWHE2wuEK+eQCIlrigL8Mpf2unG571vxp++3PUCb7O
 OvhRYz7DxSd+N1zYBCbv+qR799AL2Hi5nJa17vxSqauIVxETy5lD5epSY8SKGUN5+TlS
 E7u9ZZ3SdYZl8MFCXxfqIfQWsmzS8jPo2PSLV23OGe71P88tn1fZCO4M661g53JhkQdc
 HArWZnnwCRMAcuLkxG19gdZMOWk5nRyRc50ddfMniUsexQC0aYW81wkFf3pRxdYnn9lx
 UgZQ==
X-Gm-Message-State: AFqh2kryRhQuIpjComtDMRzrBA2lqDJfv267xcXiLlY3rpJq95VAO2Ee
 CoopDnZDavo0hWQ8KqRqtbB7rw==
X-Received: by 2002:a05:600c:34cd:b0:3d5:1175:92c3 with SMTP id
 d13-20020a05600c34cd00b003d5117592c3mr66046641wmq.23.1673871783167; 
 Mon, 16 Jan 2023 04:23:03 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c4f5200b003c6b70a4d69sm38006150wmq.42.2023.01.16.04.23.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 04:23:02 -0800 (PST)
Message-ID: <c8e17594-9eb5-ce6c-c414-622f4f68d008@linaro.org>
Date: Mon, 16 Jan 2023 13:23:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/6] hw/nvram/eeprom_at24c: Add header w/ init helper
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
Cc: patrick@stwcx.xyz, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joal@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230114170151.87833-1-peter@pjd.dev>
 <20230114170151.87833-2-peter@pjd.dev>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230114170151.87833-2-peter@pjd.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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
X-TUID: TRgsbUfwJHdp

On 14/1/23 18:01, Peter Delevoryas wrote:
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> ---
>   hw/nvram/eeprom_at24c.c         | 10 ++++++++++
>   include/hw/nvram/eeprom_at24c.h | 10 ++++++++++
>   2 files changed, 20 insertions(+)
>   create mode 100644 include/hw/nvram/eeprom_at24c.h

> +void at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size)
> +{
> +    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", address);

Please use the type definition: TYPE_AT24C_EE.

> +    DeviceState *dev = DEVICE(i2c_dev);
> +
> +    qdev_prop_set_uint32(dev, "rom-size", rom_size);
> +    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);

Although the allocated object is somehow reachable from the i2c bus
object, it would be simpler to deallocate allowing the parent to keep
a reference to it. So consider this prototype instead:

   I2CSlave *at24c_eeprom_create(I2CBus *bus, uint8_t address,
                                 uint32_t rom_size);

> +}
