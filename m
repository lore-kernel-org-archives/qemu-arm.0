Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2588029lfg;
        Tue, 24 Aug 2021 01:08:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzntHnQPunwKinCXMqNvYcfsncORiz7eXd9k7AzyIlmnQVV4lr365qfL0jMaJ10/molqPTx
X-Received: by 2002:ac8:5883:: with SMTP id t3mr31593676qta.114.1629792482486;
        Tue, 24 Aug 2021 01:08:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629792482; cv=none;
        d=google.com; s=arc-20160816;
        b=HKtOMMPsqobhPUzqDoOJbc6mmOVrVWR9JqrMRaIsxkckZrRiIDB02ulgVXdFK0eBKe
         wcVTiFKihfgFO65WQZBxY1GGTy8HBlmMXfiwlb0UmBuLk2TJ+55gfz+t+4FfGEPapV7E
         IA5e0onmSAz1hkUruqfuBuGdKAdg9HKtV+dbpDsyoFmnMakRHmQHpa8OmA3aRmUa9S80
         BXhCeGRMfhF/rbaUFqazWgakpzdHMCiiQKtD0yEXSPzHnbXiJ4OE76i2iU0BMfpyhk8p
         iNGFw8ZSyeSiPjPOO8yjbBPNQn4QmRMP+J6bz7D2ua8lgYtBlNcWD2axr+4fh8auri7o
         lzsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:accept-language
         :message-id:date:thread-index:thread-topic:subject:to:from
         :dkim-signature:content-transfer-encoding:content-language;
        bh=yimugh48Becic0GhFSTi8nPNXxT6PgO+NB/hWj7G3t4=;
        b=l+Q2MXrV5RVTtZsqvkjZWVbvEdY5bzMSkUNrdC7SgGPH+krXTFCsDhE10n58pH3dKM
         KgvIsigr3582ocW5KPuBr3MsFbJ1teBtmNUTqkQWqBRoJZ7x1kGq8LoaotGMMatxWSoY
         pw+D4gduQQzziCQUD1D6MpqM44EwzmHkmGDjYAA5yQ1VymYbHfvY+DmSTFGhKJAdjMAg
         C9rDKmUq1uafpLflTQZW/sjG9bI6JyJ2JipKC4e+3liycbNnp850Kz1JmQ1UEw98jfbw
         zMDGjk9flVGerBwbD75uJBJr4Mf6VFQH1eTsmLhYJzlcYkNMzJB5W+t3uOmLo+SkkdRO
         dTmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@Verisilicon.com header.s=default header.b=TVKJ2x2z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=verisilicon.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u16si10394510qvm.60.2021.08.24.01.08.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Aug 2021 01:08:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@Verisilicon.com header.s=default header.b=TVKJ2x2z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=verisilicon.com
Received: from localhost ([::1]:42988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIRTV-00039T-SS
	for alex.bennee@linaro.org; Tue, 24 Aug 2021 04:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mIRRK-0007fJ-1r; Tue, 24 Aug 2021 04:05:46 -0400
Received: from shasxm06.verisilicon.com ([101.89.135.45]:30393
 helo=shasxm03.verisilicon.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mIRRF-00005A-Sf; Tue, 24 Aug 2021 04:05:45 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
 c=simple/simple; t=1629792330; h=from:subject:to:date:message-id;
 bh=St2t6F2z4r/Fprr138ILnhlp9BOe8YNVePfcpuNba74=;
 b=TVKJ2x2zeR0oao8OrgIXdhcz5hQ3dCMmh9rc8bcRZ1SAVpJyZ+CWkoePtDx8vmKYjOam2wt5e1C
 qndh4f5mebGCBdPtlYdARfAGiIU2VIua8ab3KAhEbGNfUhHBbn9QhVAI8EN45ZMP2vCY3bFit/rlF
 5OKeP0EkViAodHNKGuw=
Received: from SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa]) by
 SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda%16]) with mapi id
 14.03.0408.000; Tue, 24 Aug 2021 16:05:29 +0800
From: "Li, Chunming" <Chunming.Li@verisilicon.com>
To: "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Subject: [PATCH v4 2/4] hw/arm/smmuv3: Update implementation of CFGI
 commands based on device SID
Thread-Topic: [PATCH v4 2/4] hw/arm/smmuv3: Update implementation of CFGI
 commands based on device SID
Thread-Index: AdeYvs2dDiG1rau3TW6+KJDZkxWXOA==
Date: Tue, 24 Aug 2021 08:05:29 +0000
Message-ID: <49C79B700B5D8F45B8EF0861B4EF3B3B01142FABE6@SHASXM03.verisilicon.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [182.148.13.182]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-25628.004
x-tm-as-result: No--2.859500-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
Received-SPF: pass client-ip=101.89.135.45;
 envelope-from=Chunming.Li@verisilicon.com; helo=shasxm03.verisilicon.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Liu, Renwei" <Renwei.Liu@verisilicon.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ckqQ/IsfDnbf

Replace "smmuv3_flush_config" with "g_hash_table_foreach_remove" based on d=
evices SID.
"smmu_iommu_mr" function can't get MR according to SID for non PCI/PCIe dev=
ices.

Signed-off-by: Li, Chunming <chunming.li@verisilicon.com>
---
 hw/arm/smmuv3.c              | 35 ++++++++++-------------------------
 include/hw/arm/smmu-common.h |  5 ++++-
 2 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 11d7fe842..9f3f13fb8 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -613,14 +613,6 @@ static SMMUTransCfg *smmuv3_get_config(SMMUDevice *sde=
v, SMMUEventInfo *event)
     return cfg;
 }
=20
-static void smmuv3_flush_config(SMMUDevice *sdev)
-{
-    SMMUv3State *s =3D sdev->smmu;
-    SMMUState *bc =3D &s->smmu_state;
-
-    trace_smmuv3_config_cache_inv(smmu_get_sid(sdev));
-    g_hash_table_remove(bc->configs, sdev);
-}
=20
 static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
                                       IOMMUAccessFlags flag, int iommu_idx=
)
@@ -964,22 +956,18 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         case SMMU_CMD_CFGI_STE:
         {
             uint32_t sid =3D CMD_SID(&cmd);
-            IOMMUMemoryRegion *mr =3D smmu_iommu_mr(bs, sid);
-            SMMUDevice *sdev;
+            SMMUSIDRange sid_range;
=20
             if (CMD_SSEC(&cmd)) {
                 cmd_error =3D SMMU_CERROR_ILL;
                 break;
             }
=20
-            if (!mr) {
-                break;
-            }
-
+            sid_range.start =3D sid;
+            sid_range.end =3D sid;
             trace_smmuv3_cmdq_cfgi_ste(sid);
-            sdev =3D container_of(mr, SMMUDevice, iommu);
-            smmuv3_flush_config(sdev);
-
+            g_hash_table_foreach_remove(bs->configs, smmuv3_invalidate_ste=
,
+                                        &sid_range);
             break;
         }
         case SMMU_CMD_CFGI_STE_RANGE: /* same as SMMU_CMD_CFGI_ALL */
@@ -1006,21 +994,18 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         case SMMU_CMD_CFGI_CD_ALL:
         {
             uint32_t sid =3D CMD_SID(&cmd);
-            IOMMUMemoryRegion *mr =3D smmu_iommu_mr(bs, sid);
-            SMMUDevice *sdev;
+            SMMUSIDRange sid_range;
=20
             if (CMD_SSEC(&cmd)) {
                 cmd_error =3D SMMU_CERROR_ILL;
                 break;
             }
=20
-            if (!mr) {
-                break;
-            }
-
+            sid_range.start =3D sid;
+            sid_range.end =3D sid;
             trace_smmuv3_cmdq_cfgi_cd(sid);
-            sdev =3D container_of(mr, SMMUDevice, iommu);
-            smmuv3_flush_config(sdev);
+            g_hash_table_foreach_remove(bs->configs, smmuv3_invalidate_ste=
,
+                                        &sid_range);
             break;
         }
         case SMMU_CMD_TLBI_NH_ASID:
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 95cd12a4b..d016455d8 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -159,7 +159,10 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMU=
AccessFlags perm,
  */
 SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova);
=20
-/* Return the iommu mr associated to @sid, or NULL if none */
+/**
+ * Return the iommu mr associated to @sid, or NULL if none
+ * Only for PCI device, check smmu_find_peri_sdev for non PCI/PCIe device
+ */
 IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid);
=20
 #define SMMU_IOTLB_MAX_SIZE 256
--=20


