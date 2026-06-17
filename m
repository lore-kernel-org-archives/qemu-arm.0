Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8919DCD98E1
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Jun 2026 05:52:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZjCC-00033X-4F; Wed, 17 Jun 2026 01:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZjCA-00032r-JQ
 for qemu-arm@nongnu.org; Wed, 17 Jun 2026 01:52:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZjC8-0006Fv-Aj
 for qemu-arm@nongnu.org; Wed, 17 Jun 2026 01:52:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781675530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IWVgqzOTX5oPz+NDo2MDzss8B1MaOP+2UdmjAj6uOb8=;
 b=OYbYnaRrNRbAekINWsgN0bC3NgaQeYPFtZoyUVUvanN3BTMH0vp/G2urHlWdS86t6eLM6C
 g3jWphs6BuQw7YXvpd9mcHD7aif8eOXw5Az9dRDW5SK4+8XkEo7lzeC5gFQPSzN93MdTev
 S+C3lWK2TnNL4fIc0si3edyK5bcyvbc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-IuzlQy7fMkydhBmGqSkKjQ-1; Wed, 17 Jun 2026 01:52:09 -0400
X-MC-Unique: IuzlQy7fMkydhBmGqSkKjQ-1
X-Mimecast-MFC-AGG-ID: IuzlQy7fMkydhBmGqSkKjQ_1781675528
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-490dad70f95so54423265e9.3
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 22:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781675528; x=1782280328;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IWVgqzOTX5oPz+NDo2MDzss8B1MaOP+2UdmjAj6uOb8=;
 b=PdDb074DMvhTxdCV7ud1DyyOBMIhpckEFW5Lw9TK0Kd72uNtfOa41XiPo4fXmvcGaN
 3LNcozS6eOmiitZq9dVv1fVHW0cKoCdpuvdK0iSxfGQAqiLYg3wrt7SwLjBrbQYOSTzG
 udMeZ5Y+cKuJ9HDJlI/RQDsFLieRKR8KDBwXuuVA8w4rftTyKDIRqommbsO1HA6rkQoa
 jwZUV15avQXG5Hq45BI0PiyPmrCt91g0LniADdLut0T0uNY9gQ+Iy3n3WX5YdEIeCILs
 XZ/36Hf4B13LvtlDdEllJNK4gjw6LBJmXqKHDocG2II2ZywbOuK4U1gUqivH2wBQ8/Ul
 CCpA==
X-Gm-Message-State: AOJu0Yw8S7lCAMigaG6OCJGm3+TJHRKEAn5N3JpxmbHzcDoQkIMSpmxE
 VliOhFyDNEcUmkLu0cnMDyiaA65gv+ZDI1rVOe1RHiM1FkC+Dk9gR5dA0B7Ik3CcApviTcv/EJe
 pR2dPTt1A99I5EHd05CcojUgwBO2EbbGI7DXWMmpAY8FMG5LdRokLzQ==
X-Gm-Gg: Acq92OH5ZgTQtpVKrDVfiB6Cf7ssdE3q0mM2ONh5OAfS8KRmPKCfX0W1ojVkHbxso9j
 eslyBKV/rwz9/rzXW3q6HsLLLHV+OZ7QxaEjM/6/ihZBEUK0DfwVVcT+Bent6j7u07FqXMfdSIF
 JQKqzLu0p+vEecQiYBIkiQFu6dpdhNLJQLIyTvwVb8qu10q71OsUe0htp3TfB37OHLT3VCFsbkE
 5q31zhPC07OnRw8yJjITuvyo3WrFbKyZ1ZqWeEbE2d9i5fFOrZLXEcKOOmay7+DKwa4Iv466E7A
 ghd7oLI1+fKn2yljqLC4hQ9wXK1OtwLrV90AG+9L4YKQ2xhwJWPcFOvSLww8YfRzmtPllLsqW0n
 0E9+X4VSZ/vTn26puB3Zk83iYUyTwV2Jd
X-Received: by 2002:a05:600c:698e:b0:490:d9d0:51c8 with SMTP id
 5b1f17b1804b1-492341275e3mr22565875e9.18.1781675528221; 
 Tue, 16 Jun 2026 22:52:08 -0700 (PDT)
X-Received: by 2002:a05:600c:698e:b0:490:d9d0:51c8 with SMTP id
 5b1f17b1804b1-492341275e3mr22565225e9.18.1781675527538; 
 Tue, 16 Jun 2026 22:52:07 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f263945sm52313133f8f.8.2026.06.16.22.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 22:52:07 -0700 (PDT)
Date: Wed, 17 Jun 2026 01:52:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peterx@redhat.com,
 alex@shazbot.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org, berrange@redhat.com,
 philmd@oss.qualcomm.com, philmd@mailo.com, david@kernel.org,
 clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com,
 jugraham@redhat.com, liugang24219@sangfor.com.cn,
 dinghui@sangfor.com.cn, shan.gavin@gmail.com
Subject: Re: [PATCH v3 0/2] system/memory: Make ram device region directly
 accessible
Message-ID: <20260617013709-mutt-send-email-mst@kernel.org>
References: <20260616052552.389021-1-gshan@redhat.com>
 <ae17b5a6-eed8-4d4c-a798-cb92ffa6c915@redhat.com>
 <20260616014419-mutt-send-email-mst@kernel.org>
 <2015405e-7839-4ab9-b5a0-712b644da3c8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2015405e-7839-4ab9-b5a0-712b644da3c8@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kkxogpWjFGSLua_xyV758gLdH2T5XAvxCAHTrSkSNbc_1781675528
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

On Wed, Jun 17, 2026 at 12:35:00PM +1000, Gavin Shan wrote:
> On 6/16/26 3:44 PM, Michael S. Tsirkin wrote:
> > On Tue, Jun 16, 2026 at 03:40:34PM +1000, Gavin Shan wrote:
> > > On 6/16/26 3:25 PM, Gavin Shan wrote:
> > > > All ram device regions was turned to be indirectly accessible by commit
> > > > 4a2e242bbb ("memory: Don't use memcpy for ram_device regions"). This leads
> > > > to a hanged guest where a NVidia GH100 GPU is passed from host. The memory
> > > > in its PCI BAR#4 can be allocated as DMA target buffer. qemu has to take
> > > > DMA bounce buffer in address_space_map() to cover the DMA request. However,
> > > > the bounce buffer size is 4096 bytes and we're overrunning it easily when
> > > > the guest has significant disk activities on compiling 'cuda-samples'.
> > > > The full log and problem description can be found from PATCH[1/2]'s commit
> > > > log.
> > > > 
> > > > Try to fix the issue handled in commit 4a2e242bbb by replacing memcopy()/
> > > > memmove() with newly added helpers qemu_ram_{copy, move}() that works on
> > > > top of __builtin_{memcpy, memmove} or unaligned access friendly memory
> > > > movement in the accessors to the ram device regions. With this, we can
> > > > basically revert that commit to make ram device region directly accessible
> > > > again and bypass the bounce buffer in address_space_map() where the guest
> > > > hang is caused.
> > > > 
> > > > PATCH[1] uses qemu_ram_{copy, move}() in ram device region accessors
> > > > PATCH[2] makes ram device region directly accessible again
> > > > 
> > > Michael asked to include below context in the cover letter in v3, but I
> > > didn't noticed that before I sent v3 series, appended with them.
> > > 
> 
> Looking at the list of issues (questions) raised by Michael, I don't understand
> every one

Gavin, I doubt one should make memory.c changes without understanding the issues
it is trying to address.

What is unclear? Ask away.


> before I'm able to put more time to dig, but I feel this series has
> too ambitious goal to cover accesses to all the directly accessible regions
> with the newly introduced qemu_ram_{copy, move}. It causes too many behavior
> changes and concerns, making this series impossible to land.
> 
> I would suggest to break down the goal and step back to apply the newly introduced
> qemu_ram_{copy, move} to the ram device regions only? It's actually something
> proposed by Peter Xu in the earlier replies. Taking address_space_write() as an
> example, the indirectly accessible regions are covered by memory_region_dispatch_write()
> in (1), the ram device region is covered by qemu_ram_move() in (2), and all other
> directly accessible regions are covered by memmove() in (3).
> 
>   address_space_write
>     flatview_write
>       flatview_write_continue
>         flatview_write_continue_step
>           memory_access_size             // (1) indirectly accessible region
>           memory_region_dispatch_write
>             access_with_adjusted_size
>               memory_region_write_accessor
>                 mr->ops->write
>           qemu_ram_move                  // (2) ram device region
>           memmove                        // (3) all other directly accessible regions
> 
> With the limitation, only the ram device regions in (2) are affected. We're
> basically moving the accesses to the ram device region from (1) to (2). No
> changes introduced to other types of regions. The goal is to make the ram device
> region accessible so that the bounce buffer can be bypassed in DMA path.

Esthetics aside - ram device regions have all the same issues.

Maybe you can limit the scope of the changes,
but I doubt you can get out understanding)


> > > ----
> > > 
> > > The issues listed by Michael:
> > > 
> > > 1. On x86, memcpy is different from __builtin_memcpy if one uses old 1.0
> > >     force-headers from 2019. Likely no longer relevant.
> > > 
> > > 2. variable length memcpy can translate 2,4,8 byte guest access into
> > >     multiple byte accesses. doing this for mmio is guaranteed to break devices.
> > > 
> > > 3. (theoretical concern) also on x86, unaligned accesses are possible on guest
> > >     and host, so converting an unaligned access to a series of aligned ones can
> > >     in theory break devices.
> > > 
> > > 4. also on x86, vector instructions for large (>16 byte) writes into
> > >     pgprot_noncached memory are safe and faster than multiple 8 byte ones.
> > > 
> > > 5. also on x86 it so happens that if you write a fixed-size memcpy this gets
> > >     optimized to a single store/load and it works for aligned and unaligned
> > >     addresses on that architecture. How to ensure this keeps being correct
> > >     is left as an excerise for the reader. But qemu already relies on this
> > >     and did for years.
> > > 
> > > 6. on non-x86 both unaligned accesses and vector instructions for accessing
> > >     UC memory are illegal.
> > > 
> > > 7. standard vfio gives KVM VM_ALLOW_ANY_UNCACHED, so even on non x86 guest can
> > >     map the memory as as pgprot_noncached/ioremap or pgprot_writecombine/ioremap_uc.
> > >     If it does the second then it can use unaligned or vector for access.
> > >     This is why normal passthrough tends to work - it never traps to qemu at
> > >     all. But for qemu, vfio uses  pgprot_noncached unconditionally so qemu
> > >     can't use unaligned or vector instructions on non-x86.
> > > 
> > > 
> > > 8. But for nvgrace RAM, vfio has a driver that uses pgprot_writecombine/ioremap_uc.
> > >     so qemu could safely use unaligned/vector instructioons even on non-x86.
> > > 
> > > 9. Except sadly, vfio currently does not tell qemu how it maps
> > >     the memory, so qemu can not know what is safe on non-x86.
> > > 
> > 
> > And more:
> > 
> > 10. on x86 memcpy will sometimes do multiple overlapping stores when
> > size is not a power of 2. for example, a 15 byte write is done with
> > 2 8-byte stores. This is theoretically an issue
> > if guest does something super clever with ordering,
> > but does not seem to be in practice.
> > 
> > 10. on non-x86 memcpy will do multiple overlapping stores even
> > for single byte writes. E.g. it does it to avoid extra branches.
> > This is causing issues in practice.
> > 
> > 
> > 
> > 
> > 
> > > Now, what is to be done?
> > > 
> > > 
> > > A. on x86, we must avoid converting 2,4,8 byte accesses into byte accesses.
> > > At least for aligned, perferably for unaligned accesses too.
> > > Fixed width memcpy seems to work for this. Whether we should bother with
> > > __builtin to work around broken old fortify headers, I donnu.
> > > I do not have any answer how to check that compiler does this correctly.
> > > If anyone is motivated enough, adding a GCC builtin could be possible.
> > > Given qemu did this for years, I think we can leave solving this for
> > > another day.
> > > 
> > > B. Also on x86, I do not see why we should not use memcpy for large
> > > accesses if we can. Better perf.
> > > 
> > > C. on non-x86, we currently must not memcpy since we do not know if it
> > > is pgprot_noncached. yes, performance will be bad for DMA into device RAM.
> > > 
> > > D. It goes without saying that casting an unaligned address to unint32_t
> > > (be it for qatomic_set or whatever) is undefined behaviour in C
> > > and so a bad idea on any architecture.
> > > 
> > > E. also for non-x86, we really should teach vfio to tell qemu whether
> > > it maps device pgprot_noncached or pgprot_writecombine.
> > > we will then be able to use memcpy for >8 accesses.
> > > 
> > > Anyone, correct me if I'm wrong? Maybe I should start a new thread with
> > > this summary?
> > > 
> 
> Thanks,
> Gavin


