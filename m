Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81DDCD98E1
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 16:38:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZAKK-0007hx-CQ; Mon, 15 Jun 2026 12:38:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZAK1-0007eO-Sg
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 12:38:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZAK0-0002tO-9e
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 12:38:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781541479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fecMLN8qk73l4MP5eNwYdUBSx3kL69t/+/AyUSRaICA=;
 b=NtJHQqm1h95nlLpG7sb37JkPcbWmM7gb2vD18d1ham2l8j5/EF5xP0Ttf9gPaizLfV/lWZ
 7c3uhswHhmDHrWoK26j/twcfKtp5NPTsUaBORJEAoo7mmhywltkuAWXJl1B1I6a6GodGTf
 l2ttAaVDP+wHBPMBwntqyI0dRmFHtvE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-ujZavbaeM3G0dspapz9Big-1; Mon, 15 Jun 2026 12:37:55 -0400
X-MC-Unique: ujZavbaeM3G0dspapz9Big-1
X-Mimecast-MFC-AGG-ID: ujZavbaeM3G0dspapz9Big_1781541474
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-490b5d2e394so23716855e9.3
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 09:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781541474; x=1782146274;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fecMLN8qk73l4MP5eNwYdUBSx3kL69t/+/AyUSRaICA=;
 b=ZknfWaWWTxGJ3HZlh7fD0ZkwkIHQsg97FTVS1B63WRMSheUishcjsCaJtpvNXQJUwQ
 rLegv/dubxoZOz/1qtUOt/mr+Z/Za1gXDt8OimVnrSMADuy+sL/qHrXwWaK7apN4JvzW
 TrgY7rBvxfTVhh/fBECbDk1C/7wJTIleUapbxH3G5gnplJMiZwD/juP0sy2AxcU+/O86
 xzEW78UZItuaN5WjSPZUIRFoPhtNSvllIjCVfOfLdWiJX4a4qMCg6cGn9bPhv6Q6XZvR
 b41SYc23AzDCbAH/YG8xcCNHxYjBw3P3Ln9RZTtPql3G2iS8YFXkTQCnDhCe2Vx/YUoU
 UL0g==
X-Forwarded-Encrypted: i=1;
 AFNElJ/tilbOxWJd+3znGlPTun1cWIyiM4QQGdmDjXMmdRCvkjM6IcgBLJGs4SJOqiL0uYtimX9J9s9HXg==@nongnu.org
X-Gm-Message-State: AOJu0Yy21xFOS2Og5lHxW7sn3a7or2iI/ZgcyiIf7s+fitteYkiapCvV
 A8ePwz+UeitFjB9CkbPyL3wu2xqwx9ENlK6xVB3JGwXQ/ovehsR007Znc7xDviVMm2RyrYLEpEV
 mzk883YF3lmQcPldEgD2J5ELkVj4aA2V1I3l5vXDtBzCtct5rT0F0og==
X-Gm-Gg: Acq92OGRnjVoA9W7LvIXS8sdOlch3fDLxIb5DWp/jCoLT98+vGcnFKo5NZnCNr/mMTr
 1b+BwHcZdHhqOc8nDpRc31Nhq2lojKVDh7rr/AiXDoM+BbJybMkqvHGerx5xnKJDlRW0j0TOOqN
 7GrE2Vd/AuRlQDBiqXhI+qThbqHemy7rlqM6rvhRMEe0vkz3SfGgK9jLHNlz94m9hp9QJrOnPl9
 pb2bV/5qeeds5XshZQzGwvwNGm/k2PLW5l8WN7pGOn3XnHVtXMjRDMC60+5s9kP+N9CtJK9zjzN
 b7Nf4reMEklCiRcij4RzMXnCZ1CXwSM1NA0MuxAXO/trn5cu1bsi0ahP4G1y2Cp0j/vo0DQwZu6
 NQHKPEoJk2rOvrLM/zD4ukSRIbH2m438nzOmo0CBjSs4=
X-Received: by 2002:a7b:cb87:0:b0:491:a220:6e48 with SMTP id
 5b1f17b1804b1-491a2206e91mr129253725e9.32.1781541474149; 
 Mon, 15 Jun 2026 09:37:54 -0700 (PDT)
X-Received: by 2002:a7b:cb87:0:b0:491:a220:6e48 with SMTP id
 5b1f17b1804b1-491a2206e91mr129253085e9.32.1781541473620; 
 Mon, 15 Jun 2026 09:37:53 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea961f18sm281397045e9.2.2026.06.15.09.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 09:37:53 -0700 (PDT)
Date: Mon, 15 Jun 2026 12:37:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peterx@redhat.com, alex@shazbot.org,
 peter.maydell@linaro.org, berrange@redhat.com,
 philmd@oss.qualcomm.com, philmd@mailo.com, david@kernel.org,
 clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com,
 jugraham@redhat.com, liugang24219@sangfor.com.cn,
 dinghui@sangfor.com.cn, shan.gavin@gmail.com
Subject: Re: [PATCH v2 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
Message-ID: <20260615123633-mutt-send-email-mst@kernel.org>
References: <20260615100200.266968-1-gshan@redhat.com>
 <20260615100200.266968-2-gshan@redhat.com>
 <93fb3b41-1543-4e3b-922b-043b774f57bf@linaro.org>
 <20260615123354-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260615123354-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3y8vdp74u5X4QEX1AiAEScZGESRukmxvszMPiIZrbdU_1781541474
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

On Mon, Jun 15, 2026 at 12:36:00PM -0400, Michael S. Tsirkin wrote:
> On Mon, Jun 15, 2026 at 08:17:14AM -0700, Richard Henderson wrote:
> > On 6/15/26 03:01, Gavin Shan wrote:
> > > +void qemu_ram_copy(void *dest, const void *src, size_t n)
> > > +{
> > > +    if (HOST_UNALIGNED_MMIO_OK) {
> > > +        switch (n) {
> > > +        case 1:
> > > +            __builtin_memcpy(dest, src, 1);
> > > +            break;
> > > +        case 2:
> > > +            __builtin_memcpy(dest, src, 2);
> > > +            break;
> > > +        case 4:
> > > +            __builtin_memcpy(dest, src, 4);
> > > +            break;
> > > +        case 8:
> > > +            __builtin_memcpy(dest, src, 8);
> > > +            break;
> > > +        default:
> > > +            memcpy(dest, src, n);
> > > +        }
> > > +    } else {
> > > +        uintptr_t test, lsb;
> > > +
> > > +        do {
> > > +            test = (uintptr_t)dest | n;
> > > +            lsb = test & -test;
> > > +            switch (lsb) {
> > 
> > Either assert n != 0 to start, or use while not do/while.
> > Because the body of the loop won't handle n == 0 correctly.

I think n!=0 performs better than a loop. Worth checking
asm though.

> > > +            case 1:
> > > +                *(uint8_t *)dest = *(uint8_t *)src;
> > > +                src += 1;
> > > +                dest += 1;
> > > +                n -= 1;
> > > +                break;
> > > +            case 2:
> > > +                *(uint16_t *)dest = *(uint16_t *)src;
> > > +                src += 2;
> > > +                dest += 2;
> > > +                n -= 2;
> > > +                break;
> > > +            case 4:
> > > +                *(uint32_t *)dest = *(uint32_t *)src;
> > > +                src += 4;
> > > +                dest += 4;
> > > +                n -= 4;
> > > +                break;
> > > +            default:
> > > +                *(uint64_t *)dest = *(uint64_t *)src;
> > > +                src += 8;
> > > +                dest += 8;
> > > +                n -= 8;
> > 
> > Use qatomic_set for the stores.
> 
> 
> Won't this do things like locked on x86?

Hmm I didn't check. It's relaxed - so no locked. Fine by me.

> 
> 
> > 
> > src is not aligned, so except for case 1, you need ld{uw,l,q}_he_p.
> 
> These just map back to memcpy. What is the point?
> 
> > > +void qemu_ram_move(void *dest, const void *src, size_t n)
> > > +{
> > > +    if (HOST_UNALIGNED_MMIO_OK) {
> > > +        switch (n) {
> > > +        case 1:
> > > +            __builtin_memmove(dest, src, 1);
> > > +            break;
> > > +        case 2:
> > > +            __builtin_memmove(dest, src, 2);
> > > +            break;
> > > +        case 4:
> > > +            __builtin_memmove(dest, src, 4);
> > > +            break;
> > > +        case 8:
> > > +            __builtin_memmove(dest, src, 8);
> > > +            break;
> > > +        default:
> > > +            memmove(dest, src, n);
> > > +        }
> > > +    } else {
> > > +        qemu_ram_copy(dest, src, n);
> > > +    }
> > > +}
> > 
> > The qemu_ram_copy implementation above does not work with overlapping blocks.
> 
> IIUC copy is not supposed to. this is what move is for.
> 
> > 
> > r~


