Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4683575lfp;
        Tue, 5 Oct 2021 01:55:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEGvL5t4us9L7kaEehZlmMfvN91U2qYEN2QsSkSbBsMbmyy1DQ7ehTJbRCb5ahg3YdSgxc
X-Received: by 2002:a25:a346:: with SMTP id d64mr21216402ybi.414.1633424125914;
        Tue, 05 Oct 2021 01:55:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633424125; cv=none;
        d=google.com; s=arc-20160816;
        b=lVaW+PM65v2/NzqwyhVJ295fX9US27EoPRceh4YTxbASA44fQmYWIQXBs+9fzo7T59
         0b4WdhQqQWsWX0Kg8R1uuETuRFuBz/OeTzw/hXtXL0N2EwxQArN1eyrNgqHjtx60a1op
         ov0uWli1nbV728BQ7Bxt0H0WcDXymsvynYwn0BPxfFoq/69L+EYwCbtWdgVvvVdlMnOh
         M7aVgI/MWgiOykMspv9+BgBGkYeJfIae6KMQZVTRbAhjzOgobcBf4D75+XeVBIDbBbSe
         7xGhTFeM8wzFB/tZ4tqMd9FJFWsPsluhAkpF/QHO57uXwSadwrxPTr2VDKY/w1PU3VPc
         CzhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=JCZ/deySk34FP3GJXm6gkzu9Y4YX+m8c7vD/BwdoGZk=;
        b=vpd8cokxaW+t56tt7vHh/y0OD1QkR8inlnpvSjqhesnRsYwxa3SrBOSL9uEK2Suguu
         o1nQmo+G4lWrOAw9OBRHrGdkkYsXodYt/MbB+e1r0mmjJwW14V5VhA4s9Jgc+ZoquWtY
         JLEDkXmN9dvKUwBtICKObDjiUx6/2xTJ4ZgEhEIUPz6tZ61iaLUz6kN6eb5cSj/hpQox
         CNZ5BZ66BrTQe/sCGNWb11QUvscWs/z41YvB/XgEvIggM8Xsk9J/7qnwZMbVEeniDcAq
         e3i12AeDLfBJPW0PId0BmvQ0N9FlFSsSge19KG2kPLyqq5RWNC0PEhW5POkNSKRC59MQ
         ytaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jTCfBuj8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8si20818058ybp.45.2021.10.05.01.55.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Oct 2021 01:55:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jTCfBuj8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mXgEP-0001WG-19
	for alex.bennee@linaro.org; Tue, 05 Oct 2021 04:55:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXgCX-0007Yp-8w
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 04:53:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXgCV-0007OZ-HP
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 04:53:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633424006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JCZ/deySk34FP3GJXm6gkzu9Y4YX+m8c7vD/BwdoGZk=;
 b=jTCfBuj8BfJWWlVoxVZubdEN4T6LaS2TG9NqsZbs+BwWiXaEAsO0iFRH1wTJdRGMhSkOmx
 Osrh5EAjsM0Y9wj5n+DqNiD0dPnqbFSZQ7gHiuDAeDiOQHeKerGRgIsgVbVQQEWS+W90Wj
 OyuQNFlpc+xPB1M8mJwuWe0dekv8g/k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-XtvizjI4PNyfKnyg-sqlRw-1; Tue, 05 Oct 2021 04:53:25 -0400
X-MC-Unique: XtvizjI4PNyfKnyg-sqlRw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BCC7835DE0;
 Tue,  5 Oct 2021 08:53:24 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FD6060853;
 Tue,  5 Oct 2021 08:53:15 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, imammedo@redhat.com,
 philmd@redhat.com, peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 shameerali.kolothum.thodi@huawei.com, ardb@kernel.org,
 jean-philippe@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 drjones@redhat.com
Subject: [RFC v2 0/2] hw/arm/virt-acpi-build: Add IORT RMR regions to handle
 MSI nested binding
Date: Tue,  5 Oct 2021 10:53:11 +0200
Message-Id: <20211005085313.493858-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: gshan@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eCyetnTEfy55

To handle SMMUv3 nested stage support it is practical to
expose the guest with reserved memory regions (RMRs)
covering the IOVAs used by the host kernel to map
physical MSI doorbells.

Those IOVAs belong to [0x8000000, 0x8100000] matching
MSI_IOVA_BASE and MSI_IOVA_LENGTH definitions in kernel
arm-smmu-v3 driver. This is the window used to allocate
IOVAs matching physical MSI doorbells.

With those RMRs, the guest is forced to use a flat mapping
for this range. Hence the assigned device is programmed
with one IOVA from this range. Stage 1, owned by the guest
has a flat mapping for this IOVA. Stage2, owned by the VMM
then enforces a mapping from this IOVA to the physical
MSI doorbell.

At IORT table level, due to the single mapping flag being
set on the ID mapping, 256 IORT RMR nodes need to be
created per bus. This looks awkward from a specification
and implementation point of view.

This may also produce a warning at execution time:
qemu-system-aarch64: warning: ACPI table size 114709 exceeds
65536 bytes, migration may not work
(here with 5 pcie root ports, ie. 256 * 6 = 1536 RMR nodes!).

The creation of those RMR nodes only is relevant if nested
stage SMMU is in use, along with VFIO. As VFIO devices can be
hotplugged, all RMRs need to be created in advance. Hence
the patch introduces a new arm virt "nested-smmuv3" iommu type.

ARM DEN 0049E.b IORT specification also mandates that when
RMRs are present, the OS must preserve PCIe configuration
performed by the boot FW. So along with the RMR IORT nodes,
a _DSM function #5, as defined by PCI FIRMWARE SPECIFICATION
EVISION 3.3, chapter 4.6.5 is added to PCIe host bridge
and PCIe expander bridge objects.

The series applies on top of Igor's
[1] [PATCH v4 00/35] acpi: refactor error prone build_header() and
packed structures usage in ACPI tables and
[2] [PATCH v2 0/3] hw/arm/virt_acpi_build: Upgrate the IORT table up
  to revision E.b

The guest can use RMRs with Shameer's series:
[3] [PATCH v7 0/9] ACPI/IORT: Support for IORT RMR node

The latest IORT specification (ARM DEN 0049E.b) can be found at
IO Remapping Table - Platform Design Document
https://developer.arm.com/documentation/den0049/latest/

This series and its dependency can be found at
https://github.com/eauger/qemu.git
branch: igor_acpi_refactoring_v4_dbg2_v3_rmr_v2

History:
v1 -> v2:
- add DSM #5

Eric Auger (2):
  hw/pci-host/gpex: Allow to generate preserve boot config DSM #5
  hw/arm/virt-acpi-build: Add IORT RMR regions to handle MSI nested
    binding

 include/hw/arm/virt.h      |  7 ++++
 include/hw/pci-host/gpex.h |  1 +
 hw/arm/virt-acpi-build.c   | 84 ++++++++++++++++++++++++++++++++------
 hw/arm/virt.c              |  7 +++-
 hw/pci-host/gpex-acpi.c    | 12 ++++++
 5 files changed, 98 insertions(+), 13 deletions(-)

-- 
2.26.3

