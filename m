Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp7242199ejc;
        Wed, 1 Mar 2023 09:53:00 -0800 (PST)
X-Google-Smtp-Source: AK7set+JalyQunB5HFSBt4kXH5t3hPHSIz1i1eAWIN0ReZ8YYVYQ0PxXOtk6iGNBrzLmTee6W2cM
X-Received: by 2002:a05:6214:19c6:b0:56e:af8a:a84d with SMTP id j6-20020a05621419c600b0056eaf8aa84dmr14228647qvc.50.1677693180420;
        Wed, 01 Mar 2023 09:53:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677693180; cv=none;
        d=google.com; s=arc-20160816;
        b=JQo5tyIUzEVA4uhZVFzflIQ0TwBg4NdIktlf8zp741Ow6B0kLVCB+GeriuwqTOyuLe
         9tTxMN+ldIQsRe39EGtngNTzzTDR7flVzVijc3dia2hBNl9xgxveJLHnv+mNxQ2aGzi0
         Gg7+ecWkmWlHv1o/PEKn+nLGxY4iN7TXqb9rGFpouFvwwCv4LaOCv5xH3NGDqof8Ks8s
         vhSK1sZp5p1NNK4zMK7Hz58pFV8bqH3MshbxEBN4tBHeUrAPAFvOQ4ZIFOFYq+vln33k
         js+/sYx9S9Ke8lq06G+6Cx+7yDpe7+D9rDbaaPL+u8+xlBrMocn8QfUQPImjCN1kIHEW
         jkEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=r5OW/MpZn6t0tHKu1yQh/I+98WeAdFzFmQo9cSRwnRs=;
        b=O/uwDl9k5QuOBS9kXro9avRxzZRaLAIt7HKCuxCGoAwY7Sk6GhlxQ/iVEwVUf+AKm+
         hov564XHBr7EZKJmSxP0rasxnNhT5KTI9tZLVIeHOiBblVtI/VSiVAqk3DOLFFkhoacG
         DXTvCK/IKi/3FmO+ROi6D9H+lcwkNbgIVP8Tv4myOpi4jVU7HCejGXYZE7r+Wjqeq2jq
         smN18MYQ9gOpL8yvZBnCj1lxTvjsCft4wzJL6beVuLg4V9D+tyC59MduWWQKWAu0qT1Q
         zArILktUXTBUKA8kVoYi5P8hT0PPYgf2aT4VLDansDpBTx/RkW90RRQpWC9d/0ZxrvHr
         lS6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DJyW2ozi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o5-20020a0ce405000000b0056c21b703b9si10799674qvl.256.2023.03.01.09.53.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Mar 2023 09:53:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DJyW2ozi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pXQdE-0005R4-Ts; Wed, 01 Mar 2023 12:52:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXQd7-0005OF-Iq
 for qemu-arm@nongnu.org; Wed, 01 Mar 2023 12:52:42 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXQd6-0000fC-1Z
 for qemu-arm@nongnu.org; Wed, 01 Mar 2023 12:52:41 -0500
Received: by mail-wr1-x433.google.com with SMTP id q16so14144266wrw.2
 for <qemu-arm@nongnu.org>; Wed, 01 Mar 2023 09:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677693158;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r5OW/MpZn6t0tHKu1yQh/I+98WeAdFzFmQo9cSRwnRs=;
 b=DJyW2oziP9YaqfFqy/dSOKFtfwmdvyLCUKlwOqNb7UN4k2/CFFjnn4gbugt/qb0xRi
 ZOfb4pi62RLlMUVdlGt8lBpn92RmqfUs/ChKfT58oaeQoroxdUYYfwqjzTXCspz1SH8L
 Nb/GnMZ4Civl2Ydu3jZMq5hIHt1xZ6qhM0vJrvMEiX8bpb5vFER8RySmpy8JjzwThuEU
 LmwOLsvFoqC1mSzweJvUBICN+Vtwzo75DSPIi+AinYeL6038H0X76yDgnpePSYlGoJR4
 CWEGJvr1Mrs5AeTBmuTYxYPDvgcKW/JBpsH3pk1P3MSywezqiGtv2Fdktwex/UDu5KLc
 /PZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677693158;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r5OW/MpZn6t0tHKu1yQh/I+98WeAdFzFmQo9cSRwnRs=;
 b=fKxzczJhnFsjg875VxKLXsm/TlLa6PtYKLkizukHrNE3ARvtcCLHTKOTG5CHoT4EEj
 VHRfxLtYdfeDsC+dsNmT7Fel5ouvcJg4BE77sQcjdM59Efy8TqRk04noFjX5dMnMC/Jf
 OfnJf48hczO3H9lxwQgFEa5isVbJaHbFHGqra9PuIfrb5gFuMfDLKHVfb74NY56Y/LSR
 uO8bfe4rw/0rKConu5MzIitACUVy5d5qCPAHtTZ7SWs0dE38qYE/qPKh+BkygAjg7o7W
 6ZJL3B3w8AQUjnVn9zYyl5GAer7A3OfiGWwizoOgNBcjBVte1UZKWprCXixr02deZsP9
 2vWA==
X-Gm-Message-State: AO0yUKXtHCKCB4rNo/wm51d6XDAfEkuampCdAvmt6+KOwY/xoiU0BnHp
 ybyoU4f3NdwOvsaoDrCLqjM0xA==
X-Received: by 2002:a5d:6388:0:b0:2c5:4cd0:4b86 with SMTP id
 p8-20020a5d6388000000b002c54cd04b86mr5293321wru.68.1677693158244; 
 Wed, 01 Mar 2023 09:52:38 -0800 (PST)
Received: from [192.168.45.175] (41.red-88-29-167.dynamicip.rima-tde.net.
 [88.29.167.41]) by smtp.gmail.com with ESMTPSA id
 n5-20020a5d51c5000000b002c70d97af78sm13463701wrv.85.2023.03.01.09.52.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 09:52:37 -0800 (PST)
Message-ID: <4306d877-e667-4bf9-276c-a68bf4e9717e@linaro.org>
Date: Wed, 1 Mar 2023 18:52:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 09/11] aspeed: Introduce a spi_boot region under the SoC
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20230301165619.2171090-1-clg@kaod.org>
 <20230301165619.2171090-10-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230301165619.2171090-10-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Ygbo8j569bWi

On 1/3/23 17:56, Cédric Le Goater wrote:
> The default boot address of the Aspeed SoCs is 0x0. For this reason,
> the FMC flash device contents are remapped by HW on the first 256MB of
> the address space. In QEMU, this is currently done in the machine init
> with the setup of a region alias.
> 
> Move this code to the SoC and introduce an extra container to prepare
> ground for the boot ROM region which will overlap the FMC flash
> remapping.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   include/hw/arm/aspeed_soc.h |  5 +++++
>   hw/arm/aspeed.c             | 13 +------------
>   hw/arm/aspeed_ast2600.c     | 13 +++++++++++++
>   hw/arm/aspeed_soc.c         | 14 ++++++++++++++

Why aspeed2600 duplicates a lot of aspeed_soc_init() /
aspeed_soc_realize() while inheriting from TYPE_ASPEED_SOC?
Is that on purpose or because not using device_class_set_parent_realize?

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   hw/arm/fby35.c              |  8 +-------
>   5 files changed, 34 insertions(+), 19 deletions(-)

