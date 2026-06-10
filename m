Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B539ACD8CB9
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 14:05:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXJYX-0004VI-D6; Wed, 10 Jun 2026 10:05:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wXJYI-0004Sq-EY
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 10:05:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wXJYG-0006Lg-Lo
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 10:05:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781100303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VrXJxBItmcpIBW1prBlafln7Wk37YqgSLpAOIZaL8gQ=;
 b=FYySQ5qsZE+dB5RYFA9i9to1nc7uCjzz7zml92jijUXWjcuKWn21Lvf5CNtINVD/EFThHp
 3frDRobFI/jwP49mFYfi/6HNsX44MjUTYopJ5lWKl3DiwUAccoKGL9rJItpCVxx2jLug2r
 iC1dH7O+3eMhT4fdV+TaGGG4AMhWT6I=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-D1S2aMVlP7uCJCAY5IuGgw-1; Wed, 10 Jun 2026 10:05:00 -0400
X-MC-Unique: D1S2aMVlP7uCJCAY5IuGgw-1
X-Mimecast-MFC-AGG-ID: D1S2aMVlP7uCJCAY5IuGgw_1781100299
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-8425a9979e1so4672921b3a.2
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 07:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781100299; x=1781705099;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VrXJxBItmcpIBW1prBlafln7Wk37YqgSLpAOIZaL8gQ=;
 b=Rj/0yyvH6fae9N5GfcIREenNglXpZsBcUfWar5ZgPEgdGghBtAcRH2OiEvXmgzXXip
 1AEHGT38x81kFCsSPj607jO9pACqz2JCsOt5Qxip+enSpleBwWEY2h1tTlr7n1iyAwKX
 5Q+ZUvPKftnUbDnZPCH7mgsN+5BYWceu3KtxNzFMAN3tWlA+KwxNzYFAgD53FXGWpqAL
 9AjOn87jf81xS/7gZ/db2X64Rj2iFzqcG5FqKVzIbeaeIYwxELNnpbooaOi2oVxvwmUc
 NQKr1Le9wjGBTnKLzDzUOvayUm1n20VJad7TRrBU9j9ZpHRiYmEFy9YkKt1Abe65GKK2
 j+nA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+ujlmC6bL+9z6jWkEaBZDN/0xssm1cBH6/xhU0wboSzSwcFkP0oYpRqO2YZStRZ7jfdSCRWh9beg==@nongnu.org
X-Gm-Message-State: AOJu0Yy81JVJU3+0oj58OvXoB2oikpxZ+Kjm7MaVKQLcQ2nmK7fmnjhv
 b9Sy7iCYfyI4HEGP5Rht6jZxdzKU+S6jSWytdy0a+Y+vgPLthauiUwr/BAxZ3xk7TMXqZqrbhvv
 REtgRT8VWgvb7rkZZN5iOB840HNQCefCFAID1zhpBoHJgpScQHV+XXA==
X-Gm-Gg: Acq92OGYekJsHmS9r99ecDUqbnpb/sAG6Nfp78f4UvdBMl6X4Jlfl6wxyT8GZSjFkab
 7dcamGDzeCPYmFk3Fx8VzHIsk9UX7tQAGK8OIl9oPRrBLu5IaoGPefhiFkCuzDZX2wd6+g37m4s
 AH4SRAv+BodNYkaAaqk59fwWncBrJt+gXe7zgmQzMpzhw0BUnhbmX4BvYr6Vv3LzjgtCL0bm+c0
 fqigMAFhoez+4olUdv+o2yhGEdz1JjpIF8CFWz9U0PZQKPfzl/dr+35XsGiDibEDxjwdE7XO3rD
 ON5txH/C/zoHVpNWEwsx8Ev2x6n1lZLcmJ/cFRZbRAgDc1XWqjGEjhNkkMIbSNeO+dKWcjPcJWE
 QeC6e1IIFCwvxCR2wP67nnK6+4lT/5ARD+JfJjY7evs0mIDkBiEIXIcbefgVzt2D3m3471ifUHP
 Q=
X-Received: by 2002:a05:6a00:1f11:b0:842:3801:47f with SMTP id
 d2e1a72fcca58-8430a672800mr8843577b3a.17.1781100299263; 
 Wed, 10 Jun 2026 07:04:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f11:b0:842:3801:47f with SMTP id
 d2e1a72fcca58-8430a672800mr8843509b3a.17.1781100298747; 
 Wed, 10 Jun 2026 07:04:58 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-842828fa877sm25270150b3a.51.2026.06.10.07.04.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2026 07:04:58 -0700 (PDT)
Message-ID: <7cdbbf7b-e245-4d62-9461-a18a680e1719@redhat.com>
Date: Thu, 11 Jun 2026 00:04:52 +1000
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
 <674d5e21-88fa-4a10-a83c-eb6f7ce7032f@redhat.com>
 <ailU5beAUVJ1Fdpt@phrdina-thinkpadt14gen4.rmtcz.csb>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <ailU5beAUVJ1Fdpt@phrdina-thinkpadt14gen4.rmtcz.csb>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4bejDmd6omHjDdMNNzS-5DSRuRblMiT4MJ0xiTfS7_w_1781100299
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 6/10/26 10:23 PM, Pavel Hrdina wrote:
> On Wed, Jun 10, 2026 at 08:55:10PM +1000, Gavin Shan wrote:
>> Hi Pavel,
>>
>> On 6/10/26 7:54 PM, Pavel Hrdina wrote:
>>> On Mon, Jun 08, 2026 at 09:11:50PM +1000, Gavin Shan wrote:
>>>> Hi Daniel,
>>>>
>>>> On 6/8/26 6:55 PM, Daniel P. Berrangé wrote:
>>>>> On Mon, Jun 08, 2026 at 10:18:21AM +1000, Gavin Shan wrote:
>>>>>> On the guest where a NVidia's GH100 card is passed from the host, the
>>>>>> guest system hang can be observed on attempt to compile 'cuda-samples',
>>>>>> as reported by Julia.
>>>>>
>>>>> snip
>>>>>
>>>>
>>>> Thanks for looking into this.
>>>>
>>>>>> By default, the max bounce buffer size is only 4096 bytes, even less
>>>>>> than one page when the guest page is 64KB. This tries to fix the issue
>>>>>> by inheriting the customized max bounce buffer size of the virtio bus's
>>>>>> parent through property 'x-max-bounce-buffer-size' when the customized
>>>>>> size is a larger one. With this applied, no guest system hang is seen
>>>>>> with '-device virtio-blk-pci,...,x-max-bounce-buffer-size=268435456'.
>>>>>
>>>>> "x-max-bounce-buffer-size"  is an experimental / unsupported property.
>>>>>
>>>>> We really shouldn't be expecting users to have to set this in a production
>>>>> deployment in order to stop a guest from hanging.  Even if we dropped the
>>>>> experimental marker from this property, users would still need to know to
>>>>> provide this magic setting, so it would still be broken out of the box.
>>>>>
>>>>> How can we  get a solution that "just works" out of the box, which is
>>>>> fully supported, not relying on experimental properties ?
>>>>>
>>>>
>>>> How do we know that "x-max-bounce-buffer-size" is an experimental or unsupported
>>>> property? I guess the properties whose names start with "x-" are all treated as
>>>> experimental and unsupported?
>>>>
>>>> For this case, the bounce buffer is inevitable as the memory region can't be
>>>> directly accessed. The memory region is initialized by memory_region_init_ram_device_ptr()
>>>> in hw/vfio/region.c::vfio_region_mmap(). So the question is how the allowed
>>>> bounce buffer size can be specified by users, and it's why the existing property
>>>> "x-max-bounce-buffer-size" is reused.
>>>>
>>>> I even thought of a new property for MachineState (e.g. "limited-bounce-buffer"),
>>>> which is set to on by default, following the existing behavior. When it's set to
>>>> off by users, the max (allowed) buffer size won't be checked at all. However, I'm
>>>> not sure if this makes sense at all.
>>>
>>> Hi Gavin,
>>>
>>> You did not answer the question that Daniel was asking, how will user
>>> know that max-bounce-buffer-size should be used if it's necessary to fix
>>> guest system hangs and how will user know what magic value should be set?
>>>
>>
>> Sorry that I missed to answer Daniel's questions. For this specific case,
>> user need to enlarge the bounce buffer size when seeing the following error
>> message. We can add an explicit one in address_space_map() if the existing
>> error message isn't obvious.
>>
>>    qemu-system-aarch64: virtio: bogus descriptor or out of resources
>>
>>    void *address_space_map(AddressSpace *as,
>>                          hwaddr addr,
>>                          hwaddr *plen,
>>                          bool is_write,
>>                          MemTxAttrs attrs)
>>    {
>>        if (!memory_access_is_direct(mr, is_write, attrs)) {
>>            if (l == 0) {
>>                error_report("Running out of bounce buffer size , enlarge it with max-bounce-buffer-size");
>>                *plen = 0;
>>                return NULL;
>>            }
>>        }
> 
> This may work when using qemu directly but users will not see this error
> when using libvirt or management tools like kubevirt.
> 

Ok, then an error message raised by error_report() won't help.

>> As to the value user should take for max-bounce-buffer-size, it is really case by case
>> and decided by user. User needs to try 4096, 8192, ..., 0xFFFFFFFF to figure out the
>> smallest value works for them. The worst case is to set 0xFFFFFFFF.
> 
> Doesn't sound like pleasant user experience playing guessing game to
> figure out how to make a VM work and again will most likely not work for
> kubevirt where users are usually not exposed to these low level properties.
> 
> I'm not familiar with the internals but isn't there a better way how to
> solve it without requiring users to figure out by guessing what value works?
> 

Not really. The worst case is to have 'max-bounce-buffer-size=0xFFFFFFFF',
which is to disable the check against the max bounce buffer size :-)

Peter and Michael already lead the direction to bypass the bounce buffer
for this specific case. It worked for me and no guest hang isn't seen when
the bounce buffer is bypassed in address_space_map().

Thanks,
Gavin


