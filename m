Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157F8CCF9F8
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 16:41:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFxbh-0006uY-MI; Mon, 03 Nov 2025 11:40:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vFxbf-0006tW-Ee
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 11:40:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vFxbZ-0001pv-M4
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 11:40:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762188026;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qYdigO7E7d/2aCy/B6THt/OXTaB8dbhzPGoVuPDxj84=;
 b=TjoHrAJUb+w3NPhxJsoxFdqrBrRnsD7Arc25KqWjFoFcDW+SD0p73XdK17LvIMryV9iSaH
 ngv5lCBds+UnvyOtFlWe0a+ZjhkT4EdNQDhSu4Dk+LkbBvSAZDg34esMxoqRcKA6xwNI36
 MnGdpNW+dvkCFhriUUp834iK3LLcekI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-B_Q4P8UWMkuKdcZGFD1chA-1; Mon, 03 Nov 2025 11:40:23 -0500
X-MC-Unique: B_Q4P8UWMkuKdcZGFD1chA-1
X-Mimecast-MFC-AGG-ID: B_Q4P8UWMkuKdcZGFD1chA_1762188022
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-475e032d81bso34398085e9.3
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 08:40:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762188022; x=1762792822;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qYdigO7E7d/2aCy/B6THt/OXTaB8dbhzPGoVuPDxj84=;
 b=DG6Uvl9TBRq88e3fUR562hVi2Z1muDRjM5PHgz4fiJAPC0QRxW8FVnK1DpHdofPRqW
 YDpGulrHK4fBs51HmWHffwJl8/l/XzW54JfWQKFIHGOM+4h4uuyRcVBtU6xvIbbQLS8G
 u7ixl6+0L6G0jkw4YSHYWa9oJmpZUiGvjVswRcPpMBu4zanKaJPXqtzs8h8HGqDhU0h3
 /QGiiB/jkHgTk3XtN9HHQsyvpANBkCpOntK+oI3sigyqa0GQOxCvYqHp+SVto1gLOGq4
 uVdDOBELH6yltXcBxAhoOGk4777YDhVzpXHS2lTOkscGMzGyc9CHPYXfLbkvzDocz2RB
 sPLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHRAgivQPQErNyC5QgxPyBVNtKonmMq2L7NhfwwlknD1EuoBGGvx2V3xKRdPyyy/Ri7ZV9rJ89Kg==@nongnu.org
X-Gm-Message-State: AOJu0Yz8to9ATKxPz9sFCItZ7vfcd3sTPbBUAxt+zeGuEuDSeFXcVlty
 7vFVCMechVILxZ2+3BkL4XPBQ2Frei8uI2d9cG9/j27S0z4h2yN4ME351767RCkkwfWCwUC3uQE
 tb0NBfIdakbxQNFsykwo94dlF0WTW94jeGMSMi7D+Gri6nhrqWg2qUQ==
X-Gm-Gg: ASbGncsMp148KdjF2d+gF5CpdwjVvPbTUOuwDh4K6CfBLD6ulnme/WXnB9HTSUoNzsa
 RC7QNwU4YnZcDQkD66tAFEEOWwB3sLoFgpGs13krLP11SLkz/+Gyz2iYUBsg/fBJ0UnqUE6l91p
 +2SojRtsNw2il5udDIY6wKueE2Obe67Ov8XbCZMzVNp8kEREGU8CNAuZqHCLFUNnGuTytA3lFGu
 qrRJpSYDVG2OBAaPICRmxis8bvEixpHTKwlVjJF5Pma2pKSS6FZzr5Dsz62YcByfnPJtwr5VmV6
 0ERigB/0sBb9/Xl/iWJ8d6GwhDtoEWwgqHdlBxT88sy4AF61fZ5wD9Wnbz297CJLb/Va339U/JD
 9HDHUW0hcyalaAXJDvO/b5YzMoR/iEfQOKmhgpfGjBlZ5Zg==
X-Received: by 2002:a05:600c:4447:b0:475:de68:3c2e with SMTP id
 5b1f17b1804b1-477308b0a80mr118011275e9.40.1762188022442; 
 Mon, 03 Nov 2025 08:40:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcmDmBDDTblegsTnzis97lGhsb1+OfuXi/Vp+c3nUXcADVV8mT/x//FbSMd+Cqs1qmqFWuTg==
X-Received: by 2002:a05:600c:4447:b0:475:de68:3c2e with SMTP id
 5b1f17b1804b1-477308b0a80mr118010915e9.40.1762188022021; 
 Mon, 03 Nov 2025 08:40:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c2e677csm164317705e9.3.2025.11.03.08.40.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 08:40:21 -0800 (PST)
Message-ID: <64dc9240-82cd-460a-8834-45590aec7f25@redhat.com>
Date: Mon, 3 Nov 2025 17:40:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/32] hw/pci/pci: Move pci_init_bus_master() after
 adding device to bus
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 kjaju@nvidia.com
References: <20251031105005.24618-1-skolothumtho@nvidia.com>
 <20251031105005.24618-8-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251031105005.24618-8-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PVT8XkbpMR-a1HwetCs0nL39Y9SVT5A909wSFBPJxMo_1762188022
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 10/31/25 11:49 AM, Shameer Kolothum wrote:
> During PCI hotplug, in do_pci_register_device(), pci_init_bus_master()
> is called before storing the pci_dev pointer in bus->devices[devfn].
>
> This causes a problem if pci_init_bus_master() (via its
> get_address_space() callback) attempts to retrieve the device using
> pci_find_device(), since the PCI device is not yet visible on the bus.
>
> Fix this by moving the pci_init_bus_master() call to after the device
> has been added to bus->devices[devfn].
>
> This prepares for a subsequent patch where the accel SMMUv3
> get_address_space() callback retrieves the pci_dev to identify the
> attached device type.
>
> No functional change intended.
>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/pci/pci.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index c9932c87e3..9693d7f10c 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1370,9 +1370,6 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
>      pci_dev->bus_master_as.max_bounce_buffer_size =
>          pci_dev->max_bounce_buffer_size;
>  
> -    if (phase_check(PHASE_MACHINE_READY)) {
> -        pci_init_bus_master(pci_dev);
> -    }
>      pci_dev->irq_state = 0;
>      pci_config_alloc(pci_dev);
>  
> @@ -1416,6 +1413,9 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
>      pci_dev->config_write = config_write;
>      bus->devices[devfn] = pci_dev;
>      pci_dev->version_id = 2; /* Current pci device vmstate version */
> +    if (phase_check(PHASE_MACHINE_READY)) {
> +        pci_init_bus_master(pci_dev);
> +    }
>      return pci_dev;
>  }
>  


