Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp999015lfi;
        Tue, 3 Mar 2020 16:51:40 -0800 (PST)
X-Google-Smtp-Source: ADFU+vuHsJYNUs5gFZ0Ok715N1Vrzdl5M4OGowId7TqPp/ebC1p1AFW4vqciTRRLAfTHdZGkHBXy
X-Received: by 2002:ac8:3474:: with SMTP id v49mr285360qtb.194.1583283099850;
        Tue, 03 Mar 2020 16:51:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583283099; cv=none;
        d=google.com; s=arc-20160816;
        b=eiyvOgThGmBo2VQrBzxGZMbbiWP0Tq3tj/GePfn3TjIywMpaAXIuqdAejTVU24O9Q8
         E8OzLIdtS+72R4XqrU2N8Z5hSLNy8O+r3hZzVUcaYsORZoGAzXPVJACZXJjNOOVH+zY8
         /CaEVW2DAyTM7oZjrMtTaknT8IfahKhMvEEdyf8bDq9LxX5Mn4p/p47YNniw+lV/xlcM
         8XL00BrHyiyLXKlXS4LY4PVfE8TQn5VdgMS8i4yumhYDiYt1iPzMv6euwIAFQpY6dM6n
         MJfVao7o+2jrIM9ojex90nulao65iLyAH3F0Jy/CX9r8dj0ZN+4tuJnG0ndS5z6dcWBi
         tpfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=fTB4PkJpoI9InVrdaWS/fwZsgOY3Q/wWHqny5EuksC0=;
        b=zJMmg9V5ISdEMwGHlyR7BgAD+WC0U4+ZxhiAPk3YwXsAF9smySTapkoy07XObDjdtC
         U0arp94ce3sZt414x5/E3CLrRJQRWK/3KkphrhTDu+Nq3Ly/gAScQpZmk+wWEtG5MdDO
         0++uzHEpWQoJ0ob5Wbsgfni3Br0mhp6xkc4iGMtdX2uq4r7u1WTEGYKQYJGOSVAG+gf/
         JIkDfl9owu5qIb1l60wyBGGA8zlWGruzCOXJVuIsMt1Ck8sz3DgHCVI+6pRO2R8FPkRx
         XhoEw7tbOK+UP0tCT4iSVwqxoXZlHVRR0VP8BM0N08eu5Bp6/aEDYU7XVxSWNAh18k4Y
         ZdVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TDp932It;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14si32006qko.200.2020.03.03.16.51.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Mar 2020 16:51:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TDp932It;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9IGB-00013Z-4k
	for alex.bennee@linaro.org; Tue, 03 Mar 2020 19:51:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35988)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j9IFr-0000t5-GQ
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 19:51:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j9IFq-0002zg-FJ
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 19:51:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20170
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j9IFq-0002xE-CP
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 19:51:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583283076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fTB4PkJpoI9InVrdaWS/fwZsgOY3Q/wWHqny5EuksC0=;
 b=TDp932It+cpyMYS03nvAHKOkxhbl4jZ8uede2FjB9tFMYW8a1FG25dLvlhnmjbHAj/ZUPQ
 /wAxjCHTwO8YwhjoCzIlUu2SJsBEKefi43Ej2sTZs6wIzpguho1LrOFc3xk3ACvuepY7vJ
 q1LoXg/wEIf8XqY7pn4xmUg41Rje+Io=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-mZGimOQ1M3y09EeQtgYMaA-1; Tue, 03 Mar 2020 19:51:13 -0500
X-MC-Unique: mZGimOQ1M3y09EeQtgYMaA-1
Received: by mail-wr1-f71.google.com with SMTP id q18so152207wrw.5
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2020 16:51:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X9KElX+HCIEUXdZrQtbAVqlZtknhV8M376bxhgxQN28=;
 b=kiCcRfltYmTh2YpD48DvMK5EUk0V37bjYYjtKkfuv0mBkQsxcW0hAHqSWJe7k7LBkw
 A6cflxVzQoFlQzlI3DSx1yjHMTn4JZxaOgqOcvyY5uQYz5DC4KE39sxHlyIthA6Kiipo
 /202hzh+7vemVC2sgYCBjkPZltssq1N55nTdHkeTG0N27wd+G4GBSWsG8ET2A09QcAhe
 BAD61MFnpQ17jxrHBAZ+MnDUsM2vsaNRk1XxRDmxfvigVTi/LuanhWrbu0k0WkXW41nD
 KLEm/e3pt3wO3nioSlkSdP/hFIKyBEJuahA+lEec8N2d2gnU6JPW7zoqAWAc/mns2dfM
 d8Gg==
X-Gm-Message-State: ANhLgQ1RFZgggR4HsXwiXyDrMqyo8KMvtiXbEBTOyUSTfAemyWM2rJhS
 q91nszACe+cDZ54vdLzbGoT46yahJUUedMgE6n+QVa7SX4p+K4EE/KvCoQibr0jSKOj1D3Id2i4
 hOgAT37e16h7M
X-Received: by 2002:adf:eece:: with SMTP id a14mr692390wrp.311.1583283071759; 
 Tue, 03 Mar 2020 16:51:11 -0800 (PST)
X-Received: by 2002:adf:eece:: with SMTP id a14mr692317wrp.311.1583283071453; 
 Tue, 03 Mar 2020 16:51:11 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id m19sm1242650wmc.34.2020.03.03.16.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 16:51:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] misc: Replace zero-length arrays with flexible array
 member
Date: Wed,  4 Mar 2020 01:51:03 +0100
Message-Id: <20200304005105.27454-1-philmd@redhat.com>
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
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Eric Auger <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>, Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x6q//Mm33BCK

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

Philippe Mathieu-Daud=C3=A9 (2):
  misc: Replace zero-length arrays with flexible array member
    (automatic)
  misc: Replace zero-length arrays with flexible array member (manual)

 docs/interop/vhost-user.rst           |  4 ++--
 block/qed.h                           |  2 +-
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
 35 files changed, 54 insertions(+), 53 deletions(-)

--=20
2.21.1

