Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3293445wrg;
        Mon, 17 Jun 2019 22:20:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwngeE48OG+4BscAduQcdzhxbYelL61FMDTAPX4GjWo4aTqIm1dUUlOOeFZS0dE8SN9HTRB
X-Received: by 2002:a17:906:6051:: with SMTP id p17mr28657151ejj.142.1560835250933;
        Mon, 17 Jun 2019 22:20:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560835250; cv=none;
        d=google.com; s=arc-20160816;
        b=LHXX/DOTy3Om3A/HMxEICC4Oj3MyDR7bxwRjDY1Woq505kvpXnAG4YoWP69xBg53P/
         o/ZUEc7O3egPvLO3GwdXLP0VcDtZMpqNYg6XkJSFaim+K0eYaGhQ4zvvcFZPMeHv8SkK
         UoIHHHBH8v3tMkVcLQctR3ARDv91yLZlZ3CytQtNkN8XorrU+VqBHjMyIfjvXhumIX3s
         xi/j2eCwArhwGZg985SumED3IQQxb6qfKtCu3q8HTRcJVHIZ0NeKBUaCOKsgqlxPHg7m
         WGNGOgRGhUy93nEcu5VYCbO1Jau8uAptxePZto7UaYBSY5nG9S13vFdpKNgdMRMBMoB6
         ZcHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=Ag/dcsqh9dtFvFcQu+UeHXkU/kCy3YaWxZzzGdj4pLU=;
        b=tFTRNdKKCImeUa3sDWkXRN4xAUGnmXMDkix3siuKeiHrU7JuRhvvYL1VPbNXNHcEAI
         ichqkufiiTgGL3NWh5VbWyO5/gXiO91i63ogHq3LHztwWrutNfeoNdbvKTGYXYtR82aw
         9jmBXWIS5jrC+DkIFl9yQ6OcUkjiNIOBvGReMaYmn0kK4TToNkCERM7zm6DWGqqVYh7z
         MrANF1ycdT3iVtoa70AFOTqNS4fTy6lV5o933xlKaKE8pWdM2aD5U9JD12sgZL0r/LSj
         9KgNOcMFK/hCsYGNdeISPC45XFVXQ/SRQFvLIcE0oR2hIu1IR2z95ujjPuq8yZJpZFhb
         SIyw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z12si9731946edh.234.2019.06.17.22.20.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 22:20:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53738 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hd6Y6-0005iZ-2t
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 01:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51582)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hd6Xx-0005iB-6i
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 01:20:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hd6Xw-0007YV-86
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 01:20:41 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34020)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hd6Xw-0007Xw-1Q
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 01:20:40 -0400
Received: by mail-wr1-f65.google.com with SMTP id k11so12403408wrl.1
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 22:20:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ag/dcsqh9dtFvFcQu+UeHXkU/kCy3YaWxZzzGdj4pLU=;
 b=uVcFTAbUFIrp/NAsWP9APnmMp12A7eDNFk/Ms/k4xWXWgposDgBiTMQ7rV/PrkYuxp
 GzSuNSkkqA8OpSJxt4UDCFmxlyE0X1mPTen1nicH3xBuew/bCNPoW3n/yWwTzHLdHozj
 2H8wReAezsA++tgkK+GTMRnoG9oxsn0HzFoZ0Iiaq6Acksx6fZ1qc81nZuZ1J88sJBLj
 My2L7gfnYUG3yKKpa35GRHhaEy7dr0gKdYht6c3w4r9f5EGkz/CMFxbKD8bn/TYd52zk
 TIqDUL2F4ARESx4WdIcVkCc8FdgxXeo04MPYl29+bqdcZITPHtxjEo64jpGmWO9uetvF
 63cw==
X-Gm-Message-State: APjAAAXhX2x4+PgCKmD4lFMp89cidOeLzGwum2ZkSiPxAbU801ZIUACu
 AFOGYM4jKjGkO7NmiKc4NZHQ6Q==
X-Received: by 2002:adf:e311:: with SMTP id b17mr79799449wrj.11.1560835239113; 
 Mon, 17 Jun 2019 22:20:39 -0700 (PDT)
Received: from [192.168.1.103] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id j32sm1685286wrj.43.2019.06.17.22.20.38
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 22:20:38 -0700 (PDT)
To: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org
References: <20190416013902.4941-1-andrew.smirnov@gmail.com>
 <20190416013902.4941-3-andrew.smirnov@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <acab44ce-83d4-fff4-db80-4345d940043f@redhat.com>
Date: Tue, 18 Jun 2019 07:20:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416013902.4941-3-andrew.smirnov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-devel] [PATCH 2/5] i.mx7d: Add no-op/unimplemented PCIE
 PHY IP block
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sRHGQVHaUZTL

On 4/16/19 3:38 AM, Andrey Smirnov wrote:
> Add no-op/unimplemented PCIE PHY IP block. Needed by new kernels to
> use PCIE.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> ---
>  include/hw/arm/fsl-imx7.h | 3 +++
>  hw/arm/fsl-imx7.c         | 5 +++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
> index aae4f860fc..3efa697adc 100644
> --- a/include/hw/arm/fsl-imx7.h
> +++ b/include/hw/arm/fsl-imx7.h
> @@ -125,6 +125,9 @@ enum FslIMX7MemoryMap {
>      FSL_IMX7_ADC2_ADDR            = 0x30620000,
>      FSL_IMX7_ADCn_SIZE            = 0x1000,
>  
> +    FSL_IMX7_PCIE_PHY_ADDR        = 0x306D0000,
> +    FSL_IMX7_PCIE_PHY_SIZE        = 0x10000,
> +
>      FSL_IMX7_GPC_ADDR             = 0x303A0000,
>  
>      FSL_IMX7_I2C1_ADDR            = 0x30A20000,
> diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
> index 1abfa5910c..813fb55ca9 100644
> --- a/hw/arm/fsl-imx7.c
> +++ b/hw/arm/fsl-imx7.c
> @@ -532,6 +532,11 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
>       */
>      create_unimplemented_device("dma-apbh", FSL_IMX7_DMA_APBH_ADDR,
>                                  FSL_IMX7_DMA_APBH_SIZE);
> +    /*
> +     * PCIe PHY
> +     */
> +    create_unimplemented_device("pcie-phy", FSL_IMX7_PCIE_PHY_ADDR,
> +                                FSL_IMX7_PCIE_PHY_SIZE);
>  }
>  
>  static void fsl_imx7_class_init(ObjectClass *oc, void *data)
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
