Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp479642lfr;
        Thu, 8 Apr 2021 06:48:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXoS8doi9e/bJaK6mEek6RbRrQa5fEur8SqYNIATwnI8zODQGkDzlSifmMzZjevHDCeTV3
X-Received: by 2002:a5d:9659:: with SMTP id d25mr7022253ios.146.1617889732657;
        Thu, 08 Apr 2021 06:48:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617889732; cv=none;
        d=google.com; s=arc-20160816;
        b=nO7vfeIoWNFrJdMyWLykQcQsh4amhqyL7yDRr9zSbsLSpLWqLMlysMBxo1OSJj0dSM
         AwOGnClMKdL0MWPH8wyLrMb5nuxHbuzd8uzjE7xgQ+ng+PZPavYFrTkHfmI05yxhxYp9
         eMn6BFMyATcXqA6z9alPuC6likZT8/vIOIy1HDZIBd2NdcF8gZnFd5eiycr9LfrGeLjx
         GupaN2U7/0ZzCuHD6ignGUi2hjuxGSgjoPz5EqbJoN9zI24npO6mJr0Ed1aAUndCaeMB
         TyhEdET0U90stHaZjj9Fh3xSItuiJgLvceOvsNqL7m1YsR02bjgam7xzvv9axvC/zD4i
         5Kiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=v4ruaBU7SsO6pA9ARa2DjkTlC4U6sWlPJzKUS4uOZCc=;
        b=AxZNJxqG07ehQxBNRanHvklmlRY+BnJvPOvK/sJ4o/6noefyWq7JmKhDDLhrX+nDk6
         2S/M6iNcaLlQxPJ6yfvuM2EwIovKByz4wlijkOt3wlZq1OxagHuSBrn3FOpUXd/sjm93
         6Oh91sD8ma0ZBGnz9SGKCtdhUZ3RRX7ArTBGoyDDxNZW3OY6A+kGhCSsQhyIn1MFxG7z
         MRcJwIkcMkGiicwN86LyB+877Tj1s+cb3P8Qggs24mW3s0R0bhFPEmb7aYC/lv48iYb+
         sbx2jSJBR0v7JEUUkRQTy5q+wO6TLOXOG0zILSO8A2T0ZIliyinUJSNv0BxNNnRSlVOP
         Ut0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RM2p+Qb2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11si27152945jat.38.2021.04.08.06.48.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Apr 2021 06:48:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RM2p+Qb2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUV1f-0002yZ-Vi
	for alex.bennee@linaro.org; Thu, 08 Apr 2021 09:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lUV01-0001Hc-Op
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:47:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lUUzp-0007oU-7y
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:47:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617889614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v4ruaBU7SsO6pA9ARa2DjkTlC4U6sWlPJzKUS4uOZCc=;
 b=RM2p+Qb28yo+CyNGYRjc9jeWBgn31yiUKJwheOVtnfelhDC+IdxpWKc4zy8rce1SFwbblQ
 En3eCfCmgR00GAL2q9NHPPSlArG6s6WVXx3r1ESpWWGmPLiajd7u18dwf0ncqPYbLwBl5Y
 qdOGkt64sFgfRoZuEJAuGD/kB1jPx94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-Bjr5p5NPP4qGDB8XtEEREg-1; Thu, 08 Apr 2021 09:46:50 -0400
X-MC-Unique: Bjr5p5NPP4qGDB8XtEEREg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E38F8107ACC7;
 Thu,  8 Apr 2021 13:46:48 +0000 (UTC)
Received: from [10.36.114.172] (ovpn-114-172.ams2.redhat.com [10.36.114.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0430C60BF1;
 Thu,  8 Apr 2021 13:46:38 +0000 (UTC)
Subject: Re: [RFC PATCH 1/3] vfio: Introduce helpers to mark dirty pages of a
 RAM section
To: Kunkun Jiang <jiangkunkun@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20210219094230.231-1-jiangkunkun@huawei.com>
 <20210219094230.231-2-jiangkunkun@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <41dc3143-34ce-4794-e70e-f91ec96cced6@redhat.com>
Date: Thu, 8 Apr 2021 15:46:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210219094230.231-2-jiangkunkun@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>, shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P8IDNqzQfsZj

Hi Kunkun,

On 2/19/21 10:42 AM, Kunkun Jiang wrote:
> Extract part of the code from vfio_sync_dirty_bitmap to form a
> new helper, which allows to mark dirty pages of a RAM section.
> This helper will be called for nested stage.
> 
> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> ---
>  hw/vfio/common.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 9225f10722..7c50905856 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -1203,6 +1203,19 @@ err_out:
>      return ret;
>  }
>  
> +static int vfio_dma_sync_ram_section_dirty_bitmap(VFIOContainer *container,
> +                                                  MemoryRegionSection *section)
> +{
> +    ram_addr_t ram_addr;
> +
> +    ram_addr = memory_region_get_ram_addr(section->mr) +
> +               section->offset_within_region;
> +
> +    return vfio_get_dirty_bitmap(container,
> +                       TARGET_PAGE_ALIGN(section->offset_within_address_space),
> +                       int128_get64(section->size), ram_addr);
> +}
> +
>  typedef struct {
>      IOMMUNotifier n;
>      VFIOGuestIOMMU *giommu;
> @@ -1244,8 +1257,6 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
>  static int vfio_sync_dirty_bitmap(VFIOContainer *container,
>                                    MemoryRegionSection *section)
>  {
> -    ram_addr_t ram_addr;
> -
>      if (memory_region_is_iommu(section->mr)) {
>          VFIOGuestIOMMU *giommu;
>  
> @@ -1274,12 +1285,7 @@ static int vfio_sync_dirty_bitmap(VFIOContainer *container,
>          return 0;
>      }
>  
> -    ram_addr = memory_region_get_ram_addr(section->mr) +
> -               section->offset_within_region;
> -
> -    return vfio_get_dirty_bitmap(container,
> -                       TARGET_PAGE_ALIGN(section->offset_within_address_space),
this is now REAL_HOST_PAGE_ALIGN

Thanks

Eric
> -                       int128_get64(section->size), ram_addr);
> +    return vfio_dma_sync_ram_section_dirty_bitmap(container, section);
>  }
>  
>  static void vfio_listerner_log_sync(MemoryListener *listener,
> 

