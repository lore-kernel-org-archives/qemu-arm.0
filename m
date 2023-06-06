Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3672187ejb;
        Tue, 6 Jun 2023 11:25:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6O5ArmNjQS/4932O5CFwyEkPHRl+3CGr37zapwFFQmItMpAfFkOHcHWNec1qSzWaV+g85k
X-Received: by 2002:a05:6214:2a47:b0:62b:68bf:7c86 with SMTP id jf7-20020a0562142a4700b0062b68bf7c86mr403842qvb.42.1686075906548;
        Tue, 06 Jun 2023 11:25:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686075906; cv=none;
        d=google.com; s=arc-20160816;
        b=OgYs4BJE8iVSrWxy59NsO61MpNvTNkDunAtEPgorVLAjqZt6FBYqyuWagpkJFfqKJI
         Lh9pKXraLEZHBNOXp9CbUqrPzNRPB2+g97AOShE9KUfpcQq05Xz71eKHAWG8alhjC0pK
         aYHFfCBxetAPsRCIxkOf/5Ezw2K+Dk9eYWJtdi+kLNvRZikBx5agLbVhQxYIwOXYGINE
         ftjmhdSMhXzcqa7mgk1ofBgByViC34Qyw5YKIhnjZvZETVJ26Oz3Mw+LFLdTQk9Gg/RW
         jMIpeKUWDkM3gqkcQ1/1pSSA/oKKJEYixdLz6gY7YSLhOFBp8TkGF8fohS3Rzn6g5chk
         bg+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=dMHh37OH5dp1UmmBHxXfMmQbFRy1HKZJbI7PSM+Ptyc=;
        b=wqJ5UK7sJ7TaBXA/fGmEFQ8pWKvydVWS6AZ2ycsTenQP9Zc/tHyKwiWPgK84Uyh26K
         0lwpYDcUg70iP4Jvbm7Dcywv4isrTfgdnAClnUVsCpvVsgMDRIl9LRB+ZB01+RN/1Ujq
         qNAracA53mhx2va3BGriiYGSuJDRAV/pEdY0Nl32dPw6xXHrU+FslmMtPpvQ9gB5+Z8Q
         KRhFKMUBslk+mq8+NtEoe19K2W8grH8a1BI45UbZvk4CysTEEh1NlpEJ/VfUDw/TbNkw
         8DUzkH9/7ic1cGv9NGz5Z6DjOxNwXl0zAaMEpA+LyWpH4ymC0vpMYh04KiwCkcp5JJVX
         tDpw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ey8-20020a0562140b6800b00627552fa1dfsi6956682qvb.67.2023.06.06.11.25.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 11:25:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6bMJ-0000jq-Mp; Tue, 06 Jun 2023 14:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q6bMG-0000hs-Jr; Tue, 06 Jun 2023 14:24:40 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q6bME-0004ZX-Hk; Tue, 06 Jun 2023 14:24:40 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 85C25260287;
 Tue,  6 Jun 2023 20:24:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NiiARN_IFVEh; Tue,  6 Jun 2023 20:24:34 +0200 (CEST)
Received: from applejack.lan (83.21.93.182.ipv4.supernova.orange.pl
 [83.21.93.182])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id B7B3E260AAF;
 Tue,  6 Jun 2023 20:24:32 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org,
 Shashi Mallela <shashi.mallela@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 2/2] hw/arm/sbsa-ref: add GIC ITS to DeviceTree
Date: Tue,  6 Jun 2023 20:24:14 +0200
Message-Id: <20230606182414.637467-3-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606182414.637467-1-marcin.juszkiewicz@linaro.org>
References: <20230606182414.637467-1-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nOMKw1gHd74N

We need GIC ITS information in DeviceTree so TF-A can pass it to EDK2.

Bumping platform version to 0.2 as this is important hardware change.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

---
 hw/arm/sbsa-ref.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 1520cd598c..2bd9e370a7 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -183,8 +183,15 @@ static void sbsa_fdt_add_gic_node(SBSAMachineState *sms)
                                  2, sbsa_ref_memmap[SBSA_GIC_REDIST].base,
                                  2, sbsa_ref_memmap[SBSA_GIC_REDIST].size);
 
+    nodename = g_strdup_printf("/intc/its");
+    qemu_fdt_add_subnode(sms->fdt, nodename);
+    qemu_fdt_setprop_sized_cells(sms->fdt, nodename, "reg",
+                                 2, sbsa_ref_memmap[SBSA_GIC_ITS].base,
+                                 2, sbsa_ref_memmap[SBSA_GIC_ITS].size);
+
     g_free(nodename);
 }
+
 /*
  * Firmware on this machine only uses ACPI table to load OS, these limited
  * device tree nodes are just to let firmware know the info which varies from
@@ -221,7 +228,7 @@ static void create_fdt(SBSAMachineState *sms)
      *                        fw compatibility.
      */
     qemu_fdt_setprop_cell(fdt, "/", "machine-version-major", 0);
-    qemu_fdt_setprop_cell(fdt, "/", "machine-version-minor", 1);
+    qemu_fdt_setprop_cell(fdt, "/", "machine-version-minor", 2);
 
     if (ms->numa_state->have_numa_distance) {
         int size = nb_numa_nodes * nb_numa_nodes * 3 * sizeof(uint32_t);
-- 
2.40.1

