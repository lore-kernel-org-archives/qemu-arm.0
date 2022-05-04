Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp385686lfj;
        Wed, 4 May 2022 08:20:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhjUGcHkbqW0M27nMbrmQK+5NLo7O9Y59dOKDek5KjHPvoLIM6Fvf6PenspbDG1f+tBpE8
X-Received: by 2002:a05:620a:370c:b0:6a0:999:21c6 with SMTP id de12-20020a05620a370c00b006a0099921c6mr4771871qkb.644.1651677650470;
        Wed, 04 May 2022 08:20:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651677650; cv=none;
        d=google.com; s=arc-20160816;
        b=hIxZe32kom7OkX5COjiO0SwbTusz2+E6/KF/MDBP/pmqUHBzEbs26mc20YcSRS3Np1
         jx8LTz2lGvAR5cIfylnv+eu7H0n5eadiD42N9XGdAaB+e2o1n0DOq8CHVGYtIrTUTNCV
         9G2b7C8mF8YZ0Noufy48+JSnVuQHkBig38m/LJD+ter5Up4rGZAbmsAY1jidlB6SA6yd
         1ivF/hBBcsuuJrh3wtW0uWGrYG+K8D1LeWD5HYEGh22W7KrgFoxQC52eWqGgOI4CLazW
         bB3Mm/hIjtwco5rAllpYD+CoWDA1wy/MP3PnmrYXTA9E8Xskrp7nYrT4z9yZT35OJt8O
         xTkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ShGj7EgFi7wkzU3dyRpZq3P1rhHMpS+cKoYYoTojAwE=;
        b=aLZhya/zM0CMDoqjhdf6rqSxMB3BGW/ONX52oWZx/xXmyeDeM8xiubwPfaga9JleF9
         GjLo4uGuwvaWvaVO8DwkV1gcMqUCBMjr2UUmxblz7yumTF3SDU16FTsFoGzYXw2dvQgQ
         Y5TcR1JpZXMKP+o7bgTGH2ONaESPmigwH7wkS97tjmhNbCe1uKVD0VFiQdWmq/XHiEUm
         ZVxOteOnhl52Kr6F1htxUBe5dGpFfAkopmF9zjK/cEYksjM18Ob5P5krCJ4rU5jLC69y
         8SXesrZGkVSveVwe45PQafFc5dm2/3n31Za7Gz2CsBBoyYcFYL2jpTwBd+ObDP+VqBe5
         j7gA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XVfTcQwE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i15-20020a05620a248f00b0069ffd9484dcsi3835804qkn.33.2022.05.04.08.20.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 May 2022 08:20:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XVfTcQwE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmGo5-0003PY-UG
	for alex.bennee@linaro.org; Wed, 04 May 2022 11:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nmGnu-0003Oz-FU
 for qemu-arm@nongnu.org; Wed, 04 May 2022 11:20:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nmGnr-0003PN-2b
 for qemu-arm@nongnu.org; Wed, 04 May 2022 11:20:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651677633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ShGj7EgFi7wkzU3dyRpZq3P1rhHMpS+cKoYYoTojAwE=;
 b=XVfTcQwE6vbgyBAXXbZYPdgQ9FrY34vO1mLJ47LWf5Nd95nQP1HpllfrLk0/0tFNkljoj3
 sHp3piUvEidtTH7LejkOtvJAh5Qz/ya/U6a3i6Z7EHm6P0GktOlFwKHBIbm5U7I9IZvtDW
 SbX83oJElH640rN3FOZKpmEchbyjM1Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-DQrwop2AN5GaMW5CnOCfNg-1; Wed, 04 May 2022 11:20:30 -0400
X-MC-Unique: DQrwop2AN5GaMW5CnOCfNg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF8861014A64;
 Wed,  4 May 2022 15:20:29 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26789403D193;
 Wed,  4 May 2022 15:20:26 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, pbonzini@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 david@gibson.dropbear.id.au, clg@kaod.org, eesposit@redhat.com,
 Coiby.Xu@gmail.com, stefanha@redhat.com
Cc: jean-philippe@linaro.org
Subject: [PATCH v6 0/3] qtests/libqos: Allow PCI tests to be run with
 virt-machine
Date: Wed,  4 May 2022 17:20:22 +0200
Message-Id: <20220504152025.1785704-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fG6d0EdVS9lD

Up to now the virt-machine node only contains a virtio-mmio
driver node but no driver that eventually produces any pci-bus
interface.

Hence, PCI libqos tests cannot be run with aarch64 binary.

This series brings the pieces needed to be able to run PCI tests
with the aarch64 binary: a generic-pcihost driver node gets
instantiated by the machine. This later contains a pci-bus-generic
driver which produces a pci-bus interface. Then all tests
consuming the pci-bus interface can be run with the libqos arm
virt machine.

One of the first goal was to be able to run the virtio-iommu-pci
tests as the virtio-iommu was initially targetting ARM and it
was awkard to run the tests with the pc machine. This is now
possible.

Only the tests doing hotplug cannot be run yet as hotplug is
not possible on the root bus. This will be dealt with separately
by adding a root port to the object tree.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/libqos-pci-arm-v6

History

v5 -> v6:
- change the libqtest.h header path after pull of
  "tests: move libqtest.h back under qtest/"

v4 -> v5:
- Added Alex' R-b
- Removed [PATCH v3 4/5] tests/qtest/vhost-user-blk-test:
  Temporary hack to get tests passing on aarch64
  following Alex' fix

v3 -> v4:
- handle endianess when accessing the cfg space (fix PPC64
  BE failure). Tested on such machine.

v2 -> v3:
- force -cpu=max along with aarch64/virt
- reduced the vhost-user-block-pci issue workaround to a
  single guest_alloc() instead of enabling MSIs. Call for
  help on this specific issue. The 2 tests which fail are:
  test_basic and indirect.

v1 -> v2:
- copyright updated to 2022
- QPCIBusARM renamed into QGenericPCIBus
- QGenericPCIHost declarations and definitions moved in the same
  place as the generic pci implementation
- rename pci-arm.c/h in generic-pcihost.c/h and remove any ref to
  ARM there
- remove qos_node_produces_opts, qpci_new_arm, qpci_free_arm
- ecam_alloc_ptr now is a field of QGenericPCIBus and not QPCIBus
- new libqos_init to create generic-pcihost driver that contains
  pci-bus-generic
- QGenericPCIHost moved in the same place as the generic pci
  bindings
- collected Thomas A-b/R-b

Eric Auger (3):
  tests/qtest/libqos/pci: Introduce pio_limit
  tests/qtest/libqos: Skip hotplug tests if pci root bus is not
    hotpluggable
  tests/qtest/libqos: Add generic pci host bridge in arm-virt machine

 tests/qtest/e1000e-test.c             |   6 +
 tests/qtest/libqos/arm-virt-machine.c |  19 ++-
 tests/qtest/libqos/generic-pcihost.c  | 231 ++++++++++++++++++++++++++
 tests/qtest/libqos/generic-pcihost.h  |  54 ++++++
 tests/qtest/libqos/meson.build        |   1 +
 tests/qtest/libqos/pci-pc.c           |   1 +
 tests/qtest/libqos/pci-spapr.c        |   1 +
 tests/qtest/libqos/pci.c              |  78 +++++----
 tests/qtest/libqos/pci.h              |   6 +-
 tests/qtest/vhost-user-blk-test.c     |  10 ++
 tests/qtest/virtio-blk-test.c         |   5 +
 tests/qtest/virtio-net-test.c         |   5 +
 tests/qtest/virtio-rng-test.c         |   5 +
 13 files changed, 387 insertions(+), 35 deletions(-)
 create mode 100644 tests/qtest/libqos/generic-pcihost.c
 create mode 100644 tests/qtest/libqos/generic-pcihost.h

-- 
2.35.1

