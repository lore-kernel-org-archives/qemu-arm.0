Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5D8CD98D2
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 05:45:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZMbm-0004Rz-LD; Tue, 16 Jun 2026 01:45:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZMbh-0004Pi-V5
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 01:45:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZMbf-0007FI-R4
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 01:45:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781588702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TbG23Q2k01lBbIjrdBvCbrQX87YaPoEqp2pstceGGwQ=;
 b=eh/E39M7WHMDJTTNqUvkb+NtjkKZ0AkvnjNwhuPJ2xIzOZUm3lBjb0l1ErQsyTFcfVYgMb
 /1CrrNrbfc8Et3TGNVDgBhHMwk4wJdJ4JvB7xlIbL8KORjXkssBr/5QpvlT955bWCyc3j9
 KmW1vn8ytN3DTOIW7d0ZgJEAH2Ia8PU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-Fu-MlQZwOkih04JSv8r4ZQ-1; Tue, 16 Jun 2026 01:45:00 -0400
X-MC-Unique: Fu-MlQZwOkih04JSv8r4ZQ-1
X-Mimecast-MFC-AGG-ID: Fu-MlQZwOkih04JSv8r4ZQ_1781588700
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-490a767b782so25237295e9.2
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 22:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781588699; x=1782193499;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TbG23Q2k01lBbIjrdBvCbrQX87YaPoEqp2pstceGGwQ=;
 b=JG7Mo0AoaHN5B62CIuRp8eVUVHpUM9CkmCphyuDMKC4FzSzYnqZkb7/5SobyKm8qvQ
 BhIAR2UU4xga7iemOaST+J8ZeY3Pb4Gd8AIxXnM9yf88Lpc6bHB/WsnRaOL8miKopYiv
 md7ooPzJGnSASS2kJ8c66O/VO6JEO/8es/G/XBfVWh1hw3uoqGvL4anggbC9Md2abYYa
 zDikJtnFW3kGrTLJiS69Ne/sVOJuY3llVuKliBUH5uxiEVa6arg3lcAPU5k+tgJd3lv0
 wXzY5vEPTpzwRZOYFukdN1mTuAZr8HMgaFMK/hgbIAw1HWZPBgnDxzOwkSLrliieEwpU
 4j/g==
X-Gm-Message-State: AOJu0YxDk9PfpFltxvmJbpRX7qTpQlkv8ts4ZNTQZ0fYU27k9E9/YzUN
 C8NbOPSgc7cm1tOHfXsm3Xe7i4EhA6GtbIfpu/+LpuQMVRUPQOT64v4fYj71wowoYbfxLLQa3PF
 NalRtaZB4YGIn9hqUnEmoXO8MF27oxijQWhjKjhRtLVoT715aPwEMQg==
X-Gm-Gg: Acq92OFbZH6d5tC50dZd2+4rnqo7AY/wtcMSkn1Z8mhHwbxTVjeUvY3USouvEmFu0Xx
 ZlFkrp/KGs3eGJ65vGF6lTPo/mtM3TLpgeMXK0dK6JSDiF1y2V6zUKpEQYdxNAz+7JuCb3cFDxP
 +/Sb/YGgelqPHAhO4sq7eANhGLCJZIAOAjyXHqlMqgUVZ0G5eOuhfMRlkt4VyPmsDrgCHORKFwA
 K9A8hNWQt+moiTx4i+DJLY4S23GHZ4AgO+DcNPbe90DPbLXpzlO9/h9tSGSyi19KMpiJrBjTXva
 f2ziOnXh6E7inucu7qEns50AbTvCjdnSEg3XZQ9F/qE5tR4rCM/mrS1BLplUKT11dWudfCT0skL
 B4aChctVrNMNdjwTL36O6AmII/E4wXkynPYvkVZeRXow=
X-Received: by 2002:a05:600c:6288:b0:48e:6db3:ff33 with SMTP id
 5b1f17b1804b1-4922ff98d35mr27939335e9.14.1781588699436; 
 Mon, 15 Jun 2026 22:44:59 -0700 (PDT)
X-Received: by 2002:a05:600c:6288:b0:48e:6db3:ff33 with SMTP id
 5b1f17b1804b1-4922ff98d35mr27938835e9.14.1781588698856; 
 Mon, 15 Jun 2026 22:44:58 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26f23fsm40570055f8f.9.2026.06.15.22.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 22:44:58 -0700 (PDT)
Date: Tue, 16 Jun 2026 01:44:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peterx@redhat.com,
 alex@shazbot.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org, berrange@redhat.com,
 philmd@oss.qualcomm.com, philmd@mailo.com, david@kernel.org,
 clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com,
 jugraham@redhat.com, liugang24219@sangfor.com.cn,
 dinghui@sangfor.com.cn, shan.gavin@gmail.com
Subject: Re: [PATCH v3 0/2] system/memory: Make ram device region directly
 accessible
Message-ID: <20260616014419-mutt-send-email-mst@kernel.org>
References: <20260616052552.389021-1-gshan@redhat.com>
 <ae17b5a6-eed8-4d4c-a798-cb92ffa6c915@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ae17b5a6-eed8-4d4c-a798-cb92ffa6c915@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: myF1Ex9ifz73InYeTXmC0VvrE287RKa6PxOgzDpTWMo_1781588700
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Tue, Jun 16, 2026 at 03:40:34PM +1000, Gavin Shan wrote:
> On 6/16/26 3:25 PM, Gavin Shan wrote:
> > All ram device regions was turned to be indirectly accessible by commit
> > 4a2e242bbb ("memory: Don't use memcpy for ram_device regions"). This leads
> > to a hanged guest where a NVidia GH100 GPU is passed from host. The memory
> > in its PCI BAR#4 can be allocated as DMA target buffer. qemu has to take
> > DMA bounce buffer in address_space_map() to cover the DMA request. However,
> > the bounce buffer size is 4096 bytes and we're overrunning it easily when
> > the guest has significant disk activities on compiling 'cuda-samples'.
> > The full log and problem description can be found from PATCH[1/2]'s commit
> > log.
> > 
> > Try to fix the issue handled in commit 4a2e242bbb by replacing memcopy()/
> > memmove() with newly added helpers qemu_ram_{copy, move}() that works on
> > top of __builtin_{memcpy, memmove} or unaligned access friendly memory
> > movement in the accessors to the ram device regions. With this, we can
> > basically revert that commit to make ram device region directly accessible
> > again and bypass the bounce buffer in address_space_map() where the guest
> > hang is caused.
> > 
> > PATCH[1] uses qemu_ram_{copy, move}() in ram device region accessors
> > PATCH[2] makes ram device region directly accessible again
> > 
> Michael asked to include below context in the cover letter in v3, but I
> didn't noticed that before I sent v3 series, appended with them.
> 
> ----
> 
> The issues listed by Michael:
> 
> 1. On x86, memcpy is different from __builtin_memcpy if one uses old 1.0
>    force-headers from 2019. Likely no longer relevant.
> 
> 2. variable length memcpy can translate 2,4,8 byte guest access into
>    multiple byte accesses. doing this for mmio is guaranteed to break devices.
> 
> 3. (theoretical concern) also on x86, unaligned accesses are possible on guest
>    and host, so converting an unaligned access to a series of aligned ones can
>    in theory break devices.
> 
> 4. also on x86, vector instructions for large (>16 byte) writes into
>    pgprot_noncached memory are safe and faster than multiple 8 byte ones.
> 
> 5. also on x86 it so happens that if you write a fixed-size memcpy this gets
>    optimized to a single store/load and it works for aligned and unaligned
>    addresses on that architecture. How to ensure this keeps being correct
>    is left as an excerise for the reader. But qemu already relies on this
>    and did for years.
> 
> 6. on non-x86 both unaligned accesses and vector instructions for accessing
>    UC memory are illegal.
> 
> 7. standard vfio gives KVM VM_ALLOW_ANY_UNCACHED, so even on non x86 guest can
>    map the memory as as pgprot_noncached/ioremap or pgprot_writecombine/ioremap_uc.
>    If it does the second then it can use unaligned or vector for access.
>    This is why normal passthrough tends to work - it never traps to qemu at
>    all. But for qemu, vfio uses  pgprot_noncached unconditionally so qemu
>    can't use unaligned or vector instructions on non-x86.
> 
> 
> 8. But for nvgrace RAM, vfio has a driver that uses pgprot_writecombine/ioremap_uc.
>    so qemu could safely use unaligned/vector instructioons even on non-x86.
> 
> 9. Except sadly, vfio currently does not tell qemu how it maps
>    the memory, so qemu can not know what is safe on non-x86.
> 

And more:

10. on x86 memcpy will sometimes do multiple overlapping stores when
size is not a power of 2. for example, a 15 byte write is done with
2 8-byte stores. This is theoretically an issue
if guest does something super clever with ordering,
but does not seem to be in practice.

10. on non-x86 memcpy will do multiple overlapping stores even
for single byte writes. E.g. it does it to avoid extra branches.
This is causing issues in practice.





> Now, what is to be done?
> 
> 
> A. on x86, we must avoid converting 2,4,8 byte accesses into byte accesses.
> At least for aligned, perferably for unaligned accesses too.
> Fixed width memcpy seems to work for this. Whether we should bother with
> __builtin to work around broken old fortify headers, I donnu.
> I do not have any answer how to check that compiler does this correctly.
> If anyone is motivated enough, adding a GCC builtin could be possible.
> Given qemu did this for years, I think we can leave solving this for
> another day.
> 
> B. Also on x86, I do not see why we should not use memcpy for large
> accesses if we can. Better perf.
> 
> C. on non-x86, we currently must not memcpy since we do not know if it
> is pgprot_noncached. yes, performance will be bad for DMA into device RAM.
> 
> D. It goes without saying that casting an unaligned address to unint32_t
> (be it for qatomic_set or whatever) is undefined behaviour in C
> and so a bad idea on any architecture.
> 
> E. also for non-x86, we really should teach vfio to tell qemu whether
> it maps device pgprot_noncached or pgprot_writecombine.
> we will then be able to use memcpy for >8 accesses.
> 
> Anyone, correct me if I'm wrong? Maybe I should start a new thread with
> this summary?
> 
> Thanks,
> Gavin


