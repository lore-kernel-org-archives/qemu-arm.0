Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp612832ejb;
        Mon, 19 Feb 2024 02:57:41 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXWgpBAlkH5nxjAri0wax5bWldM09StWXsSH5cKfWEJu/5FxfQPqgMvX/nVLwiZZlgL9noF/2RLl/TcNbOTQ0ZfYB6JzH+/
X-Google-Smtp-Source: AGHT+IEHFFEatJ3CZ2IZo9KbCnBr7/Tm0PVAxyxUK+jk/2O4bMva0XS1j9o8i6iv+BTiePgp09vI
X-Received: by 2002:ac8:5a0e:0:b0:42c:80f3:6a44 with SMTP id n14-20020ac85a0e000000b0042c80f36a44mr14659414qta.37.1708340261255;
        Mon, 19 Feb 2024 02:57:41 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1708340261; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZgFSpsDZ0xurY71/Q7UcIPIln1Nrqrzi1XphDjbce6WddYRVsmn9LlPufF4Yj/qG2v
         FfipR+sBKVMXzx6U3xRDSUS2xIvEs+l6d9zHC6UyiPKz4fnujtGu9H4r7PPzZ84jMoPq
         mmFeX9CvnV6n6xnHkD6ctZTToKsfvgW6XFUQQ51lVOza2ueiuCkKg1xnrUREZtmmSQ1g
         MRPP598EX5CwMTuSwQp6RBcEjGW736lPIdq6lHOTYLU/0vP1eZ9T0QeCEoy4UAN6Xokt
         1hWrUqGaehdnFolUya4g7ekrpV7ArXBhuCuEef0aNpkbbdzchECmOWFL4beoJ/ZU14nf
         PR3w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ir9LL6Y8dp+8cQbN1onlzdFfGuZy2WRa8uUHH2ZH/A4=;
        fh=I0lkCgkmx1xzGh4IAw0+/exZU1w8D7UAXzuzM95vWeU=;
        b=Ktp5z9gh/TNO6WomjEJoWUbft6L/c5f922jC30/nvlOn52mLv+1uJCDC/V7bGjflkJ
         wJmnysk0f+hRQRKs5GfK97FJyr50HPj5//FCspzIhHUvJZCKkCwWDfak7mDl8kQaHMB5
         BFQBJIs260LH0/sRUXjyGO+NmqzZJ4pK1HgCk0mhJvZHtVtzzy/pd04zJCu04RnL0onF
         mO6ZiNjLLx5WMVui67xwpu6jGMN4pAmBc3UYIshfyO44fcirH06SGr+kWcXDeWwhJd7T
         0ECnCibM2Ldxg5wdCxqqJIsOgetyOdTlCu5HCdfJr71kGPBuwS3NlOXfF/jLju8jhezI
         15jw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@amd.com header.s=selector1 header.b=ufgkB4xC;
       arc=pass (i=1);
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amd.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o22-20020ac85556000000b0042ded3fdb64si5649038qtr.41.2024.02.19.02.57.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Feb 2024 02:57:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amd.com header.s=selector1 header.b=ufgkB4xC;
       arc=pass (i=1);
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amd.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rc1Kj-00021M-Dh; Mon, 19 Feb 2024 05:57:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sai.pavan.boddu@amd.com>)
 id 1rc1Kh-00020X-Cw; Mon, 19 Feb 2024 05:57:11 -0500
Received: from mail-dm6nam12on20601.outbound.protection.outlook.com
 ([2a01:111:f403:2417::601]
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sai.pavan.boddu@amd.com>)
 id 1rc1KX-0002o8-R9; Mon, 19 Feb 2024 05:57:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3NYeeCav+89qcQVau3jcoG/uEiSHyQjfbIwYWFr6zCdBU++pqO2gABb4qbwe2QFlL3JaLjrKMWBPZ/A9pV19wbpEOA3kIYgxo3Px/tLpBD9xCBMIz4rWBJ+N8uNBF+65t6YBiWL8vsIk2lmfHmhXwfQWpjf+8DHEd+gotGrn6bzMMngl6XQ8HhRqFtiWReamSqUP6km+gV2FzhWJzu6GVpsTG8nkGwcjYmNQA1i92HkMHponXbMaSNHZsvAoFFMa6KXVjE8Xm72Ki0peoaYfBQ9UvBAF6ZUKfIgP7RsWvNa17rAf8jJ16z5PD65XrC2d1/X4YM6WvxUX0RpeXRmFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ir9LL6Y8dp+8cQbN1onlzdFfGuZy2WRa8uUHH2ZH/A4=;
 b=c5dWWymctO+4TNXwQc/075RCMc+AJQCaP695+/PKkDDgKIpwynQJGmP0UoGpCpJDLVMUPANdsXw/TcQ5poNs++oYJl9lYW7eeunkdxZZc668ktlEwDV9GT535iPYNHRzSBypXq+m7ip8EfpyygP+0dfCsoxjZDZAw6Btl2nFoskNE4AKK+Zus/EmrKJJIq3L0zT5wqW3JtZcQ9Ltdni6t2SdiPdTDr/5U3aN8r4kAuBfWajgXjCwcczfloJpAnW8i9czKgPR3oN3EQb9YOKOX9BdTrXhpKLPEpPfhIU8gMJnrleGjw4jSwEpyvrPB2xuev4l4Oyx1Nls5SWs1wFNDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=nongnu.org
 smtp.mailfrom=amd.com; 
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ir9LL6Y8dp+8cQbN1onlzdFfGuZy2WRa8uUHH2ZH/A4=;
 b=ufgkB4xCbvcmz3w0/f6zDU2u7bPhDzGUnoA1n0WjbS9KIclu8U40jCbji41/Utcth3EJlR2LiJwV++8VyTFnxXXeVqvcusRr3FHYSdfl0dNn9ur6j1oeRt4f3hdIEakk2GtwqLqB6kJx62B5wkxbvpee+iAfb0YuRv0izGplGt4=
Received: from SJ0PR03CA0177.namprd03.prod.outlook.com (2603:10b6:a03:338::32)
 by SN7PR12MB7980.namprd12.prod.outlook.com (2603:10b6:806:341::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.17; Mon, 19 Feb
 2024 10:56:54 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::f5) by SJ0PR03CA0177.outlook.office365.com
 (2603:10b6:a03:338::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38 via Frontend
 Transport; Mon, 19 Feb 2024 10:56:54 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 19 Feb 2024 10:56:53 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 19 Feb
 2024 04:56:52 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 19 Feb
 2024 02:56:52 -0800
Received: from xhdvaralaxm41-docker.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Mon, 19 Feb 2024 04:56:50 -0600
From: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <qemu-block@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Alistair Francis
 <alistair@alistair23.me>, "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Francisco Iglesias
 <frasse.iglesias@gmail.com>, <sai.pavan.boddu@amd.com>
Subject: [PATCH v2] xlnx-versal-ospi: disable reentrancy detection for
 iomem_dac
Date: Mon, 19 Feb 2024 10:56:37 +0000
Message-ID: <20240219105637.65052-1-sai.pavan.boddu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|SN7PR12MB7980:EE_
X-MS-Office365-Filtering-Correlation-Id: b3e890a0-1288-42d2-28fe-08dc31397b8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ea/OIU7PlpGTvIggnKtK3FlUd0KX/ZfE1nCaK/I2cTLuwt0AdYhuNYgrhbmOQmCY6RKMrdhzwGlOOOgKJ/Ygl07Kqh77N/zAVLZxNEPECbJLe3yGrcme7P/+HefXW4NBCY3sQXQD3+mHp6mcE65JBXErdYjeQ0qENwB4wq7MCCllsygZY+LgLHwAXNJjhMgsi51aDz2SoFQkmLWOjI8pSPEA7qbG5hJHsNC8AsIyBss+y00vNljp52YmDcwJUTwfpOWGdoLaCwSUosjjUYOXLmpgKrr5Ym3Sdj8bR3bft1KQ73E6ubSDc+T2/gnbL8SR2ntikaKJFSOl/cqFXammNV3iHbMxoIrQBh8eQB0/96T7ecL7bdzmRVCATtvXTSaahefN3TPbCYt0r9FParLs/9MWUxE1vBYXxFFT2JgI9gvc6zxsnkH6r3KRZ+EzOs29di0Ii1R9+734a1XXL/5GrtvTywUNqa+Xa8ME5mF32KboU9b8oY62Ex3Wvp9Jw2aeRZlEe/l94SvP9wJL1Ru7LZ+yji3GSpvpOaJdnBlyFK81yMVg5ERz035kzdcgI2WIvB1ZhWvVO6/jt/QYPniNNGOPYuv0kfd0Zf9EqqenXgJ86nMlp8K3ckgHcAJ8JbkQbpqVEO/94Bx80+gcq7UIu8ltaOshvnS259aGG7dE7tI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(40470700004)(46966006); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 10:56:53.4132 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e890a0-1288-42d2-28fe-08dc31397b8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7980
Received-SPF: softfail client-ip=2a01:111:f403:2417::601;
 envelope-from=sai.pavan.boddu@amd.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.5, BAYES_00=-1.9,
 DKIMWL_WL_HIGH=-0.077, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: SAGhkP24jRzx

The OSPI DMA reads flash data through the OSPI linear address space (the
iomem_dac region), because of this the reentrancy guard introduced in
commit a2e1753b ("memory: prevent dma-reentracy issues") is disabled for
the memory region.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
---
Changes for V2:
	Added code comments.

 hw/ssi/xlnx-versal-ospi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/ssi/xlnx-versal-ospi.c b/hw/ssi/xlnx-versal-ospi.c
index c7b95b1f37..c479138ec1 100644
--- a/hw/ssi/xlnx-versal-ospi.c
+++ b/hw/ssi/xlnx-versal-ospi.c
@@ -1772,6 +1772,12 @@ static void xlnx_versal_ospi_init(Object *obj)
     memory_region_init_io(&s->iomem_dac, obj, &ospi_dac_ops, s,
                           TYPE_XILINX_VERSAL_OSPI "-dac", 0x20000000);
     sysbus_init_mmio(sbd, &s->iomem_dac);
+    /*
+     * The OSPI DMA reads flash data through the OSPI linear address space (the
+     * iomem_dac region), because of this the reentrancy guard needs to be
+     * disabled.
+     */
+    s->iomem_dac.disable_reentrancy_guard = true;
 
     sysbus_init_irq(sbd, &s->irq);
 
-- 
2.25.1

