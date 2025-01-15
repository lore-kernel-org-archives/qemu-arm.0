Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3033288njn;
        Wed, 15 Jan 2025 04:37:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXCt4HLGpCHnKRPPwAOaFjqvkDZZS1woeT9rivAoYxKYX1Ih0gZh2qlUds/GZf5px1vD82/6NWtVZTZQA==@linaro.org
X-Google-Smtp-Source: AGHT+IFfPzf3s3BM56LrUqMt7ycunVUe7JesqEP3G+8CZDWRE9XTsrFIsuNyuQEGaoxUHbrEKO0y
X-Received: by 2002:ad4:5d64:0:b0:6d8:ad28:adbf with SMTP id 6a1803df08f44-6df9b22e522mr453836456d6.20.1736944658675;
        Wed, 15 Jan 2025 04:37:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736944658; cv=none;
        d=google.com; s=arc-20240605;
        b=efRanAVBURuWvYHhn1esK1AjbqA7Y7xZpobUGbRRkDLzobM/t/AnVXp6XXh2c3CrIn
         YmlQThVBUpHkFNQm2dpETMQtCOwsDRT1rnszSOSL0itHNuKNvnGTY4BIlQ9VMyaQ1aVR
         gTUbNMUS72T8I9mx/mb6GOemkSaBiCAC7zNbvPf4xKMldPtZETkmyHhsAohMmzkBpXMa
         v5G786yJNxTHbhYltoA4lWnQPyvIblHSKUFr0cxJGz1geSSRy+yITG/6zRKawZab6AHB
         SDeGsz3BAxVTmi0gxteK011pdQ6HFdA6g+NIGsQQ7FwiAxBlcc4ANR7yxbx4wME/t3jt
         DFcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=WiW6+0PvkZx1glp5edxgejY6afHVRDP8L188thMxibI=;
        fh=46z9R7gwG7AwzoatLgEO9aK7B5lN3oYxXvNoxoj4UpU=;
        b=Vdz/Xxz421eXftoZIaimDGGRnXkdz3nvbdPPXleyCqpkqaLtS/jkZ+Xj6k0k9r8b7l
         Rv8whdyeZAaPbBlYyat5krINKW1xtMNCiOKHVgl40lAWWFm8eLdo7MUw2AgXDpRvy3wK
         7junI6y2/t4KgPEwjUpKG7Hmpq5BEfLvQ4TAbpi8JYC08EGLoohXUpry5R9cncgbvV7Y
         L3NyvoHoTMdXmlLBRdLoX49TlnY7NxUulm785Sd4INroO4Dok5fkKK3G3YJdjsrxVtkW
         VZ3mjYU+o/NrajWJx3PtF5NaV0D1pA0m8n1DfzlFu44uisdNGgx9U/5hx6mg6pfRY3BI
         uPeQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=jpLltTIl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dfade98382si151770006d6.236.2025.01.15.04.37.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2025 04:37:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=jpLltTIl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tY2dx-0004sO-B0; Wed, 15 Jan 2025 07:37:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tY2du-0004rL-GJ
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 07:37:06 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tY2dr-0005Zy-8v
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 07:37:06 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2166022c5caso104043905ad.2
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2025 04:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1736944621; x=1737549421;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WiW6+0PvkZx1glp5edxgejY6afHVRDP8L188thMxibI=;
 b=jpLltTIleJjuVYXRmFn282EUtvwIWmjuR38hDIiG3pFqe6vKMCEbSbosotQkpLYUlQ
 Ew6kL2/7TRYpdmSiPtkA7jkLyrJ3bf02trszcn9s1LOUDRSAFlA3j2auatRDOsCkytx5
 gpcFVO9voGClUY1Zay8Xl369auShkl11WWYVBD7HyEFv0B+VGH+mRegWvy4lQYxNWHgF
 GieLxRJebcGProvm5hv7YVokRkbTJh79sV6djrwk8G6CZA+p3aBaIImITlOZ3qB+9mtV
 Oddc25x+XbR6D2RXIXs6yQ/IeQSThV+TwsFqnn/6vcpBccf8aHjUOpBsYF1w7FutITXu
 JSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736944621; x=1737549421;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WiW6+0PvkZx1glp5edxgejY6afHVRDP8L188thMxibI=;
 b=X8qDuWzHS8qbdN7s3o34/20EwIxUcBcpzyWdaMV3R9b/E5opDndl/Q4M3A1eIzJXsg
 ZmuGISE+mAoeOw9jbsXM8R4B7F+ZLSRThvDFvL8AefdxWCzo3SYbdslCcqR0/B91BHx1
 338b7heBcU1j153BMXgpRiWop4v8P/tYCK+w206lBhzOpAgJ1NWXvMCiozLJvoOlOELA
 iFjCNybEMdaFfVgzlhqp52+KLsMVua04CutloqAyoq+MZy5fD8cz/FC4SKuGS16KQsF0
 /897KPotp8dDh8zGy0+1HbW7OEF3QyDTrF1ZH1MJ5KF6z98ILVN9mXmifB7dSlSkcIt6
 HESg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeAwGpUSUHdJYgDmT+uNiof8t2IsbOIFQmnQvkgtHtNLC/dmIsrwXvcMRjAH+VpjI3Gd/exXg+SQ==@nongnu.org
X-Gm-Message-State: AOJu0YwrahekVDDM/I3+/KZQ2FqE8+2GDh20Hi+QPwgx4URDVZwpxvM2
 /LkYORmISlSGt4umxK21/qQGRLM9KOVj/oscFSzk3zho5i8qHt1s9h41JVrD+Ls=
X-Gm-Gg: ASbGncvEKw4zqKsYOl2LKPKbEP3mz0G/3GFDP/5t5UYas7L2ZqxO8pYLwjHHC7mWLSx
 BK5tkZZkKgfPbnDkco7Q3HbzgZjarx+pAhzu8z2HwtMK3Lo+6PdsuqMiNpwbbpwxURYEc1UKHvw
 oiEoMaqh+firLmjtZ9P5mE77wyufHynB5ZEhI2cpyZb0fIpj3Sya7++8r6/8ZsvoVu7wRLRWFMZ
 b+Lc6ROiDUxSjJwAPrwljfog6stQKuH0FqG4+D8JDRoxntHXXu4URrfy4X/cOe8/hNJ5A==
X-Received: by 2002:a17:903:18b:b0:216:239e:f90f with SMTP id
 d9443c01a7336-21a83fde258mr413907225ad.37.1736944621484; 
 Wed, 15 Jan 2025 04:37:01 -0800 (PST)
Received: from [157.82.207.107] ([157.82.207.107])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a9f2339dasm80232685ad.177.2025.01.15.04.36.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 04:37:01 -0800 (PST)
Message-ID: <3e63e84a-d57f-4e03-ad89-e8efda20ba32@daynix.com>
Date: Wed, 15 Jan 2025 21:36:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 08/11] hw/vmapple/virtio-blk: Add support for apple
 virtio-blk
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 mst@redhat.com, stefanha@redhat.com, kwolf@redhat.com, hreitz@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 marcandre.lureau@redhat.com, philmd@linaro.org, eblake@redhat.com,
 armbru@redhat.com, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Alexander Graf <graf@amazon.com>
References: <20250112210056.16658-1-phil@philjordan.eu>
 <20250112210056.16658-9-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250112210056.16658-9-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 31bpsoMMK6GA

On 2025/01/13 6:00, Phil Dennis-Jordan wrote:
> From: Alexander Graf <graf@amazon.com>
> 
> Apple has its own virtio-blk PCI device ID where it deviates from the
> official virtio-pci spec slightly: It puts a new "apple type"
> field at a static offset in config space and introduces a new barrier
> command.
> 
> This patch first creates a mechanism for virtio-blk downstream classes to
> handle unknown commands. It then creates such a downstream class and a new
> vmapple-virtio-blk-pci class which support the additional apple type config
> identifier as well as the barrier command.
> 
> The 'aux' or 'root' device type are selected using the 'variant' property.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> 
> v4:
> 
>   * Use recommended object type declaration pattern.
>   * Correctly log unimplemented code paths.
>   * Most header code moved to .c, type name #defines moved to vmapple.h
> 
> v5:
> 
>   * Corrected handling of potentially unaligned writes to virtio config area.
>   * Simplified passing through device variant type to subobject.
> 
> v9:
> 
>   * Correctly specify class_size for VMAppleVirtIOBlkClass
> 
> v10:
> 
>   * Folded v9 patch 16/16 into this one, changing the device type design to
>     provide a single device type with a variant property instead of 2 different
>     subtypes for aux and root volumes.
>   * Tidied up error reporting for the variant property.
> 
> v15:
> 
>   * Constified the property table.
> 
> v16:
> 
>   * Removed the DEFINE_PROP_END_OF_LIST marker to match recent upstream
>     changes.
> 
> ---
>   hw/block/virtio-blk.c               |  19 ++-
>   hw/core/qdev-properties-system.c    |   8 ++
>   hw/vmapple/Kconfig                  |   3 +
>   hw/vmapple/meson.build              |   1 +
>   hw/vmapple/virtio-blk.c             | 204 ++++++++++++++++++++++++++++
>   include/hw/pci/pci_ids.h            |   1 +
>   include/hw/qdev-properties-system.h |   5 +
>   include/hw/virtio/virtio-blk.h      |  11 +-
>   include/hw/vmapple/vmapple.h        |   2 +
>   qapi/virtio.json                    |  14 ++
>   10 files changed, 263 insertions(+), 5 deletions(-)
>   create mode 100644 hw/vmapple/virtio-blk.c
> 
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index e0acce89e1..4d27afabf0 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -50,7 +50,7 @@ static void virtio_blk_init_request(VirtIOBlock *s, VirtQueue *vq,
>       req->mr_next = NULL;
>   }
>   
> -static void virtio_blk_req_complete(VirtIOBlockReq *req, unsigned char status)
> +void virtio_blk_req_complete(VirtIOBlockReq *req, unsigned char status)
>   {
>       VirtIOBlock *s = req->dev;
>       VirtIODevice *vdev = VIRTIO_DEVICE(s);
> @@ -71,7 +71,7 @@ static void virtio_blk_req_complete(VirtIOBlockReq *req, unsigned char status)
>   static int virtio_blk_handle_rw_error(VirtIOBlockReq *req, int error,
>       bool is_read, bool acct_failed)
>   {
> -    VirtIOBlock *s = req->dev;
> +VirtIOBlock *s = req->dev;

It seems you broke the indention here while rebasing.

>       BlockErrorAction action = blk_get_error_action(s->blk, is_read, error);
>   
>       if (action == BLOCK_ERROR_ACTION_STOP) {
> @@ -961,8 +961,18 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
>           break;
>       }
>       default:
> -        virtio_blk_req_complete(req, VIRTIO_BLK_S_UNSUPP);
> -        g_free(req);
> +    {
> +        /*
> +         * Give subclasses a chance to handle unknown requests. This way the
> +         * class lookup is not in the hot path.
> +         */
> +        VirtIOBlkClass *vbk = VIRTIO_BLK_GET_CLASS(s);
> +        if (!vbk->handle_unknown_request ||
> +            !vbk->handle_unknown_request(req, mrb, type)) {
> +            virtio_blk_req_complete(req, VIRTIO_BLK_S_UNSUPP);
> +            g_free(req);
> +        }
> +    }
>       }
>       return 0;
>   }
> @@ -2038,6 +2048,7 @@ static const TypeInfo virtio_blk_info = {
>       .instance_size = sizeof(VirtIOBlock),
>       .instance_init = virtio_blk_instance_init,
>       .class_init = virtio_blk_class_init,
> +    .class_size = sizeof(VirtIOBlkClass),
>   };
>   
>   static void virtio_register_types(void)
> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
> index a96675beb0..6be44ddb46 100644
> --- a/hw/core/qdev-properties-system.c
> +++ b/hw/core/qdev-properties-system.c
> @@ -1283,3 +1283,11 @@ const PropertyInfo qdev_prop_iothread_vq_mapping_list = {
>       .set = set_iothread_vq_mapping_list,
>       .release = release_iothread_vq_mapping_list,
>   };
> +
> +const PropertyInfo qdev_prop_vmapple_virtio_blk_variant = {
> +    .name  = "VMAppleVirtioBlkVariant",
> +    .enum_table  = &VMAppleVirtioBlkVariant_lookup,
> +    .get   = qdev_propinfo_get_enum,
> +    .set   = qdev_propinfo_set_enum,
> +    .set_default_value = qdev_propinfo_set_default_value_enum,
> +};
> diff --git a/hw/vmapple/Kconfig b/hw/vmapple/Kconfig
> index 8bbeb9a923..bcd1be63e3 100644
> --- a/hw/vmapple/Kconfig
> +++ b/hw/vmapple/Kconfig
> @@ -7,3 +7,6 @@ config VMAPPLE_BDIF
>   config VMAPPLE_CFG
>       bool
>   
> +config VMAPPLE_VIRTIO_BLK
> +    bool
> +
> diff --git a/hw/vmapple/meson.build b/hw/vmapple/meson.build
> index 64b78693a3..bf17cf906c 100644
> --- a/hw/vmapple/meson.build
> +++ b/hw/vmapple/meson.build
> @@ -1,3 +1,4 @@
>   system_ss.add(when: 'CONFIG_VMAPPLE_AES',  if_true: files('aes.c'))
>   system_ss.add(when: 'CONFIG_VMAPPLE_BDIF', if_true: files('bdif.c'))
>   system_ss.add(when: 'CONFIG_VMAPPLE_CFG',  if_true: files('cfg.c'))
> +system_ss.add(when: 'CONFIG_VMAPPLE_VIRTIO_BLK',  if_true: files('virtio-blk.c'))
> diff --git a/hw/vmapple/virtio-blk.c b/hw/vmapple/virtio-blk.c
> new file mode 100644
> index 0000000000..6b434b8842
> --- /dev/null
> +++ b/hw/vmapple/virtio-blk.c
> @@ -0,0 +1,204 @@
> +/*
> + * VMApple specific VirtIO Block implementation
> + *
> + * Copyright © 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * VMApple uses almost standard VirtIO Block, but with a few key differences:
> + *
> + *  - Different PCI device/vendor ID
> + *  - An additional "type" identifier to differentiate AUX and Root volumes
> + *  - An additional BARRIER command
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/vmapple/vmapple.h"
> +#include "hw/virtio/virtio-blk.h"
> +#include "hw/virtio/virtio-pci.h"
> +#include "qemu/bswap.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "qapi/error.h"
> +
> +#define TYPE_VMAPPLE_VIRTIO_BLK  "vmapple-virtio-blk"
> +OBJECT_DECLARE_TYPE(VMAppleVirtIOBlk, VMAppleVirtIOBlkClass, VMAPPLE_VIRTIO_BLK)
> +
> +typedef struct VMAppleVirtIOBlkClass {
> +    VirtIOBlkClass parent;
> +
> +    void (*get_config)(VirtIODevice *vdev, uint8_t *config);
> +} VMAppleVirtIOBlkClass;
> +
> +typedef struct VMAppleVirtIOBlk {
> +    VirtIOBlock parent_obj;
> +
> +    uint32_t apple_type;
> +} VMAppleVirtIOBlk;
> +
> +/*
> + * vmapple-virtio-blk-pci: This extends VirtioPCIProxy.
> + */
> +OBJECT_DECLARE_SIMPLE_TYPE(VMAppleVirtIOBlkPCI, VMAPPLE_VIRTIO_BLK_PCI)
> +
> +#define VIRTIO_BLK_T_APPLE_BARRIER     0x10000
> +
> +static bool vmapple_virtio_blk_handle_unknown_request(VirtIOBlockReq *req,
> +                                                      MultiReqBuffer *mrb,
> +                                                      uint32_t type)
> +{
> +    switch (type) {
> +    case VIRTIO_BLK_T_APPLE_BARRIER:
> +        qemu_log_mask(LOG_UNIMP, "%s: Barrier requests are currently no-ops\n",
> +                      __func__);
> +        virtio_blk_req_complete(req, VIRTIO_BLK_S_OK);
> +        g_free(req);
> +        return true;
> +    default:
> +        return false;
> +    }
> +}
> +
> +/*
> + * VMApple virtio-blk uses the same config format as normal virtio, with one
> + * exception: It adds an "apple type" specififer at the same location that
> + * the spec reserves for max_secure_erase_sectors. Let's hook into the
> + * get_config code path here, run it as usual and then patch in the apple type.
> + */
> +static void vmapple_virtio_blk_get_config(VirtIODevice *vdev, uint8_t *config)
> +{
> +    VMAppleVirtIOBlk *dev = VMAPPLE_VIRTIO_BLK(vdev);
> +    VMAppleVirtIOBlkClass *vvbk = VMAPPLE_VIRTIO_BLK_GET_CLASS(dev);
> +    struct virtio_blk_config *blkcfg = (struct virtio_blk_config *)config;
> +
> +    vvbk->get_config(vdev, config);
> +
> +    g_assert(dev->parent_obj.config_size >= endof(struct virtio_blk_config, zoned));
> +
> +    /* Apple abuses the field for max_secure_erase_sectors as type id */
> +    stl_he_p(&blkcfg->max_secure_erase_sectors, dev->apple_type);
> +}
> +
> +static void vmapple_virtio_blk_class_init(ObjectClass *klass, void *data)
> +{
> +    VirtIOBlkClass *vbk = VIRTIO_BLK_CLASS(klass);
> +    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
> +    VMAppleVirtIOBlkClass *vvbk = VMAPPLE_VIRTIO_BLK_CLASS(klass);
> +
> +    vbk->handle_unknown_request = vmapple_virtio_blk_handle_unknown_request;
> +    vvbk->get_config = vdc->get_config;
> +    vdc->get_config = vmapple_virtio_blk_get_config;
> +}
> +
> +static const TypeInfo vmapple_virtio_blk_info = {
> +    .name          = TYPE_VMAPPLE_VIRTIO_BLK,
> +    .parent        = TYPE_VIRTIO_BLK,
> +    .instance_size = sizeof(VMAppleVirtIOBlk),
> +    .class_size    = sizeof(VMAppleVirtIOBlkClass),
> +    .class_init    = vmapple_virtio_blk_class_init,
> +};
> +
> +/* PCI Devices */
> +
> +struct VMAppleVirtIOBlkPCI {
> +    VirtIOPCIProxy parent_obj;
> +    VMAppleVirtIOBlk vdev;
> +    VMAppleVirtioBlkVariant variant;
> +};
> +
> +
> +static const Property vmapple_virtio_blk_pci_properties[] = {
> +    DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
> +    DEFINE_PROP_BIT("ioeventfd", VirtIOPCIProxy, flags,
> +                    VIRTIO_PCI_FLAG_USE_IOEVENTFD_BIT, true),
> +    DEFINE_PROP_UINT32("vectors", VirtIOPCIProxy, nvectors,
> +                       DEV_NVECTORS_UNSPECIFIED),
> +    DEFINE_PROP_VMAPPLE_VIRTIO_BLK_VARIANT("variant", VMAppleVirtIOBlkPCI, variant,
> +                                           VM_APPLE_VIRTIO_BLK_VARIANT_UNSPECIFIED),
> +};
> +
> +static void vmapple_virtio_blk_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
> +{
> +    ERRP_GUARD();
> +    VMAppleVirtIOBlkPCI *dev = VMAPPLE_VIRTIO_BLK_PCI(vpci_dev);
> +    DeviceState *vdev = DEVICE(&dev->vdev);
> +    VirtIOBlkConf *conf = &dev->vdev.parent_obj.conf;
> +
> +    if (dev->variant == VM_APPLE_VIRTIO_BLK_VARIANT_UNSPECIFIED) {
> +        error_setg(errp, "vmapple virtio block device variant unspecified");
> +        error_append_hint(errp,
> +                          "Variant property must be set to 'aux' or 'root'.\n"
> +                          "Use a regular virtio-blk-pci device instead when "
> +                          "neither is applicaple.\n");
> +        return;
> +    }
> +
> +    if (conf->num_queues == VIRTIO_BLK_AUTO_NUM_QUEUES) {
> +        conf->num_queues = virtio_pci_optimal_num_queues(0);
> +    }
> +
> +    if (vpci_dev->nvectors == DEV_NVECTORS_UNSPECIFIED) {
> +        vpci_dev->nvectors = conf->num_queues + 1;
> +    }
> +
> +    /*
> +     * We don't support zones, but we need the additional config space size.
> +     * Let's just expose the feature so the rest of the virtio-blk logic
> +     * allocates enough space for us. The guest will ignore zones anyway.
> +     */
> +    virtio_add_feature(&dev->vdev.parent_obj.host_features, VIRTIO_BLK_F_ZONED);
> +    /* Propagate the apple type down to the virtio-blk device */
> +    dev->vdev.apple_type = dev->variant;
> +    /* and spawn the virtio-blk device */
> +    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
> +
> +    /*
> +     * The virtio-pci machinery adjusts its vendor/device ID based on whether
> +     * we support modern or legacy virtio. Let's patch it back to the Apple
> +     * identifiers here.
> +     */
> +    pci_config_set_vendor_id(vpci_dev->pci_dev.config, PCI_VENDOR_ID_APPLE);
> +    pci_config_set_device_id(vpci_dev->pci_dev.config,
> +                             PCI_DEVICE_ID_APPLE_VIRTIO_BLK);
> +}
> +
> +static void vmapple_virtio_blk_pci_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
> +    PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
> +
> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
> +    device_class_set_props(dc, vmapple_virtio_blk_pci_properties);
> +    k->realize = vmapple_virtio_blk_pci_realize;
> +    pcidev_k->vendor_id = PCI_VENDOR_ID_APPLE;
> +    pcidev_k->device_id = PCI_DEVICE_ID_APPLE_VIRTIO_BLK;
> +    pcidev_k->revision = VIRTIO_PCI_ABI_VERSION;
> +    pcidev_k->class_id = PCI_CLASS_STORAGE_SCSI;
> +}
> +
> +static void vmapple_virtio_blk_pci_instance_init(Object *obj)
> +{
> +    VMAppleVirtIOBlkPCI *dev = VMAPPLE_VIRTIO_BLK_PCI(obj);
> +
> +    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
> +                                TYPE_VMAPPLE_VIRTIO_BLK);
> +}
> +
> +static const VirtioPCIDeviceTypeInfo vmapple_virtio_blk_pci_info = {
> +    .generic_name  = TYPE_VMAPPLE_VIRTIO_BLK_PCI,
> +    .instance_size = sizeof(VMAppleVirtIOBlkPCI),
> +    .instance_init = vmapple_virtio_blk_pci_instance_init,
> +    .class_init    = vmapple_virtio_blk_pci_class_init,
> +};
> +
> +static void vmapple_virtio_blk_register_types(void)
> +{
> +    type_register_static(&vmapple_virtio_blk_info);
> +    virtio_pci_types_register(&vmapple_virtio_blk_pci_info);
> +}
> +
> +type_init(vmapple_virtio_blk_register_types)
> diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
> index f1a53fea8d..33e2898be9 100644
> --- a/include/hw/pci/pci_ids.h
> +++ b/include/hw/pci/pci_ids.h
> @@ -191,6 +191,7 @@
>   #define PCI_DEVICE_ID_APPLE_UNI_N_AGP    0x0020
>   #define PCI_DEVICE_ID_APPLE_U3_AGP       0x004b
>   #define PCI_DEVICE_ID_APPLE_UNI_N_GMAC   0x0021
> +#define PCI_DEVICE_ID_APPLE_VIRTIO_BLK   0x1a00
>   
>   #define PCI_VENDOR_ID_SUN                0x108e
>   #define PCI_DEVICE_ID_SUN_EBUS           0x1000
> diff --git a/include/hw/qdev-properties-system.h b/include/hw/qdev-properties-system.h
> index 7ec37f6316..3631e30969 100644
> --- a/include/hw/qdev-properties-system.h
> +++ b/include/hw/qdev-properties-system.h
> @@ -30,6 +30,7 @@ extern const PropertyInfo qdev_prop_pcie_link_speed;
>   extern const PropertyInfo qdev_prop_pcie_link_width;
>   extern const PropertyInfo qdev_prop_cpus390entitlement;
>   extern const PropertyInfo qdev_prop_iothread_vq_mapping_list;
> +extern const PropertyInfo qdev_prop_vmapple_virtio_blk_variant;
>   
>   #define DEFINE_PROP_PCI_DEVFN(_n, _s, _f, _d)                   \
>       DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_pci_devfn, int32_t)
> @@ -97,4 +98,8 @@ extern const PropertyInfo qdev_prop_iothread_vq_mapping_list;
>       DEFINE_PROP(_name, _state, _field, qdev_prop_iothread_vq_mapping_list, \
>                   IOThreadVirtQueueMappingList *)
>   
> +#define DEFINE_PROP_VMAPPLE_VIRTIO_BLK_VARIANT(_n, _s, _f, _d) \
> +    DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_vmapple_virtio_blk_variant, \
> +                       VMAppleVirtioBlkVariant)
> +
>   #endif
> diff --git a/include/hw/virtio/virtio-blk.h b/include/hw/virtio/virtio-blk.h
> index 8a16218c40..3d8dee7ec1 100644
> --- a/include/hw/virtio/virtio-blk.h
> +++ b/include/hw/virtio/virtio-blk.h
> @@ -24,7 +24,7 @@
>   #include "qapi/qapi-types-virtio.h"
>   
>   #define TYPE_VIRTIO_BLK "virtio-blk-device"
> -OBJECT_DECLARE_SIMPLE_TYPE(VirtIOBlock, VIRTIO_BLK)
> +OBJECT_DECLARE_TYPE(VirtIOBlock, VirtIOBlkClass, VIRTIO_BLK)
>   
>   /* This is the last element of the write scatter-gather list */
>   struct virtio_blk_inhdr
> @@ -100,6 +100,15 @@ typedef struct MultiReqBuffer {
>       bool is_write;
>   } MultiReqBuffer;
>   
> +typedef struct VirtIOBlkClass {
> +    /*< private >*/
> +    VirtioDeviceClass parent;
> +    /*< public >*/
> +    bool (*handle_unknown_request)(VirtIOBlockReq *req, MultiReqBuffer *mrb,
> +                                   uint32_t type);
> +} VirtIOBlkClass;
> +
>   void virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq);
> +void virtio_blk_req_complete(VirtIOBlockReq *req, unsigned char status);
>   
>   #endif
> diff --git a/include/hw/vmapple/vmapple.h b/include/hw/vmapple/vmapple.h
> index 3bba59f5ec..9c1ad1bd8c 100644
> --- a/include/hw/vmapple/vmapple.h
> +++ b/include/hw/vmapple/vmapple.h
> @@ -18,4 +18,6 @@
>   
>   #define TYPE_VMAPPLE_CFG "vmapple-cfg"
>   
> +#define TYPE_VMAPPLE_VIRTIO_BLK_PCI "vmapple-virtio-blk-pci"
> +
>   #endif /* HW_VMAPPLE_VMAPPLE_H */
> diff --git a/qapi/virtio.json b/qapi/virtio.json
> index 2529c2d8b2..d351d2166e 100644
> --- a/qapi/virtio.json
> +++ b/qapi/virtio.json
> @@ -992,3 +992,17 @@
>   ##
>   { 'enum': 'GranuleMode',
>     'data': [ '4k', '8k', '16k', '64k', 'host' ] }
> +
> +##
> +# @VMAppleVirtioBlkVariant:
> +#
> +# @unspecified: The default, not a valid setting.
> +#
> +# @root: Block device holding the root volume
> +#
> +# @aux: Block device holding auxiliary data required for boot
> +#
> +# Since: 9.2
> +##
> +{ 'enum': 'VMAppleVirtioBlkVariant',
> +  'data': [ 'unspecified', 'root', 'aux' ] }

