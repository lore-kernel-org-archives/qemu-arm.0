Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2071841lfg;
        Mon, 23 Aug 2021 10:39:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzM0fE1i0RP1Rwn/Sts9F/iNPfJqfMOwGdQZBqFQNUKPrmKWv/cxgPsi7PMSO3zbjvkbMLL
X-Received: by 2002:a92:c846:: with SMTP id b6mr14541023ilq.84.1629740345110;
        Mon, 23 Aug 2021 10:39:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629740345; cv=pass;
        d=google.com; s=arc-20160816;
        b=qCup+pcuBj0p1684GMVrfoAJi8865yk5n+M8Fvwr49FLPk2S4U+/Y8N3kpsouhtjke
         oJVvtaHO49WGMuc4VM7RgAl/rVU1+BZ3W4RU4zo4FNydLlxPoQQ+cXQNuu7oid1dXN7L
         jKItTqzNrTy+z4GqJMNZksv0YJC1PlVkHkJQIuXr4E4wIAUBS/9CWlMXySKPxuTLygwJ
         3re+aDZrncTZuUDZyHnUQII633UT7vJDsLx+Jjg/kjNZkEZELB8gn+E4jinqPwSDtLT4
         wMqsx0v0AgfuJrKbHHzjFqpBTW8SEoCo/eC+/M3gAOuhFyLBRiZZSxaOc2udjmW3opas
         0YQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=IxZm/70W0ZxyXNAnNhiHgcnZbZJug/5O730cof//fQc=;
        b=Qg4Y/jG+iCUvn1Fje/6Xmiajl6pl6gVTJ2xbjBEWfrfIbNIvlhjI+sgGiA2MRmPATF
         N6DClOgNZLboqclv5/wDmLTzzRn8DM6K8Z7n5PO+v4tLjqs+DCwe1EBDQDSAqL2tA1FI
         VvUx1igVEbPVzUC0s5I/6dIQhECy8DT9IBJ6xpiD9h1vZc09ZqPCWrwUzaMpJzJ3HsRQ
         lfVhJqt0rr4vCM9SfrgZkdnMW/zUoh0LwIxQaSrKsr686W1XEROPiidD0c+3kTjswBAl
         BWOzr97gwLHnj7cyWQwdmDLHJHcHqNov7oCehzEq7XfVV/Wq7q2epVVOD21MmC2qBnco
         GQBA==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=jbwl51jp;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com dmarc=pass fromdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=xilinx.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5si11075912ilg.86.2021.08.23.10.39.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 10:39:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=jbwl51jp;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com dmarc=pass fromdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=xilinx.com
Received: from localhost ([::1]:35368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIDua-0006T9-EF
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 13:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mIDu4-0006SA-Pu; Mon, 23 Aug 2021 13:38:32 -0400
Received: from mail-dm6nam12on2061.outbound.protection.outlook.com
 ([40.107.243.61]:60762 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mIDu1-0001yC-6M; Mon, 23 Aug 2021 13:38:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lNPtx46kvh8ZgGgM0bqV6fVJnXpE3mfUDQOIKSeWRPVyaXc6ksFBvCsZgAbUxs3S+XdFn2VGINwSwXm0byylTsHsaNcjc/ada+sI3V2ccEMizs6aHTbSjVsXhjQZlSXxWL7MO5V7XrLyOppmSwvhtXOK3DqVPVIitQH4/4A6ye6COqzRPAXs1ZnxdSI5zE59LSX+syGb+2rpok9jKhnKn0f/2tJ5D6ZsomwnEzBYiCoz2Owg9FaO54XMmvjEBCic0mIdiz7Gt/pwKOlmYSdsWa0/Y4qFzs/4uI4kPPsfM5vJ73rn8Q81+RSwZVQZJZIN6DWEscn9tuk5L/TIMh5SgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IxZm/70W0ZxyXNAnNhiHgcnZbZJug/5O730cof//fQc=;
 b=OOjKq3ixqGsNHrvEvwUSOW/MITRFhZycuwZxKCAahczYxi+slXFMbOrxdaUhgqMIIbpr+IuDZASEWKGfg+zSB5XainvQO4FdPr4bn3BmkSCNGZSx078UAETlQrQiKuDUIglfZK19gwwvZlTSyF16LnfeoMpd7FMFl8k6Oi4wq3DlNegVHlHN4mGf3QnJxu5CT06+1i7KGPyiTrhadD4jFYtsZFiEpP/GdyPtxQVWD7dHk3gAUdNcAkXOalJbMTss2V8MiqglDnOmG2LgoMFpr1DddzAjuR8O7EHYEfu4otRmGd5Ou+3/Yms036I27tcbCBY/xZRbUPwCpC3VRw+faQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IxZm/70W0ZxyXNAnNhiHgcnZbZJug/5O730cof//fQc=;
 b=jbwl51jppVN/rS2cWGZV7sXJEdbUD5HW84i6ii7mfRk6c1Qb9/TY2Rdz1ovyzjuf/3OHTJ49lfNDriMqwm08nS97dXRdZWUCynG0Lhklg+5fjICdDdGqiD7PXtZX7Tb/gTQZEGpqVuAi5zKztyiHL5gv8LeeS0f7jLvLcpy2z0g=
Received: from SN6PR08CA0002.namprd08.prod.outlook.com (2603:10b6:805:66::15)
 by DM6PR02MB6668.namprd02.prod.outlook.com (2603:10b6:5:21f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 17:38:21 +0000
Received: from SN1NAM02FT0019.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:66:cafe::12) by SN6PR08CA0002.outlook.office365.com
 (2603:10b6:805:66::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Mon, 23 Aug 2021 17:38:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0019.mail.protection.outlook.com (10.97.4.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 17:38:21 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 23 Aug 2021 10:38:19 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 23 Aug 2021 10:38:19 -0700
Received: from [172.19.2.40] (port=46968 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1mIDtq-0006Cc-VI; Mon, 23 Aug 2021 10:38:18 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [Patch v2 1/2] hw/arm/xlnx-versal: Add unimplemented APU mmio
Date: Mon, 23 Aug 2021 10:38:17 -0700
Message-ID: <20210823173818.201259-2-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823173818.201259-1-tong.ho@xilinx.com>
References: <20210823173818.201259-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5f95393-53a4-4b17-065a-08d9665ccd08
X-MS-TrafficTypeDiagnostic: DM6PR02MB6668:
X-Microsoft-Antispam-PRVS: <DM6PR02MB6668C842F4062E46D12C809CCDC49@DM6PR02MB6668.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:494;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kykgiwQSZ2Y7qT586EtECzPypJVztv3nAkgob/vsUHr7N3CyPJvE4TpCFwnv3d/LXkOEABacjvstcARBbDwx2lwEgVyuv3/t4odUejHiyYn2FsnTdAmzCA38A36BOwhgqH47nnyNt0Maw19mkdc4/LM5d1p2yDR44RNAh3Mq7DusIF5gww+dugbVHPF4SgN9xWnr1NfipVmhHn2H+iLGmD4d+JHhnDxdcZa0DOm3vZaW51Ez3fFxIPQY9fauuqC3od2mOT28SJAtNnvBk/bqsR556E1xZZfiCumluuP+o0ZCLtHEIPwqIJ6AIY4mSJUUxYCMQehtIJWsId0MZm9t5g5JhTGjKY6pZssRQOqwq88eOgKt4pqA/mUaRDkkvPhYCOIHAEvJfuhdk59EzDmHNuDUMtaKfMoSQQM72FvLm1axIPnZwCFDsmPzZ4ugJgZVt1xZ+3Ye8dxVCoaaEO1NjPI0E/VcC46h41pL8rYzPtR1ECOuD6ATAqIm1McqgxuV6DZkm7oNYgRCdt+TsMJg/D93ptvTN1bdFMTAiNPjuUrp4ItP0tQlT4O+hg/Ejfu851ifshWQX4A79gMQCgkr6SOMhTndtRxAe0qhRVKopdWXT7qcPARVzArVB8P5hksCEdtPp1vYG1cYBmUy/VTvblKjqS6+KSAuBOpBXZNsCR1I0WeD1Yro+YlIaKPlQ97s/+MzR1iQhlNZiTShyubaDpN6hzjylga4sUIPrXnMZVMnkkjbhFVRJ4Vi/oDlxe6p3CQaXMTkFnvLZ8y5nK9WB8obskxQtDyUl5ikLTNhxHB7PiPEd0I5ocgrmAUG2IsIUSTHJe7tm3WM408s6nO4eurC58bAW3CvkTAh3PexP4Q=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(46966006)(36840700001)(26005)(36860700001)(1076003)(54906003)(426003)(336012)(70586007)(4326008)(6916009)(8676002)(7636003)(83380400001)(7696005)(9786002)(8936002)(36906005)(70206006)(966005)(356005)(478600001)(2906002)(44832011)(186003)(82310400003)(2616005)(5660300002)(316002)(82740400003)(47076005)(36756003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 17:38:21.1705 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f95393-53a4-4b17-065a-08d9665ccd08
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0019.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6668
Received-SPF: pass client-ip=40.107.243.61; envelope-from=tongh@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, alistair@alistair23.me, qemu-devel@nongnu.org,
 philippe.mathieu.daude@gmail.com, tong.ho@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zzBeJRTdRpd/

Add unimplemented APU mmio region to xlnx-versal for booting
bare-metal guests built with standalone bsp, which access the
region from one of the following places:
  https://github.com/Xilinx/embeddedsw/blob/release-2020.2/lib/bsp/standalone/src/arm/ARMv8/64bit/armclang/boot.S#L139
  https://github.com/Xilinx/embeddedsw/blob/release-2020.2/lib/bsp/standalone/src/arm/ARMv8/64bit/gcc/boot.S#L183

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Tong Ho <tong.ho@xilinx.com>
---
 hw/arm/xlnx-versal.c         | 2 ++
 include/hw/arm/xlnx-versal.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index fb776834f7..cb6ec0a4a0 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -376,6 +376,8 @@ static void versal_unimp(Versal *s)
                         MM_CRL, MM_CRL_SIZE);
     versal_unimp_area(s, "crf", &s->mr_ps,
                         MM_FPD_CRF, MM_FPD_CRF_SIZE);
+    versal_unimp_area(s, "apu", &s->mr_ps,
+                        MM_FPD_FPD_APU, MM_FPD_FPD_APU_SIZE);
     versal_unimp_area(s, "crp", &s->mr_ps,
                         MM_PMC_CRP, MM_PMC_CRP_SIZE);
     versal_unimp_area(s, "iou-scntr", &s->mr_ps,
diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 22a8fa5d11..9b79051747 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -167,6 +167,8 @@ struct Versal {
 #define MM_IOU_SCNTRS_SIZE          0x10000
 #define MM_FPD_CRF                  0xfd1a0000U
 #define MM_FPD_CRF_SIZE             0x140000
+#define MM_FPD_FPD_APU              0xfd5c0000
+#define MM_FPD_FPD_APU_SIZE         0x100
 
 #define MM_PMC_SD0                  0xf1040000U
 #define MM_PMC_SD0_SIZE             0x10000
-- 
2.25.1

