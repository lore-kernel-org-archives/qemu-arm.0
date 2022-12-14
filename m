Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp256541ejb;
        Wed, 14 Dec 2022 01:10:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf75/0vwqh7tX69UeNn5FFflz9ntkUwm6TzDvyvljpoQBVGAJoNuHroUwltRUNhE0Xm5d+EM
X-Received: by 2002:ac8:7d0e:0:b0:3a8:12b3:8bf2 with SMTP id g14-20020ac87d0e000000b003a812b38bf2mr23997853qtb.49.1671009028311;
        Wed, 14 Dec 2022 01:10:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671009028; cv=none;
        d=google.com; s=arc-20160816;
        b=mRszND81J53h/vd7mJB47PIPr+84GcsLsSITsveBM30rw46Q4I0lBSt5aW+0b2cjob
         8aNpGcRfWePEAgh6zKlDht7rVQ3tv3Gvcgcsra5qRxZsPrYeQC7QQAm1bNAYNMLAmzbj
         +p2ElKB5g8mIgkDpW7HF9Rf6DIeL7yeDRL1XcFxWE8kwNo8jKoDQiQ3zsBfZsrNsF7QD
         d3Zf3VTaDnb44vVlOoU3R1yTje2xgr3YQYpOtcqZLVVSXrxPQN1p3kYzEBjuw5Lk7yjF
         IJx8XtKuLlvUvvSfds91dEDQEtO9CbWJxLBpnbQ5x7kjxoZYpEy5e6EXuReotCuo6f8d
         Iizw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=pH2XO4taCjKI6BIT71vGkv8iUIdI83Of+/UYGkrF2kw=;
        b=XMP4OioWvUSYXaIpt0S2eQY4JK0QdC7VM+seZUSFJf724KE1G1MjV7Ahd+vGXBmOeZ
         OxucNPNwNwtQN0T0cXU2jwT0SokbRm2Qz7TACX85BVAmbshaBvqQhdegDMAkk7YTm8/K
         F6pxMEDJY6UZty0HJCWRZ1nGOVmB1ZBl09dh45f2C30IOlwcvzuWYUpsbhnQKCQvKxTl
         E3IRKpbZGP7d9TN/uvnxwC0JEjGoND0N0BsYBgy8EIoCdp/cWdJek1iw4ad1P3Bmwr/4
         wnQGjK2kFCasJIc7Xm2AMTjjmDL1bt2fbYhYNcnxcSfCCX+qUycZldLhoHVmQ6tAMv//
         l4Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FBvdeY+G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o23-20020ac86997000000b003976b4bee7fsi1325077qtq.657.2022.12.14.01.10.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Dec 2022 01:10:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FBvdeY+G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p5Nm0-0000oH-E5; Wed, 14 Dec 2022 04:09:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1p5Nlw-0000nK-Ox
 for qemu-arm@nongnu.org; Wed, 14 Dec 2022 04:09:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1p5Nlu-0007jm-S7
 for qemu-arm@nongnu.org; Wed, 14 Dec 2022 04:09:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671008989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pH2XO4taCjKI6BIT71vGkv8iUIdI83Of+/UYGkrF2kw=;
 b=FBvdeY+G3n/bPj7fBRkkSuEGtsFRPxR9slphEgZ6w1LxzFB3I6wOn23vOiODJ3aikCiq1+
 rdfNXZMAMaJTRed/9xD/3vmS+DLXB+3xnDPOBzcSAGi8754Aoi8WRh0HZ0UNh8vN546KB0
 qKoSNdy4qdxVTgGoa4F1o2SILl+qbxE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-475-rPpk3gslMfaGl47pQ6fcnA-1; Wed, 14 Dec 2022 04:09:46 -0500
X-MC-Unique: rPpk3gslMfaGl47pQ6fcnA-1
Received: by mail-wr1-f72.google.com with SMTP id
 e7-20020adf9bc7000000b00242121eebe2so3374949wrc.3
 for <qemu-arm@nongnu.org>; Wed, 14 Dec 2022 01:09:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pH2XO4taCjKI6BIT71vGkv8iUIdI83Of+/UYGkrF2kw=;
 b=Ht8igh6+70pgT9f8p45SE4ww9DPSvEzOFCIzfFrXgJkLYi9PURvLH+6kw6eLWXA9p+
 lJoDotD7a3vMprDcFE2hxBHW5UJgySg9evQSNxmjy1T2o/a2uX2/q6mME/BL/rhDyu1q
 sb8jC2xBKM9rz/ZlS1GrvG6MpaEzK2z2A9PPQD/gPgRbHDyu4sih4K9lr2ZhmNBpPYKT
 Q1DaC523zTb8rdp5QhPorfWQ6vvXZwajHaFXcENGUDLkwQZxkTCEwJyzPjPSVCPealWy
 Y2R6FL6H7tvCWvi9Azo46+pKAGJwIQFPYvseBrs+csxlewJxBU/Wu2VbxUTbYB6LrVNZ
 ekNQ==
X-Gm-Message-State: ANoB5pkfucIKJzGJ1BMcPSVb6U8tB1FuH/u/LulAalPA/iBmPi9FYmGT
 8Ki5b0QMGKTo8C3OuR5ftnfiSyUk1+YI1g+dSeBgJoUAlPrZEusyrZrGzz42zPW2u16b43Kat13
 A+0WY00lg81EP
X-Received: by 2002:a7b:c5c4:0:b0:3d1:f234:12cc with SMTP id
 n4-20020a7bc5c4000000b003d1f23412ccmr17606658wmk.33.1671008985479; 
 Wed, 14 Dec 2022 01:09:45 -0800 (PST)
X-Received: by 2002:a7b:c5c4:0:b0:3d1:f234:12cc with SMTP id
 n4-20020a7bc5c4000000b003d1f23412ccmr17606635wmk.33.1671008985282; 
 Wed, 14 Dec 2022 01:09:45 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 o13-20020a05600c4fcd00b003b4868eb71bsm1925106wmq.25.2022.12.14.01.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 01:09:44 -0800 (PST)
Date: Wed, 14 Dec 2022 10:09:43 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: mst@redhat.com
Cc: qemu-devel@nongnu.org, ani@anisinha.ca, pbonzini@redhat.com,
 richard.henderson@linaro.org, mark.cave-ayland@ilande.co.uk,
 peter.maydell@linaro.org, andrew.smirnov@gmail.com, paulburton@kernel.org,
 aleksandar.rikalo@syrmia.com, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Subject: Re: [PATCH v2 for-8.0 0/2] pci: drop redundant
 PCIDeviceClass::is_bridge field
Message-ID: <20221214100943.7f64a34b@imammedo.users.ipa.redhat.com>
In-Reply-To: <20221129101341.185621-1-imammedo@redhat.com>
References: <20221129101341.185621-1-imammedo@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: m9IMJOapNP+F

On Tue, 29 Nov 2022 11:13:39 +0100
Igor Mammedov <imammedo@redhat.com> wrote:

> Changelog:
>    - keep comment reminding that there was a bridge, so it would be easy to find
>      removed code if someone wishes to bring it back
>    - s/IS_PCI_BRIDGE/is_bridge/ in one instance where local is_bridge already exists

Michael,

can you merge this via PCI tree?

> 
> Igor Mammedov (2):
>   remove DEC 21154 PCI bridge
>   pci: drop redundant PCIDeviceClass::is_bridge field
> 
>  hw/pci-bridge/dec.h                |   9 --
>  include/hw/pci/pci.h               |  11 +-
>  include/hw/pci/pci_bridge.h        |   1 +
>  include/hw/pci/pci_ids.h           |   1 -
>  hw/acpi/pcihp.c                    |   3 +-
>  hw/i386/acpi-build.c               |   5 +-
>  hw/pci-bridge/cxl_downstream.c     |   1 -
>  hw/pci-bridge/cxl_upstream.c       |   1 -
>  hw/pci-bridge/dec.c                | 164 -----------------------------
>  hw/pci-bridge/i82801b11.c          |   1 -
>  hw/pci-bridge/meson.build          |   2 -
>  hw/pci-bridge/pci_bridge_dev.c     |   1 -
>  hw/pci-bridge/pcie_pci_bridge.c    |   1 -
>  hw/pci-bridge/pcie_root_port.c     |   1 -
>  hw/pci-bridge/simba.c              |   1 -
>  hw/pci-bridge/xio3130_downstream.c |   1 -
>  hw/pci-bridge/xio3130_upstream.c   |   1 -
>  hw/pci-host/designware.c           |   1 -
>  hw/pci-host/uninorth.c             |   9 +-
>  hw/pci-host/xilinx-pcie.c          |   1 -
>  hw/pci/pci.c                       |  20 ++--
>  hw/ppc/spapr_pci.c                 |  15 +--
>  22 files changed, 23 insertions(+), 228 deletions(-)
>  delete mode 100644 hw/pci-bridge/dec.h
>  delete mode 100644 hw/pci-bridge/dec.c
> 

