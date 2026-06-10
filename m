Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDDECD8CB2
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 10:55:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXGaj-0000ru-GS; Wed, 10 Jun 2026 06:55:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wXGai-0000rS-CC
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 06:55:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wXGag-00037A-RB
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 06:55:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781088921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m0J+RJppz2U69gfioEgmnWduX6kml7jg1af9oTlbIFU=;
 b=TuENeACW1nuoELTLugdHMNMTYGFJjg4e6NW6JE0hzSXNKbJ0DcLJ1GVVYEf+TQOBP5zpde
 waMdhIY9Krw/nx4K6a+LBpDHvYSFtdx7N58f4hyve1YYTsK70Raab9H8hAUMKDOR/dmIsz
 IYI8XVqUUBP826U3J57YLh1hHmDTKbo=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-UL_8oVumO3SBK8v0tGt1vQ-1; Wed, 10 Jun 2026 06:55:18 -0400
X-MC-Unique: UL_8oVumO3SBK8v0tGt1vQ-1
X-Mimecast-MFC-AGG-ID: UL_8oVumO3SBK8v0tGt1vQ_1781088917
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2bf08c2a24bso63576815ad.2
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 03:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781088917; x=1781693717;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m0J+RJppz2U69gfioEgmnWduX6kml7jg1af9oTlbIFU=;
 b=o4f6uwjZoX/wyQS+wCrHZPOD3ezsnkhJ8zdRK2sVftVvT8ZkG86D4e/bpy9LeSuFM2
 zNPBZmQZw62tgAonE1LXs/na6t129cupDsOTt6Yp8Wm/uOlpZxLyryXMbRr5nus5DwEI
 leIM3pyvbbf40Ylm/MBNfoj3bTQCkXGuwKGYS2Oeftc7xH4x+XNqoGiqduiUeyZ5yWqA
 DX4UwkGzf+4S1L4YkK1WC1Xv5HTb6i6GRHr0TcAkT8meie7RZU8X1L+0sU6tRE59y/hi
 LdlyzErNcQK08hK8FpmwZXoclv2iSDsOspXG708lKpEmDdBtcwp74i/BXrL4KWst2+6j
 l1tw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8NRHedWcOnuP/rFTMu4EFccR5hGKrtA/O3Rdn1DejdP6HDXx32Fqv4O4VZsjmdCQrvp35hEa50rA==@nongnu.org
X-Gm-Message-State: AOJu0YyGVBZyygMearLVuW8mnqESQdwseAmSdKmeahPhZ5s5ryHG/asN
 oHteH6IZKqM3VWZsRS9/ai++CwCaD2GjNqcavp/JPk2CC856vhZfbXEnitskpx4/pBYt137X8qn
 /uc8s0TdPs91utCt4EMtlbltP34x0oX7V3Ukl2zUiRjVkcGVh8WE/uQ==
X-Gm-Gg: Acq92OG3Z1+88h0YAVfnuRw9mA7XhxrNqLlX2ITFA+1aKJvNPlyZPgr6B6WgRZrTkag
 tdDgdhMFPJLLFg72w8+Dtn+TJpJYnJAfnhIcZSH1YPKtnzPm+Q67SDcAxPHbHLPkHExo0Sk28tF
 es4DnDvG0MORYiSUarfF8tYon9515BEslcUTMSw2ot/Y/xUcFP23tCUJymnDP1CQZfPPrlQtWWA
 Ukg2AWMEMOw6rnjd5SJnFeh91SMp83KBThIttCw/yzxr2UkpiF1ZuyGmpssqYE1S62Db4Evbhp3
 y5Yzt8Xk6fxdTLW+SisGT904wSuWdBXmvgfPZ9zZVcdkm8WQwaAFaNXQfW8ipKHHAJIEN2QkOd1
 8g+bXUOHURy5+z7Rn5cFnq9U6Yc6WoRZThUP3Xb2OVxvUZmXOTFTjlTVf5myRSQHrGIPrKcKdpK
 k=
X-Received: by 2002:a17:902:fc85:b0:2ba:bfb5:9cc with SMTP id
 d9443c01a7336-2c2a1c87479mr86015895ad.26.1781088917133; 
 Wed, 10 Jun 2026 03:55:17 -0700 (PDT)
X-Received: by 2002:a17:902:fc85:b0:2ba:bfb5:9cc with SMTP id
 d9443c01a7336-2c2a1c87479mr86015535ad.26.1781088916612; 
 Wed, 10 Jun 2026 03:55:16 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c16649ca4dsm240517215ad.76.2026.06.10.03.55.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2026 03:55:16 -0700 (PDT)
Message-ID: <674d5e21-88fa-4a10-a83c-eb6f7ce7032f@redhat.com>
Date: Wed, 10 Jun 2026 20:55:10 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv1] virtio: Inherit max bounce buffer size from bus
 parent if possible
To: Pavel Hrdina <phrdina@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 mst@redhat.com, jugraham@redhat.com, shan.gavin@gmail.com
References: <20260608001821.850921-1-gshan@redhat.com>
 <aiaDgG26a6TUrKuM@redhat.com>
 <07ca74b4-52a8-4187-a57c-7c3277e574d3@redhat.com>
 <aiky9d9IwACIyKEC@phrdina-thinkpadt14gen4.rmtcz.csb>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <aiky9d9IwACIyKEC@phrdina-thinkpadt14gen4.rmtcz.csb>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LZ8nADDwnWtcqmrcFNwyz94lg7V4GbGlOab9bh4vomg_1781088917
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Pavel,

On 6/10/26 7:54 PM, Pavel Hrdina wrote:
> On Mon, Jun 08, 2026 at 09:11:50PM +1000, Gavin Shan wrote:
>> Hi Daniel,
>>
>> On 6/8/26 6:55 PM, Daniel P. Berrangé wrote:
>>> On Mon, Jun 08, 2026 at 10:18:21AM +1000, Gavin Shan wrote:
>>>> On the guest where a NVidia's GH100 card is passed from the host, the
>>>> guest system hang can be observed on attempt to compile 'cuda-samples',
>>>> as reported by Julia.
>>>
>>> snip
>>>
>>
>> Thanks for looking into this.
>>
>>>> By default, the max bounce buffer size is only 4096 bytes, even less
>>>> than one page when the guest page is 64KB. This tries to fix the issue
>>>> by inheriting the customized max bounce buffer size of the virtio bus's
>>>> parent through property 'x-max-bounce-buffer-size' when the customized
>>>> size is a larger one. With this applied, no guest system hang is seen
>>>> with '-device virtio-blk-pci,...,x-max-bounce-buffer-size=268435456'.
>>>
>>> "x-max-bounce-buffer-size"  is an experimental / unsupported property.
>>>
>>> We really shouldn't be expecting users to have to set this in a production
>>> deployment in order to stop a guest from hanging.  Even if we dropped the
>>> experimental marker from this property, users would still need to know to
>>> provide this magic setting, so it would still be broken out of the box.
>>>
>>> How can we  get a solution that "just works" out of the box, which is
>>> fully supported, not relying on experimental properties ?
>>>
>>
>> How do we know that "x-max-bounce-buffer-size" is an experimental or unsupported
>> property? I guess the properties whose names start with "x-" are all treated as
>> experimental and unsupported?
>>
>> For this case, the bounce buffer is inevitable as the memory region can't be
>> directly accessed. The memory region is initialized by memory_region_init_ram_device_ptr()
>> in hw/vfio/region.c::vfio_region_mmap(). So the question is how the allowed
>> bounce buffer size can be specified by users, and it's why the existing property
>> "x-max-bounce-buffer-size" is reused.
>>
>> I even thought of a new property for MachineState (e.g. "limited-bounce-buffer"),
>> which is set to on by default, following the existing behavior. When it's set to
>> off by users, the max (allowed) buffer size won't be checked at all. However, I'm
>> not sure if this makes sense at all.
> 
> Hi Gavin,
> 
> You did not answer the question that Daniel was asking, how will user
> know that max-bounce-buffer-size should be used if it's necessary to fix
> guest system hangs and how will user know what magic value should be set?
> 

Sorry that I missed to answer Daniel's questions. For this specific case,
user need to enlarge the bounce buffer size when seeing the following error
message. We can add an explicit one in address_space_map() if the existing
error message isn't obvious.

   qemu-system-aarch64: virtio: bogus descriptor or out of resources

   void *address_space_map(AddressSpace *as,
                         hwaddr addr,
                         hwaddr *plen,
                         bool is_write,
                         MemTxAttrs attrs)
   {
       if (!memory_access_is_direct(mr, is_write, attrs)) {
           if (l == 0) {
               error_report("Running out of bounce buffer size , enlarge it with max-bounce-buffer-size");
               *plen = 0;
               return NULL;
           }
       }

As to the value user should take for max-bounce-buffer-size, it is really case by case
and decided by user. User needs to try 4096, 8192, ..., 0xFFFFFFFF to figure out the
smallest value works for them. The worst case is to set 0xFFFFFFFF.

> Pavel
> 

Thanks,
Gavin


