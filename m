Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939E3CD98C7
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Jun 2026 17:03:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXino-0004kB-GT; Thu, 11 Jun 2026 13:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wXinl-0004jN-Vo
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 13:02:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wXink-0002Jh-A8
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 13:02:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781197362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VAAK/oJCvYGOuk4pT/pqWPhKdpt/6wdkEIqS/6g4LEI=;
 b=bx4k/X5j7dxsLDxJCZIK3sNYg+w1ggx4wUA2TN3gWs0raDcBbsOqSnChuxb6DZzi0P5Ova
 dz0LyEHmzDrmA6KB+GmOEBJ9SpLN5h0P+3uIjiPsgm3S5lXLzCAWEf//OECZJ9GMcTDHPj
 C9BBNsPghR2n16xTsF10qzKov+v63q8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-OUC7YDDwN32OG2YFNHR_sA-1; Thu, 11 Jun 2026 13:02:40 -0400
X-MC-Unique: OUC7YDDwN32OG2YFNHR_sA-1
X-Mimecast-MFC-AGG-ID: OUC7YDDwN32OG2YFNHR_sA_1781197360
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-490bfd70b0fso344565e9.0
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 10:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781197359; x=1781802159;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VAAK/oJCvYGOuk4pT/pqWPhKdpt/6wdkEIqS/6g4LEI=;
 b=NUAq03RckaTNEMmHLkMsAXyQdMsXTTImqROBDq+I5sSwKDwy9Hca8eOVx+9gwpy8M1
 oZEs4vZ72xM0BR6I9VIlDnRaMUdmMQaltQ7zvR3Eebu6gprd8sebrGCMfr/7Z0Ib/Dco
 wRbd8VO5Cj4OaIG4PslN6qgFT621TPYp7ej/ZRlIN0Jg+xB0UJO+6LfTOtkyUa+XanQl
 CFOn3Zqkp2dTTrxZaBU1ZU0ymyFNm51RnopH6JxpozZJtICvtRDjREhQfChFY4jL3Vjz
 W3tTF4g1Fw+peLYFUbsaZyT6+LzCUF60XXrK9XhgwrI/91+tUDgFg63PHI8TF0QQe8GT
 MhKw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9MUKYkUPIzFEO1y5ccA4My1tY1j3QujHAW1zqOP7MhEM+Ab5RLrL/S8VA/M/+4Pf8uuKmxJ8iC2g==@nongnu.org
X-Gm-Message-State: AOJu0Yxjhdw5GaF4G9+W5XDdSKFMyQirE3SRaaDJFAFRdPPrtwx/Hd/x
 fbTI2kiXgKTtvaYavDnPpQ2kAAIOOzpL7ZK+VhD/MYcZi1TFUrPHidOGNi1FsNQWLMdArYKJJ7T
 dXrED3l/dNgaquPxBU4A0XqVFWFRMp1sYzl1vehKO5zZpWJ1XF4KXKw==
X-Gm-Gg: Acq92OF9PwvxRgtWDvps112A9Evpm8qLUGlUBZIWr1bMBSYk9XLKuyi7WhtckhVt5cO
 0ItWdlzbVMfSmSOLGuyIG75ieyYsFre4QkxtZ4dqVNSHFh69yXD7JpAy1XNq+elLOlr4MxDRmV7
 fjlFVw/QSB2AZknuz+6gfuIgEJLuI7OiIsYvrbUalTjSF8G6e0BKc+IlE9DB7SxDm224/YlRZdR
 rcApczYoY/v/IbxOkWClfnrBOI96AHkSHCT1fbFZhm69BO3jnFFPUrYBSFfkyEzmeJC8wT9i6WK
 k5MO4tpzWND6HnRmErF3QyFGJlSZOX9OzkEEJrvuMy365Gbcc2QE98usxfTYCnHcS0/a8vO2gjQ
 bS8Ue3z5BYHcYcdMyoKXvHJU0fHP7oNI0e0CIzWGrExY=
X-Received: by 2002:a05:600c:15c3:b0:490:bccf:2bd6 with SMTP id
 5b1f17b1804b1-490e5613dccmr34993215e9.15.1781197359414; 
 Thu, 11 Jun 2026 10:02:39 -0700 (PDT)
X-Received: by 2002:a05:600c:15c3:b0:490:bccf:2bd6 with SMTP id
 5b1f17b1804b1-490e5613dccmr34992685e9.15.1781197358628; 
 Thu, 11 Jun 2026 10:02:38 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2cf5542sm76318205e9.11.2026.06.11.10.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 10:02:37 -0700 (PDT)
Date: Thu, 11 Jun 2026 13:02:34 -0400
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
Message-ID: <20260611130037-mutt-send-email-mst@kernel.org>
References: <0c3f1dba-3b2c-43c5-b181-1426f6da0951@redhat.com>
 <CAFEAcA8Q9qEaZS8wCpZQ-4jpAnQ9JXvnb7iSeRTdhJ9Y3BcCRg@mail.gmail.com>
 <20260611093049-mutt-send-email-mst@kernel.org>
 <CAFEAcA-8Hv0o3PibjH=8jixsHyunH2HkOAMQVqHkGr34b1Ascg@mail.gmail.com>
 <20260611110156-mutt-send-email-mst@kernel.org>
 <CAFEAcA_2oZepwCoPS+cMgdnrSTj=mCGzdFZf5gGRHJK13yqaKQ@mail.gmail.com>
 <20260611114811-mutt-send-email-mst@kernel.org>
 <CAFEAcA9HUGfDgHjvCemPPNkp6FfvQp+4y7qCnw+ROFpG3+ybMw@mail.gmail.com>
 <20260611123952-mutt-send-email-mst@kernel.org>
 <CAFEAcA8vOMd64cCkfCyc1wNbjEY+bnhFPce-V_WbAuXrUnP8cw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8vOMd64cCkfCyc1wNbjEY+bnhFPce-V_WbAuXrUnP8cw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i1O0442O6qj5pvbwU7nblcMv7FshEZ3bXyrOpvI4tUk_1781197360
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

On Thu, Jun 11, 2026 at 05:53:54PM +0100, Peter Maydell wrote:
> On Thu, 11 Jun 2026 at 17:42, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Thu, Jun 11, 2026 at 05:16:09PM +0100, Peter Maydell wrote:
> > > On Thu, 11 Jun 2026 at 16:57, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > Then I'd like to see an example where we have an actual good reason
> > > > to do execute arbitrary width accesses on device RAM when the
> > > > driver does not execute them, please.
> > >
> > > That's the case we started with, with this GPU where the
> > > virtio data structures are in this PCI BAR. We want the
> > > virtio backend to have the freedom to say "I'm just going
> > > to assume the ring buffer etc is in RAM, and I don't need to
> > > care about carefully ensuring that I only do word accesses".
> >
> > virtio backend does not need to assume anything. any spec
> > compliant guest guarantees it. any address given to
> > a virtio device is ram.
> 
> OK, but how do we tell if the mmap() PCI BAR we have is RAM
> or not ? Some of them are, some of them aren't...
> 
> -- PMM

We don't care? If guest asked a virtio device to access
memory then that memory better support accesses guest
requested, and on virtio that means any width.

-- 
MST


