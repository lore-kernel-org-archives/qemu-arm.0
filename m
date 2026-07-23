Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26DAC531C7
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Jul 2026 09:05:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmpMo-0000Tf-FI; Thu, 23 Jul 2026 05:05:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wmpMn-0000TO-Ix
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 05:05:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wmpMk-0003fQ-GC
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 05:05:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1784797516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/CpFpa3YQWIViCBA7uvSk/o+fAJelb5NUfE93VtZvu4=;
 b=UedEqDKaBN2NpG6BPxzDTTlKr+533pJyBVG3KJnOYYI5lo+uBBhsFuPo/Pu1KH0pdsUtO3
 SbXSuCfCwGU2wnDCuP6qiMQno97bzGlctPqxDLcvvSmnoQL4ZQA/eqliP7Pe6aV2tlzXf3
 gYdTQwvDpGeBhtTFVPvVohsBEcOItCI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-DZQUR8xsPPqlloRhZmE4hg-1; Thu, 23 Jul 2026 05:05:15 -0400
X-MC-Unique: DZQUR8xsPPqlloRhZmE4hg-1
X-Mimecast-MFC-AGG-ID: DZQUR8xsPPqlloRhZmE4hg_1784797514
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-472c330e555so240544f8f.1
 for <qemu-arm@nongnu.org>; Thu, 23 Jul 2026 02:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784797514; x=1785402314;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=/CpFpa3YQWIViCBA7uvSk/o+fAJelb5NUfE93VtZvu4=;
 b=lFr5cqN1qnEpInHvLmmGOlnS8kyIasCQmsQJxUwHjoLPCxq1r16IIJa/WEoUR/reL3
 YwNaDfg8q1sA95yFGqxjfFmwWvkDZu03FERvoIkwqLjQwczRWd6jwgfI/0+kk8pZzSNz
 YEcH8t3/M9IYQ7R3xKkrL0ELj+EM16s1HFTxP1hlDK+PJdxHAtQjkjDy+mQKjgmgoKOa
 LybZ+/MltrefetqwKogsqJb+6KXMgUTzlrcnlV0G74rdPnp0Ze3VTfS0eeiFf4xV8IPY
 sX5o+92SrZxxUz+Vym2bimOq4LaLF8xR//PxBkjJtwQ4K65PZ8jrfZq+Vtlv1618hQAv
 WHtw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpNplbcqseoUdo0iT1TEIHXDn/hTAu9F+K2skZtREwbRteHMjNi532+4P0buslczNF+11biJVtaWA==@nongnu.org
X-Gm-Message-State: AOJu0Yy7mnO4bLdvBHRVnI+dxS9BkOHMQgmbTrjzOH5860YgVaOTNQln
 9aGPikPe1Xg6Vr1Uf8yOEzD+axMMdD8d1/UTSBbyXo4g4BQeQdqGlQTzTZxi5Z1BU0cmKabKqql
 CpQfUnEir3NyMdPUTj6Fla8GsKYah94UL5HTKGyNGOLkG+n9MRKH0xQ==
X-Gm-Gg: AR+sD12hKls2wydkA4aHFTuh/A+fabF/s+XpUm4XQHMA71ro02aTLbzvkXnyUlq3rQ6
 HoxYJHlHSTonriq0xF8XdB4bRlGw5UG1vyb1Q9a3jF0D/Ac+M1TsAHyutNb3LgNVBjV9q8QIzZP
 bqRhAXPZ+bxl70ws/9gh0jgwSym0dKMJPotpwhP3hx92EOb3R+mV7M9YDK8SzX0wZlM4pqoGyCv
 s6amxdCuiiz2fTyrV7bHU2zYZVMif0jlzVcKq8VCyHJ6Gt2BIZ6DypPBrEl/3QDCzQ5LqVS+uWO
 Rgo0ZIp8WczRQ6JSbSDaZFLyy/fACRlDEkPZmMbfv9KsDx+HmCdPk0MAr/+ABqDBP5dR8GoBk86
 nBhc2QcM8dHeeK+K94zoN1g==
X-Received: by 2002:a05:6000:4b1d:b0:47f:7fd1:9602 with SMTP id
 ffacd0b85a97d-47f8da5fa48mr2591312f8f.11.1784797513603; 
 Thu, 23 Jul 2026 02:05:13 -0700 (PDT)
X-Received: by 2002:a05:6000:4b1d:b0:47f:7fd1:9602 with SMTP id
 ffacd0b85a97d-47f8da5fa48mr2591201f8f.11.1784797512736; 
 Thu, 23 Jul 2026 02:05:12 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-37-66.inter.net.il. [80.230.37.66])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85bdac28sm12810261f8f.16.2026.07.23.02.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2026 02:05:11 -0700 (PDT)
Date: Thu, 23 Jul 2026 05:05:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@oss.qualcomm.com>
Cc: Peter Xu <peterx@redhat.com>, Gavin Shan <gshan@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, alex@shazbot.org,
 richard.henderson@linaro.org, berrange@redhat.com, philmd@mailo.com,
 david@kernel.org, clg@redhat.com, pbonzini@redhat.com,
 phrdina@redhat.com, jugraham@redhat.com,
 liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn,
 shan.gavin@gmail.com, qemu-s390x <qemu-s390x@nongnu.org>
Subject: Re: [PATCH v3 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
Message-ID: <20260723045428-mutt-send-email-mst@kernel.org>
References: <CAFEAcA-O6Z4JrVV0DL_tta6khRyUta_Zz5mJt6OszaW1mu0o6Q@mail.gmail.com>
 <20260717095407-mutt-send-email-mst@kernel.org>
 <9c2ad22a-e768-4a07-85a2-01ce1fc14368@oss.qualcomm.com>
 <59882c5b-545d-4768-8bf4-723fed97a801@redhat.com>
 <al-eCtxGjG4HHEbl@x1.local>
 <6210e178-a93f-4411-810a-41edb1fb656e@redhat.com>
 <20260722015422-mutt-send-email-mst@kernel.org>
 <amDyvgR09OJssENX@x1.local>
 <20260723015708-mutt-send-email-mst@kernel.org>
 <71d88d00-5b41-49d2-b649-8a6ea47abc4d@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <71d88d00-5b41-49d2-b649-8a6ea47abc4d@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yz__0KXXlcjFGzv_o2FwmImXDpKtn4DRJ4nEDsyutow_1784797514
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001,
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

On Thu, Jul 23, 2026 at 10:52:11AM +0200, Philippe Mathieu-Daudé wrote:
> On 23/7/26 08:04, Michael S. Tsirkin wrote:
> > On Wed, Jul 22, 2026 at 12:41:34PM -0400, Peter Xu wrote:
> > > On Wed, Jul 22, 2026 at 01:58:18AM -0400, Michael S. Tsirkin wrote:
> > > > On Wed, Jul 22, 2026 at 10:53:27AM +1000, Gavin Shan wrote:
> > > > > On 7/22/26 2:27 AM, Peter Xu wrote:
> > > > > > On Tue, Jul 21, 2026 at 03:37:53PM +1000, Gavin Shan wrote:
> > > > > > > If Peter is fine with two variants for x86 and non-x86 architectures.
> > > > > > > I can post (v4) for further review. That will be something like below
> > > > > > > and let me know if there are any other improvements are needed.
> > > > > > 
> > > > > > I have a generic question on the "unaligned access for x86": I think the
> > > > > > question is about the one Michael raised here on unaligned access may break
> > > > > > x86 here:
> > > > > > 
> > > > > >     https://lore.kernel.org/qemu-devel/20260617022330-mutt-send-email-mst@kernel.org/
> > > > > > 
> > > > > >     3. (theoretical concern) also on x86, unaligned accesses are
> > > > > >     possible on guest and host, so converting an unaligned access to a
> > > > > >     series of aligned ones can in theory break devices.
> > > > > > 
> > > > > > Is that a real problem we need to consider, or can we start with unified
> > > > > > approach and leave it for later?
> > > > > > 
> > > > > 
> > > > > I'm leaving this question to Michael.
> > > > 
> > > > Knowing what I know about hardware designers, it's something someone
> > > > somewhere does)
> > > > It can be made a separate patch, just to show - it should be all of
> > > > ~10LOC.
> > > 
> > > It's only about removal of anything that might be controversial for now,
> > > thanks.  I also wonder if anything would break, then it's more solid proof
> > > that per-arch change is required.
> > 
> > Repeating:
> > 	I think there is exactly 1 kinda reasonable case. A 2 byte read/write at
> > 	offset 0x1 within a dword. This maps nicely to even classical PCI byte
> > 	enable mechanism and so yes it works if your CPU can initiate these
> > 	things, and it's atomic.
> 
> Isn't this out of the CPU arch, dealt with at the bus level?
> 
> It looks we try to be clever with modern PCI code by optimizing this
> access -- not saying we can change that, I know it is too late after
> 20+ years -- relying on hw behavior that was done that way to support
> legacy hw, in particular broken I/O accesses.

Not sure what the question is.  We were dicussing how to emulate unaligned
accesses from x86 guests if they happen.
On an x86 host we can do that easily, and it's just a couple of LOC.
Though Peter Maydell dislikes host arch specific code. But I hope
if it's a separate patch on top and it is visible how small it is,
he will reconsider)
On other hosts we can't emulate them 100%, we either need to split
to byte accesses or over-access and mask. Byte accesses feel safer.
What qemu currently does with memmove is clearly not safe in the
general case.



As for optimizing - there is space for optimization e.g. vfio could
report the properties of a BAR to userspace for optimization
purposes. On x86 you can then get good speed with just memmove.
Other arches you will likely need to write arch specific code.
But this has to do with e.g. DMA into device BAR not CPU accesses.
As an aside, it is a pity qemu uses same thing for DMA and CPU access,
we know how virtio accesses work and this might allow optimization.

> 
> For Alpha / HPPA / MIPS there were ASIC in the PCI I/O path to handle
> these odd unaligned accesses inherited from x86 world.

Right.

> > It's easy to find more examples of such hardware if one looks. For example,
> > LEDCTL on e1000e:
> > 
> > 20260625101817-mutt-send-email-mst@kernel.org
> > 
> > 
> > A claim that no software uses this hardware capability is the strong
> > claim that needs proof, not the other way around.
> > 
> > 
> > What to do on non-x86? reading a dword might work, or reading
> > byte by byte might work. Both can cause issues, just different ones,
> > but given we did byte by byte previously i guess let's keep
> > doing that.
> > 
> > 
> > > > 
> > > > > > PS: I apologize if I missed important piece of info along the way; I didn't
> > > > > > follow closely on the discussion on this topic in the past few weeks.
> > > > > > 
> > > > > > One thing to mention is, what we change should only need to affect
> > > > > > ram_device, AFAIU.. so most memcpy()/memmove() shouldn't be changed for any
> > > > > > arch when it's pure RAM.
> > > > > > 
> > > > > 
> > > > > It depends. This patch intends to fix issue [1] in the lower layer by using
> > > > > the newly added accessors (qemu_ram_{copy, move}) on all directly accessible
> > > > > regions including the regular (pure) RAM region. Otherwise, the newly added
> > > > > accessors should be limited to ram_device regions only as you said.
> > > > > 
> > > > > [1] https://lore.kernel.org/qemu-devel/20260527091711.3901-1-liugang24219@sangfor.com.cn/
> > > > > 
> > > > > Thanks,
> > > > > Gavin
> > > > 
> > > > using memcpy()/memmove() to emulate guest's atomics is generally
> > > > kinda broken.
> > > > but yes there are architectures where doing it to device ram is
> > > > more broken than doing it to regular ram.
> > > 
> > > If we keep memcpy()/memmove() for len>8 (aligned or not), I am thinking no
> > > perf issue will happen, then looks like we can indeed change this even for
> > > pure RAM operations, which we can't identify in case of e1000e driver use
> > > case.
> > > 
> > > Then does it mean we should not use __builtin_memcpy()/memmove()?  Even if
> > > we know constants 1/2/4/8 would work there, why not we go ahead and use
> > > qatomics, which is even more future proof?  I also stumbled on top of
> > > commit 77b1757090 ("include/qemu/bswap.h: Use __builtin_memcpy() in
> > > accessor functions"), which seems to say the same thing "for the long
> > > term".
> > > 
> > > For "should we still do unaligned access if the guest did it, so as to keep
> > > the original behavior of a bare metal" question, are we on the same page
> > > that we should just break it into aligned accesses for all archs?  I think
> > > it means, we will not be able to emulate guest faults correctly as what
> > > will happen on bare metal, but we're missing the fault injection logics
> > > anyway, so whenever it's implemented we _could_ switch it back to unaligned
> > > accesses.  Before that, breaking unaligned seems like a better way to go to
> > > (1) satisfy all legit users, and (2) don't make QEMU crash by guest
> > > operations.
> > > 
> > > Last, one silly question: why do we need any helper named with *memcpy*, if
> > > memmove is always superior (to consider range overlap)?  Can we stick with
> > > memmove all over the places?
> > > 
> > > Thanks,
> > > 
> > > -- 
> > > Peter Xu
> > 
> > 


