Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp29498lfb;
        Thu, 2 Sep 2021 01:15:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxc2lMHoWIxhOctKVdG0zFL4oIEDLQ7ug2ZxwwayuMEkU91ik1XXfhzyop24WT9m0oaxKBn
X-Received: by 2002:a05:6e02:214e:: with SMTP id d14mr1464641ilv.142.1630570532207;
        Thu, 02 Sep 2021 01:15:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630570532; cv=none;
        d=google.com; s=arc-20160816;
        b=N28OM6aPjELmvU/0dRFgalkX/yh7FLjEwoRbbyJHF3gxBY6FC3cN/Z16lWXPwBvP5p
         GN41HkO+ggNS0XDbjxYk7wLeQyEJZgXTHp1hFxAbzaK4osXSfw72GZFfa4ANvxUE+SVZ
         PYoX43S7m+08/uWTR6OyfE+An5fFInJbZ7J2q6gjh1s6Cn5b7wlZqp57AiFo3ROqqGEZ
         CCira7WxGL9SxzxpB1VZBc21dgyfp+AeLjevOo7GQD/iYPnCwwl7JeykEzU6xyOT0jun
         7xCrfsEfqFXyRJRIhaAuaZ8K0SM1Oy0RTPan55WoONCgIDQj3wtFaNGf6mvrmLs3yMEl
         bEdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=sxT4fNg/5jw852mPUItD0wtKQXXXp9s6gNNw/pABRQs=;
        b=xu8LL2pnsLliUaty26DyZ/2RNFbj+H1HT1CXnd1J26EGEIfI3RJhXH/o+WD1gwlQXZ
         3wrwrkChYyzUsTdlMMplfi2SuPJuBleo+48Ta6KU84CF67IwL0ti6OmAQOYLREU8u79d
         uiyHX+GqKCUt87ChC6VBaIlDON701ht7GdHjs0WOW/VKl6AFaZGBwuKXhjMwAXRdl6lX
         ecRr9ySPPIUr2csK8HC2oAtBAKEzYik/NB3idGN1RU7XLTVNEWlqmNpri1DS1NL9zwil
         mZJsJyLfuPWrGVvnGXP6cV64x8SAkyR3C1bIhODSkxKEYcEW7h18lYikusPbBYhnsKEh
         ThQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=hNqshChi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5si1410010ilg.86.2021.09.02.01.15.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 01:15:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=hNqshChi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Received: from localhost ([::1]:36850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLhsh-0001mw-IU
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 04:15:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chunming_li1234@163.com>)
 id 1mLhsJ-0001jR-MZ; Thu, 02 Sep 2021 04:15:09 -0400
Received: from m12-16.163.com ([220.181.12.16]:52783)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chunming_li1234@163.com>)
 id 1mLhsD-0002jL-Rs; Thu, 02 Sep 2021 04:15:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=sxT4f
 Ng/5jw852mPUItD0wtKQXXXp9s6gNNw/pABRQs=; b=hNqshChi3TlTe2w4/TBU1
 552gLiqRaMQBGlLzpuWzbukh8rhlF+Flo2Yh6ttkhuxJWnnSpsIWoVYFARXgBI5q
 kM4CSlqEsxzcwlywZx8q0LgyvJrr6hcCgoQ3eKOojH+//wuyiFZM0o6GW9E45gjL
 JdXC+DYoJ54aOYvE8DYjXE=
Received: from lcm-VirtualBox.verisilicon.com (unknown [182.148.13.201])
 by smtp12 (Coremail) with SMTP id EMCowABXMRDmhzBhan7BAQ--.86S6;
 Thu, 02 Sep 2021 16:14:44 +0800 (CST)
From: chunming <chunming_li1234@163.com>
To: eric.auger@redhat.com,
	peter.maydell@linaro.org
Subject: [PATCH v6 2/4] hw/arm/smmuv3: Update CFGI commands to support non
 PCI/PCIe devices
Date: Thu,  2 Sep 2021 16:14:27 +0800
Message-Id: <20210902081429.140293-3-chunming_li1234@163.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210902081429.140293-1-chunming_li1234@163.com>
References: <20210902081429.140293-1-chunming_li1234@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EMCowABXMRDmhzBhan7BAQ--.86S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7KrW3Aw1kJFyxZr4kKrWktFb_yoW8KrW3pr
 42kFn0gr18Gw1SkrsIyr4I9FZxJ3ZY9F1jgr1UWa93C3WDAryrXryDKw1fJr9rWFW0vr47
 uayrWF45Xr12v3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bFEfOUUUUU=
X-Originating-IP: [182.148.13.201]
X-CM-SenderInfo: xfkx0zplqjszjlrsjki6rwjhhfrp/1tbivxUCdlWBveQstQAAsK
Received-SPF: pass client-ip=220.181.12.16;
 envelope-from=chunming_li1234@163.com; helo=m12-16.163.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_40=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: renwei.liu@verisilicon.com, qemu-arm@nongnu.org,
 jianxian.wen@verisilicon.com, qemu-devel@nongnu.org,
 chunming <chunming.li@verisilicon.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EiAGDdPtXRfc

From: chunming <chunming.li@verisilicon.com>

  "smmu_iommu_mr" function can't get MR according to SID for non PCI/PCIe devices.
  Look up in the platform device list: peri_sdev_list for non PCI/PCIe devices.

Signed-off-by: chunming <chunming.li@verisilicon.com>
---
 hw/arm/smmuv3.c              | 29 ++++++++++++++++++-----------
 include/hw/arm/smmu-common.h |  5 ++++-
 2 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 557d24ec6..615a6c904 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -985,14 +985,17 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
                 break;
             }
 
-            if (!mr) {
-                break;
+            if (mr) {
+                trace_smmuv3_cmdq_cfgi_ste(sid);
+                sdev = container_of(mr, SMMUDevice, iommu);
+                smmuv3_flush_config(sdev);
             }
 
-            trace_smmuv3_cmdq_cfgi_ste(sid);
-            sdev = container_of(mr, SMMUDevice, iommu);
-            smmuv3_flush_config(sdev);
-
+            sdev = smmu_find_peri_sdev(bs, sid);
+            if (sdev) {
+                trace_smmuv3_cmdq_cfgi_ste(sid);
+                smmuv3_flush_config(sdev);
+            }
             break;
         }
         case SMMU_CMD_CFGI_STE_RANGE: /* same as SMMU_CMD_CFGI_ALL */
@@ -1027,13 +1030,17 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
                 break;
             }
 
-            if (!mr) {
-                break;
+            if (mr) {
+                trace_smmuv3_cmdq_cfgi_cd(sid);
+                sdev = container_of(mr, SMMUDevice, iommu);
+                smmuv3_flush_config(sdev);
             }
 
-            trace_smmuv3_cmdq_cfgi_cd(sid);
-            sdev = container_of(mr, SMMUDevice, iommu);
-            smmuv3_flush_config(sdev);
+            sdev = smmu_find_peri_sdev(bs, sid);
+            if (sdev) {
+                trace_smmuv3_cmdq_cfgi_cd(sid);
+                smmuv3_flush_config(sdev);
+            }
             break;
         }
         case SMMU_CMD_TLBI_NH_ASID:
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 2902eb13c..be12b93c5 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -161,7 +161,10 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
  */
 SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova);
 
-/* Return the iommu mr associated to @sid, or NULL if none */
+/**
+ * Return the iommu mr associated to @sid, or NULL if none
+ * Only for PCI device, check smmu_find_peri_sdev for peripheral device
+ */
 IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid);
 
 #define SMMU_IOTLB_MAX_SIZE 256
-- 
2.30.2


