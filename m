Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp1748173lfi;
        Wed, 4 Mar 2020 07:36:22 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtLfhOKWrq24+mHn9VlbL/+hCkQ+H/w6/3jJN/HLDAkZfmcaLEEaObsXdTyrRCQeGz+g7nS
X-Received: by 2002:a05:620a:2114:: with SMTP id l20mr3466465qkl.214.1583336182439;
        Wed, 04 Mar 2020 07:36:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583336182; cv=none;
        d=google.com; s=arc-20160816;
        b=SN+h5gdL1TDaBkrW9VLfvXLZrilW/4vI28S5EYt0sUVGCcKZq1Z+5Qg9A91JXURlkf
         NqLqbaE1bvde+TweNXUxWdIr1WAPnvZtP7DSROlIOCRSoUsz8EYw3bKZFehz6EzasMQL
         KL8M2kIMa3qSlgprjk0Gkrc2R0R3ztJPanUzFKppZhquyHu0owjFd5pCuF4VrlBzDH1O
         2cRPyNx1GN6ETTgEm8lusM2mnCyqEjt5Mm/jOb8mpJj9rz7BuciNb/zP2VEMyFseLXMx
         TvacJIdjGJ+UHOW8Oln8lR4vOW6eIoyl3L0jL4SbBnpH2EK+uQ5Zl9doCvalNpzjnvsq
         TnCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=G5NhvDKvPjvQJhnY14fHyEvQ/0myRniZs3nKil3lehY=;
        b=VZhI2rr9pwRivsyp5wQIpVgf/PH519S3QEn3fvgINVCuDbMimU4DE9DPZqKALzvFhA
         vEalXrv5AppO2brj3H9XBjfMpfa/gxjmvZDG6ih3dFtjSnfN7V/LbrzIfoafrnWT0U5a
         nqHZpJW++Bh6zXrE5jRJ1yZORovjA0VaOTo4XVOpJMGI36onDykwe0FrRt+0tm9QTCad
         4gO10Wc62cpTQ55V4DxgkpMYVN5WyOszw/KukONleeRfUw7xm8wpK4aBcf4aWinFR84y
         0QWcQYuReqWY33MmqiPZzQ75HHcG15ML7GSV3Ufb+IVo8O73vKKAwGwTiWNNAfJp/C7f
         s0jQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OZycP4FK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14si1115057qkl.190.2020.03.04.07.36.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Mar 2020 07:36:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OZycP4FK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9W4L-00032L-SJ
	for alex.bennee@linaro.org; Wed, 04 Mar 2020 10:36:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45927)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9W4B-0002sW-6U
 for qemu-arm@nongnu.org; Wed, 04 Mar 2020 10:36:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9W49-0006cs-Ul
 for qemu-arm@nongnu.org; Wed, 04 Mar 2020 10:36:11 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30888
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9W49-0006be-Qi
 for qemu-arm@nongnu.org; Wed, 04 Mar 2020 10:36:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583336168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=G5NhvDKvPjvQJhnY14fHyEvQ/0myRniZs3nKil3lehY=;
 b=OZycP4FKh0KFiNE0YRVSt8+cz3Q9AXdoH3Pasl2aO3FVZUXAl7XV8oJUr7vCwyXAoO3BCq
 yYWEw863SoyVNT68BSOkQGM9FgNwQ+gLxeZVBNFHIl6v5elxlO7JHhsYLRee0y3a57OSSD
 Ts0jbwZvUuUCPPU3l9EYln9FRfljRNw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-ljeEyzS6PXagB0OLw5anAw-1; Wed, 04 Mar 2020 10:36:06 -0500
X-MC-Unique: ljeEyzS6PXagB0OLw5anAw-1
Received: by mail-wm1-f69.google.com with SMTP id y18so2022977wmi.1
 for <qemu-arm@nongnu.org>; Wed, 04 Mar 2020 07:36:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y0p/4JL8TMvLa6UgCA/KzBmR/o65cHnlPhknYfGAHbc=;
 b=QkLXimxdTWTOt+oaVlrxmla4f+SFmZHm3+848imnsDMKWswzhBEE4z/Ow98Kj2830m
 9snlI+XUJxINzrs0hbH6d+BnO8CO9bM3s5YuIrM9sXXW5DOft8HrAmIEYcZv4uoAi6s0
 4Nz9BTDW6tKKypT6i7ppuJwkUPySwhkyLJ9zqsv63OJWA+CDRA2C9Kyo6NqP4GV3/Vk4
 dA56x1l64saui/rdoBitfJxsrf9gSMwjzGCSLebCcXtbv7LQMvK6F0AFPNigiC2Mv8L3
 S/HcMhhqMpgRO+S4zpwDTpIMLTRPWRSyz+xfdpeC1cHLV6gzumc/p54tfToA+fTZtLMX
 fWQA==
X-Gm-Message-State: ANhLgQ0w/i6g1ke8N7tJt31d/fWIy8LBRM0wQFsqZ/khaViRd5FUWtXH
 nJibm45exf51hbYO5pvlSGhMjuGKo+JtmjJ4aQIJyfSrV3MaIh/PFeaEabHJ5TMp7mK5M879N8S
 TvszBNdJidlVf
X-Received: by 2002:a1c:4c0c:: with SMTP id z12mr4104654wmf.63.1583336165274; 
 Wed, 04 Mar 2020 07:36:05 -0800 (PST)
X-Received: by 2002:a1c:4c0c:: with SMTP id z12mr4104628wmf.63.1583336165037; 
 Wed, 04 Mar 2020 07:36:05 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id b10sm4906024wmh.48.2020.03.04.07.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 07:36:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] misc: Replace zero-length arrays with flexible array
 member
Date: Wed,  4 Mar 2020 16:35:59 +0100
Message-Id: <20200304153601.23423-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3NT3AKQ3K7C+

v2:
- do not modify qed.h (structure with single member)
- based on hw/scsi/spapr_vscsi fix series

This is a tree-wide cleanup inspired by a Linux kernel commit
(from Gustavo A. R. Silva).

--v-- description start --v--

  The current codebase makes use of the zero-length array language
  extension to the C90 standard, but the preferred mechanism to
  declare variable-length types such as these ones is a flexible
  array member [1], introduced in C99:

  struct foo {
      int stuff;
      struct boo array[];
  };

  By making use of the mechanism above, we will get a compiler
  warning in case the flexible array does not occur last in the
  structure, which will help us prevent some kind of undefined
  behavior bugs from being unadvertenly introduced [2] to the
  Linux codebase from now on.

--^-- description end --^--

Do the similar housekeeping in the QEMU codebase (which uses
C99 since commit 7be41675f7cb).

The first patch is done with the help of a coccinelle semantic
patch. However Coccinelle does not recognize:

  struct foo {
      int stuff;
      struct boo array[];
  } QEMU_PACKED;

but does recognize:

  struct QEMU_PACKED foo {
      int stuff;
      struct boo array[];
  };

I'm not sure why, neither it is worth refactoring all QEMU
structures to use the attributes before the structure name,
so I did the 2nd patch manually.

Anyway this is annoying, because many structures are not handled
by coccinelle. Maybe this needs to be reported to upstream
coccinelle?

I used spatch 1.0.8 with:

  -I include --include-headers \
  --macro-file scripts/cocci-macro-file.h \
  --keep-comments --indent 4

Regards,

Phil.

Based-on: <20200304153311.22959-1-philmd@redhat.com>
Supersedes: <20200304005105.27454-1-philmd@redhat.com>

Philippe Mathieu-Daud=C3=A9 (2):
  misc: Replace zero-length arrays with flexible array member
    (automatic)
  misc: Replace zero-length arrays with flexible array member (manual)

 docs/interop/vhost-user.rst           |  4 ++--
 bsd-user/qemu.h                       |  2 +-
 contrib/libvhost-user/libvhost-user.h |  2 +-
 hw/m68k/bootinfo.h                    |  2 +-
 hw/scsi/srp.h                         |  6 +++---
 hw/xen/xen_pt.h                       |  2 +-
 include/hw/acpi/acpi-defs.h           | 16 ++++++++--------
 include/hw/arm/smmu-common.h          |  2 +-
 include/hw/boards.h                   |  2 +-
 include/hw/i386/intel_iommu.h         |  3 ++-
 include/hw/s390x/event-facility.h     |  2 +-
 include/hw/s390x/sclp.h               |  8 ++++----
 include/hw/virtio/virtio-iommu.h      |  2 +-
 include/sysemu/cryptodev.h            |  2 +-
 include/tcg/tcg.h                     |  2 +-
 pc-bios/s390-ccw/bootmap.h            |  2 +-
 pc-bios/s390-ccw/sclp.h               |  2 +-
 tests/qtest/libqos/ahci.h             |  2 +-
 block/linux-aio.c                     |  2 +-
 block/vmdk.c                          |  2 +-
 hw/acpi/nvdimm.c                      |  6 +++---
 hw/char/sclpconsole-lm.c              |  2 +-
 hw/char/sclpconsole.c                 |  2 +-
 hw/dma/soc_dma.c                      |  2 +-
 hw/i386/x86.c                         |  2 +-
 hw/misc/omap_l4.c                     |  2 +-
 hw/nvram/eeprom93xx.c                 |  2 +-
 hw/rdma/vmw/pvrdma_qp_ops.c           |  4 ++--
 hw/s390x/virtio-ccw.c                 |  2 +-
 hw/usb/dev-network.c                  |  2 +-
 hw/usb/dev-smartcard-reader.c         |  4 ++--
 hw/virtio/virtio.c                    |  4 ++--
 net/queue.c                           |  2 +-
 target/s390x/ioinst.c                 |  2 +-
 34 files changed, 53 insertions(+), 52 deletions(-)

--=20
2.21.1

