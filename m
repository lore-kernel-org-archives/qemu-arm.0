Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2648631ejf;
        Tue, 27 Feb 2024 04:53:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUxRRcQVqLhbzZrRGMHzqzEDVCvBG7utnRRA/2EVe65Ui4xylbzpZOzJvfLK8ry7oEIREjGEhztZZ/9r0wHCZft3wC7JYyB
X-Google-Smtp-Source: AGHT+IHmTgDRuF/aUGlcUbms8gx8eNPKXDJE+gMoI0h/r+6O33hiUqvut5K9RGq292utdBhOX3ni
X-Received: by 2002:ae9:f816:0:b0:787:e004:66d7 with SMTP id x22-20020ae9f816000000b00787e00466d7mr1703483qkh.30.1709038436921;
        Tue, 27 Feb 2024 04:53:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709038436; cv=none;
        d=google.com; s=arc-20160816;
        b=ZUBako0IW6E3/7p51s1hLh3GQO4i8oxZdokckXaJpdFxKJU/GC1/Yz7G5CTVEdGXPg
         FgFeyCAPzFRArabJLbIB4WNVP/tRpHz3tIq+viUkmkrzyz4aOv7lJE1XjC6TZF8nhyAw
         1JMAFZaPwPqLvpn9Xu+NnVEwo2M43gAIk3xnv74cDH6NmX47ee/uKoP3vVDAwDcSCt5N
         dUmYxiJcxDKDrxtfpfSOHo+5lAJ7SRUMD3h4gvIYyBuVUg9wUv9SIBwElgG54dLHw1tT
         6tNZzGUweg40v63QNBMK+E/7u0R9E38LSpGXLLJKhGSrT4+3YYUWAIQfU9vVaKOoNR+B
         l83A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=A8MnENLFqFhJ9GeBozkS3Y0KkCViLchGUAcx/lTMYFQ=;
        fh=S5KfG517jnmZiWmNRDwcBtASqH6F+n4I4staEIYnefs=;
        b=JDx6gW1rxQOGKTtlR50pzPodM/mPaLWji37DNMQrdi0tJRffaLLBsNQucEGc6XnCz1
         Zuh5i5rJ7r+BAP2QI6D7JPN/UPVmF7kSsZMAmIjr51Y6FBWkkJ55fol82GYBjdJ0qKO0
         RY8IEt3kvS9Q1MnNa1CZADa0fpLBA3ysbRC9NXSxNwr3AlOeVPlbhQ5Kt+aJ/Rp39sGR
         ri7GOFzoq/h8c9NfeJqDnyRkbd8mGLD8bODhNP96xnotoMziEfqqrd4/XNlUnrYZEiW7
         g7IZN5UafBrbXwS+C9/ZQm9jU+R+pVyo9VzK8cJw//Dr4qgTIhX3gqO4DjYRXJe0q2b/
         V5tw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bk9-20020a05620a1a0900b007871f6e9e57si8088363qkb.721.2024.02.27.04.53.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 04:53:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rewxt-000104-OQ; Tue, 27 Feb 2024 07:53:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rewxb-0000mx-SW; Tue, 27 Feb 2024 07:53:29 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rewxZ-0002sa-9D; Tue, 27 Feb 2024 07:53:27 -0500
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Tkck22Wthz6K5hF;
 Tue, 27 Feb 2024 20:48:58 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 12A731400CD;
 Tue, 27 Feb 2024 20:53:20 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Tue, 27 Feb
 2024 12:53:18 +0000
Date: Tue, 27 Feb 2024 12:53:17 +0000
To: <ankita@nvidia.com>
CC: <jgg@nvidia.com>, <alex.williamson@redhat.com>, <clg@redhat.com>,
 <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>, <ani@anisinha.ca>,
 <berrange@redhat.com>, <eduardo@habkost.net>, <imammedo@redhat.com>,
 <mst@redhat.com>, <eblake@redhat.com>, <armbru@redhat.com>,
 <david@redhat.com>, <gshan@redhat.com>, <zhiw@nvidia.com>,
 <mochs@nvidia.com>, <pbonzini@redhat.com>, <aniketa@nvidia.com>,
 <cjia@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <vsethi@nvidia.com>, <acurrid@nvidia.com>, <dnigam@nvidia.com>,
 <udhoke@nvidia.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v7 2/2] hw/acpi: Implement the SRAT GI affinity structure
Message-ID: <20240227125317.00001cf8@Huawei.com>
In-Reply-To: <20240223124223.800078-3-ankita@nvidia.com>
References: <20240223124223.800078-1-ankita@nvidia.com>
 <20240223124223.800078-3-ankita@nvidia.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: p9gGHBFz/zeB

On Fri, 23 Feb 2024 12:42:23 +0000
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
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
> ---
>  hw/acpi/acpi-generic-initiator.c         | 84 ++++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c                 |  3 +
>  include/hw/acpi/acpi-generic-initiator.h | 26 ++++++++
A few more comments.

Maybe _ rather than - as more common for acpi include naming.

I also wonder if we need the acpi prefix for file names given context?

