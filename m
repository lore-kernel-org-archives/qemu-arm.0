Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1213662ejb;
        Sat, 1 Apr 2023 03:51:43 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZgT6nOdJE7Sp1iYmpDq7ItVV8c662uTgFZAr+0It8VuPtuB3KvID864FExweyIsl45j5nZ
X-Received: by 2002:ac8:4e84:0:b0:3dc:4d81:aa40 with SMTP id 4-20020ac84e84000000b003dc4d81aa40mr20291974qtp.30.1680346303663;
        Sat, 01 Apr 2023 03:51:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680346303; cv=none;
        d=google.com; s=arc-20160816;
        b=AhMg21s+YJ3BB2RDh6zTQFu5KxsKJw8rvo1xafM5aNRYenDHm91TrVY1CN9kGf7zg8
         Qsa8ioPEW/EWW9t+Rj/6D8GOSqp+zWxU1RaeJm9ao2YghDni3eFQjHW9cn8XqRSsG/RF
         oGTVl8Qy30A4xiA+5in23Ln1gu8qyZQAM29VlJPF527HnneI2o2m6i8zIE8tO68m6P8J
         pFS2JIojZ2Y7mS3BNQkMv2x6hPiUIkbwI40YFPzwrwrMXHMYi0T8pOv4ROIT55EL6iAe
         V/cLb3OOvVsPpq9E4WofArHWvFYGxrF7luiZB5ak2BsEDl3QSfjp6dFh0yLIOVvPuE1S
         7JuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=DgwScSC9y5Yk0BVppxr6p5qYGAxL7U2AO7j1psjln/c=;
        b=R7O3+7wkbp0JLwACRPjQ4RJ+gB25jMxsWo5+OfVtf3WT0RMcmFPpF+5KtZs78kvAiu
         m0WmhpF5RiTK0SFq3CVT8crOpbo/9qmQlLzxftnmJadUXd/zyYzo+h/gr3nLwn0yKaxP
         84/BSjXhXFD1dFZ5cagMSaIVspd1oQPNyVOtkNHK5CJi9DP2Fl5oONhDnt0vqyseqM4I
         C/x8q3TFOpQjfjkr7UDUDTbfwYMbXoaze/aJZnpr8hKd0y7+/esMeiucnxkgqf3LFV/y
         apJsw+wyS7lsTIkLMiUrnkG+QePEv6mjX7O8/v0hZjxo9AwJuzbQsX91gICNHLnAjOUC
         NMgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=LYTXEDCH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id do32-20020a05620a2b2000b007485d6a6e42si2980264qkb.27.2023.04.01.03.51.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Apr 2023 03:51:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=LYTXEDCH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1piYoY-0000rj-Fd; Sat, 01 Apr 2023 06:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ZwwoZAgKCEg2wy23kpkqyyqvo.myw0ow4-k1wxyxqx4.y1q@flex--smostafa.bounces.google.com>)
 id 1piYoW-0000qZ-Mp
 for qemu-arm@nongnu.org; Sat, 01 Apr 2023 06:50:28 -0400
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ZwwoZAgKCEg2wy23kpkqyyqvo.myw0ow4-k1wxyxqx4.y1q@flex--smostafa.bounces.google.com>)
 id 1piYoU-0003Ep-Sa
 for qemu-arm@nongnu.org; Sat, 01 Apr 2023 06:50:28 -0400
Received: by mail-wm1-x349.google.com with SMTP id
 j22-20020a05600c1c1600b003ef95cef641so5941036wms.8
 for <qemu-arm@nongnu.org>; Sat, 01 Apr 2023 03:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680346215;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=DgwScSC9y5Yk0BVppxr6p5qYGAxL7U2AO7j1psjln/c=;
 b=LYTXEDCHRxY96RL+UehNmNOV//3B5fcEzqXQssXS1EaBBNScyth2SWwVnyg/N/4Vgf
 D8RwlbBg6bT1G9djteRX8c2pgSYwgAtyOnY7ZDeCbGmedOU8zWTKrgLodPcKHBA8M56O
 0si3tvapOKnH/yTYRAxeYCrIEFY3/0onB6iDJMM8iDstsnJD2WDLbRCisuUNHzsxd/dE
 49BSa59Vd9F1xlxDPJu3U6/KEhVerU4xHKnsV1Mf/xbj8Zze10QUUODi4loyZ3YC9hdZ
 +qB3Z19ftG1DdjnvJH+upaiNZVR6jGzGWqgtZdFZhRT4DWN5zNzkF2rWH8HVniEG13//
 vdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680346215;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DgwScSC9y5Yk0BVppxr6p5qYGAxL7U2AO7j1psjln/c=;
 b=PGQT3zXWIPoR4denmsYN6AINQZ4ZJ19esLFfavfRPa3jZvMtNXRs/fJg85Dfmahez2
 3w4ASSWoO0X88sYIaIQaagd06hCNSbqTwfBDh80LcqsWL0EiyAfJZQ//BROaD1gwTVXe
 ml8L7feYicTisgvro1UcYFaPSIw/8HMTZnz5IbFnpA7JBP9fO/CpNX4Q+B/SVwq2X7e+
 HCT5rcW+qI2vzj7xnqR/ovgpyG0pGHhkhFO6Vk7874PF0JLdyV7GcxPG92b7LC/I9pvF
 kEXlSAwd4GQ9x4ILVhRHHXF0DHQkK+n1ZgLst2Zsgguw5yrNIlKSXH4oyORv693MwNYg
 FW1A==
X-Gm-Message-State: AAQBX9cz4V/iU4f0fRzOHQZ7IEg73DGJmPm71dv55wqE8+tyVyRJEskn
 s7V72lw7SmOlCvy5iRsb/HpQps5bSsaekA==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a5d:5272:0:b0:2dc:fcf2:dc67 with SMTP id
 l18-20020a5d5272000000b002dcfcf2dc67mr6171529wrc.10.1680346215134; Sat, 01
 Apr 2023 03:50:15 -0700 (PDT)
Date: Sat,  1 Apr 2023 10:49:51 +0000
In-Reply-To: <20230401104953.1325983-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230401104953.1325983-1-smostafa@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230401104953.1325983-9-smostafa@google.com>
Subject: [RFC PATCH v3 08/10] hw/arm/smmuv3: Add CMDs related to stage-2
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::349;
 envelope-from=3ZwwoZAgKCEg2wy23kpkqyyqvo.myw0ow4-k1wxyxqx4.y1q@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x349.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: 9qyf7TUbR8hB

CMD_TLBI_S2_IPA: As S1+S2 is not enabled, for now this can be the
same as CMD_TLBI_NH_VAA.

CMD_TLBI_S12_VMALL: Added new function to invalidate TLB by VMID.

For stage-1 only commands, add a check to throw CERROR_ILL if used
when stage-1 is not supported.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
Changes in v3:
- Log guest error for all illegal commands.
Changes in v2:
- Add checks for stage-1 only commands
- Rename smmuv3_s1_range_inval to smmuv3_range_inval
---
 hw/arm/smmu-common.c         | 16 +++++++++++
 hw/arm/smmuv3.c              | 53 ++++++++++++++++++++++++++++++------
 hw/arm/trace-events          |  4 ++-
 include/hw/arm/smmu-common.h |  1 +
 4 files changed, 65 insertions(+), 9 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 72ed6edd48..45e9d7e752 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -135,6 +135,16 @@ static gboolean smmu_hash_remove_by_asid(gpointer key, gpointer value,
 
     return SMMU_IOTLB_ASID(*iotlb_key) == asid;
 }
+
+static gboolean smmu_hash_remove_by_vmid(gpointer key, gpointer value,
+                                         gpointer user_data)
+{
+    uint16_t vmid = *(uint16_t *)user_data;
+    SMMUIOTLBKey *iotlb_key = (SMMUIOTLBKey *)key;
+
+    return SMMU_IOTLB_VMID(*iotlb_key) == vmid;
+}
+
 static gboolean smmu_hash_remove_by_asid_vmid_iova(gpointer key, gpointer value,
                                               gpointer user_data)
 {
@@ -187,6 +197,12 @@ void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid)
     g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_asid, &asid);
 }
 
+inline void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid)
+{
+    trace_smmu_iotlb_inv_vmid(vmid);
+    g_hash_table_foreach_remove(s->iotlb, smmu_hash_remove_by_vmid, &vmid);
+}
+
 /* VMSAv8-64 Translation */
 
 /**
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index d7e7003da9..3b5b1fad1a 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1069,7 +1069,7 @@ static void smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
     }
 }
 
-static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
+static void smmuv3_range_inval(SMMUState *s, Cmd *cmd)
 {
     dma_addr_t end, addr = CMD_ADDR(cmd);
     uint8_t type = CMD_TYPE(cmd);
@@ -1094,7 +1094,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
     }
 
     if (!tg) {
-        trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
+        trace_smmuv3_range_inval(vmid, asid, addr, tg, 1, ttl, leaf);
         smmuv3_inv_notifiers_iova(s, asid, addr, tg, 1);
         smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, 1, ttl);
         return;
@@ -1112,7 +1112,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
         uint64_t mask = dma_aligned_pow2_mask(addr, end, 64);
 
         num_pages = (mask + 1) >> granule;
-        trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
+        trace_smmuv3_range_inval(vmid, asid, addr, tg, num_pages, ttl, leaf);
         smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
         smmu_iotlb_inv_iova(s, asid, vmid, addr, tg, num_pages, ttl);
         addr += mask + 1;
@@ -1246,12 +1246,22 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         {
             uint16_t asid = CMD_ASID(&cmd);
 
+            if (!STAGE1_SUPPORTED(s)) {
+                cmd_error = SMMU_CERROR_ILL;
+                break;
+            }
+
             trace_smmuv3_cmdq_tlbi_nh_asid(asid);
             smmu_inv_notifiers_all(&s->smmu_state);
             smmu_iotlb_inv_asid(bs, asid);
             break;
         }
         case SMMU_CMD_TLBI_NH_ALL:
+            if (!STAGE1_SUPPORTED(s)) {
+                cmd_error = SMMU_CERROR_ILL;
+                break;
+            }
+            QEMU_FALLTHROUGH;
         case SMMU_CMD_TLBI_NSNH_ALL:
             trace_smmuv3_cmdq_tlbi_nh();
             smmu_inv_notifiers_all(&s->smmu_state);
@@ -1259,7 +1269,34 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
             break;
         case SMMU_CMD_TLBI_NH_VAA:
         case SMMU_CMD_TLBI_NH_VA:
-            smmuv3_s1_range_inval(bs, &cmd);
+            if (!STAGE1_SUPPORTED(s)) {
+                cmd_error = SMMU_CERROR_ILL;
+                break;
+            }
+            smmuv3_range_inval(bs, &cmd);
+            break;
+        case SMMU_CMD_TLBI_S12_VMALL:
+            uint16_t vmid = CMD_VMID(&cmd);
+
+            if (!STAGE2_SUPPORTED(s)) {
+                cmd_error = SMMU_CERROR_ILL;
+                break;
+            }
+
+            trace_smmuv3_cmdq_tlbi_s12_vmid(vmid);
+            smmu_inv_notifiers_all(&s->smmu_state);
+            smmu_iotlb_inv_vmid(bs, vmid);
+            break;
+        case SMMU_CMD_TLBI_S2_IPA:
+            if (!STAGE2_SUPPORTED(s)) {
+                cmd_error = SMMU_CERROR_ILL;
+                break;
+            }
+            /*
+             * As currently only either s1 or s2 are supported
+             * we can reuse same function for s2.
+             */
+            smmuv3_range_inval(bs, &cmd);
             break;
         case SMMU_CMD_TLBI_EL3_ALL:
         case SMMU_CMD_TLBI_EL3_VA:
@@ -1267,8 +1304,6 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         case SMMU_CMD_TLBI_EL2_ASID:
         case SMMU_CMD_TLBI_EL2_VA:
         case SMMU_CMD_TLBI_EL2_VAA:
-        case SMMU_CMD_TLBI_S12_VMALL:
-        case SMMU_CMD_TLBI_S2_IPA:
         case SMMU_CMD_ATC_INV:
         case SMMU_CMD_PRI_RESP:
         case SMMU_CMD_RESUME:
@@ -1277,12 +1312,14 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
             break;
         default:
             cmd_error = SMMU_CERROR_ILL;
-            qemu_log_mask(LOG_GUEST_ERROR,
-                          "Illegal command type: %d\n", CMD_TYPE(&cmd));
             break;
         }
         qemu_mutex_unlock(&s->mutex);
         if (cmd_error) {
+            if (cmd_error == SMMU_CERROR_ILL) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "Illegal command type: %d\n", CMD_TYPE(&cmd));
+            }
             break;
         }
         /*
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 705104e58b..f8fdf1ca9f 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -12,6 +12,7 @@ smmu_ptw_block_pte(int stage, int level, uint64_t baseaddr, uint64_t pteaddr, ui
 smmu_get_pte(uint64_t baseaddr, int index, uint64_t pteaddr, uint64_t pte) "baseaddr=0x%"PRIx64" index=0x%x, pteaddr=0x%"PRIx64", pte=0x%"PRIx64
 smmu_iotlb_inv_all(void) "IOTLB invalidate all"
 smmu_iotlb_inv_asid(uint16_t asid) "IOTLB invalidate asid=%d"
+smmu_iotlb_inv_vmid(uint16_t vmid) "IOTLB invalidate vmid=%d"
 smmu_iotlb_inv_iova(uint16_t asid, uint64_t addr) "IOTLB invalidate asid=%d addr=0x%"PRIx64
 smmu_inv_notifiers_mr(const char *name) "iommu mr=%s"
 smmu_iotlb_lookup_hit(uint16_t asid, uint16_t vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
@@ -45,9 +46,10 @@ smmuv3_cmdq_cfgi_ste_range(int start, int end) "start=0x%x - end=0x%x"
 smmuv3_cmdq_cfgi_cd(uint32_t sid) "sid=0x%x"
 smmuv3_config_cache_hit(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache HIT for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
 smmuv3_config_cache_miss(uint32_t sid, uint32_t hits, uint32_t misses, uint32_t perc) "Config cache MISS for sid=0x%x (hits=%d, misses=%d, hit rate=%d)"
-smmuv3_s1_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf) "vmid=%d asid=%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d"
+smmuv3_range_inval(int vmid, int asid, uint64_t addr, uint8_t tg, uint64_t num_pages, uint8_t ttl, bool leaf) "vmid=%d asid=%d addr=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" ttl=%d leaf=%d"
 smmuv3_cmdq_tlbi_nh(void) ""
 smmuv3_cmdq_tlbi_nh_asid(uint16_t asid) "asid=%d"
+smmuv3_cmdq_tlbi_s12_vmid(uint16_t vmid) "vmid=%d"
 smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=0x%x"
 smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
 smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 3cbb4998ad..fd8d772da1 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -193,6 +193,7 @@ SMMUIOTLBKey smmu_get_iotlb_key(uint16_t asid, uint16_t vmid, uint64_t iova,
                                 uint8_t tg, uint8_t level);
 void smmu_iotlb_inv_all(SMMUState *s);
 void smmu_iotlb_inv_asid(SMMUState *s, uint16_t asid);
+void smmu_iotlb_inv_vmid(SMMUState *s, uint16_t vmid);
 void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
                          uint8_t tg, uint64_t num_pages, uint8_t ttl);
 
-- 
2.40.0.348.gf938b09366-goog

