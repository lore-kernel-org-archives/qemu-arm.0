Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99083CCF9EB
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 17:01:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDQae-0006TR-QX; Mon, 27 Oct 2025 13:01:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDQaG-0006DH-5i
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 13:00:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDQa6-0001pv-Oq
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 13:00:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761584426;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PFyGEEJsv/btQlGzcO53SOtrSj8HXWlXlL90oNywvTo=;
 b=DYbDzpm63WLyfcP+tdcw+CT419RhEUuWdln4/ZYLYqwd10JspqURqcua0bupjyr6wsTfCJ
 2qt0Jq4pWkw/WJRg5u308aGUWWkNFq1bhQQFdlMKSpYxEJfay+P0FR9Rdv9n2rfPrhNGQH
 y6bcsf+FIdf0OtRnk1HPjMWSMqRS/rE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-LQn_eLWAP5ybnfVGPNeyyw-1; Mon, 27 Oct 2025 13:00:24 -0400
X-MC-Unique: LQn_eLWAP5ybnfVGPNeyyw-1
X-Mimecast-MFC-AGG-ID: LQn_eLWAP5ybnfVGPNeyyw_1761584423
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3f6b44ab789so1970419f8f.3
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 10:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761584423; x=1762189223;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PFyGEEJsv/btQlGzcO53SOtrSj8HXWlXlL90oNywvTo=;
 b=Ur74RzAZtW50AbI+9GhMAryvziVCp2lxWyPfOrn5hFsqgKH4LOZhRMHsPMMdy1wnEl
 oZkHiQec2JeiadHojkIZxpiekYVagSpzsKYKOCi08ghjON9mWXNAMf++exMdtDKzutbr
 3ZklDsyyvCkKcQ73+N+57CLE5Divsx1aZv9447QUtuhyjX6opu51JAs+wIS5eYcT3fkk
 omZF0fgWYqzedTVMHoreq4Ms/UHcetBkS7VxKuEW9Pi023VxpJ5NBDQzqaMYss9P9reu
 Alq0I89stCmhdGB1871Rrpp5bmORlzUHLmrYDaz+lUGmJW412zhwuM5qUvnUPJm3hWdk
 ZRsQ==
X-Gm-Message-State: AOJu0YxNY1gs12Lo4fNYvkkP2Y/xfPxb0RAhYgH8v/rAPYxoBpX5hSC8
 4d+QJUTsm4FMf4DD1k+U//vgw73lgMX6XRM3PisnFR+07oi0xOLwNMg7z8EHPsaHYGTwMcuAEW7
 efaZQgiBSdUrzb+LnSSVD97G6wBJszsjjubqma6WCH8M0jq6B4YiIqQ==
X-Gm-Gg: ASbGnctzE0oP/+bFDAjiIwWpTZo1HzmB9zqMotPSqCP8mAvUoMFo5GT3KsbF1fntj/z
 XGHHi76+semvYD/TJcirxBzOwzRYB8AimwboG9fUSTqMQdBQmSbXAVcxya6P8kNd6dsUktXyGMk
 RgsLrwc3VVEcZ0TA0DlDXcYTCZYgaDHDdh//qCjAI/jRpp4JhMN8ZzfSQCWVuXk/UlL+IOD/Np/
 EltM2E0MGy1h0ATwLHYFUPUqWrmRRTayT8P34dnQKz+T71wEaRo/nQQu5Rgr4ZkhTsaMjtDo3cQ
 +InNq3FWkygM6omx6tslBnHKJ2UaTfV1W14cmfpj1wYjSDNmKkIotqNBh1YhTxKhnlbzDKyOahF
 d/9tfU2CeUHTLr77VnpFQ4Cy/ok/wSgoKNDxKZtQ+UtlZ7g==
X-Received: by 2002:a05:600d:4388:b0:46e:1d8d:cfa2 with SMTP id
 5b1f17b1804b1-4771840b04bmr203075e9.20.1761584423433; 
 Mon, 27 Oct 2025 10:00:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElWgmW0e5JBE0sEZI66IzLDiupXsMZ6Oys+FZPDGRcAWQUoe0TW6guVHlXglWFkdB3GMnmiw==
X-Received: by 2002:a05:600d:4388:b0:46e:1d8d:cfa2 with SMTP id
 5b1f17b1804b1-4771840b04bmr202855e9.20.1761584423011; 
 Mon, 27 Oct 2025 10:00:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd4783b8sm147111875e9.15.2025.10.27.10.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 10:00:22 -0700 (PDT)
Message-ID: <b620c85a-973d-4bf5-a53c-4c2b5962281e@redhat.com>
Date: Mon, 27 Oct 2025 18:00:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 24/27] backends/iommufd: Retrieve PASID width from
 iommufd_backend_get_device_info()
To: Jonathan Cameron <jonathan.cameron@huawei.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 jgg@nvidia.com, nicolinc@nvidia.com, ddutile@redhat.com,
 berrange@redhat.com, nathanc@nvidia.com, mochs@nvidia.com,
 smostafa@google.com, wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 shameerkolothum@gmail.com
References: <20250929133643.38961-1-skolothumtho@nvidia.com>
 <20250929133643.38961-25-skolothumtho@nvidia.com>
 <20251001145006.00001837@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251001145006.00001837@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6rbSvDLhvvAjRwDatI2-yLSzi8cJZGrmF9r_kXGNHCg_1761584423
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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



On 10/1/25 3:50 PM, Jonathan Cameron wrote:
> On Mon, 29 Sep 2025 14:36:40 +0100
> Shameer Kolothum <skolothumtho@nvidia.com> wrote:
>
> Bring the bit of the description in the title down here as well.
> Depending on what tools people use for browsing git it might
> end up in very different places on their screen.
+1

Eric
>
>> And store it in HostIOMMUDeviceCaps for later use.
>>
>> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> Trivial comment inline.
>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>
>> ---
>>  backends/iommufd.c                 | 6 +++++-
>>  hw/arm/smmuv3-accel.c              | 3 ++-
>>  hw/vfio/iommufd.c                  | 7 +++++--
>>  include/system/host_iommu_device.h | 2 ++
>>  include/system/iommufd.h           | 3 ++-
>>  5 files changed, 16 insertions(+), 5 deletions(-)
> ...
>
>> diff --git a/include/system/host_iommu_device.h b/include/system/host_iommu_device.h
>> index ab849a4a82..c6a2a3899a 100644
>> --- a/include/system/host_iommu_device.h
>> +++ b/include/system/host_iommu_device.h
>> @@ -29,6 +29,7 @@ typedef union VendorCaps {
>>   *
>>   * @hw_caps: host platform IOMMU capabilities (e.g. on IOMMUFD this represents
>>   *           the @out_capabilities value returned from IOMMU_GET_HW_INFO ioctl)
> Blank line here to match local style. 
>
>> + * @max_pasid_log2: width of PASIDs supported by host IOMMU device
>>   *
>>   * @vendor_caps: host platform IOMMU vendor specific capabilities (e.g. on
>>   *               IOMMUFD this represents a user-space buffer filled by kernel
>> @@ -37,6 +38,7 @@ typedef union VendorCaps {
>>  typedef struct HostIOMMUDeviceCaps {
>>      uint32_t type;
>>      uint64_t hw_caps;
>> +    uint8_t max_pasid_log2;
>>      VendorCaps vendor_caps;
>>  } HostIOMMUDeviceCaps;
>>  #endif
>> diff --git a/include/system/iommufd.h b/include/system/iommufd.h
>> index e852193f35..d3efcffc45 100644
>> --- a/include/system/iommufd.h
>> +++ b/include/system/iommufd.h
>> @@ -71,7 +71,8 @@ int iommufd_backend_unmap_dma(IOMMUFDBackend *be, uint32_t ioas_id,
>>                                hwaddr iova, ram_addr_t size);
>>  bool iommufd_backend_get_device_info(IOMMUFDBackend *be, uint32_t devid,
>>                                       uint32_t *type, void *data, uint32_t len,
>> -                                     uint64_t *caps, Error **errp);
>> +                                     uint64_t *caps, uint8_t *pasid_log2,
>> +                                     Error **errp);
>>  bool iommufd_backend_alloc_hwpt(IOMMUFDBackend *be, uint32_t dev_id,
>>                                  uint32_t pt_id, uint32_t flags,
>>                                  uint32_t data_type, uint32_t data_len,


