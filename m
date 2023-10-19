Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp309333ejb;
        Wed, 18 Oct 2023 23:39:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcJ1f9QEiO8znA9OFQjIijciSgo0xuJqU3ULzrYpaI+IVsdVNS50nEcSHqMCIQe/NMb3Xj
X-Received: by 2002:ac8:5b86:0:b0:3f9:aa80:b48a with SMTP id a6-20020ac85b86000000b003f9aa80b48amr1274460qta.8.1697697599296;
        Wed, 18 Oct 2023 23:39:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697697599; cv=none;
        d=google.com; s=arc-20160816;
        b=IyOA/WtZlEto7pwjZTc5iA86ttu6SdnObWye9QE1NK0CMh2N4fQwRR/KoSkC3PCbgI
         gR9FftUXEWu9qJ9wlvo8XcLfbfkmSXQqn8v6Be28NcSmfYKlWBOBPmYmN6HiQuNEdKpV
         TkDhTlQWvoWt5f8hDX4M6/kB7bB6xfgvqWYm5XyamP+vvRihuMAMUJSGOWoXkTJ52NU0
         Xkc1oskTFgKdD/2LvMtoTFHeBKBmcC1watncWboT7kLyYvwgOhJnaot6ln6n2G9L1ArK
         rW+8hfAiECJwnfU8gCANFFScI4jpXN3Vh/pccNG5MIxEkFkb6zfWgJZ2Ht6HAqjfAOjl
         f8jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Qsq+R0RytK51CIWoEH1OXGbDK8mM1Ns3/YSoH9Mxk4M=;
        fh=dYlMkLiw1BFJkKieDSWjn5wkFauh7Di4xUeLxUeQkZM=;
        b=rJ9zYQe7qx82jCNnm42n5i9GmP6EWMwR5LRl1WXMXO5654wBJwjHrun0mDPyUx4g/4
         k0QJiMJanxCR5/1wgFgSzksrsHltBokEhTqB2WK82Kh9xPHuAGdMThVf14laI3QzT53c
         tWla0ZYWO8AU/g6TVCQt8nWKPtfT6dxRINRFB24ntVkKP5q3WV/3uP2H1IX1hlkAcoYn
         R3MXsQOe6mcDmhL27CcsA5Y7L8PaELdKhkCaKtynafp2F7GJZiVi0Enkcc5bIixMwdBs
         3DceVPzd3FaQxSbidgvFdIbL5pp83UiXt6CdUkJPDWBqvbDPgqmfrOe5idle74o5GGG6
         lebQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TLz6y+8e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e2-20020a05622a110200b0041961b33c4fsi1078258qty.808.2023.10.18.23.39.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 23:39:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TLz6y+8e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtMh4-0001CB-Ui; Thu, 19 Oct 2023 02:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qtMh3-00015i-N4
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 02:39:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qtMh2-0005FP-1J
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 02:39:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697697579;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qsq+R0RytK51CIWoEH1OXGbDK8mM1Ns3/YSoH9Mxk4M=;
 b=TLz6y+8ePQGg1aEWG7OiMR1UnoALlZx/TepiZuxAsjLuVUegtdnKs6kNR4fwUlBWHYeAEq
 LLepoR36dYRItmfK/Df/g9ihZm1ZKI1DvVG8AVrE3/0neMz+qLASupUOLQVG5KhAvWIVg1
 XfLerJuTJjX5nL4RRCOiSU/aUXtulsQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-NjUnHhV1PWmJWSE9QnHysg-1; Thu, 19 Oct 2023 02:39:38 -0400
X-MC-Unique: NjUnHhV1PWmJWSE9QnHysg-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-66d03b02d16so7864916d6.0
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 23:39:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697697577; x=1698302377;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qsq+R0RytK51CIWoEH1OXGbDK8mM1Ns3/YSoH9Mxk4M=;
 b=YqcPNGpydAFPq4K5+YvnhI37/ioMtUQukjTQ4QuU89xyQ8sWb3NeCGZOo+RwD96JAh
 a+GQJRAh8AutiNW/byegcfqKUh32d75agYkZXBlq33ZT+cuHuw670//7EgetTVeePn1m
 R5fb1y7AJjSl/FwrzSm1hqdG1/OUMZEAgatZ6Hk/celiBzRQVlf6xfTGWga85soTMQFu
 Kw6daiNBIEwbpkfOZmexoTGaVgWYJ7nh4Jws+4Kf9pyVTrZBQf94y+dL/auZYVJ52GSD
 BD1osYAxMKpvBSvRENK9/j5owYZ2f+5qSuoHMttAjzX8H19TRVvk3nISokGZMaNhFYxp
 u4dg==
X-Gm-Message-State: AOJu0YzQm0XkD5xHHqKFFY4EwNn7bFSKtd8aBhUP8/lcUieEFNceMdO8
 giF0mAgO6EY+KpY6moC7yrsG6TR7/MMCUZ+slp1McIqS2h++YiZng7RFdLILNTe/TXGuVoArC55
 csNK95HbTa6ZC
X-Received: by 2002:a05:620a:1929:b0:773:cd00:e1ac with SMTP id
 bj41-20020a05620a192900b00773cd00e1acmr1191686qkb.36.1697697577446; 
 Wed, 18 Oct 2023 23:39:37 -0700 (PDT)
X-Received: by 2002:a05:620a:1929:b0:773:cd00:e1ac with SMTP id
 bj41-20020a05620a192900b00773cd00e1acmr1191668qkb.36.1697697577185; 
 Wed, 18 Oct 2023 23:39:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 o14-20020ae9f50e000000b0076d6a08ac98sm537783qkg.76.2023.10.18.23.39.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 23:39:35 -0700 (PDT)
Message-ID: <c0c88363-2b5d-df82-86f4-257521ed5ba2@redhat.com>
Date: Thu, 19 Oct 2023 08:39:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 03/13] vfio: Collect container iova range info
To: Alex Williamson <alex.williamson@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 clg@redhat.com, jean-philippe@linaro.org, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, peterx@redhat.com,
 david@redhat.com, philmd@linaro.org, zhenzhong.duan@intel.com,
 yi.l.liu@intel.com
References: <20231011175516.541374-1-eric.auger@redhat.com>
 <20231011175516.541374-4-eric.auger@redhat.com>
 <20231018130737.3815d3c4.alex.williamson@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20231018130737.3815d3c4.alex.williamson@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.339, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: qy/tIs0aTqDx

Hi Alex,

On 10/18/23 21:07, Alex Williamson wrote:
> On Wed, 11 Oct 2023 19:52:19 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> Collect iova range information if VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE
>> capability is supported.
>>
>> This allows to propagate the information though the IOMMU MR
>> set_iova_ranges() callback so that virtual IOMMUs
>> get aware of those aperture constraints. This is only done if
>> the info is available and the number of iova ranges is greater than
>> 0.
>>
>> A new vfio_get_info_iova_range helper is introduced matching
>> the coding style of existing vfio_get_info_dma_avail. The
>> boolean returned value isn't used though. Code is aligned
>> between both.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v2 -> v3:
>> - Turn nr_iovas into a int initialized to -1
>> - memory_region_iommu_set_iova_ranges only is called if nr_iovas > 0
>> - vfio_get_info_iova_range returns a bool to match
>>   vfio_get_info_dma_avail. Uniformize both code by using !hdr in
>>   the check
>> - rebase on top of vfio-next
>> ---
>>  include/hw/vfio/vfio-common.h |  2 ++
>>  hw/vfio/common.c              |  9 +++++++
>>  hw/vfio/container.c           | 44 ++++++++++++++++++++++++++++++++---
>>  3 files changed, 52 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>> index 7780b9073a..848ff47960 100644
>> --- a/include/hw/vfio/vfio-common.h
>> +++ b/include/hw/vfio/vfio-common.h
>> @@ -99,6 +99,8 @@ typedef struct VFIOContainer {
>>      QLIST_HEAD(, VFIORamDiscardListener) vrdl_list;
>>      QLIST_ENTRY(VFIOContainer) next;
>>      QLIST_HEAD(, VFIODevice) device_list;
>> +    int nr_iovas;
>> +    GList *iova_ranges;
> Nit, nr_iovas seems like it has a pretty weak use case here.  We can
> just test iova_ranges != NULL for calling set_iova_ranges.  In patch 13
> we can again test against NULL, which I think also negates the need to
> assert nr_iovas since the NULL test automatically catches the zero
> case.  Otherwise
>
> Reviewed-by: Alex Williamson <alex.williamson@redhat.com>

Makes sense,  all the more I am going to drop patch 13. So I will respin
and remove nr_iovas and just rely on testing iova_ranges.

Thanks!

Eric
>
>>  } VFIOContainer;
>>  
>>  typedef struct VFIOGuestIOMMU {
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 5ff5acf1d8..9d804152ba 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -699,6 +699,15 @@ static void vfio_listener_region_add(MemoryListener *listener,
>>              goto fail;
>>          }
>>  
>> +        if (container->nr_iovas > 0) {
>> +            ret = memory_region_iommu_set_iova_ranges(giommu->iommu_mr,
>> +                    container->iova_ranges, &err);
>> +            if (ret) {
>> +                g_free(giommu);
>> +                goto fail;
>> +            }
>> +        }
>> +
>>          ret = memory_region_register_iommu_notifier(section->mr, &giommu->n,
>>                                                      &err);
>>          if (ret) {
>> diff --git a/hw/vfio/container.c b/hw/vfio/container.c
>> index adc467210f..5122ff6d92 100644
>> --- a/hw/vfio/container.c
>> +++ b/hw/vfio/container.c
>> @@ -382,7 +382,7 @@ bool vfio_get_info_dma_avail(struct vfio_iommu_type1_info *info,
>>      /* If the capability cannot be found, assume no DMA limiting */
>>      hdr = vfio_get_iommu_type1_info_cap(info,
>>                                          VFIO_IOMMU_TYPE1_INFO_DMA_AVAIL);
>> -    if (hdr == NULL) {
>> +    if (!hdr) {
>>          return false;
>>      }
>>  
>> @@ -394,6 +394,33 @@ bool vfio_get_info_dma_avail(struct vfio_iommu_type1_info *info,
>>      return true;
>>  }
>>  
>> +static bool vfio_get_info_iova_range(struct vfio_iommu_type1_info *info,
>> +                                     VFIOContainer *container)
>> +{
>> +    struct vfio_info_cap_header *hdr;
>> +    struct vfio_iommu_type1_info_cap_iova_range *cap;
>> +
>> +    hdr = vfio_get_iommu_type1_info_cap(info,
>> +                                        VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE);
>> +    if (!hdr) {
>> +        return false;
>> +    }
>> +
>> +    cap = (void *)hdr;
>> +
>> +    container->nr_iovas = cap->nr_iovas;
>> +    for (int i = 0; i < cap->nr_iovas; i++) {
>> +        Range *range = g_new(Range, 1);
>> +
>> +        range_set_bounds(range, cap->iova_ranges[i].start,
>> +                         cap->iova_ranges[i].end);
>> +        container->iova_ranges =
>> +            range_list_insert(container->iova_ranges, range);
>> +    }
>> +
>> +    return true;
>> +}
>> +
>>  static void vfio_kvm_device_add_group(VFIOGroup *group)
>>  {
>>      Error *err = NULL;
>> @@ -535,6 +562,12 @@ static void vfio_get_iommu_info_migration(VFIOContainer *container,
>>      }
>>  }
>>  
>> +static void vfio_free_container(VFIOContainer *container)
>> +{
>> +    g_list_free_full(container->iova_ranges, g_free);
>> +    g_free(container);
>> +}
>> +
>>  static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>                                    Error **errp)
>>  {
>> @@ -616,6 +649,8 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>      container->error = NULL;
>>      container->dirty_pages_supported = false;
>>      container->dma_max_mappings = 0;
>> +    container->nr_iovas = -1;
>> +    container->iova_ranges = NULL;
>>      QLIST_INIT(&container->giommu_list);
>>      QLIST_INIT(&container->hostwin_list);
>>      QLIST_INIT(&container->vrdl_list);
>> @@ -652,6 +687,9 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>          if (!vfio_get_info_dma_avail(info, &container->dma_max_mappings)) {
>>              container->dma_max_mappings = 65535;
>>          }
>> +
>> +        vfio_get_info_iova_range(info, container);
>> +
>>          vfio_get_iommu_info_migration(container, info);
>>          g_free(info);
>>  
>> @@ -765,7 +803,7 @@ enable_discards_exit:
>>      vfio_ram_block_discard_disable(container, false);
>>  
>>  free_container_exit:
>> -    g_free(container);
>> +    vfio_free_container(container);
>>  
>>  close_fd_exit:
>>      close(fd);
>> @@ -819,7 +857,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
>>  
>>          trace_vfio_disconnect_container(container->fd);
>>          close(container->fd);
>> -        g_free(container);
>> +        vfio_free_container(container);
>>  
>>          vfio_put_address_space(space);
>>      }

