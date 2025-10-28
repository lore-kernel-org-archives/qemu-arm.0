Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178A9CCD1BF
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 14:59:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDlAO-0008Gr-7D; Tue, 28 Oct 2025 10:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDlAM-0008GE-RJ
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 10:59:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDlAH-0006eK-Fo
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 10:59:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761663549;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rxGGz+2X4ypdTnDUgnXV0gyvH8gT2giV+hULMQqRzOU=;
 b=gwdaQxiPwG4Mei1NE0Yaf17UO1z1O1JZcW5dgHHI49Gqv4vy1u0NSeufJ91C4Hib3HHMZW
 y4vn3c16xP3HeGVX+feq++pF2gKtn0NFhkWUuzOz981ztA3GWOmrlQs+Rcyl52yurzlB3A
 EQKolqScmdJhUVU4t1DT8d+p5iIgdwk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-At18kf0NON2YWWdr5NvMwQ-1; Tue, 28 Oct 2025 10:59:05 -0400
X-MC-Unique: At18kf0NON2YWWdr5NvMwQ-1
X-Mimecast-MFC-AGG-ID: At18kf0NON2YWWdr5NvMwQ_1761663544
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-471201dc0e9so35907375e9.2
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 07:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761663544; x=1762268344;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rxGGz+2X4ypdTnDUgnXV0gyvH8gT2giV+hULMQqRzOU=;
 b=Depx/cNGySLKH9CW9f3iDA7ijP2RZW5j71hEqYbjt+iac+/XOgT24x6xnIKhWA1urv
 +uBLlmdNF489nLNPCgY+h9DfcfrZB3zzmUwr8EV2u10cG5b5KkwcLfaweneNmkYUpZBa
 V1+x6DJbuVmBTu8fLtpt/2gtKETyGTCfeEDzmZZDLFF2B0QTvh++k7ubJDMRzVuGyfxK
 l0TfGxbMiomMgG0pKjlxFK48ngJl008V+db6zrOBdhmTSET6hKhck5TohgCY4poQQhnO
 /u1P1GyFtxvmTXqxe6Q/P6xiwf2FvxfLxH/SKs5ljjx+WwKmyJJMw95Q70RHTIFDIHRa
 xxDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMhCkaJbc4pUdVmCNVwpXhJFDUXlm7RS+FAV2wBZxiHOT0SKReRYxyPk26cWaEgX7FcaIEb127Tg==@nongnu.org
X-Gm-Message-State: AOJu0YwUniBDx/epr8OyEfK49/qBgQOeiXrYK1F/xT20HG4g0VTCocVT
 4zdEQIovjnuIgh89rBdX3QgONgQRQTg/fB3VsT3MDi0waPoW9wIlWdhq5G462fQgMA6ljpCodmO
 Ra25Xrnw3Ya1YCAsI3HSDwLKgqLpeidIuW7/untImWaujP7DkDyG1jw==
X-Gm-Gg: ASbGncuTfJyV4AlmUNCoWCT+akJF3izIhy4Y12rYG0vJrx+DJ2oLny4Ke2oNYBFMc3/
 WwS/Avz4sT9bHSsEUwzaeWhsmMwpPsPo8gRcsgLV364yFYjMNZItKJXJohFvpnr5JBzkvCkZMKL
 K7webkmmCMbPmgrnT/ozAGpUW2ZJj0c6voQmLMqlwNxKxgQIRCWcrwJjBRP0XYoQGXoZ5PleXI2
 rCrySbsQ47OpUbEWHPCmHenD5SAEjJLlqY1XpXoL9TvHJ2gGlEBgvahAl89bx7NL6d4CRYWy9jS
 2kc/aWOG01qIw+muTewW7ZSYJx6rcGwFOzDQrB+sw4hncnD5Nnf2bDlOm5xY2YZwaSqw1P+YJEf
 oL5sHOJ5+JeUvA89t43W02ePFfspiKKkw5ckjJ+WwBENZaA==
X-Received: by 2002:a05:600c:6217:b0:475:dd05:93f with SMTP id
 5b1f17b1804b1-47717e70407mr32744395e9.36.1761663544454; 
 Tue, 28 Oct 2025 07:59:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH74yGoEhY2aDD4HnZqnmznjBzv85hjfmkrBMmFCge9XyPmj3iGHUFbmh+R7p9HZHtBXlKveg==
X-Received: by 2002:a05:600c:6217:b0:475:dd05:93f with SMTP id
 5b1f17b1804b1-47717e70407mr32744095e9.36.1761663544028; 
 Tue, 28 Oct 2025 07:59:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd4894c9sm194591435e9.5.2025.10.28.07.59.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 07:59:03 -0700 (PDT)
Message-ID: <30630f4c-0d77-42da-8df9-97e737c5c515@redhat.com>
Date: Tue, 28 Oct 2025 15:59:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/27] hw/arm/smmuv3-accel: Add support for ATS
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, ddutile@redhat.com,
 berrange@redhat.com, nathanc@nvidia.com, mochs@nvidia.com,
 smostafa@google.com, wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, yi.l.liu@intel.com, shameerkolothum@gmail.com
References: <20250929133643.38961-1-skolothumtho@nvidia.com>
 <20250929133643.38961-23-skolothumtho@nvidia.com>
 <26f4d9b2-75be-4913-bb60-01e647a7ec83@redhat.com>
 <aP+oRLu/BYNaAPHG@Asurada-Nvidia>
 <25d22f06-69e2-4954-9bd9-f73f899fc114@redhat.com>
 <aP+xhmLCRu6y0eQm@Asurada-Nvidia> <20251028121625.GF1018328@nvidia.com>
 <9748e922-057b-4e7c-ad6b-b83f5591290a@redhat.com>
 <20251028134148.GH1018328@nvidia.com>
 <15e0d683-e524-44ed-b253-c6221585d9bd@redhat.com>
 <20251028140340.GI1018328@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251028140340.GI1018328@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q6xw7rcULzsZYOrMvAB-ds8zDZ2pWq1y2a1YoPjVUNA_1761663544
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



On 10/28/25 3:03 PM, Jason Gunthorpe wrote:
> On Tue, Oct 28, 2025 at 02:51:29PM +0100, Eric Auger wrote:
>>
>> On 10/28/25 2:41 PM, Jason Gunthorpe wrote:
>>> On Tue, Oct 28, 2025 at 02:21:32PM +0100, Eric Auger wrote:
>>>> On 10/28/25 1:16 PM, Jason Gunthorpe wrote:
>>>>> On Mon, Oct 27, 2025 at 10:53:10AM -0700, Nicolin Chen wrote:
>>>>>
>>>>>> Hmm, that sounds a legit reason, though adding the ATS support to
>>>>>> the emulated SMMUv3 isn't seemingly a small effort...
>>>>> What is "emulated ATS" anyhow?
>>>> I guess it means implementing ATS translation requests and capability to
>>>> send ATS invalidations. something like:
>>>>
>>>> https://lore.kernel.org/all/20250628180226.133285-1-clement.mathieu--drif@eviden.com/
>>> Why would you even want this? The cover letter didn't explain what the
>>> point was.
>> well I am just concerned about exposing ATS support to emulated EPs
>> while we actually do not support it.
> Sure, that shouldn't be done. There is ACPI/DT tables indicating if the
> each device supports ATS and qemu should not be marking the emulated
> EPs as ATS capable in the first place..
>
> However, there is no big work with showing EPs as ATS capable. They
> don't implement an ATC and there is no concept of "translated address"
> inside qemu so the only requirement to make it "work" is to just NOP
> the ATC invalidation SMMU commands for those EPs.
For the record, there is some form of ATS support in virtio-pci devices.
They have an ats property. See hw/virtio/virtio-pci.c and
virtio_pci_ats_ctrl_trigger/pcie_ats_config_write

vhost can be seen as implementing an ATC cache on kernel side.

https://lore.kernel.org/all/20230512135122.70403-1-viktor@daynix.com/
>
>>> qemu emulating two levels of IOTLB caching in software, with a
>>> software page table walk?? Why??
>> About the actual use case for ATS emulation you'd rather ask the
>> contributor, early SW development, IP development?
> I guess, I assume some OOT driver is trying to model their ATC with
> more accuracy. Maybe to bolt qemu onto a chip emulator.
>
> Jason
>


