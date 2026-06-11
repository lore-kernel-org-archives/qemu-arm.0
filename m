Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107D7CD98CC
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Jun 2026 15:09:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXh2Q-0005v4-PI; Thu, 11 Jun 2026 11:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wXh2P-0005uK-AW
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 11:09:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wXh2N-0006vT-Kf
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 11:09:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781190582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a7W2CargfE8xR1DCZz7K2E1bJJouHNJWNgxaxM3VxVA=;
 b=V0+zm3Ea5j5aTHz94AgIHtVkZIZeau9KSDA4pVJBF4h+prKrX4mKB/UVRrTzCEVnGO9TWJ
 VYs2/AiAwsIhX1LTUUR78+RWJKrdhZmeP5/IOjbClVt9fWaSuQBkIWHfqVe3FENAG9EQiE
 SqGLQ0FmPqJv9Bsk1+NPeeCjIKMdHOE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-rc7GkpvMPYyEVLqZQ3ycCg-1; Thu, 11 Jun 2026 11:09:41 -0400
X-MC-Unique: rc7GkpvMPYyEVLqZQ3ycCg-1
X-Mimecast-MFC-AGG-ID: rc7GkpvMPYyEVLqZQ3ycCg_1781190580
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-bef1e83c990so791980766b.1
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 08:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781190580; x=1781795380;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a7W2CargfE8xR1DCZz7K2E1bJJouHNJWNgxaxM3VxVA=;
 b=YENT7aAvXXgXC2GZKZndCdhD3s3Txp4hq/cWfZztEM2UXo7ZJbqa0f9aVphYgEr2LS
 t7kZPCJYofTywXVh5OnRefBpGUkTEdZQxA+Rz91LiyMHYZ1t/adEn2a/GcOgQ++IoAUR
 fAMVCzsXYUn8C0+vQDi0PDzLUDPJ2iCsSnkhjETZOwyzfuvqk7qe+TF8TfHoKiLsFcZP
 psxH560ofkpCTMfDiO+sD+HnQSyyFexcfwr6SPXKulrJJuaxbAV87xEGGl0LPPcX0tj3
 PBDdmxEURnq3cCiSxhQzFMa6kEjMUSB0hj2Sls1h32VgfI3Sc6bRrwLufvcJuA61YWH0
 YanQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8v5DfYW6S0/NKtqpDMOLggkIPxqSNI5AxrfdNto7prFFQNQXqjHEew3DxPHAlo0ugqOTJxN98ogw==@nongnu.org
X-Gm-Message-State: AOJu0YyNGoIXYaBpZp/O+wk/1ijPEY4UbWo6qT0QPXjsyF5yoqHNzMr4
 FQuXG4kJ1u4ulpDHua5ReB+nrddDv//2It7FRbM+xYsFyjM1FCc/jwWuD+NvUXClcLj7EU1SxVB
 DxfUPAyxhT27jaWQ/nvcatE+4F6k+V4CyhsIp3JvRkViFnALXJTXDjZ+Et/319w==
X-Gm-Gg: Acq92OEj25+UCFPAx4f/lYafsFXoq5cHYJM6IKSJno9jnBab7yjqUK5rBqp1jcpPtCW
 wV9bEwqUIB5yCBoW23Y5kyptGeu4GjpHq0bYuHm92JMuzLSLphXKb2atwugNY3hWGS5GmPsK2Ih
 HSxAwFgvlcp0k/z5Iq/Sa5nI+1slD9HXsEKbaiMcsqmJ+8W6cfPvRdPSejaZi1eYv+Fvs5md0zf
 DQqjhY8Pa+rezSLgOGWcCSfrs+LtU4iXmYHzTc1TmBmDVXBLr9OgLhBsFOJzIHwieM74b1UnUF4
 oxCNAyN/VvINLAyC6OuM8R7t4ZrK3HU4Nyz6pCA/QeR8FQ0Zz13emJB4WZXr3MfHgZD1ISEG976
 DlYqZBsxnqaB2CUho95q0YhkbMo8jXDJQtgBQ2HSBpxsZ7XnuB6bAjg==
X-Received: by 2002:a17:907:78a:b0:bee:215e:5480 with SMTP id
 a640c23a62f3a-bfc84a05ccdmr168811766b.9.1781190579708; 
 Thu, 11 Jun 2026 08:09:39 -0700 (PDT)
X-Received: by 2002:a17:907:78a:b0:bee:215e:5480 with SMTP id
 a640c23a62f3a-bfc84a05ccdmr168808266b.9.1781190579106; 
 Thu, 11 Jun 2026 08:09:39 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bfcb0f14759sm80876966b.6.2026.06.11.08.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 08:09:38 -0700 (PDT)
Date: Thu, 11 Jun 2026 11:09:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Gavin Shan <gshan@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, jugraham@redhat.com,
 shan.gavin@gmail.com, qemu-block@nongnu.org
Subject: Re: [PATCH RFCv1] virtio: Inherit max bounce buffer size from bus
 parent if possible
Message-ID: <20260611110543-mutt-send-email-mst@kernel.org>
References: <20260608001821.850921-1-gshan@redhat.com>
 <20260610041036-mutt-send-email-mst@kernel.org>
 <20260610183046.GB121666@fedora>
 <20260610165710-mutt-send-email-mst@kernel.org>
 <20260611142022.GA202155@fedora>
 <20260611103513-mutt-send-email-mst@kernel.org>
 <CAFEAcA8RAsmrAArKz0X7NU6sCnKTC-e413TgwLp1gt2vJGLgPw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8RAsmrAArKz0X7NU6sCnKTC-e413TgwLp1gt2vJGLgPw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WPH7YHCC2WZuiqAS4bxjYSqs1HXWVVqMtpjKArECpYg_1781190580
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

On Thu, Jun 11, 2026 at 04:04:20PM +0100, Peter Maydell wrote:
> On Thu, 11 Jun 2026 at 15:46, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Thu, Jun 11, 2026 at 10:20:22AM -0400, Stefan Hajnoczi wrote:
> > > Gavin posted the lspci output:
> > >
> > >   Region 0: Memory at 661ffd000000 (64-bit, prefetchable) [size=16M]
> > >   Region 2: Memory at 662000000000 (64-bit, prefetchable) [size=128G]
> > >   Region 4: Memory at 661ffe000000 (64-bit, prefetchable) [size=32M]
> > >
> > > These are prefetchable memory BARs, so I would expect them to be
> > > mmappable. Why does QEMU have no way of knowing upfront whether they can
> > > be mmapped?
> >
> >
> > They can be mmapped.  The issue is just that after mmap flatview uses
> > memcpy/memmove on them, and that might not match what guest driver is
> > expecting specifically for 1/2/4/8 byte accesses.
> 
> Huh? The guest driver has nothing to do with it, surely.

My answer is I don't know.

But the commit that introduced the regression says:

	 The assumption here is that accesses initiated by the VM are
	    driven by a device specific driver, which knows the device
	    capabilities. 

> The
> problem is that for some PCI devices (like the network card
> mentioned in 4a2e242bbb30's commit message) the BAR is *not*
> safe for arbitrary access (because the actual real host hardware
> inside it is not RAM).

But we don't do arbitrary access. Why would we?

> That commit disabled direct access
> for all vfio MRs, which is safe but overcautious. Would
> "direct access is OK if this is a prefetchable memory BAR" be OK?
> Or do some prefetchable memory BARs still have restrictions
> beyond those of real RAM?
> 
> > Removing mmap is one solution, this is what vfio does now.
> > Fixing flatview is another.
> 
> No, you can't fix this in flatview. If a BAR is not safe for
> direct access then it is not safe for direct access.
> 
> -- PMM

There's no such thing as "not safe for direct access" in PCI.
All operations are memory operations.
What can be unsafe is accesses of specific width and length.

So we should not use variable length memcpy/memmove which
do that. Fixes length memcpy/memmove exactly mimic what
guest does, so they are safe.

-- 
MST


