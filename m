Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1514908lfb;
        Fri, 3 Sep 2021 10:45:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSmEYOvCVlkbIFtdEC0xnM9BGC+vAkI2xbZfiCJngRRJZyk02Uo4nswEBiMQ4wSXZzdIPd
X-Received: by 2002:a17:906:369a:: with SMTP id a26mr5521585ejc.539.1630691116085;
        Fri, 03 Sep 2021 10:45:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630691116; cv=none;
        d=google.com; s=arc-20160816;
        b=ZoMw8LwCOeyrbgCXbkMrl4Dy+lDwawZahD36EkFFN0TX0iXT6mUQPn+Sri6flxjgTL
         WTeXf/nP+reyNZ9nXptyL9VapPi2pidmSf9Bx4oeSh1kpTBsZ6h1SxLxNYpQdpQfAur/
         +fkSIpNCwQeKBEQcjRQi2GqXdawQuIrK8nfUrPKsGAWQv6/XHc6Av7rmCL3waQjszUI9
         nXSee0dIcZBZQL6pfac0aL+id2xsWWGNhs71JvnvF/o+eUjeNuyqZLcPFAbT22nuT957
         d9rw5XNxAS34v4HEG0IgUWh+3OsxAz2tbF1H4O2uGJHmPw1npGnoRe/z7VdWR6PbjtaO
         Jspw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=5pxglglrBjktMPrcMnRa0MQmvg3ha7aIsW8uhOkppUs=;
        b=Cg/kQJX7bVkqEpgMuwAYxWUbEhvIpdwVeZnpKXcEMsIEDoSLJ7pZM1fIt1lNZFvTUa
         a8POOS9TQgRZCftQi5jzEMG+e0ycta/hzxfyJBW4wMuItKasRzBUX1P8cVLYZnn9Xpdp
         rzMzJx+XpFnThEQspjxLgJ7yPU0hQMN81EYCb5UbM8n6tLoAJj3/NA3CqKTGOp9SYCyV
         b2Y2hFddAUVwDYk+6rhheps/DkVQgUTKhZEXDsg4SehFli0y3cQna9dQuFqE3VALeVGI
         MA+FJ1iBI6Qmdn2I8ZT0q/LiYi8JLmJ9emUIO3bo+m4+SyvscCtxF7QoJGdpRIRUhwQy
         ImUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GBuTTJI4;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id dt16si6024020ejc.540.2021.09.03.10.45.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:45:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GBuTTJI4;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630691115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5pxglglrBjktMPrcMnRa0MQmvg3ha7aIsW8uhOkppUs=;
	b=GBuTTJI4tEr5fFrAoZUcLT3oD+BUN8iK/Qa2WrAJC2BcmEyjfJrXHH9jO6iNachMvoR653
	Gcsl0nT1chspnNRBMAvzvOim6U6kvkATX+Vp4KogOr92wm7MVsBIqRJTU1HdW8pvYIuWQV
	hmg9kcMuLb+5eQlo0/xga3kW+YL3FRE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-i4d8ZVG-M9mIA8eUJlvDmA-1; Fri, 03 Sep 2021 13:45:13 -0400
X-MC-Unique: i4d8ZVG-M9mIA8eUJlvDmA-1
Received: by mail-wm1-f70.google.com with SMTP id e33-20020a05600c4ba100b002f8993a54f8so42866wmp.7
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=scQC4+mFjIe2ASr4s0NfJ0tOtGyU6KRT6zsforUnNCg=;
        b=YGYYivB/wFgZRcAD5tv6XxlpT+MTMWTwz2DmbN4WruJZIBmltX7b1ab/pruzVEgG9H
         5Ehp0H089FyADO9AOFZHOZXp4vNLMnzAUTH8tkEZRmoEB5KJB0P/83eBzaHHjeBlPLNb
         kulbMhdZXHprr9K/YYKBMFqpUzEYRqI7mLGXfddEFMKqDiV0A8WEdOdoOTx9dZSbXcmA
         0QMoeCmxspsfQJE3of1m7mrpkNqDuhuCLXxyIEMYJHsZt/eEK0veVYEHHnhd0yE0chy0
         4sWsFyyMtw4PSnEAJMoIucUD0PGIlfVUNugK68NlOalDiyZnD/xBTfbD1++Xm8CrsnZt
         uFIA==
X-Gm-Message-State: AOAM531t+WRUE/x7H+U7TTHiGCSXPEOqT0SIha+RR2dDqivw2H4fWL+Q
	QgklppwfN2RZFe7iCX+Rh7fdgf3zTTQdZrBk/yitxaJUjlPRC6JQN1QVwM6GgBtQMcUkmv/qKN2
	4gXWMjXBV+q8duh2F
X-Received: by 2002:adf:e68b:: with SMTP id r11mr273933wrm.394.1630691112639;
        Fri, 03 Sep 2021 10:45:12 -0700 (PDT)
X-Received: by 2002:adf:e68b:: with SMTP id r11mr273914wrm.394.1630691112462;
        Fri, 03 Sep 2021 10:45:12 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id v5sm5111506wrw.44.2021.09.03.10.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:45:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	David Hildenbrand <david@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Hanna Reitz <hreitz@redhat.com>,
	qemu-block@nongnu.org,
	qemu-ppc@nongnu.org,
	"Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v3 00/28] glib: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:44:42 +0200
Message-Id: <20210903174510.751630-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 2v216HUATfli

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
Tested with the following snippet:=0D
-- >8 --=0D
diff --git a/include/glib-compat.h b/include/glib-compat.h=0D
index 8d01a8c01fb..2b33dea71a8 100644=0D
--- a/include/glib-compat.h=0D
+++ b/include/glib-compat.h=0D
@@ -21,3 +21,3 @@=0D
  */=0D
-#define GLIB_VERSION_MIN_REQUIRED GLIB_VERSION_2_56=0D
+#define GLIB_VERSION_MIN_REQUIRED GLIB_VERSION_2_68=0D
=0D
@@ -26,3 +26,3 @@=0D
  */=0D
-#define GLIB_VERSION_MAX_ALLOWED GLIB_VERSION_2_56=0D
+#define GLIB_VERSION_MAX_ALLOWED GLIB_VERSION_2_68=0D
=0D
---=0D
=0D
Philippe Mathieu-Daud=C3=A9 (28):=0D
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
  hw/virtio: Replace g_memdup() by g_memdup2()=0D
  net/colo: Replace g_memdup() by g_memdup2()=0D
  ui/clipboard: Replace g_memdup() by g_memdup2()=0D
  linux-user: Replace g_memdup() by g_memdup2()=0D
  tests/unit: Replace g_memdup() by g_memdup2()=0D
  tests/qtest: Replace g_memdup() by g_memdup2()=0D
  target/arm: Replace g_memdup() by g_memdup2()=0D
  target/ppc: Replace g_memdup() by g_memdup2()=0D
  contrib: Replace g_memdup() by g_memdup2()=0D
  checkpatch: Do not allow deprecated g_memdup()=0D
=0D
 include/glib-compat.h       | 37 +++++++++++++++++++++++=0D
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
 38 files changed, 138 insertions(+), 153 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D
