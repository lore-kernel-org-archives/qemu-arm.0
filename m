Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA09FCD8C9D
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Jun 2026 21:16:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXmkw-0001jp-1x; Thu, 11 Jun 2026 17:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wXmkr-0001j8-Oe
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 17:16:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wXmkq-0006Zm-9d
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 17:16:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781212557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZslFwwJQpjv4U1ic2gm0DX8XMzpxcXTIrq34lVO3GaE=;
 b=A346wvUBBYnRPVeCqZ9uCW02KB9KgwwF0M33vOEyJXXbuLXdmXTsoyJDjPvsJDRQ6c9Xav
 DlRDFCzaoHQu0D34ixMNdvkjKnTqpJxg+IRcIk5koBL2eLtUS8i6oXvFQLZ16Vs/yRGU2F
 2Fvj2iv48+mPhBnRheD27qb/GpNzo44=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-M1eXxUKuNVOpuUG6HsPF2g-1; Thu, 11 Jun 2026 17:15:56 -0400
X-MC-Unique: M1eXxUKuNVOpuUG6HsPF2g-1
X-Mimecast-MFC-AGG-ID: M1eXxUKuNVOpuUG6HsPF2g_1781212555
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-490ace40f13so905025e9.3
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 14:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781212555; x=1781817355;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZslFwwJQpjv4U1ic2gm0DX8XMzpxcXTIrq34lVO3GaE=;
 b=dTvZWO8WJo+8ekuksBLB/mGMjTqzWhd/2Mdu7P4Cbfowy3YTWGc02Khr8A4ypvJuWo
 Njj569QrrZMpy3NbKzHBr10G3uvu3zevdAyIVMkaAWGlqdfI4EP3iDVlnPD2vgkG/KQ0
 m9Esci48RcKPrIG5f35A6pwlk0BJDym0n+2o25yvDyZzcPNcKPs6zVFSNXpU7NjMdYMM
 Q6UCcCOrH3KAK9KfMyCIn4HKspk53Ad3lUTvysNVcmyNGKhYYr4Gy0xQ8PS98Y5CKYPz
 fv0ufzoIrQjozgq24MpZkd9c6lZkKpE+3tGXd8nhV/JjT7TOnkmaPjHqDi8s8Pe9IY2S
 PqQA==
X-Forwarded-Encrypted: i=1;
 AFNElJ++SkHj6fQ8+pL4L8kMlP7wxj3PrH0O0jNDyqysVoX4fjN2cM/hRxRO/dVQnUFb9thv4Drx0wbDkQ==@nongnu.org
X-Gm-Message-State: AOJu0YzagESJ70xON6wwNO59SY10lLcMKCmUMFTK7R3DZMAxrfpRNhLM
 rKzv8CeIk1gJlVYyNefq3l3QM64phuy6OJKS2CiSOh2F0NZqdGC+bs0ErHGoUnm4qKAbYljuuuk
 RUNmEGpaoeqfle2UVbsVGdPgUWHh64kCMUt/1dQHx3VTe4ujLvoBnDQ==
X-Gm-Gg: Acq92OGl3FwP3u0WTTMeVu5ozdyaEduj0LbgJceiRZZm4UReCdJbFc/pN0vCySp4gTO
 CQCNxJo6L9Xr4qplb7rvxx9etfziFZReSKnWkyrOfkQ+fOiuub6sS77sT620bzSlepZ2QrOFnj+
 4l5AJKdmvp4j8uou/A+SLpYBnBQglg8A2eQQjuOGcFii5Nat1kmg3Tb7SCVHC9tdjqQXreWvsJH
 j1fJ19CNDPr1bqDp0ea7QbyCRsZcnNyZm47yQLQCzDm1S5nKnzenhwdwlYmY/nuu3cW5UJdFOyC
 tqSEnlkYL2zerlZ56zrdIqS0Wi7QjuQwny1Qfo6mlir0VSBJqv+t1GfiKsSAh05mvH4ybnYQExC
 p2O2wDZ3ZbKZRWF4V1Na5jzBFCcoqxQTTX/BdvzAz8KU=
X-Received: by 2002:a05:600c:4691:b0:48f:e249:4094 with SMTP id
 5b1f17b1804b1-490e560b2d5mr61095115e9.18.1781212554876; 
 Thu, 11 Jun 2026 14:15:54 -0700 (PDT)
X-Received: by 2002:a05:600c:4691:b0:48f:e249:4094 with SMTP id
 5b1f17b1804b1-490e560b2d5mr61094765e9.18.1781212554332; 
 Thu, 11 Jun 2026 14:15:54 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2c7ead0sm105147645e9.3.2026.06.11.14.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 14:15:52 -0700 (PDT)
Date: Thu, 11 Jun 2026 17:15:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Gavin Shan <gshan@redhat.com>, Peter Xu <peterx@redhat.com>,
 Pavel Hrdina <phrdina@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, jugraham@redhat.com,
 shan.gavin@gmail.com, Alex Williamson <alex@shazbot.org>,
 David Hildenbrand <david@kernel.org>
Subject: Re: [PATCH RFCv1] virtio: Inherit max bounce buffer size from bus
 parent if possible
Message-ID: <20260611171353-mutt-send-email-mst@kernel.org>
References: <CAFEAcA8Q9qEaZS8wCpZQ-4jpAnQ9JXvnb7iSeRTdhJ9Y3BcCRg@mail.gmail.com>
 <20260611093049-mutt-send-email-mst@kernel.org>
 <CAFEAcA-8Hv0o3PibjH=8jixsHyunH2HkOAMQVqHkGr34b1Ascg@mail.gmail.com>
 <20260611110156-mutt-send-email-mst@kernel.org>
 <CAFEAcA_2oZepwCoPS+cMgdnrSTj=mCGzdFZf5gGRHJK13yqaKQ@mail.gmail.com>
 <20260611114811-mutt-send-email-mst@kernel.org>
 <CAFEAcA9HUGfDgHjvCemPPNkp6FfvQp+4y7qCnw+ROFpG3+ybMw@mail.gmail.com>
 <20260611123952-mutt-send-email-mst@kernel.org>
 <CAFEAcA8vOMd64cCkfCyc1wNbjEY+bnhFPce-V_WbAuXrUnP8cw@mail.gmail.com>
 <20260611130037-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260611130037-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cEmSiC_zHld211yjnvCRAAIZ7DB6ZgFAQRdtR58YNHk_1781212555
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

On Thu, Jun 11, 2026 at 01:02:39PM -0400, Michael S. Tsirkin wrote:
> On Thu, Jun 11, 2026 at 05:53:54PM +0100, Peter Maydell wrote:
> > On Thu, 11 Jun 2026 at 17:42, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Thu, Jun 11, 2026 at 05:16:09PM +0100, Peter Maydell wrote:
> > > > On Thu, 11 Jun 2026 at 16:57, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > Then I'd like to see an example where we have an actual good reason
> > > > > to do execute arbitrary width accesses on device RAM when the
> > > > > driver does not execute them, please.
> > > >
> > > > That's the case we started with, with this GPU where the
> > > > virtio data structures are in this PCI BAR. We want the
> > > > virtio backend to have the freedom to say "I'm just going
> > > > to assume the ring buffer etc is in RAM, and I don't need to
> > > > care about carefully ensuring that I only do word accesses".
> > >
> > > virtio backend does not need to assume anything. any spec
> > > compliant guest guarantees it. any address given to
> > > a virtio device is ram.
> > 
> > OK, but how do we tell if the mmap() PCI BAR we have is RAM
> > or not ? Some of them are, some of them aren't...
> > 
> > -- PMM
> 
> We don't care? If guest asked a virtio device to access
> memory then that memory better support accesses guest
> requested, and on virtio that means any width.

And by the way, current "direct access" code that translates a fixed
width guest access to a variable length memcpy, resulting by byte
accesses - is broken for everything, including RAM, because guests
expect atomicity.


-- 
MST


