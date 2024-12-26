Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp5601990njk;
        Thu, 26 Dec 2024 00:29:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWpOIHIKa1zirUzyTWBrY1orqxFiEEcYAp31CKLgEDI9glHpY8F0Q4Sq6LTG3zYTFZvChDEwOKhuKrhcw==@linaro.org
X-Google-Smtp-Source: AGHT+IFU1UDBBK/B8QPiZ7k0pzUPtXItM3dAQkgoqnTOZoqYVqzAoXpYCRpcX1Pu4b37wWhq7vDE
X-Received: by 2002:a05:6214:21ed:b0:6d8:ae2c:504d with SMTP id 6a1803df08f44-6dd233a13edmr324349796d6.41.1735201749774;
        Thu, 26 Dec 2024 00:29:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735201749; cv=none;
        d=google.com; s=arc-20240605;
        b=h8pIe8uQZBEX3TIDZBSLrPlzc/AP2zbtoWJATh3zWWcTUg7tvQFjqB2niwVHsLEuZ7
         yOUFRYxQ/12CxY5VbYtXYzpkT+LTn/6DYd+wbfUuIGJ9GodmoxHi+b4AEwnohJhyySw+
         /oT81H5dPVaFITDflZuv0Lt8YdvIzTfPeRiz5QnItW8wTVhpJCKdyL+WfjIxxpSSUlWw
         V8XPdOUFHInHKDbYZ9PFhkuFvPptwUy8UFWoVBApj1bDdwfD8IS4ryFc1FSmdlR0mHCL
         UEz7fIRlMLexSZ1DeirDnOKh5XDauuSdON8DFEBhH4U6NgpkptgiDyCH6fDTHsyk+mp4
         I2sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=e0yjpIGSDYAwA98JtHidNici6pMLPUvDd00lZuWT+Lw=;
        fh=qZfLRoZAQW41bSKs3nfb4UIU0/CbZKcdGY+HGYOyw88=;
        b=cOB8uZJuar3Yhfy5li48Oub3FWw4UxwYol81o5pMaRwKcaeWZ1/kkgEz38tx2kbLEz
         pf0jsjYTQi3Bbi426mIx5DJPly8Yxll1vOBwatLBoRuefrKUaSeLBNxrM0UM2cAC/lIi
         /rFR4JgSZ2xaBqFLSnPQLYkqXFHgQE1CNvGtdiltP8MW0dK81APBegLZ9K7rVfeWQgoo
         Yei/jHeG6+Rr21SuARWMykS1dQekzBSgBZdTqFLhlHWOYZp7fR06fru1Vi7Dh/lOHcBq
         u0qM3Moxc6fQx45YngSu0zLUbuLFUazLhsYi3p4pkcWJTG+fSb+q9o5uTsPRDGUQfdJM
         r6+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=LRMDcOEf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dd18233423si169883786d6.192.2024.12.26.00.29.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Dec 2024 00:29:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=LRMDcOEf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tQjET-0003gJ-4j; Thu, 26 Dec 2024 03:28:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3rRNtZwgKCsoCAxq498xw44w1u.s426u2A-tuBu1343w3A.47w@flex--wuhaotsh.bounces.google.com>)
 id 1tQjEP-0003Hj-Jr
 for qemu-devel@nongnu.org; Thu, 26 Dec 2024 03:28:34 -0500
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3rRNtZwgKCsoCAxq498xw44w1u.s426u2A-tuBu1343w3A.47w@flex--wuhaotsh.bounces.google.com>)
 id 1tQjEN-0001CI-9F
 for qemu-devel@nongnu.org; Thu, 26 Dec 2024 03:28:33 -0500
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-2162259a5dcso136124935ad.3
 for <qemu-devel@nongnu.org>; Thu, 26 Dec 2024 00:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1735201710; x=1735806510; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=e0yjpIGSDYAwA98JtHidNici6pMLPUvDd00lZuWT+Lw=;
 b=LRMDcOEforP0d6eRO0/lZ6oAKw7Wz1jOwUKnVOAlh6uNABZcgxmUSRBfMgxot/hd59
 laa0YVRLRGRTH+4DH/jaSPqJfX7Ofo7FNs4o7x8+bvmfTS8H7JlivXrgysVwc+q4LIPE
 4OA+AAFop1YNsja9TWkgqPBtHGX/nzBZ1dl/J84LbwjHrU/LjWbWCZHTgopkQ27AN8RG
 Ofe8e0VNplN5z4y9OJOIChGd9LqIlwF+BP0QU2PTmQtAey+mM4eTJXGeRFS77Xy2jwtr
 LtAXVlP9/pR0HiRsTsu8MVI6Atml8B0cpivPE1kxUB1mzj5ocILzOaLfAyiXev+g5AZt
 djkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735201710; x=1735806510;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e0yjpIGSDYAwA98JtHidNici6pMLPUvDd00lZuWT+Lw=;
 b=Nfmt2Vt2g7TuAeOfQHTpIpky8oCYfdP0b8yWQ/By8G11lKr/yugevh+ognk2gns+N2
 c7eptA96mpLrjHn0i1lt4CvoAZl5UOU/smo1wwbGKp3sELD7GfRF+YxqQNl5skzpAwkS
 KDfAb5GYY10IzoM6tpCmM5jfHRSGXLuJ+vlj8FG8MOR37VWSEGeWXYmuf9i+Bcm3Ho6l
 z8uIJgPTeYOp2rp7R0P/UArb9z0zKII2m0cdHX6KRMaYsGqgqjHeYFtypE7h01Z7G2BH
 xkrtw6XJNfK59k29dsskiwmovc2MWabfC+Eqr6trmrTrPhyFWa/gUsDMuzQjv4vO6AG1
 tH8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUB8uWzbsoxKmuVqHqJRsSwHIQOvO3T8GNAQZEP4KE36T7NyPgDVIj0u+HLPJv6wuw68v+z/zkp2W8P@nongnu.org
X-Gm-Message-State: AOJu0YwKOjJnqkfiC3ZThHlMDm47yCxtmWs4Gp1DAkOXAmT6P7LcGPEt
 ANPzAvFdxKfk24VLAgzQ11dpR/vPNooJ/2HRYVbK8sqoLec4KngG8zQOEZeeMyhVBWhip5OB0md
 Yr2MKuwbQnQ==
X-Received: from pgbdr3.prod.google.com ([2002:a05:6a02:fc3:b0:7fd:9a34:d2df])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:e92:b0:1e1:a885:3e21 with SMTP id
 adf61e73a8af0-1e5e044ed2cmr36956461637.7.1735201709805; 
 Thu, 26 Dec 2024 00:28:29 -0800 (PST)
Date: Thu, 26 Dec 2024 08:27:50 +0000
In-Reply-To: <20241226082800.2887689-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20241226082800.2887689-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226082800.2887689-8-wuhaotsh@google.com>
Subject: [PATCH v2 07/17] hw/misc: Add nr_regs and cold_reset_values to NPCM
 GCR
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, titusr@google.com, mimik-dev@google.com, 
 hskinnemoen@google.com, venture@google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3rRNtZwgKCsoCAxq498xw44w1u.s426u2A-tuBu1343w3A.47w@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: qiMyKTh8R3WG

These 2 values are different between NPCM7XX and NPCM8XX
GCRs. So we add them to the class and assign different values
to them.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/misc/npcm_gcr.c         | 24 +++++++++++++++---------
 include/hw/misc/npcm_gcr.h | 13 +++++++++++--
 2 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/hw/misc/npcm_gcr.c b/hw/misc/npcm_gcr.c
index 0959f2e5c4..295073ba14 100644
--- a/hw/misc/npcm_gcr.c
+++ b/hw/misc/npcm_gcr.c
@@ -69,7 +69,7 @@ enum NPCM7xxGCRRegisters {
     NPCM7XX_GCR_REGS_END,
 };
 
-static const uint32_t cold_reset_values[NPCM7XX_GCR_NR_REGS] = {
+static const uint32_t npcm7xx_cold_reset_values[NPCM7XX_GCR_NR_REGS] = {
     [NPCM7XX_GCR_PDID]          = 0x04a92750,   /* Poleg A1 */
     [NPCM7XX_GCR_MISCPE]        = 0x0000ffff,
     [NPCM7XX_GCR_SPSWC]         = 0x00000003,
@@ -88,8 +88,9 @@ static uint64_t npcm_gcr_read(void *opaque, hwaddr offset, unsigned size)
 {
     uint32_t reg = offset / sizeof(uint32_t);
     NPCMGCRState *s = opaque;
+    NPCMGCRClass *c = NPCM_GCR_GET_CLASS(s);
 
-    if (reg >= NPCM7XX_GCR_NR_REGS) {
+    if (reg >= c->nr_regs) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: offset 0x%04" HWADDR_PRIx " out of range\n",
                       __func__, offset);
@@ -106,11 +107,12 @@ static void npcm_gcr_write(void *opaque, hwaddr offset,
 {
     uint32_t reg = offset / sizeof(uint32_t);
     NPCMGCRState *s = opaque;
+    NPCMGCRClass *c = NPCM_GCR_GET_CLASS(s);
     uint32_t value = v;
 
-    trace_npcm_gcr_write(offset, value);
+    trace_npcm_gcr_write(offset, v);
 
-    if (reg >= NPCM7XX_GCR_NR_REGS) {
+    if (reg >= c->nr_regs) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: offset 0x%04" HWADDR_PRIx " out of range\n",
                       __func__, offset);
@@ -156,10 +158,10 @@ static const struct MemoryRegionOps npcm_gcr_ops = {
 static void npcm7xx_gcr_enter_reset(Object *obj, ResetType type)
 {
     NPCMGCRState *s = NPCM_GCR(obj);
+    NPCMGCRClass *c = NPCM_GCR_GET_CLASS(obj);
 
-    QEMU_BUILD_BUG_ON(sizeof(s->regs) != sizeof(cold_reset_values));
-
-    memcpy(s->regs, cold_reset_values, sizeof(s->regs));
+    memcpy(s->regs, c->cold_reset_values, c->nr_regs * sizeof(uint32_t));
+    /* These 3 registers are at the same location in both 7xx and 8xx. */
     s->regs[NPCM7XX_GCR_PWRON] = s->reset_pwron;
     s->regs[NPCM7XX_GCR_MDLR] = s->reset_mdlr;
     s->regs[NPCM7XX_GCR_INTCR3] = s->reset_intcr3;
@@ -224,7 +226,7 @@ static const VMStateDescription vmstate_npcm_gcr = {
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (const VMStateField[]) {
-        VMSTATE_UINT32_ARRAY(regs, NPCMGCRState, NPCM7XX_GCR_NR_REGS),
+        VMSTATE_UINT32_ARRAY(regs, NPCMGCRState, NPCM_GCR_MAX_NR_REGS),
         VMSTATE_END_OF_LIST(),
     },
 };
@@ -238,7 +240,6 @@ static void npcm_gcr_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
-    QEMU_BUILD_BUG_ON(NPCM7XX_GCR_REGS_END > NPCM7XX_GCR_NR_REGS);
     dc->realize = npcm_gcr_realize;
     dc->vmsd = &vmstate_npcm_gcr;
 
@@ -247,13 +248,17 @@ static void npcm_gcr_class_init(ObjectClass *klass, void *data)
 
 static void npcm7xx_gcr_class_init(ObjectClass *klass, void *data)
 {
+    NPCMGCRClass *c = NPCM_GCR_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
     ResettableClass *rc = RESETTABLE_CLASS(klass);
 
+    QEMU_BUILD_BUG_ON(NPCM7XX_GCR_REGS_END > NPCM_GCR_MAX_NR_REGS);
     QEMU_BUILD_BUG_ON(NPCM7XX_GCR_REGS_END != NPCM7XX_GCR_NR_REGS);
     dc->desc = "NPCM7xx System Global Control Registers";
     rc->phases.enter = npcm7xx_gcr_enter_reset;
 
+    c->nr_regs = NPCM7XX_GCR_NR_REGS;
+    c->cold_reset_values = npcm7xx_cold_reset_values;
 }
 
 static const TypeInfo npcm_gcr_info[] = {
@@ -262,6 +267,7 @@ static const TypeInfo npcm_gcr_info[] = {
         .parent             = TYPE_SYS_BUS_DEVICE,
         .instance_size      = sizeof(NPCMGCRState),
         .instance_init      = npcm_gcr_init,
+        .class_size         = sizeof(NPCMGCRClass),
         .class_init         = npcm_gcr_class_init,
         .abstract           = true,
     },
diff --git a/include/hw/misc/npcm_gcr.h b/include/hw/misc/npcm_gcr.h
index 6d3d00d260..9af24e5cdc 100644
--- a/include/hw/misc/npcm_gcr.h
+++ b/include/hw/misc/npcm_gcr.h
@@ -18,6 +18,7 @@
 
 #include "exec/memory.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
 
 /*
  * NPCM7XX PWRON STRAP bit fields
@@ -53,6 +54,7 @@
  * Number of registers in our device state structure. Don't change this without
  * incrementing the version_id in the vmstate.
  */
+#define NPCM_GCR_MAX_NR_REGS NPCM7XX_GCR_NR_REGS
 #define NPCM7XX_GCR_NR_REGS (0x148 / sizeof(uint32_t))
 
 typedef struct NPCMGCRState {
@@ -60,15 +62,22 @@ typedef struct NPCMGCRState {
 
     MemoryRegion iomem;
 
-    uint32_t regs[NPCM7XX_GCR_NR_REGS];
+    uint32_t regs[NPCM_GCR_MAX_NR_REGS];
 
     uint32_t reset_pwron;
     uint32_t reset_mdlr;
     uint32_t reset_intcr3;
 } NPCMGCRState;
 
+typedef struct NPCMGCRClass {
+    SysBusDeviceClass parent;
+
+    size_t nr_regs;
+    const uint32_t *cold_reset_values;
+} NPCMGCRClass;
+
 #define TYPE_NPCM_GCR "npcm-gcr"
 #define TYPE_NPCM7XX_GCR "npcm7xx-gcr"
-OBJECT_DECLARE_SIMPLE_TYPE(NPCMGCRState, NPCM_GCR)
+OBJECT_DECLARE_TYPE(NPCMGCRState, NPCMGCRClass, NPCM_GCR)
 
 #endif /* NPCM_GCR_H */
-- 
2.47.1.613.gc27f4b7a9f-goog

