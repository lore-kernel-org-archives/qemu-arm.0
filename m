Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253C5CD37B5
	for <qemu-arm@archiver.kernel.org>; Mon, 11 May 2026 09:51:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMNIG-0000rB-71; Mon, 11 May 2026 05:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wMNGI-0007NC-9j
 for qemu-arm@nongnu.org; Mon, 11 May 2026 05:49:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wMNGE-0003mW-76
 for qemu-arm@nongnu.org; Mon, 11 May 2026 05:49:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778492952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NhdVyNzcUS2qH8/jez6doF+ti3xk1/afh6wD+0/QKiA=;
 b=U4YPkdA/B82CqlnK3QwVmudOMWQ4Rt+HiIpIh0/rlqXCdd5I5VYq7EFGT3RASyA6rG1VSz
 XHJuuVZ90VAXyf5c2SjTGBAy9diXPVHAz1CC+zsIpdc1+fSr+it30mwJAkysimI86wwieZ
 UfWyv6PUUiTPYvKPtpGUWZnBD5HcUlg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-wBKQViTdPI-YcHnDfIH6IA-1; Mon, 11 May 2026 05:09:40 -0400
X-MC-Unique: wBKQViTdPI-YcHnDfIH6IA-1
X-Mimecast-MFC-AGG-ID: wBKQViTdPI-YcHnDfIH6IA_1778490579
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-48a5952c635so46974385e9.2
 for <qemu-arm@nongnu.org>; Mon, 11 May 2026 02:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778490579; x=1779095379;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NhdVyNzcUS2qH8/jez6doF+ti3xk1/afh6wD+0/QKiA=;
 b=hvLMN6Fh1I4aBcnk1z3C+9DJi32hIRKlxs3dhTrB48F+kqObUC+Dg9tnZcvdDJoZuf
 fcgoIp2e8fvb3ZQEFe05Y8WWMBbJ5OFES7EXm0Bd5vaMHnoOrSqXfrZXLnVIkdHabUIX
 RsPJNzpJZCqhL1ngycP6ELBkEpqmGUPQPxwb7KkbNWgpDIRHwW3GXJJWY7DiF1VvdKup
 ST70g6YhZQNxWaHALFCxkdei/9FTuA7KidhG47Nlbl6AOXVl4y+2tmGsp08lN/AqU9fL
 iB93Zya9S53MP4UpUDPf067dXu//DUqbb9xapa8JNDegCQruQD3PcP13wt8aBCky1t1y
 wmfg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/VFdG40QWhfyHNVWRj2GZ9Em4EV2cqlP03Pv92AWhWFiZLcIN/AZoXoLlvWqsm7vfPN9Kf0Dqjkw==@nongnu.org
X-Gm-Message-State: AOJu0YzAVGbfsNf1KJvQAtmabAcYJeYvJXmu/2DNYEptg3xv0OpvWO2e
 n+pL2DaaYEuA82naNpSsHmpsNYptanH/lnexMYtP+X2TtTKzzX+zcQvoQix9F0B/JLZjjU/mIye
 wO1myLGDm8Gyg7ihOKRTE+sp+m7Pi+hPnUmZaHNG7a6ggvXchkNIhXA==
X-Gm-Gg: Acq92OHXZGFzrxtuxGhFRa6aqf/2zdjySa9pwm7QoPud5W2wdJuJp20VBniq/xAI+q8
 0ymeg7AzZfKckohAu1RUQhi46XAQ1iBxWMscowEm6AuUDIgP2iNa0JRsx2OEN5LqiGdd11VX9sw
 G0Bf4OfWyCP+k5pFk+afP5P9yQrG+HGcHmeyrsxo0fbrk41T90UzPM+F0Z/7zQ6ahXa53kyjbU0
 yOi9vclG8zLqqkZMwSR0NhyjPPLu4lp046h1ICG8fi9YbXWC2+Ke/+7nNdJa83IlMTl60Yhvzjx
 8YSCADxN9wLFo84ArACZn6M7YyZtfmjqrlMGvBwD/0v9sxPLynPRW/LsKN6dGaSnLL1YvDYMLmn
 e8VPELClXsvx/s7RbV3gxSdOH/Xp60EzGp6SWY6OU
X-Received: by 2002:a05:600c:4450:b0:48e:8741:fd53 with SMTP id
 5b1f17b1804b1-48e8741fed3mr14251885e9.15.1778490578896; 
 Mon, 11 May 2026 02:09:38 -0700 (PDT)
X-Received: by 2002:a05:600c:4450:b0:48e:8741:fd53 with SMTP id
 5b1f17b1804b1-48e8741fed3mr14251185e9.15.1778490578408; 
 Mon, 11 May 2026 02:09:38 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-48-7.inter.net.il. [80.230.48.7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e6fff9c91sm182612165e9.1.2026.05.11.02.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2026 02:09:38 -0700 (PDT)
Date: Mon, 11 May 2026 05:09:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Tushar Dave <tdave@nvidia.com>
Cc: qemu-devel@nongnu.org, alwilliamson@nvidia.com, jgg@nvidia.com,
 skolothumtho@nvidia.com, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, marcel.apfelbaum@gmail.com, devel@edk2.groups.io
Subject: Re: [RFC PATCH 0/8] hw/arm/virt, hw/pci: PCI pre-enumeration and
 fixed BAR allocation
Message-ID: <20260511050459-mutt-send-email-mst@kernel.org>
References: <20260508183717.193630-1-tdave@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20260508183717.193630-1-tdave@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mK_U5PV2oYt69dW1obf1t7QaYZNf9zrlfPHBRaKnq84_1778490579
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Fri, May 08, 2026 at 01:37:09PM -0500, Tushar Dave wrote:
> This RFC introduces a mechanism to specify Guest Physical Addresses
> (GPAs) for PCI BARs, allowing explicit placement of guest MMIO BAR
> addresses to match host physical addresses for assigned devices.
> 
> On some platforms, P2P DMA is performed between devices within the same
> IOMMU group. The PCI fabric ACS is configured to permit direct P2P
> without going through the host bridge in order to achieve the required
> performance.

Pass this info to guest firmware, let it set bars any way it wants?


