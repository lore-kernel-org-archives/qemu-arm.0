Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp5091098lfp;
        Tue, 28 Sep 2021 10:22:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDuQUatkkaOTZ2m9N5GTVKIwTAg11pxc8fpxeYKxQdMWFGgdksiuI4kRomungNd5AMihU1
X-Received: by 2002:a67:3157:: with SMTP id x84mr6241340vsx.51.1632849722152;
        Tue, 28 Sep 2021 10:22:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632849722; cv=none;
        d=google.com; s=arc-20160816;
        b=XRoJVSEla7Un5z1+fMn/SmvybzamCDomRc8w/+BN3XCEb5tBsuwH4+ay5vhxgZ0Kn/
         8ZRscO5NvOYG+Wx1C22uQgTWZrCqF+gFEDA6LyKCfsmN9mL6z9i9OFonLTzYrgirAaH2
         Ie521mbBl2HwfOaN5t8nppaT4cNQbWegZi5hLSx8pXQHt8EMzNj7VdIhK1ETu+Lkd1mB
         RDvWsQEyiBwquz1bsCZUXS40VRRazL25Lov6FEP6yonaj2+8+6xnVSaVVUSn71mNQ2Rq
         KgMS4fuUMNQCHhwYx9hEEbWkPIP4NZe0Rps2yfCX5taAZL/i8DFX1PT93+FuT5hRhgiI
         OosA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=kmIP1g4WQFFYGPAH0Lp51JKJBAV532ZKLGzeJpfgPh8=;
        b=N2WSXbb4PABXQcpHmOOaKNdrLIMEUCDUT/QjtZ7Qbrqb2q6SyOInGVhxRQQqNxt3Ju
         JcqaUwyCama9AhWVoQzfoVzW3Z6hLr4QeaNVMtKyE9H9XmuIkO0u3pXIovIOXlYD4esG
         MGRkiwY6ujHOv9lEX3DplmJcJNNe4h4421vZ7UAvbddnTLY7Ky319YTArfeY0k5BWuUQ
         9Yy8Q6ZMMEWqsSq2D7ymO4/hcZ+VvGFfSjc96xoGjSu1PcDMAG0HmeoFbgSjnt1uD9p2
         xLC7FWvDtVTxDDosLrqtvi9QpDIvbhyStPJmq81/SL/GkQDKSehP3lB5oqQx27ZM4bdH
         BVWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FyIdMnrT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m20si2849522vsk.214.2021.09.28.10.22.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Sep 2021 10:22:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FyIdMnrT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVGnp-0008FH-FF
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 13:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mVGng-0008Ez-H9
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 13:21:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mVGne-0002Mj-Qa
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 13:21:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632849710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kmIP1g4WQFFYGPAH0Lp51JKJBAV532ZKLGzeJpfgPh8=;
 b=FyIdMnrTsnVp6FxV2RSM5ezbAc7nXi/14T7opgi5j/nVMashkWyy8HrCZk5ItkUHUd3ifq
 A7vOmGKtR2umet4I0K8zSRE2qO+P8Hf+z37Ks51wWUUPi6lSXMbXlLXOKhDe6tPFgH24A+
 3fd2pCSMvbxJ+sXLxk6vPYsSiwwRmQI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-zIh_ERtGOx2FqQma0KHW5g-1; Tue, 28 Sep 2021 13:21:46 -0400
X-MC-Unique: zIh_ERtGOx2FqQma0KHW5g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 579BD1006AA2;
 Tue, 28 Sep 2021 17:21:45 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 756025C1C5;
 Tue, 28 Sep 2021 17:21:40 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, imammedo@redhat.com,
 jean-philippe@linaro.org, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 drjones@redhat.com
Subject: [PATCH 0/3] hw/arm/virt_acpi_build: Upgrate the IORT table up to
 revision E.b
Date: Tue, 28 Sep 2021 19:21:30 +0200
Message-Id: <20210928172133.79665-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: philmd@redhat.com, gshan@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U/IYK2V6TB0H

This series upgrades the ACPI IORT table up to the E.b
specification revision. One of the goal of this upgrade
is to allow the addition of RMR nodes along with the SMMUv3.

It applies on top of Igor's
[PATCH v4 00/35] acpi: refactor error prone build_header() and
packed structures usage in ACPI tables

The latest IORT specification (ARM DEN 0049E.b) can be found at
IO Remapping Table - Platform Design Document
https://developer.arm.com/documentation/den0049/latest/

This series and its dependency can be found at
https://github.com/eauger/qemu.git
branch: igor_acpi_refactoring_v4_dbg2_v3_rmr_v1

Eric Auger (3):
  tests/acpi: Get prepared for IORT E.b revision upgrade
  hw/arm/virt-acpi-build: IORT upgrade up to revision E.b
  tests/acpi: Generate reference blob for IORT rev E.b

 hw/arm/virt-acpi-build.c          |  47 ++++++++++++++++++------------
 tests/data/acpi/virt/IORT         | Bin 124 -> 128 bytes
 tests/data/acpi/virt/IORT.memhp   | Bin 124 -> 128 bytes
 tests/data/acpi/virt/IORT.numamem | Bin 124 -> 128 bytes
 tests/data/acpi/virt/IORT.pxb     | Bin 124 -> 128 bytes
 5 files changed, 28 insertions(+), 19 deletions(-)

-- 
2.26.3

