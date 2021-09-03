Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1511695lfb;
        Fri, 3 Sep 2021 10:40:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4U5RDr2aeUGv7IUY7XDGmWaYGInzLEbaVo0tEV0jr2183JpW7Y1HYz9UTpTEO3o4Gu8/r
X-Received: by 2002:a17:907:76ee:: with SMTP id kg14mr52461ejc.90.1630690815300;
        Fri, 03 Sep 2021 10:40:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630690815; cv=none;
        d=google.com; s=arc-20160816;
        b=E84azQwyPHIfweEdk7oc2FAsoOURbXNeea03jlNhrSG2s3JjWNAjA4JERf1nTeaLIH
         lUrYbUHFILohezx3FO5u2W2eMGkeh+luXvJ2HOOOZo9VKpma7T0Hehb7KLcqcn8ZEuKv
         yBM0Ofk8A4LR44mybylV34PKHStbFjfCW0w6Ba+dTCdM7u8zXxO2cqIqjmmCcSG89jlf
         lTLW4p7+Abuc+hHq9V3HHRGuJLpSbDw335dXbU/Khj42EUmUIk0QuPfOrwLD8KIwjLrS
         bOj/qiClVxtOA9q73a1OhGPuCVBAZJKOF1i5/C2G65KCZsZsJSgT5E550DfLATjbQ4wo
         N1ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=4NNCT/6mJQHBezCMyj/1zWFUy+TBscSgBk0G568aq7s=;
        b=cGl26bsYjSLc52ByIDVa4Hc/rDFfIQqmIRCCRLjQJTDCr5orGg5aFclFNlhpwj/Iac
         9hRFj0VvGZVB2nHMkJY0riZRLkhAxq+sKNEF4mbFjptImf7K9+gOyVR6ib+KP3xxrS0V
         WZTajBXlxXm9kYwrsgxnqmfvGR4tzXRSE1Q7C4ZVKF6ZodqjRq60/v80crxqWmJNGxzn
         05pX6ILBUXMLY+vi7SuTqDiQKfQspLNkcZgOjVzcqC5J0hdQfzjXaXdWlBG0IHwvgr/M
         E2RTK0q9raUnE1vdpyUHhgo0rqSDNvaRYIX/8KaOPDS21RDd1drfy3U5FTRgQgSYbh4A
         lwjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jVPGTG22;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id m5si175744edc.1.2021.09.03.10.40.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:40:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jVPGTG22;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630690814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4NNCT/6mJQHBezCMyj/1zWFUy+TBscSgBk0G568aq7s=;
	b=jVPGTG22ltEPDlZtTA5s7Voy7DRCncrbgf0g0FkRvvi72LdThvyncQZWdUEtpctLbL+WtI
	sSrtJloQrGNrVsNaxCAQZE3F9rqIWfYq91ri5R8fK0jQ6T48J30vb7t7SvtwG29V0ekRsg
	WePVeqD4r293HfWrc+ZDo04y/ETg9JM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-wxx4fR0xMJu2TfqIqFtg1A-1; Fri, 03 Sep 2021 13:40:11 -0400
X-MC-Unique: wxx4fR0xMJu2TfqIqFtg1A-1
Received: by mail-wr1-f70.google.com with SMTP id p10-20020adfce0a000000b001572d05c970so1813059wrn.21
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:40:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/YkcMeWujQMsGibHR8EV4yAq+i22iiMCz7mye6vm8XE=;
        b=NGySqED+L6QdZUCrh3V3scYePsiw9EULVDKGjZuEOEqJL6k9YoiyR4/4r9eAhoIorE
         YQjeZpahiQtfnx4CqT4KPgrH8r12OoXlAYxf7nKadOTzn0HT7kKvPgkveFlXo2WS8mrY
         ritqE7jbZQQQmihxBK40C9lQAQ0pgBi2RYThRqDDjlpIcRUad0jU3gn403iceOKLyZwi
         1rqqXImQVFokfxQgQYsK4WVmK4o55IdNp8b1Aq9PNVUXLXgfoAnXYinfJKKYd8Rsezru
         sGX7VUuUWe1Bzj3zJU1aOfONmuywHUuWot3Up7KnkWqY+FuROExlBon9qcW5vzPYSQbh
         umvw==
X-Gm-Message-State: AOAM5322j1WrpeGTSIAIsrq7E4PTzNnnhfMQRerLYDlUY3D8zal+Mt8Q
	dbWiKpvDzrMzEpTTVcRDZcMYYH2cVFenVNpIz4qW2QsPQHwFH3rn/Hebju/FjtReDN4OZLLpEDG
	fdkae/isV5Viuq7MH
X-Received: by 2002:a7b:c0c7:: with SMTP id s7mr32489wmh.66.1630690810434;
        Fri, 03 Sep 2021 10:40:10 -0700 (PDT)
X-Received: by 2002:a7b:c0c7:: with SMTP id s7mr32465wmh.66.1630690810240;
        Fri, 03 Sep 2021 10:40:10 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id u5sm5225206wrr.94.2021.09.03.10.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:40:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	qemu-ppc@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-block@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 00/30] glib: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:39:38 +0200
Message-Id: <20210903174008.749126-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 3JR3/doaXFov

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdu=
p2-now/5538=0D
=0D
  The old API took the size of the memory to duplicate as a guint,=0D
  whereas most memory functions take memory sizes as a gsize. This=0D
  made it easy to accidentally pass a gsize to g_memdup(). For large=0D
  values, that would lead to a silent truncation of the size from 64=0D
  to 32 bits, and result in a heap area being returned which is=0D
  significantly smaller than what the caller expects. This can likely=0D
  be exploited in various modules to cause a heap buffer overflow.=0D
=0D
g_memdup() as been deprecated in GLib 2.68. Since QEMU defines=0D
GLIB_VERSION_MAX_ALLOWED to GLIB_VERSION_2_56, the deprecation=0D
is not displayed (on GLib >=3D 2.68 such available on Fedora 34).=0D
However the function is still unsafe, so it is better to avoid=0D
its use.=0D
=0D
This series provides the safely equivalent g_memdup2() wrapper,=0D
and replace all g_memdup() calls by it.=0D
=0D
The previous link recommend to audit the call sites. Most of the=0D
calls use byte_size=3Dsizeof(STRUCT), and no STRUCT appears to be=0D
> 4GiB.  Few calls use unsigned/size_t/uint16_t. Where code is=0D
doing multiplication, patches are sent as RFC. In particular:=0D
    hw/net/virtio-net.c=0D
    hw/virtio/virtio-crypto.c=0D
=0D
Since v1:=0D
- Added missing g_memdup2 -> g_memdup2_qemu compat definition (danpb)=0D
- Do not call g_memdup2_qemu() but directly g_memdup2() (danpb)=0D
=0D
Philippe Mathieu-Daud=C3=A9 (30):=0D
  hw/hyperv/vmbus: Remove unused vmbus_load/save_req()=0D
  glib-compat: Introduce g_memdup2() wrapper=0D
  qapi: Replace g_memdup() by g_memdup2()=0D
  accel/tcg: Replace g_memdup() by g_memdup2()=0D
  block/qcow2-bitmap: Replace g_memdup() by g_memdup2()=0D
  softmmu: Replace g_memdup() by g_memdup2()=0D
  hw/9pfs: Replace g_memdup() by g_memdup2()=0D
  hw/acpi: Avoid truncating acpi_data_len() to 32-bit=0D
  hw/acpi: Replace g_memdup() by g_memdup2()=0D
  hw/core/machine: Replace g_memdup() by g_memdup2()=0D
  hw/hppa/machine: Replace g_memdup() by g_memdup2()=0D
  hw/i386/multiboot: Replace g_memdup() by g_memdup2()=0D
  hw/net/eepro100: Replace g_memdup() by g_memdup2()=0D
  hw/nvram/fw_cfg: Replace g_memdup() by g_memdup2()=0D
  hw/scsi/mptsas: Replace g_memdup() by g_memdup2()=0D
  hw/ppc/spapr_pci: Replace g_memdup() by g_memdup2()=0D
  hw/rdma: Replace g_memdup() by g_memdup2()=0D
  hw/vfio/pci: Replace g_memdup() by g_memdup2()=0D
  RFC hw/virtio: Replace g_memdup() by g_memdup2()=0D
  net/colo: Replace g_memdup() by g_memdup2()=0D
  RFC ui/clipboard: Replace g_memdup() by g_memdup2()=0D
  RFC linux-user: Replace g_memdup() by g_memdup2()=0D
  tests/unit: Replace g_memdup() by g_memdup2()=0D
  tests/qtest: Replace g_memdup() by g_memdup2()=0D
  target/arm: Replace g_memdup() by g_memdup2()=0D
  target/ppc: Replace g_memdup() by g_memdup2()=0D
  contrib: Replace g_memdup() by g_memdup2()=0D
  checkpatch: Do not allow deprecated g_memdup()=0D
  f=0D
  test=0D
=0D
 include/glib-compat.h       | 41 ++++++++++++++++++++++++--=0D
 include/hw/hyperv/vmbus.h   |  3 --=0D
 accel/tcg/cputlb.c          |  8 ++---=0D
 block/qcow2-bitmap.c        |  2 +-=0D
 contrib/plugins/lockstep.c  |  2 +-=0D
 contrib/rdmacm-mux/main.c   | 10 +++----=0D
 hw/9pfs/9p-synth.c          |  2 +-=0D
 hw/9pfs/9p.c                |  2 +-=0D
 hw/acpi/core.c              |  3 +-=0D
 hw/arm/virt-acpi-build.c    |  2 +-=0D
 hw/core/machine.c           |  4 +--=0D
 hw/hppa/machine.c           |  8 ++---=0D
 hw/hyperv/vmbus.c           | 59 -------------------------------------=0D
 hw/i386/acpi-build.c        |  6 ++--=0D
 hw/i386/multiboot.c         |  2 +-=0D
 hw/net/eepro100.c           |  2 +-=0D
 hw/net/virtio-net.c         |  3 +-=0D
 hw/nvram/fw_cfg.c           |  9 +++---=0D
 hw/ppc/spapr_pci.c          |  7 ++---=0D
 hw/rdma/rdma_utils.c        |  2 +-=0D
 hw/scsi/mptsas.c            |  5 ++--=0D
 hw/vfio/pci.c               |  2 +-=0D
 hw/virtio/virtio-crypto.c   |  6 ++--=0D
 linux-user/syscall.c        |  2 +-=0D
 linux-user/uaccess.c        |  2 +-=0D
 net/colo.c                  |  4 +--=0D
 qapi/qapi-clone-visitor.c   | 16 +++++-----=0D
 qapi/qapi-visit-core.c      |  6 ++--=0D
 softmmu/memory.c            |  2 +-=0D
 softmmu/vl.c                |  2 +-=0D
 target/arm/helper.c         |  6 ++--=0D
 target/ppc/mmu-hash64.c     |  2 +-=0D
 tests/qtest/libqos/ahci.c   |  6 ++--=0D
 tests/qtest/libqos/qgraph.c |  2 +-=0D
 tests/unit/ptimer-test.c    | 22 +++++++-------=0D
 tests/unit/test-iov.c       | 26 ++++++++--------=0D
 ui/clipboard.c              |  2 +-=0D
 scripts/checkpatch.pl       |  5 ++++=0D
 38 files changed, 140 insertions(+), 155 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D
