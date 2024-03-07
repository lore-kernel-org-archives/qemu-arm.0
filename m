Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp1151470ejb;
        Thu, 7 Mar 2024 05:48:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVfP+ZJeVhk3IobSZMaSJ9pPS0JKaF4ngV4qAg4mAh8pFbdDWeFy9ALiEMAeACR4QyZXLH6YCZ6SyNy1wT5AqCSYhMnfECJ
X-Google-Smtp-Source: AGHT+IFVBoxGsl7dO6XGK4SwOmL/umhf5hFVpBN4FFOJfSHgd6f8hFeHM0EAr5UsPIRPxmuF0+cU
X-Received: by 2002:a05:620a:9c3:b0:788:491b:4f0a with SMTP id y3-20020a05620a09c300b00788491b4f0amr1221938qky.66.1709819331867;
        Thu, 07 Mar 2024 05:48:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709819331; cv=none;
        d=google.com; s=arc-20160816;
        b=jT6qKvHs8eZ57A1m3TSXOLclBMaAHi+jBH+yJlELYz9P8ju5TRPXiaCS+LUbTS0PfK
         U6FeJJaXqaIAeElCQQZ1V6SPh+AmOVah7c558WAdQiuXu28Bwfpa14/a7HisuOagZ1GU
         h47PeSCGvVHiKM0l4e5iRSz+KMUiQiStKNzyOBY11g+bmLnchQSaiKBh8iE0MgQ8ScoQ
         9kExP0yLgVQJR7gnVMNzstAYxMTEE7GyES/LzNIsAK4yZRbbjfcpIYI9IKW2uOaDuoRA
         +Z9ODWML+XB0AYcjxDDSZB5hlXXyZhZsrp+ceChkcyv2WSUzXa+3loKtdsjpSw5bzMnv
         R7sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=vDM7bxy2/ttWVowQoF3MO/PN2pkTpq/lXKV4CArE2nw=;
        fh=RVuuaU7Ghp1omAcM/aHHQKcSvJxs+IjfJSTvOY2eDr8=;
        b=GeRSgbrkOrvpAZZvCgPS29zUpQ/sJZ4+wNRSK0JjM9be4VtARY7lIjk1/Q4t04DIZk
         0GEQKv8+1WIHDofj9mPSQIoz6NP2nacWL+SAkp7fdlSQq6zzvJtu+Zpc0NoGKEH/fvMP
         AQ+RTR6tL1Cz22KCFT3VBv0O0pVI+X7cmmF+xgwza25UXvl/R+mj83VG0a5UF2xUQGET
         +gksiZhG3ygGRq0KaugH1qAM2aqLoDZ7BPT2sKbC7LGojIYbImmYKE9eURp9Zd3pomV1
         ZU0W98+I0cXwKDTcxx+ntxcPBbwTUHAAlmCvhtcJlB4m5mzmt8vhFFLdiqRsze7a6tIq
         RScw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dUipLhKr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id wg25-20020a05620a569900b007882320b033si10012328qkn.105.2024.03.07.05.48.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Mar 2024 05:48:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dUipLhKr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1riE6z-0006QJ-PA; Thu, 07 Mar 2024 08:48:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1riE4H-00057W-Ns
 for qemu-arm@nongnu.org; Thu, 07 Mar 2024 08:46:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1riE3o-00079O-1C
 for qemu-arm@nongnu.org; Thu, 07 Mar 2024 08:45:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709819095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vDM7bxy2/ttWVowQoF3MO/PN2pkTpq/lXKV4CArE2nw=;
 b=dUipLhKrOIh5CY1RCMOz/rnlWszHsJQro3LArAYX1QVXdXf7PJeMtPn5PYytRv+eKwWBnC
 +s3ZCaQh2WZoDbq5m5j5K/n5uE+bPUNg4c5TKTOOcZL67XM2vnImWXktPQ3uZ3LCE22W0F
 FSFDOZg2QJjiUxJDl9q7qIG2PsD8DcQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-GoCBt6itPGaLLTyyMwUhFA-1; Thu, 07 Mar 2024 08:44:52 -0500
X-MC-Unique: GoCBt6itPGaLLTyyMwUhFA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E1A28007A3;
 Thu,  7 Mar 2024 13:44:52 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E56917AA5;
 Thu,  7 Mar 2024 13:44:48 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 imammedo@redhat.com, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com, zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [PATCH v8 0/9] VIRTIO-IOMMU: Introduce aw-bits and granule options
Date: Thu,  7 Mar 2024 14:43:01 +0100
Message-ID: <20240307134445.92296-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.583,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: c9XOMHiGpDGl

This is a respin of
[1] [PATCH v5 0/4] VIRTIO-IOMMU: Introduce an aw-bits option
(https://lore.kernel.org/all/20240215084315.863897-1-eric.auger@redhat.com/)

which now also integrates

[PATCH v6 0/3] VIRTIO-IOMMU: Set default granule to host page size
(https://lore.kernel.org/all/20240227165730.14099-1-eric.auger@redhat.com/)

The introduction of those 2 new options and their new default values
fix bugs when assigning VFIO devices protected by a virtio-iommu.

patches 1 - 4: intro of the granule property, collected reviews
- we used to set the default granule to 4k. This causes failures
  when hotplugging a VFIO device on a 64kB/64kB host/guest config:
  "vfio: DMA mapping failed, unable to continue". When the device
  is hotplugged the granule is already frozen to 4k wheras 64k is
  needed. This series introduces a new granule option which is set
  by default to the host page size.

patches 5 - 9: intro of the aw-bits property, needs further review
- we used to set the input address width to 64b. This causes
  failures with some assigned devices where the guest driver
  tries to use the full 64b input range whereas the physical IOMMU
  supports less bits (39/48 gaw for instance on VTD). New default
  usually match the host HW capability.

For more details please see the cover letter of [1] and [2].
This series can be found at:
https://github.com/eauger/qemu/tree/granule_aw_bits_v8

History:
v7 -> v8:
- address Phil's comments: return earlier on bad aw-bits,
  doc improvement

v6 -> v7:
- Made property static in virt and pc_q35. Fix qtest 32 limit.


Eric Auger (9):
  qdev: Add a granule_mode property
  virtio-iommu: Add a granule property
  virtio-iommu: Change the default granule to the host page size
  qemu-options.hx: Document the virtio-iommu-pci granule option
  virtio-iommu: Trace domain range limits as unsigned int
  virtio-iommu: Add an option to define the input range width
  hw/i386/q35: Set virtio-iommu aw-bits default value to 39
  hw/arm/virt: Set virtio-iommu aw-bits default value to 48
  qemu-options.hx: Document the virtio-iommu-pci aw-bits option

 qapi/virtio.json                    | 18 +++++++++++++++
 include/hw/qdev-properties-system.h |  3 +++
 include/hw/virtio/virtio-iommu.h    |  3 +++
 hw/arm/virt.c                       | 17 ++++++++++++++
 hw/core/machine.c                   |  6 ++++-
 hw/core/qdev-properties-system.c    | 14 +++++++++++
 hw/i386/pc_q35.c                    |  9 ++++++++
 hw/virtio/virtio-iommu.c            | 36 +++++++++++++++++++++++++----
 tests/qtest/virtio-iommu-test.c     |  2 +-
 hw/virtio/trace-events              |  2 +-
 qemu-options.hx                     | 11 +++++++++
 11 files changed, 114 insertions(+), 7 deletions(-)

-- 
2.41.0

