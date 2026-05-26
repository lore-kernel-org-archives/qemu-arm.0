Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4A2CD5BC8
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 08:27:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRn8H-00044h-I6; Tue, 26 May 2026 04:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wRn8F-00042J-TL
 for qemu-arm@nongnu.org; Tue, 26 May 2026 04:27:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wRn8D-00033u-7A
 for qemu-arm@nongnu.org; Tue, 26 May 2026 04:27:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779784039;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CKOYpBNztrp0moWXDdvp4Mp+9kKD3TfLq+n/1rIzrNY=;
 b=ZDv9LwNev1DNeUrDVKievRv3uzBFbo4KnJrvd1YXz7MF845V67BDCBMrQ8gIZYU9qO1Wh8
 2k4NhI/8nxhV9WbAhIIPIoZgmRy4ApoMtTJapZllG8QO3RxS11XvaT46FVXFK9cTV+5Zxj
 eAPb9lmd8i5RX8RDZKsF1j0SF3gNFcE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-dfoJBiB6NyWKCwpPfmLTDQ-1; Tue, 26 May 2026 04:27:17 -0400
X-MC-Unique: dfoJBiB6NyWKCwpPfmLTDQ-1
X-Mimecast-MFC-AGG-ID: dfoJBiB6NyWKCwpPfmLTDQ_1779784036
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-44a52d5e572so7170166f8f.3
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 01:27:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779784036; x=1780388836;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CKOYpBNztrp0moWXDdvp4Mp+9kKD3TfLq+n/1rIzrNY=;
 b=rX9wTIV/86N4s2ZybFcE8sRJz/oFCS9z2cwBfaGACDcBGEKmqAPmHdCgrynW6xg3Td
 jyAljOpRooietXl8s+dbyN7vi5ew6tWAyjWkpxDgvLjeLjBKRzQXAbSo1Zjg0FCDSJg+
 mqrt+KbIbEMGk+fQuLxn9Twhhpiud0+/AIbp/X9AhzrdsOUeUfJFAc++H3pX+q3Lw8Pr
 tKD+/XMXjRUsCJoygDagW3Daho0Ry0ToleXyi5Cbh5QBp0baQEZpev8Gzzl9056ZAnsO
 ZX+t5OcFUQPeybqvxby9ONnR2cDYlmfQd2hcAsB6MaOAZgh66u8fEtpfcUcmDKkG8XDy
 F46w==
X-Forwarded-Encrypted: i=1;
 AFNElJ8jHj25AYsXbVSbIgsKtqZaz+32CXrLta9HCC9vtDyr2NvX46OUdKrMPbGWEn58DcLxNzw1QQCWVw==@nongnu.org
X-Gm-Message-State: AOJu0Yy2uo+asNXsvDadvElmUaqPI2LxQQZl/sXHr5dOCK2f/VAMte4q
 hHU6dEY+/tc8FKihU4QjnqeHVSLgAPpU8iJbgvx9iIWxRGrrvTiKh3/psXPf5thqbN4sc4H4cSe
 idFMROVleNc8m4/wqNKIbbxoiymUatoorx1Ed0IpMhH+zeJEtYjBW1Q==
X-Gm-Gg: Acq92OHJptnjMLQhgyHjj9bfWTQaS2+dWRUpseUkdw7Cz3mBO7ALXoxtbbdluvOM60X
 Nc3scDzHpqKkLOzyiSyYoWw6/yq/nnWQ02hiYlsbLEFxZePdo9IpAqjvEbigNfC+OkzPhXof8OL
 WHiRc/m12aHCPz8/p49I50w6nSscZSFISQSMDkG9FobutfH11zpxuf95feg7fsQkdl9pwaIwXEO
 /p/qapedabLDizAFAEl0fwrJNHV9Af//Ooqb5sSiyuQ8VonBbPi6TOThyG9i7VhJ0lLaiVKFIBY
 0CXEMICH5vxC5g/gxlmLkzfq1qNfhC/QqviMG8djFCWC2rp0rHh8WPwwF2MfrtT8+tFbjxdtQqL
 sPJspWHSH7gv4Hiy41pzeDzGYQF82EPE7iBSTW5gs9Wtd1eOYeKca/5eWpiu918ul1g19YtcGwz
 n7mzwM
X-Received: by 2002:a05:6000:1a87:b0:43f:e2b7:7160 with SMTP id
 ffacd0b85a97d-45eb3673319mr31329579f8f.4.1779784036198; 
 Tue, 26 May 2026 01:27:16 -0700 (PDT)
X-Received: by 2002:a05:6000:1a87:b0:43f:e2b7:7160 with SMTP id
 ffacd0b85a97d-45eb3673319mr31329522f8f.4.1779784035726; 
 Tue, 26 May 2026 01:27:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d5e484sm32338485f8f.30.2026.05.26.01.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2026 01:27:15 -0700 (PDT)
Message-ID: <8183d160-d588-4124-886d-a37dc4f92620@redhat.com>
Date: Tue, 26 May 2026 10:27:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 24/32] hw/arm/tegra241-cmdqv: Read and propagate
 Tegra241 CMDQV errors
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, clg@redhat.com, alex@shazbot.org,
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com,
 jgg@nvidia.com, zhenzhong.duan@intel.com, kjaju@nvidia.com,
 phrdina@redhat.com
References: <20260519103727.899332-1-skolothumtho@nvidia.com>
 <20260519103727.899332-25-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260519103727.899332-25-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NitOtK1tklSFTQsZlIbD1Jl4oXHf6RrrsDhbUYnLEUQ_1779784036
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Hi Shameer,

On 5/19/26 12:37 PM, Shameer Kolothum wrote:
> Install an event handler on the CMDQV vEVENTQ fd to read and propagate
> host received CMDQV errors to the guest.
>
> The handler runs in QEMU's main loop, using a non-blocking fd registered
> via qemu_set_fd_handler().
>
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/tegra241-cmdqv.c | 60 +++++++++++++++++++++++++++++++++++++++++
>  hw/arm/trace-events     |  1 +
>  2 files changed, 61 insertions(+)
>
> diff --git a/hw/arm/tegra241-cmdqv.c b/hw/arm/tegra241-cmdqv.c
> index 853c548e58..0bba2c1801 100644
> --- a/hw/arm/tegra241-cmdqv.c
> +++ b/hw/arm/tegra241-cmdqv.c
> @@ -14,6 +14,7 @@
>  
>  #include "hw/arm/smmuv3.h"
>  #include "hw/arm/smmuv3-common.h"
> +#include "hw/core/irq.h"
>  #include "smmuv3-accel.h"
>  #include "tegra241-cmdqv.h"
>  #include "trace.h"
> @@ -736,6 +737,48 @@ out:
>      trace_tegra241_cmdqv_write_mmio(offset, value, size);
>  }
>  
> +static void tegra241_cmdqv_event_read(void *opaque)
> +{
> +    Tegra241CMDQV *cmdqv = opaque;
> +    IOMMUFDVeventq *veventq = cmdqv->veventq;
> +    struct {
> +        struct iommufd_vevent_header hdr;
> +        struct iommu_vevent_tegra241_cmdqv vevent;
> +    } buf;
> +    Error *local_err = NULL;
> +
> +    if (!smmuv3_accel_event_read_validate(veventq,
> +                                          IOMMU_VEVENTQ_TYPE_TEGRA241_CMDQV,
> +                                          &buf, sizeof(buf), &local_err)) {
> +        warn_report_err_once(local_err);
> +        return;
> +    }
> +
> +    if (buf.vevent.lvcmdq_err_map[0] || buf.vevent.lvcmdq_err_map[1]) {
> +        cmdqv->vintf_cmdq_err_map[0] =
> +            extract64(buf.vevent.lvcmdq_err_map[0], 0, 32);
> +        cmdqv->vintf_cmdq_err_map[1] =
> +            extract64(buf.vevent.lvcmdq_err_map[0], 32, 32);
> +        cmdqv->vintf_cmdq_err_map[2] =
> +            extract64(buf.vevent.lvcmdq_err_map[1], 0, 32);
> +        cmdqv->vintf_cmdq_err_map[3] =
> +            extract64(buf.vevent.lvcmdq_err_map[1], 32, 32);
> +        /*
> +         * CMDQV_CMDQ_ERR_MAP and VINTF0_LVCMDQ_ERR_MAP are distinct
> +         * registers (different MMIO offsets). With only VINTF0 exposed
> +         * they carry the same data, so mirror.
> +         */
> +        for (int i = 0; i < 4; i++) {
> +            cmdqv->cmdq_err_map[i] = cmdqv->vintf_cmdq_err_map[i];
> +        }
> +        cmdqv->vi_err_map[0] |= 0x1;
> +        qemu_irq_pulse(cmdqv->irq);
I don't see SMMU_CMDQV_VI_ERR_MAP_0 updated anywhere. If I understand
correctly, if you get an error on any VCMDQ you should update it. Also
the triggering of the irq should depnd on SMMU_CMDQ_VI_INT_MASK0, no?
> +        trace_tegra241_cmdqv_err_map(
> +            cmdqv->vintf_cmdq_err_map[3], cmdqv->vintf_cmdq_err_map[2],
> +            cmdqv->vintf_cmdq_err_map[1], cmdqv->vintf_cmdq_err_map[0]);
> +    }
> +}
> +
>  static void tegra241_cmdqv_free_viommu(SMMUv3State *s)
>  {
>      SMMUv3AccelState *accel = s->s_accel;
> @@ -747,6 +790,7 @@ static void tegra241_cmdqv_free_viommu(SMMUv3State *s)
>          return;
>      }
>      if (veventq) {
> +        qemu_set_fd_handler(veventq->veventq_fd, NULL, NULL, NULL);
>          close(veventq->veventq_fd);
>          iommufd_backend_free_id(viommu->iommufd, veventq->veventq_id);
>          g_free(veventq);
> @@ -762,6 +806,7 @@ tegra241_cmdqv_alloc_viommu(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
>      Tegra241CMDQV *cmdqv = s->s_accel->cmdqv;
>      uint32_t viommu_id, veventq_id, veventq_fd;
>      IOMMUFDVeventq *veventq;
> +    int flags;
>  
>      if (!iommufd_backend_alloc_viommu(idev->iommufd, idev->devid,
>                                        IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV,
> @@ -780,14 +825,29 @@ tegra241_cmdqv_alloc_viommu(SMMUv3State *s, HostIOMMUDeviceIOMMUFD *idev,
>          goto free_viommu;
>      }
>  
> +    flags = fcntl(veventq_fd, F_GETFL);
> +    if (flags < 0) {
> +        error_setg(errp, "Failed to get flags for vEVENTQ fd");
> +        goto free_veventq;
> +    }
> +    if (fcntl(veventq_fd, F_SETFL, O_NONBLOCK | flags) < 0) {
> +        error_setg(errp, "Failed to set O_NONBLOCK on vEVENTQ fd");
> +        goto free_veventq;
> +    }
> +
>      veventq = g_new(IOMMUFDVeventq, 1);
>      veventq->veventq_id = veventq_id;
>      veventq->veventq_fd = veventq_fd;
>      cmdqv->veventq = veventq;
>  
> +    /* Set up event handler for veventq fd */
> +    qemu_set_fd_handler(veventq_fd, tegra241_cmdqv_event_read, NULL, cmdqv);
>      *out_viommu_id = viommu_id;
>      return true;
>  
> +free_veventq:
> +    close(veventq_fd);
> +    iommufd_backend_free_id(idev->iommufd, veventq_id);
>  free_viommu:
>      iommufd_backend_free_id(idev->iommufd, viommu_id);
>      return false;
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index c4262bb2be..5afbceee83 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -75,6 +75,7 @@ smmuv3_accel_install_ste(uint32_t vsid, const char * type, uint32_t hwpt_id) "vS
>  # tegra241-cmdqv
>  tegra241_cmdqv_read_mmio(uint64_t offset, uint64_t val, unsigned size) "offset: 0x%"PRIx64" val: 0x%"PRIx64" size: 0x%x"
>  tegra241_cmdqv_write_mmio(uint64_t offset, uint64_t val, unsigned size) "offset: 0x%"PRIx64" val: 0x%"PRIx64" size: 0x%x"
> +tegra241_cmdqv_err_map(uint32_t map3, uint32_t map2, uint32_t map1, uint32_t map0) "hw irq received. error (hex) maps: %04X:%04X:%04X:%04X"
>  tegra241_cmdqv_read_vcmdq_page0(int index, uint64_t offset0, uint64_t val) "vcmdq[%d] page0 offset0: 0x%"PRIx64" val: 0x%"PRIx64
>  tegra241_cmdqv_read_vcmdq_page1(int index, uint64_t offset0, uint64_t val) "vcmdq[%d] page1 offset0: 0x%"PRIx64" val: 0x%"PRIx64
>  tegra241_cmdqv_write_vcmdq_page0(int index, uint64_t offset0, uint64_t val) "vcmdq[%d] page0 offset0: 0x%"PRIx64" val: 0x%"PRIx64
Thanks

Eric


