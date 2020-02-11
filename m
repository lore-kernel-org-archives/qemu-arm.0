Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5118488lfp;
        Tue, 11 Feb 2020 05:56:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqytlTQttN07MTTB0KIde/zymbI+beH0wXJcN6SbjOoMFQOmBvgTfQPlSbMstwMeKgSsJIZe
X-Received: by 2002:aed:204d:: with SMTP id 71mr15025146qta.116.1581429388426;
        Tue, 11 Feb 2020 05:56:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581429388; cv=none;
        d=google.com; s=arc-20160816;
        b=ZY3u2PE74iz2iWCOLVO+UjyaUwefdq2drcgnQK1t+nQGYXRTfoENmdXWMxotLskuEi
         FPKH6Ri2ITDDvsRo5UwVU2r8n+gCT/uHZMKeyfTuOw4yQifDGxogCtdYhGpEdIVTcyzk
         j4aub7aXQ4iSIBtNWb9HvVsw3ukJr+qcHVH8TJgFT8e0anMOg26xVmsxNG+RvbgEgLPh
         YHqpE5TtakRzlmGYZYn3UKlTnapg33OJDZ4hrhyRrCziB/GiC3puk+oPtzUkcmCwa5IM
         tf+uO6rCWxLyB5tZuQJhYlcKRZZCbovWAm2SVfxHzHtA1JGkr69ngDnhlBiZM2mFc1yU
         xZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=Ot+mSjZekSIpzP1S4N0YD3kSgoELPn+R2PsVJWhPUVQ=;
        b=gbq+egFrk2PQmegjfpJnTD/majPf9/BtFdwxSSiU/I0EttWJerC8ayDW0m8KyOa2Y8
         0tKKMGL4OQp5RTL4oHMhI3/URtTD10v+BQ8CFb0LAzirdo/iodczMpHD4mATZqQDvh8r
         fOK5a1QymP/Ny9W8Dh2s5WV4rtSw7kNk1MYR4cCQLS86mpCCm1Mpa/SZ4yXDsw+oZf8d
         y2ARQxOkAThonog2wxuTn5HCLHY/Drta7TAtsl8eEpwkXFkw0/OYGBDcRXSyli5Xgbw3
         GBJ/+4NNcBElyoEbAHyHq1urKRovI3s4BIV6bIGGVO92fES6N60QgbSu/parWXyJJRXg
         qYJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=h1hmd8W+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e39si1703969qtb.111.2020.02.11.05.56.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 05:56:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=h1hmd8W+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1W1b-0004Ix-Rr
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 08:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44709)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1j1W1T-0004IW-M6
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 08:56:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1j1W1S-0002B4-0a
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 08:56:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51287
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1j1W1R-00029s-T2
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 08:56:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581429377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ot+mSjZekSIpzP1S4N0YD3kSgoELPn+R2PsVJWhPUVQ=;
 b=h1hmd8W+YpCFAtdogpnQegylHFLrCjSCRhjME7o5J3yyhiZzFrT7eaO3aJWwPmUhHI9ovt
 MCFngeBQB6faaOiu61pm/BLOlfoV5rZMXa+5MUt4eGrFsIDRQWXXHLR7k/pW1ewXDzPkFE
 RgUR4V2Z+K+yA/luen/ymX6ZL9tY1A8=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-iR56eQZdNRWpPQXN0PVAJA-1; Tue, 11 Feb 2020 08:56:13 -0500
Received: by mail-qt1-f200.google.com with SMTP id l25so6618239qtu.0
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 05:56:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/ZGSSd0qAWCCAIXhhuQYtsSqOzZMu1jV05CPY04Wpc8=;
 b=ex6/pFQb7ktmOK+OkOfC1iE+XpDGPbKcVhufVtUvyUEvKL9o8DT8hMYGNAwS9LPCnd
 zL4eMzjzMnyK0JEXTAuiEqEer4yRP1uC1UTofNdJ7hL+eOoDnBDbM/v+M9EREKgylgVN
 SirCmaNfjrJ6SM+NDCX4QQd2/yCwjQyM3eEpKyjpeKOAg4wCGkys6Ax9uj/9Q4gvsru6
 Zz21DmUN615PPTDhtUGUbchQxkxurydv9r/Oz9Pl8MySP4xsxkcLQEQEwoRQwlnmEksG
 nNiaHpO/HhDuM3P9N5L5aHQmyFRBuo9RIUiBoFSoI5h5euWjGr3c0CHUysz0NfQg5xJ8
 YgIQ==
X-Gm-Message-State: APjAAAUFVui6t36zyv+YAGXZwRdkoiSubDfZpcJjwJMCnGppu3YWbZif
 06oaBAoSmyeAIz1u7r1JCPL1d/4exqg+CfS9RsEogGZ++vPjakHSoSO6vNACpBKFIZmLt6IiHj+
 kXl2B9TAGOrZU
X-Received: by 2002:ac8:365c:: with SMTP id n28mr2494743qtb.260.1581429373063; 
 Tue, 11 Feb 2020 05:56:13 -0800 (PST)
X-Received: by 2002:ac8:365c:: with SMTP id n28mr2494718qtb.260.1581429372758; 
 Tue, 11 Feb 2020 05:56:12 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id g53sm2178305qtk.76.2020.02.11.05.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 05:56:11 -0800 (PST)
Date: Tue, 11 Feb 2020 08:56:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v15 0/9] VIRTIO-IOMMU device
Message-ID: <20200211085526-mutt-send-email-mst@kernel.org>
References: <20200208120022.1920-1-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200208120022.1920-1-eric.auger@redhat.com>
X-MC-Unique: iR56eQZdNRWpPQXN0PVAJA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 jean-philippe@linaro.org, quintela@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com, dgilbert@redhat.com, bharatb.linux@gmail.com,
 qemu-arm@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IZjshlyoyR7Z

On Sat, Feb 08, 2020 at 01:00:13PM +0100, Eric Auger wrote:
> This series implements the QEMU virtio-iommu device.
>=20
> This matches the v0.12 spec (voted) and the corresponding
> virtio-iommu driver upstreamed in 5.3. All kernel dependencies
> are resolved for DT integration. The virtio-iommu can be
> instantiated in ARM virt using:
>=20
> "-device virtio-iommu-pci".
>=20
> Non DT mode is not yet supported as it has non resolved kernel
> dependencies [1].
>=20
> This feature targets 5.0.
>=20
> Integration with vhost devices and vfio devices is not part
> of this series. Please follow Bharat's respins [2].
>=20
> Best Regards
>=20
> Eric


Looks good.
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

I can see this merged through ARM tree, or through my tree with
Peters's ack for the ARM bits.


> This series can be found at:
> https://github.com/eauger/qemu/tree/v4.2-virtio-iommu-v15
>=20
> References:
> [1] [RFC 00/13] virtio-iommu on non-devicetree platforms
> [2] [PATCH RFC v5 0/5] virtio-iommu: VFIO integration
>=20
> Testing:
> - tested with guest using virtio-net-pci
>   (,vhost=3Doff,iommu_platform,disable-modern=3Doff,disable-legacy=3Don)
>   and virtio-blk-pci
> - migration
>=20
> History:
>=20
> v14 -> v15:
> - removed x-dt-binding and just kept check on hotplug_handler
> - removed "tests: Add virtio-iommu test" as the check on
>   hotplug_handler fails on PC machine
> - destroy mappings in put_domain and remove
>   g_tree_destroy(domain->mappings) in virtio_iommu_detach
>=20
> v13 -> v14:
> - added "virtio-iommu-pci: Introduce the x-dt-binding option"
> - Removed the mappings gtree ref counting and simply delete
>   the gtree when the last EP is detached from the domain
> - call virtio_iommu_detach_endpoint_from_domain from
>   virtio_iommu_put_endpoint
>=20
> v12 -> v13:
> - Take into account Peter's comments
> - fix qtest error and accomodate for directory changes in
>   test
> - remove "[PATCH v12 01/13] migration: Support QLIST migration"
>   which is now upstream
> - fix iommu_find_iommu_pcibus()
> - squash commits as requested by Peter
> - remove spurious guest log
>=20
> ../..
>=20
> Eric Auger (9):
>   virtio-iommu: Add skeleton
>   virtio-iommu: Decode the command payload
>   virtio-iommu: Implement attach/detach command
>   virtio-iommu: Implement map/unmap
>   virtio-iommu: Implement translate
>   virtio-iommu: Implement fault reporting
>   virtio-iommu-pci: Add virtio iommu pci support
>   hw/arm/virt: Add the virtio-iommu device tree mappings
>   virtio-iommu: Support migration
>=20
>  hw/arm/virt.c                    |  57 +-
>  hw/virtio/Kconfig                |   5 +
>  hw/virtio/Makefile.objs          |   2 +
>  hw/virtio/trace-events           |  20 +
>  hw/virtio/virtio-iommu-pci.c     | 103 ++++
>  hw/virtio/virtio-iommu.c         | 890 +++++++++++++++++++++++++++++++
>  include/hw/arm/virt.h            |   2 +
>  include/hw/pci/pci.h             |   1 +
>  include/hw/virtio/virtio-iommu.h |  61 +++
>  qdev-monitor.c                   |   1 +
>  10 files changed, 1135 insertions(+), 7 deletions(-)
>  create mode 100644 hw/virtio/virtio-iommu-pci.c
>  create mode 100644 hw/virtio/virtio-iommu.c
>  create mode 100644 include/hw/virtio/virtio-iommu.h
>=20
> --=20
> 2.20.1

