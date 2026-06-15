Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F95CD98C5
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 07:24:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZ1g8-0000ZU-9d; Mon, 15 Jun 2026 03:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZ1g6-0000Z3-4P
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 03:24:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZ1g4-0002LQ-Jk
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 03:24:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781508251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EQJxSgMlGu17ON/GlwS1pzPWXIU9Y1/o+lMyuG1HutU=;
 b=GlF7apuY5IxjO4IBy9mNRSPaF2WepUogs/EFZ1oKjvVCbAy8Q0Pjs4xbgDzH1SszdjBLdK
 oX9A7ctLQYL0ziMENwcl76U7rUSnCIsINQzuLCrXQknbXNoVerxtEvyhiiDkuRDOaEEKw/
 WGh2TZS9oD0XeRf3GizVkfQx0sUrzPg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437--rlHeClaP1m7bhE485qixA-1; Mon, 15 Jun 2026 03:24:09 -0400
X-MC-Unique: -rlHeClaP1m7bhE485qixA-1
X-Mimecast-MFC-AGG-ID: -rlHeClaP1m7bhE485qixA_1781508248
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-45eef10d5ebso1567088f8f.0
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 00:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781508248; x=1782113048;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EQJxSgMlGu17ON/GlwS1pzPWXIU9Y1/o+lMyuG1HutU=;
 b=JNVn7RMONWtcTHA2RpjLIYKGtEGM+U02b898h+QDGGTMY/0PN0+yPN9UuYandlelDv
 gtpUrYKppJhXbxQThtYXD1uaRTrl+FEU5ICEcT26tKOHWfB13wLU7aRy4W2As5hcjEfp
 E0Qi/z3EjsqDy1LzxFm64PG5M8AOkRxFQb2ujd/4jMN4eG2GU4ulxjvt+6goJNYrpimf
 KMJ+zKYou1Dj7in1edGZahMMPwkmtYBpL91jQVAQkP+iMd1w15BuFcDRKdGjVvxA5wyk
 NUSvpt2vXznFM6nKO+zJyTvQGPdYeHtNEIf86W9/w2wYTzlFW8zMAYnO1f827BmNZOMf
 sDPQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ//ebUVj9gwYWdkyvthlpeiIjOmZ5oUe4VySLoCFnpn+Wo1LcLpfQiP8BJv9Z1sG+IRFWndmHTDfQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywgii35c2VlcCcHO8cExkMyzwYHmZC8CeEdy32scqALWsxYmyQQ
 JmQ9uTCajohK4Rh++SiMKw0wh66ErdP+pQcsl0hVkKveqUMdTjPpxVJCfPNYXxdjrbkudCp1WKj
 eUUmCHzZtNIPMCqgzKe5+is0X8ypopGkd34Bcfj2OOe82g2LGqTDOcw==
X-Gm-Gg: Acq92OHlpOmhO2/RGRCKMC9e5MX0KIFDIX4G7xYlED+CZjem9FuwgF+DbBsK82LvGTc
 CxdIjCQXJ8bwF/OkwYXFl7mrU1RjCVvBnGsnuXJc64EBpYbOo9/U1tQNTHHRhfizHsCywS//4bD
 KNwKf5Pw775LtRwW96lFpZZf8thlcw/Lg/tRc0ZnfpuOTQQXtXxVfsVW4aC7w30H7B1p6Qpvw4S
 DYofEUk7PVhFOoKHiVpnE99BfhLxMgjl98NmQTbRP1gJOhYF9Es0P/tktbbpv+GIlKr3CJ1GXhr
 LGSkxFb+DEhnVgFB45CpMWej7wZWLY5hp+HodyPme0vAlJlSTECNu53qUiH0LhHlPBlMb9PvSVe
 99qdSd4NAHTruqajkMKZN9Q4Lss83pksGLNgAfvCfGek=
X-Received: by 2002:a05:6000:2684:b0:45e:ea3a:47e8 with SMTP id
 ffacd0b85a97d-460769303aemr12818173f8f.24.1781508247869; 
 Mon, 15 Jun 2026 00:24:07 -0700 (PDT)
X-Received: by 2002:a05:6000:2684:b0:45e:ea3a:47e8 with SMTP id
 ffacd0b85a97d-460769303aemr12818127f8f.24.1781508247369; 
 Mon, 15 Jun 2026 00:24:07 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26393asm33609422f8f.5.2026.06.15.00.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 00:24:06 -0700 (PDT)
Date: Mon, 15 Jun 2026 03:24:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Gavin Shan <gshan@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, peterx@redhat.com,
 berrange@redhat.com, david@kernel.org, alex@shazbot.org,
 clg@redhat.com, pbonzini@redhat.com, philmd@mailo.com,
 phrdina@redhat.com, jugraham@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH 1/2] system/memory: Use __builtin_mem{cpy, move} in
 accessors of ram device region
Message-ID: <20260615025222-mutt-send-email-mst@kernel.org>
References: <20260612110307.1264798-1-gshan@redhat.com>
 <20260612110307.1264798-2-gshan@redhat.com>
 <223f5f94-b9b7-46b0-8466-5be655203a0e@linaro.org>
 <CAFEAcA-TgP_BM0WQo3rysZmvhNN17Gc_nrSYB6pXn-mvs5w13g@mail.gmail.com>
 <123d9e80-d731-42c7-81cc-71de47bb13d3@linaro.org>
 <20260614084004-mutt-send-email-mst@kernel.org>
 <02d809b0-6396-40dd-a2c5-866028b7cc4d@linaro.org>
 <20260614131704-mutt-send-email-mst@kernel.org>
 <52c2af6c-f494-4e30-bac6-bde2aaf48931@linaro.org>
MIME-Version: 1.0
In-Reply-To: <52c2af6c-f494-4e30-bac6-bde2aaf48931@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gyzeiAr_tp3HtM_xtI2p2f09sh7xentdPFghRkK45V8_1781508248
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

On Sun, Jun 14, 2026 at 06:41:57PM -0700, Richard Henderson wrote:
> On 6/14/26 10:22, Michael S. Tsirkin wrote:
> > On Sun, Jun 14, 2026 at 09:45:51AM -0700, Richard Henderson wrote:
> > > On 6/14/26 08:13, Michael S. Tsirkin wrote:
> > > > Yes, I think it does work because we use -fno-strict-aliasing.
> > > > For bigger sizes we'll need packed because the addresses
> > > > could be unaligned.
> > > ...
> > > > For most host/guest pairs things simply work even for unaligned.
> > > > 
> > > > And yes, guest drivers do do this.
> > > > 
> > > > On classical pci, there are no transactions as such and
> > > > an unaligned access will be split anyway.
> > > 
> > > I'm saying, if you're talking about pass-through to real devices, that won't
> > > work. For instance, AArch64 will trap unaligned accesses to Device memory.
> > 
> > Presumably, AArch64 drivers don't do unaligned at all then?
> 
> Yes.
> 
> > > You need to actually handle unaligned.  Perhaps something like
> > > 
> > >      /* Find unit to fit size and alignment of dst */
> > >      uintptr_t test = (uintptr_t)dst | size;
> > >      uintptr_t lsb = test & -test;
> > > 
> > >      switch (lsb) {
> > >      case 1:   // loop over uint8_t
> > >      case 2:   // loop over uint16_t
> > >      case 4:   // loop over uint32_t
> > >      default:  // loop over uint64_t
> > >      }
> > > 
> > > with the expectation that normally we'll have aligned addresses and size
> > > such that the loop will iterate once.

OK though it is worth looking at assembly and checking how to make it ooptimal.

I don't get why we have default here either, for that
we really should use memcpy for a better perf,
I think VCPUs can't initiate MMIO transactions >8 bytes.


> > > 
> > > 
> > > r~
> > 
> > And ifdef for arches without unaligned support?
> 
> No ifdef.  All accesses produced by the above are aligned.
> 
> 
> r~

but I don't think it's a good idea to have this on x86.

x86 does not need this pile of branches, has a popular closed
source guest we are all familiar with, famous for
it's rich ecosystem of drivers) and it's just
barely possible that an x86 guest on x86 host could
work as long as we do not break transaction boundaries.

Is 

#ifdef HOST_X86_64
#define QEMU_UNALIGNED 1
#else
#define QEMU_UNALIGNED 0
#endif

And then if (QEMU_UNALIGNED) a big deal really?





-- 
MST


