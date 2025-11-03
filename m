Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AC2CCF9F8
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 14:26:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFvV8-0003h9-OK; Mon, 03 Nov 2025 09:25:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vFvV7-0003h1-Fp
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 09:25:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vFvV5-0001Mw-3V
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 09:25:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762179933;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rFsUwPUqdy8CnxzDFCH1DPu8CHXHZvk/F0AvAt+eUgc=;
 b=RyPxF9StcKGr9KyOe9bP2T2iSE9yJFhAn7EMERBCP5lAW8eKdlhg9WN+htzV+GZ4fkn1Pb
 WqMGOnHMOOflgugdp2ve1jbI+ud0S08ettRYSmiGFGUHWkwRM0QLD6CI5Z/iCQUIZTs/ON
 vdfq7NvlPZltcO2wxNB7gFbfNZHBMGY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-Vpp4BkYfM2Wf6io59F91Nw-1; Mon, 03 Nov 2025 09:25:32 -0500
X-MC-Unique: Vpp4BkYfM2Wf6io59F91Nw-1
X-Mimecast-MFC-AGG-ID: Vpp4BkYfM2Wf6io59F91Nw_1762179931
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-429cce847c4so819814f8f.2
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 06:25:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762179931; x=1762784731;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rFsUwPUqdy8CnxzDFCH1DPu8CHXHZvk/F0AvAt+eUgc=;
 b=HvH92HfraXepKXrNqRrHRgnJUH/yJZXV4nbZ/5usNBwhpru4CpWzXg2BF48wfFDflk
 PxC3GPUAsMMXHQ/MULg2xXIE2fKVme6/nHx1VNOmKfKe3FYE5OgGLU01wMGFQ9ZWNDbx
 giiPOIquZ+wxK52RONJfTEEgUmLDWhLNd1ILsjD4RZKzYD0RpzAIAm97gZb81OBRoeDt
 42UIBAcwbhp1u7LXqJvyFQ4pJeTWfwZiy0kCmzKAFE/6PUf9KYVxcgkLSpt6uaVKpH13
 5HkyogpxVKTR9j2EEAO526q7gtFohjEAZE85CJLuHwVUoqaBYGeq9moLjnbuYdUGX6/r
 8/0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNgziTq3YdTNJVjkWAxslu7xIrA+LeFH0lHMtDz8loMw3gTCqv9ZLnSjn48l6G1tO0YsvQdLv83Q==@nongnu.org
X-Gm-Message-State: AOJu0Yy2k5rcmqrPUfYLkxop8o/n3WeB3/cQ5JADZQwLu0Fcsn/1CccN
 ODIKzFZaGYmpmA1FJYdIiHqeFmSIq+vm40z+Go0xC89ddXB0Do0Xo9R652YJia3yQPmDfD4fT8c
 77CptFyJ/BHXrfn71dN1RtuY2g3Ctz4iEeZZPa98/NUxpUh7e28bxuw==
X-Gm-Gg: ASbGncuN5cQsCTA6Lh3POkcGqlwl3syvFxSMkeTXgxO/YZgXvufn3O/277BFg/DdJHu
 gHtFkvWobZRjWHvF2vqR/tgiral78sZ5YHxtwxFDos2O+zMYeWUPjkAnAFTltzSXjlFdHF83UnN
 iveJxRVnSvBoPQ24CK3YeIYO2PGRssaWBstJRp/2dn7yIhL6We8HnKtpfF7P0FEkUQG35HqYEzg
 +sMngCK5b4xOyYClmlHbU13+5fpHfQDfHB9putXH4EpirfqRp2YK3kVLEHfCifOjndaozO+gQDj
 Dgkhhxpfxoh5XlevmCPSXRI7TVNubk3kIvmRJuoqiMqxe3QFYMEr0OTlqTFLFADzlUKXN+mTQA3
 5Rrsc90G2uFe1Cu3RcbKgCrESrliAJ32t/eirqgHaKWDiNg==
X-Received: by 2002:a05:6000:4024:b0:429:8d6b:16f7 with SMTP id
 ffacd0b85a97d-429bd68c553mr11133190f8f.25.1762179930757; 
 Mon, 03 Nov 2025 06:25:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEuh5Kgajp0Kkx6M5ylzPvLWRZ6Nr/ZQ8+A+NpjNK1vlCKY3osI5GIaWZKt0MZG7ry9+x098w==
X-Received: by 2002:a05:6000:4024:b0:429:8d6b:16f7 with SMTP id
 ffacd0b85a97d-429bd68c553mr11133139f8f.25.1762179930261; 
 Mon, 03 Nov 2025 06:25:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429cfa27886sm9746719f8f.44.2025.11.03.06.25.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 06:25:29 -0800 (PST)
Message-ID: <e86bed4f-5550-40ec-bc38-093eae87e856@redhat.com>
Date: Mon, 3 Nov 2025 15:25:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/32] hw/pci-bridge/pci_expander_bridge: Move
 TYPE_PXB_PCIE_DEV to header
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 kjaju@nvidia.com
References: <20251031105005.24618-1-skolothumtho@nvidia.com>
 <20251031105005.24618-10-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251031105005.24618-10-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gtKEBsvHbchzxa5ipAl6xjbBo17Ijmc15ZaeLuyBHvg_1762179931
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
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> Move the TYPE_PXB_PCIE_DEV definition to header so that it can be
> referenced by other code in subsequent patch.
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/pci-bridge/pci_expander_bridge.c | 1 -
>  include/hw/pci/pci_bridge.h         | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
> index 1bcceddbc4..a8eb2d2426 100644
> --- a/hw/pci-bridge/pci_expander_bridge.c
> +++ b/hw/pci-bridge/pci_expander_bridge.c
> @@ -48,7 +48,6 @@ struct PXBBus {
>      char bus_path[8];
>  };
>  
> -#define TYPE_PXB_PCIE_DEV "pxb-pcie"
>  OBJECT_DECLARE_SIMPLE_TYPE(PXBPCIEDev, PXB_PCIE_DEV)
>  
>  static GList *pxb_dev_list;
> diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
> index a055fd8d32..b61360b900 100644
> --- a/include/hw/pci/pci_bridge.h
> +++ b/include/hw/pci/pci_bridge.h
> @@ -106,6 +106,7 @@ typedef struct PXBPCIEDev {
>  
>  #define TYPE_PXB_PCIE_BUS "pxb-pcie-bus"
>  #define TYPE_PXB_CXL_BUS "pxb-cxl-bus"
> +#define TYPE_PXB_PCIE_DEV "pxb-pcie"
>  #define TYPE_PXB_DEV "pxb"
>  OBJECT_DECLARE_SIMPLE_TYPE(PXBDev, PXB_DEV)
>  


