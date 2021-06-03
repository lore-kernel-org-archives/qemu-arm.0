Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp416356lfa;
        Thu, 3 Jun 2021 10:13:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQgsgSn0WNL0EYUCfoo4kzNry8AqFWBrATHHpUPbDckF1Ggl10a83I8+tzY2wtQT0FxQwH
X-Received: by 2002:ab0:30a8:: with SMTP id b8mr55120uam.85.1622740408000;
        Thu, 03 Jun 2021 10:13:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622740407; cv=none;
        d=google.com; s=arc-20160816;
        b=GjbOk9u6eQHEIposFifKR9DTbq62M22k5fILgmTtkgZ5GBoBAa71awEEYVas5C7E7X
         xwMve/GH2b+Ax4KukL2rJfLZgOAruQ6/ClVW298BFnepBuMu+BMS8MameFaV8wFxSQSr
         6PZT88/8QN+qKaQqiMKiw7BL6uYauuO5KOzAUFlC4zPs9Dpg8ctNVbwF2GZPcaV1JsUN
         q4+sRihr5He6bwKifYUA3l59dFN1ZmfMc3FXVW5zxNtKYKvmy8PA8HNXo8FOzmS+IDxP
         d20fMiX/vZIS6t/ErbqHmgNbMtdaFLiuPFHlH0chr8t1vRQuJsDeizTtVNJ8X8fDYku6
         z0HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=T5utTavgkp5XUgjC2Nw+5xAxnWI2T3w58+Vqg3JiwKg=;
        b=EqS+tZ1lTokkNndUeAcgQL+5J7hDQR83Sk93P/MEsPVB6lt7s+hpAyn2GwRFu1231O
         /PXB8FUMVqDC6mDPQ4eV2cQN4wQvXHFp7cX8CBcWvrH+5swTrHVEQukd7R+8W9a2kIXx
         f2unThGJAeTxEEBsWfLKtHfr7iLkczMkey7qXyx8FAZCRLjblYPKK4hJ+79iX60ooPNe
         Om+lhWY0HzFP5IIfZ+1Pm/PUaX/Y8tHqlK0QFIpvicMjRVbyeXXUo3TWtnd4jVs8kbSP
         X+jIXuzJtOlgXHB6Q8ONHpNdMtmEt9ftGmymCntVjSHzQ6WFlyiXy6FhMBTLqoyh1w1i
         aKOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I811LdHo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6si2052937uaa.98.2021.06.03.10.13.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jun 2021 10:13:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I811LdHo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1loquN-0002ro-95
	for alex.bennee@linaro.org; Thu, 03 Jun 2021 13:13:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1loqu2-0002Bm-0h
 for qemu-arm@nongnu.org; Thu, 03 Jun 2021 13:13:06 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1loqtz-0005Qh-Hx
 for qemu-arm@nongnu.org; Thu, 03 Jun 2021 13:13:05 -0400
Received: by mail-wr1-x42d.google.com with SMTP id a11so4727839wrt.13
 for <qemu-arm@nongnu.org>; Thu, 03 Jun 2021 10:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T5utTavgkp5XUgjC2Nw+5xAxnWI2T3w58+Vqg3JiwKg=;
 b=I811LdHo1ma4E4wT9cIT+n27QkxysNMTcgUuUy5yqpacEX/En63EqpH0oB4J4Jj0dS
 HUgz/Wbr3TQTlW02Fe8657irJRZ17T+u7iAc/DD9gwAPDUEdrtsHlIKN1zpGHiW18r75
 N0QdXOt/Z9XhzB+55JnmhbynTVAAmSFy0ZUcIYSbITYBc/wGdR3PDdZnLe0/oddO3ry0
 w9eJng8RDFbEil0gaZA2wyahCM9oG9+MRuX2NLqnAhw5hpLylP+6ip8ddoGV62+2Ne2v
 Iw0awxTkrZeLKvR7Ye2YwD7XCwRWKPdHnch3+dI46KFv/Cy6q1J4cFHpcujoIJun899r
 PO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T5utTavgkp5XUgjC2Nw+5xAxnWI2T3w58+Vqg3JiwKg=;
 b=rJSd2ya4UabzKQC1BukVUDONS0276Eh1DVxvsONVdjsK6hGKF04fcTk+Npa6AMbPu7
 hJYMzSYjNLMnd3lLFLYQdg8DsRtWRTr89y4y9HUmDc94qdf79QoV0l7gFQYRStpFSdmW
 rHlum87XGhyinjUWkH7Q46lUKztHWfYQIdfI2ygG11R7Aya52zaZWT2J9frL6DMu/jzx
 hXvUjlQsLDg7oAE9rICAdOMUbNq3/KbKP5hEGAr3F8bv6hWwCDQEYJuzsb+Uc+qOjh4D
 lSjXGKa67rgzvQyAzYAE8llCiP2e5e4la7mcqeYI5klNyTTmi6e78rbLXdj4E5KfO2+3
 v8QQ==
X-Gm-Message-State: AOAM53288ukYQK4xVPOk7OKjSxZjv0bLYC7Z1NsBgKQx1R+lkFNACF3B
 Xyi5Wl6fi95chd3QUVtOu64pRPNKxKLpi01F
X-Received: by 2002:adf:e487:: with SMTP id i7mr43416wrm.348.1622740382214;
 Thu, 03 Jun 2021 10:13:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m5sm6190319wmq.6.2021.06.03.10.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 10:13:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/acpi: Provide stub version of acpi_ghes_record_errors()
Date: Thu,  3 Jun 2021 18:12:57 +0100
Message-Id: <20210603171259.27962-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603171259.27962-1-peter.maydell@linaro.org>
References: <20210603171259.27962-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Swetha <swjoshi@microsoft.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VDCl5B4iJ5oA

Generic code in target/arm wants to call acpi_ghes_record_errors();
provide a stub version so that we don't fail to link when
CONFIG_ACPI_APEI is not set. This requires us to add a new
ghes-stub.c file to contain it and the meson.build mechanics
to use it when appropriate.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/acpi/ghes-stub.c | 17 +++++++++++++++++
 hw/acpi/meson.build |  6 +++---
 2 files changed, 20 insertions(+), 3 deletions(-)
 create mode 100644 hw/acpi/ghes-stub.c

diff --git a/hw/acpi/ghes-stub.c b/hw/acpi/ghes-stub.c
new file mode 100644
index 00000000000..9faba043b85
--- /dev/null
+++ b/hw/acpi/ghes-stub.c
@@ -0,0 +1,17 @@
+/*
+ * Support for generating APEI tables and recording CPER for Guests:
+ * stub functions.
+ *
+ * Copyright (c) 2021 Linaro, Ltd
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/acpi/ghes.h"
+
+int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
+{
+    return -1;
+}
diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index dd69577212a..03ea43f8627 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -13,13 +13,13 @@ acpi_ss.add(when: 'CONFIG_ACPI_PCI', if_true: files('pci.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_VMGENID', if_true: files('vmgenid.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_HW_REDUCED', if_true: files('generic_event_device.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_HMAT', if_true: files('hmat.c'))
-acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'), if_false:('ghes-stub.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_X86', if_true: files('core.c', 'piix4.c', 'pcihp.c'), if_false: files('acpi-stub.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
 acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
 acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
 acpi_ss.add(when: 'CONFIG_TPM', if_true: files('tpm.c'))
-softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c'))
+softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c', 'ghes-stub.c'))
 softmmu_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c', 'aml-build-stub.c',
-                                                  'acpi-x86-stub.c', 'ipmi-stub.c'))
+                                                  'acpi-x86-stub.c', 'ipmi-stub.c', 'ghes-stub.c'))
-- 
2.20.1

