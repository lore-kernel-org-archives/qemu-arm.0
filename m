Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3355197lfp;
        Sat, 15 Feb 2020 11:19:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqzUUlJUuKXCT3UVmWdsaF8oHG04X7273KiCJs4oSCRZDRI8bX6ARwv1yf8F7XXuhKu8qAkw
X-Received: by 2002:aed:3e13:: with SMTP id l19mr7286548qtf.103.1581794340755;
        Sat, 15 Feb 2020 11:19:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581794340; cv=none;
        d=google.com; s=arc-20160816;
        b=LNeYIN5Pl0L3jCrLBkFINvKIVlyPuWa9QZKdkYgxgOb37kPsnmjmA/ocV2ct6Ck/+/
         eHGkbv5So9D0WSPqfGZtz48RbPo7Qafu4vUqOFgUfwxkj/syws3tBCmSQJEtMnLT0Bnt
         oDBjmybOLnIJz/4Rvk5gf0esfNvL91PHrRCYCSN474GeKBJHviulTdzgCzO8h+/0rRoK
         d/phpi1/69NvhJ1O8ixOUck74XNCzTW0OHkamYzyNyPC1+AKL2nEv5G1UfzcQHIbUMNg
         RNUh3u9MjlJzdM/Rv3cx7MO+23TjOJEBzjQNKcHugVeN3Hi79m133Ga3gbMd9Zk/75Mg
         y2rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Vhel9ZGZgtP73tJjm81o+z0be/SYJCK2j79JJpUSkis=;
        b=swpD42eTALn4F4pmwlQTfVQLbE7dVoETHOpLeDlW3Vc+cxkN8Zs9RfQKaBnr8U6ARY
         QTBsEliahk1/x1IuwRQnG+ZWOZCgm7hx/VEzRcHClYTqZK2tP/40tdYZFNsVOUCgGwm9
         MmpdmJwpa+jkXRJtyI7ciT5292bef/Ks+JSOMN+SHYBZZtt0N8l9sWOBb8rT7XfFMyCN
         uAyeCyHYyrdAQF9zXNh3FgBLJ/vsHoahZgyE7vqYt1IvqK6B9rB8g6PVA6XqyoSuTk9a
         2ai0zgtfmLJxhaUVgk2LRA+juAlR5MTpS1DVXqVvXy+bgFBrb4GII5k8pnSV7UvhdBDn
         onbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WMZP+Tjz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13si4345503qvz.209.2020.02.15.11.19.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Feb 2020 11:19:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WMZP+Tjz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:53784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j32xw-0005Sv-1I
	for alex.bennee@linaro.org; Sat, 15 Feb 2020 14:19:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35248)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j32uv-0008GO-7H
 for qemu-devel@nongnu.org; Sat, 15 Feb 2020 14:15:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j32uu-0004Fd-2c
 for qemu-devel@nongnu.org; Sat, 15 Feb 2020 14:15:53 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:36508)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j32ut-0004FF-Su; Sat, 15 Feb 2020 14:15:52 -0500
Received: by mail-wm1-x342.google.com with SMTP id p17so14360082wma.1;
 Sat, 15 Feb 2020 11:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vhel9ZGZgtP73tJjm81o+z0be/SYJCK2j79JJpUSkis=;
 b=WMZP+TjzLsFQppWB0y16uK/sT7iEKqlOh4hBh9gqphfZhuPEOs4nWIMt2++ephmSLa
 1phZZlTV77uwZr4iVu0tXA4G+lYpVK3g5PJppU2HB74ordwrXZegyQXhuuKH+lz2aPQt
 Y0Wh9m72c01Mb+cG5XXO3ZzpJc32zbBozexrnD7f2UrB6UTmmt+g0AmgNBradd8vRcg0
 7nG23W9Yco7eAlFdxzIvZp3t3YnXEkme3ztPou4gtM+/V+l8YKfYdhmYhy6+6LXzYZiF
 mzdtaQGnRJuDWG37Y3mysffUxtJB8Sf34mwHv4PGN2AUdHzbH2k18lv9iGIRXSYM8lfF
 CrxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Vhel9ZGZgtP73tJjm81o+z0be/SYJCK2j79JJpUSkis=;
 b=Dp80jNCtYasPlWlRVgNyIw3PKYgMdpdJdGW64h7mjpAy3xqKcoBi7uvcDObWuGnoF5
 lcAN3TXwRNvgyHW8QVlKcIJAiAHSROtVsk+silOAER9LAG7O9lXu2dtV3XvW6IcD4l93
 ML4Yq9P4dfp6Ug1BDxvRo6uj+7MXppp4FVVz6pLvu6XcnoxGUS+szpb1hXs+ZUrIbvlM
 EXMaMvlKx9b94MlvxwE2Z5W0hXHQmYe32aBGrRqxuZn1oUR9gL2rBjsuu+l97iMlsyBG
 eAuvU+08YulVBrmlmqSRDLoBYJ3mShnR9VMzk0g2nJu3wN/5eJs6xM+oo4vh9s16ziQi
 2bhQ==
X-Gm-Message-State: APjAAAVZAcAI/ly2ftbQvnNq4+4AKYDYH4ZsJB7G/WX2HdjZ9MWXjR8k
 i7w3N1McXoPPvVVVMkZ4axpTfWnQx5w=
X-Received: by 2002:a1c:cc11:: with SMTP id h17mr11655881wmb.19.1581794150639; 
 Sat, 15 Feb 2020 11:15:50 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id o9sm9678605wrw.20.2020.02.15.11.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2020 11:15:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/12] hw/arm/raspi: Introduce RaspiProcessorId enum
Date: Sat, 15 Feb 2020 20:15:34 +0100
Message-Id: <20200215191543.3235-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200215191543.3235-1-f4bug@amsat.org>
References: <20200215191543.3235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v4DJeeqZcx1B

As we only support a reduced set of the REV_CODE_PROCESSOR id
encoded in the board revision, define the PROCESSOR_ID values
as an enum. We can simplify the board_soc_type and cores_count
methods.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 45 +++++++++++++++++++++------------------------
 1 file changed, 21 insertions(+), 24 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 81cc5824c4..aa0a7e6276 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -69,16 +69,33 @@ FIELD(REV_CODE, MANUFACTURER,      16, 4);
 FIELD(REV_CODE, MEMORY_SIZE,       20, 3);
 FIELD(REV_CODE, STYLE,             23, 1);
 
+typedef enum RaspiProcessorId {
+    PROCESSOR_ID_BCM2836 = 1,
+    PROCESSOR_ID_BCM2837 = 2,
+} RaspiProcessorId;
+
+static const struct {
+    const char *type;
+    int cores_count;
+} soc_property[] = {
+    [PROCESSOR_ID_BCM2836] = {TYPE_BCM2836, BCM283X_NCPUS},
+    [PROCESSOR_ID_BCM2837] = {TYPE_BCM2837, BCM283X_NCPUS},
+};
+
 static uint64_t board_ram_size(uint32_t board_rev)
 {
     assert(FIELD_EX32(board_rev, REV_CODE, STYLE)); /* Only new style */
     return 256 * MiB << FIELD_EX32(board_rev, REV_CODE, MEMORY_SIZE);
 }
 
-static int board_processor_id(uint32_t board_rev)
+static RaspiProcessorId board_processor_id(uint32_t board_rev)
 {
+    int proc_id = FIELD_EX32(board_rev, REV_CODE, PROCESSOR);;
+
     assert(FIELD_EX32(board_rev, REV_CODE, STYLE)); /* Only new style */
-    return FIELD_EX32(board_rev, REV_CODE, PROCESSOR);
+    assert(proc_id < ARRAY_SIZE(soc_property) && soc_property[proc_id].type);
+
+    return proc_id;
 }
 
 static int board_version(uint32_t board_rev)
@@ -88,32 +105,12 @@ static int board_version(uint32_t board_rev)
 
 static const char *board_soc_type(uint32_t board_rev)
 {
-    static const char *soc_types[] = {
-        NULL, TYPE_BCM2836, TYPE_BCM2837,
-    };
-    int proc_id = board_processor_id(board_rev);
-
-    if (proc_id >= ARRAY_SIZE(soc_types) || !soc_types[proc_id]) {
-        error_report("Unsupported processor id '%d' (board revision: 0x%x)",
-                     proc_id, board_rev);
-        exit(1);
-    }
-    return soc_types[proc_id];
+    return soc_property[board_processor_id(board_rev)].type;
 }
 
 static int cores_count(uint32_t board_rev)
 {
-    static const int soc_cores_count[] = {
-        0, BCM283X_NCPUS, BCM283X_NCPUS,
-    };
-    int proc_id = board_processor_id(board_rev);
-
-    if (proc_id >= ARRAY_SIZE(soc_cores_count) || !soc_cores_count[proc_id]) {
-        error_report("Unsupported processor id '%d' (board revision: 0x%x)",
-                     proc_id, board_rev);
-        exit(1);
-    }
-    return soc_cores_count[proc_id];
+    return soc_property[board_processor_id(board_rev)].cores_count;
 }
 
 static const char *board_type(uint32_t board_rev)
-- 
2.21.1

