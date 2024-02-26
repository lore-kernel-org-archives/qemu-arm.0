Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2170911ejf;
        Mon, 26 Feb 2024 08:43:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUOmRkAlJyXPqhXpk5vpEH124zO/bljnYooVtYzi1RNTPQ27VsFCbZM+DcV5CQpxW8cSmglY7ivnW064ApNCV5oGj99lNPo
X-Google-Smtp-Source: AGHT+IEKBh64IZrBj8PE/wRlOPZurlq2xN2BFgD45ooVYF4az6+5FHMqpDZVeC8KfbZISgjkvOQp
X-Received: by 2002:a05:6214:62c:b0:68f:cd51:69aa with SMTP id a12-20020a056214062c00b0068fcd5169aamr9533376qvx.16.1708965781124;
        Mon, 26 Feb 2024 08:43:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708965781; cv=none;
        d=google.com; s=arc-20160816;
        b=YbXxS/sptzG82voU3NYZ8fkHQEiTeWmd/+5TeGlDB99d6XqPT2lWgbxG7hC8UJ7ZHe
         4rdNaielvtiNi/w3YC8J5Pg4nY8pmg+T/rb56BvPCq7xE8VPWUqAxl8CL3UyVNnSvShz
         r+PrPAuyOgsV6o7V+k8voI00TpI/FEytFn3q8UmXDbhIsrjXQZe+/uAp2jVWqDvKiWdu
         UbhNwMyeoayucw5up5Q4SDdNiTlN9URRt4JIDcrUyWvYPSnN1EiOLzsi+KRZ+PK4DWmG
         Fm9olfRHWg3UTQB5rmBEc6XrP+lUC+pbXPkoW6u41CYltuOJxughYHW8vlb2LfnZpUPT
         Dx3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=YOVpEC0IAbR4j3vZVn9QCLmIx+woGjBtSJpHzw92V18=;
        fh=S5KfG517jnmZiWmNRDwcBtASqH6F+n4I4staEIYnefs=;
        b=X5kQUbomRW7uGzurT1RNogZGyNe7NhN8b+PIrovWrVz6JXIEOu5JQOaWboapwLL8BO
         mIe5geqMLysJGh/Eqmr2Xxg+hj5nrVi59YMv54Hvvfo2DaIKwZv8/csJ8tMri9HA9Mhk
         09jTPZ1lPq7XGdzL34R1gTgWks7/+fqkTIPGqaEtFdK5hTb9GHXzMyLCRTh7cFAJsTk/
         cZM4k0GjX6a1q1GiScpPjRrvLtgscxNBhVoYH9rak0PIzmrcdyQSDuTC2M6IkeWmj8Kc
         dIa1mqWRim8Uul16j811TopQ8UMqXUu+YZK5a+oAefNLo+atZ2yLTTq+8Lo97HdO58iT
         n1tQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020a05621420ce00b0068fe4f0982fsi5585259qve.156.2024.02.26.08.43.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 08:43:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ree3u-0000qY-RW; Mon, 26 Feb 2024 11:42:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ree3r-0000mv-SQ; Mon, 26 Feb 2024 11:42:40 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ree3p-0004xU-TT; Mon, 26 Feb 2024 11:42:39 -0500
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Tk5rm5rpFz6J9p9;
 Tue, 27 Feb 2024 00:38:00 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 00C31140B73;
 Tue, 27 Feb 2024 00:42:35 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 26 Feb
 2024 16:42:34 +0000
Date: Mon, 26 Feb 2024 16:42:29 +0000
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
Message-ID: <20240226164229.00001536@Huawei.com>
In-Reply-To: <20240223124223.800078-3-ankita@nvidia.com>
References: <20240223124223.800078-1-ankita@nvidia.com>
 <20240223124223.800078-3-ankita@nvidia.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
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
X-TUID: XKxvoLQHGITu

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

One thing I forgot.

Please add a test.  tests/qtest/bios-tables-test.c
+ relevant table dumps.

Could also hook this up for x86 with a oneline addition and improve
test coverage.  If not, I'll do it when I add Generic Ports as annoyingly
people still care about x86 for some reason.
