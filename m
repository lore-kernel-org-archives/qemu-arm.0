Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp9080379lfc;
        Fri, 19 Feb 2021 06:52:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxlccEtqUWAP+HiUDMFCUl5IPsh7SQyvNZc3ffHxH8cL4sztRRl6uKIpUb+opTsyi2x/Quf
X-Received: by 2002:ac8:782:: with SMTP id l2mr9369402qth.127.1613746355293;
        Fri, 19 Feb 2021 06:52:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613746355; cv=none;
        d=google.com; s=arc-20160816;
        b=NJgiQHVNVRRG/uT8ACZnDTkY8Pfqk9X2uAUgAdcatHAX703cB5Hp/Q87b1JCgt+tUf
         RVi+Dy5RDi18bHA0umyEB8NcUgJkZteFQgtY7T7xmP0/EYlgnjqnl6zxG7PO2hVxK7L1
         rrVBjCkIbD7+X9Lf3Sia/UpTp8FSeHD9ah2r0lsXdICAP7Tk+fJy3TjRvVDZYbGU8gfq
         lDd61Unft8sK5iwxP1rLoR68rU+X1fkYGrIZRhqpiX43cp6ZA9i4Z43n/vCFwMZ+cUMH
         /WkJnoS7SCj96vxkVrFqgqafODK5LSyo5gWgDVxbIuFKPcH4vFirx1cXMXZrycyRbigB
         83zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/5T7tFYSez4oSWDc06Gf/0iIHyc2I1a1KAWLdAR9tmA=;
        b=PzfkqZe8kGa5zOr5XVGVwVmG+r7p9RAdVOdWV8o8ndKizypV5stC9pcqPH4e7PbZ4Q
         Fg17QDh/ahgbiJwj0rDyEngu5nD83CIuuB4PQ3TWxr7VFcsSzQ31sdwHM64064u8ZZl8
         g0bgu7T5jq1acfG9ZTZeS09cwgUxt3jQicImYg1Lr+SS24j157KjNH+4O8FwqTYiw9zW
         c7X0aKiofzMt+z19I2E5Sqi0W8mI0I7Zme0HC+5Rrvd0LG15UBiq2Z09Tp9w8Cl1AnMv
         JfRfTbNe8VisbdEAPURZHrj/hlmOmdtXLP4BGyDlUZ1wUSIcSIGxbUCXlsimWaDwQY0c
         Rxjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NKuaBH3L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z15si4599304qtw.0.2021.02.19.06.52.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 06:52:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NKuaBH3L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD78y-0006xn-QD
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 09:52:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73N-0002CH-Pt
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:46:45 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD739-0003Q2-II
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:46:45 -0500
Received: by mail-wm1-x335.google.com with SMTP id m1so7889096wml.2
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/5T7tFYSez4oSWDc06Gf/0iIHyc2I1a1KAWLdAR9tmA=;
 b=NKuaBH3LSxj8UnBBBcNramKVwh7jFHoZPK7TrNG+lRXg4G1LzHpe9tLhGhKPd3j4JV
 /9u2XcY6lNy8xlqZSXI5dY5RmJplHP+hq/TKoQ2gaUi99zNbkn1f8gEj/Me8V1MiF6fS
 DkANO9OiM5ReB0OKSlm7w1zuGYZOIfr7KosczPCwGd7huiTVy7msyP3fSkvp1RnrOIQd
 v2WwDOaU4ZtbstwVIaux7wvAENpPxs8XxYFhYqQkVX8kDyZfG88APFPpzvFgC4KNWTIz
 +RzLeLvXgQJcktL/r0qYqmwdD0DICpCpTIgAIYUZCQMGahmxX5YBzvbQqwpIGFAmjdUz
 LQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/5T7tFYSez4oSWDc06Gf/0iIHyc2I1a1KAWLdAR9tmA=;
 b=bVYuHBF/GAaZTc029gLYYXCEpTd5n++T8kMraKIRHNf/Xv+9QclkAg1mqfOg6L/O0g
 6ERMd5ZYK5pOy59QlkHLxf9JAhkT0F0kJKwygQZ5d8l6WwTz/gBU5aH7gt3IbPhJbFep
 JxwN4wDKBPB32THiANIRIcf2/veAyv7iPlt6ibCR0W90/i43KaDLrb86q9TCGk+Mi+yK
 YK5TvmDgUPh3mthKKj4teuMi/i7juPXtRCQO9gS2WIOh7fulpaU2Gl/7qd9TJJgDCF+8
 gbelJf0wn9VH9C+CD5bMCX5Rv7FZuPTz0ZEskicc1H14Jwv5PnuP87Wr7VwvRlPS9Sxw
 hrWg==
X-Gm-Message-State: AOAM531Be/3552XAzrqj81F/HD5PKW8lRtCx9xU1SDDKmoEptEFLtBJQ
 HKE2/ebKi6x0QEXs4402ZB+w8S0YJ7V+kw==
X-Received: by 2002:a1c:b607:: with SMTP id g7mr8523795wmf.67.1613745987734;
 Fri, 19 Feb 2021 06:46:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 10/44] hw/misc/iotkit-sysinfo.c: Implement SYS_CONFIG1 and IIDR
Date: Fri, 19 Feb 2021 14:45:43 +0000
Message-Id: <20210219144617.4782-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P7Pf1I+ulhIB

For SSE-300, the SYSINFO register block has two new registers:

 * SYS_CONFIG1 indicates the config for a potential CPU2 and CPU3;
   since the SSE-300 can only be configured with a single CPU it
   is always zero

 * IIDR is the subsystem implementation identity register;
   its value is set by the SoC integrator, so we plumb this in from
   the armsse.c code as we do with SYS_VERSION and SYS_CONFIG

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/iotkit-sysinfo.h |  1 +
 hw/arm/armsse.c                  |  5 +++++
 hw/misc/iotkit-sysinfo.c         | 22 ++++++++++++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/include/hw/misc/iotkit-sysinfo.h b/include/hw/misc/iotkit-sysinfo.h
index 91bd14bdbff..91c23f90d23 100644
--- a/include/hw/misc/iotkit-sysinfo.h
+++ b/include/hw/misc/iotkit-sysinfo.h
@@ -39,6 +39,7 @@ struct IoTKitSysInfo {
     uint32_t sys_version;
     uint32_t sys_config;
     uint32_t sse_version;
+    uint32_t iidr;
 };
 
 #endif
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 113a783a46a..326e161c8d4 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -30,6 +30,7 @@ struct ARMSSEInfo {
     int sram_banks;
     int num_cpus;
     uint32_t sys_version;
+    uint32_t iidr;
     uint32_t cpuwait_rst;
     bool has_mhus;
     bool has_ppus;
@@ -70,6 +71,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .sram_banks = 1,
         .num_cpus = 1,
         .sys_version = 0x41743,
+        .iidr = 0,
         .cpuwait_rst = 0,
         .has_mhus = false,
         .has_ppus = false,
@@ -84,6 +86,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .sram_banks = 4,
         .num_cpus = 2,
         .sys_version = 0x22041743,
+        .iidr = 0,
         .cpuwait_rst = 2,
         .has_mhus = true,
         .has_ppus = true,
@@ -950,6 +953,8 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     }
     object_property_set_int(OBJECT(&s->sysinfo), "sse-version",
                             info->sse_version, &error_abort);
+    object_property_set_int(OBJECT(&s->sysinfo), "IIDR",
+                            info->iidr, &error_abort);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->sysinfo), errp)) {
         return;
     }
diff --git a/hw/misc/iotkit-sysinfo.c b/hw/misc/iotkit-sysinfo.c
index 4bd3fd4c8f3..aaa9305b2ea 100644
--- a/hw/misc/iotkit-sysinfo.c
+++ b/hw/misc/iotkit-sysinfo.c
@@ -30,6 +30,8 @@
 
 REG32(SYS_VERSION, 0x0)
 REG32(SYS_CONFIG, 0x4)
+REG32(SYS_CONFIG1, 0x8)
+REG32(IIDR, 0xfc8)
 REG32(PID4, 0xfd0)
 REG32(PID5, 0xfd4)
 REG32(PID6, 0xfd8)
@@ -70,6 +72,24 @@ static uint64_t iotkit_sysinfo_read(void *opaque, hwaddr offset,
     case A_SYS_CONFIG:
         r = s->sys_config;
         break;
+    case A_SYS_CONFIG1:
+        switch (s->sse_version) {
+        case ARMSSE_SSE300:
+            return 0;
+            break;
+        default:
+            goto bad_read;
+        }
+        break;
+    case A_IIDR:
+        switch (s->sse_version) {
+        case ARMSSE_SSE300:
+            return s->iidr;
+            break;
+        default:
+            goto bad_read;
+        }
+        break;
     case A_PID4 ... A_CID3:
         switch (s->sse_version) {
         case ARMSSE_SSE300:
@@ -81,6 +101,7 @@ static uint64_t iotkit_sysinfo_read(void *opaque, hwaddr offset,
         }
         break;
     default:
+    bad_read:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "IoTKit SysInfo read: bad offset %x\n", (int)offset);
         r = 0;
@@ -114,6 +135,7 @@ static Property iotkit_sysinfo_props[] = {
     DEFINE_PROP_UINT32("SYS_VERSION", IoTKitSysInfo, sys_version, 0),
     DEFINE_PROP_UINT32("SYS_CONFIG", IoTKitSysInfo, sys_config, 0),
     DEFINE_PROP_UINT32("sse-version", IoTKitSysInfo, sse_version, 0),
+    DEFINE_PROP_UINT32("IIDR", IoTKitSysInfo, iidr, 0),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
2.20.1

