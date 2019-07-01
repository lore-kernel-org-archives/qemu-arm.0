Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2652974wru;
        Mon, 1 Jul 2019 06:25:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwljFv2FtxCOWpvCy9VWZ2qi4QcKnnf9MBojRtilCu/1vLo1d2KIgaaIH7qXa8Hv6QvVqsY
X-Received: by 2002:a37:ea0c:: with SMTP id t12mr19276522qkj.117.1561987548858;
        Mon, 01 Jul 2019 06:25:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561987548; cv=none;
        d=google.com; s=arc-20160816;
        b=pqsiVA03SbSawcE3uWhDjCU80lOkVpwYPx6+FFE+w78TAFUJTjgDO0VNQJCsGo7aDX
         U0agqa69OWMD65K9s8t8D/jJowIP2ix8K7wLzTePy8fini04sYOvCNg5dvVGrLgSXWon
         4grfr22Qg8wuz9JG8ivUhKAu3LBj1b/Ttn1I/xmnVv3PRLmyqnhVzhMXhQ6jlvMh/Se3
         2Jlpla6pPT6X7Dexc4971f5iPuWU+JW41QM6NFOLtH4Zwmf7RmkOlw7otxGte2l1ZPtH
         DIYeXLOUkITgesbRBuhshGjGs2igtu0R+VT8A/7c4Jg2N1QNnObMz8sSzjt6f7rsse6T
         qc1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=AWGasvbrBl9/VrHXPfUiBJ/2o+ADzhDbPXryZp3BNMI=;
        b=0GgH1+4j0IW3SVBk9Nv2+tfHtkKyoAO8iBsh/tv2tKhOt/02ocipDfELerdeb3CMzM
         TjxYWZzcrO24YsxunI5it5QdENjmex8TNNvimnhrgS4ezBmdA5YAx8dmapzyV4/UXRy4
         qZ6P/XF50Zf9S5eRdeijgGVY36XulHBBCNUEct9FNy62vD67e1SNsKMuIxBmygOyDqgH
         mqmCxIcfJLGYCiaOb6VL+NJ9D9js5i4WMM35fj3Utk7bLtrF38th8iE7/YrljWp6n9mF
         xsXE9zrI/itbKT71qOvZhL6byCjNKcIgDf8uVB5/NQQPhi6iPFtwEPnbopqDj1eL2EkT
         ozTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id d82si824955qke.153.2019.07.01.06.25.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 06:25:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4DF088E225;
	Mon,  1 Jul 2019 13:25:46 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95B5B6085B;
	Mon,  1 Jul 2019 13:25:43 +0000 (UTC)
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
Subject: [PATCH v3 04/27] target/arm: Makefile cleanup (softmmu)
Date: Mon,  1 Jul 2019 15:24:53 +0200
Message-Id: <20190701132516.26392-5-philmd@redhat.com>
In-Reply-To: <20190701132516.26392-1-philmd@redhat.com>
References: <20190701132516.26392-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Mon, 01 Jul 2019 13:25:46 +0000 (UTC)
X-TUID: IlqO0LX3axKp

Group SOFTMMU objects together.
Since PSCI is TCG specific, keep it separate.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/Makefile.objs | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 7a933eebc7..3fcda66132 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -1,8 +1,9 @@
 obj-y += arm-semi.o
-obj-$(CONFIG_SOFTMMU) += machine.o psci.o arch_dump.o monitor.o
 obj-y += helper.o vfp_helper.o
 obj-y += cpu.o gdbstub.o
 obj-$(TARGET_AARCH64) += cpu64.o gdbstub64.o
+
+obj-$(CONFIG_SOFTMMU) += machine.o arch_dump.o monitor.o
 obj-$(CONFIG_SOFTMMU) += arm-powerctl.o
 
 obj-$(CONFIG_KVM) += kvm.o
@@ -35,6 +36,8 @@ obj-y += translate.o op_helper.o
 obj-y += crypto_helper.o
 obj-y += iwmmxt_helper.o vec_helper.o neon_helper.o
 
+obj-$(CONFIG_SOFTMMU) += psci.o
+
 obj-$(TARGET_AARCH64) += translate-a64.o helper-a64.o
 obj-$(TARGET_AARCH64) += translate-sve.o sve_helper.o
 obj-$(TARGET_AARCH64) += pauth_helper.o
-- 
2.20.1
