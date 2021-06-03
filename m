Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp416613lfa;
        Thu, 3 Jun 2021 10:13:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZzwwb6fqwtb1evmjy7olv1mWbCFza4lMUHIiJ6V8BC+quS0q0GLfaykp8S4l/IEwTzMM5
X-Received: by 2002:a67:2246:: with SMTP id i67mr599745vsi.17.1622740421622;
        Thu, 03 Jun 2021 10:13:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622740421; cv=none;
        d=google.com; s=arc-20160816;
        b=hxsAN8Fe9feN0cVtIV8p5eXZ55h7bl4uutsKOaGbAYm9V/ytqgS0PG2aPEabrh1h3B
         FVW/H9YF94dv8hhQMjKh7saZByIKUQrXzTdzXmrTO1MZ93ACDmoTBjOXIhHPusnlldat
         hqVXI4+LmAPV1Pp/Zy+/r4jovqrGQx8vE7EbdX6Kf4kDuXSOiOW0PIK1Hnu+q4S54mAm
         kw6dFdy+kxCj6jQYJ4bdQgH9tILD1p66nORt1LBevSMrwCBPzjHG3ODAnppM2qrpDtjh
         Q9OOdm35YlE2tTAqdmnxJJDe7Jj3DT/ZtD11imEz4lsuG+ZoFAP3t+aUNZq/3b7DKQW9
         qBcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HOYJkr4GhaglKvXMUgqS2H3+raKjJM8WQVTi0Xzd4rQ=;
        b=siBRpg+92yHhsAp1VZDGvTaYcJxbtwoIjTPno7feuhZ6389838XsRqkhTc51HXU4gr
         3HEDozrOv4+/Cg1z3QsPgNn/3m3uX6U/asmFzZYQ7+H+iunjI6I5EL+LshJ7KdNPQtNP
         L10dAfrF3+3Hx8zYZMuaDvaG9ysDntlqOFIxOEFhLnIGa+rMOfLER2l2Mfbf62Y2ITy1
         t+7PWMJhrMt7QGL43CCx17cUl2oeOHV+B/iAn/k/qECEzS7MtPnwFRQWPpBkZo9kx31s
         DXrZS5Rl3eP48YAoWHtU1ViQ6NOv1fomEjeZZ35GQpUX9XVR9Xl4Mn7D+OrNPAPNzSLo
         CxCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LToVOLFr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2si920008ual.117.2021.06.03.10.13.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jun 2021 10:13:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LToVOLFr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1loqua-0003ec-13
	for alex.bennee@linaro.org; Thu, 03 Jun 2021 13:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1loqu2-0002C9-74
 for qemu-arm@nongnu.org; Thu, 03 Jun 2021 13:13:06 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1loqu0-0005R3-C4
 for qemu-arm@nongnu.org; Thu, 03 Jun 2021 13:13:05 -0400
Received: by mail-wr1-x433.google.com with SMTP id a11so4727880wrt.13
 for <qemu-arm@nongnu.org>; Thu, 03 Jun 2021 10:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HOYJkr4GhaglKvXMUgqS2H3+raKjJM8WQVTi0Xzd4rQ=;
 b=LToVOLFrdHQZznBHEf4jArdvlaVTud5D7fUeyUiAArgUPkPwMu2aPC0GWvzL92cviu
 2FAftuB5vgctSfnJ2VdRM/f2U4nWR54+Vghy8CKbW4PH2gjbIk9QOT7WJeGxewICWu3J
 EN6wac2U1UT2IK85VkCHpnBsY1nRw+ytxNMBCjWKshJwvOXcd8MC3RWU2aV0jmlPqnmu
 Mjk45tfsmtWrlB5gatgjZ7Ek7AQp7Kn+9FRz1WwldERSDIN6zrfntYD/fZhFMCP6TbGQ
 gnCmYFQrDhpWNZh9cdoCgkpDjUr/O5JQpMc9W6GUlRfYHLBeXt2G+pLnM7qUNDMjGW1X
 f1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HOYJkr4GhaglKvXMUgqS2H3+raKjJM8WQVTi0Xzd4rQ=;
 b=i16xqJzu+tJYHojJPgyASkmiYYNZz5IIExIBw1oHoOfUmGAXpfrmO+tr/PQzPtvdWo
 7N8rLozxo4TgyIr0hIFY1CSa9C2+TlVg88eHPi7hD8s6YUWtQm/XMxWdw27StK2yXaWm
 9Cw5LpZ7SCSL55Jsuu2BOVd+1uQoc8+7DkTaEvVdLTtdkHkaAojZcR+xWFphS1E9TU26
 ojpSev7kBldhnlNDed/m7N4KkaEgu538HjRaiijyM2rK2x3F9Y5lzuqZ/Vg/g06bWR3p
 XqsGuEdR6COt+keDExR5ASy4yZ0dUAeEyyhwGsWzMSlDayaSv25pUkoXCQaji0v9pMNK
 Xynw==
X-Gm-Message-State: AOAM532iaU4pb8ou7cQlvo0ASduEg2SKmhC4J09f7m9dzV9VcaV18IvC
 xB1fCswgZSAnoAGdHBt8YJZSVjnTh63iQXBU
X-Received: by 2002:a5d:5251:: with SMTP id k17mr24285wrc.153.1622740383129;
 Thu, 03 Jun 2021 10:13:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m5sm6190319wmq.6.2021.06.03.10.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 10:13:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/acpi: Provide function acpi_ghes_present()
Date: Thu,  3 Jun 2021 18:12:58 +0100
Message-Id: <20210603171259.27962-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603171259.27962-1-peter.maydell@linaro.org>
References: <20210603171259.27962-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: BoIfKpfVv3hF

Allow code elsewhere in the system to check whether the ACPI GHES
table is present, so it can determine whether it is OK to try to
record an error by calling acpi_ghes_record_errors().

(We don't need to migrate the new 'present' field in AcpiGhesState,
because it is set once at system initialization and doesn't change.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/acpi/ghes.h |  9 +++++++++
 hw/acpi/ghes-stub.c    |  5 +++++
 hw/acpi/ghes.c         | 17 +++++++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 2ae8bc1ded3..674f6958e90 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -64,6 +64,7 @@ enum {
 
 typedef struct AcpiGhesState {
     uint64_t ghes_addr_le;
+    bool present; /* True if GHES is present at all on this board */
 } AcpiGhesState;
 
 void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker);
@@ -72,4 +73,12 @@ void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
 void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
                           GArray *hardware_errors);
 int acpi_ghes_record_errors(uint8_t notify, uint64_t error_physical_addr);
+
+/**
+ * acpi_ghes_present: Report whether ACPI GHES table is present
+ *
+ * Returns: true if the system has an ACPI GHES table and it is
+ * safe to call acpi_ghes_record_errors() to record a memory error.
+ */
+bool acpi_ghes_present(void);
 #endif
diff --git a/hw/acpi/ghes-stub.c b/hw/acpi/ghes-stub.c
index 9faba043b85..c315de1802d 100644
--- a/hw/acpi/ghes-stub.c
+++ b/hw/acpi/ghes-stub.c
@@ -15,3 +15,8 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
 {
     return -1;
 }
+
+bool acpi_ghes_present(void)
+{
+    return false;
+}
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index a4dac6bf15e..a749b84d624 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -386,6 +386,8 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     /* Create a read-write fw_cfg file for Address */
     fw_cfg_add_file_callback(s, ACPI_GHES_DATA_ADDR_FW_CFG_FILE, NULL, NULL,
         NULL, &(ags->ghes_addr_le), sizeof(ags->ghes_addr_le), false);
+
+    ags->present = true;
 }
 
 int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
@@ -443,3 +445,18 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
 
     return ret;
 }
+
+bool acpi_ghes_present(void)
+{
+    AcpiGedState *acpi_ged_state;
+    AcpiGhesState *ags;
+
+    acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
+                                                       NULL));
+
+    if (!acpi_ged_state) {
+        return false;
+    }
+    ags = &acpi_ged_state->ghes_state;
+    return ags->present;
+}
-- 
2.20.1

