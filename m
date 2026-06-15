Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5973CD98CF
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 14:56:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZ8jo-0003NO-F4; Mon, 15 Jun 2026 10:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZ8jn-0003Mz-65
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 10:56:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZ8jk-00083w-WE
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 10:56:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781535385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ztWkk3Xpe+kM9d9WYrvzWIt2WX06LB0jeIufZc3Qy1Q=;
 b=d+TUxx9fyyPbiYLTMo2ICGnPE5vlpF/kUS39R6GDXlxpx0YCJKblvDAa0JN8qjoc8mlLae
 b0o+DCX5g4jbr28WR6XPsFKNRfMLdDZoIjl7ZIUO28N1XCVMVIlgb6ZcQz8mGwpBKpVqf9
 juP4Cs9mShN5bfv+F9hF6UE8efNEl3Q=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-FLiWU35mNrGRjKZuM7kNvw-1; Mon, 15 Jun 2026 10:56:23 -0400
X-MC-Unique: FLiWU35mNrGRjKZuM7kNvw-1
X-Mimecast-MFC-AGG-ID: FLiWU35mNrGRjKZuM7kNvw_1781535382
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-68b5941a81bso4065594a12.1
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 07:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781535382; x=1782140182;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ztWkk3Xpe+kM9d9WYrvzWIt2WX06LB0jeIufZc3Qy1Q=;
 b=IesonyXixdyGAMi6mHzYc9Wy+z92N0syZ/Rj+W5KUZILHz+CnwMg6skjs4PFBmbngG
 cIb08dmnb7YVM6N/4lXLNMO+kD9w6Dkvsk0knvtVn5eeex2UONpgGiL+Qe0c6pWt8ohD
 VmbVjjV7IamWojvPP09cSgusUV2WJzcOt0t0ykIe8HVQs/HUfCzSkIJ0uH461OE/bnJK
 VXxSZ+GqpHCZOQnkBYAJaf42PN25ibIOcKttOb4ZTsMLLlQs7pMM+dxJK6MRrHAHM7ZW
 WHpH9lQi0uV3Grm+s+Fj5w7sDoMo6xlzg/Qg+DnMmdEvXkrYBHVhk+rVuaQisff1UR5t
 nNXQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8zxj0Xr0jDV9IZfWdC/DAVrwsdw/VsjSVxmQ2VuZbOGlikKdsFrtSTT+yHOOT5Fd6cMABsZPf3xw==@nongnu.org
X-Gm-Message-State: AOJu0YywyD61mFoLz7Lid1b1CmqFGXi6Vzv/6EAH+Sxbpxdu/YAybZPQ
 9/3y87Nb1icn0D5uA6K20g1i/wV+/nqNzw9iU+65NfGsRy9EQtZwc4CcDN6vnHO+tIDozMXbEZU
 sWGIe/iuB4YldyEUd5nPTl+bKhCj6mOaAyvJeid2My3r2aseVtlbXCA==
X-Gm-Gg: Acq92OEnhAm+CQO9k94JlJgpw9tiLBRJXbu8jFsSF/v8Wg8lXOkwzAf5S1CR7JLYHzT
 DlmbIf2OxGd0VZpaoa5IBHVJnGf7KgKq9J/i9r6FeuPcsVvdkeYb8hwSQuOK3PfnOOJsBYVOC+W
 eZ4hQEdoUHdrc4Cw3Jzf0qzErgYvAIoHw/8WtW6GTQ6rSO4cuxrq8+beo5iKCqj0u1WzTZnxHor
 QWPOUuEHeqPCjA9k3Omwpm+l1NqlX/tBGPnKaNm/X0/7537nCKjwFS71Nlfxhq+Edqm8pIOFPIG
 yDK96E7/C3kKKG9XSrdaXy/CzKiTlT72/u8IOdrC72gvTBd1/NuUByM5N4q8EPjBDDXa/7RF5NS
 5/bXLUwdy+M3GCiWCDsg5RR/Ayyr/1GGcK8njrVIyMzU=
X-Received: by 2002:a05:6402:44d7:b0:671:9dec:ba3 with SMTP id
 4fb4d7f45d1cf-69369d7b16emr5140882a12.13.1781535382145; 
 Mon, 15 Jun 2026 07:56:22 -0700 (PDT)
X-Received: by 2002:a05:6402:44d7:b0:671:9dec:ba3 with SMTP id
 4fb4d7f45d1cf-69369d7b16emr5140850a12.13.1781535381579; 
 Mon, 15 Jun 2026 07:56:21 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-693791de4a6sm3546295a12.9.2026.06.15.07.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 07:56:21 -0700 (PDT)
Date: Mon, 15 Jun 2026 10:56:17 -0400
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
Message-ID: <20260615105556-mutt-send-email-mst@kernel.org>
References: <20260615100200.266968-1-gshan@redhat.com>
 <20260615100200.266968-2-gshan@redhat.com>
 <CAFEAcA9CT6E8dhEV7Ek6ruT_o2dKUf==2V+U-1WFDOLtYbgeeQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9CT6E8dhEV7Ek6ruT_o2dKUf==2V+U-1WFDOLtYbgeeQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: t5NzpjzOLOQ9esQ9oZRMcjPl1Z6NysWzyt9s7ockTlM_1781535382
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
> neither actually true that the compiler guarantees it

sorry guarantee what?

> even
> on x86, nor is it the case that only x86 can do unaligned
> accesses to normal RAM.
> 
> thanks
> -- PMM


