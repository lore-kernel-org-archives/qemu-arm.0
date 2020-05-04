Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp491950lfb;
        Mon, 4 May 2020 07:18:56 -0700 (PDT)
X-Google-Smtp-Source: APiQypKNo7b6a7wwNyYbzSXvBX4i/1uhtNxgp36kRfx+yJrjedeonvJie4frw1IzdHxIg0x1gOUr
X-Received: by 2002:a05:620a:2239:: with SMTP id n25mr16644089qkh.83.1588601936619;
        Mon, 04 May 2020 07:18:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588601936; cv=pass;
        d=google.com; s=arc-20160816;
        b=fInUYm4mBdSH35aCyu9IW9ja+Q/GuxNnBMCyznNMtU5rFyTOWVAVPrZtl6jT/Zt9Rk
         WQ2xgcPJ4XD3tWQCCFht0dSknzUF1yjRRNJJidzEKN0e2I1Q7pPyjEpvSZUOGS8EL/bI
         1ierQ6Yz0HdWaSRFLhojNU7Tm+d9yC/ZsU425TISnVWfU1xLd16zUoTHqQBujPq6hpBJ
         x/sULuWhRHeSv7h9orAFygBd4U+3t3dmps0qpNPrpibgfV+0dU/POAoSj1eLCeMxlGOI
         McbVRSHnmd8oecx52keGgCFXjUKhUz64ymuE/gOBY9akbUd6mD19s8qSBtftqF4da5Er
         8Xag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=DLw9nesv8ObZmzDZcurZrBf/ki2S2Gf/YPbDnpCiXfM=;
        b=lhMfMdFnr9dIjcqn7rfVqT81R0JGACjZxGNnC1uaixGT6neDLuRuf+j/w2iewinQrA
         +wvW5qeUuEjLz+jsDxTGe8fJJzRMzpU4Wf3DcKh80hkobH8tEYAayuRqgq7UuqFxyXsY
         pKMHjxNKZSV/Jv9FLYDj4hrPB+42y2HmkIUUuGR1mOHetqEQgZsYVgSwFkE6xcDpFnQg
         D6wr7uzBpp+ZXdln4ZtQerkhVH0S+SqOm/ZkegrFrBU0AQHFJgPs2I2xfbzX0Xo10+O4
         aWf/L8CFzEwqibbP0GhU2qfaD3rn/wM4FgSpP48mqidYZhGHWiKsaM6w8GRu8r3vqrYS
         jGUA==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=F0efQ6oW;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id y35si6301520qtd.334.2020.05.04.07.18.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 07:18:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=F0efQ6oW;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVbvr-0006Ch-Sk
	for alex.bennee@linaro.org; Mon, 04 May 2020 10:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1jVbrR-0007BL-Oe; Mon, 04 May 2020 10:14:21 -0400
Received: from mail-eopbgr680052.outbound.protection.outlook.com
 ([40.107.68.52]:22918 helo=NAM04-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1jVbrQ-0005dX-IL; Mon, 04 May 2020 10:14:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBY8iwk/3xhpsNwpHLs2a4pv2ubm59YNFzYwLWnNcagzFTj0nbcj8gpq00UTNwghHXMPEBwsTpP41c16dKy5WUkAHVSuuDB5+MlnYkC6GH355h8JFO1J1mFQ6Ir8jpHSC4k87K2DJe6zf/BuZRa9V+9RWNfkSTdKP1AKaVBCFovkpXFRv7gz5za1eq75ya82N7qiZHWUEdOoF7ZMRkodhnAWBYXnbceLomx0qrChqAqjkUY8FjuJ8xdLYDgOVG2ZwMEqfSYZd8aeRoF0DfcD+6l14XnzzHtPeZl6e4MpnaEWs90h0+cyF7SF1gt3JntEgClM4YEe383gp+IFa+qEqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLw9nesv8ObZmzDZcurZrBf/ki2S2Gf/YPbDnpCiXfM=;
 b=J0L2kI5DtdNpaas9HzyfnuPNtiYOUGa4loxyEQoW4HAsyGRbh+ZXvyU+MDCb3XAQm6FmSFbI5+sqJTqZ7+iHdmXrTV+ux4Tl8pZIsj2J+iS/JI61ENDmAV/iv9Z2B4WRnn7S8FYdZkG+w5ydKpuH0n0TL236h0ulJ4cN3KQPUH6rNAmLmjkACGdZ0c3b4bAolfQHQkw2AhFT8+mhF+UhMuNkes5DiqMA3rNyRkeFMd9lD/AOngEaVzgZP4QJVqUptYz4Pobm6HfOdCHutos86PEUzhpCcCbN9M6y6xo61pSwpgRKSGV45Lp/N1UemKthC3oemOvdfji1IoDWfeueCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLw9nesv8ObZmzDZcurZrBf/ki2S2Gf/YPbDnpCiXfM=;
 b=F0efQ6oWinMESTsH96j+FU2hdhUpscne6XzZ7NGdGDRzOMyDV5ej5a+V1Ze16Omhtl6JxdD3pnqAIkN8ArDC+41AgZLAeGDZH3qSa2rKX0z8lDynXSgdgnKNGhOYPXh2pAaxskUKJH/jj5YreV6/xOVXJvEVF2yowVaM9EQWaqg=
Received: from SN6PR01CA0002.prod.exchangelabs.com (2603:10b6:805:b6::15) by
 SN6PR02MB4110.namprd02.prod.outlook.com (2603:10b6:805:31::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20; Mon, 4 May 2020 14:14:17 +0000
Received: from SN1NAM02FT047.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:b6:cafe::4a) by SN6PR01CA0002.outlook.office365.com
 (2603:10b6:805:b6::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19 via Frontend
 Transport; Mon, 4 May 2020 14:14:17 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT047.mail.protection.outlook.com (10.152.72.201) with Microsoft SMTP
 Server id 15.20.2958.27 via Frontend Transport; Mon, 4 May 2020 14:14:16
 +0000
Received: from [149.199.38.66] (port=43045 helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1jVbrG-0000Gr-P3; Mon, 04 May 2020 07:14:10 -0700
Received: from localhost ([127.0.0.1] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1jVbrM-0000wc-Dl; Mon, 04 May 2020 07:14:16 -0700
Received: from [10.140.6.35] (helo=xhdsaipava40.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <saipava@xhdsaipava40.xilinx.com>)
 id 1jVbrL-0000wA-IA; Mon, 04 May 2020 07:14:15 -0700
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id AA53C13C2E73; Mon,  4 May 2020 19:36:34 +0530 (IST)
From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Tong Ho <tong.ho@xilinx.com>, Ramon Fried <rfried.dev@gmail.com>
Subject: [PATCH v2 07/10] net: cadnece_gem: Update irq_read_clear field of
 designcfg_debug1 reg
Date: Mon,  4 May 2020 19:36:05 +0530
Message-Id: <1588601168-27576-8-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588601168-27576-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1588601168-27576-1-git-send-email-sai.pavan.boddu@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(46966005)(8676002)(8936002)(6266002)(4326008)(82310400002)(2906002)(81166007)(70206006)(70586007)(356005)(2616005)(42186006)(110136005)(426003)(47076004)(498600001)(336012)(36756003)(186003)(5660300002)(6666004)(26005)(4744005);
 DIR:OUT; SFP:1101; 
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f35b1d38-9608-4678-15b7-08d7f0356e22
X-MS-TrafficTypeDiagnostic: SN6PR02MB4110:
X-Microsoft-Antispam-PRVS: <SN6PR02MB411053475DC95A1335E6034ACAA60@SN6PR02MB4110.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:185;
X-Forefront-PRVS: 03932714EB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V4WBDEi8lY7LpjdZVNGKajwfM4SCks6DJWE6s8i4Na5hP2cLbhqI+9SkU6/4JIuvkaAlafkmIroaL0YFEeKnN40AwrsZJL2a4ugeVrqVjsYyrlhP7iwUYsjVVjAD+RyUlNAy4gK+ftgpxuhoNHVdwEWpyMjF4DZcuuvisiOgVunWrFPaDFazBEsjGgp4m2QC+dKo8DtCqQ+H++g6uE/zWzvMgc4KsmHUy475Gr2JpLv8THKgjT0VwkPbVxZAUpmNSBPnodpK0dLQuON+BiNHmE4FkEX6061XbT0QbMOpKo3twbcx9NcwTVdPec9dNLQmHWtR+eyxl9syrlGKUHbYnQc3d2hW1I62OuecZUfwSdj5rShKrZfT5q/phxxrrpZXYA4+izGhs8WEqhXH4xD8l3IJDjnb+Bgj4wljEcl6cpxarYkKMvc4hvUvHBCt4S7R/6FWSwrQnZAeweO9biOUrnJNXIc5lbVWBpGZKSpBzlkWFoxgo0aWtOx+RubCa4EVxU35nbViPQZDklNL1yhJkg==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2020 14:14:16.7745 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f35b1d38-9608-4678-15b7-08d7f0356e22
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4110
Received-SPF: pass client-ip=40.107.68.52; envelope-from=saipava@xilinx.com;
 helo=NAM04-BN3-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 10:14:19
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: exCHblhRo7CR

Advertise support of clear-on-read for ISR registers.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
---
 hw/net/cadence_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 848be3f..9eb72a2 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1344,7 +1344,7 @@ static void gem_reset(DeviceState *d)
     s->regs[GEM_TXPARTIALSF] = 0x000003ff;
     s->regs[GEM_RXPARTIALSF] = 0x000003ff;
     s->regs[GEM_MODID] = s->revision;
-    s->regs[GEM_DESCONF] = 0x02500111;
+    s->regs[GEM_DESCONF] = 0x02D00111;
     s->regs[GEM_DESCONF2] = 0x2ab12800;
     s->regs[GEM_DESCONF5] = 0x002f2045;
     s->regs[GEM_DESCONF6] = GEM_DESCONF6_64B_MASK;
-- 
2.7.4

