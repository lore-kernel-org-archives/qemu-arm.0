Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F97DC531D0
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Jul 2026 01:42:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wn4vm-0007LD-BT; Thu, 23 Jul 2026 21:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wn4vk-0007Ks-W8
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 21:42:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wn4vi-0003AZ-5s
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 21:42:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1784857344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZxQsPBgu8U7mSlXJ9XurO1/7FASwCgbhzgyhTpZsOHA=;
 b=FVl2O/6evfuPG63fFeIwiqdogvoCjK+W/Miy8EdbaLE+jpnSeK24D9TnBLp759j1ql1AHf
 TrL4ZWqE8EVzmOHvkRgdVRAHSLIiWbwHis37glRvtKXYq+MeLNgdr7T7HSLD1esWjtrlbm
 fNGK7S66OQYsj3QUFncY38PgkB9QKTs=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-zSr34hNwNMOWAa7uVvEcpg-1; Thu, 23 Jul 2026 21:42:22 -0400
X-MC-Unique: zSr34hNwNMOWAa7uVvEcpg-1
X-Mimecast-MFC-AGG-ID: zSr34hNwNMOWAa7uVvEcpg_1784857342
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-cb7d6ba548eso1786495a12.1
 for <qemu-arm@nongnu.org>; Thu, 23 Jul 2026 18:42:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784857342; x=1785462142;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZxQsPBgu8U7mSlXJ9XurO1/7FASwCgbhzgyhTpZsOHA=;
 b=BxAe2OnrSkod168lM062waEcTCU/a01E3rxmvpascgUlWpcxOCqgy14/QRF8LBJ+Ur
 Kll0AfiiXMz+lO+fe5kk2oWz/7CedCnNUtJFKyrOiQ1XMjtBLqStq353rx9HJ3S42mUq
 4QKrJqRfVWktgIoJXZBI7SMCTrEiecc/FX8ZW2C7hlo5oTCZVvsarlBkHS1USEdzQHuy
 2d+jAwUytmYqDYpM0yoVGmt2pvtSUCC+Xn24ZAJPeefZnlNK4jlkLXL+DxwF7NxVTbWy
 UGe3NG+y2sOq3J0q7YGlAOMGGVaFS+tt8Z2d+Ky4r7huUI4v5PPwh/S8019C8nSnsH9e
 Ye6g==
X-Forwarded-Encrypted: i=1;
 AHgh+RoQOB4IFEi7sdVfx/jQ1DcW/HgqGi8YuPICowiksWyjm1rfZYDIKBGRXP9rnyb1uS/zDNsFdV6ujw==@nongnu.org
X-Gm-Message-State: AOJu0YzfDc7oK1K96IQKosEHC+blJk+00iZAhyyeXhPeOXbq1Q45T/lR
 CkQYkqiK2rIp0suX72UzsQ6prJybagUujvz9UcwI5yC24c8G/ddPeXe4szsBGAnfMrFvMIbkEvW
 HS7j1/y95Jq6qS6xcqPZrrI37czVCzkgLFUX10MM9V+Rol5E40rBAVw==
X-Gm-Gg: AR+sD10REwDmcGNpMbbhLuAbP5SOmZWuOUCz4tZLNLZc4Xz25m8ToQdRHzqCQL8Xj9d
 Q1SzJxji8CD4jfUSdyCW8IJWiPzkCSUs4gCnPhaaR3ahG15v9oumztfJnqJyQc9ygUz2v7FoNSU
 mtotAYfpKHSduRlwVHHd+aQzsJ4DvSQ12MBanqSi6z0Wb6+3KNDjVCOOX0hd+HL8Xm03oCoUHEp
 lu2dKcEmOPkkU9KURpgQ2NHyJsOGhosEwNnGTRutmckfGB3NpoCez9LI0i/ViKjNmW59u1xPSsq
 Re4kwVz5A0agiMPQ8r43YUdBuq3ViDQ8F//YYtVUnDsapgmOc+fWoIO9vF7jbBQRALEu9zr5FSw
 O5yXVqBkO3h4PyxXDS4z/JTY1MDKHGTtugurHIMYPC9M=
X-Received: by 2002:a05:6a21:a347:b0:3c0:9c1a:8941 with SMTP id
 adf61e73a8af0-3c44b2c1b51mr5810329637.73.1784857341688; 
 Thu, 23 Jul 2026 18:42:21 -0700 (PDT)
X-Received: by 2002:a05:6a21:a347:b0:3c0:9c1a:8941 with SMTP id
 adf61e73a8af0-3c44b2c1b51mr5810290637.73.1784857341148; 
 Thu, 23 Jul 2026 18:42:21 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbb8f0f58dfsm3457401a12.13.2026.07.23.18.42.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2026 18:42:20 -0700 (PDT)
Message-ID: <b05b40b1-fffd-4be5-9289-b5bc92c16cd2@redhat.com>
Date: Fri, 24 Jul 2026 11:42:09 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
To: Peter Xu <peterx@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, alex@shazbot.org, richard.henderson@linaro.org,
 berrange@redhat.com, philmd@mailo.com, david@kernel.org, clg@redhat.com,
 pbonzini@redhat.com, phrdina@redhat.com, jugraham@redhat.com,
 liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn, shan.gavin@gmail.com,
 qemu-s390x <qemu-s390x@nongnu.org>
References: <20260717095407-mutt-send-email-mst@kernel.org>
 <9c2ad22a-e768-4a07-85a2-01ce1fc14368@oss.qualcomm.com>
 <59882c5b-545d-4768-8bf4-723fed97a801@redhat.com> <al-eCtxGjG4HHEbl@x1.local>
 <6210e178-a93f-4411-810a-41edb1fb656e@redhat.com>
 <20260722015422-mutt-send-email-mst@kernel.org> <amDyvgR09OJssENX@x1.local>
 <20260723015708-mutt-send-email-mst@kernel.org>
 <71d88d00-5b41-49d2-b649-8a6ea47abc4d@oss.qualcomm.com>
 <20260723045428-mutt-send-email-mst@kernel.org> <amIbUYN3teCLXTh-@x1.local>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <amIbUYN3teCLXTh-@x1.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JmwywsVJf7_eBVtU89IH_tCe_s3L_vBbSs1BmGAHQcc_1784857342
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.951,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/23/26 11:46 PM, Peter Xu wrote:
> On Thu, Jul 23, 2026 at 05:05:08AM -0400, Michael S. Tsirkin wrote:
>> On Thu, Jul 23, 2026 at 10:52:11AM +0200, Philippe Mathieu-Daudé wrote:
>>> On 23/7/26 08:04, Michael S. Tsirkin wrote:
>>>> On Wed, Jul 22, 2026 at 12:41:34PM -0400, Peter Xu wrote:
>>>>> On Wed, Jul 22, 2026 at 01:58:18AM -0400, Michael S. Tsirkin wrote:
>>>>>> On Wed, Jul 22, 2026 at 10:53:27AM +1000, Gavin Shan wrote:
>>>>>>> On 7/22/26 2:27 AM, Peter Xu wrote:
>>>>>>>> On Tue, Jul 21, 2026 at 03:37:53PM +1000, Gavin Shan wrote:
>>>>>>>>> If Peter is fine with two variants for x86 and non-x86 architectures.
>>>>>>>>> I can post (v4) for further review. That will be something like below
>>>>>>>>> and let me know if there are any other improvements are needed.
>>>>>>>>
>>>>>>>> I have a generic question on the "unaligned access for x86": I think the
>>>>>>>> question is about the one Michael raised here on unaligned access may break
>>>>>>>> x86 here:
>>>>>>>>
>>>>>>>>      https://lore.kernel.org/qemu-devel/20260617022330-mutt-send-email-mst@kernel.org/
>>>>>>>>
>>>>>>>>      3. (theoretical concern) also on x86, unaligned accesses are
>>>>>>>>      possible on guest and host, so converting an unaligned access to a
>>>>>>>>      series of aligned ones can in theory break devices.
>>>>>>>>
>>>>>>>> Is that a real problem we need to consider, or can we start with unified
>>>>>>>> approach and leave it for later?
>>>>>>>>
>>>>>>>
>>>>>>> I'm leaving this question to Michael.
>>>>>>
>>>>>> Knowing what I know about hardware designers, it's something someone
>>>>>> somewhere does)
>>>>>> It can be made a separate patch, just to show - it should be all of
>>>>>> ~10LOC.
>>>>>
>>>>> It's only about removal of anything that might be controversial for now,
>>>>> thanks.  I also wonder if anything would break, then it's more solid proof
>>>>> that per-arch change is required.
>>>>
>>>> Repeating:
>>>> 	I think there is exactly 1 kinda reasonable case. A 2 byte read/write at
>>>> 	offset 0x1 within a dword. This maps nicely to even classical PCI byte
>>>> 	enable mechanism and so yes it works if your CPU can initiate these
>>>> 	things, and it's atomic.
>>>
>>> Isn't this out of the CPU arch, dealt with at the bus level?
>>>
>>> It looks we try to be clever with modern PCI code by optimizing this
>>> access -- not saying we can change that, I know it is too late after
>>> 20+ years -- relying on hw behavior that was done that way to support
>>> legacy hw, in particular broken I/O accesses.
>>
>> Not sure what the question is.  We were dicussing how to emulate unaligned
>> accesses from x86 guests if they happen.
>> On an x86 host we can do that easily, and it's just a couple of LOC.
>> Though Peter Maydell dislikes host arch specific code. But I hope
>> if it's a separate patch on top and it is visible how small it is,
>> he will reconsider)
> 
> Yes, if we still want x86 specific change, it would be better to be put
> separately.
> 
> Said so, I don't think the e1000e LEDCTL test illustrated what might
> break..  Isn't that only an exmaple showing unaligned access is
> "supported", however nothing breaks even if we use 1B*2?
> 
> My question was more about a real breakage, hence whenever it happened
> "it's more solid proof that per-arch change is required".
> 
>> On other hosts we can't emulate them 100%, we either need to split
>> to byte accesses or over-access and mask. Byte accesses feel safer.
>> What qemu currently does with memmove is clearly not safe in the
>> general case.
> 
> We should have another option that is not arch-dependent but keep the
> unaligned behavior.
> 
> For current master, AFAIU we do unaligned access for both ram_device and
> rest. Say, even with ram_device_mem_ops, it has both .unaligned=true for
> both .valid & .impl.  I think it means indeed we have unaligned behavior
> even for ram_device.  It also means what matters in regards to the Realtek
> bug was only about aligned access (with subpage presence).
> 
> I think it means we can always keep unaligned to stick with
> memcpy()/memmove(), but only use atomic ops for the aligned cases of
> 1/2/4/8.  With that, I think we can also remove ram_device_mem_ops and fix
> the bounce buffer issue.
> 
> I think it means we'll stick with memcpy()/memmove() for all archs for
> unaligned, which is again not safe... but that can be an existing but
> separate problem to solve too.
> 

Lets see if Peter Maydell and Michael are happy with this option. At least,
we will have unified qemu_ram_move() for all architectures with this option.
Note that qemu_ram_copy() won't be needed.

I'm putting note on what's to be done in (v4) if this option is to be picked
up. Let me know if there are missed points. It's basically combing what's done
by ram_device_mem_ops to upper layer (e.g. in qemu_ram_move()).

   address_space_write
     address_space_to_flatview
     flatview_write
       flatview_translate
       flatview_write_continue
         flatview_write_continue_step
           memmove                     // (A) to replace it with qemu_ram_move()

/**
  * qemu_ram_move: move data to ramblock
  *
  * @dst: destination where the data is moved to
  * @src: source where the data is moved from
  * @n: length of data to be moved
  *
  * Move @n bytes from @src to @dst with the assumption that @src and @dst
  * can overlap. The access is atomic if the source and destination buffer
  * aren't overlapped for a well aligned and small-sized access. Otherwise,
  * fall back to the standard memmove().
  */
static void qemu_ram_move(void *dst, const void *src, size_t n)
{
     uintptr_t test, len;

     if (src == dst || n == 0) {
         return;
     }

     /* Overlapped buffers */
     if (src < (dst + n) && dst < (src + n)) {
         memmove(dst, src, n);
         return;
     }

     test = (uintptr_t)src | (uintptr_t)dst | n;
     len = test & -test;

     /* Unaligned or oversized access */
     if (n > 8 || len != n) {
         memmove(dst, src, n);
         return;
     }

     switch (len) {
     case 1:
         qatomic_set((uint8_t *)dst, qatomic_read((uint8_t *)src));
         break;
     case 2:
         qatomic_set((uint16_t *)dst, qatomic_read((uint16_t *)src));
         break;
     case 4:
         qatomic_set((uint32_t *)dst, qatomic_read((uint32_t *)src));
         break;
     case 8:
         qatomic_set((uint64_t *)dst, qatomic_read((uint64_t *)src));
         break;
     default:
         g_assert_not_reached();
     }
}

> One more thing to mention below...
> 

Please see below responses.

>>
>>
>>
>> As for optimizing - there is space for optimization e.g. vfio could
>> report the properties of a BAR to userspace for optimization
>> purposes. On x86 you can then get good speed with just memmove.
>> Other arches you will likely need to write arch specific code.
>> But this has to do with e.g. DMA into device BAR not CPU accesses.
>> As an aside, it is a pity qemu uses same thing for DMA and CPU access,
>> we know how virtio accesses work and this might allow optimization.
>>
>>>
>>> For Alpha / HPPA / MIPS there were ASIC in the PCI I/O path to handle
>>> these odd unaligned accesses inherited from x86 world.
>>
>> Right.
>>
>>>> It's easy to find more examples of such hardware if one looks. For example,
>>>> LEDCTL on e1000e:
>>>>
>>>> 20260625101817-mutt-send-email-mst@kernel.org
>>>>
>>>>
>>>> A claim that no software uses this hardware capability is the strong
>>>> claim that needs proof, not the other way around.
>>>>
>>>>
>>>> What to do on non-x86? reading a dword might work, or reading
>>>> byte by byte might work. Both can cause issues, just different ones,
>>>> but given we did byte by byte previously i guess let's keep
>>>> doing that.
>>>>
>>>>
>>>>>>
>>>>>>>> PS: I apologize if I missed important piece of info along the way; I didn't
>>>>>>>> follow closely on the discussion on this topic in the past few weeks.
>>>>>>>>
>>>>>>>> One thing to mention is, what we change should only need to affect
>>>>>>>> ram_device, AFAIU.. so most memcpy()/memmove() shouldn't be changed for any
>>>>>>>> arch when it's pure RAM.
>>>>>>>>
>>>>>>>
>>>>>>> It depends. This patch intends to fix issue [1] in the lower layer by using
>>>>>>> the newly added accessors (qemu_ram_{copy, move}) on all directly accessible
>>>>>>> regions including the regular (pure) RAM region. Otherwise, the newly added
>>>>>>> accessors should be limited to ram_device regions only as you said.
>>>>>>>
>>>>>>> [1] https://lore.kernel.org/qemu-devel/20260527091711.3901-1-liugang24219@sangfor.com.cn/
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Gavin
>>>>>>
>>>>>> using memcpy()/memmove() to emulate guest's atomics is generally
>>>>>> kinda broken.
>>>>>> but yes there are architectures where doing it to device ram is
>>>>>> more broken than doing it to regular ram.
> 
> .. please someone (at least.. Gavin?) still have a look at below.  It could
> matter how the next version looks, especially I want to make sure if we
> should get rid of __builtin_*() in the new helpers.
> 
> Thanks,
> 
>>>>>
>>>>> If we keep memcpy()/memmove() for len>8 (aligned or not), I am thinking no
>>>>> perf issue will happen, then looks like we can indeed change this even for
>>>>> pure RAM operations, which we can't identify in case of e1000e driver use
>>>>> case.
>>>>>
>>>>> Then does it mean we should not use __builtin_memcpy()/memmove()?  Even if
>>>>> we know constants 1/2/4/8 would work there, why not we go ahead and use
>>>>> qatomics, which is even more future proof?  I also stumbled on top of
>>>>> commit 77b1757090 ("include/qemu/bswap.h: Use __builtin_memcpy() in
>>>>> accessor functions"), which seems to say the same thing "for the long
>>>>> term".
>>>>>

Yes, I think qatomics are more future proof. For the aligned accesses
in above qemu_ram_copy(), I think qatomics instead of __built_in_memmove()
should be used.

>>>>> For "should we still do unaligned access if the guest did it, so as to keep
>>>>> the original behavior of a bare metal" question, are we on the same page
>>>>> that we should just break it into aligned accesses for all archs?  I think
>>>>> it means, we will not be able to emulate guest faults correctly as what
>>>>> will happen on bare metal, but we're missing the fault injection logics
>>>>> anyway, so whenever it's implemented we _could_ switch it back to unaligned
>>>>> accesses.  Before that, breaking unaligned seems like a better way to go to
>>>>> (1) satisfy all legit users, and (2) don't make QEMU crash by guest
>>>>> operations.
>>>>>

Not really. For our specific case where the ram device region is turned to
directly accessible, it's fine not breaking down the unaligned access to aligned
accesses, which is consistent with the expected behavior from the existing
ram_device_mem_ops. An unaligned access is allowed by ram_device_mem_ops. So
we can also allow an unaligned access in qemu_ram_move().

>>>>> Last, one silly question: why do we need any helper named with *memcpy*, if
>>>>> memmove is always superior (to consider range overlap)?  Can we stick with
>>>>> memmove all over the places?
>>>>>

Yes, I think one preparatory patch can added in (v4) to replace memcpy() with
memmove() in the following paths, extending commit 4a73aee8814 ("softmmu: Use
memmove in flatview_write_continue"). With this replacement, qemu_ram_copy()
won't be needed in (v4).

     hw/remote/vfio-user-obj.c::vfu_object_mr_rw
     include/system/memory.h::address_space_read
     system/physmem.c::flatview_read_continue_step
     system/physmem.c::address_space_write_rom

Thanks,
Gavin


