Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp649463njb;
        Fri, 13 Dec 2024 10:23:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX0Kc5HzSBWnQRlwiYflqdAyKiuu4d2KJGbQqUYSPr3D4vzh6CMREzO1Eodnq86b5BH4NohvvBuLmu5Hw==@linaro.org
X-Google-Smtp-Source: AGHT+IEUbIgyKvid7lZzMuQKwmeCxp1aDw8AvtZynWxV+h2zmnL8A04pYo0uIQLBkCSV79ZEs3Rj
X-Received: by 2002:a05:620a:1922:b0:7b1:51df:117f with SMTP id af79cd13be357-7b6fbf455ecmr592477385a.56.1734114234242;
        Fri, 13 Dec 2024 10:23:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734114234; cv=none;
        d=google.com; s=arc-20240605;
        b=P9AGVgU317Iu6ey3yEDL9vHRRJs/UHYKCjG9e5qqmeTj/hShret/TSGEU69fvuPn+4
         zpm6rAPoUL3n9KogYLV/WwMxG7O9kqepoNt0mda0bdYr5AwcMT6dj9LVODqYCe8rwRZL
         WpUlBmg8n6zhtmCeAsscnB7Hz9lQdMvQcLfuwqCTvdFoTOcIHv7QVkAYwFUW7Rxp+CfE
         dGUeshblWOpeX0j9uVSCNsTLvViHDDOCJHFVCrvamaQMXu4b40wKvKr7Q3qVMMUxf7ty
         CGfY/s6pqGWOPxl7it+GqCsxIlZyyl9taXV1SVK9QUJvx5iaUVkvhcO1bXn37ME/xu72
         RkeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=BIp3bm7eaOQPJUGY0JTu0QvOZnZ5ww3rT8F41d6Hrko=;
        fh=spbD1uAOw2hCQBb83uSlqZAKTOl6wvNX+k1rxl9UBCg=;
        b=aAB0Q63bzwvzLj5ozp0EWYCuLgu7ndRDPlchNawf88Hjz7h04aVezBDxiLP1EomzkY
         qmONzRv+6QSbUJd5GT0iCFXdqDwp/9+0J3IyjopMSAxe0jSZeghycBD9Z1iBWtKYWoyh
         lXtsYTCjexmQNnbZqJE/QmwjTh1UeOW5gYCkg8EZRO5V6JuXQVav7RYnbt54cyNC0ZLm
         LDos0sSH2QP+7NU1KQ8E53Aswpv1BdeSs8Wh6tDJyEF7va5+j7aZmHrkkwuLBV1ogFtS
         MvcE4giqCSHjv2yxwN7I40zE/mW1WfA+10jk+cvfATrzEcrcUbzceTABsAapxFdEDj4a
         7cwQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vMCUjCH6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b7047c491csi4910385a.33.2024.12.13.10.23.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 10:23:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vMCUjCH6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tMAKH-0007mp-GM; Fri, 13 Dec 2024 13:23:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tMAKF-0007mO-99
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 13:23:43 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tMAKC-0004A2-Vz
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 13:23:42 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43625c4a50dso14291225e9.0
 for <qemu-arm@nongnu.org>; Fri, 13 Dec 2024 10:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734114219; x=1734719019; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BIp3bm7eaOQPJUGY0JTu0QvOZnZ5ww3rT8F41d6Hrko=;
 b=vMCUjCH6OKsZx20ECTg2hlquG//ss6+lISVzIeIDlj+fwv2dUd5L0b0IgLXIiKcrNm
 6rrd3UfFumi8v/vu8fViE+T27X/MPIF2ExpcOVSh/4jv0p8/0vPypUrE5eyFNx0k81kh
 sZKrGzUxS8Ld1TIdSPoPuFPUOaPMW/+JenBUU3pUqpjw3nUp0Vj7owS71FbLHhpYei5C
 5azvuBuyrXdEQDb4HQunkeDY+hJT8qV6LLl+4oYoVOypHn1p8ryL1FkrrPknNkfksi2I
 +Mx/kHripbu8oh7iP5l1Yz+kavTOyceQ1QLCR+szc3Sa248S+4B6z7tRj8kXV3tMR2Lk
 u7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734114219; x=1734719019;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BIp3bm7eaOQPJUGY0JTu0QvOZnZ5ww3rT8F41d6Hrko=;
 b=nkxARuGFTWLnx7f8dZzkU2HewXdnycg36wsrfH/kzNU1eiFnf1GCXB+gOiy7bBgqKE
 OoU7eZP1yOt2RmMahYU72sdeFOIE6D+L2KIxqc3O9V+NlOClIT5GHdrIMlmnDjdA7jqV
 cCX5b90HuMJ7txixVwYJR6/Hfl4frq8FeITGJeHuHoJQOQYObGHTbU+Q8sEeV82btalK
 4hiGfJmRUrTIOXtm8iTEW9mRzx7GVPLOCEAylv5lrOIjQv4zDAkKhc8ZyW3g+cFsprqe
 YomMPJXecLXnTTEGZMsMnpAFJ/4KkWccpL9SBQMhsc2FF0F5GGKwDvKvZZCG/QzcHgm9
 yNjQ==
X-Gm-Message-State: AOJu0YyVTEdeaQM5eFRzzMGlhc9xVXgfbmjC1C9NZRFifIbYcy4s+hD3
 2qApHfNqf08blX3pzLX3vayQ7BeEcx77kubO2Ua/OJikizQyb5Dle/cA1HTGhuAg4VC8JbH86Wa
 X
X-Gm-Gg: ASbGncuPCRnfeSWRj0Wm3/7SECfhb/8sSFxVh6dyH9kTDxGNp0qOGem6t+MkdZRID6V
 WBssdbwVJt3zabQ6d6pTQ/BF4oydnpJk8DWM3mToStO/qNC98zkkVlSOzKTHDNWWrrcn1kAOndd
 xmxF8H/LLurYyx/lPVVY+TKTOI2mckA3N72DrZgVus99csP+dztK9ZUYViwP7yLxeAVm3VWKCza
 3KeiHSXC/Um+56IpnIlBvhlsY4jujKW+1l0PIanCW1wCyIBHrvkFcDXFI01rRM=
X-Received: by 2002:a05:6000:1864:b0:385:df73:2f24 with SMTP id
 ffacd0b85a97d-3888e0f2d5bmr3125859f8f.39.1734114219068; 
 Fri, 13 Dec 2024 10:23:39 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c801acf2sm196531f8f.52.2024.12.13.10.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 10:23:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH] hw/intc/arm_gicv3_its: Zero initialize local DTEntry etc
 structs
Date: Fri, 13 Dec 2024 18:23:37 +0000
Message-Id: <20241213182337.3343068-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sRki+jp6Qb6k

In the GICv3 ITS model, we have a common coding pattern which has a
local C struct like "DTEntry dte", which is a C representation of an
in-guest-memory data structure, and we call a function such as
get_dte() to read guest memory and fill in the C struct.  These
functions to read in the struct sometimes have cases where they will
leave early and not fill in the whole struct (for instance get_dte()
will set "dte->valid = false" and nothing else for the case where it
is passed an entry_addr implying that there is no L2 table entry for
the DTE).  This then causes potential use of uninitialized memory
later, for instance when we call a trace event which prints all the
fields of the struct.  Sufficiently advanced compilers may produce
-Wmaybe-uninitialized warnings about this, especially if LTO is
enabled.

Rather than trying to carefully separate out these trace events into
"only the 'valid' field is initialized" and "all fields can be
printed", zero-init all the structs when we define them. None of
these structs are large (the biggest is 24 bytes) and having
consistent behaviour is less likely to be buggy.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2718
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 44 ++++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index bf31158470e..752322a3e7e 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -465,7 +465,7 @@ static ItsCmdResult lookup_vte(GICv3ITSState *s, const char *who,
 static ItsCmdResult process_its_cmd_phys(GICv3ITSState *s, const ITEntry *ite,
                                          int irqlevel)
 {
-    CTEntry cte;
+    CTEntry cte = {};
     ItsCmdResult cmdres;
 
     cmdres = lookup_cte(s, __func__, ite->icid, &cte);
@@ -479,7 +479,7 @@ static ItsCmdResult process_its_cmd_phys(GICv3ITSState *s, const ITEntry *ite,
 static ItsCmdResult process_its_cmd_virt(GICv3ITSState *s, const ITEntry *ite,
                                          int irqlevel)
 {
-    VTEntry vte;
+    VTEntry vte = {};
     ItsCmdResult cmdres;
 
     cmdres = lookup_vte(s, __func__, ite->vpeid, &vte);
@@ -514,8 +514,8 @@ static ItsCmdResult process_its_cmd_virt(GICv3ITSState *s, const ITEntry *ite,
 static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
                                        uint32_t eventid, ItsCmdType cmd)
 {
-    DTEntry dte;
-    ITEntry ite;
+    DTEntry dte = {};
+    ITEntry ite = {};
     ItsCmdResult cmdres;
     int irqlevel;
 
@@ -583,8 +583,8 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
     uint32_t pIntid = 0;
     uint64_t num_eventids;
     uint16_t icid = 0;
-    DTEntry dte;
-    ITEntry ite;
+    DTEntry dte = {};
+    ITEntry ite = {};
 
     devid = (cmdpkt[0] & DEVID_MASK) >> DEVID_SHIFT;
     eventid = cmdpkt[1] & EVENTID_MASK;
@@ -651,8 +651,8 @@ static ItsCmdResult process_vmapti(GICv3ITSState *s, const uint64_t *cmdpkt,
 {
     uint32_t devid, eventid, vintid, doorbell, vpeid;
     uint32_t num_eventids;
-    DTEntry dte;
-    ITEntry ite;
+    DTEntry dte = {};
+    ITEntry ite = {};
 
     if (!its_feature_virtual(s)) {
         return CMD_CONTINUE;
@@ -761,7 +761,7 @@ static bool update_cte(GICv3ITSState *s, uint16_t icid, const CTEntry *cte)
 static ItsCmdResult process_mapc(GICv3ITSState *s, const uint64_t *cmdpkt)
 {
     uint16_t icid;
-    CTEntry cte;
+    CTEntry cte = {};
 
     icid = cmdpkt[2] & ICID_MASK;
     cte.valid = cmdpkt[2] & CMD_FIELD_VALID_MASK;
@@ -822,7 +822,7 @@ static bool update_dte(GICv3ITSState *s, uint32_t devid, const DTEntry *dte)
 static ItsCmdResult process_mapd(GICv3ITSState *s, const uint64_t *cmdpkt)
 {
     uint32_t devid;
-    DTEntry dte;
+    DTEntry dte = {};
 
     devid = (cmdpkt[0] & DEVID_MASK) >> DEVID_SHIFT;
     dte.size = cmdpkt[1] & SIZE_MASK;
@@ -886,9 +886,9 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
 {
     uint32_t devid, eventid;
     uint16_t new_icid;
-    DTEntry dte;
-    CTEntry old_cte, new_cte;
-    ITEntry old_ite;
+    DTEntry dte = {};
+    CTEntry old_cte = {}, new_cte = {};
+    ITEntry old_ite = {};
     ItsCmdResult cmdres;
 
     devid = FIELD_EX64(cmdpkt[0], MOVI_0, DEVICEID);
@@ -965,7 +965,7 @@ static bool update_vte(GICv3ITSState *s, uint32_t vpeid, const VTEntry *vte)
 
 static ItsCmdResult process_vmapp(GICv3ITSState *s, const uint64_t *cmdpkt)
 {
-    VTEntry vte;
+    VTEntry vte = {};
     uint32_t vpeid;
 
     if (!its_feature_virtual(s)) {
@@ -1030,7 +1030,7 @@ static void vmovp_callback(gpointer data, gpointer opaque)
      */
     GICv3ITSState *s = data;
     VmovpCallbackData *cbdata = opaque;
-    VTEntry vte;
+    VTEntry vte = {};
     ItsCmdResult cmdres;
 
     cmdres = lookup_vte(s, __func__, cbdata->vpeid, &vte);
@@ -1085,9 +1085,9 @@ static ItsCmdResult process_vmovi(GICv3ITSState *s, const uint64_t *cmdpkt)
 {
     uint32_t devid, eventid, vpeid, doorbell;
     bool doorbell_valid;
-    DTEntry dte;
-    ITEntry ite;
-    VTEntry old_vte, new_vte;
+    DTEntry dte = {};
+    ITEntry ite = {};
+    VTEntry old_vte = {}, new_vte = {};
     ItsCmdResult cmdres;
 
     if (!its_feature_virtual(s)) {
@@ -1186,10 +1186,10 @@ static ItsCmdResult process_vinvall(GICv3ITSState *s, const uint64_t *cmdpkt)
 static ItsCmdResult process_inv(GICv3ITSState *s, const uint64_t *cmdpkt)
 {
     uint32_t devid, eventid;
-    ITEntry ite;
-    DTEntry dte;
-    CTEntry cte;
-    VTEntry vte;
+    ITEntry ite = {};
+    DTEntry dte = {};
+    CTEntry cte = {};
+    VTEntry vte = {};
     ItsCmdResult cmdres;
 
     devid = FIELD_EX64(cmdpkt[0], INV_0, DEVICEID);
-- 
2.34.1

