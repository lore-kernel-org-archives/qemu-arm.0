Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp514046ejb;
        Wed, 6 Mar 2024 05:59:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWjo4WDQvpXxEbIW1Ed7h69OqkiSt+oQ8loIseQcjMRWSjaLqN8MpgmeTOIJRbWAF3mt0tYC+dvyJ713iOQWTkuwlOJedgZ
X-Google-Smtp-Source: AGHT+IFhouvrXRrers0D2JhnjPjW/6XprO4gD9Eyv+kNBY94uNFyuCxrggCnSYxhS+0ZqSLMjIi4
X-Received: by 2002:a05:622a:114:b0:42e:a46d:722f with SMTP id u20-20020a05622a011400b0042ea46d722fmr5356665qtw.23.1709733567773;
        Wed, 06 Mar 2024 05:59:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709733567; cv=none;
        d=google.com; s=arc-20160816;
        b=LIpKKtECD/qkcfjtsmRiX8wM7+cry5p5WwHuizHNLpPeq5bqueEbUV5fh2wAfIoCG5
         yyH2z5EAWHWwC7TFn0lpVracL3BNUdhhthjtnNMvCH9WPCBTkRtMLm1bkViOgH7MJGkT
         tdTPiORCpiVA7w+2aZ4GHeB7nS91k26BLzYDIis86w0HLNos8QNqfFmjBdQ58HxOOtLo
         jsSG5n/GLlPCHFQW6hGe6/5DT6oxikMEPZeRxw+coJ45wPWYFqBttIFouWYcVI03sbR1
         Z7vN7v56hqawehFnJGF/K2qLF+pXqQp4FrV+9ykHVSAZ2Z7TdlfrKGe0Y3io3TVmlr3R
         u0Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=cQDFLy0CZSPqjE1CKuzZVx7duh+wvmGVv3eAyAhCQyw=;
        fh=+FD09Mxav9aL8Wjog+48Pqxc2lLOxPZpfMtjTli+kPk=;
        b=sOcXMlyqJRuUig5VwAFMv+z5+dkjmvNjLpaS2dClqwQwo1+zs63yzPlLTDJK/93JU1
         D4uKHsZBLidaxGvYYOAV/q5Q/zQ9Dy87ZYMN16r0t+dCLY/S4xO2Mkt74FEHoESawi7P
         Yi3fOhTjrnqCUm+tfATVSkzpcDTCJDOhM/3hW1kj9he0ClrHqmtbgqsSFgSGpGc0v06N
         QbNjLqzuYu+R21rPqzVxCchFFTHTDk55L4CUV31rTcQ+q3XjHCXSePl1UuWNmy0FolB3
         v0rsHcVdmUFuzdpNKTQv/tz8jmtBEEEEgKd0isf9i7EyXZ139Bvb7h9zQbF3PdBT044x
         IFtQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l6-20020a05622a050600b0042ebb8dbc78si3266060qtx.355.2024.03.06.05.59.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2024 05:59:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhrnb-0002MT-FH; Wed, 06 Mar 2024 08:59:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rhrnY-0002MA-NR; Wed, 06 Mar 2024 08:59:09 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rhrnX-0006uZ-5D; Wed, 06 Mar 2024 08:59:08 -0500
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TqYnR6sZ3z6D8rD;
 Wed,  6 Mar 2024 21:54:03 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 7BC4D141DB4;
 Wed,  6 Mar 2024 21:59:03 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 6 Mar
 2024 13:58:48 +0000
Date: Wed, 6 Mar 2024 13:58:47 +0000
To: <ankita@nvidia.com>
CC: <jgg@nvidia.com>, <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>,
 <wangyanan55@huawei.com>, <alex.williamson@redhat.com>,
 <pbonzini@redhat.com>, <clg@redhat.com>, <shannon.zhaosl@gmail.com>,
 <peter.maydell@linaro.org>, <ani@anisinha.ca>, <berrange@redhat.com>,
 <eduardo@habkost.net>, <imammedo@redhat.com>, <mst@redhat.com>,
 <eblake@redhat.com>, <armbru@redhat.com>, <david@redhat.com>,
 <gshan@redhat.com>, <aniketa@nvidia.com>, <cjia@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <vsethi@nvidia.com>,
 <acurrid@nvidia.com>, <dnigam@nvidia.com>, <udhoke@nvidia.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v8 2/2] hw/acpi: Implement the SRAT GI affinity structure
Message-ID: <20240306135847.00007876@Huawei.com>
In-Reply-To: <20240306123317.4691-3-ankita@nvidia.com>
References: <20240306123317.4691-1-ankita@nvidia.com>
 <20240306123317.4691-3-ankita@nvidia.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Ajr3UfdkjATL

On Wed, 6 Mar 2024 12:33:17 +0000
<ankita@nvidia.com> wrote:

> From: Ankit Agrawal <ankita@nvidia.com>
> 
> ACPI spec provides a scheme to associate "Generic Initiators" [1]
> (e.g. heterogeneous processors and accelerators, GPUs, and I/O devices with
> integrated compute or DMA engines GPUs) with Proximity Domains. This is
> achieved using Generic Initiator Affinity Structure in SRAT. During bootup,
> Linux kernel parse the ACPI SRAT to determine the PXM ids and create a NUMA
> node for each unique PXM ID encountered. Qemu currently do not implement
> these structures while building SRAT.
> 
> Add GI structures while building VM ACPI SRAT. The association between
> device and node are stored using acpi-generic-initiator object. Lookup
> presence of all such objects and use them to build these structures.
> 
> The structure needs a PCI device handle [2] that consists of the device BDF.
> The vfio-pci device corresponding to the acpi-generic-initiator object is
> located to determine the BDF.
> 
> [1] ACPI Spec 6.3, Section 5.2.16.6
> [2] ACPI Spec 6.3, Table 5.80
> 
> Cc: Jonathan Cameron <qemu-devel@nongnu.org>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Cedric Le Goater <clg@redhat.com>
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>

I guess we gloss over the bisection breakage due to being able to add
these nodes and have them used in HMAT as initiators before we have
added SRAT support.  Linux will moan about it and not use such an HMAT
but meh, it will boot.

You could drag the HMAT change after this but perhaps it's not worth bothering.

Otherwise LGTM
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Could add x86 support (posted in reply to v7 this morning)
and sounds like you have the test nearly ready which is great.

Jonathan




