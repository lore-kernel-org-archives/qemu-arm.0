Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED4DC4451C
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Jul 2026 13:24:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wkiY2-0007b2-8s; Fri, 17 Jul 2026 09:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wkiY0-0007YW-Lt
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 09:24:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wkiXx-0006tj-A1
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 09:24:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1784294647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hc9as2/lTjPqUGG9SEfcXJm6p60BTPo8QHtJAXJ0fcI=;
 b=NjU845fo18wUpVzvPDwA1KEk6/w9aoLOAEDCZnRvirFubvYkcYOB9l0X7P0nWYyx9d2fDJ
 JD1ANTr5Q1gg7vnOrFxWYqEn3tQcMqRRb3Kfeldiduo/BIbLs0cMaiboq5/SAAX/zewcbM
 a5gScR9Uj+OTKSnf95gzrypIXOikQnY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-b6a4OVmaPtG6_DBVufAP0w-1; Fri, 17 Jul 2026 09:24:06 -0400
X-MC-Unique: b6a4OVmaPtG6_DBVufAP0w-1
X-Mimecast-MFC-AGG-ID: b6a4OVmaPtG6_DBVufAP0w_1784294645
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-476608a9fefso1659092f8f.1
 for <qemu-arm@nongnu.org>; Fri, 17 Jul 2026 06:24:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784294645; x=1784899445;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=hc9as2/lTjPqUGG9SEfcXJm6p60BTPo8QHtJAXJ0fcI=;
 b=OwrlLg81CpM/B/l6T5FL0G2HCeFciILpJ6pouMjaS48ugayRY2L8+j189znWlG74Ao
 l2tblUkxY0mosTItRhnmElUJGfZJudQi9g92VUjEzHW1XO7PrlDRL+LJNoJ9WX7s4Ndn
 uFz1ePvDWKJWDB1XaDYZblDdCoyUpQDYBXD2cGpthBK9/ORFdY5tK46szvWNzYctxax4
 fOiS4wkhCc08ScECYh+H5KtvGccg5IeSmQ7VApXNNWVwn4Z2nzTKZdnuvKPl8jaK98O/
 YW0wvFo2nZzhpWS3RhLZRMb+6uUfTuXJisG1XAb1nmwFhILpv6s0d/GR4LLUyN4bGHgj
 n8oA==
X-Forwarded-Encrypted: i=1;
 AHgh+RruWa1dp8Pbpq0NStemAR3FenHZrB2ef5sFW4YfzAtK3mtdWZnmvBG5cxyvtS8lCmOpYOXIJdQGTA==@nongnu.org
X-Gm-Message-State: AOJu0Yxr81Par+bktXERT2AlvlnUpVNzcdn4tx2tdd3i5bUsfjZspx7a
 FO6f6DIXj/ie1BLf1lj73CYU4jQ/KMtASHL5I01WLMWdEHWna4+b/3u184dx+xyu2RqbaGkhF8H
 C7gWWBd4AxKJxNwJXlZp2aek7RM9ZvAkcGUlpzklncrHa9kqE5XJWRg==
X-Gm-Gg: AfdE7cnez2ExLVJkcjw6r2sd42cdY+j18uWg70if8BFQ33Kv3lmeaCgWJ/lxZ4m3p7B
 u0PivBag7KyDLIOc/xIFz6+Fa34AVZQnt9+g+OcsYxDOzpSmkDMGDLWlqeulMzBCQy2XlVhWUlX
 6Fobjax8IS7ThE3/vbcofGwmSth7rTMBoQpC0NrwMjhJ2fVRJlVOSLcEIlAaqiRYM2IB3WgYNna
 eqW9rKsJmDIr0H3xMDXaMTTFd/2GFVuyKaLbExZVAmxiUQyTNDYvqrRKEt+6/Q9y8YcW6tzxcH7
 XDMoa7ABB9kdM14SP0lB7wtV6lq7Ou0kup7WbIJ/lg4fXCoDwYK1zKMsTIGrRWk4nWvh5UstDr8
 rvqNuAkUqAVSBEGFEvz7swddG
X-Received: by 2002:a05:6000:25f7:b0:473:6590:c42a with SMTP id
 ffacd0b85a97d-47f623b546emr3470882f8f.9.1784294644382; 
 Fri, 17 Jul 2026 06:24:04 -0700 (PDT)
X-Received: by 2002:a05:6000:25f7:b0:473:6590:c42a with SMTP id
 ffacd0b85a97d-47f623b546emr3470802f8f.9.1784294643680; 
 Fri, 17 Jul 2026 06:24:03 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-24-117.inter.net.il. [80.230.24.117])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63ed244asm3236702f8f.20.2026.07.17.06.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 06:24:03 -0700 (PDT)
Date: Fri, 17 Jul 2026 09:23:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peterx@redhat.com, alex@shazbot.org,
 richard.henderson@linaro.org, berrange@redhat.com,
 philmd@oss.qualcomm.com, philmd@mailo.com, david@kernel.org,
 clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com,
 jugraham@redhat.com, liugang24219@sangfor.com.cn,
 dinghui@sangfor.com.cn, shan.gavin@gmail.com
Subject: Re: [PATCH v3 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
Message-ID: <20260717091756-mutt-send-email-mst@kernel.org>
References: <20260625070551-mutt-send-email-mst@kernel.org>
 <CAFEAcA8YJZq9TqrUd0zTnewAdVDm5y6UV7BJQZ0C60TZ=RT98Q@mail.gmail.com>
 <20260625091334-mutt-send-email-mst@kernel.org>
 <CAFEAcA8xK+t3-prEphtkq-o9UY2mgS6cowhs880GOaxL9dKSGw@mail.gmail.com>
 <20260625101817-mutt-send-email-mst@kernel.org>
 <CAFEAcA8-Un+Q1yBDqLWCLPRwtgTA_VhJqGobgZChrFhAeVfG8A@mail.gmail.com>
 <20260625123119-mutt-send-email-mst@kernel.org>
 <CAFEAcA8UjtXgmPC27fOKMwbaWs2piwGYudtwCNWQHuu3E_7A-A@mail.gmail.com>
 <5faf04b9-d596-4a1d-9fe3-5e9ad5f0a99a@redhat.com>
 <73f79841-8cc7-4ca6-8f6b-fb97b53a6fe8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <73f79841-8cc7-4ca6-8f6b-fb97b53a6fe8@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _jG16mHvRA7Cv209vGo7sdFm9HK8d_YdzhN5XYqc5eI_1784294645
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, Jul 09, 2026 at 07:52:12PM +1000, Gavin Shan wrote:
> Hi Michael and Peter,
> 
> On 6/26/26 10:07 AM, Gavin Shan wrote:
> > On 6/26/26 4:40 AM, Peter Maydell wrote:
> > > On Thu, 25 Jun 2026 at 17:47, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > 
> > > > On Thu, Jun 25, 2026 at 04:23:47PM +0100, Peter Maydell wrote:
> > > > > On Thu, 25 Jun 2026 at 15:52, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > I think there is exactly 1 kinda reasonable case. A 2 byte read/write at
> > > > > > offset 0x1 within a dword. This maps nicely to even classical PCI byte
> > > > > > enable mechanism and so yes it works if your CPU can initiate these
> > > > > > things, and it's atomic.
> > > > > > 
> > > > > > I tried reading LEDCTL on e1000e:
> > > > > > 
> > > > > >         byte  @ 0xe00: 0x64
> > > > > >         byte  @ 0xe01: 0x2a
> > > > > >         byte  @ 0xe02: 0x00
> > > > > >         byte  @ 0xe03: 0x00
> > > > > >         word  @ 0xe00: 0x2a64
> > > > > >         word  @ 0xe01: 0x002a
> > > > > > 
> > > > > > Works fine.
> > > > > 
> > > > > The e1000e datasheet actually documents what it does in this
> > > > > case (slightly surprising, since hardware engineers love to
> > > > > leave this kind of corner case undocumented):
> > > > > 
> > > > > # For registers that should be accessed as 32-bit double words,
> > > > > # partial writes (less than a 32-bit double word) does not take
> > > > > # effect (such as, the write is ignored).
> > > > > # Partial reads
> > > > > # return all 32 bits of data regardless of the byte enables.
> > > > > #
> > > > > # Note: Partial reads to clear-by-read registers (such as, ICR)
> > > > > # can have unexpected results since all 32 bits are actually read
> > > > > # regardless of the byte enables. Partial reads should not be done.
> > > > > 
> > > > > So for this specific device that access is out-of-spec.
> > > > 
> > > > You mean that access to clear by read should not be done, right?
> > > 
> > > The datasheet is ambiguous about whether "Partial reads should
> > > not be done" is meant to apply generally or only to clear-by-read
> > > registers.
> > > 
> > 
> > I think the document intends to say: the partial reads shouldn't be issued to
> > the clear-by-read registers. Those partial reads on no-read-side-affect registers
> > would be fine.
> > 
> > > > > I guess what I'm wondering is: can we just have code
> > > > > that does an aligned exact-width access in the 1/2/4/8
> > > > > byte aligned case, and the host's best approximation to
> > > > > an unaligned exact-width access for the 2/4/8 byte
> > > > > unaligned case?
> > > > 
> > > > That's my idea, too.
> > > > 
> > 
> > I assume this the conclusion of our discussions? If so, we just need to have
> > unified function where __builtin_{memcpy, memmove}() are used for 1/2/4/8 bytes
> > access no matter if the address is aligned, and fall back to {memcpy, memmove}()
> > for other cases?
> > 
> 
> Could you help to confirm if the conclusion is to have unified qemu_ram_{copy, move}()
> for all architectures? In qemu_ram_{copy, move}(), the fixed sized accesses like
> 1/2/4/8 bytes are handled by __builtin_{memcpy, memmove}() and fall back to
> memcpy/memmove() for other sized accesses. It's basically what was proposed by
> Michael :-)

No. __builtin_ and  memcpy/memmove are same on modern linuxes.

I'd say as a 1st step, on x86 hosts we can do a fixed size
memmove for 1/2/4/8, on other hosts 
*aligned* 1/2/4/8 bytes can do
 __atomic_store ... __ATOMIC_RELAXED
and the rest can hobble along on memmove
and hope for the best.

And memcpy is likely not the right thing, ever.


> Something like below.
> 
> -----> include/system/memory.h
> 
> +/**
> + * qemu_ram_copy: copy data to ramblock
> + *
> + * @dst: destination where the data is copied to
> + * @src: source where the data is copied from
> + * @n: length of data to be copied
> + *
> + *
> + * Copy @n bytes from @src to @dst with the assumption that @src and @dst
> + * do not overlap. The fixed sized accesses like 1/2/4/8 bytes are handled
> + * by __builtin_memcpy() to avoid the optimizations applied to memcpy(),
> + * which can be unsafe to DMA/VCPU IO. Fall back to memcpy() for other
> + * sized accesses and the safety is ensured by users.
> + */
> +void qemu_ram_copy(void *dest, const void *src, size_t n);
> +
> +/**
> + * qemu_ram_move: move data to ramblock
> + *
> + * @dst: destination where the data is moved to
> + * @src: source where the data is moved from
> + * @n: length of data to be moved
> + *
> + * Move @n bytes from @src to @dst with the assumption that @src and @dst
> + * can overlap. The fixed sized accesses like 1/2/4/8 bytes are handled
> + * by __builtin_memmove() to avoid the optimizations applied to memmove(),
> + * which can be unsafe to DMA/VCPU IO. Fall back to memmove() for other
> + * sized accesses and the safety is ensured by users.
> + */
> +void qemu_ram_move(void *dest, const void *src, size_t n);
> +
> 
> -----> system/physmem.c
> 
> +void qemu_ram_copy(void *dst, const void *src, size_t n)
> +{
> +    switch (n) {
> +    case 1:
> +        __builtin_memcpy(dst, src, 1);
> +        break;
> +    case 2:
> +        __builtin_memcpy(dst, src, 2);
> +        break;
> +    case 4:
> +        __builtin_memcpy(dst, src, 4);
> +        break;
> +    case 8:
> +        __builtin_memcpy(dst, src, 8);
> +        break;
> +    default:
> +        memcpy(dst, src, n);
> +    }
> +}
> +
> +void qemu_ram_move(void *dst, const void *src, size_t n)
> +{
> +    switch (n) {
> +    case 1:
> +        __builtin_memmove(dst, src, 1);
> +        break;
> +    case 2:
> +        __builtin_memmove(dst, src, 2);
> +        break;
> +    case 4:
> +        __builtin_memmove(dst, src, 4);
> +        break;
> +    case 8:
> +        __builtin_memmove(dst, src, 8);
> +        break;
> +    default:
> +        memmove(dst, src, n);
> +    }
> +}
> +
> 
> 
> > > > > (so on sparc you get multiple smaller
> > > > > accesses, and on most archs including x86 and arm you
> > > > > get an unaligned load).
> > > > 
> > > > I thought unaligned load from uncacheable on arm is
> > > > also a fault?
> > > 
> > > For Arm the distinction is not cacheable/uncacheable
> > > but Normal vs Device. (Device is essentially for things
> > > which are not RAM; Normal is for RAM and RAM-like things,
> > > and includes all of Normal Non-cacheable, Normal WT-Cacheable
> > > and Normal WB-Cacheable.) Things mapped as Normal memory
> > > don't generate unaligned faults (unless the guest turned them
> > > on deliberately). For Device memory, it is IMPLEMENTATION
> > > DEFINED whether you get an alignment fault or not if you
> > > map something as Device that could have handled unaligned
> > > accesses if you had mapped it as Normal.
> > > 
> > > > > That would mean the guest could
> > > > > potentially provoke a fault on the load/store on an
> > > > > access to a passthrough device, but if you give the
> > > > > guest passthrough access it can very likely provoke
> > > > > a fault anyway, depending on exactly what the device is.
> > > > > 
> > > > > I think the most likely reason for an unaligned access
> > > > > in this codepath is "it's actually RAM, either really
> > > > > host RAM or else something memory-like in a BAR", and
> > > > > either way if the guest does a 4-byte unaligned access
> > > > > then doing a 4-byte unaligned access seems better than
> > > > > second-guessing it, even on non-x86.
> > > 
> > > > Right though remember: whether it's RAM doesn't matter. What matters is
> > > > how we map it.  qemu might fault because it maps NC but guest maps
> > > > cacheable and it's ok.
> > > 
> > > If QEMU and the guest disagree about the memory attributes
> > > on Arm then we have already lost, because the architecture
> > > says that memory attribute mismatches result in a variety of
> > > undesirable effects including things like loss of cache coherency
> > > (i.e. read and writes via QEMU's NC mapping disagree with ones
> > > via the guest's cacheable mapping because the latter are hitting
> > > in the cache and the former are bypassing it).
> > > 
> > > > But, all this in theory. At a high level, I personally think going with
> > > > what you propose as a 1st approximation is entirely reasonable, except
> > > > for one thing: we really should not crash qemu, since access can be from
> > > > guest userspace.
> > > 
> > > You can't prevent faults entirely, though -- if the device
> > > being mapped has e.g. behaviour that says "unaligned accesses
> > > will fault" and then the x86 guest does an unaligned access,
> > > then the device will trigger a fault, and the fault is what
> > > you want because it's what the guest would see on real h/w.
> > > Unfortunately we don't have a convenient way to feed the
> > > fault back to the guest. At some level if you pass through
> > > host hardware you're relying on the guest to not do totally
> > > stupid things.
> > > 
> > > thanks
> > > -- PMM
> > > 
> 
> Thanks,
> Gavin


