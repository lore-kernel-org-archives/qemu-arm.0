Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 149E0CD98CF
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 19:42:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZDCQ-0005dd-AT; Mon, 15 Jun 2026 15:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZDCM-0005d8-Nt
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 15:42:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZDCK-0003Ta-HA
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 15:42:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781552533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qi3yLOX+GX7yFtlr/F7eOJTa/nSf4uKiVPbZwlIlxc0=;
 b=TtNg92nvekYmOqgvU/zUNgKi5p+kBjiFvaLmcxLUJlselmILYHzxTEOrbQPcsu7zC7N7Rh
 G95OPpJHkSPuwoCLX8w4aglanEzUssy63tpgg2gBtOCU9WujuzGo6ComvOrv/gij3CqySW
 26iQxIbVAM5eB5cMvUpVc0apzK4sJws=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-KcTWHAMHOSS7-_NO191lOw-1; Mon, 15 Jun 2026 15:42:10 -0400
X-MC-Unique: KcTWHAMHOSS7-_NO191lOw-1
X-Mimecast-MFC-AGG-ID: KcTWHAMHOSS7-_NO191lOw_1781552529
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-4601c9b630fso1791249f8f.0
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 12:42:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781552529; x=1782157329;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qi3yLOX+GX7yFtlr/F7eOJTa/nSf4uKiVPbZwlIlxc0=;
 b=fyHTnFaM+Mrd0FlC1ScyWRCEtN0UdrdoTB11p2Vd7xuMTT9vkVfcZsD+6P6WVYlxOQ
 D7vi+jt1hf6ZpNLSWwnDW3GeIOutSVkRASmqLevPYwV3nqfV1L3YlY+nydXj1AmWBj1y
 ioJgZSDA17xSIWS9Sq4KdQod1cHRvcZpzamldqucSP8fNLl65876fDPHBkFj4ysq8YYl
 zvFilYtwihk89mwo+hwFGR6l8WLMbICfTzfNz+yZCTyToR1E9d7ZU+2G4OYKadrJzTFM
 TmJ3++F/chK745ctgwxteLFv5YuiLF9ZERSQt/5ud+nElYYkHZw0K6BWvg4CFgRA6iB3
 Q9pw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9q2o66LhT0iCzqH+wH7/tV6SjMlZ31uO8LhQoz/Jw7JGDQYAf1clifuMYG6sa7Tp7wR9R+4up8pg==@nongnu.org
X-Gm-Message-State: AOJu0YzAGwj1KycO0i/7p4hezFmZbcqArHmtlCdsqNhqG8Q8vQfhSWoC
 DZSRPMPIApOLHXurDnEZLl59RdKuQ16uWl8wPHCGxc+hWCEMDugJOUBlreh4ez2DQOK+CMUDgJ9
 xU4OzShQP3k7yPx/kskUd0ynqh5xJCxm9cXrC00NZvkEOlEmmXKqAQA==
X-Gm-Gg: Acq92OEBxybUnFbS3akby9lED8ASS5FhNFipBSBdJGfogzCuOcY5qzGtBpJaRMnH5Be
 ++t6wP6cbjzl4pYuxMEH/gCsZJ7RC8cKbO9XM4CWyOn5H9sG6q2IpKQQJA3h0k38D+bpOUqu6fa
 5uPMxTrLdGWc+kkHAqRdh1WldsTh0ejts8fbHgabdHMRNLzyb+d800D0MJlU7BOZdubnkOCYhlT
 UCpJtiE2VM8QAmAklFdkCBooyssktXIgLQL3iTFBqWGbdkg87CYwZMl+RmNwaE5Ad74niEQSBsE
 F4ka1pCcUdkTI8wpzQMKEE6iJ4rT9ZEtFuGBL1F6lqkwEUtPYn5egDkUKqH+IA4VtJMjl9BDDRa
 0pM7aLDfuYGSsh+5d7FUof/Ruz0LiCc/KiUSp56hQAvE=
X-Received: by 2002:a05:6000:1863:b0:461:946f:9bb4 with SMTP id
 ffacd0b85a97d-4619f3abb97mr1148888f8f.23.1781552529008; 
 Mon, 15 Jun 2026 12:42:09 -0700 (PDT)
X-Received: by 2002:a05:6000:1863:b0:461:946f:9bb4 with SMTP id
 ffacd0b85a97d-4619f3abb97mr1148850f8f.23.1781552528528; 
 Mon, 15 Jun 2026 12:42:08 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2cd6c2sm37181798f8f.30.2026.06.15.12.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 12:42:07 -0700 (PDT)
Date: Mon, 15 Jun 2026 15:42:04 -0400
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
Message-ID: <20260615154054-mutt-send-email-mst@kernel.org>
References: <20260615100200.266968-1-gshan@redhat.com>
 <20260615100200.266968-2-gshan@redhat.com>
 <CAFEAcA9CT6E8dhEV7Ek6ruT_o2dKUf==2V+U-1WFDOLtYbgeeQ@mail.gmail.com>
 <20260615105556-mutt-send-email-mst@kernel.org>
 <CAFEAcA9Gi43qNZoZcGtq8ioffGwOc_XuhoFAjGx7-bt4U8qfxw@mail.gmail.com>
 <e399ceb9-bc4a-4ba6-8efd-ed2742d0853b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e399ceb9-bc4a-4ba6-8efd-ed2742d0853b@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 51o6MU2of-m9hGWzLKMQhoPv_ag165KVOxyjStclqhQ_1781552529
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

On Tue, Jun 16, 2026 at 05:24:15AM +1000, Gavin Shan wrote:
> Hi Peter and Michael,
> 
> On 6/16/26 1:12 AM, Peter Maydell wrote:
> > On Mon, 15 Jun 2026 at 15:56, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > 
> > > On Mon, Jun 15, 2026 at 11:57:09AM +0100, Peter Maydell wrote:
> > > > On Mon, 15 Jun 2026 at 11:03, Gavin Shan <gshan@redhat.com> wrote:
> > > > > 
> > > > > All ram device regions were turned to be indirectly accessible by commit
> > > > > 4a2e242bbb ("memory: Don't use memcpy for ram_device regions"). This leads
> > > > > to guest hang on attempt to build 'cuda-samples' as reported by Julia. The
> > > > > guest is started by the following command lines, with GH100 GPU card passed
> > > > > from the host.
> > > > 
> > > > > diff --git a/include/system/memory.h b/include/system/memory.h
> > > > > index 1417132f6d..5878727d09 100644
> > > > > --- a/include/system/memory.h
> > > > > +++ b/include/system/memory.h
> > > > > @@ -2897,6 +2897,8 @@ void address_space_register_map_client(AddressSpace *as, QEMUBH *bh);
> > > > >   void address_space_unregister_map_client(AddressSpace *as, QEMUBH *bh);
> > > > > 
> > > > >   /* Internal functions, part of the implementation of address_space_read.  */
> > > > > +void qemu_ram_copy(void *dest, const void *src, size_t n);
> > > > > +void qemu_ram_move(void *dest, const void *src, size_t n);
> > > > 
> > > > New function prototypes in include headers need documentation comments.
> > > > 
> > > > In particular for these, it's really important that we clearly say
> > > > what semantics we are attempting to provide with them, so that
> > > > (a) when we're reviewing or later updating the implementation we
> > > > know what we are trying to provide
> > > > (b) when we're looking at the callsites we know what the function
> > > > is guaranteeing to us and what it is not, and thus whether it's
> > > > OK to use it or we need something els.
> > > > 
> > > > > +#if defined(__i386__) || defined(__x86_64__)
> > > > > +#define HOST_UNALIGNED_MMIO_OK 1
> > > > > +#else
> > > > > +#define HOST_UNALIGNED_MMIO_OK 0
> > > > > +#endif
> > > > 
> > > > We need to do something better than this. We can't
> > > > just say "oh, we trust that on x86 this works": it is
> > > > neither actually true that the compiler guarantees it
> > > 
> > > sorry guarantee what?
> > 
> > Well, that's part of my point about "we need a doc comment":
> > what exactly are we trying to guarantee ? But whatever it is,
> > "hardcoded ifdef that privileges x86" is definitely the wrong
> > answer.
> > 
> 
> Could you please check the following comments (documentation context) for the
> added functions look good to you? Please let me know if there are anything
> can be improved.
> 
> +
> +/**
> + * qemu_ram_copy: copy data to a RAMBlock
> + *
> + * @dest: destination where the data is copied to. It's the pointer returned
> + *        by ramblock_ptr() and its variants.
> + * @src: source where the data is copied from. It can be a regular memory block
> + *       or a pointer returned by ramblock_ptr() and its variants.
> + * @n: length of data to be copied
> + *
> + * The destination is always a pointer to data area of a RAMBlock which can
> + * be for a regular memory block or a MMIO region. The source can be a pointer
> + * to a regular memory block or a MMIO region. Atomicity isn't guranteed by
> + * memcpy() to copy data between those MMIO regions as we do in this function.
> + * Besides, unaligned accesses are well handled on all architectures except
> + * i386 and x86_64 where the unaligned accesses are supported by the CPUs.
> + *
> + * The ensured atomicity and alignment consideration, which aren't needed
> + * by data copy between two regular memory blocks. So performance penalty
> + * is introduced by this function in such circumstance.
> + */
> +void qemu_ram_copy(void *dest, const void *src, size_t n);
> +
> +/**
> + * qemu_ram_move: move data to a RAMBlock
> + *
> + * @dest: destination where the data is moved to. It's the pointer returned
> + *        by ramblock_ptr() and its variants.
> + * @src: source where the data is moved from. It can be a regular memory block
> + *       or a pointer returned by ramblock_ptr() and its variants.
> + * @n: length of data to be moved
> + *
> + * The destination is always a pointer to data area of a RAMBlock which can
> + * be for a regular memory block or a MMIO region. The source can be a pointer
> + * to a regular memory block or a MMIO region. Atomicity isn't guranteed by
> + * memmove() to move data from or to those MMIO regions as we do in this
> + * function. Besides, unaligned accesses are well handled on all architectures
> + * except i386 and x86_64 where the unaligned accesses are supported by the
> + * CPUs.
> + *
> + * The ensured atomicity and alignment consideration, which aren't needed
> + * by data movement between two regular memory blocks. So performance penalty
> + * is introduced by this function in such circumstance.
> + */
> +void qemu_ram_move(void *dest, const void *src, size_t n);
> +


I apologize, I don't understand what these comments are saying, at all.



> > -- PMM
> > 
> 
> Thanks,
> Gavin


