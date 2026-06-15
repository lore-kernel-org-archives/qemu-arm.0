Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965E0CD98C5
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 14:49:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZ8cX-0007r9-0K; Mon, 15 Jun 2026 10:49:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZ8cJ-0007o2-JX
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 10:48:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZ8cD-0005cb-Gu
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 10:48:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781534919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w1Es2Spg2VT9N+pKESs0oJuELphDbqZdwOvdP3uQs80=;
 b=AhACJeZ3ww3LLaPyr53/ZydJk8g2VOyhYrwMctBMgyKNJ7vVpjdQrUTVNkNjXlWPYmC8ju
 Gwiq5MUt3DZjxQ/EjkkpXbKfq+6G/jYwU1ZmxllT4/1Rmg4F6ps8eJlM7Glv1RIZgDVDPh
 GU0cIyvH4ik5GmBmpVwZ9M6j8QnTYrc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-lsnyGNSJNhmOvnkzW1bS5w-1; Mon, 15 Jun 2026 10:48:37 -0400
X-MC-Unique: lsnyGNSJNhmOvnkzW1bS5w-1
X-Mimecast-MFC-AGG-ID: lsnyGNSJNhmOvnkzW1bS5w_1781534916
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-490ae461f8dso26258665e9.1
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 07:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781534916; x=1782139716;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w1Es2Spg2VT9N+pKESs0oJuELphDbqZdwOvdP3uQs80=;
 b=iQgyvl7xOzZlB0b1TYzPPe9cBV9oha32gVJJiqT64W4wKc0NCxA7d+LcGsXqes/eqO
 TO8MaSNlHzy5yK3ztMGjhRllaB9cLmR9smRdh7SryquHI/8EAou3HFJ9C8HfmcWwNJzk
 wM2Cf5OZdp7cT3is2oGnJXyhtDS2gA9CyEPshJ7aS+h00YQ+xOd7vW9dZJP4SXly+YGQ
 KwDziI49iRh5W3wFeIdidVB7xbybUnrjmK9wrcq34mNwBSG53dJsTX71HN6tRqo1RrkB
 J8qESvTJsFSE9vNSb4wo6y21dSttBm6kVZ4A1/0Dd33EBREZYRHHEo+44YIIvUcGLma6
 9KhA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9QQwuWMzoAkeRX5Q/gBhqw0IianBKeVHsrL08Y1OOm4cscNIN3SmuK9aD0jHexyzr61U0sSubnHA==@nongnu.org
X-Gm-Message-State: AOJu0YzR3NjghUfXpJTNPfzuUcSg0dr2qTbUcSTvKbC+9lrXFNcWM9Rs
 k/cP2M+AuHcAiUEZeKUo3w18MxBqJG6m5PJGDDPZq5ynkzq8WeKQJaDGD3Sb+pAl8Di5aCxxXKn
 T3bk220On5DScoWmZI8MFUWiA3O6lc52y0LL8p5BZ05DtddZXWtHa5A==
X-Gm-Gg: Acq92OHGyj7/CMNR7YlFCRp5/NGaGKACBsXN6of3P8bXLOzOHOUmSMWtvtRsoKcdyac
 5UmMFatzTPGRiwR4BSHCHIFMMOg9T+mjbXtrognui2et6wQ4GIeCRxvoYk+8DASE2r49KqTKkFi
 ErasVjUgI/AwP1Zunv4VYV5TnJQtaGyA2HsZf0Y2MbNCASZgfqm/EEu0DPAkQiiRUq8YJom2uc+
 7pDUZsJrWlJdKbm+H3hgpsUP4BZ5U8v7aDBexdB+KGLtXmQOBMiqdLlFRXqHNC+XL/fyNbE1Irf
 BJnZOjNKTMHvGkxk+LqfsjuEyVj0kEEueJuG+91UMc7wqiTKKRa0U9+H0P8w2Kkj9nXb+OQk/Y6
 KqasGnDxtlSQ9yMScg/Dadx35D835QNdPESnGvu5itDM=
X-Received: by 2002:a05:600c:4713:b0:491:7325:39c4 with SMTP id
 5b1f17b1804b1-49220164d3bmr133860565e9.34.1781534916328; 
 Mon, 15 Jun 2026 07:48:36 -0700 (PDT)
X-Received: by 2002:a05:600c:4713:b0:491:7325:39c4 with SMTP id
 5b1f17b1804b1-49220164d3bmr133860035e9.34.1781534915642; 
 Mon, 15 Jun 2026 07:48:35 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2c473bsm39144773f8f.28.2026.06.15.07.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 07:48:35 -0700 (PDT)
Date: Mon, 15 Jun 2026 10:48:31 -0400
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
Message-ID: <20260615104646-mutt-send-email-mst@kernel.org>
References: <20260615100200.266968-1-gshan@redhat.com>
 <20260615100200.266968-2-gshan@redhat.com>
 <CAFEAcA9CT6E8dhEV7Ek6ruT_o2dKUf==2V+U-1WFDOLtYbgeeQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9CT6E8dhEV7Ek6ruT_o2dKUf==2V+U-1WFDOLtYbgeeQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zN9vcfIlk11S2qPsU5WJ-D0c3gvjXROtEGrl0WXrobM_1781534916
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

On Mon, Jun 15, 2026 at 11:57:09AM +0100, Peter Maydell wrote:
> On Mon, 15 Jun 2026 at 11:03, Gavin Shan <gshan@redhat.com> wrote:
> >
> > All ram device regions were turned to be indirectly accessible by commit
> > 4a2e242bbb ("memory: Don't use memcpy for ram_device regions"). This leads
> > to guest hang on attempt to build 'cuda-samples' as reported by Julia. The
> > guest is started by the following command lines, with GH100 GPU card passed
> > from the host.
> 
> > diff --git a/include/system/memory.h b/include/system/memory.h
> > index 1417132f6d..5878727d09 100644
> > --- a/include/system/memory.h
> > +++ b/include/system/memory.h
> > @@ -2897,6 +2897,8 @@ void address_space_register_map_client(AddressSpace *as, QEMUBH *bh);
> >  void address_space_unregister_map_client(AddressSpace *as, QEMUBH *bh);
> >
> >  /* Internal functions, part of the implementation of address_space_read.  */
> > +void qemu_ram_copy(void *dest, const void *src, size_t n);
> > +void qemu_ram_move(void *dest, const void *src, size_t n);
> 
> New function prototypes in include headers need documentation comments.
> 
> In particular for these, it's really important that we clearly say
> what semantics we are attempting to provide with them, so that
> (a) when we're reviewing or later updating the implementation we
> know what we are trying to provide
> (b) when we're looking at the callsites we know what the function
> is guaranteeing to us and what it is not, and thus whether it's
> OK to use it or we need something els.
> 
> > +#if defined(__i386__) || defined(__x86_64__)
> > +#define HOST_UNALIGNED_MMIO_OK 1
> > +#else
> > +#define HOST_UNALIGNED_MMIO_OK 0
> > +#endif
> 
> We need to do something better than this. We can't
> just say "oh, we trust that on x86 this works": it is
> neither actually true that the compiler guarantees it even
> on x86, nor is it the case that only x86 can do unaligned
> accesses to normal RAM.
> 
> thanks
> -- PMM

Why normal RAM? It explicitly says MMIO.
x86 seems to be the only arch that can do unaligned MMIO?


