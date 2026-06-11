Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587A7CD98CE
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Jun 2026 15:30:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXhMA-00050t-7z; Thu, 11 Jun 2026 11:30:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wXhM6-0004v6-1e
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 11:30:07 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wXhM3-0004fb-2m
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 11:30:05 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-6604176b575so7550524d50.1
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 08:30:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781191801; cv=none;
 d=google.com; s=arc-20240605;
 b=jCsU7EWdpYh8J9mHAYMhyQWMtpvBsPdc9FvaWXxQ9ZHBznUzkDgqP+SnqBnGaheGxw
 Qi6gUlUz0iYP7UrBSXRGuHtepJ9AaGB9x1tnP5EeYUfPiRa2SDI3QgqTvXOxmQjTNFiI
 JemLG0ntwbA2tRMQWWuGv6jVAyBoiw2jEIMjc3RUfSEw8pGf41VhRFyUjLqkY1hIRbhv
 bBTRMh0Wxto4wNOdY1mR9v8eKXpbi0HWepzimIkNVxXc/sAMcP4GHg3+xxTaRMjr2gK/
 nVj8vmtn76ciNSEPHOldZlpxXFXm7+iNZmU7kaj5OYM1X+xnrqFqf9X4vLrMUTxYTxuu
 kNMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Rz2Edo0wXIo6aoraoZ6DDbrzPnhsO3uUzQxwnu3WNuw=;
 fh=M+355H4y4evP9JGatv6D0lLXR1CT+kkRWGmPCN++Afw=;
 b=CSx1/QQpIOwYP0S2x+opTruC/vJERo6uorv7NqmhT3V/nLEL0RARIi1fRonsvVZwJS
 B+VNuVQkanVH6k/4+aA/KzKmRDdMOeHhRIPANMPazcv9x6utrusSTwcUPuSW/AR9GidP
 AYXHjFSrnPz5pLURrhwwqx2G1KzT0jC4s7t7XJdVR2p+tUADdEBqxtBtjKgI/aWfrbJT
 2V05t/mpkzEC/VSdg+cbjA7XAp3LPaY2wlUZHi3TJjgdhv6cboRgWolLm4VdAka8rLVR
 XM2nKkVCY/8OFM4lCD+pMSMERlRWbIcTdsDugLEZdbZLyx2VELqqEletvooGLzMGmsUL
 6Vtg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781191801; x=1781796601; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Rz2Edo0wXIo6aoraoZ6DDbrzPnhsO3uUzQxwnu3WNuw=;
 b=KGeKTcbjviLcsFAcGzsB2/ZKE7EMlQvDusKAxt5ZEJ1jSEVw4482yRK7T1MnL4OhdR
 /RsgniIo6nZw75JwtBJxwOs//xy9FfMIMex+G1ccn4vLbBDPiWNH7zYjyg46yPseHA1v
 FNT9KjnOeM43YiMT6neUuqdDsmOhdDMPB51rtfKwYj1vFVMwlED/guxczgGBsSfDJ1w+
 f/qCxG+GquaGtCGyvU7Gp1zhYtgQltpROwBLuTDxZLQLifM7Hs0FIl2SUVufAOciSgCp
 xFzy+qzEJR6skjW3gh1OPaIT+gdsOz7V7ivmWDY2fBRfv+HR+WfqqSULJR8mIfm771N+
 DzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781191801; x=1781796601;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rz2Edo0wXIo6aoraoZ6DDbrzPnhsO3uUzQxwnu3WNuw=;
 b=FDGHS5+vW36tvjMkexipIZD+yiFkRzoZJyvQX71Ta8WjvQDekf3k3TdHI5jV3dvj0X
 Sxr7G1ChpaoK2Ccu1kZGfdeM5uKuZ1py2JufdiOvjgPXuPJZjPMcrIq0WyOw7czoQ8jm
 wEdsU1YQ3PHcES0Q+c84E5QivGd5SrRQZ3WOxcD6dmb732SLt1KNVMVtC8Ok13JJCnVV
 GX8p+130cxNr39gUDbtrwcRH4iFTA7Zs/7NMdwmYxXzD1F3zIxzsgYWEGznu+8+tMUYc
 ShWR4oqk1IqtSa41UmFaR4lSpXMD4M5r7jWYI4t0l5/l5XOEqZJKunksTK73qhx5Ep1w
 QxRw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9vYXfbpY9coUNSo1FYAbA+vrhYOo0sSvvEvPvsgJAyig+C7qUBUmYSI4JfoDOeJPwcGMCmvmHPEg==@nongnu.org
X-Gm-Message-State: AOJu0YzyjFHr6F+0wOFuyHzoS7VQAglippoDebd3pdRtSXak9BQ+TdKa
 SW6b5hsf/Zocvw86uCDr8gnFYWT2r115Eihf1Rmisky6sk1L2KMjTS81sI1qsRYDhYT0tlRuPv6
 jBz3yytUvYyX0+D1KPeySIEJBVOg0Nsp0aIzfWuEm7Q==
X-Gm-Gg: Acq92OE6ioV3SlBDhNVfbrjWGf99XJPYSNrImmQqV1Q1/Gg8sPcojK0pQvJT8do+lqr
 Z+Aw9PYjIwxCEDINtsqR9112arW9z14xwFqjJNGiyB6iPVQIDH/QL6W4oN9tMgOruMJKqqi3woj
 JBR4iwHYv7t0ZyhxLrA5RNQLVccfnlrNpzzQyIaLcVtJSkdww8XUAdGBhuPfDm54M08RwF3m6vy
 eMT2X/O3Akwz4XoqZY/74CUA+jwPoDOtqsuK5TXWF1QaP6K883LJlPabGCQ+6ADLcki7WyV6k8W
 2VnnWoKh3XFVvPhnot7RXJdjyWD9ClcvanXmNnrAqYNo59FsMaId82au81eVsw2pa7cDvSwRPhy
 KDw==
X-Received: by 2002:a05:690e:144b:b0:661:4da9:355a with SMTP id
 956f58d0204a3-6626d19d81fmr1927337d50.60.1781191801384; Thu, 11 Jun 2026
 08:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <aimEl9QQ_LTRPLtd@x1.local>
 <20260610121026-mutt-send-email-mst@kernel.org>
 <1e9515c9-7e32-4d95-9b73-aab8bf10bddc@redhat.com>
 <20260611012217-mutt-send-email-mst@kernel.org>
 <3726a607-6cac-41f1-b402-0eed7c4e3fe3@redhat.com>
 <20260611023428-mutt-send-email-mst@kernel.org>
 <0c3f1dba-3b2c-43c5-b181-1426f6da0951@redhat.com>
 <CAFEAcA8Q9qEaZS8wCpZQ-4jpAnQ9JXvnb7iSeRTdhJ9Y3BcCRg@mail.gmail.com>
 <20260611093049-mutt-send-email-mst@kernel.org>
 <CAFEAcA-8Hv0o3PibjH=8jixsHyunH2HkOAMQVqHkGr34b1Ascg@mail.gmail.com>
 <20260611110156-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260611110156-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jun 2026 16:29:49 +0100
X-Gm-Features: AVVi8CfKej72HD9TklflF6X-WzDUqSQjPytTXV87BxMNUPbYa_Z7YXkpeQbrvjY
Message-ID: <CAFEAcA_2oZepwCoPS+cMgdnrSTj=mCGzdFZf5gGRHJK13yqaKQ@mail.gmail.com>
Subject: Re: [PATCH RFCv1] virtio: Inherit max bounce buffer size from bus
 parent if possible
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Gavin Shan <gshan@redhat.com>, Peter Xu <peterx@redhat.com>, 
 Pavel Hrdina <phrdina@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, jugraham@redhat.com, 
 shan.gavin@gmail.com, Alex Williamson <alex@shazbot.org>, 
 David Hildenbrand <david@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 11 Jun 2026 at 16:05, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Jun 11, 2026 at 03:55:12PM +0100, Peter Maydell wrote:
> > On Thu, 11 Jun 2026 at 15:10, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > Yea, and I feel this is the main part:
> > >
> > >     The assumption here is that accesses initiated by the VM are
> > >     driven by a device specific driver, which knows the device
> > >     capabilities.
> > >
> > >
> > > Frankly I don't get why a big hammer of disabling direct access
> > > was taken, when all we apparently need to do is to make sure
> > > small aligned accesses through BAR stay aligned and same size.
> >
> > If you say an MR is OK for direct access then in my view you are
> > saying "any access of any kind is OK", because you're permitting
> > the pointer to be directly returned as a host pointer from
> > address_space_map() (at which point the caller might do anything
> > with that memory). That is not OK for every BAR, only for ones where
> > it's really RAM.
> >
>
> What is "OK"? If the BAR is RAM and I write into it, I will overwrite
> data guest stored there. Is that "OK"?

By "OK" I mean it behaves like RAM: any kind of load or store
will work, at any width and any alignment. That is what makes
it OK to return the pointer from address_space_map(), where
the caller will treat it as any other C host pointer (e.g.
assigning it to a C struct pointer and then writing to fields
in that struct), like virtio does:

        iov[num_sg].iov_base = dma_memory_map(vdev->dma_as, pa, &len,
                                              is_write ?
                                              DMA_DIRECTION_FROM_DEVICE :
                                              DMA_DIRECTION_TO_DEVICE,
                                              MEMTXATTRS_UNSPECIFIED);
        if (!iov[num_sg].iov_base) {
            virtio_error(vdev, "virtio: bogus descriptor or out of resources");
            goto out;
        }
[etc]

This is only safe when the pointer is something we can
handle as if it were a pointer to normal RAM (because the
C compiler makes no promises about only doing correctly
aligned and sized accesses: to it, memory is memory).

> If the BAR is RAM and I write into it, I will overwrite
> data guest stored there. Is that "OK"?

If the guest said "please DMA to this address" then they're
expecting you to overwrite that data, yes.

Merging in your other reply:

>> The
>> problem is that for some PCI devices (like the network card
>> mentioned in 4a2e242bbb30's commit message) the BAR is *not*
>> safe for arbitrary access (because the actual real host hardware
>> inside it is not RAM).
>
> But we don't do arbitrary access. Why would we?

If we mark the MR as "direct access OK", then we do, or might do.
The bug the commit is fixing is exactly that there is a codepath
that uses the latitude that marking the MR as direct access permits.

> There's no such thing as "not safe for direct access" in PCI.
> All operations are memory operations.
> What can be unsafe is accesses of specific width and length.

I think we're talking at cross purposes here. By "safe for
direct access" I mean exactly that arbitrary width and
length and alignment are permitted. This is what
memory_region_supports_direct_access() is testing.
If the PCI BAR can't handle arbitrary widths etc then that
function mustn't return true for its MR.

(Though if we ever get into trying to address_space_map()
a BAR like that something is going to go wrong anyway, because
the "not OK for direct access" path fills and empties the bounce
buffer by calling flatview_read() and address_space_write(),
which aren't going to honour any theoretical alignment requirements.
Perhaps that kind of BAR should just flat out not be one we handle
with a ram_device MR?)

> > (I think there are places where we do need to be more careful about
> > what we do with accesses to real RAM, for where we're emulating a
> > device write to RAM that's updating a data structure shared with the
> > guest, and things like writing multiple times can cause problems.
> > https://lore.kernel.org/qemu-devel/CAFEAcA8dwHV8F48kb-013rxkG9kKcZhym9_qarKmoeUfeh0YWw@mail.gmail.com/
> > is an unrelated example of that, which I haven't done detailed
> > analysis of yet.)

> If it does not work, then QEMU is broken:
>
>
> /*
>  * Any compiler worth its salt will turn these memcpy into native unaligned
>  * operations.  Thus we don't need to play games with packed attributes, or
>  * inline byte-by-byte stores.
>  * Some compilation environments (eg some fortify-source implementations)
>  * may intercept memcpy() in a way that defeats the compiler optimization,
>  * though, so we use __builtin_memcpy() to give ourselves the best chance
>  * of good performance.
>  */

Good point. (Though if I were an optimizing compiler I might
be tempted to optimize a switch() on the length where each
case called memmove with a fixed length argument back into a
single call to memmove...)

I suspect your suggested flatview changes would fix that e1000
bug. But I don't think they're the right thing for this problem.

-- PMM

