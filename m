Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2669497lfb;
        Thu, 7 May 2020 23:25:56 -0700 (PDT)
X-Google-Smtp-Source: APiQypLnbL3HEFTkh5zaKGA+9uScYvMiYwvFkzKBbVreK7OWrX/t5Ecp/wc1s4ex/T1HcejxM3PW
X-Received: by 2002:ac8:35cc:: with SMTP id l12mr1339879qtb.291.1588919155954;
        Thu, 07 May 2020 23:25:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588919155; cv=none;
        d=google.com; s=arc-20160816;
        b=uo3f9OTuabsVGdLgFwd+Pg4Ej+ZjJI+MW1HfEQ2hMzZyX6r8c3UbOqQg15q+WSjmRT
         IY1v0AylGFW82IlH1N14zZy/T839Qz5n6/lXgzzkCqJi0t48327Uy5EzpfkqymR/2dUj
         XnEpHJqJBnhjnecZYTGlhp0pTplR0O1/o3YcMxd99HuvIvi5CkjW1ueKpeGyegTbVie0
         wNedSBwdg1Rt2Paa+JzNo2gmveqfH3VTgHQbKPE6rTcEzrFmkV94wIu3pHzf/9NK09cK
         7w9Y78v7jSHPYNUPkgQnEYEj8tNCgCB2+l4JXOmie7B8JExZYSDaQ8PqDoaCHe8a5RwZ
         kaNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=87P32Kl/23kk0D1p3Mn+1uBjkyslr+Glpw+ZqggV/4k=;
        b=VZ7PztPnYCowQ+DX3weBckWX0maKNX58ayuif7cNHto3xcM5mS6l0HlMHCz8IZHc1n
         NszaI9Wp1CE2fZ8H0jJMr7Cc1Ua302UtzaafC8O5yd+Nqtu+unKyU6aYnN6D9jsjmR4m
         YbrjeG6XDP/Pa3EiP7qk9fN2S8wIcFdEcc0yoGjFxNkuqVeIgV3EUp00dX149aCDD1pf
         /L3MhaacHAp2UnezB3wjuA9re5E2DGnDWWVY0O38kJ4fXyyfe1G/FrUXGwEdwprlmxuu
         4xLpRQ3AXY0+a5G0jSFjfVZaksGsGzweyfgN2ZzQPi8ge/r4/l9+jconm6ENoiQCrs0m
         EgAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fG33HLfx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id j5si542824qvp.1.2020.05.07.23.25.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 May 2020 23:25:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fG33HLfx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jWwSJ-0007KR-DV
	for alex.bennee@linaro.org; Fri, 08 May 2020 02:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jWwRm-0006dF-3d
 for qemu-arm@nongnu.org; Fri, 08 May 2020 02:25:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44902
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jWwRl-0002DM-3U
 for qemu-arm@nongnu.org; Fri, 08 May 2020 02:25:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588919120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=87P32Kl/23kk0D1p3Mn+1uBjkyslr+Glpw+ZqggV/4k=;
 b=fG33HLfx+uldlo6dO5WMOGEAUFN2/MxBFgBTjmY1rh7aZIA51s+mNl8qeczWwvXlKBOKzM
 pB9wuiKT+UmUxG0shfJSSxF7iy7Dt69afxT1LdwhPdIMsxRxNDOlIvW7tBUr/PXSn5NMvY
 XGiW35KjlPs91WoEJUNL7jrhMPWOWMg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-gmxWQOvYNgK4x-lCHZ1uMg-1; Fri, 08 May 2020 02:25:18 -0400
X-MC-Unique: gmxWQOvYNgK4x-lCHZ1uMg-1
Received: by mail-wr1-f70.google.com with SMTP id a3so404043wro.1
 for <qemu-arm@nongnu.org>; Thu, 07 May 2020 23:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=msg2yf/FEYiTLrt9QncWwUsE+vw2haTQYPoKbGwSl1Y=;
 b=r5bFT8TPJvSIQyU2DnAXxONopHGuarBcXlh1ZUp3XNwZVaoCac7ksfYGL0M3DVuqzq
 c4wZVWtGg1G1PrNZ8Tgm0ltCStx4/6op/DwdLiMzxVm7sFMz336fFA3I8CLqTUJatLC4
 O3tfpHK1kAsq9ZQJAdFw8/gzQDmN8/laVR7TOh1DPfsmrvbHgE8fFUQtJl4i3usRocul
 bD8be04eXmDl0HJCFUpVsS1hRix7r/OV4LHSpSlFCc3mROYjotWUnEpbfQnw79L7qoDU
 TY5CjzmRuuy8uGc5XunQD2HjOA17vvbsuCn2IrNhtc/8hovFPDSAD9c88z3xbmhjF5nH
 3MGQ==
X-Gm-Message-State: AGi0Puax2EYGkrKRpNFtaY+4qbcy5eB0eOcYuCem0Mm2ratb7czOZ6sJ
 rxWzmV9QGWGs87owNXGXHJJLi193IPMTquEwHRmrISMSUQHWWiYqZTZmIGGuuBd6+RWYUXIaXVD
 ihW+APkplmsKa
X-Received: by 2002:a1c:b684:: with SMTP id
 g126mr13615159wmf.163.1588919116995; 
 Thu, 07 May 2020 23:25:16 -0700 (PDT)
X-Received: by 2002:a1c:b684:: with SMTP id
 g126mr13615147wmf.163.1588919116818; 
 Thu, 07 May 2020 23:25:16 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id a8sm1241280wrg.85.2020.05.07.23.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 23:25:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] hw/block: Let the NVMe emulated device be target-agnostic
Date: Fri,  8 May 2020 08:24:55 +0200
Message-Id: <20200508062456.23344-4-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200508062456.23344-1-philmd@redhat.com>
References: <20200508062456.23344-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 02:25:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beata Michalska <beata.michalska@linaro.org>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K6gpYWI4BXHl

Now than the non-target specific memory_region_msync() function
is available, use it to make this device target-agnostic.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/block/nvme.c        | 6 ++----
 hw/block/Makefile.objs | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 9b453423cf..8a72dce0e6 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -46,8 +46,7 @@
 #include "qapi/visitor.h"
 #include "sysemu/hostmem.h"
 #include "sysemu/block-backend.h"
-#include "exec/ram_addr.h"
-
+#include "exec/memory.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "qemu/cutils.h"
@@ -1207,8 +1206,7 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr a=
ddr, unsigned size)
          */
         if (addr =3D=3D 0xE08 &&
             (NVME_PMRCAP_PMRWBM(n->bar.pmrcap) & 0x02)) {
-            qemu_ram_writeback(n->pmrdev->mr.ram_block,
-                               0, n->pmrdev->size);
+            memory_region_msync(&n->pmrdev->mr, 0, n->pmrdev->size);
         }
         memcpy(&val, ptr + addr, size);
     } else {
diff --git a/hw/block/Makefile.objs b/hw/block/Makefile.objs
index 47960b5f0d..8855c22656 100644
--- a/hw/block/Makefile.objs
+++ b/hw/block/Makefile.objs
@@ -13,6 +13,6 @@ common-obj-$(CONFIG_SH4) +=3D tc58128.o
=20
 obj-$(CONFIG_VIRTIO_BLK) +=3D virtio-blk.o
 obj-$(CONFIG_VHOST_USER_BLK) +=3D vhost-user-blk.o
-obj-$(CONFIG_NVME_PCI) +=3D nvme.o
+common-obj-$(CONFIG_NVME_PCI) +=3D nvme.o
=20
 obj-y +=3D dataplane/
--=20
2.21.3

