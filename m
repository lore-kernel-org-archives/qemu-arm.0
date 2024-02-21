Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2045823ejb;
        Wed, 21 Feb 2024 09:03:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXmAPMZmHMDAw58Fi2h2EM2WGZacd6GYfZSLLfhWn3Ya3flbEHpbcJDsSapdFscQb3bmwxBJw9RN4uOqDMNcM53hqSn85K0
X-Google-Smtp-Source: AGHT+IEDffUnfZQdiwDX+LYQXZrawV3W/5UQ27poHeC8Nv9Lh2OlnpQJVwSOZEu6FH0o9SWNnCyV
X-Received: by 2002:a05:6102:34d7:b0:470:575d:4c2c with SMTP id a23-20020a05610234d700b00470575d4c2cmr8384113vst.34.1708534988873;
        Wed, 21 Feb 2024 09:03:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708534988; cv=none;
        d=google.com; s=arc-20160816;
        b=yB2O4+344UjvfOmeiIscX1wlcB/FVzcMMgUmZnu905C2vOi4PTN63DxASi8SG0hhwR
         wyQPAEB+/rfzsljlD8B9ScIZpYAmCL2mUjZuVJI+g+mpvFWLZvYkANdML5A7jOO3KTuB
         8DPO/Q/q5IPCbFzGFD6f/I8SpQXMn2K6+XJcckCYgPVykqIYFH9Iep2nHH7e+YTYa4ES
         eNe9PbG9s/FZJYB6HBri46fsP8RdldcIQfJNDgzIgYEdao7+cwyMUxFDPkxvN4jmHK7X
         xJa0ray3iO8BvWwE8AA2V2TzhqDxq4uL0xQsT7dGj0f4BOua+osBVtOulWhiVuGK81GS
         gvGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=pUXKy3XKiq+5p9TeSf8xJ6UxKnHtPGAsZsl63BQGiN8=;
        fh=0bDvF4tMM1aBHsjXBYPBkMZ8CNAp9gmxDkdJon1fNKM=;
        b=HZqbAeAnSC2yfsxWy04wBc94Xc/Pzaj9nZF8BdCMU9X7fnF+PCT4lRksp9xMZ74UT9
         7nWMoxg81TYsUQ5EQnVd1BJOaI7xJnkszOmCwdDD1XOsokEERSaFhu6wdRDKMexODhto
         DeSwkh7/tYO2d4qf7gQuJYXolkwfKmdMiMFiAazCY2/drtAIGn8HXrqMOFHWacXqlQi6
         DmKXaQl/DW200JBaCTdyLpbeIC0t+F4ZRHk2dfHTiBdNm+CreFJLNSC24rUCgGgvoKcx
         E3R5rdNlxN4OqcZly54sVNQXfo0wNt4aofZvcqCyJGOuDm5um7MLm91Mv/PdJKrtlDHN
         hYIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=WcEJD6hl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l21-20020a056102051500b0046b286fe0b1si1500569vsa.827.2024.02.21.09.03.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 09:03:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=WcEJD6hl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rcpxc-0006Ve-Hs; Wed, 21 Feb 2024 12:00:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3MizWZQwKChkCz0763HI34zC5DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--nabihestefan.bounces.google.com>)
 id 1rcpxY-0006Os-DX
 for qemu-devel@nongnu.org; Wed, 21 Feb 2024 12:00:40 -0500
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3MizWZQwKChkCz0763HI34zC5DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--nabihestefan.bounces.google.com>)
 id 1rcpxW-00038K-CS
 for qemu-devel@nongnu.org; Wed, 21 Feb 2024 12:00:40 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-608405e0340so14801997b3.0
 for <qemu-devel@nongnu.org>; Wed, 21 Feb 2024 09:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708534834; x=1709139634; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=pUXKy3XKiq+5p9TeSf8xJ6UxKnHtPGAsZsl63BQGiN8=;
 b=WcEJD6hlJGhEWv7Mf2v1HpEr9gBwOeGZ/C0zuemAUlWm5w9om1lBtVf53c+HxdiY9s
 398LoKzhlbWpuoszx7As/WouCCkpDvMIH86VNvAoyYk5zbbSx0KUuo1edXpNx4JJRr/F
 Z8c9230E09V2kLTc4egrCDSpgAS3Tmeje5buuWDRsav+ff02I6fTS595ko+fibfPDWPK
 FpY2k6chR7RnJBZsk3FkxY/cfpVxQ4D4WKRjo+8aSUlJYPUcd43r15MIXjIOESCRWqkB
 W9nt/J8mJL+tfV9f2IkHROqMiBkhw9nd44p5y4K7Hg3ERO6A5N0ovg7/dSrtIMjMhBH0
 jAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708534834; x=1709139634;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pUXKy3XKiq+5p9TeSf8xJ6UxKnHtPGAsZsl63BQGiN8=;
 b=fAEZarx0oEae9tEHEvoBwsfxryMPkeBTgVV05T46JH3pjO4pVozwPxt5QpqkuvV7Cs
 w/NObmZ2IBc8v2H0UEABBITSVDV5wLwk82dnXxVVE/p9X0FZGzLRu6KRzkyYsHrMQrCg
 K5jiUH8l0Pox7jw0yGyNDNksV8f1GkpQk5WNRGskV7F0v0ATCXkpd+1JR9XBO6EUjfWg
 HqdYf2+cjrPi5R7eU86AxYwd40vT90eU7xbjly495BAWNmZxC41ACuJO4Q66qOETDY6U
 NAH7PkFmt+bciLO6xoxeGSbjcHxbSICcbdV4qnyJ4lf/ixzZNOyQt4Xr9WZS6SZY5C27
 kjyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVsNuZhHVpaeGn2/VyWvVAq1w5AZPphaN8Rv6+Mom3eMVqqEw4JpRXhebfTzz5kg89iZGEehPont2NK0xfOYdmgy8diQo=
X-Gm-Message-State: AOJu0YzbVI254ieShk434/fsBlLHVo43i6/hI9VjRfpax5+4sXt2esZM
 jrWNpmglTS3GF7TfSnC8Z1Ol7DJnJkORlU5HUvUKUc9kY5cQy76gYkM7hWPGAnir5NZMRvquVxu
 gEzX4zD28CtF+pr++CZmv/Uy8yg==
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a0d:e692:0:b0:608:6894:120 with SMTP
 id p140-20020a0de692000000b0060868940120mr1008189ywe.4.1708534834637; Wed, 21
 Feb 2024 09:00:34 -0800 (PST)
Date: Wed, 21 Feb 2024 17:00:27 +0000
In-Reply-To: <20240221170027.1027325-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20240221170027.1027325-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221170027.1027325-3-nabihestefan@google.com>
Subject: [PATCH 2/2] Implement SMBIOS type 9 v2.6
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 its@irrelevant.dk, kbusch@kernel.org, eric.auger@redhat.com, mst@redhat.com, 
 imammedo@redhat.com, anisinha@redhat.com, flwu@google.com, 
 nabihestefan@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3MizWZQwKChkCz0763HI34zC5DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--nabihestefan.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6cocRyeTg/Gi

From: Felix Wu <flwu@google.com>

Signed-off-by: Felix Wu <flwu@google.com>
Signed-off-by: Nabih Estefan <nabihestefan@google.com>
---
 hw/smbios/smbios.c           | 49 +++++++++++++++++++++++++++++++++---
 include/hw/firmware/smbios.h |  4 +++
 qemu-options.hx              |  2 +-
 3 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 38b3ea172c..e3d5d8f2e2 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -123,7 +123,7 @@ static QTAILQ_HEAD(, type8_instance) type8 = QTAILQ_HEAD_INITIALIZER(type8);
 
 /* type 9 instance for parsing */
 struct type9_instance {
-    const char *slot_designation;
+    const char *slot_designation, *pcidev;
     uint8_t slot_type, slot_data_bus_width, current_usage, slot_length,
             slot_characteristics1, slot_characteristics2;
     uint16_t slot_id;
@@ -436,6 +436,11 @@ static const QemuOptDesc qemu_smbios_type9_opts[] = {
         .type = QEMU_OPT_NUMBER,
         .help = "slot characteristics2, see the spec",
     },
+    {
+        .name = "pci_device",
+        .type = QEMU_OPT_STRING,
+        .help = "PCI device, if provided."
+    }
 };
 
 static const QemuOptDesc qemu_smbios_type11_opts[] = {
@@ -866,7 +871,7 @@ static void smbios_build_type_8_table(void)
     }
 }
 
-static void smbios_build_type_9_table(void)
+static void smbios_build_type_9_table(Error **errp)
 {
     unsigned instance = 0;
     struct type9_instance *t9;
@@ -883,6 +888,43 @@ static void smbios_build_type_9_table(void)
         t->slot_characteristics1 = t9->slot_characteristics1;
         t->slot_characteristics2 = t9->slot_characteristics2;
 
+        if (t9->pcidev) {
+            PCIDevice *pdev = NULL;
+            int rc = pci_qdev_find_device(t9->pcidev, &pdev);
+            if (rc != 0) {
+                error_setg(errp,
+                           "No PCI device %s for SMBIOS type 9 entry %s",
+                           t9->pcidev, t9->slot_designation);
+                return;
+            }
+            /*
+             * We only handle the case were the device is attached to
+             * the PCI root bus. The general case is more complex as
+             * bridges are enumerated later and the table would need
+             * to be updated at this moment.
+             */
+            if (!pci_bus_is_root(pci_get_bus(pdev))) {
+                error_setg(errp,
+                           "Cannot create type 9 entry for PCI device %s: "
+                           "not attached to the root bus",
+                           t9->pcidev);
+                return;
+            }
+            t->segment_group_number = cpu_to_le16(0);
+            t->bus_number = pci_dev_bus_num(pdev);
+            t->device_number = pdev->devfn;
+        } else {
+            /*
+             * Per SMBIOS spec, For slots that are not of the PCI, AGP, PCI-X,
+             * or PCI-Express type that do not have bus/device/function
+             * information, 0FFh should be populated in the fields of Segment
+             * Group Number, Bus Number, Device/Function Number.
+             */
+            t->segment_group_number = 0xff;
+            t->bus_number = 0xff;
+            t->device_number = 0xff;
+        }
+
         SMBIOS_BUILD_TABLE_POST;
         instance++;
     }
@@ -1207,7 +1249,7 @@ void smbios_get_tables(MachineState *ms,
         }
 
         smbios_build_type_8_table();
-        smbios_build_type_9_table();
+        smbios_build_type_9_table(errp);
         smbios_build_type_11_table();
 
 #define MAX_DIMM_SZ (16 * GiB)
@@ -1556,6 +1598,7 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
             t->slot_id = qemu_opt_get_number(opts, "slot_id", 0);
             t->slot_characteristics1 = qemu_opt_get_number(opts, "slot_characteristics1", 0);
             t->slot_characteristics2 = qemu_opt_get_number(opts, "slot_characteristics2", 0);
+            save_opt(&t->pcidev, opts, "pcidev");
             QTAILQ_INSERT_TAIL(&type9, t, next);
             return;
         }
diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
index 9ab114aea2..c21b8d3285 100644
--- a/include/hw/firmware/smbios.h
+++ b/include/hw/firmware/smbios.h
@@ -222,6 +222,10 @@ struct smbios_type_9 {
     uint16_t slot_id;
     uint8_t slot_characteristics1;
     uint8_t slot_characteristics2;
+    /* SMBIOS spec v2.6+ */
+    uint16_t segment_group_number;
+    uint8_t bus_number;
+    uint8_t device_number;
 } QEMU_PACKED;
 
 /* SMBIOS type 11 - OEM strings */
diff --git a/qemu-options.hx b/qemu-options.hx
index 9ddb1b1fb3..6a16b808cf 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2717,7 +2717,7 @@ SRST
 ``-smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str][,asset=str][,part=str][,processor-family=%d][,processor-id=%d]``
     Specify SMBIOS type 4 fields
 
-``-smbios type=9[,slot_designation=str][,slot_type=%d][,slot_data_bus_width=%d][,current_usage=%d][,slot_length=%d][,slot_id=%d][,slot_characteristics1=%d][,slot_characteristics12=%d]``
+``-smbios type=9[,slot_designation=str][,slot_type=%d][,slot_data_bus_width=%d][,current_usage=%d][,slot_length=%d][,slot_id=%d][,slot_characteristics1=%d][,slot_characteristics12=%d][,pci_device=str]``
     Specify SMBIOS type 9 fields
 
 ``-smbios type=11[,value=str][,path=filename]``
-- 
2.44.0.rc0.258.g7320e95886-goog

