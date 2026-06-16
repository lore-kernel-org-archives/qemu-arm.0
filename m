Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D538FCD98D2
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 04:37:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZLXK-0001nT-Fr; Tue, 16 Jun 2026 00:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZLXI-0001nC-J8
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 00:36:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZLXG-0005GH-DH
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 00:36:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781584584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oa35p+zVQkCpDU+MCOXFeys+VK2aUOfD6XhKQQQ9Wk8=;
 b=GC/5pryFUFdCEFqIJw4eroFAXIF2dgrX7pS09c3aQA4fx8a2+XMggM87L5GAWmbBuLI/rK
 4vYo3thT8v2CxG9r6mXuOS6qF3sGGXLBFbO0cZP+wD1cBfhZ2VGi0Nva4/Ip4ELmmSYLN7
 CADM5PWo8htkgSH1dvNNtfOuRNRO8ZY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-OlL6l_PAMhObJDSHJT5CIA-1; Tue, 16 Jun 2026 00:36:23 -0400
X-MC-Unique: OlL6l_PAMhObJDSHJT5CIA-1
X-Mimecast-MFC-AGG-ID: OlL6l_PAMhObJDSHJT5CIA_1781584582
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-490ae016853so29762285e9.2
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 21:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781584582; x=1782189382;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Oa35p+zVQkCpDU+MCOXFeys+VK2aUOfD6XhKQQQ9Wk8=;
 b=BgeS8is2tQyP27ac94Xd8gkhv1Sl067tWF05dA1U9OFWkveO2bOFFaKFjqhY5SbC5h
 S8MV9YxiPjQHFWXLLfqViYZjE+sXPCcuX7sTm0UfHX669RWzx1Fc2XcnWn9i8V4zIS3C
 LqLeJZfjktane28/bz2UL8qZ5cUIJWirM5ztdk+MJjbU1EdSciUqRSwtH55aDPmqBkM4
 0spAQOfRg35cqjZN1PVxsR/oiLGsPBFAV1zYTms50lD0/+O5Nbe8ds1/rCQDl6WlC7bx
 bU76r6onppOX1D/eIzFEDSqKIy0Y/wZyak3DtI1Tm91S4PDr/D0BJicT/2k5b426I8vC
 ZZ0A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+O8pZGLDl4glMLt0o3FqIRAhFzZmSo6we6qWHuOerVdLNVgd9IYUUW9h0Xfi/t9hqXAUd8QEgAxQ==@nongnu.org
X-Gm-Message-State: AOJu0YwVQ60sjtNw4d7mw43JUP08Tidx3xR6qhNj3MjAGCEij8nEAZBg
 neaX1ny/JkTuI/xjSaSwzp3UE8anyLvN57mSeot+VqdSuUqwoV8E/ly9TjY9JFufJq2Z84G4gTm
 rwfaG5kSkMyXxgxE0DgDxBympZ6vpIR17m9g9qOJ3qvsuB3TOwxxGeg==
X-Gm-Gg: Acq92OFnQ/ZnY3bYX3GknWnkUWvQ4funTWN/m9qeThxBOBETzJRDKefy6MOYxwRjRS0
 KRbJu4yVLkT/xbfAKMMap+NKoEOY5441vHgHqXUZRzakFWtxyeDkX6cvw0DB7W+y4UXo5HUMlks
 x4dtnqD2sji4gzQJmZ8tuwL3wpp6oRj3bJhN8QICkEnmys1AMTtEG9BbNxkJV3VI68yzMoG35Um
 geSharGuXtOR8Uk38UjSXX9CXIaflydNO+OwYvgAzrrGBk7CBTWq44Z5jg/TE6+df9SJiRoaM3L
 blWGw21CB4greGtTDBCgoGT13f6x4yzow6VNjq8GdEkTR/dZOogQaGVYEIDtVAKqyzY9+5yLrBM
 KPMqbV8eC0OYF47SuN/k0UV5rXxpCjas2w+r+dHDQYlw=
X-Received: by 2002:a05:600c:1591:b0:490:e281:287d with SMTP id
 5b1f17b1804b1-490ec4c0ceemr144346665e9.1.1781584581733; 
 Mon, 15 Jun 2026 21:36:21 -0700 (PDT)
X-Received: by 2002:a05:600c:1591:b0:490:e281:287d with SMTP id
 5b1f17b1804b1-490ec4c0ceemr144346435e9.1.1781584581140; 
 Mon, 15 Jun 2026 21:36:21 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa96f0esm47190165e9.12.2026.06.15.21.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 21:36:20 -0700 (PDT)
Date: Tue, 16 Jun 2026 00:36:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peterx@redhat.com, alex@shazbot.org,
 richard.henderson@linaro.org, berrange@redhat.com,
 philmd@oss.qualcomm.com, philmd@mailo.com, david@kernel.org,
 clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com,
 jugraham@redhat.com, liugang24219@sangfor.com.cn,
 dinghui@sangfor.com.cn, shan.gavin@gmail.com
Subject: Re: [PATCH v2 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
Message-ID: <20260616002413-mutt-send-email-mst@kernel.org>
References: <20260615100200.266968-1-gshan@redhat.com>
 <20260615100200.266968-2-gshan@redhat.com>
 <CAFEAcA9CT6E8dhEV7Ek6ruT_o2dKUf==2V+U-1WFDOLtYbgeeQ@mail.gmail.com>
 <20260615105556-mutt-send-email-mst@kernel.org>
 <CAFEAcA9Gi43qNZoZcGtq8ioffGwOc_XuhoFAjGx7-bt4U8qfxw@mail.gmail.com>
 <e399ceb9-bc4a-4ba6-8efd-ed2742d0853b@redhat.com>
 <20260615154054-mutt-send-email-mst@kernel.org>
 <22d55870-b521-4002-add7-791bce8ea96a@redhat.com>
 <2535e092-b3ef-427c-9d33-39861b3a43f1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2535e092-b3ef-427c-9d33-39861b3a43f1@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AUH9TgRX06_sGjtvJ1JLpsvZI_OgsWYhOjO1KfE8HTM_1781584582
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Tue, Jun 16, 2026 at 02:22:18PM +1000, Gavin Shan wrote:
> On 6/16/26 7:31 AM, Gavin Shan wrote:
> > On 6/16/26 5:42 AM, Michael S. Tsirkin wrote:
> > > On Tue, Jun 16, 2026 at 05:24:15AM +1000, Gavin Shan wrote:
> > > > Hi Peter and Michael,
> > > > 
> > > > On 6/16/26 1:12 AM, Peter Maydell wrote:
> > > > > On Mon, 15 Jun 2026 at 15:56, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > 
> > > > > > On Mon, Jun 15, 2026 at 11:57:09AM +0100, Peter Maydell wrote:
> > > > > > > On Mon, 15 Jun 2026 at 11:03, Gavin Shan <gshan@redhat.com> wrote:
> > > > > > > > 
> > > > > > > > All ram device regions were turned to be indirectly accessible by commit
> > > > > > > > 4a2e242bbb ("memory: Don't use memcpy for ram_device regions"). This leads
> > > > > > > > to guest hang on attempt to build 'cuda-samples' as reported by Julia. The
> > > > > > > > guest is started by the following command lines, with GH100 GPU card passed
> > > > > > > > from the host.
> > > > > > > 
> > > > > > > > diff --git a/include/system/memory.h b/include/system/memory.h
> > > > > > > > index 1417132f6d..5878727d09 100644
> > > > > > > > --- a/include/system/memory.h
> > > > > > > > +++ b/include/system/memory.h
> > > > > > > > @@ -2897,6 +2897,8 @@ void address_space_register_map_client(AddressSpace *as, QEMUBH *bh);
> > > > > > > >    void address_space_unregister_map_client(AddressSpace *as, QEMUBH *bh);
> > > > > > > > 
> > > > > > > >    /* Internal functions, part of the implementation of address_space_read.  */
> > > > > > > > +void qemu_ram_copy(void *dest, const void *src, size_t n);
> > > > > > > > +void qemu_ram_move(void *dest, const void *src, size_t n);
> > > > > > > 
> > > > > > > New function prototypes in include headers need documentation comments.
> > > > > > > 
> > > > > > > In particular for these, it's really important that we clearly say
> > > > > > > what semantics we are attempting to provide with them, so that
> > > > > > > (a) when we're reviewing or later updating the implementation we
> > > > > > > know what we are trying to provide
> > > > > > > (b) when we're looking at the callsites we know what the function
> > > > > > > is guaranteeing to us and what it is not, and thus whether it's
> > > > > > > OK to use it or we need something els.
> > > > > > > 
> > > > > > > > +#if defined(__i386__) || defined(__x86_64__)
> > > > > > > > +#define HOST_UNALIGNED_MMIO_OK 1
> > > > > > > > +#else
> > > > > > > > +#define HOST_UNALIGNED_MMIO_OK 0
> > > > > > > > +#endif
> > > > > > > 
> > > > > > > We need to do something better than this. We can't
> > > > > > > just say "oh, we trust that on x86 this works": it is
> > > > > > > neither actually true that the compiler guarantees it
> > > > > > 
> > > > > > sorry guarantee what?
> > > > > 
> > > > > Well, that's part of my point about "we need a doc comment":
> > > > > what exactly are we trying to guarantee ? But whatever it is,
> > > > > "hardcoded ifdef that privileges x86" is definitely the wrong
> > > > > answer.
> > > > > 
> > > > 
> > > > Could you please check the following comments (documentation context) for the
> > > > added functions look good to you? Please let me know if there are anything
> > > > can be improved.
> > > > 
> > > > +
> > > > +/**
> > > > + * qemu_ram_copy: copy data to a RAMBlock
> > > > + *
> > > > + * @dest: destination where the data is copied to. It's the pointer returned
> > > > + *        by ramblock_ptr() and its variants.
> > > > + * @src: source where the data is copied from. It can be a regular memory block
> > > > + *       or a pointer returned by ramblock_ptr() and its variants.
> > > > + * @n: length of data to be copied
> > > > + *
> > > > + * The destination is always a pointer to data area of a RAMBlock which can
> > > > + * be for a regular memory block or a MMIO region. The source can be a pointer
> > > > + * to a regular memory block or a MMIO region. Atomicity isn't guranteed by
> > > > + * memcpy() to copy data between those MMIO regions as we do in this function.
> > > > + * Besides, unaligned accesses are well handled on all architectures except
> > > > + * i386 and x86_64 where the unaligned accesses are supported by the CPUs.
> > > > + *
> > > > + * The ensured atomicity and alignment consideration, which aren't needed
> > > > + * by data copy between two regular memory blocks. So performance penalty
> > > > + * is introduced by this function in such circumstance.
> > > > + */
> > > > +void qemu_ram_copy(void *dest, const void *src, size_t n);
> > > > +
> > > > +/**
> > > > + * qemu_ram_move: move data to a RAMBlock
> > > > + *
> > > > + * @dest: destination where the data is moved to. It's the pointer returned
> > > > + *        by ramblock_ptr() and its variants.
> > > > + * @src: source where the data is moved from. It can be a regular memory block
> > > > + *       or a pointer returned by ramblock_ptr() and its variants.
> > > > + * @n: length of data to be moved
> > > > + *
> > > > + * The destination is always a pointer to data area of a RAMBlock which can
> > > > + * be for a regular memory block or a MMIO region. The source can be a pointer
> > > > + * to a regular memory block or a MMIO region. Atomicity isn't guranteed by
> > > > + * memmove() to move data from or to those MMIO regions as we do in this
> > > > + * function. Besides, unaligned accesses are well handled on all architectures
> > > > + * except i386 and x86_64 where the unaligned accesses are supported by the
> > > > + * CPUs.
> > > > + *
> > > > + * The ensured atomicity and alignment consideration, which aren't needed
> > > > + * by data movement between two regular memory blocks. So performance penalty
> > > > + * is introduced by this function in such circumstance.
> > > > + */
> > > > +void qemu_ram_move(void *dest, const void *src, size_t n);
> > > > +
> > > 
> > > 
> > > I apologize, I don't understand what these comments are saying, at all.
> > > 
> > 
> > Sorry to hear that, Michael. There are two things done in the newly added
> > function qemu_ram_{copy, move}(), comparing to the original memcpy() and
> > memmove():
> > 
> > - Data copy or movement on MMIO region(s) using __bultin_{memcopy, memmove}()
> >    on x86, or qatomic_set() on other architecutures, to avoid the unexpected
> >    optimization done by the compiler on memcpy/memmove. Unsafe instructions
> >    can be produced by the compiler's optimization. This fixes the issue resolved
> >    by commit 4a2e242bbb ("memory: Don't use memcpy for ram_device regions")
> > 
> > - The unaligned access is handled by forcing the access size aligned to (src | dest | n)
> >    on non-x86 architectures, comparing to the original memcpy() and memmove().
> > 
> > Please let me know if we're on same page. If we do, I can revise the comments
> > accordingly.
> > 
> 
> I've modified the comments to something as below. Please let me know if it's
> better. The point is to emphasize qemu_ram_{copy, memmove}() are friendly to
> IO regions :-)
> 
> -----> include/system/memory.h
> 
> +/**
> + * qemu_ram_copy: copy data to a guest memory block
> + *

what is a memory block? ramblock?

don't we need something like this for reads?


> + * @dest: destination where the data is copied to. A pointer to a guest memory

@dst?

> + *        block returned from ramblock_ptr() or its variants
> + * @src: source where the data is copied from. A pointer to host memory block
> + *       or guest memory block returned from ramblock_ptr() or its variants.
> + * @n: length of data to be copied
> + *
> + * When the source pointer, destinatoin pointer or both dereference guest
> + * memory blocks, which can be IO blocks (regions).

IO block?

let's not invent terminology pls.

> Under this cirtumstance,
> + * data copy between those blocks is equivalent to IO accesses. It's unsafe
> + * to use memcpy(), which could be translated to IO unfriendly instructions
> + * by the compiler due to code level optimization, resulting in the unexpected
> + * behavior. This function is ensured to be friendly to both IO and memory
> + * accesses. No optimized instructions should be generated by the compiler,
> + * and no unexpected behavior should be observed for IO accesses.

Let's be specific, and brief, and tell user what this does:
Maybe:

	Copy @n bytes from @src to @dst.
	Assumes @src and @dst do not overlap.
	Handles special cases such as uncacheable ramblocks correctly.
	Use this for accessing ramblock in response to DMA/VCPU IO
	and in preference to memcpy.



> + */
> +void qemu_ram_copy(void *dest, const void *src, size_t n);
> +
> +/**
> + * qemu_ram_move: move data to a guest memory block



> + *
> + * @dest: destination where the data is moved to. A pointer to a guest memory
> + *        block returned from ramblock_ptr() or its variants
> + * @src: source where the data is moved from. A pointer to host memory block
> + *       or guest memory block returned from ramblock_ptr() or its variants.
> + * @n: length of data to be copied
> + *
> + * Similar to qemu_ram_copy(), this function is ensured to be friendly to both
> + * IO and memory accesses. No optimized instructions should be generated by
> + * the compiler, and no unexpected behavior should be observed for IO accesses.

unclear how it is different from copy.

> + */
> +void qemu_ram_move(void *dest, const void *src, size_t n);



> 
> > > 
> > > 
> > > > > -- PMM
> > > > > 
> 
> Thanks,
> Gavin


