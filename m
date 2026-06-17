Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D452CD98EE
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Jun 2026 07:14:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZkTp-00043Q-RB; Wed, 17 Jun 2026 03:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZkTh-0003q7-R3
 for qemu-arm@nongnu.org; Wed, 17 Jun 2026 03:14:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZkTg-00065c-4Q
 for qemu-arm@nongnu.org; Wed, 17 Jun 2026 03:14:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781680463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=71q6KxJm7hdqKX1rCp8551OxVrnmXe7EMGMBojwHVCk=;
 b=NoWEfIVDhuWlQfR+gQ/BwJOk/WhjBz+S3Y7ZF8DMaNqCVnmIApJG36PzEHR273eynF5YTI
 wx8OGyIfwsVZMKl32AHkNaSzZqZT0ASi4uPV8YwbtAY98BWzk8sO29B0ldck2DzXpeGRc2
 AX0hXBb49pZYW5Q/8c2QP1FtTY75Q5I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-fejWLOBwPqmBS0Cw4PIjIw-1; Wed, 17 Jun 2026 03:14:20 -0400
X-MC-Unique: fejWLOBwPqmBS0Cw4PIjIw-1
X-Mimecast-MFC-AGG-ID: fejWLOBwPqmBS0Cw4PIjIw_1781680459
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-490ab3f6e55so31542795e9.0
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2026 00:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781680459; x=1782285259;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=71q6KxJm7hdqKX1rCp8551OxVrnmXe7EMGMBojwHVCk=;
 b=QXLpM6LrwrWn1fKoqitmCI8W3CgXYD/XF9QpJX1ZQ1ON+gmJw69o/EnKLZrMcmkwib
 +VDJwkE7ODJOQf8H8Mdsvrq56/xQUuhfbke/ttfDpvgXnzd73Zd4yDrQ1nA1XtNPmSGf
 oxK53e/ViJHdCLezzL44GKMTDo2Ki8V0UEkKZRE7MlOT0aRiDwZDvlwo3RarpPtsa80k
 Vn0EPeGAoFaKj5WUshI0Amtbbmal7PGfH7mXJWc1ZnFuVeY+1W9JLUZ5JN2SwrK3eBqs
 OVh9XBjhnTu2yTXqhGhcowkNn9S4ck3AhRfZsYgVlAMz7ECvXaGj6adOLW0iMiNsvCIP
 2I0w==
X-Gm-Message-State: AOJu0YxAjSPP529aJNhjpkKDXId3CIzqo2ICQudk9Wb0u1OIJ+D0Rm2P
 G5ddVwfkIbjNTQVPY/PEWnJDtNuml+ms7q2+rmio/xR0LDjHAMKgAzhQ1KC4UT9tusNvbarTalv
 lN0jwomkV20dS0ZjzrzAm9oHd0QOyJIXz3a4o+EmnSCqYWm0PAmsT+g==
X-Gm-Gg: Acq92OFh3QNp6xzUhj5mrrfGP4GX2iJK1BQrl8VgfOYV+u/WDsclykbOMQVcV2Y9STM
 FRp1pR3Vyy5afsiOaESdej1cliAcp1eiNCXLlUXMMYQoX7aoAOa0EmejCfi2gxBRPRlcn46WZc0
 DVmPSwJFAffNl9EUUtOv5lzRSSep0t0FV7HKr43ZzHQBGuJwlcKWL57sbRs2j7rmaOH/AsXI1j2
 8OborJ28JTTv9zaNdoAMglr0c9SZW0+tMSun/jjkcyuWc/BAaX4Rhg6Y1qiZNDTfV757cWklz3H
 rB1MptuhiCwq6Uu8Cim8os7lTobD6HZlH9anh561UxgyPcXQy9h+UVrY1PSzNxMPloEqVLkSOx7
 nDq7IYQP45hlwvKm4/u6/4PSiGniwRNZg
X-Received: by 2002:a05:600c:8286:b0:492:3316:4b34 with SMTP id
 5b1f17b1804b1-492333ba2b6mr44038445e9.2.1781680458789; 
 Wed, 17 Jun 2026 00:14:18 -0700 (PDT)
X-Received: by 2002:a05:600c:8286:b0:492:3316:4b34 with SMTP id
 5b1f17b1804b1-492333ba2b6mr44037405e9.2.1781680458090; 
 Wed, 17 Jun 2026 00:14:18 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49230a458f2sm129336145e9.3.2026.06.17.00.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 00:14:17 -0700 (PDT)
Date: Wed, 17 Jun 2026 03:14:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peterx@redhat.com,
 alex@shazbot.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org, berrange@redhat.com,
 philmd@oss.qualcomm.com, philmd@mailo.com, david@kernel.org,
 clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com,
 jugraham@redhat.com, liugang24219@sangfor.com.cn,
 dinghui@sangfor.com.cn, shan.gavin@gmail.com
Subject: list of memory/memcpy access issues
Message-ID: <20260617022330-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ds1b7wu4NxPw-sXFNktol-OBuvgoMF5-Gfu6jC9DFAk_1781680459
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

This is a top post attempting to summarize some findings related to
emulating DMA and MMIO existing in QEMU memory core
using memcpy/memmove.

Hopefully, this will help inform discussion about multiple
changes currently proposed for QEMU.

At a high level, and in a variety of configurations, QEMU gets
DMA requests from a virtual device, or MMIO requests from
a VCPU, and wants to execute them either on guest ram or
passhtrough device memory.

Down the road this almost always (virtio ring implementation seems to be
a notable exception) translates to memcpy/memmove calls
(glibc e.g. on x86 currently implements memcpy through memmove).

However, memcpy's signature is:
       void *memcpy(void *dest, const void *src, size_t n);
note how neither src not more importantly dest are volatile.
Thus it was never designed either for a concurrent access
by another CPU, or for accessing devices.
(Mis)using it for that gives good performance but has issues,
some of which I am trying to enumerate below.

In the below I say memcpy but same applies to memmove just as well.



------------------




1. On x86, memcpy is different from __builtin_memcpy if
one uses old 1.0 force-headers from 2019. Thus, QEMU
sometimes uses __builtin sometimes it does not, inconsitently.
Likely no longer relevant and should be cleaned up.


2. variable length memcpy can translate 2,4,8 byte guest access
into multiple byte accesses. doing this for mmio is
guaranteed to break devices.


3. (theoretical concern) also on x86, unaligned accesses are possible on guest and host,
so converting an unaligned access to a series of aligned ones can
in theory break devices.

4. also on x86, vector instructions for large (>16 byte) writes
into pgprot_noncached memory are safe and faster than multiple 8 byte
ones.

5. also on x86 it so happens that if you write a fixed-size memcpy this
gets optimized to a single store/load and it works for aligned and
unaligned addresses on that architecture. How to ensure this keeps being
correct is left as an excerise for the reader. But qemu already relies
on this and did for years.

6. on non-x86 both unaligned accesses and vector instructions
for accessing  UC memory are illegal.

7. standard vfio gives KVM VM_ALLOW_ANY_UNCACHED, so even on non x86
guest can
map the memory as as pgprot_noncached/ioremap or pgprot_writecombine/ioremap_uc.
If it does the second then it can use unaligned or vector for access.
This is why normal passthrough tends to work - it never traps to qemu at
all.


But for qemu, vfio uses  pgprot_noncached unconditionally so qemu
can't use unaligned or vector instructions on non-x86.


8. But for nvgrace RAM, vfio has a driver that uses pgprot_writecombine/ioremap_uc.
so qemu could safely use unaligned/vector instructioons even on non-x86.

9. Except sadly, vfio currently does not tell qemu how it maps
the memory, so qemu can not know what is safe on non-x86.

10. on x86 memcpy will sometimes do multiple overlapping stores when
size is not a power of 2. for example, a 15 byte write is done with
2 8-byte stores. This is theoretically an issue
if guest does something super clever with ordering,
but does not seem to be in practice.

11. on non-x86 memcpy will do multiple overlapping stores even
for single byte writes. E.g. it does it to avoid extra branches.
This is causing issues in practice.

12. PCI writes are in order, last byte is written last.
memmove especially writes last byte first sometimes.
Violating that theoretically can break guests.

13. but if we are copying between 2 addresses that are overlapping,
the standard trick (used by memmove) is to compare dst and src and copy
backwards if dst < src, so last byte is written first.

-------------



Some conclusions:

A. on x86, we must avoid converting 2,4,8 byte accesses into byte accesses.
At least for aligned, perferably for unaligned accesses too.
Fixed width memcpy seems to work for this. Whether we should bother with
__builtin to work around broken old fortify headers, I donnu.
I do not have any answer how to check that compiler does this correctly.
If anyone is motivated enough, adding a GCC builtin could be possible.
Given qemu did this for years, I think we can leave solving this for
another day.

B. Also on many architectures, memcpy is much faster for large transfers
than iterating over 8 byte chunks in C.
When we can get away with doing that (e.g. for emulated devices where
we know the concurrency rules, writing into guest RAM), we should.

C. on non-x86, we currently must not memcpy into host devices
since we do not know if it is pgprot_noncached. yes, performance will be
bad for DMA into device RAM.




D.  It goes without saying that casting an unaligned address to unint32_t
(be it for qatomic_set or whatever) is undefined behaviour in C
and so a bad idea on any architecture.


E. also for non-x86, we really should teach vfio to tell qemu whether
it maps device pgprot_noncached or pgprot_writecombine.
we will then be able to do things like use vector ops
(through memcpy or not) for >8 accesses.

F. Arbitrary device passthrough with drivers doing unalined accesses and
when working cross architectures basically is a best effort thing.  It
can't be 100% perfect for all devices.


--------------------

Links:


example of a fix for a bug caused by memcpy to overlapping addresses:
4a73aee881 - "softmmu: Use memmove in flatview_write_continue"
https://lore.kernel.org/qemu-devel/20230131030155.18932-1-akihiko.odaki@daynix.com


example of a bug caused by memcpy as result of DMA:
https://lore.kernel.org/qemu-devel/20260527091711.3901-1-liugang24219@sangfor.com.cn

an attempt to fix bugs caused by memcpy to device memory in response to
MMIO:
4a2e242bbb "memory: Don't use memcpy for ram_device regions"
https://lists.gnu.org/archive/html/qemu-devel/2016-10/msg08129.html

-- 
MST


