Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp4246204njc;
        Wed, 20 Nov 2024 13:15:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUw5vBoIxYq6A1Ja2ioxMUodQ1YrU5ftgWFgztgx2tEJ2Ji0hInfOkQ2gtgDOrl+M6Pjioag7BHoVMK4Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHAOFjNu3roSadWKPB/dNyxCuq/dO3oQu4p5xTC9ZDlTnPcLFzA+uXci7LeqDe8dJoPsMcP
X-Received: by 2002:a05:620a:4055:b0:7b3:5858:1287 with SMTP id af79cd13be357-7b42ee856e9mr589054485a.44.1732137338679;
        Wed, 20 Nov 2024 13:15:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732137338; cv=none;
        d=google.com; s=arc-20240605;
        b=I01lEAcOU5VH6w5Vs0m3LVsvDnAChW0v8lWqPXxU77/KH/wC4P5JVS406GZ5B+XOJG
         yDwe+IgrRyRMET+ljnavcmXwq5yms96WVTNzOJH2H+qRUYx1Vk6oL1owDkte3MybBIzX
         zhrO4rxrJ/dMOBWwzNIm1/ZKUyoXTt43D59Cw/26O/rwSIa02PlfEavZPQ3oQwaF9tGb
         wjIJIWE323tJdzlhJcdepX76N8ATlBwabdoYkgKRXZUZzHZ+2xxPKgGv7mh2sPUXkQvR
         MTZtixdX9++zQaGmrBQqD70R+dOy/AbdAgwMxlvo3RoaFKVFN44px3cMHgmnW6oTDzk3
         /TSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :in-reply-to:mime-version:references:from:dkim-signature;
        bh=vM0gNuk6NgkYQ1uz3u95XWEGU7nhPszOJ4XF9ZuwBN4=;
        fh=8pZfvYyIMqDUI+SX66irwxwEA1Mvczkjocm0C3UPY84=;
        b=G308biX1yDyexVYi+rmcf/PijEIsW9zlwXGrjW2NZkiTJD3+UC2KPq8BZ9+Gzw29EQ
         LCASG9VMN/i0cHc8e45dEtKPU0i/yJaVVZ0iqLcHcgZphEz50GJJ87NqFIB2HL+4xuBm
         OQVAt1sn/IDcHQSgSQj2oGAaJo0TaAnqMLJexa7afYjY1Bu/U5iWkmzr+gNdssoJoq4j
         GrCxWrkJshHmG9O2vVP3F1H868sCZsk1B0SkyTuqcHaS+xHZIDqYf8gPVxUEpdcsPcc/
         Z/kTseu5BL9CZKIhYqIE58CeGlwjJGvZ1JZNWCqCgNZRmPmCzNxwOpbB8U7K+WVKVZgj
         ElJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L0FugTHP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b479dba484si307069885a.20.2024.11.20.13.15.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Nov 2024 13:15:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L0FugTHP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tDs2V-0000Hx-UO; Wed, 20 Nov 2024 16:15:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1tDs2T-0000H2-RP
 for qemu-arm@nongnu.org; Wed, 20 Nov 2024 16:15:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1tDs2R-0004qR-R3
 for qemu-arm@nongnu.org; Wed, 20 Nov 2024 16:15:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732137301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vM0gNuk6NgkYQ1uz3u95XWEGU7nhPszOJ4XF9ZuwBN4=;
 b=L0FugTHPBWdhdcfSrZGZ9EZSLKw3fglHb+9exH4qbRpyBu8lx5hZakxm9ks31pWksUsoko
 ht45R1XFG+H0Pu4e6mfZ3tiNVx/txa1D8QhMY1cgRAF7aXax38yUC92cuNsfgetOsZOfP9
 8U+CZlWpjuWzAFoT/5WqHVhFJrYEOLw=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-EUIhYzOrOlmY3Z-Vw0Q4kQ-1; Wed, 20 Nov 2024 16:13:50 -0500
X-MC-Unique: EUIhYzOrOlmY3Z-Vw0Q4kQ-1
X-Mimecast-MFC-AGG-ID: EUIhYzOrOlmY3Z-Vw0Q4kQ
Received: by mail-yb1-f199.google.com with SMTP id
 3f1490d57ef6-e02fff66a83so259534276.0
 for <qemu-arm@nongnu.org>; Wed, 20 Nov 2024 13:13:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732137230; x=1732742030;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vM0gNuk6NgkYQ1uz3u95XWEGU7nhPszOJ4XF9ZuwBN4=;
 b=mupGBPRIU0vkAlAmuu9HwSam4NzKKnVICcFaOoNehIn+kXPYZJH35wp5eDfLrAnyHm
 rduiLCyvPrjfitzCVJa/EaiChiJRvdemhsSoUSzC/gaLZUNzyF7jcGpCjj62P6DmeWt/
 EBNZMpsDRcSbis6mdfYN34g1iQ6nqEi+k4EDYiCGpm8064w9IPzc0IH/uJRhHnF/17jz
 GycgBtF19XWOP5/lpCiGW4zEjUwgaQht0SAnQa3sIekbVAMj2/1L/qib7fKlFQ2L9VAH
 ZQoCfNWwlHTMorYp2oEZYIPJJx5sdzVZtH53rsNq2hoR59VfUssjNwa5W2SNTjIKPK0v
 A+fA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEjsd/VBsG4AMIrrajuU43xm5pSFGrMQWqOQ13HTt2nYRxblStomZrKWvlE7S5SFOXrCp0vt2UWw==@nongnu.org
X-Gm-Message-State: AOJu0Yz5rHPkGoInzla5s68hzMBwksNicwjSGbkQzbWtSWO/2fjY0t4t
 MjQehPI6R6UEy24xcB1ZMvleIkhs8TWHBlJvSiHh6nLcRBol24vuGFTk/sEcJvPOYYZigKeLEr+
 HM4yjYGSXVzgkAjDG0RoSNCqB0IEZF4cxM3ieakI/h6zF5aR0AiKguJl97fT08vrU6bDhH3CW7P
 s9HuC/+EcehouOt8JnkvUPb4Kl
X-Received: by 2002:a05:6902:18c2:b0:e29:1099:9047 with SMTP id
 3f1490d57ef6-e38cb544269mr3918905276.11.1732137229875; 
 Wed, 20 Nov 2024 13:13:49 -0800 (PST)
X-Received: by 2002:a05:6902:18c2:b0:e29:1099:9047 with SMTP id
 3f1490d57ef6-e38cb544269mr3918879276.11.1732137229613; Wed, 20 Nov 2024
 13:13:49 -0800 (PST)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 Nov 2024 21:13:47 +0000
From: Andrea Bolognani <abologna@redhat.com>
References: <ZyRUcGKKS6NbIV5O@Asurada-Nvidia>
 <cf4359b18f0d44f09b8901141b678a09@huawei.com>
MIME-Version: 1.0
In-Reply-To: <cf4359b18f0d44f09b8901141b678a09@huawei.com>
Date: Wed, 20 Nov 2024 21:13:47 +0000
Message-ID: <CABJz62M9-mtwd4dvCc=8LEJHGMnUn4zQDS8-ocTfxZ=Y3i1q-g@mail.gmail.com>
Subject: Re: nested-smmuv3 topic for QEMU/libvirt, Nov 2024
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, Eric Auger <eric.auger@redhat.com>, 
 Mostafa Saleh <smostafa@google.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Jason Gunthorpe <jgg@nvidia.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, 
 Moritz Fischer <mdf@kernel.org>, Michael Shavit <mshavit@google.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>, 
 Zhangfei Gao <zhangfei.gao@linaro.org>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>, 
 "arighi@nvidia.com" <arighi@nvidia.com>, "ianm@nvidia.com" <ianm@nvidia.com>,
 "jan@nvidia.com" <jan@nvidia.com>, "mochs@nvidia.com" <mochs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4Pfelki2QWhpJvEv5L2kOFmpfQlExoQY5Qawv99OXCM_1732137230
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.143,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SGFidcW4PjUt

On Fri, Nov 01, 2024 at 06:35:23PM +0000, Shameerali Kolothum Thodi wrote:
> I have a bare minimum prototype code that works with a pluggable smmuv3.
>
> ...
> -device pxb-pcie,id=pcie.1,bus_nr=2,bus=pcie.0 \
> -device pcie-root-port,id=pcie.port1,bus=pcie.1 \
> -device arm-smmuv3-nested,id=smmuv1,pci-bus=pcie.1 \
> -device vfio-pci-nohotplug,host=0000:75:00.1,bus=pcie.port1,iommufd=iommufd0 \
> -device pxb-pcie,id=pcie.2,bus_nr=8,bus=pcie.0 \
> -device pcie-root-port,id=pcie.port2,bus=pcie.2,chassis=8 \
> -device arm-smmuv3-nested,id=smmuv2,pci-bus=pcie.2 \
> -device vfio-pci-nohotplug,host=0000:7d:02.1,bus=pcie.port2,iommufd=iommufd0 \

Silly bit of feedback on the interface, but why is the
arm-smmuv3-nested property called "pci-bus" instead of just "bus"?

All other devices that need to refer to an existing PCI bus use the
latter. Is there a reason for this specific one to diverge?

-- 
Andrea Bolognani / Red Hat / Virtualization

