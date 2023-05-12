Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp4652287ejq;
        Fri, 12 May 2023 02:11:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6LcX2qbRmUMysAENtD20L9MbBkptfAhZ83MVgbVKZO44JlLHhThn3JEQNs05VHpWJ3JKpK
X-Received: by 2002:ac8:5f4f:0:b0:3f3:8b8a:75a6 with SMTP id y15-20020ac85f4f000000b003f38b8a75a6mr28469352qta.23.1683882707643;
        Fri, 12 May 2023 02:11:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683882707; cv=none;
        d=google.com; s=arc-20160816;
        b=T2T2e+5GdU25fUrfKgxPEhfkG3KP1f6CSTt5epZql3prRquBRSz5exXGSbix1GB2fK
         2KrSH3Ge9eDVpTRwYirb9EaU7rvtZqcZHLYsPstbVGSl4XosnzMR6ea4t7yWU0P2Azbz
         tngWsMNvPWj/+2zxlqSZnHdfI5HDbFZHQx4endnpin8KBtUJGQ74JrONj4TN1chKOpm7
         EvzYny9yB0D3uT+D4JyG2MBBIRUWTm4kso/j0u3wPZF3jcbAduCcpcTsbkuwrMtn6SPy
         tmO9IaRJicjNj7uYiVSUT+eT1n194I/vhbDCLtJ7BZrDYuKD6SqPGL1n/HdsXrb3lxZC
         nBTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=wDv6808dCYXUVFuyOud4hSxmy/gp+2weF/pIGEYxB6Y=;
        b=yjm6h9/AJPhxt1ilXPSV9mWeV/V2FT3VZk/5x5FKzB8o3ER35Mf21dHWgkYrVEiKXi
         aOmYpfVHcvdta7C43KotCoqTZQ+Vzm/2T8sNLBRdwfUAQo5cKTIWcx3JgXH0GJT5+4tG
         6oON+624+vz4KUCsrBQh8nSymI7d3F077AtbHNJDxbWKwAZSUwkphWyvxoxftWQa+49b
         dL3Hd83UlfqQQ3MWW7ajDNIaeyCvXTYDxU4AVhZVmCpLGNbIIXcx0EwONZDMtslcsPpQ
         7ttUqVI6CMo+juiwsMiuELixS4vAN19EttZtGkDjUQu4MGdUV4WBNRrnJcFT3ApsVCwE
         XQFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp31-20020a05622a1b9f00b003f221c60341si4792346qtb.74.2023.05.12.02.11.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 May 2023 02:11:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pxOoO-0002ui-2k; Fri, 12 May 2023 05:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pxOoM-0002u9-NF; Fri, 12 May 2023 05:11:38 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pxOoK-0001kM-Rc; Fri, 12 May 2023 05:11:38 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4QHjdL06Vyz684JT;
 Fri, 12 May 2023 17:09:41 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 12 May
 2023 10:11:23 +0100
Date: Fri, 12 May 2023 10:11:22 +0100
To: Hao Zeng <zenghao@kylinos.cn>
CC: <pbonzini@redhat.com>, <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>, 
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH] hw/arm: enable qxl for aarch64
Message-ID: <20230512101122.00006c73@Huawei.com>
In-Reply-To: <20230512090803.1170154-1-zenghao@kylinos.cn>
References: <20230512090803.1170154-1-zenghao@kylinos.cn>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CxrmHeVPkEfo

On Fri, 12 May 2023 17:08:03 +0800
Hao Zeng <zenghao@kylinos.cn> wrote:

> Qemu does not support qxl graphics cards in arm, it is recommended to enable
> 
> Signed-off-by: Hao Zeng <zenghao@kylinos.cn>

Drive by comment.

> ---
>  hw/arm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 0f42c556d7..0305a4f4f3 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -32,7 +32,7 @@ config ARM_VIRT
>      select VIRTIO_MEM_SUPPORTED
>      select ACPI_CXL
>      select ACPI_HMAT
> -
> +    select QXL
Keep the blank line here.

>  config CHEETAH
>      bool
>      default y if TCG && ARM

