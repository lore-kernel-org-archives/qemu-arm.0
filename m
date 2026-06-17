Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D36ECD98E2
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Jun 2026 07:27:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZkgX-0007V2-AW; Wed, 17 Jun 2026 03:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZkgR-0007Ua-H6
 for qemu-arm@nongnu.org; Wed, 17 Jun 2026 03:27:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZkgP-00009X-9W
 for qemu-arm@nongnu.org; Wed, 17 Jun 2026 03:27:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781681251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DzZqM/JHTroZwaroo8DN1xvCqQvgQr0ZC3Pe+0bufMk=;
 b=cSNGG4kMSAMR3sEOvIwq13BKcWrV3j6c0rkHqH3St5NgVORivCvD9XwJXxE049OFkmddQw
 /rE2mP0FKVm8SJ2dlw7+f11dpmeU/JddCFH1tL5clhYBRyxDiWLzLC+Bixq7A7uRYf056j
 qKOTCFiqWO9uyw3sVquQrJxzBIg5AzU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-IJ9aN8UGN6qaJFLHDW1C4g-1; Wed, 17 Jun 2026 03:27:30 -0400
X-MC-Unique: IJ9aN8UGN6qaJFLHDW1C4g-1
X-Mimecast-MFC-AGG-ID: IJ9aN8UGN6qaJFLHDW1C4g_1781681249
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-462d8ccf553so163786f8f.1
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2026 00:27:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781681249; x=1782286049;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DzZqM/JHTroZwaroo8DN1xvCqQvgQr0ZC3Pe+0bufMk=;
 b=o4plG5DDJUr8n1jdKGf+k25lje0Ayd/kz1Oj/9vC8ta+B6+Es96CYTp3wHanhPxfPl
 YTDJeZz+3Q486gKu6sXcMWTB7NEEx9GYU+qcQgAuti51rRXcgq2GaQOPO3Q3gWq+iRsE
 uefUKL6KrpSOxr3sZSeYnzJwxUwvevKr3bpaupk4ihHFJw3RXmDpAbfsejoSSpVY4SYi
 yYNRZXg5MQET6/Dt3enexp0vlcDfgigdPhnI+MCSRc859+Za49xOO37w6s/uiOZkL3DS
 cSi4W+uLI0zw2uFPbSJJhYagBgB5YVNwoljEMvuVY5QduyhN2/d5X6Q7Q4BQFAvBqsmr
 ZgeA==
X-Gm-Message-State: AOJu0Yw9Bf5Bok4dNSq0/vb8IAZbTF1koiZxJHpP7ag6erVhl+KkEUtB
 u/Fd+IVufnWm+XCSiHcuen4SK30s7ZYBctjW7HplXHGTHeKVxs3LfCXsxWtlP8A05Kfw29UzD4/
 TEr+8kgBVBgg3xseqFceyU4dOJ96E4lWUsr1/W5V95iJfzyqCm72vpA==
X-Gm-Gg: AfdE7cnEJDdiCMj6hox9aJ8fMfLrPgRc3Dn3jPa8zgv8OqvCmji0EvRmZeV8Q6YqQ/C
 VagIaaC9/+4mmMijtnkoY7gpfSKEPhOz72ysWzH9llGQMwYdQMfrfSga2Bxww/8PAr/r2ot0UQI
 FGRftssVdInIJdz5yQw8r8YHffQTMfRen3dYSgPR13U3xIZbN0MaTIlfzpnRQdwTijFnC56jYh9
 gaR92Lhoi9yUSxofKAqDd+kIhM8UtACd1WhaEJq6csKf9C+q575ytEux/RPG28GD2WgZ9DGquIi
 iy0fUppFSmIe8DbhANzTWVeMgh+SRwR7O8NxfmT+QzabChZHMEEUkHP0MVTcJ2C0mZTsRbxzNig
 S0uPPqPBP4DzH4SPgcQwaumCmDHJoNyP4
X-Received: by 2002:a5d:588d:0:b0:43f:dbbf:6d93 with SMTP id
 ffacd0b85a97d-462410d3c5bmr4025570f8f.27.1781681248665; 
 Wed, 17 Jun 2026 00:27:28 -0700 (PDT)
X-Received: by 2002:a5d:588d:0:b0:43f:dbbf:6d93 with SMTP id
 ffacd0b85a97d-462410d3c5bmr4025519f8f.27.1781681248004; 
 Wed, 17 Jun 2026 00:27:28 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2cf5d9sm45077915f8f.32.2026.06.17.00.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 00:27:27 -0700 (PDT)
Date: Wed, 17 Jun 2026 03:27:23 -0400
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
Message-ID: <20260617031443-mutt-send-email-mst@kernel.org>
References: <20260616052552.389021-1-gshan@redhat.com>
 <ae17b5a6-eed8-4d4c-a798-cb92ffa6c915@redhat.com>
 <20260616014419-mutt-send-email-mst@kernel.org>
 <2015405e-7839-4ab9-b5a0-712b644da3c8@redhat.com>
 <20260617013709-mutt-send-email-mst@kernel.org>
 <ee0280dc-0c21-44df-a1cb-94c580140491@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ee0280dc-0c21-44df-a1cb-94c580140491@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Zcr85T5yzEfVrg0lPZTK3-_OTTBGxgFg9JwU6iwx5pE_1781681249
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

On Wed, Jun 17, 2026 at 05:00:45PM +1000, Gavin Shan wrote:
> Hi Michael,
> 
> On 6/17/26 3:52 PM, Michael S. Tsirkin wrote:
> > On Wed, Jun 17, 2026 at 12:35:00PM +1000, Gavin Shan wrote:
> > > On 6/16/26 3:44 PM, Michael S. Tsirkin wrote:
> > > > On Tue, Jun 16, 2026 at 03:40:34PM +1000, Gavin Shan wrote:
> > > > > On 6/16/26 3:25 PM, Gavin Shan wrote:
> > > > > > All ram device regions was turned to be indirectly accessible by commit
> > > > > > 4a2e242bbb ("memory: Don't use memcpy for ram_device regions"). This leads
> > > > > > to a hanged guest where a NVidia GH100 GPU is passed from host. The memory
> > > > > > in its PCI BAR#4 can be allocated as DMA target buffer. qemu has to take
> > > > > > DMA bounce buffer in address_space_map() to cover the DMA request. However,
> > > > > > the bounce buffer size is 4096 bytes and we're overrunning it easily when
> > > > > > the guest has significant disk activities on compiling 'cuda-samples'.
> > > > > > The full log and problem description can be found from PATCH[1/2]'s commit
> > > > > > log.
> > > > > > 
> > > > > > Try to fix the issue handled in commit 4a2e242bbb by replacing memcopy()/
> > > > > > memmove() with newly added helpers qemu_ram_{copy, move}() that works on
> > > > > > top of __builtin_{memcpy, memmove} or unaligned access friendly memory
> > > > > > movement in the accessors to the ram device regions. With this, we can
> > > > > > basically revert that commit to make ram device region directly accessible
> > > > > > again and bypass the bounce buffer in address_space_map() where the guest
> > > > > > hang is caused.
> > > > > > 
> > > > > > PATCH[1] uses qemu_ram_{copy, move}() in ram device region accessors
> > > > > > PATCH[2] makes ram device region directly accessible again
> > > > > > 
> > > > > Michael asked to include below context in the cover letter in v3, but I
> > > > > didn't noticed that before I sent v3 series, appended with them.
> > > > > 
> > > 
> > > Looking at the list of issues (questions) raised by Michael, I don't understand
> > > every one
> > 
> > Gavin, I doubt one should make memory.c changes without understanding the issues
> > it is trying to address.
> > 
> > What is unclear? Ask away.
> > 
> 
> Yeah, absolutely. I need some time to understand all questions or suggestions
> by digging the code a bit, before I'm able to come back to you, but not very
> soon though :-)
> 
> > 
> > > before I'm able to put more time to dig, but I feel this series has
> > > too ambitious goal to cover accesses to all the directly accessible regions
> > > with the newly introduced qemu_ram_{copy, move}. It causes too many behavior
> > > changes and concerns, making this series impossible to land.
> > > 
> > > I would suggest to break down the goal and step back to apply the newly introduced
> > > qemu_ram_{copy, move} to the ram device regions only? It's actually something
> > > proposed by Peter Xu in the earlier replies. Taking address_space_write() as an
> > > example, the indirectly accessible regions are covered by memory_region_dispatch_write()
> > > in (1), the ram device region is covered by qemu_ram_move() in (2), and all other
> > > directly accessible regions are covered by memmove() in (3).
> > > 
> > >    address_space_write
> > >      flatview_write
> > >        flatview_write_continue
> > >          flatview_write_continue_step
> > >            memory_access_size             // (1) indirectly accessible region
> > >            memory_region_dispatch_write
> > >              access_with_adjusted_size
> > >                memory_region_write_accessor
> > >                  mr->ops->write
> > >            qemu_ram_move                  // (2) ram device region
> > >            memmove                        // (3) all other directly accessible regions
> > > 
> > > With the limitation, only the ram device regions in (2) are affected. We're
> > > basically moving the accesses to the ram device region from (1) to (2). No
> > > changes introduced to other types of regions. The goal is to make the ram device
> > > region accessible so that the bounce buffer can be bypassed in DMA path.
> > 
> > Esthetics aside - ram device regions have all the same issues.
> > 
> > Maybe you can limit the scope of the changes,
> > but I doubt you can get out understanding)
> > 
> 
> Yes. Limited to the scope of VFIO and PCI BARs, it depends on how the PCI BARs
> are mapped, pgprot_noncached or pgprot_writecombine. The listed problems and
> concerns are existing on the ram device region exposed with pgprot_noncached.
> However, everything should be just fine if the region is exposed with pgprot_writecombine.
> Am I understanding this correctly?

Not everything)

We have issues around guest RAM access, too.

But yes you can then mostly access device RAM as guest RAM on
arm and x86. I am not sure about power. for power pgprot_writecombine
is cache inhibited and I am not sure e.g. vector instructions
with misaligned addresses behave the same.



> [...]
> 
> Thanks,
> Gavin


