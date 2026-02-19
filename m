Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F41E9A048
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 14:35:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt57k-0000QI-4q; Thu, 19 Feb 2026 09:35:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vt57f-0000Nf-Ia
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:35:20 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vt57c-00032X-Ac
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:35:18 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4807068eacbso9050415e9.2
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 06:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771511701; x=1772116501; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1AeTxyxPl8LpE2VymYK8BbXAEvEM1cSusvtLGqxUHFw=;
 b=mYhu+2th7NbL1xJ97To50qUND7cZyVTaz3gYJnhWKj923m+WIeITTZK6o2VzmzDI7o
 Y39G4BZkyOKH8I/VivinDuVSZg1uHwRgFOCYXULnLgXglGwT27Za9CROf3wduvn2uUM5
 ummyl5/T9+Y2q87bvI7TLXPHsSLF7EmXBgxrbBQIZ5Vr+28YoJLqIJku+5oMb/NvhHSo
 8lp/7T35xO7VGNbP/uVjiqIdfXeDRWvxNYyEX1yBIDORwAWybAncCM6hK0b+bOWOuBdh
 /q/xuzmfW5BhIoifJ1MqZuPOmnzTtMXxk6n6Jnr66D5MJNgkPQ4AfLkTYIzH+HPu2JYu
 B2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771511701; x=1772116501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1AeTxyxPl8LpE2VymYK8BbXAEvEM1cSusvtLGqxUHFw=;
 b=ddKNcV1agBubKig010RBESyTQXwfZrSXfGFYyQeKvU49LNijAlXLFH/jX6zVMm488G
 tyKENtMstWIpJMhNUOBcMRWBBy2udXOEKd18jwNv8ajV8bN0Aq+csyS18jG3CvTmjekI
 l8csRMPl5S2ZhSUlQ45DV2WHhtEKXbSHx1dW/9CFos+SsdGH55jIz3TwKzSG46GJ0jRh
 TMuQyGeLbqIqySCu6squelP+U7AjMnY5qJ7NCSUSMtFoJpIlAiDzRiY3dYUTAEqnGdfv
 esXU4iRK5SbRuEVg+Fl9G4dNm4br4+C6Bn0E7KvNtQzOpjJcPOAdG6WJ3YJpmwVsME9Q
 r8/w==
X-Gm-Message-State: AOJu0YzxQtm6oIJWbn0IbJ2+Zl0vGthlqWTQzHxuhG6zAlnHooEpqhV/
 TSBPG2rHXaUgFvAFl1pJ9JvkCzvbCEDZECbrnteQF22OyhPpnzOY10/7
X-Gm-Gg: AZuq6aKkk6OGqKxSgOWLv5ddaVebXxFpUktpmsIoDEj9w/UT0eNITvNwdiaYFkoJmml
 6oeh0N/2b/7SWzCgimf2Ik512PHUTbPRJSs9+IYFE82eaYjoynepiBGQ2nOqUjcHMLAJQlfGVv1
 nNi33GEieUArnvHEXb0z30tAZ9ANcDFLREmG1rfYu8h6suzsFUwipiWIJvQVwlDDk5L4S+amrku
 P4gBmLC0VYQi4qOx/v/CZ1ovlMg3Eb1+9BQEDo4As+0phvZ6YLdBgoW+tE+Nf9zwwzWx91joeQ6
 cso+70zwvkVMz88a9bwiMXrn2iKxY4zYbRcEdxlou7HFybcZOCe/1PfV7Dlg18hYv5F47IHqE2f
 EQBef/yJeRts9mZSG85TH09xBWlcXoLccm1hUmQw0n2FCwPdkUIP50/PDdXFTayMjxlgZHMLYVY
 JUUf+mF/L9jwmQrxYFyFX3Jj6JLNUoWr63+slZi4KzXlXTZCqhEok3WEEwVbnOeVs+c5cl
X-Received: by 2002:a05:600c:450c:b0:471:700:f281 with SMTP id
 5b1f17b1804b1-48398ae4a01mr102282065e9.25.1771511700771; 
 Thu, 19 Feb 2026 06:35:00 -0800 (PST)
Received: from thinkpad-t470s.. (93-143-129-182.adsl.net.t-com.hr.
 [93.143.129.182]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-43796abd259sm52022770f8f.24.2026.02.19.06.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 06:35:00 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, peter.maydell@linaro.org,
 artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com, balaton@eik.bme.hu
Subject: [PATCH v2 17/33] hw/core/fdt_generic_util: realize cpu clusters
Date: Thu, 19 Feb 2026 15:33:16 +0100
Message-ID: <20260219143332.3316679-18-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219143332.3316679-1-ruslichenko.r@gmail.com>
References: <20260219143332.3316679-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

Realize cpu clusters at the end of fdt machine creation
process, as they need to be created after cpu's nodes
are realized.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/core/fdt_generic_util.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/core/fdt_generic_util.c b/hw/core/fdt_generic_util.c
index 63390e2f17..3179248142 100644
--- a/hw/core/fdt_generic_util.c
+++ b/hw/core/fdt_generic_util.c
@@ -157,6 +157,16 @@ static void fdt_init_all_irqs(FDTMachineInfo *fdti)
     }
 }
 
+static void fdt_init_cpu_clusters(FDTMachineInfo *fdti)
+{
+    FDTCPUCluster *cl = fdti->clusters;
+
+    while (cl) {
+        qdev_realize(DEVICE(cl->cpu_cluster), NULL, &error_fatal);
+        cl = cl->next;
+    }
+}
+
 FDTMachineInfo *fdt_generic_create_machine(void *fdt, qemu_irq *cpu_irq)
 {
     char node_path[DT_PATH_LENGTH];
@@ -172,6 +182,7 @@ FDTMachineInfo *fdt_generic_create_machine(void *fdt, qemu_irq *cpu_irq)
         while (qemu_co_enter_next(fdti->cq, NULL)) {
             ;
         }
+        fdt_init_cpu_clusters(fdti);
         fdt_init_all_irqs(fdti);
         memory_region_transaction_commit();
     } else {
-- 
2.43.0


