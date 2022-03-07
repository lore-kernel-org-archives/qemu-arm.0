Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1804884lfo;
        Mon, 7 Mar 2022 13:16:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmK7NpumJSDks01lu4BwKGotGDu9a+B9/ObCABK+2lvklFMg09lylZD5PK6cImFJAfeANL
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id 6-20020a810106000000b002d0e6828a7amr10779272ywb.257.1646687772472;
        Mon, 07 Mar 2022 13:16:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646687772; cv=none;
        d=google.com; s=arc-20160816;
        b=cgoSK4ItPgi7MfhaAw/HB+cqNfqRjeUdGmRCIVBBXL+PtCuByFVtQ6hj6He2RDXR3s
         P+XWssMvk3iVEeNttHGKmB4iE/TsYeSJ1+1wTxJEJMay0nib42adWOluiPnUDNkv1fKs
         OvcEEVL9EMvXf+8j+A5roRekAEa2gl+MC/HP8Nb2FRE2z+TQ5TcF9KcZPsSji5RPm3Os
         6qxNyL/lltn09pEmGHwJpElsJtSDEUFndKIlSdDqILmzsHwaPPWAx69ywAdQQ9sD3k1S
         hKzqviMTmpAvMwexqoF7JbUB4YXvm/jgVqGgsYOmtWU5/QIVsp4Z9mJwYH1m1OJZIbjm
         UKeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=LuIRBUJIF3lR1ttcw4d+d9kJl02qfVr8WPni09dQPHw=;
        b=yRG3vMb1/qISj6Wycz9ZSzx8ow/0XCwYPa8brJgg7sxK6iehHShyvaTSO5NBaygCdY
         E7Eti5QG6Xebv8hq7zNy7CLoOTiNDgNJ3qSD11f+uAlXc1v0cinL2F0QLV2AQR8RLh0k
         84Dy0mlDopqPcB0rffAVkv07ofVxJOnQYf+g7SJ90T7cgv2azPgxhtwIiA23mFnQTGIw
         tFXkrpMZDSr7//ddbYJalKethQAmdu3kTywdeYJQ9Ic0N88h+cB2CUTte4wqdezyvUT/
         Xwcxj3AO04iGxtkWj/ir5tUEfcQnZoUUn0I19WPAxH3/DsjDDS41NCYo1/wWf+IutzfW
         qLKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S44k3cIu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i188-20020a0dc6c5000000b002dc10549cd0si11443914ywd.399.2022.03.07.13.16.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Mar 2022 13:16:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S44k3cIu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRKiB-0007fZ-TN
	for alex.bennee@linaro.org; Mon, 07 Mar 2022 16:16:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nRKhs-0007fF-Mn
 for qemu-arm@nongnu.org; Mon, 07 Mar 2022 16:15:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nRKhp-0000J9-Qn
 for qemu-arm@nongnu.org; Mon, 07 Mar 2022 16:15:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646687748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LuIRBUJIF3lR1ttcw4d+d9kJl02qfVr8WPni09dQPHw=;
 b=S44k3cIuA7ZUuyr9+/+nC6TbxeeyntVG4+qtsjY9DthL/X8nWyNWRTU8Ro1W/DUh6Ss/AY
 aTTcEgjoSjK5zcVFWV8m2YwvP/QhF244yD3fMuhjBH1Qpc1KjoMgFy/yOkWm50b9oGCWiP
 5btF8VmL1CErYbNRSSupFEt5bXK6VHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-7Y_23IAjN_KF36dWCWnmeg-1; Mon, 07 Mar 2022 16:15:44 -0500
X-MC-Unique: 7Y_23IAjN_KF36dWCWnmeg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6773851E0;
 Mon,  7 Mar 2022 21:15:43 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DED2B1BC7F;
 Mon,  7 Mar 2022 21:14:40 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, pbonzini@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 david@gibson.dropbear.id.au, clg@kaod.org, eesposit@redhat.com,
 Coiby.Xu@gmail.com, stefanha@redhat.com
Subject: [PATCH v4 0/4] qtests/libqos: Allow PCI tests to be run with
 virt-machine
Date: Mon,  7 Mar 2022 22:14:35 +0100
Message-Id: <20220307211439.213133-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: jean-philippe@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7lYhMRCzy0LN

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
was awkard to be run the test with the pc machine. This is now
possible.

Only the tests doing hotplug cannot be run yet as hotplug is
not possible on the root bus. This will be dealt with separately
by adding a root port to the object tree.

Also I have some trouble with 2 of the vhost-user-blk-tests. I am
obliged to hack them in "tests/qtest/vhost-user-blk-test: Temporary
hack to get tests passing on aarch64". Looks like a memory
allocation issue, which at first sight seems unrelated to the
aarch64 pci libqos enablement but we are never sure. Calling for
help on this issue, if some vhost-user specialists can dedicate
some cycles on this. Otherwise I will try my best to further debug.

To reproduce the issue, revert the above hack and run

QTEST_QEMU_STORAGE_DAEMON_BINARY=build/storage-daemon/qemu-storage-daemon QTEST_QEMU_BINARY=build/aarch64-softmmu/qemu-system-aarch64 build/tests/qtest/qos-test

you should get:

    ERROR:../tests/qtest/libqos/virtio.c:224:qvirtio_wait_used_elem:
    assertion failed (got_desc_idx == desc_idx): (50331648 == 0)
    Bail out! ERROR:../tests/qtest/libqos/virtio.c:224: qvirtio_wait_used_elem:
    assertion failed (got_desc_idx == desc_idx): (50331648 == 0)

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/libqos-pci-arm-v4

History

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


Eric Auger (4):
  tests/qtest/libqos/pci: Introduce pio_limit
  tests/qtest/libqos: Skip hotplug tests if pci root bus is not
    hotpluggable
  tests/qtest/vhost-user-blk-test: Temporary hack to get tests passing
    on aarch64
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
 tests/qtest/vhost-user-blk-test.c     |  16 ++
 tests/qtest/virtio-blk-test.c         |   5 +
 tests/qtest/virtio-net-test.c         |   5 +
 tests/qtest/virtio-rng-test.c         |   5 +
 13 files changed, 393 insertions(+), 35 deletions(-)
 create mode 100644 tests/qtest/libqos/generic-pcihost.c
 create mode 100644 tests/qtest/libqos/generic-pcihost.h

-- 
2.26.3

