Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6B4CD484E
	for <qemu-arm@archiver.kernel.org>; Mon, 11 May 2026 22:10:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMYp3-0000iD-LG; Mon, 11 May 2026 18:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wMYoy-0000hh-SZ
 for qemu-arm@nongnu.org; Mon, 11 May 2026 18:09:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wMYox-0001gg-C8
 for qemu-arm@nongnu.org; Mon, 11 May 2026 18:09:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778537390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8lfM790bPPcW9+6QJ2OF4Giuvz/HJzNJe7b9mqE9Dco=;
 b=eF/+R662366o54EJjCDmVhlinIZ+cAFRPxVnJMZ03hV8+xQndhnYDRgmZXcBUeF+TAb66r
 T4YHXsqpDz1rpRJYz7G8FXurmVQfHbVtCenMVunEQJmSn1d8E4tErdNss84zxbaGL6zmTK
 iht+InkyEiIUzh1yB96/iUi0fyiaXj4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-sHdT_I08OPWZkFOKZu1EWQ-1; Mon, 11 May 2026 18:09:47 -0400
X-MC-Unique: sHdT_I08OPWZkFOKZu1EWQ-1
X-Mimecast-MFC-AGG-ID: sHdT_I08OPWZkFOKZu1EWQ_1778537386
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-43ff19e54beso3363907f8f.2
 for <qemu-arm@nongnu.org>; Mon, 11 May 2026 15:09:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778537386; x=1779142186;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8lfM790bPPcW9+6QJ2OF4Giuvz/HJzNJe7b9mqE9Dco=;
 b=Snp2ll153CdCmeEbADgVwK5sesS1hBTnkirOGV5YqHjATfQggbVEr8cEJA7NS/Xdij
 M+U8gQR8OWpbF6PuqlLihU4kCDjDV6UlV2msuuV0nxOq93JDG10RE23xRavevaNGhwZE
 uNHoW+ZLAeXaSv14vupHbQcih1MUbsKlGjbf0LKFlJL+sLXYYKc5PpdLEMzrtegEG6xr
 NY+0qwUag2Iww5ch6MoNFZmZQGE55torWaDeObYGl2iBA/Q5oenCv/g9kivl+1vl0gXk
 1eUuPbrCTYqKDb8K2ta//+gcwi2PTng1LrXKPrW82XeI9Xm8KZsVhKub5+Hqb8T7oGM5
 2dXg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8D0UOX0aA4AfqhFdPM+kuxDvPFNWWLtBFV1fqH33u8xjKc4YH0q5y8jFfGSYtXh9Rooa3txnxJcQ==@nongnu.org
X-Gm-Message-State: AOJu0YzUfaF23Yq50TwMYCqk04BgG2v35KHCggVgo5/k+XL8n5qyrUY3
 lsbxRdahuR7L35/l6vZ1ujUzCpm8hLBdRgMv/EE/A/4Q9fT5+CHSQPhL+k+1oWvAR6z3kPs+MAc
 knBMwkcRu4kNjo4M3Ujdx7ahyLYJH8kqH+JSqwycfqzKZt6xHOTQFMw==
X-Gm-Gg: Acq92OEliQ64TzaIiZtmAIWbz9rJdhpXKw1vBGe8t3TdIEMrrtiBQUVglZS6q9te8Cq
 63ktLKe6/Y2EsvtHyA3qZLBlnurue/yiLfaDKR++W3rYGuIuHDZZO/n9I8XDF0vc1YOcBwYfnd4
 Yfa88n9Q1NQwDRlK9CpC67ZC5ZJsPODkYIo2w1n4yiM7/M9rDQogpvSsWiC6iIfwvcdKkaZzi+B
 PLDtz/owrVqqyTOKd31/9QcP6WDZauOaX0+0Ka9Yyn0fy4SS6LhyyEV1AkZ+PA/O//QZOZ8oBTs
 s4NPyeN1sQosx0byDu9iyCVx9spiOIh/rz3YBUVYMP6OVZ9CUvnqIRw398UA/0+3AfqTnG1rhrR
 8iAXHlh93x7L8WDOM8Ww2lVx4B53qVOc7SXFOxJDP
X-Received: by 2002:a05:6000:25c2:b0:448:659b:abec with SMTP id
 ffacd0b85a97d-45460e3f5f9mr23691016f8f.8.1778537385874; 
 Mon, 11 May 2026 15:09:45 -0700 (PDT)
X-Received: by 2002:a05:6000:25c2:b0:448:659b:abec with SMTP id
 ffacd0b85a97d-45460e3f5f9mr23690981f8f.8.1778537385429; 
 Mon, 11 May 2026 15:09:45 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-48-7.inter.net.il. [80.230.48.7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4548ec6b071sm27715403f8f.14.2026.05.11.15.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2026 15:09:45 -0700 (PDT)
Date: Mon, 11 May 2026 18:09:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Tushar Dave <tdave@nvidia.com>
Cc: qemu-devel@nongnu.org, alwilliamson@nvidia.com, jgg@nvidia.com,
 skolothumtho@nvidia.com, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, marcel.apfelbaum@gmail.com, devel@edk2.groups.io
Subject: Re: [RFC PATCH 0/8] hw/arm/virt, hw/pci: PCI pre-enumeration and
 fixed BAR allocation
Message-ID: <20260511180533-mutt-send-email-mst@kernel.org>
References: <20260508183717.193630-1-tdave@nvidia.com>
 <20260511050459-mutt-send-email-mst@kernel.org>
 <d5190676-11e7-40e8-ab12-da69aa751301@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <d5190676-11e7-40e8-ab12-da69aa751301@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MQCj5aISdwP1bGmTXvI-OErCKYUtkO2t_9EEbMZVs7A_1778537386
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

On Mon, May 11, 2026 at 01:10:43PM -0500, Tushar Dave wrote:
> 
> 
> On 5/11/2026 4:09 AM, Michael S. Tsirkin wrote:
> > On Fri, May 08, 2026 at 01:37:09PM -0500, Tushar Dave wrote:
> >> This RFC introduces a mechanism to specify Guest Physical Addresses
> >> (GPAs) for PCI BARs, allowing explicit placement of guest MMIO BAR
> >> addresses to match host physical addresses for assigned devices.
> >>
> >> On some platforms, P2P DMA is performed between devices within the same
> >> IOMMU group. The PCI fabric ACS is configured to permit direct P2P
> >> without going through the host bridge in order to achieve the required
> >> performance.
> > 
> > Pass this info to guest firmware, let it set bars any way it wants?
> 
> We are using firmware, relying on the existing EDK2-supported mode
> enabled by PcdPciDisableBusEnumeration, where firmware is expected
> to preserve the PCI topology and BAR programming established by
> the hypervisor.
> 
> In our case, the hypervisor is QEMU, which performs PCI enumeration
> and resource assignment before handing control to firmware. EDK2
> then explicitly refrains from re-enumerating or reallocating PCI
> BARs, as this is already a supported firmware behavior.
> 
> -Tushar


I see no advantage in performing pci enumeration in qemu when firmware
is already doing an adequate job of it. If you want firmware to map
specific devices at specific addresses, pass that info along to it.

-- 
MST


