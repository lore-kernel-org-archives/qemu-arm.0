Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2652922wru;
        Mon, 1 Jul 2019 06:25:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxkemB4bFsqETxHhrmahMQBRMRYKqaLCOV0rwtAvGkbkCqlfIKU4/Ofg9/EtnsgtPQg605f
X-Received: by 2002:a37:48d0:: with SMTP id v199mr20190387qka.318.1561987546154;
        Mon, 01 Jul 2019 06:25:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561987546; cv=none;
        d=google.com; s=arc-20160816;
        b=vRITO4XZjYWiLJ5UrO8XbZrfUrWupVcYLkfViZSVN5OkL7p1m3Q1bKtes6n9JDxJF5
         RCRU4tQ80wTe66ukBdv43B2l3BrUHFOHADuttqZ8bJGb58CvcjhBkkiheaeran+/S6ib
         QIS6foDcEpfW/l6jrAp809NiUDIeLdAgJXbgT9yE6KodtW+B3k/0vUrJSklOC1UrDmaS
         FmYMKJ/NEZItcqXQETmDaYiY+O54P4TTX9xcLVl9uIAjkXloIGh3pBjj34ZaUhhoAXWV
         3GWYxO2PvkoZtHae/3fqRf6i15eSDbYPt5rsD9GlMnUxGfqhYlzOPfCqhvbB/4VKHz2u
         e34g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=px2X39/fy2gIT49hvmCrQxStVfK+G7taTzIdf2aKiN8=;
        b=GAKyaZGmDkUB09T432QbzaGNia0q67HjHeXgsw3JNgzKYnyCdGLiEZ/iQm2Wc+5zlg
         O5ATpL58jvN7lx9GD/ToI5QIYakNg1Py2HgRrIj3GF755XxVq5Ect23sPeLnPhhMb3fE
         QK0RwdR5gLY8La96VNp3wmQ873zY1z+h4Mt8iKQ3kV5JqKCuDnRUknIzwMKtUHKwDS0t
         xMhB3Ze1/xrIPC3ccU2Ynw+cArHYVSR3A8qxtrm/vZBcMhsyIqB5Stltbx3JXXKwpiju
         mbsYHdnbIMzVt4bhni/IWHADlwrIFgu0TJXVYVATRgcIbzjkqdrO4OD/E3y33gdSB2/m
         pxJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id g130si8030000qkb.213.2019.07.01.06.25.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 06:25:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 284C0308FBAF;
	Mon,  1 Jul 2019 13:25:43 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C9C06085B;
	Mon,  1 Jul 2019 13:25:38 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yang Zhong <yang.zhong@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Rob Bradford <robert.bradford@intel.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jones <drjones@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 03/27] target/arm: Makefile cleanup (KVM)
Date: Mon,  1 Jul 2019 15:24:52 +0200
Message-Id: <20190701132516.26392-4-philmd@redhat.com>
In-Reply-To: <20190701132516.26392-1-philmd@redhat.com>
References: <20190701132516.26392-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Mon, 01 Jul 2019 13:25:43 +0000 (UTC)
X-TUID: 2OcH22SzX6Qj

Group KVM rules together.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/Makefile.objs | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 1cbe7cfdb4..7a933eebc7 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -1,14 +1,15 @@
 obj-y += arm-semi.o
 obj-$(CONFIG_SOFTMMU) += machine.o psci.o arch_dump.o monitor.o
-obj-$(CONFIG_KVM) += kvm.o
-obj-$(call land,$(CONFIG_KVM),$(call lnot,$(TARGET_AARCH64))) += kvm32.o
-obj-$(call land,$(CONFIG_KVM),$(TARGET_AARCH64)) += kvm64.o
-obj-$(call lnot,$(CONFIG_KVM)) += kvm-stub.o
 obj-y += helper.o vfp_helper.o
 obj-y += cpu.o gdbstub.o
 obj-$(TARGET_AARCH64) += cpu64.o gdbstub64.o
 obj-$(CONFIG_SOFTMMU) += arm-powerctl.o
 
+obj-$(CONFIG_KVM) += kvm.o
+obj-$(call land,$(CONFIG_KVM),$(call lnot,$(TARGET_AARCH64))) += kvm32.o
+obj-$(call land,$(CONFIG_KVM),$(TARGET_AARCH64)) += kvm64.o
+obj-$(call lnot,$(CONFIG_KVM)) += kvm-stub.o
+
 DECODETREE = $(SRC_PATH)/scripts/decodetree.py
 
 target/arm/decode-sve.inc.c: $(SRC_PATH)/target/arm/sve.decode $(DECODETREE)
-- 
2.20.1
