Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5398104lfq;
        Wed, 30 Sep 2020 03:49:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBaGvDjSE97aPq4CPbu22xnRk6WjTMGIawuvWAPtIO5KmZNxnL/r7sbqQL4vV1mAaeP+vk
X-Received: by 2002:a25:2506:: with SMTP id l6mr2303919ybl.390.1601462953699;
        Wed, 30 Sep 2020 03:49:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601462953; cv=none;
        d=google.com; s=arc-20160816;
        b=rOWnRJtbAhhEplSoRvfsAldPxTmCXwC6WH7QacrNhgksV5CFegxKfyzOSRdtyXm/cf
         RcpUZ1EvqBogzJ4uD9xSjk3SNZ3bnrn3ErGVyamgNmYiS10sBxEh3qyyZWL5ejGL8SpM
         sd2FNoGreyr7yZ3hij+FEV428VVEElPukgSdX/KlkvXqMOkc/uqV2GgsIkisAYGlYaHV
         XaI0Fv9jLFcPfOu19zwtIIsS6z3Zz7naeQfjbAfmeVHbVSt1sxOUTwLgJIM5eEDtEirw
         VYNvWrqfZM5wqtHlbSOh7872oSqmGVTqEbAJoaZgEzUN/sRw/SKm/tKX+Vjf4KlZuYwe
         /0wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=4fZsuNISzwNY/mPJmil+Cj7GKV2Pr2PQSQbMiFFLq+8=;
        b=JqpObDNq54Gv17kBBlhWCJ4oBdnYaH0P+xqF9v+Wn60ZGH/Eyw1B5w1DYL4CfKjbAo
         hssyZXToLUDLov5ECZFCiu4GEsbpB7U57b6u6blR3KNeZQcgT2RCUCWTC2BCn4UfSMUN
         O30e+Ka2iItSpd+SzTV6B90BldFj6fE655hN3IirAO6yQ1NERdZJjbjIV3URlgDhq0Xd
         TLiNOZwzRMePvgK2pENIR/QenfLJmkOAceoFQ2j30QJ5FglthCnAuLNmvz+qLp7DnjD8
         S50RFnumGDZvRjmVgTPOZgRfMgNUqu/MvvOG7ekWPdu2/6KTHKfl/aCzMANerE9pevzK
         SGCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JMj0DDsq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n2si1255132yba.58.2020.09.30.03.49.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 03:49:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JMj0DDsq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNZfc-0000qo-Q1
	for alex.bennee@linaro.org; Wed, 30 Sep 2020 06:49:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kNZe5-0008Qc-Q2
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 06:47:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kNZe3-00009d-FE
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 06:47:37 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601462852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4fZsuNISzwNY/mPJmil+Cj7GKV2Pr2PQSQbMiFFLq+8=;
 b=JMj0DDsqJ0Za9SseHrjJ2KTE1jxBr9VA4+yyu1ElJpgr4CJ9N5mfe7p1iPogroR9rGpyVa
 X7/iJxQlWXk7KjuXQmmqzlnGosswEE3bcAd8BdYfofubQyWS4Oyprrkgxj1n3Pz+AnQAgb
 rgDG76VjpdSkyaGTDvfZvdQadP1+jvk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-Bwq_Jv9AORCUupKDnseN_Q-1; Wed, 30 Sep 2020 06:47:31 -0400
X-MC-Unique: Bwq_Jv9AORCUupKDnseN_Q-1
Received: by mail-wr1-f69.google.com with SMTP id l15so460011wro.10
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2020 03:47:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bWvN3FA3f4hDob/bobaLcT6CJkbAuluYXFtzV3u1w/0=;
 b=UZjM5BKj8ByojBTHVBIZfzI3scdEex7LEf1k21cmrkmhHFV0DeO5AuhCQAA6STPpNd
 k6KD+onIeD6vPgyIiqMYJn3yk9TJbpWbRTFjTL3o6nrklD/ZI94u8+eJmeUFuUd4uUiP
 oULqHPk0FmTxJ8QvG852Brx2ciF744cog2tPGXEYHqlBerlI0znlVb8ZcDOVtod2CLRH
 V9N/p/kwpN+eq1qxf9Hf/GecCXyHnFR0sLic+lDGYkh7NlT/LafKpKPcLW8F6BGwkS8h
 5qh3UM1vmZdvQWI9uWR+IPuIE9mU77bvBYEEPT7+ROsLH91+uI2JUArj1MSNVc1gyMci
 e/RQ==
X-Gm-Message-State: AOAM5323VtSxKAblCXQlqfliNq0QoiFIc6+L2lvXROKR0xLqsoaX5uXU
 LBgTUgKcHtXm+pCLOacCcI9lSBWpjyfkqSP/AVlsVQ7mKMzmTFvRN6bwDvsYkhM8FJO+cUUxuo7
 px5zjIRB4fAht
X-Received: by 2002:adf:f190:: with SMTP id h16mr2456518wro.202.1601462849895; 
 Wed, 30 Sep 2020 03:47:29 -0700 (PDT)
X-Received: by 2002:adf:f190:: with SMTP id h16mr2456492wro.202.1601462849642; 
 Wed, 30 Sep 2020 03:47:29 -0700 (PDT)
Received: from redhat.com (bzq-79-179-71-128.red.bezeqint.net. [79.179.71.128])
 by smtp.gmail.com with ESMTPSA id c4sm2195105wrp.85.2020.09.30.03.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 03:47:28 -0700 (PDT)
Date: Wed, 30 Sep 2020 06:47:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/arm: Restrict APEI tables generation to the 'virt'
 machine
Message-ID: <20200930064717-mutt-send-email-mst@kernel.org>
References: <20200929125609.1088330-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200929125609.1088330-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:31:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Dongjiu Geng <gengdongjiu@huawei.com>, Xiang Zheng <zhengxiang9@huawei.com>,
 qemu-arm@nongnu.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Oeh019jC3uuX

On Tue, Sep 29, 2020 at 02:56:09PM +0200, Philippe Mathieu-Daudé wrote:
> As only the Virt machine uses the RAS Virtualization feature (see
> commit 2afa8c8519: "hw/arm/virt: Introduce a RAS machine option"),
> restrict the APEI tables generation code to the virt machine.
> 
> Fixes: aa16508f1d ("ACPI: Build related register address fields via hardware error fw_cfg blob")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>


> ---
> Cc: Laszlo Ersek <lersek@redhat.com>
> Cc: Xiang Zheng <zhengxiang9@huawei.com>
> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Dongjiu Geng <gengdongjiu@huawei.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> ---
>  default-configs/arm-softmmu.mak | 1 -
>  hw/arm/Kconfig                  | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 9a94ebd0be..08a32123b4 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -43,4 +43,3 @@ CONFIG_FSL_IMX7=y
>  CONFIG_FSL_IMX6UL=y
>  CONFIG_SEMIHOSTING=y
>  CONFIG_ALLWINNER_H3=y
> -CONFIG_ACPI_APEI=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index f303c6bead..7d040827af 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -26,6 +26,7 @@ config ARM_VIRT
>      select ACPI_MEMORY_HOTPLUG
>      select ACPI_HW_REDUCED
>      select ACPI_NVDIMM
> +    select ACPI_APEI
>  
>  config CHEETAH
>      bool
> -- 
> 2.26.2

