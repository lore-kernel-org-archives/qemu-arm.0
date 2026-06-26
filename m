Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF41CDE00B
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 00:08:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcu7G-0001iC-5c; Thu, 25 Jun 2026 20:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wcu6n-0001fE-Ew
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 20:07:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wcu6k-0004f4-WE
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 20:07:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782432462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gj1W+0lqyRN4J7ZxNfJAeu1ygse+y7aL7B1zHf72hdQ=;
 b=MFYLYwbTdV9XEubdbsnRzn6Yktdu/EEfXQffALsqIip6ZPGBrC9JX+qZSj24Jm3k71KHBd
 4c49jpGii0KTE0jjO59TrR0HGouEkuygYvNvB+X3Z2bleyqXyAdPizW3x542bBklc017nM
 BNmbhipFYdPkpcMkJ0dlx24+yB+e50M=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-x5q3QTuRNjyxmfaKBCQ7rg-1; Thu, 25 Jun 2026 20:07:41 -0400
X-MC-Unique: x5q3QTuRNjyxmfaKBCQ7rg-1
X-Mimecast-MFC-AGG-ID: x5q3QTuRNjyxmfaKBCQ7rg_1782432460
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2c7cfa17fe6so5580095ad.3
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 17:07:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782432460; x=1783037260;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gj1W+0lqyRN4J7ZxNfJAeu1ygse+y7aL7B1zHf72hdQ=;
 b=X7XI5Bw3fIc5N4i4vOj2VfvU/W/upmUKc7Uq5+QaYz22iswTT6WkF7Web7xYlGLk1j
 5PHSiDx7w6VJ6JGe/uePw0iyvZGAbPQ+ZQo4UrAzoeJuvks7aoranncz85M/QfbnZx4A
 xx3K3Vwd24Lrplq2UgQO5V+kmN2HtIt5C5X93/3KuRmnW+gsCeNdf0LIKilP8aeA7/Z3
 /3n4s6kWtap0S//TKRhOdqfzmjNYOPSgMgXGKS1Fjbkixa96+ktIxzM9DmnvecCrzksj
 riRF/UJBbX68xqBuS3opJn6BJ84uxCQAoyCNgTnu80wyR+5CX8KlwuvbVOToPNcFk4CX
 VWTQ==
X-Gm-Message-State: AOJu0Yyoqbokdt580ageSvdPp/2yHAshFZ90dYcPGpsUUA7YatraDGsP
 W0hUHsJebvyv6Ky0z6wc+eBXhZvl2AyXVFhiHDsM407yRaZ6ZEqzHnqkl1upz6RLVFclZveuO2o
 TxfK8LX3oIZP6uJsI4+2cISLbv2aPx/gLvmOP1gCVES6wCMiZ6D6VpQ==
X-Gm-Gg: AfdE7cnmMzDhdMpBLPmNf6BFsgKwA4GhpKlbdebhB2pyQ9C3/tiiEnYyisJ3p0ERFq9
 GcWltBXi7dwfALmMuKfEoOxpR8YO4VZcRcxtIs0bHQxIhuiz6vSie09dJhPc8LmFjgg//GhS0Yj
 FdmXgCDsWMW9nbGPINNDfEm0oCmHucPAU3ZgxMxJdLEsmdsISfKb+Uh4+vQ3ZZ+yshk6P1mowUa
 lNW4td2F24w4FAtZ2/KXcub11WsRJAdOH9SJOouRGqbxhfiIpb1RD5RxPjPvbzbP3HjdiQh4sUs
 tvWDoon4Sj8ZqiYKBC+e7TJj+z2Cf1l5n+N8E3dzzl0ffk679TGDgH/WeeknjdZ5PlvGCs8ZW+h
 tx17SiFlN1OHoV9u7LVOXCODl/FyleovYW9GTtGxJ+3x2MYKmMxzu3A==
X-Received: by 2002:a17:903:1448:b0:2c0:db23:4c4 with SMTP id
 d9443c01a7336-2c7fc6db0admr46530545ad.16.1782432460305; 
 Thu, 25 Jun 2026 17:07:40 -0700 (PDT)
X-Received: by 2002:a17:903:1448:b0:2c0:db23:4c4 with SMTP id
 d9443c01a7336-2c7fc6db0admr46530165ad.16.1782432459778; 
 Thu, 25 Jun 2026 17:07:39 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c7f5b04be8sm28390995ad.35.2026.06.25.17.07.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 17:07:39 -0700 (PDT)
Message-ID: <5faf04b9-d596-4a1d-9fe3-5e9ad5f0a99a@redhat.com>
Date: Fri, 26 Jun 2026 10:07:30 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
To: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peterx@redhat.com,
 alex@shazbot.org, richard.henderson@linaro.org, berrange@redhat.com,
 philmd@oss.qualcomm.com, philmd@mailo.com, david@kernel.org, clg@redhat.com,
 pbonzini@redhat.com, phrdina@redhat.com, jugraham@redhat.com,
 liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn, shan.gavin@gmail.com
References: <20260616052552.389021-1-gshan@redhat.com>
 <20260616052552.389021-2-gshan@redhat.com>
 <CAFEAcA-mf14=jpRFHarAbN6AbQwvW=Yu6WB1JiNMsECEdaxD3A@mail.gmail.com>
 <20260625070551-mutt-send-email-mst@kernel.org>
 <CAFEAcA8YJZq9TqrUd0zTnewAdVDm5y6UV7BJQZ0C60TZ=RT98Q@mail.gmail.com>
 <20260625091334-mutt-send-email-mst@kernel.org>
 <CAFEAcA8xK+t3-prEphtkq-o9UY2mgS6cowhs880GOaxL9dKSGw@mail.gmail.com>
 <20260625101817-mutt-send-email-mst@kernel.org>
 <CAFEAcA8-Un+Q1yBDqLWCLPRwtgTA_VhJqGobgZChrFhAeVfG8A@mail.gmail.com>
 <20260625123119-mutt-send-email-mst@kernel.org>
 <CAFEAcA8UjtXgmPC27fOKMwbaWs2piwGYudtwCNWQHuu3E_7A-A@mail.gmail.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <CAFEAcA8UjtXgmPC27fOKMwbaWs2piwGYudtwCNWQHuu3E_7A-A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wo7xmyCkcUEBrqWGTIygh6OriyXR0hQsht8Q9_p4cf8_1782432460
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On 6/26/26 4:40 AM, Peter Maydell wrote:
> On Thu, 25 Jun 2026 at 17:47, Michael S. Tsirkin <mst@redhat.com> wrote:
>>
>> On Thu, Jun 25, 2026 at 04:23:47PM +0100, Peter Maydell wrote:
>>> On Thu, 25 Jun 2026 at 15:52, Michael S. Tsirkin <mst@redhat.com> wrote:
>>>> I think there is exactly 1 kinda reasonable case. A 2 byte read/write at
>>>> offset 0x1 within a dword. This maps nicely to even classical PCI byte
>>>> enable mechanism and so yes it works if your CPU can initiate these
>>>> things, and it's atomic.
>>>>
>>>> I tried reading LEDCTL on e1000e:
>>>>
>>>>         byte  @ 0xe00: 0x64
>>>>         byte  @ 0xe01: 0x2a
>>>>         byte  @ 0xe02: 0x00
>>>>         byte  @ 0xe03: 0x00
>>>>         word  @ 0xe00: 0x2a64
>>>>         word  @ 0xe01: 0x002a
>>>>
>>>> Works fine.
>>>
>>> The e1000e datasheet actually documents what it does in this
>>> case (slightly surprising, since hardware engineers love to
>>> leave this kind of corner case undocumented):
>>>
>>> # For registers that should be accessed as 32-bit double words,
>>> # partial writes (less than a 32-bit double word) does not take
>>> # effect (such as, the write is ignored).
>>> # Partial reads
>>> # return all 32 bits of data regardless of the byte enables.
>>> #
>>> # Note: Partial reads to clear-by-read registers (such as, ICR)
>>> # can have unexpected results since all 32 bits are actually read
>>> # regardless of the byte enables. Partial reads should not be done.
>>>
>>> So for this specific device that access is out-of-spec.
>>
>> You mean that access to clear by read should not be done, right?
> 
> The datasheet is ambiguous about whether "Partial reads should
> not be done" is meant to apply generally or only to clear-by-read
> registers.
> 

I think the document intends to say: the partial reads shouldn't be issued to
the clear-by-read registers. Those partial reads on no-read-side-affect registers
would be fine.

>>> I guess what I'm wondering is: can we just have code
>>> that does an aligned exact-width access in the 1/2/4/8
>>> byte aligned case, and the host's best approximation to
>>> an unaligned exact-width access for the 2/4/8 byte
>>> unaligned case?
>>
>> That's my idea, too.
>>

I assume this the conclusion of our discussions? If so, we just need to have
unified function where __builtin_{memcpy, memmove}() are used for 1/2/4/8 bytes
access no matter if the address is aligned, and fall back to {memcpy, memmove}()
for other cases?

>>> (so on sparc you get multiple smaller
>>> accesses, and on most archs including x86 and arm you
>>> get an unaligned load).
>>
>> I thought unaligned load from uncacheable on arm is
>> also a fault?
> 
> For Arm the distinction is not cacheable/uncacheable
> but Normal vs Device. (Device is essentially for things
> which are not RAM; Normal is for RAM and RAM-like things,
> and includes all of Normal Non-cacheable, Normal WT-Cacheable
> and Normal WB-Cacheable.) Things mapped as Normal memory
> don't generate unaligned faults (unless the guest turned them
> on deliberately). For Device memory, it is IMPLEMENTATION
> DEFINED whether you get an alignment fault or not if you
> map something as Device that could have handled unaligned
> accesses if you had mapped it as Normal.
> 
>>> That would mean the guest could
>>> potentially provoke a fault on the load/store on an
>>> access to a passthrough device, but if you give the
>>> guest passthrough access it can very likely provoke
>>> a fault anyway, depending on exactly what the device is.
>>>
>>> I think the most likely reason for an unaligned access
>>> in this codepath is "it's actually RAM, either really
>>> host RAM or else something memory-like in a BAR", and
>>> either way if the guest does a 4-byte unaligned access
>>> then doing a 4-byte unaligned access seems better than
>>> second-guessing it, even on non-x86.
> 
>> Right though remember: whether it's RAM doesn't matter. What matters is
>> how we map it.  qemu might fault because it maps NC but guest maps
>> cacheable and it's ok.
> 
> If QEMU and the guest disagree about the memory attributes
> on Arm then we have already lost, because the architecture
> says that memory attribute mismatches result in a variety of
> undesirable effects including things like loss of cache coherency
> (i.e. read and writes via QEMU's NC mapping disagree with ones
> via the guest's cacheable mapping because the latter are hitting
> in the cache and the former are bypassing it).
> 
>> But, all this in theory. At a high level, I personally think going with
>> what you propose as a 1st approximation is entirely reasonable, except
>> for one thing: we really should not crash qemu, since access can be from
>> guest userspace.
> 
> You can't prevent faults entirely, though -- if the device
> being mapped has e.g. behaviour that says "unaligned accesses
> will fault" and then the x86 guest does an unaligned access,
> then the device will trigger a fault, and the fault is what
> you want because it's what the guest would see on real h/w.
> Unfortunately we don't have a convenient way to feed the
> fault back to the guest. At some level if you pass through
> host hardware you're relying on the guest to not do totally
> stupid things.
> 
> thanks
> -- PMM
> 

Thanks,
Gavin


