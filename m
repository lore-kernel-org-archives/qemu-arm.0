Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp307473lfm;
        Fri, 26 Jun 2020 03:32:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweP4vS/WES90CWhA0rJDMDXuEFV4sF1C/JeVrKLU1lnB2vMoFqtzZHLkzsdwVt+EPGwRrB
X-Received: by 2002:a25:aaa9:: with SMTP id t38mr3822221ybi.312.1593167579143;
        Fri, 26 Jun 2020 03:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593167579; cv=none;
        d=google.com; s=arc-20160816;
        b=CN6qwuNa+q5PqNfvaaPPg9eYjQHjKG/sMfGwSo7NzwpYMPPLYUAVmRR7Rw+RzafI2F
         SPb5J/ZKcyPcTmuGIdG8/GJrr9hTWPdQ8fbIpRN6m1NHKLOropSy3jPLkmywYd5Ue5LQ
         gpfvUvkg5lALgPmbn2CtKrtfHbi/IdR5hBQ/cvh3+BcqVjHDGWl6ESDiEXejhqgE0Mg6
         kvjyemOkaQCoxzs05TXLtnO9bGt7N8cOY5BOk1f40Th2YYVgNT6AjtAjE3KbjSdpAITO
         mn3ZmCW7Ib6mJbrFQaj73ULUY9cPR5jeJMcq0uFHhm1GEsr105YFw+5LOmVlWc6GDEkj
         z5LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=SAWCETpNMNDNW0YqCfxZ+bcsIqoAL6Ek43Ufn11Nj4g=;
        b=R75aoI1RR6OrL2lICFAS+HypZ1hL1pHzBcK3TW4NXYnfQ5aEAFJ5nuHNXnWg+QoV2m
         fm1DTKHhq3+uTF297WyMLOrJShwKYDOqlaTl+/LMyBz8S1pe2Vdrb04+zWmTPh1gBA5h
         mmFKwDJ/NUFHk+2yAbrTrXD9cECux8fjrEKazt5hLPFaSqZ/skHtlnyPW+fRrrTYIhwc
         z0VJYcG2dOYrVOc10OCGqHp8g9htrnGTPX3ToeTJ6le7KfbvgapKDW8yZLWIQJ6qq8j+
         9YTTTgQTniejU5rZMKLJx6MrkDq64u0L7jqqn3fX+2j8qtYrDg0WQatcgilQnmDBstcq
         N/Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fMxN5FkC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u8si23317280ybb.311.2020.06.26.03.32.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jun 2020 03:32:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fMxN5FkC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jolfG-00042v-De
	for alex.bennee@linaro.org; Fri, 26 Jun 2020 06:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1joldg-0001ub-UH
 for qemu-arm@nongnu.org; Fri, 26 Jun 2020 06:31:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26578
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1joldf-0003BY-3A
 for qemu-arm@nongnu.org; Fri, 26 Jun 2020 06:31:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593167478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SAWCETpNMNDNW0YqCfxZ+bcsIqoAL6Ek43Ufn11Nj4g=;
 b=fMxN5FkC/8PubY94RI5iiiAoN0F3m36jYAaawD1fE9Mgu99bf0wFD8jmnTC8UYdkYqxL0b
 Ozu8AyHk2kplHCSOhVtRqMsppZHAAMJZ+Zh1KTQP7bPVylynpRK1euj8s383K7QaGsqqDz
 JK5g4Elzv06qEJ+9h+Yvz3rM04AD6p0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-kpQKq4NpMwmqE4hT4M5IOQ-1; Fri, 26 Jun 2020 06:31:16 -0400
X-MC-Unique: kpQKq4NpMwmqE4hT4M5IOQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7BF0107ACCA;
 Fri, 26 Jun 2020 10:31:14 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4407560C87;
 Fri, 26 Jun 2020 10:31:02 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 armbru@redhat.com, pbonzini@redhat.com, jean-philippe@linaro.org,
 bbhushan2@marvell.com, peterx@redhat.com
Subject: [PATCH v6 0/5] VIRTIO-IOMMU probe request support and MSI bypass on
 ARM
Date: Fri, 26 Jun 2020 12:30:52 +0200
Message-Id: <20200626103057.11263-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 01:55:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p7kg4dohFnWN

By default the virtio-iommu translates MSI transactions. This
behavior is inherited from ARM SMMU. However the virt machine
code knows where the MSI doorbells are, so we can easily
declare those regions as VIRTIO_IOMMU_RESV_MEM_T_MSI. With that
setting the guest iommu subsystem will not need to map MSIs.
This setup will simplify the VFIO integration.

In this series, the ITS or GICV2M doorbells are declared as
HW MSI regions to be bypassed by the VIRTIO-IOMMU.

This also paves the way to the x86 integration where the MSI
region, [0xFEE00000,0xFEEFFFFF], will be exposed by the q35
machine.  However this will be handled in a separate series
when not-DT support gets resolved.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/v5.0.0-virtio-iommu-msi-bypass-v6

History:

v5 -> v6:
- do not hardcode start/end addresses of doorbells
- check reserved region type on realize()

v4 -> v5:
- Take into account some additional comments from Markus:
  - reserved region type becomes an unsigned + some comment/desc
    rewording
  - assert if the type is not RESERVED or MSI

v3 -> v4:
- collected Jean and markus's R-bs
- tool into account all Markus' comments in [1/5] (except removal of
  goto)
- use ':' as delimitor instead of commas
- add example in 4/5 commit message as suggested by Markus

v2 -> v3:
- Introduce VIRT_MSI_CTRL_NONE in VirtMSIControllerType
- do not fill the remainder of the probe buffer

v1 -> v2:
- check which MSI controller is in use and advertise the
  corresponding MSI doorbell
- managed for both ITS and GICv2M
- various fixes spotted by Peter and Jean-Philippe, see
  individual logs

v1: Most of those patches were respinned from
  [PATCH for-5.0 v11 00/20] VIRTIO-IOMMU device
  except the last one which is new

Eric Auger (5):
  qdev: Introduce DEFINE_PROP_RESERVED_REGION
  virtio-iommu: Implement RESV_MEM probe request
  virtio-iommu: Handle reserved regions in the translation process
  virtio-iommu-pci: Add array of Interval properties
  hw/arm/virt: Let the virtio-iommu bypass MSIs

 include/exec/memory.h            |   6 ++
 include/hw/arm/virt.h            |   7 ++
 include/hw/qdev-properties.h     |   3 +
 include/hw/virtio/virtio-iommu.h |   2 +
 include/qemu/typedefs.h          |   1 +
 hw/arm/virt.c                    |  30 +++++++++
 hw/core/qdev-properties.c        |  89 +++++++++++++++++++++++++
 hw/virtio/virtio-iommu-pci.c     |  13 ++++
 hw/virtio/virtio-iommu.c         | 110 +++++++++++++++++++++++++++++--
 hw/virtio/trace-events           |   1 +
 10 files changed, 258 insertions(+), 4 deletions(-)

-- 
2.20.1

