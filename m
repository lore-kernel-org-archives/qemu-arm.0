Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D1ECD98E1
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 09:52:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZQSj-0001Mh-6E; Tue, 16 Jun 2026 05:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZQSh-0001MR-Mn
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 05:52:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZQSg-0007RE-BW
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 05:52:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781603521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l+uUuDWK56fj81QKZqXUTI40UshF+we+uBmMzzqVVw4=;
 b=QoQQQesjTJ/GJrDXMAjOp7VTpLDhF+OoSxfCnXT8URBzVPnlWd0yKDn8VAg5bOmE8x/DKq
 hSF0hU5ggtqf44RHjkVg2fLg7ZcNVFbqO8fwQqTwbWCJx4ChtGyUiKqfY+YGILpjvDG6RP
 9MxvDQ0mKIO/xsx1BlZGuSlY9XnbGlc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-AVx1mR3oNFq_huc2EkFoVQ-1; Tue, 16 Jun 2026 05:52:00 -0400
X-MC-Unique: AVx1mR3oNFq_huc2EkFoVQ-1
X-Mimecast-MFC-AGG-ID: AVx1mR3oNFq_huc2EkFoVQ_1781603519
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-490b93debc8so44817415e9.1
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 02:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781603519; x=1782208319;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l+uUuDWK56fj81QKZqXUTI40UshF+we+uBmMzzqVVw4=;
 b=O6lQcB97oe2nFARsl2L4senQxev8byD1X37Bv4/f5+byBUyK7agXC2uCeG+u6oocfw
 wrDykfwmDCVHFoqlrSi0zqHGa1fKl4pTSrv5614dlnDjhh+gGOgI7EbxvSmVc3q+ScPH
 qajHc2Qnndi9FdLOa1OxZ9Ogr69eseZGiMpUqDmCRAwWT/RUG4JsA5MC/lf24zYUqJJp
 TZmcAnp1ULgeziB2vgEy08eg0uyq0y0ImMteNtgO8+WpfLi76SY25X/SMqToCUiXmXPJ
 jEW/funK+C6xKzMTAjR0J18a4U5ReeuVb4yK1fylHuHluV+PfTrlhG5WIL/SIDFf1Fq+
 4jQw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/gt6s/ogQ+Df1J7GSm01kCCcT+K8aMBwrvLUFOMTMlWWiNcqYRac4f4zU2BAzwRw6H+JcWy6RyMQ==@nongnu.org
X-Gm-Message-State: AOJu0YzRs+SeD2OnfY1B5tfxjvQW0ckb1/asox+RMWySCEP36+SLKkC6
 8fC3yKNlfEGXBFxeHpaJ22zzpFP4K2YYgadp3PJjM41zJtOE5ybqyBZ4g3LajDZjWsMejtv8r1x
 /tV5EA50xjz9sJMUghvSaqzqTVdF/9dCh/6zFBzn0VIM0Caqw3dQemA==
X-Gm-Gg: Acq92OGwiuKyyC/bE52ooMjO0pAA2Ku9pdewr3l7QoV3GtMFX1PPpeU1sNq+zAEHx8+
 TuqKcNvx1PEVY41kJ6yrHY9qxfsShZn+IHRRmy9qna/0HXKXkduWpIMhw6cVFxF1W/z8AsqWyXw
 rTs1JqXw2iBs9CYdVh/smVgtep/hJ0SGyP7tcL6zabyw9cwtIOHHkTmY/2jGDWnjB+KUIWIBg2T
 gwQylAB0m4RndoML6M65eEjNI/0+6pnEBpPq6mNCK6NqH5qhafKuG8haYQUVgFRhd42jJLtHqMh
 /djinnBrO/pVwrSInnlih/aclMMnLIwkXdPTSJypZ54/35widYAuq/Fu7BtLW9vwL/2yEOpKTXM
 hk5XKiI+ie+0fXs/E9W/HS1/3jTGeDTUt7YsoISO9bq0=
X-Received: by 2002:a05:600c:220d:b0:490:4e3e:b483 with SMTP id
 5b1f17b1804b1-492200c06e7mr142448325e9.22.1781603518562; 
 Tue, 16 Jun 2026 02:51:58 -0700 (PDT)
X-Received: by 2002:a05:600c:220d:b0:490:4e3e:b483 with SMTP id
 5b1f17b1804b1-492200c06e7mr142448005e9.22.1781603518066; 
 Tue, 16 Jun 2026 02:51:58 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa890d8sm73585125e9.10.2026.06.16.02.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 02:51:57 -0700 (PDT)
Date: Tue, 16 Jun 2026 05:51:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, skolothumtho@nvidia.com,
 nicolinc@nvidia.com, nathanc@nvidia.com
Subject: Re: [PATCH v2] hw/pci/pci: Enforce pci_setup_iommu_per_bus() is
 called only once per bus
Message-ID: <20260616055142-mutt-send-email-mst@kernel.org>
References: <20260603124415.1120808-1-eric.auger@redhat.com>
 <CAFEAcA8djCh2kL71Sa_6tRikiGT7PU=12yqJwrRuWFESSx+Xbw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8djCh2kL71Sa_6tRikiGT7PU=12yqJwrRuWFESSx+Xbw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pDU-FR8f0AUk8SMrMLHIlet1Ju0R3uLTspsbSPzFVLI_1781603519
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

On Tue, Jun 16, 2026 at 09:47:55AM +0100, Peter Maydell wrote:
> On Wed, 3 Jun 2026 at 13:44, Eric Auger <eric.auger@redhat.com> wrote:
> >
> > Currently it is possible to attach several arm-smmuv3 devices to the
> > same bus although it is a wrong setup.
> >
> > Change the prototype of pci_setup_iommu_per_bus to pass an error
> > handle. This latter is set when iommu_per_bus is already set and
> > used by the single caller (smmu_base_realize) to report a useful
> > error to the end-user.
> >
> > While at it document pci_setup_iommu_per_bus callback in the header.
> >
> > Fixes: 66d2f665e163 ("hw/arm/virt: Allow user-creatable SMMUv3 dev instantiation")
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > Tested-by: Nathan Chen <nathanc@nvidia.com>
> > Reviewed-by: Shameer Kolothum <skolothumtho@nvidia.com>
> > Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> 
> I'll take this into target-arm.next as it's a fix for a function
> that's only used by the arm SMMU.
> 
> thanks
> -- PMM

Pls do.
Acked-by: Michael S. Tsirkin <mst@redhat.com>

-- 
MST


