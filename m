Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EBBC4453C
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Jul 2026 16:42:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wma1C-0000zz-7X; Wed, 22 Jul 2026 12:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wma17-0000zV-FY
 for qemu-arm@nongnu.org; Wed, 22 Jul 2026 12:41:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wma14-0006DV-J6
 for qemu-arm@nongnu.org; Wed, 22 Jul 2026 12:41:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1784738512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9SYF1DYLmogVx0/xZqaYFIXFrUmPqPQL+ZYYRwh1E5A=;
 b=R1TfRhfnChlSHj3Fd+bqfrtXxwt1MfIu1xWnCAaWkxSe1dDKxvYlPuy+9YpmAelthoX6bZ
 qwTmZjTPOvGJQ1NVxIJVJY1Kw51N3ePzHBPq78WO25TfL1ByK5uWflL0zOy16B+UxfXOEN
 voKc5dDGIGVr2mpVFvWxH3SpBVm68c4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-ZpYoQ4RmPq22-YCv3YR6EQ-1; Wed, 22 Jul 2026 12:41:48 -0400
X-MC-Unique: ZpYoQ4RmPq22-YCv3YR6EQ-1
X-Mimecast-MFC-AGG-ID: ZpYoQ4RmPq22-YCv3YR6EQ_1784738508
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-52827090cc5so15434981cf.0
 for <qemu-arm@nongnu.org>; Wed, 22 Jul 2026 09:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784738508; x=1785343308;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9SYF1DYLmogVx0/xZqaYFIXFrUmPqPQL+ZYYRwh1E5A=;
 b=oeqp8/ZOuR4A+a1TTBHGa5tuctrkcqpMie2crvwJJkB9xQ+k+8SQ5/00MnYh8A19ds
 xJAX0VwSkWAstZaB/ZGhQYc7Ae7vqh61IcMvO8+Nn4fEQnwr9QTcob+wsxCqsDi/bu74
 UuBWgToPDXsd2Zoj9hNKnV8ChT99/eOCOgUmLYTXLMPVC69fHzfoCMit5UoPJ8/rzQMg
 NealayxgfPZZZYkYHA49RmHbm9LCcreTulbTWDGuMEDDomrW9RAEClU4aFQ5fwJXp35n
 BKNbEfxK1oGjs9H8t8ASjvksuZC1FJamI4DTtmVgU4sh/ucbxbtAmW6+ulC6CqorjC24
 vJVA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpJBs89uTZGmytBIshbnWwOX1xRRWkyI5Z2BXmiVTEH5vnNKEICx9G/Y0wLJxWC8VRVzcdTLd/A1Q==@nongnu.org
X-Gm-Message-State: AOJu0YzprtMV2TvQWSlR/Ut0NdWlXLQygXfgX/RYuuGCtO9xgltJCq3c
 lD7246TYc6dCA/FP7M0gBV07cVSLEJiaBwwMS1sz7tuLj0AXTE/AG3YEtwWgXCzR4LaadCphSD1
 W6113ezET1WuJLLR3QrL1Od31sXm8mIAdbEqcsrUPRPb3O9IvK+C5jw==
X-Gm-Gg: AR+sD11zGS1p8M03lZYGglHGDBPwaeesP479W1P10s+5mzu2CMVi8scbCH88zIjt7f5
 iqQXLJMNmFSRQgt0Hujbkhy2qRHG/b0NyxmlBIVe+Hxy4nbQSuvGC790FzRLtKGyQAeVLa3CItk
 RW7lFpR2AX66QXLZxfhmsVRHw1pR9L5VY8lhDwLWYCIXn0blltbUu0LcUgYSoIfR6FQDMMel9P4
 kyGa/86igVm81X+PargaqN0MjTcxQYBbnP4i4Joy2z2hx890tivDE0mg156wXOv2g4mCJ8MOYJJ
 3/nO3P1u1eTSbEzmscBO+KFkRn3/hGIglqctwqKP0yBU2cHWFj8y6fnFobGlQ1uFQJ49
X-Received: by 2002:a05:622a:5814:b0:51c:7aa7:e0e9 with SMTP id
 d75a77b69052e-52838901dadmr14281181cf.38.1784738507704; 
 Wed, 22 Jul 2026 09:41:47 -0700 (PDT)
X-Received: by 2002:a05:622a:5814:b0:51c:7aa7:e0e9 with SMTP id
 d75a77b69052e-52838901dadmr14280721cf.38.1784738507144; 
 Wed, 22 Jul 2026 09:41:47 -0700 (PDT)
Received: from x1.local ([174.91.117.74]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-527d1224695sm18839241cf.13.2026.07.22.09.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2026 09:41:46 -0700 (PDT)
Date: Wed, 22 Jul 2026 12:41:34 -0400
From: Peter Xu <peterx@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Gavin Shan <gshan@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, alex@shazbot.org,
 richard.henderson@linaro.org, berrange@redhat.com, philmd@mailo.com,
 david@kernel.org, clg@redhat.com, pbonzini@redhat.com,
 phrdina@redhat.com, jugraham@redhat.com,
 liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn,
 shan.gavin@gmail.com, qemu-s390x <qemu-s390x@nongnu.org>
Subject: Re: [PATCH v3 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
Message-ID: <amDyvgR09OJssENX@x1.local>
References: <5faf04b9-d596-4a1d-9fe3-5e9ad5f0a99a@redhat.com>
 <73f79841-8cc7-4ca6-8f6b-fb97b53a6fe8@redhat.com>
 <20260717091756-mutt-send-email-mst@kernel.org>
 <CAFEAcA-O6Z4JrVV0DL_tta6khRyUta_Zz5mJt6OszaW1mu0o6Q@mail.gmail.com>
 <20260717095407-mutt-send-email-mst@kernel.org>
 <9c2ad22a-e768-4a07-85a2-01ce1fc14368@oss.qualcomm.com>
 <59882c5b-545d-4768-8bf4-723fed97a801@redhat.com>
 <al-eCtxGjG4HHEbl@x1.local>
 <6210e178-a93f-4411-810a-41edb1fb656e@redhat.com>
 <20260722015422-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260722015422-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: df7KN317JX6m3rGS6c_FP6C5qC9XwWQ9XQJOy5ZmwK8_1784738508
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: permerror client-ip=170.10.129.124;
 envelope-from=peterx@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Wed, Jul 22, 2026 at 01:58:18AM -0400, Michael S. Tsirkin wrote:
> On Wed, Jul 22, 2026 at 10:53:27AM +1000, Gavin Shan wrote:
> > On 7/22/26 2:27 AM, Peter Xu wrote:
> > > On Tue, Jul 21, 2026 at 03:37:53PM +1000, Gavin Shan wrote:
> > > > If Peter is fine with two variants for x86 and non-x86 architectures.
> > > > I can post (v4) for further review. That will be something like below
> > > > and let me know if there are any other improvements are needed.
> > > 
> > > I have a generic question on the "unaligned access for x86": I think the
> > > question is about the one Michael raised here on unaligned access may break
> > > x86 here:
> > > 
> > >    https://lore.kernel.org/qemu-devel/20260617022330-mutt-send-email-mst@kernel.org/
> > > 
> > >    3. (theoretical concern) also on x86, unaligned accesses are
> > >    possible on guest and host, so converting an unaligned access to a
> > >    series of aligned ones can in theory break devices.
> > > 
> > > Is that a real problem we need to consider, or can we start with unified
> > > approach and leave it for later?
> > > 
> > 
> > I'm leaving this question to Michael.
> 
> Knowing what I know about hardware designers, it's something someone
> somewhere does)
> It can be made a separate patch, just to show - it should be all of
> ~10LOC.

It's only about removal of anything that might be controversial for now,
thanks.  I also wonder if anything would break, then it's more solid proof
that per-arch change is required.

> 
> > > PS: I apologize if I missed important piece of info along the way; I didn't
> > > follow closely on the discussion on this topic in the past few weeks.
> > > 
> > > One thing to mention is, what we change should only need to affect
> > > ram_device, AFAIU.. so most memcpy()/memmove() shouldn't be changed for any
> > > arch when it's pure RAM.
> > > 
> > 
> > It depends. This patch intends to fix issue [1] in the lower layer by using
> > the newly added accessors (qemu_ram_{copy, move}) on all directly accessible
> > regions including the regular (pure) RAM region. Otherwise, the newly added
> > accessors should be limited to ram_device regions only as you said.
> > 
> > [1] https://lore.kernel.org/qemu-devel/20260527091711.3901-1-liugang24219@sangfor.com.cn/
> > 
> > Thanks,
> > Gavin
> 
> using memcpy()/memmove() to emulate guest's atomics is generally
> kinda broken.
> but yes there are architectures where doing it to device ram is
> more broken than doing it to regular ram.

If we keep memcpy()/memmove() for len>8 (aligned or not), I am thinking no
perf issue will happen, then looks like we can indeed change this even for
pure RAM operations, which we can't identify in case of e1000e driver use
case.

Then does it mean we should not use __builtin_memcpy()/memmove()?  Even if
we know constants 1/2/4/8 would work there, why not we go ahead and use
qatomics, which is even more future proof?  I also stumbled on top of
commit 77b1757090 ("include/qemu/bswap.h: Use __builtin_memcpy() in
accessor functions"), which seems to say the same thing "for the long
term".

For "should we still do unaligned access if the guest did it, so as to keep
the original behavior of a bare metal" question, are we on the same page
that we should just break it into aligned accesses for all archs?  I think
it means, we will not be able to emulate guest faults correctly as what
will happen on bare metal, but we're missing the fault injection logics
anyway, so whenever it's implemented we _could_ switch it back to unaligned
accesses.  Before that, breaking unaligned seems like a better way to go to
(1) satisfy all legit users, and (2) don't make QEMU crash by guest
operations.

Last, one silly question: why do we need any helper named with *memcpy*, if
memmove is always superior (to consider range overlap)?  Can we stick with
memmove all over the places?

Thanks,

-- 
Peter Xu


