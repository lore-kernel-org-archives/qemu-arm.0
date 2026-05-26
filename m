Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76440CD5BB4
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 08:37:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRnHe-0000AH-JA; Tue, 26 May 2026 04:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wRnHd-0000A0-Kj
 for qemu-arm@nongnu.org; Tue, 26 May 2026 04:37:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wRnHb-0008KO-GT
 for qemu-arm@nongnu.org; Tue, 26 May 2026 04:37:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779784621;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lAGIYTm3PLf2YGmEuUsB9jbtBAvxsN3eTjI00Y5hZEA=;
 b=FsH+cSkhYhCyZxk6G+ZwYUhQxAsUuKv6oG1xip0F64dYU3krFvL1Lo1HiHqsuXswj6XfaE
 HtfX3kAXgbbkXqC9ml8c0Js+t1RZU1l3uG/h2CqmTysa0Q4POHK/RU6cwOaF47FPkDX0Pv
 FM9p0iYiCCKvOhaiHC0icY5UkYd4uZM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-RBIuehGQPJuwPpLJobYz5g-1; Tue, 26 May 2026 04:36:59 -0400
X-MC-Unique: RBIuehGQPJuwPpLJobYz5g-1
X-Mimecast-MFC-AGG-ID: RBIuehGQPJuwPpLJobYz5g_1779784618
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-48e79219704so71634705e9.1
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 01:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779784618; x=1780389418;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lAGIYTm3PLf2YGmEuUsB9jbtBAvxsN3eTjI00Y5hZEA=;
 b=jtZ6MrVgCVrBktBdA2Ff/UHs0bcVPab91L+4mp45NfdeUIP1wEApp3VGzugHUnwCoQ
 2qmu/e7hrdNCNXQI2rUfqFwHwY9EtaMw21rMcWdxj11xJ3HZS+6XaFww/c9HEOBc03EY
 p02reQcSMs49MG/q1fS/41Poi/U41+8XYF6PND9pz7DZqwYF+AEuXqnZpAWaUPy/IVsW
 qZ/cYSUt0ykuZUTPjHJQYtJbxLF5qMEmQt5UTClgkxGbCLxGArdr7De0pDk7TL7a3zKU
 A/egfak+Kuh0EjqiJTWxhyd1kJrnVpcsOhooAHc4jiC0IR4bpeks8LaUxkFah3NWRuWj
 skXw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/ZqbNJD/Bak1Ru9hJDc6VQ8Ep5KkwTGFoMtBhZ9y4j35ch0hs8Eb0bfEUv1wWhlXujlU7/L2M5nQ==@nongnu.org
X-Gm-Message-State: AOJu0YxosbLAvFem5qwo32Myso/DvfoD+Kko6JUr1b0yERQsugw0CrdX
 GsGCqPBE3WYz7M65w+cq8h7ykbfKOedF3i4yq1DydIN2G9gPOb7C6VcBQUtDpVEvPRQ1wN5Jiup
 u0X5Qqo29Po33y7xC+bkgxOyWGfRTD4oPk5xUSvjdt2ToR1Npmp6n0w==
X-Gm-Gg: Acq92OGWG7pV9Zk3s2TjphnNSpkaUuIA0nYN/Jx1IHGxu79mY5oNxnszL5OQg3LWgc+
 kSTDVilfHJVPQY4ARGjrf5hiDEXgOqG/x0Vk98gJwASFwqxHJI/MU1B/aESydjw3GEB0f2gCKT1
 YSz6h3nGdbBFOnjnRIHSeJGom6ps8vDlCgt+AlPLoFOkEaVVclNHWLjnHOfRR/WbdkOnD5TQYgW
 fTEP2NYIBwcwdIUjAXu96EdFy3fWAqv2GuSU3FSWwRV1BX3JuIf7qYGjiJSGSHkoKLB5CXFEoKc
 IgDN3Vu+8Rt1mXryUCu8Jji7FNwhw9L4FdcmbkFT0vBm+gPuryw3ElTr0umSH0SWtwZlFZBj+0J
 z8LZhHHavidX7GyK4mZ6iPfRK5RlHA/dT+mL2GeH+uEhByL+a4mxL3eDGxIKrslGr6FTN4w==
X-Received: by 2002:a05:600c:a49:b0:490:6889:202 with SMTP id
 5b1f17b1804b1-4906889026emr107277225e9.29.1779784618522; 
 Tue, 26 May 2026 01:36:58 -0700 (PDT)
X-Received: by 2002:a05:600c:a49:b0:490:6889:202 with SMTP id
 5b1f17b1804b1-4906889026emr107276685e9.29.1779784618114; 
 Tue, 26 May 2026 01:36:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490452765f5sm319397265e9.5.2026.05.26.01.36.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2026 01:36:57 -0700 (PDT)
Message-ID: <e3af7e21-f5cd-47fa-85f3-d8744b529246@redhat.com>
Date: Tue, 26 May 2026 10:36:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/32] hw/arm/tegra241-cmdqv: Allocate HW VCMDQs once
 configured
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "clg@redhat.com" <clg@redhat.com>, "alex@shazbot.org" <alex@shazbot.org>,
 Nathan Chen <nathanc@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 Jiandi An <jan@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 Krishnakant Jaju <kjaju@nvidia.com>, "phrdina@redhat.com"
 <phrdina@redhat.com>
References: <20260519103727.899332-1-skolothumtho@nvidia.com>
 <20260519103727.899332-20-skolothumtho@nvidia.com>
 <166c5efb-0fa3-49f6-a1e7-faec85a6ec44@redhat.com>
 <CH3PR12MB7548314422301EA66803DD40AB0E2@CH3PR12MB7548.namprd12.prod.outlook.com>
 <69ec35de-1f7c-40ae-9ea5-3727c047c590@redhat.com>
 <ag9/KMztV/pb7lA0@Asurada-Nvidia>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <ag9/KMztV/pb7lA0@Asurada-Nvidia>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oe2KBdnGqlHHKILkCL-J1xMf2AhHE4BbCGynM0iVi1w_1779784618
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Hi Nicolin,

On 5/21/26 11:54 PM, Nicolin Chen wrote:
> On Thu, May 21, 2026 at 03:27:17PM +0200, Eric Auger wrote:
>> On 5/21/26 2:26 PM, Shameer Kolothum Thodi wrote:
>>>>> +    /* Ignore any invalid address. This may come as part of reset etc. */
>>>>> +    if (!address_space_range_is_ram(&address_space_memory, addr, size)) {
>>>> why do you need to test the whole range and not only the start addressa
>>> That was to make it more defensive based on v4 discussion here:
>>> https://lore.kernel.org/qemu-devel/aft%2FDTFLqQnufzWl@nvidia.com/
>>>
>>> Please let me know if there is a better way.
>> Well it is unclear to me. You want to make sure the GPA was fully set
>> through the H and L regs. To me that's enough. As far as I understand
>> Nicolin's reply, the kernel checks the rest. But please sync with Jason
>> or Nicolin
> Yes. Kernel checks if the range is in the stage-2 page table, i.e.,
> mapped GPAs. One caveat: mapped GPA doesn't guarantee it's is_ram.
>
> So, what if the GPA is in the IO space (PCI BAR) or reserved space
> (firmware)?
>
> AFAIK, kernel doesn't have a way to know. So, it's VMM's job to do
> so.
would it jeopardize the host integrity or would it just break the
misbehaving guest. If the latest I am not sure this is critical to
check. We are not checking either with regular SMMU cmd queues

Thanks

Eric
>
> Nicolin
>


