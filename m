Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63434CCF9E0
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 11:19:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDLBx-0001BJ-76; Mon, 27 Oct 2025 07:15:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDLB3-0000Hm-3h
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:14:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDLAu-00084k-Vz
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:14:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761563645;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UB7t7wD3NVFDY4b1WC3tRHbChuKKwIXTFYvp4gnmd+U=;
 b=EuxqI2M16FrCnU/Bzi4mulMBRQ+tvSATXcGm0Y04iU82OaXe7ZbWRSWnGqmflr6vyt0d8l
 tJCNakDrPqeZ2qEYcDPEDraB2mYMCx6lxxXXdAusKks7pWlTPfOg4uVoVdHX+9SxKVZUT3
 0Fl+sEsdkZykLnVdE/ivkPdBGauDbLo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-Cjya5UMSNumWQ8PJ6CjVKw-1; Mon, 27 Oct 2025 07:14:04 -0400
X-MC-Unique: Cjya5UMSNumWQ8PJ6CjVKw-1
X-Mimecast-MFC-AGG-ID: Cjya5UMSNumWQ8PJ6CjVKw_1761563643
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-475e032d81bso15521605e9.3
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 04:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563643; x=1762168443;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UB7t7wD3NVFDY4b1WC3tRHbChuKKwIXTFYvp4gnmd+U=;
 b=ofrZjPnYVi8VipJgzk5hXOxOtIe80fvipJBlJAtWEtLUcImI4qxtUzY8eOe+S1kDVi
 t9ZkFb+MWDi+6wgQQtE+oXKJ/wnU4Ve+5j3t6YzHfUZGGHhd6c/hPBri3XCUXPFvR+ze
 a5ozduyhYuJ0s2AKU2QMyLhMfs4DTOVutH0dGpdkJtMqh6Paa3dyasHm3GsP/z4z1For
 0a8TYKuohCGvhvufh7HpfzrmGzW+rR4Lt7oDMpRA0FvXnF+8xG5G60kvYeSlZ1yzP0yn
 Rs2IahBNeCNmy3tYRZyX74W8EQeo0eFaKMva35ESP7Ru8NRKKQum3+XM6tSGVBK+E6RQ
 NpeA==
X-Gm-Message-State: AOJu0YyxtobzFGWbtlsrMgCNCJLIxgvKkIvt6TiNDH8RhlfI94uC6rLG
 PbkB0P227AxYKx4ApPAKx8InSkaLbSz62YBv9byExnz4F0zeIz8DGn8O5v9J4fQximDEO80IVpP
 Q/QKqa4jsTR3rgD15fPlH9yawrrSza/aGw23+oieJ5V/bsX2HVnRADg==
X-Gm-Gg: ASbGnct/pcaRXZYiB1fQ65HaSPxKmNSxJM5PXmpqHZb1mNH2rsZQptygiPmi2uFekxU
 zgNgMCGXAL6xDD5R5hhFjfj35rgDnEWevkQWMefb3ow6mx3Qrvc/RsC77haFWgS8qHdS2ysygiP
 rB2YcVQ7MgljISEexmDsons+Er6Gp9Vv2Wddef3iVidXQRn0pOJk3dAvVQSZA9G2kRDgfBaZb2l
 oBaVRQSjN0nMN0/RzZCSSS83vSIr+XyqKkUtW3yDHll605saqOO7jc6LYSWjw+8kgLNISWZh40Q
 1piJF2Nv0ddfMbK51xBvOn2EHffcnZ9R6n5HJFgxozuoDsguv1Tds4u6FTiQl9jhtrSlJGrOb8C
 Zpgqo5luTPf6eK0WONQpi+UPOUa33ZiyvQu4zNCvhBwsv8w==
X-Received: by 2002:a05:600c:3e12:b0:45b:7d77:b592 with SMTP id
 5b1f17b1804b1-471178a74demr269664195e9.12.1761563642880; 
 Mon, 27 Oct 2025 04:14:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXiRPNvBdDoUXgfgjhOiWXW7XhCGEauvpSnaZf/rD8J2Y67pmzryMQSElmLxkkNQ2xquIkFQ==
X-Received: by 2002:a05:600c:3e12:b0:45b:7d77:b592 with SMTP id
 5b1f17b1804b1-471178a74demr269663915e9.12.1761563642335; 
 Mon, 27 Oct 2025 04:14:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475ddab6adcsm62452205e9.9.2025.10.27.04.14.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 04:14:01 -0700 (PDT)
Message-ID: <6576d1b9-dd44-4efe-946f-4dedc6df84d8@redhat.com>
Date: Mon, 27 Oct 2025 12:14:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/27] hw/pci-host/gpex: Allow to generate preserve
 boot config DSM #5
To: Jonathan Cameron <jonathan.cameron@huawei.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 jgg@nvidia.com, nicolinc@nvidia.com, ddutile@redhat.com,
 berrange@redhat.com, nathanc@nvidia.com, mochs@nvidia.com,
 smostafa@google.com, wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 shameerkolothum@gmail.com
References: <20250929133643.38961-1-skolothumtho@nvidia.com>
 <20250929133643.38961-17-skolothumtho@nvidia.com>
 <20251001140523.00006635@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251001140523.00006635@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G_vT-N0a-FxVX8QTmontheDUFuUWojGIvRCsbD7gTXI_1761563643
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



On 10/1/25 3:05 PM, Jonathan Cameron wrote:
> On Mon, 29 Sep 2025 14:36:32 +0100
> Shameer Kolothum <skolothumtho@nvidia.com> wrote:
>
>> From: Eric Auger <eric.auger@redhat.com>
>>
>> Add a 'preserve_config' field in struct GPEXConfig and if set, generate the
>> DSM #5 for preserving PCI boot configurations. For SMMUV3 accel=on support,
>> we are making use of IORT RMRs in a subsequent patch and that requires the
>> DSM #5.
>>
>> At the moment the DSM generation is not yet enabled.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> [Shameer: Removed possible duplicate _DSM creations]
>> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> Throw an AML blob in the patch description as easier to check that against
> the spec.  Add a specific spec reference as well.
>
>> ---
>> Previously, QEMU reverted an attempt to enable DSM #5 because it caused a
>> regression,
>> https://lore.kernel.org/all/20210724185234.GA2265457@roeck-us.net/.
>>
>> However, in this series, we enable it selectively, only when SMMUv3 is in
>> accelerator mode. The devices involved in the earlier regression are not
>> expected in accelerated SMMUv3 use cases.
>> ---
>>  hw/pci-host/gpex-acpi.c    | 29 +++++++++++++++++++++++------
>>  include/hw/pci-host/gpex.h |  1 +
>>  2 files changed, 24 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
>> index 4587baeb78..e3825ed0b1 100644
>> --- a/hw/pci-host/gpex-acpi.c
>> +++ b/hw/pci-host/gpex-acpi.c
>> @@ -51,10 +51,11 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq,
>>      }
>>  }
>>  
>> -static Aml *build_pci_host_bridge_dsm_method(void)
>> +static Aml *build_pci_host_bridge_dsm_method(bool preserve_config)
>>  {
>>      Aml *method = aml_method("_DSM", 4, AML_NOTSERIALIZED);
>>      Aml *UUID, *ifctx, *ifctx1, *buf;
>> +    uint8_t byte_list[1] = {0};
> The inline declaration is a bit odd, but I'm not seeing a specific reason to
> change that here.  Perhaps call out the change as some 'other cleanup' in the
> patch description if you want to make it anyway.
I think this is a good cleanup anyway.
>
>>  
>>      /* PCI Firmware Specification 3.0
>>       * 4.6.1. _DSM for PCI Express Slot Information
>> @@ -64,10 +65,23 @@ static Aml *build_pci_host_bridge_dsm_method(void)
>>      UUID = aml_touuid("E5C937D0-3553-4D7A-9117-EA4D19C3434D");
>>      ifctx = aml_if(aml_equal(aml_arg(0), UUID));
>>      ifctx1 = aml_if(aml_equal(aml_arg(2), aml_int(0)));
>> -    uint8_t byte_list[1] = {0};
>> +    if (preserve_config) {
>> +        /* support for function 0 and function 5 */
>> +        byte_list[0] = 0x21;
> Change the comment to reflect the fix in previous patch as otherwise
> it sounds like bit(0) means function 0 is supported.
>
>        /* support functions other than 0, specifically function 5 */

yeah I was confused too after all this time. Maybe quote the ACPI spec
at least in the commit msg:

"
If Function Index is zero, the return is a buffer containing one bit for
each function index, starting with zero. Bit 0 indicates whether there
is support for any functions other than function 0 for the specified
UUID and Revision ID. If set to zero, no functions are supported (other
than function zero) for the specified UUID and Revision ID. If set to
one, at least one additional function is supported. For all other bits
in the buffer, a bit is set to zero to indicate if that function index
is not supported for the specific UUID and Revision ID. (For example,
bit 1 set to 0 indicates that function index 1 is not supported for the
specific UUID and Revision ID.)
"

Eric


>
>> +    }
>>      buf = aml_buffer(1, byte_list);
>>      aml_append(ifctx1, aml_return(buf));
>>      aml_append(ifctx, ifctx1);
>> +    if (preserve_config) {
>> +        Aml *ifctx2 = aml_if(aml_equal(aml_arg(2), aml_int(5)));
>> +        /*
>> +         * 0 - The operating system must not ignore the PCI configuration that
>> +         *     firmware has done at boot time.
>> +         */
>> +        aml_append(ifctx2, aml_return(aml_int(0)));
>> +        aml_append(ifctx, ifctx2);
>> +    }
>> +
>>      aml_append(method, ifctx);
>>  
>>      byte_list[0] = 0;
>> @@ -77,12 +91,13 @@ static Aml *build_pci_host_bridge_dsm_method(void)
>>  }


