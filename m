Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29362CDE000
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 16:47:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcnEd-00014z-NT; Thu, 25 Jun 2026 12:47:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wcnEW-000148-Df
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 12:47:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wcnES-0007ux-As
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 12:47:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782406034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mv2e/saDz5F/Jj5ghuxYree2ZuUFNTyvAA+473uasE4=;
 b=HiFWosKh/Biq9tBWgl/MM8g8wmJgnCSFbwdbskF194L9JI3Igb0l+GOfASpYwX327isVWB
 c1+rw7zzvx+N1YxgxQiSmRz6qbpfcAHw1/z+ChF2FnSv+2xLm794n994kpFQruybphthf3
 ELObmQEgrekaSgtdSSN0RwtwP430n4M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-MHJc84qHNF29bXUAEtn4FA-1; Thu, 25 Jun 2026 12:47:13 -0400
X-MC-Unique: MHJc84qHNF29bXUAEtn4FA-1
X-Mimecast-MFC-AGG-ID: MHJc84qHNF29bXUAEtn4FA_1782406032
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-490aadb1386so7733485e9.0
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 09:47:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782406032; x=1783010832;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mv2e/saDz5F/Jj5ghuxYree2ZuUFNTyvAA+473uasE4=;
 b=WGYDHy9vVxnBb0UmLLQlMI5yb3qmCQgo2CwOzkDzsEXmSIrl+tJdMRvb3m1h/6FyZM
 IU4vjUH2stwzsM55mfzcl5239IViPYmYDCWTMjIboSGcj1Qp1FZzUPClnem53dVGk3mE
 ti1/1sxr5185NPN2RkX0wPfAnMbtP2KtnncBdMFqUyZAkpQuTTual4hgmSOs5SKu2q3F
 +2+iNbdd+5/B8Pyl5q8sbNS0cRZyYEMvT9u0gEtVBkviJ+qYdM58Bk9KW0GpmviM6YZg
 LIl/SRYIAaV7uPxHyNEupM7VWCbJRamjbTS691HzOf8UMY7h0CrK3fJN1NJm5JwtW3Kd
 VAyg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8ZfzE2ZuwAoGC3u4OLukXA4MtPpuQ7hiJRtGkO1f0LIzyuPxegdDfStOG6hN73c4MrjmKBeGTpMQ==@nongnu.org
X-Gm-Message-State: AOJu0YyfE0eHbudfSMqHUJZOBHXlplPhsapnMBaY6LROnBxUPKr5yheE
 lsO6T7e6Pii/ZRTsGsljNoXbmJ7yyZFEBu9gjyXWVmpNxfubgyrUrJF1MSL2qZQSPUnL3XSUBUl
 zhUtZR8XNUOHxt888bmsYFO6M8q70U+oolhLp88RnSxvNCF7T0vXpzQ==
X-Gm-Gg: AfdE7clWi9ogrp627LVDGaNS61ocP54Uo1lsB7DgVie5dPEKnEPkVsxqNB+mECML8WN
 S4yRGGF0Q54EDZx682cglQyt0IacIH6wyxP0xiyWAu9i/PivKMGrr4fwTjVgVT6fEfLJlBx5aJh
 tSF6Sor157dqUDhKiTg+3pAaT7hufzoTkphVRsY5n/1oU6PLAPVcb/NRrHLU6dWMuOmxljU3CX1
 6pfO7x0vVwYFWz+TSJjioTEvcJF0RPXi2nrl9VRS7guHJgDAOBUzjBP4HP9zcaZk5Ik8qXWsx/V
 yjUyGNV/169AGl8vcB0nKqnd3Oofzpx16egHO/wrhgAZZ2LfOI/Q1Dn+4GhW3u/K+o5LEFcv/ba
 gLVDNfvv8Pib/3a6uf5V5K2uMlTDSijvY
X-Received: by 2002:a05:600c:5756:b0:492:690e:9fb8 with SMTP id
 5b1f17b1804b1-492690ea0b0mr5458355e9.15.1782406031822; 
 Thu, 25 Jun 2026 09:47:11 -0700 (PDT)
X-Received: by 2002:a05:600c:5756:b0:492:690e:9fb8 with SMTP id
 5b1f17b1804b1-492690ea0b0mr5457955e9.15.1782406031191; 
 Thu, 25 Jun 2026 09:47:11 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46dd5f9da4fsm7012260f8f.23.2026.06.25.09.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2026 09:47:10 -0700 (PDT)
Date: Thu, 25 Jun 2026 12:47:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peterx@redhat.com, alex@shazbot.org,
 richard.henderson@linaro.org, berrange@redhat.com,
 philmd@oss.qualcomm.com, philmd@mailo.com, david@kernel.org,
 clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com,
 jugraham@redhat.com, liugang24219@sangfor.com.cn,
 dinghui@sangfor.com.cn, shan.gavin@gmail.com
Subject: Re: [PATCH v3 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
Message-ID: <20260625123119-mutt-send-email-mst@kernel.org>
References: <20260616052552.389021-1-gshan@redhat.com>
 <20260616052552.389021-2-gshan@redhat.com>
 <CAFEAcA-mf14=jpRFHarAbN6AbQwvW=Yu6WB1JiNMsECEdaxD3A@mail.gmail.com>
 <20260625070551-mutt-send-email-mst@kernel.org>
 <CAFEAcA8YJZq9TqrUd0zTnewAdVDm5y6UV7BJQZ0C60TZ=RT98Q@mail.gmail.com>
 <20260625091334-mutt-send-email-mst@kernel.org>
 <CAFEAcA8xK+t3-prEphtkq-o9UY2mgS6cowhs880GOaxL9dKSGw@mail.gmail.com>
 <20260625101817-mutt-send-email-mst@kernel.org>
 <CAFEAcA8-Un+Q1yBDqLWCLPRwtgTA_VhJqGobgZChrFhAeVfG8A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8-Un+Q1yBDqLWCLPRwtgTA_VhJqGobgZChrFhAeVfG8A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rGExHuE1U6i62Uxwr5hmFpPe-cYL7mOTmLZaRZ5zzJ0_1782406032
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

On Thu, Jun 25, 2026 at 04:23:47PM +0100, Peter Maydell wrote:
> On Thu, 25 Jun 2026 at 15:52, Michael S. Tsirkin <mst@redhat.com> wrote:
> > I think there is exactly 1 kinda reasonable case. A 2 byte read/write at
> > offset 0x1 within a dword. This maps nicely to even classical PCI byte
> > enable mechanism and so yes it works if your CPU can initiate these
> > things, and it's atomic.
> >
> > I tried reading LEDCTL on e1000e:
> >
> >        byte  @ 0xe00: 0x64
> >        byte  @ 0xe01: 0x2a
> >        byte  @ 0xe02: 0x00
> >        byte  @ 0xe03: 0x00
> >        word  @ 0xe00: 0x2a64
> >        word  @ 0xe01: 0x002a
> >
> > Works fine.
> 
> The e1000e datasheet actually documents what it does in this
> case (slightly surprising, since hardware engineers love to
> leave this kind of corner case undocumented):
> 
> # For registers that should be accessed as 32-bit double words,
> # partial writes (less than a 32-bit double word) does not take
> # effect (such as, the write is ignored).
> # Partial reads
> # return all 32 bits of data regardless of the byte enables.
> #
> # Note: Partial reads to clear-by-read registers (such as, ICR)
> # can have unexpected results since all 32 bits are actually read
> # regardless of the byte enables. Partial reads should not be done.
> 
> So for this specific device that access is out-of-spec.

You mean that access to clear by read should not be done, right?

> I guess what I'm wondering is: can we just have code
> that does an aligned exact-width access in the 1/2/4/8
> byte aligned case, and the host's best approximation to
> an unaligned exact-width access for the 2/4/8 byte
> unaligned case?

That's my idea, too.

> (so on sparc you get multiple smaller
> accesses, and on most archs including x86 and arm you
> get an unaligned load).

I thought unaligned load from uncacheable on arm is
also a fault?

> That would mean the guest could
> potentially provoke a fault on the load/store on an
> access to a passthrough device, but if you give the
> guest passthrough access it can very likely provoke
> a fault anyway, depending on exactly what the device is.
> 
> I think the most likely reason for an unaligned access
> in this codepath is "it's actually RAM, either really
> host RAM or else something memory-like in a BAR", and
> either way if the guest does a 4-byte unaligned access
> then doing a 4-byte unaligned access seems better than
> second-guessing it, even on non-x86.
> 
> -- PMM

Right though remember: whether it's RAM doesn't matter. What matters is
how we map it.  qemu might fault because it maps NC but guest maps
cacheable and it's ok.

But, all this in theory. At a high level, I personally think going with
what you propose as a 1st approximation is entirely reasonable, except
for one thing: we really should not crash qemu, since access can be from
guest userspace.

qemu should know how things are mapped, and predict it will fault.
Approximating by splitting in that case sounds reasonable.



-- 
MST


