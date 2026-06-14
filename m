Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6112CD98C5
	for <qemu-arm@archiver.kernel.org>; Sun, 14 Jun 2026 15:13:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wYmWQ-0003hJ-Dz; Sun, 14 Jun 2026 11:13:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wYmWO-0003gh-Jy
 for qemu-arm@nongnu.org; Sun, 14 Jun 2026 11:13:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wYmWM-0005Db-NJ
 for qemu-arm@nongnu.org; Sun, 14 Jun 2026 11:13:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781449988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kWl8m7l9xoImRfNFb/MfBzBL9YfQPVIKZShDreG9XTU=;
 b=aba+k4d93dAK3/hFsRtcTTT8NXKbJMvEeHqnYpUTv1wW1QQ9F2bbJM5VQUccu77WeNVtLL
 vGlg79sQrsOPVP4hI8Y3h3UDNOH8J48Zz+bjzNoZI9tfATgVIutUuNDcJL+uie6q/OrtC2
 tSeSMp1iFFHS25GryCG6+EQbtWDXm1Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-uNyTXn8xMM6fFySmgRyO5w-1; Sun, 14 Jun 2026 11:13:07 -0400
X-MC-Unique: uNyTXn8xMM6fFySmgRyO5w-1
X-Mimecast-MFC-AGG-ID: uNyTXn8xMM6fFySmgRyO5w_1781449986
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-490ae461f8dso18626885e9.1
 for <qemu-arm@nongnu.org>; Sun, 14 Jun 2026 08:13:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781449986; x=1782054786;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kWl8m7l9xoImRfNFb/MfBzBL9YfQPVIKZShDreG9XTU=;
 b=YFCh2+JtHL3+mvaX4JBxE6qB+dR+PBpNNB+OMkHaomUQfiF600YwHemBO5NknTh7+W
 odejk5QTjz+4EtwmEMkcusmFK1sjL19et67/Tfe8N7iImxpQqwsjnuOgB/4fFAt+lYa/
 r5R3iy2ajBDUltgaVLDPkMaDq9juMYuJpKOR+lgYKibcOYwhCZ680xYBYUtoFhuvDjB4
 6wgNnbmtCVPU0VKbf/KVo3BNR5WAtxufULG0/78scby0IBEeWSTd6PI8nE8zAjCXwr/M
 JRpVKJC5MtTpBunobhVz9liwNIT+pjUPp8rkajPTy3Oc901SqPoG8UPnaM79sx0iWmMe
 uesg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/AUPbdUAzk0hUNNteMf3S76A8ogh2jgDynCBRf3nGjSpxN6MmoNEO/1A+WUZHli93+XQywHQGMyQ==@nongnu.org
X-Gm-Message-State: AOJu0YwOnE0QqbwFe9Mj/i+jp07KaJgXz7op5AdrZFOvfD17LvCwiLMN
 +zIXM6UnVopVdfUQvrvwDuqAxirZBXIKDAOPWgY/PSgZLzfBVt9sM86THg7jTvpGxcixvL+TNVK
 q3uorkZ/IpZh+tp3Sm3ar8cJuXAyUsMaecQQDQN/phHfzEv7zU/K7TA==
X-Gm-Gg: Acq92OFykMNKHoOiW1oadOal2zhvZ+j3TayW/jJlkpe/Z7UN6GuiBnPDcY+VpoF25AU
 xTc2+Xd6zL0JDwkIV/9aBK/OhKskPJlhJUjCxxKU53IjPFoe+1txADuALDl5uPthwIJ9T9Z+ARI
 /IgMDgHzO8Bmgc+/6vJxim8nFMIDbWkZb0gQTJmbgPJIoNADIg+qnu3/npdsxvlYBvgV8H2pRYR
 X+aUZrKg7vr1u9UGQwApU/isaCUfIeLYGbbVds+OLquXtoYr4RgO9SN1U1CbR2URyiIp8dZM7rG
 zaZgS/glVpb4XvYSbBrUcNTI4wWG5zztOhEYyqsbkPnqPFMpmlnI4oPjnq83Ex4+MbSRpVXMssx
 +2a35V6YLzDoGMyaW0iFXj+vJ9jsEQ22qt9E0VsOKkL8=
X-Received: by 2002:a05:600c:3650:b0:490:d354:bd0a with SMTP id
 5b1f17b1804b1-49220143bd1mr58959155e9.31.1781449985766; 
 Sun, 14 Jun 2026 08:13:05 -0700 (PDT)
X-Received: by 2002:a05:600c:3650:b0:490:d354:bd0a with SMTP id
 5b1f17b1804b1-49220143bd1mr58958715e9.31.1781449985143; 
 Sun, 14 Jun 2026 08:13:05 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922033dd59sm162910305e9.9.2026.06.14.08.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2026 08:13:04 -0700 (PDT)
Date: Sun, 14 Jun 2026 11:13:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Gavin Shan <gshan@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, peterx@redhat.com,
 berrange@redhat.com, david@kernel.org, alex@shazbot.org,
 clg@redhat.com, pbonzini@redhat.com, philmd@mailo.com,
 phrdina@redhat.com, jugraham@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH 1/2] system/memory: Use __builtin_mem{cpy, move} in
 accessors of ram device region
Message-ID: <20260614084004-mutt-send-email-mst@kernel.org>
References: <20260612110307.1264798-1-gshan@redhat.com>
 <20260612110307.1264798-2-gshan@redhat.com>
 <223f5f94-b9b7-46b0-8466-5be655203a0e@linaro.org>
 <CAFEAcA-TgP_BM0WQo3rysZmvhNN17Gc_nrSYB6pXn-mvs5w13g@mail.gmail.com>
 <123d9e80-d731-42c7-81cc-71de47bb13d3@linaro.org>
MIME-Version: 1.0
In-Reply-To: <123d9e80-d731-42c7-81cc-71de47bb13d3@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sVrxwVTeBOuIncbfovHYlXjZHTo5yEPFOzBi85Im5KM_1781449986
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

On Fri, Jun 12, 2026 at 10:25:35AM -0700, Richard Henderson wrote:
> On 6/12/26 09:36, Peter Maydell wrote:
> > On Fri, 12 Jun 2026 at 16:29, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> > > 
> > > On 6/12/26 04:03, Gavin Shan wrote:
> > > > This replaces mem{cpy, move} with __builtin_mem{cpy, move} in the memory
> > > > accessors to ram device memory region, preparatory work to make ram device
> > > > region directly accessible and bypass the bounce buffer in the DMA path
> > > > in next patch.
> > > 
> > > memcpy/memmove *always* compile to __builtin_memcpy/memmove, and the compiler later
> > > decides whether or not to expand inline.
> > 
> > Yes, but if you pass it a fixed small integer, then it is likely
> > to expand it inline, whereas if you pass it a variable then it
> > is likely not to... The patch is attempting to persuade the
> > compiler to definitely do an inline access for 1, 2, 4, 8
> > byte access.
> 
> Sure, for hosts with unaligned accesses.  We still have sparc64 and (some?)
> riscv64 that don't automatically have such and will compile to more than one
> host instruction.
> 
> > > My real question is: what are you attempting to achieve?
> > > 
> > > (1) is the problem unaligned access to a mapped physical device?
> > > (2) is the problem vector access to a mapped physical device?
> > > (3) something else?
> > 
> > I think there are two problems we're trying to fix here:
> > 
> > (1) If a device does e.g. a pci_dma_write() with size 1, we want
> > this to turn into exactly 1 byte write into guest memory, for the
> > normal case where the guest memory is real host RAM.
> > This deals with the e1000 bug where the pci_dma_write() turns into
> > a call to glibc memmove() with size 1 and glibc's implementation
> > turns that into 3 writes of the byte to the same address...
> 
> Gotcha.  Easily handled by not using memcpy/memmove at all.
> 
> 	*(char *)ptr = val;
> 
> is sufficient for all hosts.

Yes, I think it does work because we use -fno-strict-aliasing.
For bigger sizes we'll need packed because the addresses
could be unaligned.



But again, qemu simply already relies on this in bswap.h

I kind of dislike muddying the waters by making several
unrelated changes here. If we do we should change bwap too.


> > (2) If a vCPU (emulated or KVM) does a 4 byte access to an
> > address which is in the PCI BAR of a vfio-passthrough device,
> > we want this to turn into exactly a 4-byte access to the
> > mmap()ed memory which is the BAR of the host device. This
> > is because that address might be a real hardware device
> > register, so it's important to access it exactly the way
> > the guest vCPU asked for, and not do multiple accesses or
> > misaligned accesses or whatever.
> > 
> > (The reason we make pass-through BARs not "direct access"
> > but instead go via the bounce buffer is that we were working
> > around (2).)
> 
> That's going to require qatomic and alignment checks.
> 
> That's also going to beg the question of the intended behaviour anything
> that isn't a naturally aligned access of size in {1,2,4,8}: fall back to N
> operations of the minimum of alignment and size?

For most host/guest pairs things simply work even for unaligned.

And yes, guest drivers do do this.

On classical pci, there are no transactions as such and
an unaligned access will be split anyway.



> 
> 
> r~


