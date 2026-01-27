Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BF7D2F011
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Jan 2026 13:23:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkj2o-0000uU-Sx; Tue, 27 Jan 2026 08:23:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vkj2k-0000s3-U8
 for qemu-arm@nongnu.org; Tue, 27 Jan 2026 08:23:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vkj2i-0005w3-FY
 for qemu-arm@nongnu.org; Tue, 27 Jan 2026 08:23:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769520219;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=inL7IgFEA5miArJVDHdrdgZLnWIEE2zg4a0hQzkzyfg=;
 b=NWnwHkUZzfpWvvPy/a0yBKLzSYvbrhJ0/W0Me14FBpOj6me2nrxugfNijtz+7IRHNwexLT
 BRFBJ4a+1DOA3Iqorf7GBthoOzExofWAIGvOm4lrc66Ghrf46TNe8Qt8axY71Cdz3/q33M
 VoFY/l7jjQytt+1sQZ5N0yLeOJ/tmNY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-uPzwdwN4Mk-iCSSbKx_y5A-1; Tue, 27 Jan 2026 08:23:37 -0500
X-MC-Unique: uPzwdwN4Mk-iCSSbKx_y5A-1
X-Mimecast-MFC-AGG-ID: uPzwdwN4Mk-iCSSbKx_y5A_1769520216
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-47d62cc05daso52570435e9.3
 for <qemu-arm@nongnu.org>; Tue, 27 Jan 2026 05:23:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769520216; x=1770125016;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=inL7IgFEA5miArJVDHdrdgZLnWIEE2zg4a0hQzkzyfg=;
 b=sY4p86pWMSXpqAuqHL8JSEqeODeQwjwJT8fNCCC4R7QEbKbot1T2VmllMF6zQJVyeX
 Dk/w1E0wQAaxpyRZfxC6pv+Z7229mA2Ln1dlGB5dm5caromi3ui1ezMauW/4ZNKXXvCf
 9FAn/Ztc7CwDWzI+URo3eOlBwMmzlSjoIiS9PincvH9FkCgr9L8qrnREQRmskrNiCv2j
 jAziDU2iHiDaSYdr5Mgd+gvgrXVVS9eQ/MjGyP4ero3WbjqbSIxrMN9/boQfJfj/8nSs
 JClDDnoPq9XkZBVxglOPbcU4KVfSjOKGwA43lSSP9ymgPWh3DFNm1XtX3jolJtq19vuy
 cvVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFdpugeghqsCGQ6AhYH5ilZ5asyLhxWFgXgmJyfMJx5yq191Ea/iswIuLwhUe+Z4bfYWPGo6dpRA==@nongnu.org
X-Gm-Message-State: AOJu0YwTgsFFoa01RseTn/hEizdQjEM95UFnprp+TKFn+Apm/XRyi6/u
 mptkE5r/z6e6QnSGqOcVhel5tfH7kdgJXbvy8TZkKJRrXoIM+4fyDM/fOkHbMi8MXiOnPfgMI+L
 3hx4hkYw2VpO2xWIOay7uIGnFqqNszDC1yOUSY2c57U1WWbs3fSTdLQ==
X-Gm-Gg: AZuq6aIDRanCMsCLYrz7REBxHWjTxEK8HxY3+Mlb0/729HQp31IqgqN5C83GtP+fP/J
 hZu36BdeFAGwDYZOC+39eMgFgpdPB+go+LxyAyfBY/1LQSkku9bGYovdY1zIiyN0rzXEGYOKwHq
 jQjZAuatf6il4CIQ+k1Z0XwKU0h1RgSQfzgY/JJ0IpozPyhzWgxuQ81STzcefDu9DjrWHfiApcp
 nu9KJroNvfGiHD4cbgBzD8FRaQy21O1JuPJOEy+D5nfETG/30KP3aZMjJYOfgzM0tbOXasxwOHN
 14lxAK6gpKJUqxZXp5SR+vR4p+9BX7QIVepTJpMtVSbEB+zZhyBGV1B+aELgdSz2wUTxYS37gTm
 unovMdralHma/CQ1BOOCPJJLMQt06oYVMZajLrEWHMT4yLBnxtxOkVdZTzA==
X-Received: by 2002:a05:600c:e40b:b0:479:3a86:dc1c with SMTP id
 5b1f17b1804b1-4806a5bef0fmr16471945e9.36.1769520215693; 
 Tue, 27 Jan 2026 05:23:35 -0800 (PST)
X-Received: by 2002:a05:600c:e40b:b0:479:3a86:dc1c with SMTP id
 5b1f17b1804b1-4806a5bef0fmr16471565e9.36.1769520215199; 
 Tue, 27 Jan 2026 05:23:35 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c428basm63499945e9.12.2026.01.27.05.23.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 05:23:34 -0800 (PST)
Message-ID: <26e22c1c-09bc-4e6e-9859-bc8092b8ca7a@redhat.com>
Date: Tue, 27 Jan 2026 14:23:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/16] hw/arm/tegra241-cmdqv: Map VINTF Page0 into
 guest
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, nathanc@nvidia.com,
 mochs@nvidia.com, jgg@nvidia.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, kjaju@nvidia.com
References: <20251210133737.78257-1-skolothumtho@nvidia.com>
 <20251210133737.78257-7-skolothumtho@nvidia.com>
 <58f0ca59-b08c-44cd-b469-f152271c14f6@redhat.com>
 <aXgBD/N+aOVNlcGb@Asurada-Nvidia>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <aXgBD/N+aOVNlcGb@Asurada-Nvidia>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7O1eXBNHElX62ir2P9LHH4bGxvDFj3C850uazJIvoGc_1769520216
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Nicolin,

On 1/27/26 1:04 AM, Nicolin Chen wrote:
> On Mon, Jan 26, 2026 at 02:48:55PM +0100, Eric Auger wrote:
>
>>> +    name = g_strdup_printf("%s vcmdq", memory_region_name(&cmdqv->mmio_cmdqv));
>>> +    memory_region_init_ram_device_ptr(&cmdqv->mmio_vcmdq_page,
>>> +                                      memory_region_owner(&cmdqv->mmio_cmdqv),
>>> +                                      name, 0x10000, cmdqv->vcmdq_page0);
>>> +    memory_region_add_subregion_overlap(&cmdqv->mmio_cmdqv, 0x10000,
>>> +                                        &cmdqv->mmio_vcmdq_page, 1);
>>> +    g_free(name);
>>> +
>>> +    name = g_strdup_printf("%s vintf", memory_region_name(&cmdqv->mmio_cmdqv));
>>> +    memory_region_init_ram_device_ptr(&cmdqv->mmio_vintf_page,
>>> +                                      memory_region_owner(&cmdqv->mmio_cmdqv),
>>> +                                      name, 0x10000, cmdqv->vcmdq_page0);
>> I don't get why we need/have 2 RAM devices pointing to the same @ptr
>> = cmdqv->vcmdq_page0. Is 0x10000 ~ VCMDQ_REG_PAGE_SIZE?
> The first one is for "vcmdq" and the second one is for "vintf".
> Explaining below...
>
>> The names of the MRs are quite confusing: If my understanding is correct
>> we have;
>>
>> cmdqv->mmio_cmdqv (0x50000 sized) which as the container for the 2 subregions.
>> Then within that one we have 2 subregions, one at offset 0x10000 (mmio_vcmdq_page
>> ), one at offset 0x30000 (cmdqv->mmio_vintf_page).
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c?h=v6.19-rc7#n19
> It's defined in the kernel driver (yea, we should clarify in the
> QEMU code as well).
>
> So, the MMIO regions look like this:
>  1st 64 KB page -- Global CMDQV registers
>  2nd 64 KB page -- Global VCMDQ registers Page0 (mmap)
>  3rd 64 KB page -- Global VCMDQ registers Page1 (trap)
>  4th 64 KB page -- VINTF0 Logical VCMDQ registers Page0 (mmap)
>  5th 64 KB page -- VINTF0 Logical VCMDQ registers Page1 (trap)

This kind of layout representation is really helpful
>
> In real hardware, there will be 6th 64KB and beyond, for VINTF1
> and others. But, we're omitting here in QEMU as only VINTF0 will
> be supported -- kernel only exposes one VINTF per VM as well.
> (Yes, we should clarify this too.)
OK
>
>> I have difficulties to link that with the commit message
>>
>> "Tegra241 CMDQV assigns each VINTF a 128KB MMIO region split into two
>> 64 KB pages:
>>  - Page0: guest accessible control/status registers for all VCMDQs
>>  - Page1:configuration registers  ../.."
>> Those 2 pages, are they part of  mmio_vcmdq_page?
> Not exactly. Both the global VCMDQ region and VINTF region have
> their own pages (at 0x10000 and 0x30000).
>
> Here, it duplicates the mapping to 0x10000 (Global VCMDQ page0)
> and 0x30000 (VINTF0 page0) for simplification, because we only
> support VINTF0 in this case.
so Global VCMDQ registers Page0 and VINTF0 Logical VCMDQ registers Page0
are basically the same?

I would recommend to use cmdqv->mmio_vcmdq_page0 and
cmdqv->mmio_vintf_page0 to avoid any misunderstanding
>
> There is a little catch in this implementation. The real physical
> mapping between a global VCMDQ and a logical VCMDQ happens when
> QEMU calls HW_QUEUE ioctl. So, the mmap'd page0 doesn't have any
> real VCMDQ backing up the emulated VCMDQ. So, perhaps QEMU should
> trap the page0 and delay the memory_region_init_ram_device_ptr()
> until the HW_QUEUE ioctl is done?
might be safer indeed.
>
> There might be also a corner case: when the kernel exposes two
> physical VCMDQs, but the guest OS only uses one, i.e. QEMU only
> allocates one HW_QUEUE for VCMDQ0 but doesn't allocate VCMDQ1.
> In such a case, the VTINF0 page0 should be able to control the
> logical VCMDQ0 only, while the global page0 should control both.

you lost me. Need to look at the kernel or spec ;-)
>
> We are getting away this corner case with any guest OS running
> Linux kernel because it only accesses VTINF pages. But likely we
> should do something about it..
>
>> Then you talk about 0x30000 :VINTF register I guess this is the second cmdqv->mmio_vintf_page
>>
>> Well I am confused at this stage of the reading.
>>
>> Also without any spec, this is difficult to understand. Is there any public doc?
> It seems that Red Hat can get the doc under NDA..
OK thanks

Eric
>
> Thanks
> Nicolin
>


