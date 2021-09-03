Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1173384lfb;
        Fri, 3 Sep 2021 04:07:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNiwDaURahe+uXEcu0rSdJhsumrWNqgANyJHtTRnsrkdk9ZrfTbVXYkVvq6Lc4razm9zld
X-Received: by 2002:a17:906:d0cd:: with SMTP id bq13mr3635202ejb.66.1630667231658;
        Fri, 03 Sep 2021 04:07:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667231; cv=none;
        d=google.com; s=arc-20160816;
        b=jkN87bN2LTdjtfKCj64Vl2uixGSC7n4f2OeQrgDHQkHDJDSKrq+1usqDtHWmgZ381b
         hxS8F3jLaRN1WDt09TSJRXCufXHun17KWxdrawEbRhJ5k2QpWz8BCoSmKBhqmZBQLPx8
         ykj65jDZL8y4Ouh3V5OheYB+CieQMcxchxVc3xvtulVnZJmr+cE+0viXniO3mJQWNSeF
         V08nGOAj9jRCP27RNOrlH3wrJABtSzDsXMJUwo7sXMwGC1JlRQ4u7ZIOkKptKMR4nd0Z
         y9iAnxvPgCp4dT6aR5gQf5eSMHG3fPx6MrNIxhU2ujsjxdWeA6rSFLYl/pFY+KLM/GX5
         LBUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=PF/xnGXQTIoJHa57WKQQPyvoyaxxjuKOqyDKhhHUMA0=;
        b=c+hIr+WJeuxBvzZmz7T8htoi46Tjvu7opSYza4YIkkdwJkSQDsG3W9LC2FXCh8rBKg
         3jwcnzZbh3PmtvSX9wih6dATcH4bz7i/jBGiZ0bIKjP36Yym6PRx41a7A+WInWtL9/KU
         Fahfo1kJhLgXe0ACZYMnv/DVDXOBg9uxFPOkfJcaPtEuaoJHLBjzskYWRR87p/4Unu/2
         JfJU+uiuqXMcZJjaa/ysBtj7HIoyRKqoPnCj+1/FbmYZRtl3EvZqt51joWqq68jSyJ1U
         8UkQ1aAmmvZANX+849ULLLEiiKZsSiPI6eM6eI0aGP4fti28rsKYABwGuTt8EC3mASsi
         RAEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="FpW/ijNI";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id j9si4808924ejo.629.2021.09.03.04.07.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:07:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="FpW/ijNI";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PF/xnGXQTIoJHa57WKQQPyvoyaxxjuKOqyDKhhHUMA0=;
	b=FpW/ijNI6tUldckr87ErXE4L5qqIZJERKh+EIaZGxkJNjWUvDGiGi+lOAxbj49zdO9KfCy
	j7XJ2DJND1beIG+Dn71R/EEhbpRbMLOmgO3MPu0jpnUbmhvdWMOEaxrth5ewHDHDzskqa3
	pmakn75fFxtoTm5xn79l3DA2iQ4cQEo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-OHzAAA2mP6as9bv1_KADRg-1; Fri, 03 Sep 2021 07:07:07 -0400
X-MC-Unique: OHzAAA2mP6as9bv1_KADRg-1
Received: by mail-wm1-f71.google.com with SMTP id m16-20020a7bca50000000b002ee5287d4bfso1832106wml.7
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 04:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hT4rpMU7gMMiB6PN8r96+Od1up6S2/wmxgTRnbJrmUA=;
        b=kS6FNW9imh/6LAaJl+b3Nm5lKI/IC/gidrhXk4Ew9d79s8qlpaexWpH3gyxWoaHmXK
         G79fjXX/u2p8jX3D9b9yVNxGCgfd4pldB1z8t92y3yKX8git9+m9XG6vFVvMwyQelTdY
         m1u4HfXOtpZyWrds/vz8qmCMBlSpul27ZQVFP7XkYar5njrGFRf6mkgt4ZMjGWaHdb7+
         Aot+cHu/AjL1096tZ/AczKsuoMcu0O5NYp7ET+a5jKMoT1OlBRYybLDX0t0FQ3ZaR632
         aN8DMTPszYTYxBdgjdiVBxPM20P/meQ/RXnoND0nYcRJn9jaE6+vfMyo+VK+XJ1oLiy8
         j6fA==
X-Gm-Message-State: AOAM531OrGm0ZWcX5nRKCYaq3h5W5rESPOIZlUuN8dU7oxunwHsTaKr9
	Kenk8N64QyzV8Cx0pgJLp4JsSS9eT6YmFYKmmxOH/TEpbDY8BbPUxdJ914hq9YhXDJNqewiAurU
	Jk7MPIWItCIz3qPhI
X-Received: by 2002:a05:600c:5102:: with SMTP id o2mr2726510wms.104.1630667226536;
        Fri, 03 Sep 2021 04:07:06 -0700 (PDT)
X-Received: by 2002:a05:600c:5102:: with SMTP id o2mr2726472wms.104.1630667226343;
        Fri, 03 Sep 2021 04:07:06 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id r10sm4631717wrc.85.2021.09.03.04.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:07:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Roth <michael.roth@amd.com>,
	Zhang Chen <chen.zhang@intel.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Stefan Weil <sw@weilnetz.de>,
	John Snow <jsnow@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-block@nongnu.org,
	Helge Deller <deller@gmx.de>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Peter Xu <peterx@redhat.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Jason Wang <jasowang@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Yuval Shaia <yuval.shaia.ml@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-ppc@nongnu.org,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH 00/28] glib: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:34 +0200
Message-Id: <20210903110702.588291-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 8S2QqdeFjYvU

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
This series provides the safely equivalent g_memdup2_qemu()=0D
wrapper, and replace all g_memdup() calls by it.=0D
=0D
The previous link recommend to audit the call sites. Most of the=0D
calls use byte_size=3Dsizeof(STRUCT), and no STRUCT appears to be=0D
> 4GiB.  Few calls use unsigned/size_t/uint16_t. Where code is=0D
doing multiplication, patches are sent as RFC. In particular:=0D
    hw/net/virtio-net.c=0D
    hw/virtio/virtio-crypto.c=0D
=0D
Please review,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (28):=0D
  hw/hyperv/vmbus: Remove unused vmbus_load/save_req()=0D
  glib-compat: Introduce g_memdup2() wrapper=0D
  qapi: Replace g_memdup() by g_memdup2_qemu()=0D
  accel/tcg: Replace g_memdup() by g_memdup2_qemu()=0D
  block/qcow2-bitmap: Replace g_memdup() by g_memdup2_qemu()=0D
  softmmu: Replace g_memdup() by g_memdup2_qemu()=0D
  hw/9pfs: Replace g_memdup() by g_memdup2_qemu()=0D
  hw/acpi: Avoid truncating acpi_data_len() to 32-bit=0D
  hw/acpi: Replace g_memdup() by g_memdup2_qemu()=0D
  hw/core/machine: Replace g_memdup() by g_memdup2_qemu()=0D
  hw/hppa/machine: Replace g_memdup() by g_memdup2_qemu()=0D
  hw/i386/multiboot: Replace g_memdup() by g_memdup2_qemu()=0D
  hw/net/eepro100: Replace g_memdup() by g_memdup2_qemu()=0D
  hw/nvram/fw_cfg: Replace g_memdup() by g_memdup2_qemu()=0D
  hw/scsi/mptsas: Replace g_memdup() by g_memdup2_qemu()=0D
  hw/ppc/spapr_pci: Replace g_memdup() by g_memdup2_qemu()=0D
  hw/rdma: Replace g_memdup() by g_memdup2_qemu()=0D
  hw/vfio/pci: Replace g_memdup() by g_memdup2_qemu()=0D
  RFC hw/virtio: Replace g_memdup() by g_memdup2_qemu()=0D
  net/colo: Replace g_memdup() by g_memdup2_qemu()=0D
  RFC ui/clipboard: Replace g_memdup() by g_memdup2_qemu()=0D
  RFC linux-user: Replace g_memdup() by g_memdup2_qemu()=0D
  tests/unit: Replace g_memdup() by g_memdup2_qemu()=0D
  tests/qtest: Replace g_memdup() by g_memdup2_qemu()=0D
  target/arm: Replace g_memdup() by g_memdup2_qemu()=0D
  target/ppc: Replace g_memdup() by g_memdup2_qemu()=0D
  contrib: Replace g_memdup() by g_memdup2_qemu()=0D
  checkpatch: Do not allow deprecated g_memdup()=0D
=0D
 include/glib-compat.h       | 36 ++++++++++++++++++++++=0D
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
 hw/ppc/spapr_pci.c          |  8 ++---=0D
 hw/rdma/rdma_utils.c        |  2 +-=0D
 hw/scsi/mptsas.c            |  5 ++--=0D
 hw/vfio/pci.c               |  2 +-=0D
 hw/virtio/virtio-crypto.c   |  7 +++--=0D
 linux-user/syscall.c        |  2 +-=0D
 linux-user/uaccess.c        |  2 +-=0D
 net/colo.c                  |  4 +--=0D
 qapi/qapi-clone-visitor.c   | 16 +++++-----=0D
 qapi/qapi-visit-core.c      |  6 ++--=0D
 softmmu/memory.c            |  2 +-=0D
 softmmu/vl.c                |  2 +-=0D
 target/arm/helper.c         |  7 +++--=0D
 target/ppc/mmu-hash64.c     |  3 +-=0D
 tests/qtest/libqos/ahci.c   |  6 ++--=0D
 tests/qtest/libqos/qgraph.c |  2 +-=0D
 tests/unit/ptimer-test.c    | 22 +++++++-------=0D
 tests/unit/test-iov.c       | 26 ++++++++--------=0D
 ui/clipboard.c              |  2 +-=0D
 scripts/checkpatch.pl       |  5 ++++=0D
 38 files changed, 141 insertions(+), 153 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D
