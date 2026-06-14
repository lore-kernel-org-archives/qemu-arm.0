Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70A0CD98C5
	for <qemu-arm@archiver.kernel.org>; Sun, 14 Jun 2026 16:07:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wYnMd-000422-Ag; Sun, 14 Jun 2026 12:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wYnMX-0003v2-Sh
 for qemu-arm@nongnu.org; Sun, 14 Jun 2026 12:07:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wYnMV-0001YP-CX
 for qemu-arm@nongnu.org; Sun, 14 Jun 2026 12:07:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781453222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2tV6J5gJ9j8+nnh1mDJlr7zCMjsCgwieqrsU10x5lqA=;
 b=d3dxylBrg5x4nFzGW5ov7FJnLF/eAE6KExZUx9mVt1EbVIZ5oTWotQJx9ohqwL8NN78IkL
 B9OSnAC1Xo+olXVmWJZOyMLZqy5M0OZZvY2ULM4N/df5z227Yd32HNM4iSfsZzkUpWi7sU
 mhaSk1BQ0dp1EYS+6+ck3QrasoCy4aE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-radevxhpMw2r6N70TwQvOQ-1; Sun, 14 Jun 2026 12:07:01 -0400
X-MC-Unique: radevxhpMw2r6N70TwQvOQ-1
X-Mimecast-MFC-AGG-ID: radevxhpMw2r6N70TwQvOQ_1781453220
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-490b93debc8so24533385e9.1
 for <qemu-arm@nongnu.org>; Sun, 14 Jun 2026 09:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781453220; x=1782058020;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2tV6J5gJ9j8+nnh1mDJlr7zCMjsCgwieqrsU10x5lqA=;
 b=sCbqztnU3JsEae17WPGz1dDOMxNeLg0O0jl5NMbWB3XmM1cHTVZFgN+rd7dNqCiUIF
 HBCEj/qHFGSSUrmyXVEvbz0ggqx3QsFcregwl8rqV4IcsZFcLe5twkgfzRBXuPiq95kE
 IFFCwoFNSIAVzf33AOEsfVYdryjpCSO/jZAB+Fpkz6QMvaXCSCEgU2j7zxGz71JJr6GM
 7SAGGRdOKnzYadigR029DnrSjVFdHmavEbRuCzXdNPODdst/H9IFJ+MA6Cn8UkZdygdr
 EwsFYXLwtID99jPTlePLPJmArft4sspD4FBNVqq39JwKfSJD6qCKNOEbUNKshMQPkXbL
 F/6g==
X-Forwarded-Encrypted: i=1;
 AFNElJ8JQEKZ6akZhLWA38jo5nkZ36sXVzGfgARSxRX3MbnsNH/rHkzGQ1wJImOVzZ2X0bH2UC4Sb6hHrQ==@nongnu.org
X-Gm-Message-State: AOJu0YxsA77kc3eFHM6vwJf2fr2IbGrhVBMTTqMsY0cgmb4h86iKCoAt
 RRQehT8+2pkRUE7EfTPfOOmOpDKMhxozqRkocQZnhNgdLAIS0A1ossxqxX1Q905xzWAj8U0ZSDj
 HDJiBHgUEiunxqPtRBNErmSYAZ5hTa55KhFNGDt1X5LDScb3juo/2qg==
X-Gm-Gg: Acq92OFc5btnVNxAp5dOfjQudnbWyGgCguTxAo4krgEXhU0pQdcoTJKxPQuekZRU0f2
 37tn2Q8k1Qaw856HkupdLqz/a2sn59wAJ8L9pHNdd71hzkeRdEtqTsDrLX1RwaCdEf8Sxnabobi
 TxIOWm5Iwo7GtpFEM987WUsWDWBB8mgaLnXh6UZTYUoC+eVxi4fAesHP3XwtKkXYJoeDyXf/yyD
 sscAyWLsf8Be5kLd2FDrz0UFwVDdALt4GDZj9xmvSPTnOJLrSFblzV3y3V8KRh0TFXsmIrIux8e
 u2r8AI47JrvMawsUShVtMrr3IYICXMtP/WPWH0XnRcaO3uIZn6b/6hZNhOB+vKEX2ld7v+Fq6AT
 ftp+FK6tQ3azzI3nUArHfmS1JtAS85qXY0Qk2sX85jQw=
X-Received: by 2002:a05:600c:1d99:b0:490:e5c1:b8bf with SMTP id
 5b1f17b1804b1-49220061e5bmr86887535e9.13.1781453219669; 
 Sun, 14 Jun 2026 09:06:59 -0700 (PDT)
X-Received: by 2002:a05:600c:1d99:b0:490:e5c1:b8bf with SMTP id
 5b1f17b1804b1-49220061e5bmr86887015e9.13.1781453219140; 
 Sun, 14 Jun 2026 09:06:59 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492202edc23sm177037195e9.2.2026.06.14.09.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2026 09:06:58 -0700 (PDT)
Date: Sun, 14 Jun 2026 12:06:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peterx@redhat.com, berrange@redhat.com,
 david@kernel.org, alex@shazbot.org, clg@redhat.com,
 pbonzini@redhat.com, philmd@mailo.com, phrdina@redhat.com,
 jugraham@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH 1/2] system/memory: Use __builtin_mem{cpy, move} in
 accessors of ram device region
Message-ID: <20260614120334-mutt-send-email-mst@kernel.org>
References: <20260612110307.1264798-1-gshan@redhat.com>
 <20260612110307.1264798-2-gshan@redhat.com>
 <223f5f94-b9b7-46b0-8466-5be655203a0e@linaro.org>
 <CAFEAcA-TgP_BM0WQo3rysZmvhNN17Gc_nrSYB6pXn-mvs5w13g@mail.gmail.com>
 <123d9e80-d731-42c7-81cc-71de47bb13d3@linaro.org>
 <20260614084004-mutt-send-email-mst@kernel.org>
 <CAFEAcA9ng79Z7ALpqqTZQijCyYSoqMNK1Q5CYR_kcYBW9+wD2g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9ng79Z7ALpqqTZQijCyYSoqMNK1Q5CYR_kcYBW9+wD2g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FO41YLpVNwoK3nB3u4r7rCX2OyCm3qxkhIqxfLB0748_1781453220
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

On Sun, Jun 14, 2026 at 05:01:34PM +0100, Peter Maydell wrote:
> On Sun, 14 Jun 2026 at 16:13, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Fri, Jun 12, 2026 at 10:25:35AM -0700, Richard Henderson wrote:
> > > On 6/12/26 09:36, Peter Maydell wrote:
> > > > On Fri, 12 Jun 2026 at 16:29, Richard Henderson
> > > > <richard.henderson@linaro.org> wrote:
> > > > >
> > > > > On 6/12/26 04:03, Gavin Shan wrote:
> > > > > > This replaces mem{cpy, move} with __builtin_mem{cpy, move} in the memory
> > > > > > accessors to ram device memory region, preparatory work to make ram device
> > > > > > region directly accessible and bypass the bounce buffer in the DMA path
> > > > > > in next patch.
> > > > >
> > > > > memcpy/memmove *always* compile to __builtin_memcpy/memmove, and the compiler later
> > > > > decides whether or not to expand inline.
> > > >
> > > > Yes, but if you pass it a fixed small integer, then it is likely
> > > > to expand it inline, whereas if you pass it a variable then it
> > > > is likely not to... The patch is attempting to persuade the
> > > > compiler to definitely do an inline access for 1, 2, 4, 8
> > > > byte access.
> > >
> > > Sure, for hosts with unaligned accesses.  We still have sparc64 and (some?)
> > > riscv64 that don't automatically have such and will compile to more than one
> > > host instruction.
> > >
> > > > > My real question is: what are you attempting to achieve?
> > > > >
> > > > > (1) is the problem unaligned access to a mapped physical device?
> > > > > (2) is the problem vector access to a mapped physical device?
> > > > > (3) something else?
> > > >
> > > > I think there are two problems we're trying to fix here:
> > > >
> > > > (1) If a device does e.g. a pci_dma_write() with size 1, we want
> > > > this to turn into exactly 1 byte write into guest memory, for the
> > > > normal case where the guest memory is real host RAM.
> > > > This deals with the e1000 bug where the pci_dma_write() turns into
> > > > a call to glibc memmove() with size 1 and glibc's implementation
> > > > turns that into 3 writes of the byte to the same address...
> > >
> > > Gotcha.  Easily handled by not using memcpy/memmove at all.
> > >
> > >       *(char *)ptr = val;
> > >
> > > is sufficient for all hosts.
> >
> > Yes, I think it does work because we use -fno-strict-aliasing.
> > For bigger sizes we'll need packed because the addresses
> > could be unaligned.
> 
> IIRC "packed" will cause architectures that can't do
> unaligned word accesses to emit code to do byte accesses,
> so you don't want that.

I mean, what's left to do if guest wants an unaligned access? Crash?
On classical PCI, unaligned accesses are split up by the bus, so
there's a decent chance most devices will be ok if qemu does it.


> You need to explicitly check alignment,
> I think.
> 
> > But again, qemu simply already relies on this in bswap.h
> >
> > I kind of dislike muddying the waters by making several
> > unrelated changes here. If we do we should change bwap too.
> 
> The ldl_p etc functions in bswap.h provide different semantics:
> ldl_p() is "do a load of a 32-bit quantity, even if the
> address is not 4-aligned". We don't care if the compiler
> or the memcpy ends up doing that as 4 byte accesses, which
> on some hosts it must do.
> 
> thanks
> -- PMM


I mean the ram device ops trick is using bounce buffers precisely
because it happens to give you a single load.
And yes on hosts where it does not work, these devices
won't work, and qemu can't fix that.

-- 
MST


