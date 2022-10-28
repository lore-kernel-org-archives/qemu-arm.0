Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1009116ejn;
        Thu, 27 Oct 2022 23:54:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7rsAzfcgOzzGaTkpH73zAK6tdL77WLN73N5/Kr/PE0JS+EJr5AZUggcJ+QsXq6VIe4vIY7
X-Received: by 2002:a05:620a:31a5:b0:6ee:b0c2:f54 with SMTP id bi37-20020a05620a31a500b006eeb0c20f54mr37544243qkb.69.1666940064914;
        Thu, 27 Oct 2022 23:54:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666940064; cv=none;
        d=google.com; s=arc-20160816;
        b=sCOJtNFnK+Skq/laOxp8GL1/RCdNTK/Rf6nRbslB0c8XCal06nA7Yvi1LJG0LTh/nk
         q5WG6VzW+hxqCWXDr6/dMrI544v5ZJYDit6Q/yC/Bt/ouYrKHXIpQCs45Mdi+mPJRekr
         tWVufogma07dfblYE+plT4Wny4UOROyE3EHyW7MDAhUmtETFJWqsy4wzkfs31ZtaVOfd
         ZLSIN8G4bNj7ERJPYz+otLiq+iUyXyebrRLyCI+M6mLy3D/lPgT0h5Xe80IhQtKN1gGd
         igsbW6OP+k+s0udwW2P50V6p/fbW+SlRMtQE6JSmnCLaQN1e0f+K6ifc24cAmcPmxjvT
         7eEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=yfcyjftsIL9Gl7gTJR9K9GOainAGft+TTA89VrQ1Uts=;
        b=EELdwoir6TTKL8KpSnm1GywdF29pljREk14PDRUWCcmAFSe+zGwKwwCIGNkAjt3LSi
         t30k/bqGxEvu0xFx8Qz3u9LenfldrbNm6R4dDFPpk7uRaUYHTdjKM8eBNCWlPlQA8QWh
         sYD/QSq+V8dYoQfDox+Whxy/YMP9mDBepNJRz6iyVDaQ8w4UNQ7UeRNv+/XzaUBrMemt
         L1OtOe7tC8Y2je431LaxrfqwNfR/4EsysYIhRviYYLo4US/Gti3FBhy9CaUONclH6Nb9
         Mv0cHydvAbYPOSFknN8YW1VPiyRC/JbNS/43C3w7wFmiA/pYbr7yHa7HKvxsmZoJxK64
         fU6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XsKt4YPv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t19-20020a05620a451300b006cfa8206fcdsi2414085qkp.263.2022.10.27.23.54.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Oct 2022 23:54:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XsKt4YPv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ooJFj-0005FO-4f; Fri, 28 Oct 2022 02:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ooJFH-0004v8-7z
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 02:53:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ooJFC-0005cv-T6
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 02:53:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666940002;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yfcyjftsIL9Gl7gTJR9K9GOainAGft+TTA89VrQ1Uts=;
 b=XsKt4YPv3yL0iwt9t2RP72VtfOoOVlanSvQrYNIsJ2USxkcSF/LZjwKho7qzWqyN5NUBP1
 Tsk1FEAARKhlqvPYyNd88MK2VT+8fHydExorl7KGXlTGJd8Rc3LgK7k8JEz27JGEDvHDy2
 JtTjnduZ4t1/RrF6HxRDgBXTV87j+RI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-phVjfJxHOBGqwPR2Sse46Q-1; Fri, 28 Oct 2022 02:53:18 -0400
X-MC-Unique: phVjfJxHOBGqwPR2Sse46Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8A1A29A9D28;
 Fri, 28 Oct 2022 06:53:17 +0000 (UTC)
Received: from [10.64.54.151] (vpn2-54-151.bne.redhat.com [10.64.54.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 488544221F;
 Fri, 28 Oct 2022 06:53:14 +0000 (UTC)
Subject: Re: [PATCH v6 7/7] hw/arm/virt: Add properties to disable high memory
 regions
To: Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
References: <20221024035416.34068-1-gshan@redhat.com>
 <20221024035416.34068-8-gshan@redhat.com> <874jvsfa1q.fsf@redhat.com>
 <9472b6fc-00dd-bf92-ed23-0f5a9328c45f@redhat.com> <87r0yusuw7.fsf@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <b54092d9-a4a1-ccd5-05ce-05d0d305d141@redhat.com>
Date: Fri, 28 Oct 2022 14:53:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <87r0yusuw7.fsf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Gavin Shan <gshan@redhat.com>
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Bv6S40QtcnX9

Hi Connie,

On 10/26/22 7:10 PM, Cornelia Huck wrote:
> On Wed, Oct 26 2022, Gavin Shan <gshan@redhat.com> wrote:
>>
>> On 10/25/22 6:54 PM, Cornelia Huck wrote:
>>> On Mon, Oct 24 2022, Gavin Shan <gshan@redhat.com> wrote:
>>>
>>>> These 3 high memory regions are usually enabled by default, but
>>>
>>> s/These 3/The/ ?
>>>
>>
>> Ok.
>>
>>>> they may be not used. For example, VIRT_HIGH_GIC_REDIST2 isn't
>>>> needed by GICv2. This leads to waste in the PA space.
>>>
>>> When building the command line, do we have enough information on when
>>> the regions provide something useful, and when they just waste space?
>>>
>>
>> I think the help messages are already indicative. For example, the help
>> messages for 'highmem-redist2' indicate the region is only needed by
>> GICv3 or GICv4. 'highmem-ecam' and 'highmem-mmio' are needed by PCI ECAM
>> and MMIO and the key words 'high' indicates they're the corresponding
>> second window.
>>
>> #./qemu-system-aarch64 -M virt,?
>> highmem-ecam=<bool>    - Set on/off to enable/disable high memory region for PCI ECAM
>> highmem-mmio=<bool>    - Set on/off to enable/disable high memory region for PCI MMIO
>> highmem-redists=<bool> - Set on/off to enable/disable high memory region for GICv3 or GICv4 redistributor
> 
> OK, hopefully this is enough for anyone building a command line
> directly. (Do we want to encourage management software like libvirt to
> switch off regions that are not needed?)
> 

Yeah, to disable those regions aren't needed will make libvirt smart.
I think it's worthy for libvirt to do it. I'm not sure if arbitrary
machine properties have been supported by libvirt or not. For example,
'highmem-redists' can still be turned off from 'vm1.xml' even though
it's not explicitly supported in libvirt's code.

>>
>>>>
>>>> Add properties to allow users selectively disable them if needed:
>>>> "highmem-redists", "highmem-ecam", "highmem-mmio".
>>>>
>>>> Suggested-by: Marc Zyngier <maz@kernel.org>
>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>> ---
>>>>    docs/system/arm/virt.rst | 12 ++++++++
>>>>    hw/arm/virt.c            | 64 ++++++++++++++++++++++++++++++++++++++++
>>>>    2 files changed, 76 insertions(+)
>>>>
>>>> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
>>>> index 4454706392..a1668a969d 100644
>>>> --- a/docs/system/arm/virt.rst
>>>> +++ b/docs/system/arm/virt.rst
>>>> @@ -98,6 +98,18 @@ compact-highmem
>>>>      Set ``on``/``off`` to enable/disable the compact layout for high memory regions.
>>>>      The default is ``on`` for machine types later than ``virt-7.2``.
>>>>    
>>>> +highmem-redists
>>>> +  Set ``on``/``off`` to enable/disable the high memry region for GICv3/4
>>>
>>> s/memry/memory/
>>>
>>
>> Ok, copy-and-paste error. Will be fixed.
>>
>>>> +  redistributor. The default is ``on``.
>>>
>>> Do we need to add a note about what effects setting this to "off" may
>>> have, e.g. "Setting this to ``off`` may limit the maximum number of
>>> cpus." or so? And/or "Setting this to ``off`` when using GICv2 will save
>>> some space."?
>>>
>>
>> We may not mention GICv2 since GICv3/v4 are already mentioned. It's a
>> good idea to mention that the maximum number of CPUs is reduced when
>> it's turned off. I will have something like below in next respin if
>> you agree.
>>
>> highmem-redists
>>     Set ``on``/``off`` to enable/disable the high memroy region for GICv3 or
>>     GICv4 redistributor. The default is ``on``. Setting this to ``off`` will
>>     limit the maximum number of CPUs when GICv3 or GICv4 is used.
> 
> OK, sounds reasonable to me.
> 

Ok, Thanks for your confirm.

>>
>> Since 'vms->highmem_redists' is changeable, the 'virt_max_cpus' in
>> machvirt_init() needs to be recalculated based on that. The code change
>> will be included into next respin. Besides, the follow-up error message
>> will be improved to something like below.
>>
>>     error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
>>                  "supported by machine 'mach-virt' (%d). The high memory "
>>                  "region for GICv3 or GICv4 redistributor has been %s",
>>                  max_cpus, virt_max_cpus,
>>                  vms->highmem_redists ? "enabled" : "disabled");
> 
> Hm, the doc for error_report() states that "The resulting message should
> be a single phrase, with no newline or trailing punctuation." Maybe
> 
>      if (max_cpus > virt_max_cpus) {
>          error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
>                       "supported by machine 'mach-virt' (%d)",
>                       max_cpus, virt_max_cpus);
>          if (vms->gic_version != VIRT_GIC_VERSION_2 &&
>              !vms->higmem_redists) {
>              error_printf("Try 'highmem-redists=on' for more CPUs\n");
>          }
>          exit(1);
>      }
> 

Ok, I didn't notice the message raised by error_report() has this sort
of requirements. Your suggested snippet looks good to me and it will
be included in next respin. However, I would hold next respin (v7) for
a while to see if I can receive comments from Peter/Marc on v6 :)

Thanks,
Gavin

