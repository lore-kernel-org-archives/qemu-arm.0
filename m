Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F97CDE009
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 18:41:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcp0M-0003ll-9c; Thu, 25 Jun 2026 14:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wcp0K-0003l7-9k
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 14:40:48 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wcp0I-0005lY-G2
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 14:40:48 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-662dc3879acso256220d50.0
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 11:40:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782412842; cv=none;
 d=google.com; s=arc-20260327;
 b=h6L5lUmkLCdUSxooWUigj4iESkiYVl2o32s7pgwZ0O6nTM8Nxo5zFO/c13C+1EE/3m
 UM3G+w1PU4hXHWHbuVYEDRpH5jcLca2ebqbFNRQRBayw1V89S7Rw+iQvLVzAHl2gRphq
 XwX/+HT+pCzFIR9WsVq9YvysUSSQod4G3ickE9wy9iKudcRMa9Rfrdt21pay08Yk1Jf6
 tbrIHKULuEbObD9BskJYo8zHT0bMrUpLDuNbqNEFxqiiodR4LASOgZvctVfouYh4OT7v
 VHVy3ZfETKPkq2AHk9o/McwViAuhd9xIb5bKPxLk9xpXQKsMYZ6xHsvSyaT9LwtZUa7g
 TC1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=1//dkdkVyo3lk9F7xtNTKOwcUnSX+MrMrUozB81hdj8=;
 fh=zQ+1/WZxyJNphePpMJP3pTLNDk/eCXAp/EVj6lSxnzQ=;
 b=fsn0EfkEwSz1CmFTGKAT9fzh6W+5BWyAS0g7QhkO3upvOQPW/69EIRykgesCPzx+XZ
 GWxR0aaE+PXsifzoc+jT4pwTzUvLhPNZH0T5JQn1Jwqt8koHDzur6OTX+qoA5LjyI2zS
 A9bdTkGrayAyb5yA4O1HjWlaUbsTX5kRA31G6foMGjyOtVdVckqRf/5ncFR0OnTKVTCp
 f0Onm/UoQLrEzhlWVV8a+b1wBiyJZGvubhIXhNLKn0rGfV+KQm7Ia13tRf8pDDur6FA7
 1U9Ug2nbv7YQl8fWAQ3hlHG7AsjZtrQoD9dU4nH61WrYnL5dGd4c945HqYBdTRAhhjNt
 6WSQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782412842; x=1783017642; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1//dkdkVyo3lk9F7xtNTKOwcUnSX+MrMrUozB81hdj8=;
 b=Vh6FzyGn0jhMag99f4QZsT5buhoAsX+8tClfCYY9C4yZfJNJW94td63AeSUQNUrpj+
 onH8MQ7Mn1iWrFIQg1eEQOsC3zJTwcBsPk79JP1EhoaUFkW4WI5R9OpHQLsvCln+tEIg
 hEwSbgIOMhJW1gmgqvl7/NRsxjkCocq3+kcpnhi6b8uNLEUiDjmj4ogggb5jmnkEe/M5
 4hVq4U8DjIXWryXJHfCLPGGOf9kKOMMwaSSyWTFUmGIQYgqOxL+ebvnB7kXUFYKC1/BJ
 o/hGo6fwASF0St9w4gvX0qYpVUeGEkdhoxMEClZxBN+YX+8Wet4TY44MsxROytPuioLA
 0Ppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782412842; x=1783017642;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1//dkdkVyo3lk9F7xtNTKOwcUnSX+MrMrUozB81hdj8=;
 b=PjDFqqSE1lmRtWuiAxnaGPz1RLLm9MVuFDJL7MbjLbZzFjApNCstg75TBia0YsTVLu
 Qro/MtDbtCZ5C4e3gKiNjlyWnkV4mN9OD5QhWJj6SfMr3iWDStvPKs+q1TRsoDdDPHvp
 284yGs9x6vY429CVcEbfxBkS8IPLhgcHb39gCZPLXliZzUVou6rKOdENRYdoXR2ceQIT
 xnTyn5o9B9rqShuhTqtBMEiAunzkYgehj00n0C6xa1k93dge0OESZhtgE3ZKAtXUfqpQ
 huksGJcxVxR/kd6bk79DscQVAxZGAz0h+d5p64xq/1kO9rRFsLLJCTK70+BWw8LMot/h
 hm9w==
X-Forwarded-Encrypted: i=1;
 AHgh+RpQpcP4xO7ghBGMB3n27wpYXH652ixPuFMVcdfrITtU5341vtZPmUy6vBd7QeAnrviJmWGGmVz5Gg==@nongnu.org
X-Gm-Message-State: AOJu0YyLWgwy23P0FiWxkMu4wkWV2Jxx3DpiRuZe+S9+WDnvyP9gD6Hu
 5lqYTYwtiR8JcsJPAaghBCFGVoTLs/G0/nuzHtbOVFjEMZoVt0mIXk88QwXtoEBb/fE0KHaFi6F
 cAZAQBmzC+4oo+aWlIxV4v2TS+DcpQjfkxJFbzs2+Vg==
X-Gm-Gg: AfdE7cn0mwSS3ddmY/zjW3r+NjwmUwR7qBu+TTMPiFwGrIdxLDRK8jvMBi9j3Y7p1FE
 STq+ZQyYQ8cgv9DFc5VV3wbfJEe2t8WOzwmMCOignsEuytZlzLwiMn5CQyXOXOkpWVojmylk1BZ
 3X+/iUu89nSS8COV/3IiM2YIQzjyN/9ituO0bwAG5JXOvzW/XuXOIDb94s5Vm3km1FxE9li66Iq
 ACxHoNwekEJ1FnkYC5+UfbxV/u3GEoCsaa162cW9RUtqjr11jFvVqMFmYd6berBfkxo8ZjFNhbt
 9mfTopB2rKVQXK0r5FyRP7FS6VJ0XLBxQJcRA1wsa6jPZ8NbGaoL0uYy
X-Received: by 2002:a05:690e:1c09:b0:662:e7e4:fe6f with SMTP id
 956f58d0204a3-66487e682edmr2718511d50.21.1782412841502; Thu, 25 Jun 2026
 11:40:41 -0700 (PDT)
MIME-Version: 1.0
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
In-Reply-To: <20260625123119-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2026 19:40:29 +0100
X-Gm-Features: AVVi8CcIN6O95iU7xBQuCQgAwOgN2fhwHOqWingqGxZG58bh6oBQyKNS2oH6J-4
Message-ID: <CAFEAcA8UjtXgmPC27fOKMwbaWs2piwGYudtwCNWQHuu3E_7A-A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 peterx@redhat.com, alex@shazbot.org, richard.henderson@linaro.org, 
 berrange@redhat.com, philmd@oss.qualcomm.com, philmd@mailo.com, 
 david@kernel.org, clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com, 
 jugraham@redhat.com, liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn, 
 shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Thu, 25 Jun 2026 at 17:47, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Jun 25, 2026 at 04:23:47PM +0100, Peter Maydell wrote:
> > On Thu, 25 Jun 2026 at 15:52, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > I think there is exactly 1 kinda reasonable case. A 2 byte read/write at
> > > offset 0x1 within a dword. This maps nicely to even classical PCI byte
> > > enable mechanism and so yes it works if your CPU can initiate these
> > > things, and it's atomic.
> > >
> > > I tried reading LEDCTL on e1000e:
> > >
> > >        byte  @ 0xe00: 0x64
> > >        byte  @ 0xe01: 0x2a
> > >        byte  @ 0xe02: 0x00
> > >        byte  @ 0xe03: 0x00
> > >        word  @ 0xe00: 0x2a64
> > >        word  @ 0xe01: 0x002a
> > >
> > > Works fine.
> >
> > The e1000e datasheet actually documents what it does in this
> > case (slightly surprising, since hardware engineers love to
> > leave this kind of corner case undocumented):
> >
> > # For registers that should be accessed as 32-bit double words,
> > # partial writes (less than a 32-bit double word) does not take
> > # effect (such as, the write is ignored).
> > # Partial reads
> > # return all 32 bits of data regardless of the byte enables.
> > #
> > # Note: Partial reads to clear-by-read registers (such as, ICR)
> > # can have unexpected results since all 32 bits are actually read
> > # regardless of the byte enables. Partial reads should not be done.
> >
> > So for this specific device that access is out-of-spec.
>
> You mean that access to clear by read should not be done, right?

The datasheet is ambiguous about whether "Partial reads should
not be done" is meant to apply generally or only to clear-by-read
registers.

> > I guess what I'm wondering is: can we just have code
> > that does an aligned exact-width access in the 1/2/4/8
> > byte aligned case, and the host's best approximation to
> > an unaligned exact-width access for the 2/4/8 byte
> > unaligned case?
>
> That's my idea, too.
>
> > (so on sparc you get multiple smaller
> > accesses, and on most archs including x86 and arm you
> > get an unaligned load).
>
> I thought unaligned load from uncacheable on arm is
> also a fault?

For Arm the distinction is not cacheable/uncacheable
but Normal vs Device. (Device is essentially for things
which are not RAM; Normal is for RAM and RAM-like things,
and includes all of Normal Non-cacheable, Normal WT-Cacheable
and Normal WB-Cacheable.) Things mapped as Normal memory
don't generate unaligned faults (unless the guest turned them
on deliberately). For Device memory, it is IMPLEMENTATION
DEFINED whether you get an alignment fault or not if you
map something as Device that could have handled unaligned
accesses if you had mapped it as Normal.

> > That would mean the guest could
> > potentially provoke a fault on the load/store on an
> > access to a passthrough device, but if you give the
> > guest passthrough access it can very likely provoke
> > a fault anyway, depending on exactly what the device is.
> >
> > I think the most likely reason for an unaligned access
> > in this codepath is "it's actually RAM, either really
> > host RAM or else something memory-like in a BAR", and
> > either way if the guest does a 4-byte unaligned access
> > then doing a 4-byte unaligned access seems better than
> > second-guessing it, even on non-x86.

> Right though remember: whether it's RAM doesn't matter. What matters is
> how we map it.  qemu might fault because it maps NC but guest maps
> cacheable and it's ok.

If QEMU and the guest disagree about the memory attributes
on Arm then we have already lost, because the architecture
says that memory attribute mismatches result in a variety of
undesirable effects including things like loss of cache coherency
(i.e. read and writes via QEMU's NC mapping disagree with ones
via the guest's cacheable mapping because the latter are hitting
in the cache and the former are bypassing it).

> But, all this in theory. At a high level, I personally think going with
> what you propose as a 1st approximation is entirely reasonable, except
> for one thing: we really should not crash qemu, since access can be from
> guest userspace.

You can't prevent faults entirely, though -- if the device
being mapped has e.g. behaviour that says "unaligned accesses
will fault" and then the x86 guest does an unaligned access,
then the device will trigger a fault, and the fault is what
you want because it's what the guest would see on real h/w.
Unfortunately we don't have a convenient way to feed the
fault back to the guest. At some level if you pass through
host hardware you're relying on the guest to not do totally
stupid things.

thanks
-- PMM

