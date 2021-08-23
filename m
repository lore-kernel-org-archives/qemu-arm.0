Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1687036lfg;
        Mon, 23 Aug 2021 02:19:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3LTz1WaH9WtDjt2//WC5GsvsvpRBkiANPSCTQ8NhacDmOhwqDY9n7Rq5AzDXq2md6UGeE
X-Received: by 2002:a25:818a:: with SMTP id p10mr41094447ybk.363.1629710379443;
        Mon, 23 Aug 2021 02:19:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629710379; cv=none;
        d=google.com; s=arc-20160816;
        b=zjbAGMxCaMbpBwtonT47Qqa/dErRRiHsgqGvZPkutkP0Rdz4TEmq6CFKAAvVH0J/i5
         L0HFKpDY0QKH8TDSr21OEPPngUSVN6PqVH3tVpJALvA/fnIY3wx2/Qd35fvefW6vJ7lz
         Ytf2f9muGK5zw+iAJTvbUbrkg9EvC8zuKVfS0EQfPnSL+QPb+g7bHe7EGu5rfOSKQ7V3
         jMhDpGN0Na+IIlt30jSGJ8KvUstf5CjwXkAaiasUJO0flCUv8B7CC3gY6SFxUzVMsgro
         nqv2tI6cM1BWktzNaa/KKVfr4SmitWoXiox2XJWPEgzVS+Dx2M5FibrgEZadB1ZZrRac
         9oCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:accept-language
         :message-id:date:thread-index:thread-topic:subject:to:from
         :dkim-signature:content-transfer-encoding:content-language;
        bh=7G81uJF634N9eELRAIxjHsHpX1cjiUY80EzZpkN33mk=;
        b=iDxNhyfu0RLlKAag9Ci0YJgQPYG4ha9E0mZuytS2VhTT8uane/eRqrJaSUykJ6b+p1
         UZONXBSOFTCl26sO5tGuwRmSaOYy6BVJYYGgZ9JwRq0ZQDYhskU7cfrjtQXp+wgR5VvZ
         eY6YcM5jrtfKYAhg3PLS2Lk2Z6kPRXRKEsnEH+ycAnVYg/9lumd21Z+lOOXAfAh8K1Vu
         Xv8JnLfnu8AaUMw7kkrWiguSKWhBXf7J8SU424j7fjJ8VN55WOCehWfkj7n546WKU9Ie
         5S9C4wcGRRngGMEHZ0taNTYPj7sfGjlupbJ6cwVM1RWExF/8LDRJoBoQO1gj2XXqZe7G
         Rs2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@Verisilicon.com header.s=default header.b=fLfNUDai;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=verisilicon.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1si12472120ybp.253.2021.08.23.02.19.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 02:19:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@Verisilicon.com header.s=default header.b=fLfNUDai;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=verisilicon.com
Received: from localhost ([::1]:54368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mI67G-0000gw-Rl
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 05:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mI65f-000718-0T; Mon, 23 Aug 2021 05:17:59 -0400
Received: from [101.89.135.45] (port=44451 helo=shasxm03.verisilicon.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <Chunming.Li@verisilicon.com>)
 id 1mI65d-0004AC-B5; Mon, 23 Aug 2021 05:17:58 -0400
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; d=Verisilicon.com; s=default;
 c=simple/simple; t=1629710120; h=from:subject:to:date:message-id;
 bh=C8wfuEOayUrlBwhdXRUOHviYrogGVzcMvdCwzZz7XDQ=;
 b=fLfNUDaiLRcz2u6g1nwytzYWGVi7krrFU++LG6eivSxega+u8nAUWKBOxLWbYPP1iMH3yp8CqQw
 9LKt64GtLv69u0QXupM9Nv9u4oFPxSgLYBg9n4jHML4maqBGlayFpCyyTT0eQBIID1EAKvSYekzZG
 3h+h4Sovdpserau30lA=
Received: from SHASXM03.verisilicon.com ([fe80::938:4dda:a2f9:38aa]) by
 SHASXM06.verisilicon.com ([fe80::59a8:ce34:dc14:ddda%16]) with mapi id
 14.03.0408.000; Mon, 23 Aug 2021 17:15:19 +0800
From: "Li, Chunming" <Chunming.Li@verisilicon.com>
To: "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: [PATCH v3 2/4] hw/arm/smmuv3: Update implementation of CFGI
 commands based on device SID
Thread-Topic: [PATCH v3 2/4] hw/arm/smmuv3: Update implementation of CFGI
 commands based on device SID
Thread-Index: AQHXl/03bqvwHdcsykmwzokCpspQpquAzdPQ
Date: Mon, 23 Aug 2021 09:15:18 +0000
Message-ID: <49C79B700B5D8F45B8EF0861B4EF3B3B01142F973C@SHASXM03.verisilicon.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [182.148.13.223]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.100.1062-25628.004
x-tm-as-result: No--3.041300-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
X-Host-Lookup-Failed: Reverse DNS lookup failed for 101.89.135.45 (deferred)
Received-SPF: pass client-ip=101.89.135.45;
 envelope-from=Chunming.Li@verisilicon.com; helo=shasxm03.verisilicon.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Liu, Renwei" <Renwei.Liu@verisilicon.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2IA6NhScQQIl

"smmu_iommu_mr" function can't get MR according to SID for non PCI/PCIe dev=
ices.
So we replace "smmuv3_flush_config" with "g_hash_table_foreach_remove" base=
d on devices SID.

Signed-off-by: Chunming Li <chunming.li@verisilicon.com>
Signed-off-by: Renwei Liu <renwei.liu@verisilicon.com>
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

