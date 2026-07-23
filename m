Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C44EC4453E
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Jul 2026 06:04:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmmXu-0006Bq-DB; Thu, 23 Jul 2026 02:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wmmXs-0006B8-Lb
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 02:04:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wmmXq-0005gj-7p
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 02:04:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1784786672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=niyOg9VzPAiSo40vNvHu9tZil6B9O1QeQyKulBHn0B8=;
 b=Q7wXgyAC54OVmaTftbd+JfHJ8pUwswU0M2XbDZMVpHncjQguCElWafsptMUSA+N8zK8qQW
 pVSqw2qHjQVTr38yLaP+zhY5rEyJ0vAM6xGUHGhYoKONjb9wxM40HfU1Xyg3ZTX58LJYqv
 Agf6/1gl9Q1+cdP8BGIRUcMmc76gfIQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-VO3-X0JLOzqAled8-aRWkQ-1; Thu, 23 Jul 2026 02:04:31 -0400
X-MC-Unique: VO3-X0JLOzqAled8-aRWkQ-1
X-Mimecast-MFC-AGG-ID: VO3-X0JLOzqAled8-aRWkQ_1784786670
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-47f5a972b0eso222750f8f.2
 for <qemu-arm@nongnu.org>; Wed, 22 Jul 2026 23:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784786670; x=1785391470;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=niyOg9VzPAiSo40vNvHu9tZil6B9O1QeQyKulBHn0B8=;
 b=QrhzwVCRmLnYgQ6smzhyUu2Q5AQfxEBVNeW2fuXpVjJgcoEgKPzFwDSZMQyIyZq0DW
 XDSM/md/ttcsmuI/SdElJ6bSSMnh7WhKR9n67lMB2eag/AU7SV/ehjOugiaoR79AIbGt
 N80ewOcBoEi2SrVZS1x6Dlin/q0h2dQRR3Xn7VqVaBkv7qFNap8lnbe23OkP/79aqnhC
 ZhRbiMPodiPMLTxnzDpat7qFep9tbj8FLwXZWcqkyoSldS3v0sOlRTyEZF71A2LRmfyN
 YvszktLLD8YcGfGbiy9aXcV3sJg/ZzH1hWE5DBxnxi8pyfzLViBJ810y7BSldefxUGh0
 lAww==
X-Forwarded-Encrypted: i=1;
 AHgh+RpzHvOJ6XlggaTExY9DuCGPvLlIwBUObZcJzpfRPmWJfTyES49R52Luyxkrr/1UmY9m6D8dKVYLAA==@nongnu.org
X-Gm-Message-State: AOJu0Yxn/zFfpsryoqMB+E99xdrnjszHH2S1kp9/3H4MU71XGKnsq9CO
 qk2qIlGc3HmURcw4ri08yEb2sockY3KGMwpEhLNP/jUPKiKTqWdAXUNm3ZqyF7fZ+swXHUXn5FY
 TQ+yADR6Slw6uLd1NjHVoRI3ieV62UTtuo3cUE0bkuCBqhWcpTsIe0A==
X-Gm-Gg: AR+sD12gSX4reg+A5v3sKT53tpLA+4Sypw3fD07PLFw6dTlOr7z0SSuMUnqHuuN1TdJ
 pVw79RDfNvU3OvriDVBs3LA+FXRi0SxjRBSoxd4OFo4kyrs7Js6CbNP4XxnrmrFij2fbkJtU58V
 rwbNxVqU1KmoZw6ngT2FJeZ2s75G50P1AJek4w/9msy/EfDTLNd6hYGIFAHI701OSrDLCQK5iR4
 2c+33goJWnI/6NoLisChp3+QEg7C+VytIWorVk5OI+rqlu6IeKm2aT46E4rQGr5NIAby6rZAhcx
 iq17uwYmEQUMgAjXnuqewXDRxi/5Peij3z/t8q0SCZYH8qOPTHy+bcNVbk8KR8Qo9Palf1U2zmb
 bciWN6vfL579Ir4SSX0oc2A==
X-Received: by 2002:a5d:5f07:0:b0:47f:6f9e:1e82 with SMTP id
 ffacd0b85a97d-47f8d710b11mr1792037f8f.9.1784786669471; 
 Wed, 22 Jul 2026 23:04:29 -0700 (PDT)
X-Received: by 2002:a5d:5f07:0:b0:47f:6f9e:1e82 with SMTP id
 ffacd0b85a97d-47f8d710b11mr1791974f8f.9.1784786668866; 
 Wed, 22 Jul 2026 23:04:28 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-37-66.inter.net.il. [80.230.37.66])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85c52fa9sm13412227f8f.20.2026.07.22.23.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2026 23:04:28 -0700 (PDT)
Date: Thu, 23 Jul 2026 02:04:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: Gavin Shan <gshan@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, alex@shazbot.org,
 richard.henderson@linaro.org, berrange@redhat.com, philmd@mailo.com,
 david@kernel.org, clg@redhat.com, pbonzini@redhat.com,
 phrdina@redhat.com, jugraham@redhat.com,
 liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn,
 shan.gavin@gmail.com, qemu-s390x <qemu-s390x@nongnu.org>
Subject: Re: [PATCH v3 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
Message-ID: <20260723015708-mutt-send-email-mst@kernel.org>
References: <73f79841-8cc7-4ca6-8f6b-fb97b53a6fe8@redhat.com>
 <20260717091756-mutt-send-email-mst@kernel.org>
 <CAFEAcA-O6Z4JrVV0DL_tta6khRyUta_Zz5mJt6OszaW1mu0o6Q@mail.gmail.com>
 <20260717095407-mutt-send-email-mst@kernel.org>
 <9c2ad22a-e768-4a07-85a2-01ce1fc14368@oss.qualcomm.com>
 <59882c5b-545d-4768-8bf4-723fed97a801@redhat.com>
 <al-eCtxGjG4HHEbl@x1.local>
 <6210e178-a93f-4411-810a-41edb1fb656e@redhat.com>
 <20260722015422-mutt-send-email-mst@kernel.org>
 <amDyvgR09OJssENX@x1.local>
MIME-Version: 1.0
In-Reply-To: <amDyvgR09OJssENX@x1.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4UWz84ore4utYGjxN5N-fgJViMCsg2TIrPzL2otqZXk_1784786670
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: permerror client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

On Wed, Jul 22, 2026 at 12:41:34PM -0400, Peter Xu wrote:
> On Wed, Jul 22, 2026 at 01:58:18AM -0400, Michael S. Tsirkin wrote:
> > On Wed, Jul 22, 2026 at 10:53:27AM +1000, Gavin Shan wrote:
> > > On 7/22/26 2:27 AM, Peter Xu wrote:
> > > > On Tue, Jul 21, 2026 at 03:37:53PM +1000, Gavin Shan wrote:
> > > > > If Peter is fine with two variants for x86 and non-x86 architectures.
> > > > > I can post (v4) for further review. That will be something like below
> > > > > and let me know if there are any other improvements are needed.
> > > > 
> > > > I have a generic question on the "unaligned access for x86": I think the
> > > > question is about the one Michael raised here on unaligned access may break
> > > > x86 here:
> > > > 
> > > >    https://lore.kernel.org/qemu-devel/20260617022330-mutt-send-email-mst@kernel.org/
> > > > 
> > > >    3. (theoretical concern) also on x86, unaligned accesses are
> > > >    possible on guest and host, so converting an unaligned access to a
> > > >    series of aligned ones can in theory break devices.
> > > > 
> > > > Is that a real problem we need to consider, or can we start with unified
> > > > approach and leave it for later?
> > > > 
> > > 
> > > I'm leaving this question to Michael.
> > 
> > Knowing what I know about hardware designers, it's something someone
> > somewhere does)
> > It can be made a separate patch, just to show - it should be all of
> > ~10LOC.
> 
> It's only about removal of anything that might be controversial for now,
> thanks.  I also wonder if anything would break, then it's more solid proof
> that per-arch change is required.

Repeating:
	I think there is exactly 1 kinda reasonable case. A 2 byte read/write at
	offset 0x1 within a dword. This maps nicely to even classical PCI byte
	enable mechanism and so yes it works if your CPU can initiate these
	things, and it's atomic.

It's easy to find more examples of such hardware if one looks. For example,
LEDCTL on e1000e:

20260625101817-mutt-send-email-mst@kernel.org


A claim that no software uses this hardware capability is the strong
claim that needs proof, not the other way around.


What to do on non-x86? reading a dword might work, or reading
byte by byte might work. Both can cause issues, just different ones,
but given we did byte by byte previously i guess let's keep
doing that.


> > 
> > > > PS: I apologize if I missed important piece of info along the way; I didn't
> > > > follow closely on the discussion on this topic in the past few weeks.
> > > > 
> > > > One thing to mention is, what we change should only need to affect
> > > > ram_device, AFAIU.. so most memcpy()/memmove() shouldn't be changed for any
> > > > arch when it's pure RAM.
> > > > 
> > > 
> > > It depends. This patch intends to fix issue [1] in the lower layer by using
> > > the newly added accessors (qemu_ram_{copy, move}) on all directly accessible
> > > regions including the regular (pure) RAM region. Otherwise, the newly added
> > > accessors should be limited to ram_device regions only as you said.
> > > 
> > > [1] https://lore.kernel.org/qemu-devel/20260527091711.3901-1-liugang24219@sangfor.com.cn/
> > > 
> > > Thanks,
> > > Gavin
> > 
> > using memcpy()/memmove() to emulate guest's atomics is generally
> > kinda broken.
> > but yes there are architectures where doing it to device ram is
> > more broken than doing it to regular ram.
> 
> If we keep memcpy()/memmove() for len>8 (aligned or not), I am thinking no
> perf issue will happen, then looks like we can indeed change this even for
> pure RAM operations, which we can't identify in case of e1000e driver use
> case.
> 
> Then does it mean we should not use __builtin_memcpy()/memmove()?  Even if
> we know constants 1/2/4/8 would work there, why not we go ahead and use
> qatomics, which is even more future proof?  I also stumbled on top of
> commit 77b1757090 ("include/qemu/bswap.h: Use __builtin_memcpy() in
> accessor functions"), which seems to say the same thing "for the long
> term".
> 
> For "should we still do unaligned access if the guest did it, so as to keep
> the original behavior of a bare metal" question, are we on the same page
> that we should just break it into aligned accesses for all archs?  I think
> it means, we will not be able to emulate guest faults correctly as what
> will happen on bare metal, but we're missing the fault injection logics
> anyway, so whenever it's implemented we _could_ switch it back to unaligned
> accesses.  Before that, breaking unaligned seems like a better way to go to
> (1) satisfy all legit users, and (2) don't make QEMU crash by guest
> operations.
> 
> Last, one silly question: why do we need any helper named with *memcpy*, if
> memmove is always superior (to consider range overlap)?  Can we stick with
> memmove all over the places?
> 
> Thanks,
> 
> -- 
> Peter Xu


