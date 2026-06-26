Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959EFCDE008
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 10:49:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd475-0007Nd-Vl; Fri, 26 Jun 2026 06:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wd474-0007NI-8p
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 06:48:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wd472-00051p-EA
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 06:48:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782470923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jrtv81fI8wG8TzTXqKP35kO2D31cwxF8KMzUINDx43U=;
 b=Ki/euPOvzRMr2ekYzXI9yGiLtT9kkOY11112Odz2XG+zOLxwJdHnwPk2EeQPtYnqRWNJNP
 +I0XOf8Gc6ve8ZRY/iO+BJZNr1zjAQDMHvGokPXhDpQzMozVcb0VlDz2eVEHlOz4A2SB+v
 NXMylPm4KVBdgfDZdFz/xrcocS6Ra0c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-2vvLxlEkMOqYys2WcKiirw-1; Fri, 26 Jun 2026 06:48:41 -0400
X-MC-Unique: 2vvLxlEkMOqYys2WcKiirw-1
X-Mimecast-MFC-AGG-ID: 2vvLxlEkMOqYys2WcKiirw_1782470921
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-46cffa7200bso518755f8f.1
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 03:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782470920; x=1783075720;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jrtv81fI8wG8TzTXqKP35kO2D31cwxF8KMzUINDx43U=;
 b=MeTm3UOP4sGo9F63y9f5mQrIT/uPeJ4dpuLAIkv+KDdxlrArjd8Hb9t/e/LOYlV3wY
 0uTwdTlDws6CnYqszztJHgFNQgWgUiYDE6vbKK+hc0yteYCB1H4ArPE+vX/BsAhr3nHM
 WpJVERmXO+7wihFs9bsJHKxgVjYN9jfZHNmgJjbUJDFIleLOPTUr2IgWxwXvEEvXPeEe
 dSxpOEN3yxHS/JOClYo/W1csGiTnRCWU/kDKzhpc1OkZ3Bc5o7QSbiX9G0GaTOzQ7REa
 i4Qd9OxvF5KrkRYKrIeEaZz1xLp1cSl2fTP145yB5crCwiQLsp1jaKj3HHH3pEHAiHDP
 g7Dg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr1z1g9/sIwRKecCXFtDJG7y5xNCswrtpBTPC7rLYsh0wRbKvAK0Ta/aDOEoYxKnY6iMvcvbWztMQ==@nongnu.org
X-Gm-Message-State: AOJu0YzajOjuaqowAZs1kGLLE1BNJUruB5umq89tDzp9mlFjCproPQdu
 d4TFx6JphvgEKT9CIbBwokQzD7AeCzizVDyAa9aIdEehm144Sj7Os+/J9jiNARudWOqQNeEH8+T
 zS+129rqA0BQcxTjvAjQmr4ydUXVwOudDqA4wj/1XdcJTWXOLNzw4HQ==
X-Gm-Gg: AfdE7cmDQCi6od3KHjlIAbLRuDoT09gxGkiS1MABjME0cK4YRjDOQl1nruQmfqfwaCl
 081dyDilIQLugLXwlsNvPug7dLZh359TY2hY5T6xLm72H57MxOC23d5xSjCimVX6/uVsXH47Wh8
 RZ87e1CDN1QlBAJXt1DWBIRqp56P3Ee3HxnsddXjbrXv4T8unvwZqWZGT//EUIJ9jwBmtCtIpoG
 jNmS2vo7YfpofD2NEbk/mHJI64rnCXEK+x4RsjIleuctAAcSUYluP8Fz4vLPTIuP0tMUV/lD4r3
 qn4xirYO7XtNjUncPK5i4Vtk2nj3lXfo/QqpLv68tfzkKULyKfPa8PaT3wG/9w/oJXXpm9jNlXP
 /BDw0cmqYk7qHk5mg8VA7O+udREkhjxtLdR8bRWvsJw==
X-Received: by 2002:a05:6000:2887:b0:463:1d06:ab33 with SMTP id
 ffacd0b85a97d-46a80f5c6edmr27976453f8f.27.1782470920407; 
 Fri, 26 Jun 2026 03:48:40 -0700 (PDT)
X-Received: by 2002:a05:6000:2887:b0:463:1d06:ab33 with SMTP id
 ffacd0b85a97d-46a80f5c6edmr27976397f8f.27.1782470919834; 
 Fri, 26 Jun 2026 03:48:39 -0700 (PDT)
Received: from redhat.com (bzq-79-177-145-168.red.bezeqint.net.
 [79.177.145.168]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46caa798f43sm21428732f8f.8.2026.06.26.03.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 03:48:39 -0700 (PDT)
Date: Fri, 26 Jun 2026 06:48:35 -0400
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
Message-ID: <20260626063730-mutt-send-email-mst@kernel.org>
References: <20260616052552.389021-2-gshan@redhat.com>
 <CAFEAcA-mf14=jpRFHarAbN6AbQwvW=Yu6WB1JiNMsECEdaxD3A@mail.gmail.com>
 <20260625070551-mutt-send-email-mst@kernel.org>
 <CAFEAcA8YJZq9TqrUd0zTnewAdVDm5y6UV7BJQZ0C60TZ=RT98Q@mail.gmail.com>
 <20260625091334-mutt-send-email-mst@kernel.org>
 <CAFEAcA8xK+t3-prEphtkq-o9UY2mgS6cowhs880GOaxL9dKSGw@mail.gmail.com>
 <20260625101817-mutt-send-email-mst@kernel.org>
 <CAFEAcA8-Un+Q1yBDqLWCLPRwtgTA_VhJqGobgZChrFhAeVfG8A@mail.gmail.com>
 <20260625123119-mutt-send-email-mst@kernel.org>
 <CAFEAcA8UjtXgmPC27fOKMwbaWs2piwGYudtwCNWQHuu3E_7A-A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8UjtXgmPC27fOKMwbaWs2piwGYudtwCNWQHuu3E_7A-A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p8D2SaI873jhfJm98KzOjzgm5RrDZGJrsezA7aoXJLU_1782470921
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Thu, Jun 25, 2026 at 07:40:29PM +0100, Peter Maydell wrote:
> On Thu, 25 Jun 2026 at 17:47, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Thu, Jun 25, 2026 at 04:23:47PM +0100, Peter Maydell wrote:
> > > On Thu, 25 Jun 2026 at 15:52, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > I think there is exactly 1 kinda reasonable case. A 2 byte read/write at
> > > > offset 0x1 within a dword. This maps nicely to even classical PCI byte
> > > > enable mechanism and so yes it works if your CPU can initiate these
> > > > things, and it's atomic.
> > > >
> > > > I tried reading LEDCTL on e1000e:
> > > >
> > > >        byte  @ 0xe00: 0x64
> > > >        byte  @ 0xe01: 0x2a
> > > >        byte  @ 0xe02: 0x00
> > > >        byte  @ 0xe03: 0x00
> > > >        word  @ 0xe00: 0x2a64
> > > >        word  @ 0xe01: 0x002a
> > > >
> > > > Works fine.
> > >
> > > The e1000e datasheet actually documents what it does in this
> > > case (slightly surprising, since hardware engineers love to
> > > leave this kind of corner case undocumented):
> > >
> > > # For registers that should be accessed as 32-bit double words,
> > > # partial writes (less than a 32-bit double word) does not take
> > > # effect (such as, the write is ignored).
> > > # Partial reads
> > > # return all 32 bits of data regardless of the byte enables.
> > > #
> > > # Note: Partial reads to clear-by-read registers (such as, ICR)
> > > # can have unexpected results since all 32 bits are actually read
> > > # regardless of the byte enables. Partial reads should not be done.
> > >
> > > So for this specific device that access is out-of-spec.
> >
> > You mean that access to clear by read should not be done, right?
> 
> The datasheet is ambiguous about whether "Partial reads should
> not be done" is meant to apply generally or only to clear-by-read
> registers.


I mean it's in a note about clear-by-read registers. Seems unambigous.


> > > I guess what I'm wondering is: can we just have code
> > > that does an aligned exact-width access in the 1/2/4/8
> > > byte aligned case, and the host's best approximation to
> > > an unaligned exact-width access for the 2/4/8 byte
> > > unaligned case?
> >
> > That's my idea, too.
> >
> > > (so on sparc you get multiple smaller
> > > accesses, and on most archs including x86 and arm you
> > > get an unaligned load).
> >
> > I thought unaligned load from uncacheable on arm is
> > also a fault?
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

Right. Sorry I was unclear. I was referring to pgprot_noncached in Linux.



> > > That would mean the guest could
> > > potentially provoke a fault on the load/store on an
> > > access to a passthrough device, but if you give the
> > > guest passthrough access it can very likely provoke
> > > a fault anyway, depending on exactly what the device is.
> > >
> > > I think the most likely reason for an unaligned access
> > > in this codepath is "it's actually RAM, either really
> > > host RAM or else something memory-like in a BAR", and
> > > either way if the guest does a 4-byte unaligned access
> > > then doing a 4-byte unaligned access seems better than
> > > second-guessing it, even on non-x86.
> 
> > Right though remember: whether it's RAM doesn't matter. What matters is
> > how we map it.  qemu might fault because it maps NC but guest maps
> > cacheable and it's ok.
> 
> If QEMU and the guest disagree about the memory attributes
> on Arm then we have already lost, because the architecture
> says that memory attribute mismatches result in a variety of
> undesirable effects including things like loss of cache coherency
> (i.e. read and writes via QEMU's NC mapping disagree with ones
> via the guest's cacheable mapping because the latter are hitting
> in the cache and the former are bypassing it).

But we don't know how guest mapped it, at least without
VFIO's help. I guess DMA into device BAR is just often broken
on ARM except if guest happens to use same attributes as
set up by vfio.


> > But, all this in theory. At a high level, I personally think going with
> > what you propose as a 1st approximation is entirely reasonable, except
> > for one thing: we really should not crash qemu, since access can be from
> > guest userspace.
> 
> You can't prevent faults entirely, though -- if the device
> being mapped has e.g. behaviour that says "unaligned accesses
> will fault" and then the x86 guest does an unaligned access,
> then the device will trigger a fault,

I don't get this part. How can a device "trigger a fault" on the x86 CPU?
But on non x86 in theory yes software could want the fault.
Hopefully it does not.

> and the fault is what
> you want because it's what the guest would see on real h/w.
> Unfortunately we don't have a convenient way to feed the
> fault back to the guest.

I didn't check but I mean we could add it to kvm I am guessing, if we
want. A lot of work so I would maybe wait for an actual issue before
spending engineering time on this.

> At some level if you pass through
> host hardware you're relying on the guest to not do totally
> stupid things.

Indeed.

> thanks
> -- PMM


