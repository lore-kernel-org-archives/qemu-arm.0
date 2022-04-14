Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp726619lfk;
        Thu, 14 Apr 2022 02:39:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2PGr3FjQv2KZOcb2b12ZY9q73xtNjIX8q8EMtbGXcFE7Dsk/jUU+98XOfCSu9qoXlG5Y9
X-Received: by 2002:ac8:5bd6:0:b0:2e1:c841:35f6 with SMTP id b22-20020ac85bd6000000b002e1c84135f6mr1050424qtb.120.1649929147504;
        Thu, 14 Apr 2022 02:39:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649929147; cv=none;
        d=google.com; s=arc-20160816;
        b=U6a83ro7DM5Vz7ddvQAAqO6PY8c4C8KSHqSJTTfClvaxSL3DHtqHgxGUpTntOiBSah
         tkDsVuc5/dJeLlmn1w/DZgHnRQ2yICyJM8t9NOyUL+z61yJT2CQaLkd/BDEmMAlTPeUs
         7s1czESldrKBEx3qNOgmRS9CQn8o8Jk2uXbC41HHE0UQjPsFQP6HhkYWRSsRmWWeX2ku
         GFlrxiKyYHw+NeEdYCosDT5guraVJ84asmwLPt3YCa/ijF985BNIpdDXLKLD1y+zvm9z
         V8mk6uB2HzLEA4A6oaxZDPA/E95pnuAXVxXPm/PD3W8/lnkhLi4CfpiM15uak/RBlnlA
         Ah6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=IxQlJALb6akTKIxmEOuZwPSBZpke2zG6t668raagw8o=;
        b=e3TMYaxJBwssqhNnnZpd09s3joPYxXwQnjtLf+zOWE53634OLBEY0PX/ZMWEjnK+WP
         6SKCCSbMrA4SQpmqlVg1PYEiIBlsalf0o5C+Mf62JlNsKbWLw6AmXWeTIl/BZKaz7d7O
         tsFsrsWdJ80LyWwi73raxUuK4CIMifukBBQt+a2aXwtaiQz3q3/eqLdYqwP7R8ohcB6C
         rnnpnSxRbLWG7CVGDIpIZRXATNoDOOp3zxdsDLWdWQOpCIwFXw59seieB2CQY4LIvmfB
         ihYZs4sU+pL533Ge5f0nqed7tQTLB2LQgYcEG/0VM+jW6wvpj/XQGIOz1K5GoJ9Zk6Lx
         B4nA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iqZMyp3u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a21-20020ac84d95000000b002e1fbf3bf49si8079542qtw.314.2022.04.14.02.39.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Apr 2022 02:39:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iqZMyp3u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nevwR-0006Hz-04
	for alex.bennee@linaro.org; Thu, 14 Apr 2022 05:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nevvW-0006H8-34
 for qemu-arm@nongnu.org; Thu, 14 Apr 2022 05:38:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nevvS-00024t-OX
 for qemu-arm@nongnu.org; Thu, 14 Apr 2022 05:38:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649929083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IxQlJALb6akTKIxmEOuZwPSBZpke2zG6t668raagw8o=;
 b=iqZMyp3ukuxYLgNdXRLTE/1gA+2iDqSDYJWYWgv0FWD8b5W0/pSQ54ehTC34DBAwY50jUO
 TF8aqcY4VeIO9uiOjricRBFFjg/wx8dbAY7pUwCuv0uUmaSHgw3EHUxRtNVvUcX+Zzau7S
 fH9LHooe1U9Uefs8JikRI78tr4YtEGE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332--gHxYenWMKm1p6qL05SoCw-1; Thu, 14 Apr 2022 05:38:00 -0400
X-MC-Unique: -gHxYenWMKm1p6qL05SoCw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D704811E78;
 Thu, 14 Apr 2022 09:37:59 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 255B843247D;
 Thu, 14 Apr 2022 09:37:57 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, pbonzini@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 david@gibson.dropbear.id.au, clg@kaod.org, eesposit@redhat.com,
 Coiby.Xu@gmail.com, stefanha@redhat.com
Subject: [PATCH v5 0/3] qtests/libqos: Allow PCI tests to be run with
 virt-machine
Date: Thu, 14 Apr 2022 11:37:51 +0200
Message-Id: <20220414093754.1034556-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: DRZsmem4e1+L

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

Depends on Alex' fix:
tests/qtest: properly initialise the vring used idx

This series can be found at:
https://github.com/eauger/qemu/tree/libqos-pci-arm-v5

History

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
2.26.3

