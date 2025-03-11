Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1885440njc;
        Tue, 11 Mar 2025 07:16:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXq8scnCCKeWTIgm/zUWy11frNQHD7jmOy5YLQDStY0voz65b4lFqOafnh+3BFjfrRvytOM0YH/TQQb9w==@linaro.org
X-Google-Smtp-Source: AGHT+IGNdFpSrbuuLNZljrinWdP3szCnDdkNzHhJgqG53i6kOfDao3Ws1xaYjMAvvT+H0hlHzcMi
X-Received: by 2002:a05:6000:4023:b0:390:f116:d220 with SMTP id ffacd0b85a97d-3926cb66576mr4158224f8f.17.1741702614763;
        Tue, 11 Mar 2025 07:16:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741702614; cv=none;
        d=google.com; s=arc-20240605;
        b=UxTqbqYch5tuHKn5XkmUEUkbZbraaD+RWxEixjkjh+DHVApCI8YMjiqJ5698tc1MgY
         O3+e+FO4u9pjiL10z0SOrqtbbeOTQU5dwt8Ut39/RYoC7jtbb4aLiNI0Xu4xdedsiGXu
         tIfrBQW11Thn9oYejjYOVFZn04jItnyNMTc0OJXWkaiqcPmOInSIkr9bczHUTANkuiYS
         gzheNNqCLP985OwyNp31kuKUXjWFPweLpkR9rBvCOQ9Uxg+vVUJ+PzxBjwi3JN0XsuNi
         lVK257sUVbPh97J+KGKo2sY6a9hM5wUzSKuG1TJIQXzcjRKWX/EKwFhdtdgCKA8+AEEl
         aE/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=Ui0lAPaQu7Mc64GMat30OvqdY77G58dawGdVkfSsIuE=;
        fh=PnSw404jJ+s1m+rSaKsD+X9lt69JOcV3ATg/BWbrXZg=;
        b=lOVTAJCRIaGT6g8++BR+02Ryi9qANUwjXpGb1937SFa3/jEuLg1Mx2Zb0S1H3c4twi
         Vy49Gx7+EwddLdEN2FoUx08fEw2MFZxTh2W2wKvpEdQbUcCM4w/M1FWTEo92nyML9SqV
         Pjf9tr4Gd9CBJabzosLEa9MlljsE0o518dvTueq7RTh1pHXZJwzhe6+gp2bpP28VN0gd
         SJjXIVI4ShYqNa+tVQiHeD1CKNa46YiWG1m4binw+5tn6OBbLkSEyiY0jaHXe0nUXRDl
         Q9JzsP0n4j7HfhkquiTshzgRrjEgaW/jsaWI0w3t69FOqGsA29j1/C4Q3X3e1g59o/eG
         1czQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3912c11e3a1si8901482f8f.617.2025.03.11.07.16.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 07:16:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ts0NG-0000mZ-QK; Tue, 11 Mar 2025 10:14:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ts0NE-0000Ze-Le; Tue, 11 Mar 2025 10:14:25 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ts0NC-0007DF-Gy; Tue, 11 Mar 2025 10:14:24 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZBwcs0dtrz6FGXG;
 Tue, 11 Mar 2025 22:09:49 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id A058F14038F;
 Tue, 11 Mar 2025 22:14:14 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 11 Mar 2025 15:14:07 +0100
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [RFC PATCH v2 15/20] hw/arm/smmuv3: Forward invalidation commands to
 hw
Date: Tue, 11 Mar 2025 14:10:40 +0000
Message-ID: <20250311141045.66620-16-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500008.china.huawei.com (7.182.85.71)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
From:  Shameer Kolothum via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4mhy9LLtyTPB

From: Nicolin Chen <nicolinc@nvidia.com>

Use the provided smmuv3-accel helper functions to issue the
command to physical SMMUv3.

Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/smmuv3-internal.h | 11 ++++++++
 hw/arm/smmuv3.c          | 58 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 4602ae6728..546f8faac0 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -235,6 +235,17 @@ static inline bool smmuv3_gerror_irq_enabled(SMMUv3State *s)
 #define Q_CONS_WRAP(q) (((q)->cons & WRAP_MASK(q)) >> (q)->log2size)
 #define Q_PROD_WRAP(q) (((q)->prod & WRAP_MASK(q)) >> (q)->log2size)
 
+static inline int smmuv3_q_ncmds(SMMUQueue *q)
+{
+        uint32_t prod = Q_PROD(q);
+        uint32_t cons = Q_CONS(q);
+
+        if (Q_PROD_WRAP(q) == Q_CONS_WRAP(q))
+                return prod - cons;
+        else
+                return WRAP_MASK(q) - cons + prod;
+}
+
 static inline bool smmuv3_q_full(SMMUQueue *q)
 {
     return ((q->cons ^ q->prod) & WRAP_INDEX_MASK(q)) == WRAP_MASK(q);
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 83159db1d4..e0f225d0df 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1297,10 +1297,18 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
     SMMUCmdError cmd_error = SMMU_CERROR_NONE;
     SMMUQueue *q = &s->cmdq;
     SMMUCommandType type = 0;
+    SMMUCommandBatch batch = {};
+    uint32_t ncmds = 0;
+
 
     if (!smmuv3_cmdq_enabled(s)) {
         return 0;
     }
+
+    ncmds = smmuv3_q_ncmds(q);
+    batch.cmds = g_new0(Cmd, ncmds);
+    batch.cons = g_new0(uint32_t, ncmds);
+
     /*
      * some commands depend on register values, typically CR0. In case those
      * register values change while handling the command, spec says it
@@ -1395,6 +1403,13 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
 
             trace_smmuv3_cmdq_cfgi_cd(sid);
             smmuv3_flush_config(sdev);
+
+            if (smmuv3_accel_batch_cmds(sdev->smmu, sdev, &batch, &cmd,
+                                        &q->cons, true)) {
+                cmd_error = SMMU_CERROR_ILL;
+                break;
+            }
+
             break;
         }
         case SMMU_CMD_TLBI_NH_ASID:
@@ -1418,6 +1433,13 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
             trace_smmuv3_cmdq_tlbi_nh_asid(asid);
             smmu_inv_notifiers_all(&s->smmu_state);
             smmu_iotlb_inv_asid_vmid(bs, asid, vmid);
+
+            if (smmuv3_accel_batch_cmds(bs, NULL, &batch, &cmd, &q->cons,
+                                        false)) {
+                cmd_error = SMMU_CERROR_ILL;
+                break;
+            }
+
             break;
         }
         case SMMU_CMD_TLBI_NH_ALL:
@@ -1445,6 +1467,12 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
             trace_smmuv3_cmdq_tlbi_nsnh();
             smmu_inv_notifiers_all(&s->smmu_state);
             smmu_iotlb_inv_all(bs);
+
+            if (smmuv3_accel_batch_cmds(bs, NULL, &batch, &cmd, &q->cons,
+                                        false)) {
+                cmd_error = SMMU_CERROR_ILL;
+                break;
+            }
             break;
         case SMMU_CMD_TLBI_NH_VAA:
         case SMMU_CMD_TLBI_NH_VA:
@@ -1453,7 +1481,24 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
                 break;
             }
             smmuv3_range_inval(bs, &cmd, SMMU_STAGE_1);
+
+            if (smmuv3_accel_batch_cmds(bs, NULL, &batch, &cmd, &q->cons,
+                                        false)) {
+                cmd_error = SMMU_CERROR_ILL;
+                break;
+            }
+            break;
+        case SMMU_CMD_ATC_INV:
+        {
+            SMMUDevice *sdev = smmu_find_sdev(bs, CMD_SID(&cmd));
+
+            if (smmuv3_accel_batch_cmds(sdev->smmu, sdev, &batch, &cmd,
+                                        &q->cons, true)) {
+                cmd_error = SMMU_CERROR_ILL;
+                break;
+            }
             break;
+        }
         case SMMU_CMD_TLBI_S12_VMALL:
         {
             int vmid = CMD_VMID(&cmd);
@@ -1485,7 +1530,6 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         case SMMU_CMD_TLBI_EL2_ASID:
         case SMMU_CMD_TLBI_EL2_VA:
         case SMMU_CMD_TLBI_EL2_VAA:
-        case SMMU_CMD_ATC_INV:
         case SMMU_CMD_PRI_RESP:
         case SMMU_CMD_RESUME:
         case SMMU_CMD_STALL_TERM:
@@ -1511,12 +1555,24 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         queue_cons_incr(q);
     }
 
+    qemu_mutex_lock(&s->mutex);
+    if (!cmd_error && batch.ncmds) {
+        if (smmuv3_accel_issue_cmd_batch(bs, &batch)) {
+            q->cons = batch.cons[batch.ncmds];
+            cmd_error = SMMU_CERROR_ILL;
+        }
+    }
+    qemu_mutex_unlock(&s->mutex);
+
     if (cmd_error) {
         trace_smmuv3_cmdq_consume_error(smmu_cmd_string(type), cmd_error);
         smmu_write_cmdq_err(s, cmd_error);
         smmuv3_trigger_irq(s, SMMU_IRQ_GERROR, R_GERROR_CMDQ_ERR_MASK);
     }
 
+    g_free(batch.cmds);
+    g_free(batch.cons);
+
     trace_smmuv3_cmdq_consume_out(Q_PROD(q), Q_CONS(q),
                                   Q_PROD_WRAP(q), Q_CONS_WRAP(q));
 
-- 
2.34.1

