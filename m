Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp352695ejb;
        Wed, 14 Dec 2022 03:40:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4WxyxBFkWwxLOCaqQ2yk0XyMzzpnpvyaEPpgaeywsk+1dF85hL0ba2Z6p2yKpIC/yBu/UM
X-Received: by 2002:a0c:c24c:0:b0:4c7:5635:3360 with SMTP id w12-20020a0cc24c000000b004c756353360mr33813488qvh.2.1671018046685;
        Wed, 14 Dec 2022 03:40:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671018046; cv=none;
        d=google.com; s=arc-20160816;
        b=NeQq8qS/iASd6P/QJdsrAhixpsoEB6NgQMx3Osz+P0jCH/SUJLCr62oncoZ7FjKiax
         dsB4xfGLKSVbS3AVwTL+MrKWuETjADoTOmRg+zFwSyRReGGtlEWtASxW+pV10aYmtKhW
         3dY5u9FMVQZyhIB5TOf20RHy8utwvMhC6/nA35F5FkGHldA8QWgb3rojfMvSimC9uK7S
         1wtCnRZO5IGYxmMjicB7b1qlW/V8bFyOZ0MUt3DTMbDd6o/nwbRqhk3zDn4D1dqO/04R
         w7+lpFDcZ3eMJJ1TxRySN+iEB0OEdLJjl+tPgFwtcAVgz7lO3gvgDcYXOfpNKT2hpubh
         q1Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=KdglEdOwSqFhrFM6CBaBzUBm3E1XbtdFP2rSUZBUdQk=;
        b=JYWs7fKjzQC+D1Bdg4y2H3s5mMTgPvT4pNJeyT6R0x9xovWYPXugQ84Mx+tOec4Uhx
         shizSP+WoxZeZV4QHhdcvFzSbuK9tgZ+LHBeJaUdoC3swJr25smjJktk0xHLpySHsw7c
         OzfPw2PiSKbFuiEiM9W7Z3fWr+3pnjCGdCLi648z9/C7Iw6fCKTKQ2YEYGvN5B9gkOTB
         5ffghs0lO5XG31p/ZitDRJh1a4yb7EsdRhnPYVNPcyO7Ayt+tFl5ksxlg6QynVm/Kv92
         DObIHonpRJ8pO7wlGVWlPnIBPr9yE8/G3S7AgTqjWgsu4pa0KBz/2UZHj8FJCsgTZ/dv
         59Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WpaoPzJi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dz12-20020a05620a2b8c00b006ee8f3ec6e3si7793864qkb.90.2022.12.14.03.40.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Dec 2022 03:40:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WpaoPzJi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Q7J-0004VZ-P5; Wed, 14 Dec 2022 06:40:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p5Q79-0004U7-2l
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 06:39:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p5Q75-0001S2-TB
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 06:39:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671017989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KdglEdOwSqFhrFM6CBaBzUBm3E1XbtdFP2rSUZBUdQk=;
 b=WpaoPzJiiwSr7iOB1yWmPfwZJznEeCjb2KlsUKHkwGnQuRkTfPk/92xtsKCsTKzpx1/Bm4
 Yuz8wTQstDws5FHarY7F378XQkcXPNMPAnZ+sOyC6+vmNn8GwvpT+wpYe+BQyeerTE38Ot
 AV3SjkQqUgwE1LGSa232ozVaI38bDNw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-596-wnDUZAKrNHKh6Ub6cg1YxQ-1; Wed, 14 Dec 2022 06:39:48 -0500
X-MC-Unique: wnDUZAKrNHKh6Ub6cg1YxQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 o34-20020a05600c512200b003d07ee4a667so1487697wms.0
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 03:39:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KdglEdOwSqFhrFM6CBaBzUBm3E1XbtdFP2rSUZBUdQk=;
 b=X/wikMi+T5lkA9HBSyIU9DY+9GcZx131qWJrpH91c1lxcnPAGASfbTPulEDOTXnywf
 MpVIGWFX1mlG2vvOZdvKLY3xfAoX0TYTeqtX4o0F2obXummGEfg+0u/DZ28I+BRqxWO+
 VgmO5onGvLDBnTs2RPiQXItJiMwqoAEA7z/8Zvb+H/R0HoRkXZ1kr2PnwJ/8FZD+irsW
 cjhqiJSuk+8rSrjBNB1iSFEPRoh63keZFnK0UnLzGx7vq+x7XYd6xxyqY/LPwmi1Ru2L
 3Q0R+oNrltfTUupBP1sU5WRHkHvYunluBLXVYff8Yjd70bR3cxeFN7QirqYbh+G9JIja
 Wa5A==
X-Gm-Message-State: ANoB5pkW1mw6rig3HKaO2yXx9eIPRIAHsSa+otjBFamTtZxMQoZHcYbh
 olKKGvOXsKvA4VxmHsRedyvznEi5tjAvZajkC5JpNo7e4QVFs/fJsksZD8kuSm7uVICBXHNxS99
 oVWSQR7zo4D1+ZIs=
X-Received: by 2002:adf:f212:0:b0:242:192c:9b34 with SMTP id
 p18-20020adff212000000b00242192c9b34mr14779011wro.59.1671017987202; 
 Wed, 14 Dec 2022 03:39:47 -0800 (PST)
X-Received: by 2002:adf:f212:0:b0:242:192c:9b34 with SMTP id
 p18-20020adff212000000b00242192c9b34mr14778992wro.59.1671017987005; 
 Wed, 14 Dec 2022 03:39:47 -0800 (PST)
Received: from redhat.com (bzq-82-81-161-50.red.bezeqint.net. [82.81.161.50])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b002421888a011sm2637388wrn.69.2022.12.14.03.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 03:39:46 -0800 (PST)
Date: Wed, 14 Dec 2022 06:39:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, ani@anisinha.ca, pbonzini@redhat.com,
 richard.henderson@linaro.org, mark.cave-ayland@ilande.co.uk,
 peter.maydell@linaro.org, andrew.smirnov@gmail.com,
 paulburton@kernel.org, aleksandar.rikalo@syrmia.com,
 danielhb413@gmail.com, clg@kaod.org, david@gibson.dropbear.id.au,
 groug@kaod.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v2 for-8.0 0/2] pci: drop redundant
 PCIDeviceClass::is_bridge field
Message-ID: <20221214063852-mutt-send-email-mst@kernel.org>
References: <20221129101341.185621-1-imammedo@redhat.com>
 <20221214100943.7f64a34b@imammedo.users.ipa.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221214100943.7f64a34b@imammedo.users.ipa.redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: n2ZGVYZCk1xd

On Wed, Dec 14, 2022 at 10:09:43AM +0100, Igor Mammedov wrote:
> On Tue, 29 Nov 2022 11:13:39 +0100
> Igor Mammedov <imammedo@redhat.com> wrote:
> 
> > Changelog:
> >    - keep comment reminding that there was a bridge, so it would be easy to find
> >      removed code if someone wishes to bring it back
> >    - s/IS_PCI_BRIDGE/is_bridge/ in one instance where local is_bridge already exists
> 
> Michael,
> 
> can you merge this via PCI tree?

Yes it's tagged. Busy with the linux pull req, qemu pull req next.
Thanks for the reminder!


> > 
> > Igor Mammedov (2):
> >   remove DEC 21154 PCI bridge
> >   pci: drop redundant PCIDeviceClass::is_bridge field
> > 
> >  hw/pci-bridge/dec.h                |   9 --
> >  include/hw/pci/pci.h               |  11 +-
> >  include/hw/pci/pci_bridge.h        |   1 +
> >  include/hw/pci/pci_ids.h           |   1 -
> >  hw/acpi/pcihp.c                    |   3 +-
> >  hw/i386/acpi-build.c               |   5 +-
> >  hw/pci-bridge/cxl_downstream.c     |   1 -
> >  hw/pci-bridge/cxl_upstream.c       |   1 -
> >  hw/pci-bridge/dec.c                | 164 -----------------------------
> >  hw/pci-bridge/i82801b11.c          |   1 -
> >  hw/pci-bridge/meson.build          |   2 -
> >  hw/pci-bridge/pci_bridge_dev.c     |   1 -
> >  hw/pci-bridge/pcie_pci_bridge.c    |   1 -
> >  hw/pci-bridge/pcie_root_port.c     |   1 -
> >  hw/pci-bridge/simba.c              |   1 -
> >  hw/pci-bridge/xio3130_downstream.c |   1 -
> >  hw/pci-bridge/xio3130_upstream.c   |   1 -
> >  hw/pci-host/designware.c           |   1 -
> >  hw/pci-host/uninorth.c             |   9 +-
> >  hw/pci-host/xilinx-pcie.c          |   1 -
> >  hw/pci/pci.c                       |  20 ++--
> >  hw/ppc/spapr_pci.c                 |  15 +--
> >  22 files changed, 23 insertions(+), 228 deletions(-)
> >  delete mode 100644 hw/pci-bridge/dec.h
> >  delete mode 100644 hw/pci-bridge/dec.c
> > 

