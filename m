Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42549CD98CE
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 19:52:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZDMC-0007vf-VF; Mon, 15 Jun 2026 15:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZDM5-0007tk-P6
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 15:52:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZDM1-0006kc-3J
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 15:52:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781553136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iW2O3Arlf3qHNxDiahWee/RaVc7qOF9kDwfA1DqcqEQ=;
 b=CEdqNKY5MsUuCn31dP5k2PCp/VS7NfNJ9H1ZUuJ6eHJrpqAzK3eeaMRSdB+7gwKmNZt4GN
 e34nsoMEBLdAe3RL+kNRSZF6MlE3BAwTAq52o9jgwWeTNVPPzNNhZarHVGRJs8AN7zktp5
 zZSnln6XiRsndb89dP/jh36kvRVsZdc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-tntA6smUPkCBxQkKQxkbrw-1; Mon, 15 Jun 2026 15:52:13 -0400
X-MC-Unique: tntA6smUPkCBxQkKQxkbrw-1
X-Mimecast-MFC-AGG-ID: tntA6smUPkCBxQkKQxkbrw_1781553132
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-490dad70f95so38699895e9.3
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 12:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781553132; x=1782157932;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iW2O3Arlf3qHNxDiahWee/RaVc7qOF9kDwfA1DqcqEQ=;
 b=J3MU0my8A0F45+OH4cMEXUbKe2Sydt1VjHNEA9N93yVvxA3w7im3k5DJuwr9dz9xEK
 JaIRE7mQDCCRbJiUbzAKXDP0Sw43Bl1t4cZ6ILBe3wYkranuwWS2n7qOi+5im04lOyob
 /NfYEVD89RvoFci86q2r033gfmroaMt2nQ4sTm/53sY9TwzoKExZCuUU0MuDkeUf4ccs
 wU0V8y6p/UGgPrDFZq2cYLjCaO9+xNyNH7ib9Hf3hFcA1SlEhNuPdyA7MZXlzjxcqtkb
 RMblM6unt7zERhiqSb73KG3mRqPSIgZAnrmdwAhQtWfUWX3vJxccQ1tM7KkYYITagksW
 lAGg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9nZ+fhGN9x84aYVRSIP46TgsRTRQN7gi3q3vSDWOKuivR/adxwvG32hsOGZf8gKB3NEdb/TCrYbg==@nongnu.org
X-Gm-Message-State: AOJu0YwD3hL6jXhC4RDYcYQzkTeL9GsPLdkuDMCrn/sdaJDhV1vxII/S
 f3pP6qY8hKnecFBOmKEhe03p63d+8SqTa9EVUJEA8Oh+wvJr6ncxDpkW2b5/gVMw1Uvw4Kimz/c
 FKxfIn2rNuZgKmgYWwp3D7TDRAG/xGyutwVs2IqA0nHemVdbvXaOeWw==
X-Gm-Gg: Acq92OEJADLdXTRGhBShswZiJigh/8YfqADHeR5/NF2iCipjM+TZyN+Z5vDw2lJCLDb
 STQaoSY//Y8Y8a27vVWalTfbqnAKYrNK+GDhfGD9ctZF8zccf2pjbNM/wIU78zt/e1rvwJtAqXi
 3GXI9kASIdNra/jDTdQe9j1C6VapqS1nWHXTbm85GWg8HvVmL4fKGXfLgKIVATjkHxewJwI8aDY
 Q6aNmE2Kl7stDGcQnQTUk2TB/fJ5hrUg3yWEYQ2eusqYjO/AEEX2hmRbRgA3UznWP+PhQ6Sq61q
 IXr61VbykWSA3kqpielndgMXBGvLrvOzUN0KAoQ97aRPuCGJTXPrmNqskOqueFMFrZKw0Sai9nF
 l6SWOcqGD3LJ7IxwnxIlzZ3PNJUKNv9juznaDLxExmTk=
X-Received: by 2002:a05:600c:4215:b0:490:bb3e:30b0 with SMTP id
 5b1f17b1804b1-490ec4c0ce3mr127252285e9.4.1781553131648; 
 Mon, 15 Jun 2026 12:52:11 -0700 (PDT)
X-Received: by 2002:a05:600c:4215:b0:490:bb3e:30b0 with SMTP id
 5b1f17b1804b1-490ec4c0ce3mr127252025e9.4.1781553131229; 
 Mon, 15 Jun 2026 12:52:11 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f263945sm37889839f8f.8.2026.06.15.12.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 12:52:10 -0700 (PDT)
Date: Mon, 15 Jun 2026 15:52:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peterx@redhat.com, alex@shazbot.org,
 richard.henderson@linaro.org, berrange@redhat.com,
 philmd@oss.qualcomm.com, philmd@mailo.com, david@kernel.org,
 clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com,
 jugraham@redhat.com, liugang24219@sangfor.com.cn,
 dinghui@sangfor.com.cn, shan.gavin@gmail.com
Subject: Re: [PATCH v2 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
Message-ID: <20260615154913-mutt-send-email-mst@kernel.org>
References: <20260615100200.266968-1-gshan@redhat.com>
 <20260615100200.266968-2-gshan@redhat.com>
 <CAFEAcA9CT6E8dhEV7Ek6ruT_o2dKUf==2V+U-1WFDOLtYbgeeQ@mail.gmail.com>
 <20260615105556-mutt-send-email-mst@kernel.org>
 <CAFEAcA9Gi43qNZoZcGtq8ioffGwOc_XuhoFAjGx7-bt4U8qfxw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Gi43qNZoZcGtq8ioffGwOc_XuhoFAjGx7-bt4U8qfxw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ijzt9sID9pxHSq9FWSq17DNo2nFf-80NPed8Vjmwgh8_1781553132
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

On Mon, Jun 15, 2026 at 04:12:40PM +0100, Peter Maydell wrote:
> On Mon, 15 Jun 2026 at 15:56, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Jun 15, 2026 at 11:57:09AM +0100, Peter Maydell wrote:
> > > On Mon, 15 Jun 2026 at 11:03, Gavin Shan <gshan@redhat.com> wrote:
> > > >
> > > > All ram device regions were turned to be indirectly accessible by commit
> > > > 4a2e242bbb ("memory: Don't use memcpy for ram_device regions"). This leads
> > > > to guest hang on attempt to build 'cuda-samples' as reported by Julia. The
> > > > guest is started by the following command lines, with GH100 GPU card passed
> > > > from the host.
> > >
> > > > diff --git a/include/system/memory.h b/include/system/memory.h
> > > > index 1417132f6d..5878727d09 100644
> > > > --- a/include/system/memory.h
> > > > +++ b/include/system/memory.h
> > > > @@ -2897,6 +2897,8 @@ void address_space_register_map_client(AddressSpace *as, QEMUBH *bh);
> > > >  void address_space_unregister_map_client(AddressSpace *as, QEMUBH *bh);
> > > >
> > > >  /* Internal functions, part of the implementation of address_space_read.  */
> > > > +void qemu_ram_copy(void *dest, const void *src, size_t n);
> > > > +void qemu_ram_move(void *dest, const void *src, size_t n);
> > >
> > > New function prototypes in include headers need documentation comments.
> > >
> > > In particular for these, it's really important that we clearly say
> > > what semantics we are attempting to provide with them, so that
> > > (a) when we're reviewing or later updating the implementation we
> > > know what we are trying to provide
> > > (b) when we're looking at the callsites we know what the function
> > > is guaranteeing to us and what it is not, and thus whether it's
> > > OK to use it or we need something els.
> > >
> > > > +#if defined(__i386__) || defined(__x86_64__)
> > > > +#define HOST_UNALIGNED_MMIO_OK 1
> > > > +#else
> > > > +#define HOST_UNALIGNED_MMIO_OK 0
> > > > +#endif
> > >
> > > We need to do something better than this. We can't
> > > just say "oh, we trust that on x86 this works": it is
> > > neither actually true that the compiler guarantees it
> >
> > sorry guarantee what?
> 
> Well, that's part of my point about "we need a doc comment":
> what exactly are we trying to guarantee ?

we are trying to guarantee that host transaction sizes match what
guest requested as closely as possible.

> But whatever it is,
> "hardcoded ifdef that privileges x86" is definitely the wrong
> answer.
> 
> -- PMM

why is it "definitely a wrong answer" if a specific host architecture 
supports originating transactions that other host architectures lack?
should we intentionally break setups that could initiate unaligned
accesses and work fine just because some other setups have hardware that
simply can not initiate unaligned accesses?

-- 
MST


