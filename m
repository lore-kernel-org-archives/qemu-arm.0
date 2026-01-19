Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444ACD29C2D
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Jan 2026 14:06:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vhptf-0004BU-0T; Mon, 19 Jan 2026 09:06:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vhptT-0003pR-AE
 for qemu-arm@nongnu.org; Mon, 19 Jan 2026 09:06:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vhptR-0006XA-Bb
 for qemu-arm@nongnu.org; Mon, 19 Jan 2026 09:06:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768831566;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ICCTMnjrU73v4nBR3EVR2zTSJwnG39AXJqrZBQY8Hg=;
 b=dGZQhKTZ5N6i6RPbDqLWk0s7ENeiot41Jh7E9JjPdtGvs9KQvxh+JFnDKoQwK6AtRBwbdR
 QJAub8MOvLJS5tOeQFTw6a8Vkbg3D8XWYvYevMAEGw3TxpG4Vj14n/68TkBvbQd0MROL93
 +MZXSlPVr0R0f2FVO1woMZmUGBtI/+I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-lep40TuQNH22kT1AF_7Wig-1; Mon, 19 Jan 2026 09:06:05 -0500
X-MC-Unique: lep40TuQNH22kT1AF_7Wig-1
X-Mimecast-MFC-AGG-ID: lep40TuQNH22kT1AF_7Wig_1768831564
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-43284edbbc8so3519277f8f.0
 for <qemu-arm@nongnu.org>; Mon, 19 Jan 2026 06:06:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768831564; x=1769436364;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+ICCTMnjrU73v4nBR3EVR2zTSJwnG39AXJqrZBQY8Hg=;
 b=tff2qSaIJknNCBg1VxGqpBucipDxh3E326KKdchN3/zaEnQhSx95zfduYXljfrTA/y
 IPdMsvuNwLAICIXiap8lMaZq/6dXWUqaY4nf/r1OEpXoFnU3hracJ9RO5fgwuHa2XFe+
 I5k6yOs0B0VXSPY+rtwT67b46jpncrVEMjrkkPvfHxeq2ddotYgQphbEmtAftVjoWFpd
 myXOcK6+BRNejMxlRi2VKtMcouyRndHvJ8KSUXXmrCtprPZ7i3priXAGA8evrb98ltgL
 UyWUwE9sG9PxUJaayWRniAvtZjdzovn7S+eleaUO+wlXjY+AwYDA3qtglna0McEChzDf
 Cjyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIkS59oesvjApxg9jnmSEepXwT6gSkKJK+DrX4+3QfW2RcS1KK8J54yobxlsmh4ubMnRrO8Z10TA==@nongnu.org
X-Gm-Message-State: AOJu0YwAoB+vFiP4bKcwHqajz04oWbkfgpSthOpz4W0tEikK0/7iMwZJ
 a4ytn6TiJ4KE0D7UhxlUVQ0hZO8ECpR+1WoxhnK0o5WYNi0yE0Akj3sIAehiJZgyb++N28S9ci/
 v3fjBR3cPWB5SBapLRq5yWUZxZAo7dHKRsIspnU7uZAaranyOmYw1dg==
X-Gm-Gg: AZuq6aL3+aKaBmHGSLxD9c6fucFeCWegs5Ll2m2wnCjYBA5zDT5NgttnVGgI5xFvztt
 gmPJEpiIybftrHxieplJHV20vKd5/+x8nNIh4gc4IN9KFjPzzvc00wmWqEuHPMtIQup8BxtMNFo
 gKcb/O7vc2iTW0ksS72fxCSmDrWNqvPogE2jm48oZmlasEN1jzpYd9noMum1byxEx0l/3rsJ3d7
 IGV4q1IWZNUXfyszHlGpSa1qDmktlgBOPDx086x4+aYboU2TMEYnf91DrLhS80fHs/7nlsew2PY
 poESn/lDSfFiFYtrP55E0UCpcal9vhySLAufcDU+tpI/FY06ZWcOk4HtNPtgw011/+rpTsaz1zm
 UYqHRsGB11fO7PFS6vEqhtsGUrfPq/S34OBXUOzpHMDkLtxHExlHEj1ob8Q==
X-Received: by 2002:a05:6000:26d1:b0:430:f494:6aad with SMTP id
 ffacd0b85a97d-4356996f2damr13625925f8f.2.1768831564071; 
 Mon, 19 Jan 2026 06:06:04 -0800 (PST)
X-Received: by 2002:a05:6000:26d1:b0:430:f494:6aad with SMTP id
 ffacd0b85a97d-4356996f2damr13625859f8f.2.1768831563547; 
 Mon, 19 Jan 2026 06:06:03 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569926648sm24210514f8f.10.2026.01.19.06.06.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 06:06:03 -0800 (PST)
Message-ID: <45e53597-9117-4d68-b7e5-d80e5f28bc12@redhat.com>
Date: Mon, 19 Jan 2026 15:06:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 32/36] backends/iommufd: Add get_pasid_info() callback
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, clg@redhat.com, alex@shazbot.org,
 nathanc@nvidia.com, mochs@nvidia.com, smostafa@google.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, yi.l.liu@intel.com, kjaju@nvidia.com
References: <20260111195508.106943-1-skolothumtho@nvidia.com>
 <20260111195508.106943-33-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260111195508.106943-33-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pmwAEmGXD1OcxuSWm4tmo6Pn_oTLnaS-w7Zebso3uMc_1768831564
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.016,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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



On 1/11/26 8:53 PM, Shameer Kolothum wrote:
> The get_pasid_info callback retrieves PASID capability information
> when the HostIOMMUDevice backend supports it. Currently, only the
> Linux IOMMUFD backend provides this information.
>
> This will be used by a subsequent patch to synthesize a PASID
> capability for vfio-pci devices behind a vIOMMU that supports PASID.
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  backends/iommufd.c                 | 17 +++++++++++++++++
>  include/system/host_iommu_device.h | 15 +++++++++++++++
>  2 files changed, 32 insertions(+)
>
> diff --git a/backends/iommufd.c b/backends/iommufd.c
> index 6381f9664b..f1707eadc6 100644
> --- a/backends/iommufd.c
> +++ b/backends/iommufd.c
> @@ -538,11 +538,28 @@ static int hiod_iommufd_get_cap(HostIOMMUDevice *hiod, int cap, Error **errp)
>      }
>  }
>  
> +static bool hiod_iommufd_get_pasid_info(HostIOMMUDevice *hiod,
> +                                        PasidInfo *pasid_info)
> +{
> +    HostIOMMUDeviceCaps *caps = &hiod->caps;
> +
> +    if (!caps->max_pasid_log2) {
> +        return false;
> +    }
> +
> +    g_assert(pasid_info);
> +    pasid_info->exec_perm = (caps->hw_caps & IOMMU_HW_CAP_PCI_PASID_EXEC);
> +    pasid_info->priv_mod = (caps->hw_caps & IOMMU_HW_CAP_PCI_PASID_PRIV);
> +    pasid_info->max_pasid_log2 = caps->max_pasid_log2;
> +    return true;
> +}
> +
>  static void hiod_iommufd_class_init(ObjectClass *oc, const void *data)
>  {
>      HostIOMMUDeviceClass *hioc = HOST_IOMMU_DEVICE_CLASS(oc);
>  
>      hioc->get_cap = hiod_iommufd_get_cap;
> +    hioc->get_pasid_info = hiod_iommufd_get_pasid_info;
>  };
>  
>  static const TypeInfo types[] = {
> diff --git a/include/system/host_iommu_device.h b/include/system/host_iommu_device.h
> index bfb2b60478..4fbada638f 100644
> --- a/include/system/host_iommu_device.h
> +++ b/include/system/host_iommu_device.h
> @@ -59,6 +59,12 @@ struct HostIOMMUDevice {
>  #endif
>  };
>  
> +typedef struct PasidInfo {
> +    bool exec_perm;
> +    bool priv_mod;
> +    uint8_t max_pasid_log2;
> +} PasidInfo;
> +
>  /**
>   * struct HostIOMMUDeviceClass - The base class for all host IOMMU devices.
>   *
> @@ -116,6 +122,15 @@ struct HostIOMMUDeviceClass {
>       * @hiod: handle to the host IOMMU device
>       */
>      uint64_t (*get_page_size_mask)(HostIOMMUDevice *hiod);
> +    /**
> +     * @get_pasid_info: Return the PASID information associated with the Host
> +     * IOMMU device.
> +     *
> +     * @pasid_info: If success, returns the PASID related information.
> +     *
> +     * Returns: true on success, false on failure.
> +     */
> +    bool (*get_pasid_info)(HostIOMMUDevice *hiod, PasidInfo *pasid_info);
>  };
>  
>  /*


