Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7EFCD8CA8
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 05:41:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZMXc-0003R0-Pt; Tue, 16 Jun 2026 01:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wZMXa-0003Pe-6z
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 01:40:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wZMXY-0006I9-Cz
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 01:40:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781588447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l9v74Xf+ySkLVrj6OKIcODNeHAcQbiUH0ez0RUN3C8Y=;
 b=UFl+noLNkV6yivze8xX/De02RevgApwcoCYraxE88RSf21c5bbMg5s/m4Vzv/RSfQDKCad
 r/dSiTccPq2EFaBmhwr4BJBkl3TMyFWNkL2e0Fu9QmPRd9i2DZ3de16qgW81dbi+QgzzQC
 slas08SmID3u/Q0v56UdbCiTXHQDQpg=
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com
 [74.125.82.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-SmCI2C_EMqWdg57wpf5IGg-1; Tue, 16 Jun 2026 01:40:45 -0400
X-MC-Unique: SmCI2C_EMqWdg57wpf5IGg-1
X-Mimecast-MFC-AGG-ID: SmCI2C_EMqWdg57wpf5IGg_1781588445
Received: by mail-dl1-f70.google.com with SMTP id
 a92af1059eb24-1383723dfddso5258991c88.0
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 22:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781588444; x=1782193244;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l9v74Xf+ySkLVrj6OKIcODNeHAcQbiUH0ez0RUN3C8Y=;
 b=gWTk02x2WtuIoMW2mjOv85klhyyNDHpo/HmlubXKt2y2lZZAqTQQ18KsMPggE37+9H
 8rhx4/v35W6WxjhgQwx5T78ozwadVk6j0RdxULFXPd3XcM6xf3FIC5TsnXNskX311YOQ
 L6Jm4NPR0FuUEKgrLAqY7EA4r84Dw+FgaxsDdNoy3ECDqB/guURhsbfYJabcFA2hGdEW
 bvTY6T6UIjKXQPCajNFD2pHBkQya9I7ggG36TkqBYsOB6QKxpOyPmpI0tEUp4DBRqNkP
 t9qpnKRYWyfZynfxa6AvyDJeiMHlYvl4dVp9tgaHaIrQXtUbKDcqtBvHbzSAlUGl5wnU
 eErA==
X-Gm-Message-State: AOJu0YwMEN3BnLxdWN4CK7znWlob7ubslmrSdS7h8zCTJhtTvnWKKD+k
 LkscMmX1ThUTjm4RmkEE42fNneE4DbM7DWbGi/HllXPRtbUN7lWfIuz+79pKz1jFDyB6TbB9z9V
 S303uWwULQFkIPkUNVlH0lqn5DJeLbivlSwTsYgtkZDtY5jVuyjY0XTVyLK1xFQkLQFUaYBWbQs
 U+0fg89tDjSrnxenj7mLWSdYYOXYeLk6pwnw==
X-Gm-Gg: Acq92OGxHMupcn0N1RGjw3j9YNkDo/jxT+EXpKYhajp4croN6//6Mua28WnQjsxT0HJ
 JZywcuz633g8Z1puxkVgi7+dHv2TE7iv3BG9W2NcYMY4TXiO8ANLb5S2Xsa1WGXJr4zso0++0mf
 sAYC8Me4F0cctRcN/XkZWwikOmSEFDrbktKO3ij3lZ3PdRwt2o7Duw4iqpnjnEGTIz6rCkt4cqN
 wQL74QT8j0q7ZeCEoNZo5WeKVF7EfIFvM6LP7zZ1AfbPCvKt00n77oJxsBflzhsXBJZhpI0H6tG
 dDLAosmb1Tt1ZUwDk9UPOnqPVwd7qKPN7uQKqKScto/QhEESA2bYX9MVWbVDojk6vdpebfRl8w1
 JYaD0Wvqu3YRH5hEvuIWZGcVlf29mWRSS9cEC/7QFP5Hd6GX/hv0XRPCf4Y4hstW1
X-Received: by 2002:a05:7022:1281:b0:138:417f:ab62 with SMTP id
 a92af1059eb24-13985f3ed47mr864872c88.31.1781588444319; 
 Mon, 15 Jun 2026 22:40:44 -0700 (PDT)
X-Received: by 2002:a05:7022:1281:b0:138:417f:ab62 with SMTP id
 a92af1059eb24-13985f3ed47mr864845c88.31.1781588443575; 
 Mon, 15 Jun 2026 22:40:43 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1384b964862sm12713652c88.10.2026.06.15.22.40.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 22:40:43 -0700 (PDT)
Message-ID: <ae17b5a6-eed8-4d4c-a798-cb92ffa6c915@redhat.com>
Date: Tue, 16 Jun 2026 15:40:34 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] system/memory: Make ram device region directly
 accessible
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, mst@redhat.com, peterx@redhat.com,
 alex@shazbot.org, richard.henderson@linaro.org, peter.maydell@linaro.org,
 berrange@redhat.com, philmd@oss.qualcomm.com, philmd@mailo.com,
 david@kernel.org, clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com,
 jugraham@redhat.com, liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn,
 shan.gavin@gmail.com
References: <20260616052552.389021-1-gshan@redhat.com>
In-Reply-To: <20260616052552.389021-1-gshan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AL2DCBZ50RURk882ZzjJAHmFPjzcpcjIm9Zs64DZMyw_1781588445
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 6/16/26 3:25 PM, Gavin Shan wrote:
> All ram device regions was turned to be indirectly accessible by commit
> 4a2e242bbb ("memory: Don't use memcpy for ram_device regions"). This leads
> to a hanged guest where a NVidia GH100 GPU is passed from host. The memory
> in its PCI BAR#4 can be allocated as DMA target buffer. qemu has to take
> DMA bounce buffer in address_space_map() to cover the DMA request. However,
> the bounce buffer size is 4096 bytes and we're overrunning it easily when
> the guest has significant disk activities on compiling 'cuda-samples'.
> The full log and problem description can be found from PATCH[1/2]'s commit
> log.
> 
> Try to fix the issue handled in commit 4a2e242bbb by replacing memcopy()/
> memmove() with newly added helpers qemu_ram_{copy, move}() that works on
> top of __builtin_{memcpy, memmove} or unaligned access friendly memory
> movement in the accessors to the ram device regions. With this, we can
> basically revert that commit to make ram device region directly accessible
> again and bypass the bounce buffer in address_space_map() where the guest
> hang is caused.
> 
> PATCH[1] uses qemu_ram_{copy, move}() in ram device region accessors
> PATCH[2] makes ram device region directly accessible again
> 
Michael asked to include below context in the cover letter in v3, but I
didn't noticed that before I sent v3 series, appended with them.

----

The issues listed by Michael:

1. On x86, memcpy is different from __builtin_memcpy if one uses old 1.0
    force-headers from 2019. Likely no longer relevant.

2. variable length memcpy can translate 2,4,8 byte guest access into
    multiple byte accesses. doing this for mmio is guaranteed to break devices.

3. (theoretical concern) also on x86, unaligned accesses are possible on guest
    and host, so converting an unaligned access to a series of aligned ones can
    in theory break devices.

4. also on x86, vector instructions for large (>16 byte) writes into
    pgprot_noncached memory are safe and faster than multiple 8 byte ones.

5. also on x86 it so happens that if you write a fixed-size memcpy this gets
    optimized to a single store/load and it works for aligned and unaligned
    addresses on that architecture. How to ensure this keeps being correct
    is left as an excerise for the reader. But qemu already relies on this
    and did for years.

6. on non-x86 both unaligned accesses and vector instructions for accessing
    UC memory are illegal.

7. standard vfio gives KVM VM_ALLOW_ANY_UNCACHED, so even on non x86 guest can
    map the memory as as pgprot_noncached/ioremap or pgprot_writecombine/ioremap_uc.
    If it does the second then it can use unaligned or vector for access.
    This is why normal passthrough tends to work - it never traps to qemu at
    all. But for qemu, vfio uses  pgprot_noncached unconditionally so qemu
    can't use unaligned or vector instructions on non-x86.


8. But for nvgrace RAM, vfio has a driver that uses pgprot_writecombine/ioremap_uc.
    so qemu could safely use unaligned/vector instructioons even on non-x86.

9. Except sadly, vfio currently does not tell qemu how it maps
    the memory, so qemu can not know what is safe on non-x86.


Now, what is to be done?


A. on x86, we must avoid converting 2,4,8 byte accesses into byte accesses.
At least for aligned, perferably for unaligned accesses too.
Fixed width memcpy seems to work for this. Whether we should bother with
__builtin to work around broken old fortify headers, I donnu.
I do not have any answer how to check that compiler does this correctly.
If anyone is motivated enough, adding a GCC builtin could be possible.
Given qemu did this for years, I think we can leave solving this for
another day.

B. Also on x86, I do not see why we should not use memcpy for large
accesses if we can. Better perf.

C. on non-x86, we currently must not memcpy since we do not know if it
is pgprot_noncached. yes, performance will be bad for DMA into device RAM.

D. It goes without saying that casting an unaligned address to unint32_t
(be it for qatomic_set or whatever) is undefined behaviour in C
and so a bad idea on any architecture.

E. also for non-x86, we really should teach vfio to tell qemu whether
it maps device pgprot_noncached or pgprot_writecombine.
we will then be able to use memcpy for >8 accesses.

Anyone, correct me if I'm wrong? Maybe I should start a new thread with
this summary?

Thanks,
Gavin


