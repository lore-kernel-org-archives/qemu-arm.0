Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp107494njc;
        Thu, 5 Jun 2025 02:13:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVEd23kAJxkdeLiZYIDoylCkRhGDrbj55eFESxOb1O4oYZe6+DIWFC29y6kTSn0xGPa1y1Hj+lJegX4Fw==@linaro.org
X-Google-Smtp-Source: AGHT+IGCuEls8UBuXrpJrF1duWVO1JcbJ1OTjh3dZZfMKrSmT7Do4PjdjRz9VETAF6sSUHq4t38c
X-Received: by 2002:a05:6214:20a3:b0:6fa:a02d:506e with SMTP id 6a1803df08f44-6faffe9a174mr40288566d6.14.1749114828756;
        Thu, 05 Jun 2025 02:13:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749114828; cv=none;
        d=google.com; s=arc-20240605;
        b=fqHdK1HrUJOmWBNtHse84sb7H92u0KJ428hTureokXbnq35fuCgFTYxa290TviiH52
         95iZ2vty8ilhHrSRzyNmBugDY4o86e6RRrcqsNCTvWixWx9bJsWdT5kOI2qIleYPpt1G
         RxHt539ziTYpURjGz4yeRf0/OiGvnD7ZOjAL/cOdsdiTh5wm4NtNH2WEt5GtC8XhYcDj
         xByt4FBaJfwN3OplsLn9uo2FvuCrxvfDKobpadadc1Al+t9TBk2eo8rMZHIrYfBqkUHy
         RTOmAQRZWygNVJdO1Y8C297PgVmuHDXRL8A3iIXcTtbR6JP9Tj81OSUK5TiEeiTKIFcm
         eHNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=mcVuqByWhcIeIPikzMkKDKFUX7b6Fi548juUgAk9raU=;
        fh=Hzzgzoe1Dya5Ab5YDOqIqiF3z50UoB7d3IbEPO4uCcE=;
        b=VkOQ9rD0VKAqPN4GVyFDGhtcugJWqMj5tdjdF+TS437b9P/GghC4dlbVWtc5+HZAYP
         W1x6vGt/LCSP0h9E85oHC2/RV0VGbBec6M5ziYumV8puHDZvbfvE/eE8mGMKZ8i19l1C
         g0U4/zXykYEWdZ2PXwGjU6WzIqF4gc5lvqhCz9IHc5CfvMrzRi9WO8Y38U4cBjnCvBJD
         xT/Mx/0cO8fUhJVsKzpWolUF7mTEKZEcokrpzWkAMg+kZ7kMMXt+tRulQh6CDUqEfP0j
         m0PF/kQKzyacI/cK4sk320AUyvz2IyOK36Nshci9oZwiYjQnTc+Egu1+erVMfMdWTpY+
         4dqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FpHhMMo6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d09a10d760si1686338685a.75.2025.06.05.02.13.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 02:13:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FpHhMMo6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uN6fG-0006yX-IN; Thu, 05 Jun 2025 05:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uN6f9-0006xS-TC
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 05:13:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uN6f8-0000jk-DC
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 05:13:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749114804;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mcVuqByWhcIeIPikzMkKDKFUX7b6Fi548juUgAk9raU=;
 b=FpHhMMo6NrvgAMUGHoc1pybUQf8JY4g+yQMChuITSucamyLJAtrtvzBR6pBL21cyJsQII6
 jtKCQNDtS+rLPifVsBQxTrUZk2VZ62om5QNvDwV7LOSaJNP27RQH3dS9SdF/LJtun1ZcWQ
 2GUDSFFrPbOiJfRjNCdg0Uq76Kob99c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-LrFL0gvqOy6rj43KvrPm2g-1; Thu, 05 Jun 2025 05:13:21 -0400
X-MC-Unique: LrFL0gvqOy6rj43KvrPm2g-1
X-Mimecast-MFC-AGG-ID: LrFL0gvqOy6rj43KvrPm2g_1749114800
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a503f28b09so371802f8f.0
 for <qemu-arm@nongnu.org>; Thu, 05 Jun 2025 02:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749114800; x=1749719600;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mcVuqByWhcIeIPikzMkKDKFUX7b6Fi548juUgAk9raU=;
 b=nCqGZS6pqtaf+OUvVvTgeN0KDszAqdU/ZLaQHZAfUXU0MMgwIJxE6DTBFFSmql7KrO
 geoQOuGhqIcC0swTNZg9I2ktx7qVNtZSNy7AY6KGQ7d8p6tT9algRQE43glRcNSm5o74
 TuNiUeTNpkjhNFgB5NXNPHiozItiTVmMqjdU5I3c4GXYFBu15hO/4PTK9CMT9OLe8ZaO
 +ZosKJ1m7YyX2OSQrDt0OcaQVX65G9Q32zbSSQKIm92zuiGRX962UBz/rLdH3BUmuWcW
 boTP30f9c95UvA47ziqk+RX/ECPB3NgaEvg4O1lJ9nklkL8XtSAK2hM0H+57X+91k2tO
 HqPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXF/1uZJQo74Mf65HMgFHTOfinddjo1ND8Br1Qnqnf+/SFZ0vcCmP2GdsQuDYvxI3ki/65l2dzO6w==@nongnu.org
X-Gm-Message-State: AOJu0YwMhJXKtVKiDz1PGLtLs+eWOWAUG0Ez9K7VHc38vdBJ4YaKDd2g
 LF+T6H7MvFPd2JHu6PsbtAMbXiMdlzFz75P4t0cSTJL8AOivkFrOkbKtzUjQH6LfxIm3cg2CAIW
 EXbJULAyGAz7R+tkrkylH2JedU32ZwkN+ywq3vSMptKJ2wU2c7H/7Eg==
X-Gm-Gg: ASbGncuB6BaKcA3hwfCscGaiMF5sJrTlxbS+8ZaPtLiGG/1ZbUbSUtLRvRznM8nzOla
 /4rW3KnTgL9/5ji7WSNKApZwFv3KnML1SUHZELO1LxAml4vloqwc9vVgCVpaICNk55mva0I1pb4
 BlsL/BIgxgDw72rfqHzy8ornUG80BKwmmDY2Bs+GfjGH8VGkwHOItskGC23g6LpbZwXNZbSkA7r
 VnX/w0ETjspI7/EAP0EHGi+G7d/UeFsuCEWcp4S+fBwHrpCLFMtQHOk34PFZz0JsTevXKw7wFeg
 85EmHOtm6egpW9W/RcGid0sCkRUsFx6/ADho5JswfWU39kbXsVtmzra/BbE=
X-Received: by 2002:a05:6000:2302:b0:3a3:6478:e08 with SMTP id
 ffacd0b85a97d-3a526e13838mr2493545f8f.23.1749114799864; 
 Thu, 05 Jun 2025 02:13:19 -0700 (PDT)
X-Received: by 2002:a05:6000:2302:b0:3a3:6478:e08 with SMTP id
 ffacd0b85a97d-3a526e13838mr2493498f8f.23.1749114799394; 
 Thu, 05 Jun 2025 02:13:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe6cd15sm24351195f8f.39.2025.06.05.02.13.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 02:13:18 -0700 (PDT)
Message-ID: <9a9c70eb-6b2e-4bd5-b665-8b91ae06ae43@redhat.com>
Date: Thu, 5 Jun 2025 11:13:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] hw/arm/smmuv3: Check SMMUv3 has PCIe Root Complex
 association
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250602154110.48392-1-shameerali.kolothum.thodi@huawei.com>
 <20250602154110.48392-2-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250602154110.48392-2-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mlXpOWG-J7lOJjFmm7fzC012XANHMRbBlYZL2w-DVXk_1749114800
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.128,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: X5xgGluLG1ZL

Hi Shameer,

On 6/2/25 5:41 PM, Shameer Kolothum wrote:
> Although this change does not affect functionality at present, it is
> required when we add support for user-creatable SMMUv3 devices in
> future patches.
>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/smmuv3.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index ab67972353..7e934336c2 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -24,6 +24,7 @@
>  #include "hw/qdev-properties.h"
>  #include "hw/qdev-core.h"
>  #include "hw/pci/pci.h"
> +#include "hw/pci/pci_bridge.h"
>  #include "cpu.h"
>  #include "exec/target_page.h"
>  #include "trace.h"
> @@ -1881,6 +1882,13 @@ static void smmu_realize(DeviceState *d, Error **errp)
>      SMMUv3Class *c = ARM_SMMUV3_GET_CLASS(s);
>      SysBusDevice *dev = SYS_BUS_DEVICE(d);
>      Error *local_err = NULL;
> +    Object *bus;
> +
> +    bus = object_property_get_link(OBJECT(d), "primary-bus", &error_abort);
> +    if (!bus || !object_dynamic_cast(bus->parent, TYPE_PCI_HOST_BRIDGE)) {
> +        error_setg(errp, "SMMUv3 is not attached to any PCIe Root Complex!");
> +        return;
> +    }
>  
>      c->parent_realize(d, &local_err);
>      if (local_err) {

