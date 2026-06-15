Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183F9CD98D6
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 07:58:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZ2Cx-0007bU-GS; Mon, 15 Jun 2026 03:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZ2Cv-0007b7-M2
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 03:58:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZ2Cu-0007Cs-83
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 03:58:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781510287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=46pzWLSO5Psz//DzR2GWC2FzttIaD53VEUgfhhKiAmU=;
 b=TMHZ/wvg8CEMdP3UaOi5hyTcXY/fwU+2E8w92M06MNvi7WJ7N3AEvBA14y/Z+mIKSnG9Ie
 rUJe++j6hNGxi+qjL46BATxGIA/nnzZalAk71/PxScERF5ax3bHnCtuK9NCkpofVLB1deE
 RvLewDN9GeQc3dbjmA6XEKrYcX1kLkw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-b6fiTvDZPXW89_2vjr9f6Q-1; Mon, 15 Jun 2026 03:58:06 -0400
X-MC-Unique: b6fiTvDZPXW89_2vjr9f6Q-1
X-Mimecast-MFC-AGG-ID: b6fiTvDZPXW89_2vjr9f6Q_1781510285
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-490ae461f8dso22864525e9.1
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 00:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781510285; x=1782115085;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=46pzWLSO5Psz//DzR2GWC2FzttIaD53VEUgfhhKiAmU=;
 b=T5PIF7/xN1tmAGSxkykkRX5wzxdhkh8eZHW29TV1a3bi00nlpTRJZRITQCO3udOq0s
 DlUY+EmbJuMvrPWjbDMOlxArpydfIY+U6gwJx2A2cbqUAjOrORKhG1RsLEeVI8h7tfps
 1bds2Z8tZkViTR81T8+aLvaMKul8KTb4jWIJr9gzlfG4vSRmIi5zSHdcMXeV4faWTtHP
 AN/xYkcmQA6ThWKd/Yg0YDcpnc7TMj4sn/T/uOdeVpbE4LjddM8j3orydzig5FDnFUHU
 BF07bayADbGO/q116QuKrVRRQ+mkIbhPjRhTHOkuAo7mXd57xdKlsE8p4cVKdVA2bV2I
 5IFQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ97D9UPOooIlzzGzo9fvjRs/5aEsq7JOH3Uv4/11mD8adBiiIw7GF4vpI1wCtQK9fsPI9zWbudpJg==@nongnu.org
X-Gm-Message-State: AOJu0YwRfaseScmNDpBljifi+tLo23Vt0prDqOl76oMzOBWLajs3XhQE
 ZDOa79Q1aWM3w/IBVRQE0STyrsPKuumRwTTCihxCeWp0sg7XnJndQ2FBF7fw8/5rAKTNJPhAg5w
 D39u3peXhW5lp69vv/T1n9HcugQw1/GFBzLwhbpOIallggzR2DzEUlw==
X-Gm-Gg: Acq92OFX8mNRDlHSj6b1UbpFdAcbrAj4byoEBl+24eYtw32BIS1jI9U75Ku3UPFW33o
 nGEP/Vj/b96sC6IYExBLwji5Cx6gKERjqa4CpkwCjUdpvB+wIXbVAXEbC0J2hcEXl9r1Jw13yIn
 I5ZAbg2H+2l1Itl87uCykdbiYbu24qSxz2u7pa+DlV0/SmUPD6uhmaarqSEzxIATKrx9kiELjgj
 SXk3OEfdGqtfBw6Ik1PpHq3I6IDNC8lIx8PvGST5GwMCJz/KQElFWjpxRR7CspCPUrQZZLmWJ9V
 qAPG4JINc5N5OrpTn/RdBtpODQnsyTVGNnkIj7B3sKOa72h/bdqxKJDTBI2pxvjIxk9myeqzrZx
 YcnIr9O9Pta4n1H55ucqY5kSbCc2RPPsJgGdx+DZQiQ8=
X-Received: by 2002:a05:600c:8b16:b0:490:9804:afdc with SMTP id
 5b1f17b1804b1-4922011dfccmr118580625e9.23.1781510284410; 
 Mon, 15 Jun 2026 00:58:04 -0700 (PDT)
X-Received: by 2002:a05:600c:8b16:b0:490:9804:afdc with SMTP id
 5b1f17b1804b1-4922011dfccmr118579985e9.23.1781510283823; 
 Mon, 15 Jun 2026 00:58:03 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922031b21dsm222512285e9.6.2026.06.15.00.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 00:58:03 -0700 (PDT)
Date: Mon, 15 Jun 2026 03:58:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Gavin Shan <gshan@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, peterx@redhat.com,
 berrange@redhat.com, david@kernel.org, alex@shazbot.org,
 clg@redhat.com, pbonzini@redhat.com, philmd@mailo.com,
 phrdina@redhat.com, jugraham@redhat.com, shan.gavin@gmail.com
Subject: Re: [PATCH 1/2] system/memory: Use __builtin_mem{cpy, move} in
 accessors of ram device region
Message-ID: <20260615032545-mutt-send-email-mst@kernel.org>
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
X-Mimecast-MFC-PROC-ID: B5C34erott1VexhjAZSgF_CxItw7lywHqOXZAKWWNoo_1781510285
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

So something like:

#if defined(__i386__) || defined(__x86_64__)
#define HOST_UNALIGNED_MMIO_OK  1
#else
#define HOST_UNALIGNED_MMIO_OK  0
#endif


and then we can check that.

-- 
MST


