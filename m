Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2666204lfg;
        Tue, 9 Mar 2021 02:46:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyaPN0RwHnwqNemBdyWHDahsK33bNXuHvw0/QsagUXAkC9tOwTUZ7YZ1ljfN3eZQsTLbnPV
X-Received: by 2002:a25:61cf:: with SMTP id v198mr41764139ybb.381.1615286767155;
        Tue, 09 Mar 2021 02:46:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615286767; cv=none;
        d=google.com; s=arc-20160816;
        b=Y/DG/WNVfvQwCWtUt7tWw5i8P2CuZ5oQZDDBzs7QiRoxxaPdg5WPvoBrI4HRWgM1Rp
         t2Ag5Cx4UM9PHnCOiys4IF5NnwJA7k+cd77u6/RwwFtvJi3YouDaVDIsrlxAdYKpaXdN
         BeIzyKrrHCCZpsEHBZ8Du+E9V2/CDhvOxM57/shZfhcgncYPU/iv8Q/WDTCx6Faf1vMO
         xQ1ksIfouBvZBzeCOHbCOX+dCf996ktw9djSN6VDJCAV3FAB5ST2erjXuURaVNJre0/4
         CNhjESD0Oe+GL3MR7sJ7+K1wPihYlAPs+D5JvvXtuwgauGyxcV9rGuO/nl6Dlfv5Kmgh
         RNLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:from:references:to;
        bh=JgbbK4w9qCzdaUrTkFgQ830Om6BwW642vnCROYDf9HQ=;
        b=e+b3wYpgNLnvFuaOCvPCZDFJoaPFWoRThrLS1ahvGX2Ytk6QKKizFOkCLO8omOcArK
         sd91NMoZluGLtm/xAMm2kwb06tCgJcD6oRiJGMEazRgbGCg3II0+k3z9xZMGKGAG5nK6
         YI1UYVdey08565QpEgmN8aQLyBA6Thh7mwj3E358OGmUKUmFtWFQUkeEr9NF8TGHFWDl
         VNdGhxokhlVkxbgMQP6cYCp//HU/s31XSXTONo9t3NeuhaUUGn+Gs8XkPKLS/eMpczNY
         D7LJGaea1FBFSIUlRUuKui/+SihURAga5GyBoCudVHzizzkTNSNjo7yRNdbXD5/bnqH2
         Femw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3si18933038ybf.497.2021.03.09.02.46.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Mar 2021 02:46:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJZsM-0004OZ-Hc
	for alex.bennee@linaro.org; Tue, 09 Mar 2021 05:46:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lJZrt-0004Mv-R3; Tue, 09 Mar 2021 05:45:37 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:3602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lJZro-000630-Rc; Tue, 09 Mar 2021 05:45:37 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DvsJ50lpWz7kNc;
 Tue,  9 Mar 2021 18:43:33 +0800 (CST)
Received: from [10.174.185.226] (10.174.185.226) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Tue, 9 Mar 2021 18:45:12 +0800
To: <qemu-devel@nongnu.org>
References: <1614414831-39712-1-git-send-email-wangxingang5@huawei.com>
From: Wang Xingang <wangxingang5@huawei.com>
Subject: Re: [RFC RESEND PATCH 0/4] hw/arm/virt-acpi-build: Introduce iommu
 option for pci root bus
Message-ID: <3e354c2e-61cc-9d8f-886e-79f08a1f44f3@huawei.com>
Date: Tue, 9 Mar 2021 18:44:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1614414831-39712-1-git-send-email-wangxingang5@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=wangxingang5@huawei.com; helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: xieyingtai@huawei.com, peter.maydell@linaro.org, cenjiahui@huawei.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 marcel.apfelbaum@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LBJd+JgIEVqg

Hi, everyone! Do you have any suggestions? Please help review these 
patches, thanks very much.

On 2021/2/27 16:33, Wang Xingang wrote:
> From: Xingang Wang <wangxingang5@huawei.com>
> 
> These patches add support for configure iommu on/off for pci root bus,
> including primary bus and pxb root bus. At present, All root bus will go
> through iommu when iommu is configured, which is not flexible.
> 
> So this add option to enable/disable iommu for primary bus and pxb root bus.
> When iommu is enabled for the root bus, devices attached to it will go
> through iommu. When iommu is disabled for the root bus, devices will not
> go through iommu accordingly.
> 
> Xingang Wang (4):
>    pci: Add PCI_BUS_IOMMU property
>    hw/pci: Add iommu option for pci root bus
>    hw/pci: Add pci_root_bus_max_bus
>    hw/arm/virt-acpi-build: Add explicit idmap info in IORT table
> 
>   hw/arm/virt-acpi-build.c            | 92 +++++++++++++++++++++--------
>   hw/arm/virt.c                       | 29 +++++++++
>   hw/pci-bridge/pci_expander_bridge.c |  6 ++
>   hw/pci/pci.c                        | 35 ++++++++++-
>   include/hw/arm/virt.h               |  1 +
>   include/hw/pci/pci.h                |  1 +
>   include/hw/pci/pci_bus.h            | 13 ++++
>   7 files changed, 153 insertions(+), 24 deletions(-)
> 
