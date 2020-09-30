Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5196198lfq;
        Tue, 29 Sep 2020 22:09:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwq5b97cgoP2TKx7BusRX0ptFJPGc5vsIUIlmyddEsIK8/Z6NeX7nZ9XUOkIsmDcD1/tYXS
X-Received: by 2002:a25:cfc7:: with SMTP id f190mr1028814ybg.388.1601442559023;
        Tue, 29 Sep 2020 22:09:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601442559; cv=none;
        d=google.com; s=arc-20160816;
        b=TByWbvapsIzaQ1LKYXaQ4PCP++gGs+FCkSEtyvZietKYUBTuZYVCfr6keOsPyxfK89
         VVnYXkcuQA8G+LJXj4cJkwonbgkHBQnYIH8eD+7xi6dzGrRcEytEsxUGxYaplRmNVa3U
         nSNdIJnItHMEM9HsW9wieQzOsr4A0J07Aet7NiZlsrTnLc63iIvcXjTjI1u7Sn9oFIl5
         etJDzVJX1OobARbj4hZiXI/W//z0UX6DcuNllAopecaLeo2Zz6TxirI1sRy4QP0/vqj4
         4DBX/KGLYCtPF784dOpHCD03VvyURb163Xz3nfW5m1IQEUZCWgfQDODSr2FfjGkAaxzD
         FbjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=S4zuOb0dy5QIRnVyFVngHujqvfz1dV0GRDZVpm3rPb8=;
        b=b6qqAaCbKKbJUcymo3zBlMsE4Fb5WZl1xhfsjyVc6JmuWikZbfRIAcuH0+2O8Ltmk0
         BuuTWdSb4m5thOOG2iR0BZrWLXfnnLf7ljZybV02ymoE91bMPnRoAgBd9uLOGn/9LSik
         BizKfXfR1d7YyuZ0zi/yy+3mpEMaLujn537Zifcd6vr/5jSM6bb8oNDgsQTb8m81xjqJ
         s9KZPZRntKVijWjcS9z1Dwe3+Hu8wVpJwsFDUIyjiOrB59AJYcb/5H2OztiOp0TYIWmT
         UBpiky2oCp/H2pLth1gFs1GPe+Ecoep7bVrMIjy34p3eH8t+0p6JVQYmWLlZx1G7DN+P
         jy4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z128si627999ybf.45.2020.09.29.22.09.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Sep 2020 22:09:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNUMg-00059Y-F4
	for alex.bennee@linaro.org; Wed, 30 Sep 2020 01:09:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gengdongjiu@huawei.com>)
 id 1kNUMO-000581-3H; Wed, 30 Sep 2020 01:09:00 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2981 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gengdongjiu@huawei.com>)
 id 1kNUML-00034Y-Nv; Wed, 30 Sep 2020 01:08:59 -0400
Received: from dggeme755-chm.china.huawei.com (unknown [172.30.72.56])
 by Forcepoint Email with ESMTP id D678CD8DFBE8D194DE50;
 Wed, 30 Sep 2020 13:08:44 +0800 (CST)
Received: from [10.140.157.78] (10.140.157.78) by
 dggeme755-chm.china.huawei.com (10.3.19.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Wed, 30 Sep 2020 13:08:44 +0800
Subject: Re: [PATCH] hw/arm: Restrict APEI tables generation to the 'virt'
 machine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20200929125609.1088330-1-philmd@redhat.com>
From: Dongjiu Geng <gengdongjiu@huawei.com>
Message-ID: <12be4400-c37f-2b7f-2f15-f8700dad6003@huawei.com>
Date: Wed, 30 Sep 2020 13:08:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20200929125609.1088330-1-philmd@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.140.157.78]
X-ClientProxiedBy: dggeme703-chm.china.huawei.com (10.1.199.99) To
 dggeme755-chm.china.huawei.com (10.3.19.101)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=gengdongjiu@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 01:08:45
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Xiang Zheng <zhengxiang9@huawei.com>,
 qemu-arm@nongnu.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jYmiDpDMd+Kv

On 2020/9/29 20:56, Philippe Mathieu-Daudé wrote:
> As only the Virt machine uses the RAS Virtualization feature (see
> commit 2afa8c8519: "hw/arm/virt: Introduce a RAS machine option"),
> restrict the APEI tables generation code to the virt machine.

APEI is a generic feature for X86 and arm64.  X86 platform also can use it, although currently it was mainly
used by ARM64. what is reason that we restrict APEI tables generation to the 'virt' machine?

> 
> Fixes: aa16508f1d ("ACPI: Build related register address fields via hardware error fw_cfg blob")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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
> 
