Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp350303ocb;
        Mon, 3 Oct 2022 16:51:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7TY0NNwk6T3pi1uYFGGh5733ujwCfPPHpczYUeT5ga3tf6eaIOnvNTeZNB6mor4dPTcZC1
X-Received: by 2002:ac8:5990:0:b0:35c:b943:1cde with SMTP id e16-20020ac85990000000b0035cb9431cdemr18069733qte.239.1664841072191;
        Mon, 03 Oct 2022 16:51:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664841072; cv=none;
        d=google.com; s=arc-20160816;
        b=zL4JgPy/jZoLuRnEghiHsiXA0beeIqDnhhsLVtpnGJcL1RItGrkDGiPPUNnJxas2aP
         l7NVpzg4ciHRIgTgHiTA089Rw9zDPibqJbz5TSkShg93u1imNR41+becT9O5xDhyp1dp
         RKQpvAb4Cf2rBs2rU1o/VP26BT6XuiidQfCFe0QAmQ/jMGr7JJm0x0eeslZtEL8o54OR
         YnNX8HY1/TIk2oQ8Xz8udLS8WQKjFDEJhJI6XeLEhFJykatkzs+qSZZ7RiwVEFBzIESU
         Yfx4MM8mIm3gNr/xhBHimpxaC5HKZ3miyiUmuSyE8lrXM7QS0lCVmOXzgOZ+uVG1SY8R
         GCEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=j+PCAW68xDSEMXBBqeoLlNERcW/Wvsd+3G73+S4a72U=;
        b=wP/5eSgwyAf1b3w5BEFAJhNy4g/2jXc43esjWLrGN2eXxebwUjgjZuI6k/EttI31Xe
         z88cn/arqOZ9zpSKvIN9dXK+VvOs/gviSUdfBrSVV6WtxWBhVBPcWot9x9/z1idGTEIA
         NumZdwpnwtdS+Y7sICaQKGLRT04s9EoPcSjieWhXjnpqXU/XR5yI7M26N1Zs69XL5LNC
         gDODLweLLJUPw71tX3h9ksEDO9KLp86i11OEYefKvdWix8bQyW7sNBqTDg3r7onR53zn
         JlTadIGDnJNk2HfwuuSQOII14mzyYcp6HJ5bOJ3gRNTdhZ4KheUBg83Do9iQRU/H3SWm
         2Npw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="go/u8xac";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gf11-20020a056214250b00b0049bb7f7041dsi490811qvb.140.2022.10.03.16.51.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Oct 2022 16:51:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="go/u8xac";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ofVDL-0004Yh-Q7
	for alex.bennee@linaro.org; Mon, 03 Oct 2022 19:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ofVD9-0004Xv-I4
 for qemu-arm@nongnu.org; Mon, 03 Oct 2022 19:50:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ofVD5-0003wC-QP
 for qemu-arm@nongnu.org; Mon, 03 Oct 2022 19:50:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664841055;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j+PCAW68xDSEMXBBqeoLlNERcW/Wvsd+3G73+S4a72U=;
 b=go/u8xac8Ukoz+2aL1s6YPzbzMNPB2DLoiTL9DysFLt0siW7a9d78ord+AoTDq4u4bfM0A
 zvgPxrjml8jeJvAXL40RVBXwS1WpAN+AhNsFzA19Lybzno6HnwPcHNE5yASrtvbMszNzm5
 rb5MYm5wo89RrhYu+NsZbGAl04xitkw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-DiRNQuk1PLmoaQfYXpz29Q-1; Mon, 03 Oct 2022 19:50:50 -0400
X-MC-Unique: DiRNQuk1PLmoaQfYXpz29Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FD3285A5A6;
 Mon,  3 Oct 2022 23:50:50 +0000 (UTC)
Received: from [10.64.54.56] (vpn2-54-56.bne.redhat.com [10.64.54.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EF3D1759E;
 Mon,  3 Oct 2022 23:50:46 +0000 (UTC)
Subject: Re: [PATCH v3 5/5] hw/arm/virt: Add 'highmem-compact' property
To: eric.auger@redhat.com, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, cohuck@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
References: <20220921231349.274049-1-gshan@redhat.com>
 <20220921231349.274049-6-gshan@redhat.com>
 <2e8ace49-b900-de7e-2d81-7bb6c081146e@redhat.com>
 <7656c827-58ce-85c2-87fe-e88206d6f022@redhat.com>
 <1d4040fe-fce8-76a5-bebe-1395db887c32@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <1e72f87f-46e0-fb63-b5c4-7da42f91d98e@redhat.com>
Date: Tue, 4 Oct 2022 07:50:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <1d4040fe-fce8-76a5-bebe-1395db887c32@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.467, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DAAFx7XhIg8t

Hi Eric,

On 10/3/22 4:49 PM, Eric Auger wrote:
> On 9/29/22 01:49, Gavin Shan wrote:
>> On 9/28/22 10:22 PM, Eric Auger wrote:
>>> On 9/22/22 01:13, Gavin Shan wrote:
>>>> After the improvement to high memory region address assignment is
>>>> applied, the memory layout is changed. For example, VIRT_HIGH_PCIE_MMIO
>>> s/the memory layout is changed./the memory layout is changed,
>>> introducing possible migration breakage.
>>
>> Ok, much clearer.
>>
>>>> memory region is enabled when the improvement is applied, but it's
>>>> disabled if the improvement isn't applied.
>>>>
>>>>       pa_bits              = 40;
>>>>       vms->highmem_redists = false;
>>>>       vms->highmem_ecam    = false;
>>>>       vms->highmem_mmio    = true;
>>>>
>>>>       # qemu-system-aarch64 -accel kvm -cpu host \
>>>>         -machine virt-7.2 -m 4G,maxmem=511G      \
>>>>         -monitor stdio
>>>>
>>>> In order to keep backwords compatibility, we need to disable the
>>>> optimization on machines, which is virt-7.1 or ealier than it. It
>>>> means the optimization is enabled by default from virt-7.2. Besides,
>>>> 'highmem-compact' property is added so that the optimization can be
>>> I would rather rename the property into compact-highmem even if the vms
>>> field is name highmem_compact to align with other highmem fields
>>
>> Ok, but I would love to know why. Note that we already have
>> 'highmem=on|off'. 'highmem_compact=on|off' seems consistent
>> to me.
> To me the property name should rather sound 'english' with the adjective
> before the name 'high memory"' but I am not a native english speaker
> either.

Ok. I agree 'compact-highmem' is better. The backup variable name will
be still 'highmem_compact', which is consistent with the existing ones.

>>
>>>> explicitly enabled or disabled on all machine types by users.
>>>>
>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>> ---
>>>>    docs/system/arm/virt.rst |  4 ++++
>>>>    hw/arm/virt.c            | 33 +++++++++++++++++++++++++++++++++
>>>>    include/hw/arm/virt.h    |  2 ++
>>>>    3 files changed, 39 insertions(+)
>>>>
>>>> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
>>>> index 20442ea2c1..f05ec2253b 100644
>>>> --- a/docs/system/arm/virt.rst
>>>> +++ b/docs/system/arm/virt.rst
>>>> @@ -94,6 +94,10 @@ highmem
>>>>      address space above 32 bits. The default is ``on`` for machine
>>>> types
>>>>      later than ``virt-2.12``.
>>>>    +highmem-compact
>>>> +  Set ``on``/``off`` to enable/disable compact space for high
>>>> memory regions.
>>>> +  The default is ``on`` for machine types later than ``virt-7.2``
>>> I think you should document what is compact layout versus legacy one,
>>> both in the commit msg and maybe as a comment in a code along with the
>>> comment in hw/arm/virt.c starting with 'Highmem IO Regions: '
>>
>> Ok, I will add this into the commit log in v4. I don't think it's
>> necessary
>> to add duplicate comment in the code. People can check the commit log for
>> details if needed.
>>
>>>> +
>>>>    gic-version
>>>>      Specify the version of the Generic Interrupt Controller (GIC) to
>>>> provide.
>>>>      Valid values are:
>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>> index b702f8f2b5..a4fbdaef91 100644
>>>> --- a/hw/arm/virt.c
>>>> +++ b/hw/arm/virt.c
>>>> @@ -1734,6 +1734,13 @@ static void
>>>> virt_set_high_memmap(VirtMachineState *vms,
>>>>                base = region_base + region_size;
>>>>            } else {
>>>>                *region_enabled = false;
>>>> +
>>>> +            if (!vms->highmem_compact) {
>>> this snippet should be already present in previous patch otherwise this
>>> will break bisectability.
>>>
>>
>> Hmm, nice catch! I think I need to swap PATCH[4] and PATCH[5] in next
>> revision. In that order, 'compact-highmem' is introduced in PATCH[4],
>> but not used yet. PATCH[5] has the optimization and 'compact-highmem'
>> is used.
> No in general you introduce the property at the very end with the code
> guarded with an unset vms->highmem_compact in the previous patch.
> 

Yeah, what I need is define 'vms->highmem_compact' in PATCH[v3 4/5],
whose value is false. I also need to update @base and @vms->highest_gpa
on !vms->highmem_compact' in PATCH[v3 4/5].

>>
>>>> +                base = region_base + region_size;
>>>> +                if (fits) {
>>>> +                    vms->highest_gpa = region_base + region_size - 1;
>>>> +                }
>>>> +            }
>>>>            }
>>>>        }
>>>>    }
>>>> @@ -2348,6 +2355,20 @@ static void virt_set_highmem(Object *obj,
>>>> bool value, Error **errp)
>>>>        vms->highmem = value;
>>>>    }
>>>>    +static bool virt_get_highmem_compact(Object *obj, Error **errp)
>>>> +{
>>>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>>>> +
>>>> +    return vms->highmem_compact;
>>>> +}
>>>> +
>>>> +static void virt_set_highmem_compact(Object *obj, bool value, Error
>>>> **errp)
>>>> +{
>>>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>>>> +
>>>> +    vms->highmem_compact = value;
>>>> +}
>>>> +
>>>>    static bool virt_get_its(Object *obj, Error **errp)
>>>>    {
>>>>        VirtMachineState *vms = VIRT_MACHINE(obj);
>>>> @@ -2966,6 +2987,13 @@ static void
>>>> virt_machine_class_init(ObjectClass *oc, void *data)
>>>>                                              "Set on/off to
>>>> enable/disable using "
>>>>                                              "physical address space
>>>> above 32 bits");
>>>>    +    object_class_property_add_bool(oc, "highmem-compact",
>>>> +                                   virt_get_highmem_compact,
>>>> +                                   virt_set_highmem_compact);
>>>> +    object_class_property_set_description(oc, "highmem-compact",
>>>> +                                          "Set on/off to
>>>> enable/disable compact "
>>>> +                                          "space for high memory
>>>> regions");
>>>> +
>>>>        object_class_property_add_str(oc, "gic-version",
>>>> virt_get_gic_version,
>>>>                                      virt_set_gic_version);
>>>>        object_class_property_set_description(oc, "gic-version",
>>>> @@ -3050,6 +3078,7 @@ static void virt_instance_init(Object *obj)
>>>>          /* High memory is enabled by default */
>>>>        vms->highmem = true;
>>>> +    vms->highmem_compact = !vmc->no_highmem_compact;
>>>>        vms->gic_version = VIRT_GIC_VERSION_NOSEL;
>>>>          vms->highmem_ecam = !vmc->no_highmem_ecam;
>>>> @@ -3119,8 +3148,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(7, 2)
>>>>      static void virt_machine_7_1_options(MachineClass *mc)
>>>>    {
>>>> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
>>>> +
>>>>        virt_machine_7_2_options(mc);
>>>>        compat_props_add(mc->compat_props, hw_compat_7_1,
>>>> hw_compat_7_1_len);
>>>> +    /* Compact space for high memory regions was introduced with
>>>> 7.2 */
>>>> +    vmc->no_highmem_compact = true;
>>>>    }
>>>>    DEFINE_VIRT_MACHINE(7, 1)
>>>>    diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>>>> index 6ec479ca2b..c7dd59d7f1 100644
>>>> --- a/include/hw/arm/virt.h
>>>> +++ b/include/hw/arm/virt.h
>>>> @@ -125,6 +125,7 @@ struct VirtMachineClass {
>>>>        bool no_pmu;
>>>>        bool claim_edge_triggered_timers;
>>>>        bool smbios_old_sys_ver;
>>>> +    bool no_highmem_compact;
>>>>        bool no_highmem_ecam;
>>>>        bool no_ged;   /* Machines < 4.2 have no support for ACPI GED
>>>> device */
>>>>        bool kvm_no_adjvtime;
>>>> @@ -144,6 +145,7 @@ struct VirtMachineState {
>>>>        PFlashCFI01 *flash[2];
>>>>        bool secure;
>>>>        bool highmem;
>>>> +    bool highmem_compact;
>>>>        bool highmem_ecam;
>>>>        bool highmem_mmio;
>>>>        bool highmem_redists;
>>>

Thanks,
Gavin

