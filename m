Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF904EFCD99
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Mar 2026 11:09:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzYUT-00022f-0X; Mon, 09 Mar 2026 07:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vzYUR-00022C-DH
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 07:09:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vzYUP-0004GN-Qr
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 07:09:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773054572;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YRd8RDCobWzkOIL/55dBZ6Bma4Lf5yyWSHcJ6UJrR3A=;
 b=ZE5/r2a7dMhqWjwI81otvrvfhQSZvJiWyDHDqRCLZSubV7UysBY54TUg3OftZlDqByDavH
 cfpzEGq7dc9IDyyfzOy/kycFV3R8GLy1e2XXXhsq84lALIU65akZMSbe8kvLa1hhPXgJPS
 sl7sqL7xiI1Tv34g98UeHkpw8F2epTY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-3NMA3qUpPm2kTGPnqLIArA-1; Mon, 09 Mar 2026 07:09:29 -0400
X-MC-Unique: 3NMA3qUpPm2kTGPnqLIArA-1
X-Mimecast-MFC-AGG-ID: 3NMA3qUpPm2kTGPnqLIArA_1773054569
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4837bfcfe0dso136111895e9.1
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2026 04:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773054568; x=1773659368;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YRd8RDCobWzkOIL/55dBZ6Bma4Lf5yyWSHcJ6UJrR3A=;
 b=XULvQyYbmxGvYHQTWYENff/HqksMg3Y+vwzGHDHj50orGZci1JSeht9sN48Llo1n2V
 h5DO56fZvqxFRxTCQn3pc2fMwhIv2EizyZIbNq53N4oAS+uj5KB//BVMRS4e8jfx4pzv
 5VCzTtvtJu8iBNuMynrebiKVSq7q5RfCmJ9H8ibqKVMrniqHRaZZEJT7CvqGn+m2lg5b
 Qf6c4/axEpqeV26OsbEW5BKsVoIjnlRdmf+KcOyzh/Qf/YmHHgUGCeYVC+giwlSJsLL+
 LnuK3lu5Huk4Pkzqa9n/S2QC2YrSJJoNuyC3bNhlFNX1Q8pW6X9h/ce3ouIfHyzK8hCI
 mMtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1IqYN8dXX98umwmDHjJjA/T1/JZcTCCRsQSMCAPt9acjqHVmtQojsz1Dz6wTcmXjGk3195x1bcw==@nongnu.org
X-Gm-Message-State: AOJu0Ywh1qrRk9/oMQPr6sI6ohOPgv/+t7nfoxXAkpBM9dmwFHqhljfM
 +TQ2cD+QYQXDiFK9pniiPIc0tNoPjjT53Ybl6zoi3+M2QbeNiAGYFM0GUT9j+1pMP6eaZyb3HRD
 OcyKZuZPKyP+M3OasO+jbdRNfg6XWUulTMw4flRp8GowDI6gnPMlylg==
X-Gm-Gg: ATEYQzz96v/payl3x5J6Z7DY+Q/pChd5z9tuCDo8WNMzN+9pgOhPslDwmr8KT7GPVu7
 ChI9xdyzoBeJDIiiU4rD5ZQCAfMWwKZAAewqIx5t/byCoI+hrhNXEDbIdK+riQiu/CXHhs6WpOO
 V8ah0YxwNEqwpYp4ctwE1qo9LmhqmixPE9mf9yoNSUg6jt5dpDFerox0Fh5JxUXBCiGA1qgTvFL
 Kr4jZ7h1DTUz3TbjZXkyzQZ+UbAHzGe9DXgjGQ2RND1w+WYDXk4hIlfUy6aFFsTmYUe6CqqeFvO
 Wgmy3B+NtVt/t/ba2WNXZPvSCPJfXkCNY2x/PoW86MUemQZhh5dDiNCfmmtlPt+Q+27qKqfCUVR
 yEo2LAIyWc8Q+pSX/tnevpKnMzEhzi+j2kKv4zPQxnHwZGKfl9w4fDVSrlyoGzb9lVRUhAg==
X-Received: by 2002:a05:600c:500d:b0:47e:e48b:506d with SMTP id
 5b1f17b1804b1-4852695b9f7mr179766625e9.16.1773054568504; 
 Mon, 09 Mar 2026 04:09:28 -0700 (PDT)
X-Received: by 2002:a05:600c:500d:b0:47e:e48b:506d with SMTP id
 5b1f17b1804b1-4852695b9f7mr179766265e9.16.1773054568075; 
 Mon, 09 Mar 2026 04:09:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4853f9f82a7sm24560715e9.10.2026.03.09.04.09.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2026 04:09:27 -0700 (PDT)
Message-ID: <ed5ca420-94e5-4e9e-a2c3-f59eb6ea8ada@redhat.com>
Date: Mon, 9 Mar 2026 12:09:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/32] hw/arm/tegra241-cmdqv: Implement CMDQV vIOMMU
 alloc/free
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, kjaju@nvidia.com, phrdina@redhat.com
References: <20260226105056.897-1-skolothumtho@nvidia.com>
 <20260226105056.897-14-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260226105056.897-14-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h-aY3jSckQnp5BQTpIQOXmrZ47_tF0XdOf2CaSqHWEA_1773054569
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



On 2/26/26 11:50 AM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Replace the stub implementation with real vIOMMU allocation for
> Tegra241 CMDQV.
>
> Free the vIOMMU ID on teardown.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/tegra241-cmdqv.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> index 6959766129..d487612ba2 100644
> --- a/hw/arm/tegra241-cmdqv.c
> +++ b/hw/arm/tegra241-cmdqv.c
> @@ -25,14 +25,29 @@ static void tegra241_cmdqv_write(void *opaque, hwaddr offset, uint64_t value,
>  
>  static void tegra241_cmdqv_free_viommu(SMMUv3State *s)
>  {
> +    SMMUv3AccelState *accel = s->s_accel;
> +    IOMMUFDViommu *viommu = accel->viommu;
> +
> +    if (!viommu) {
> +        return;
> +    }
> +    iommufd_backend_free_id(viommu->iommufd, viommu->viommu_id);
>  }
>  
>  static bool
>  tegra241_cmdqv_alloc_viommu(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
>                              uint32_t *out_viommu_id, Error **errp)
>  {
> -    error_setg(errp, "NVIDIA Tegra241 CMDQV is unsupported");
> -    return false;
> +    Tegra241CMDQV *cmdqv = s->s_accel->cmdqv;
> +
> +    if (!iommufd_backend_alloc_viommu(idev->iommufd, idev->devid,
> +                                      IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV,
if the only think that differs compared to no cmdq is the type, ie.

IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV vs IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV

+ passing true args, maybe you can just record the type of the cmdqv that is being used in the smmu_accel device. Then you can get rid of alloc and free

Eric


> +                                      idev->hwpt_id, &cmdqv->cmdqv_data,
> +                                      sizeof(cmdqv->cmdqv_data), out_viommu_id,
> +                                      errp)) {
> +        return false;
> +    }
> +    return true;
>  }
>  
>  static void tegra241_cmdqv_reset(SMMUv3State *s)


