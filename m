Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp4359246lfh;
        Wed, 1 Jun 2022 10:26:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5VBqSO9q4kzazSuPKYGt/sWgVvvsINHELFjH0JFuapf2FlxNDtLMPMsR+mkoZB2f90/at
X-Received: by 2002:a05:620a:a95:b0:6a6:5398:ce39 with SMTP id v21-20020a05620a0a9500b006a65398ce39mr713870qkg.358.1654104391965;
        Wed, 01 Jun 2022 10:26:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1654104391; cv=pass;
        d=google.com; s=arc-20160816;
        b=J/Y3m8P3tlW4fdWXWMey7lHdT/pO+3HBPwdsfWewcoKqxMm4PlspM51oetDBtVzcAG
         GTnAd4xiI6fGQQAshOATJJTll+V1ExFivUH8uWweYFagPsFk4euMgwF3RvQ3+c4ovpI7
         VzOY6mUBaFMrDpMNLqsaJ6+E1x88rssF1AbVltO17SrgObBjgiOlJ3TYbXxFhR9rxmNc
         lXOYDd2E/Fb7vH5PfZDgxqNM7+bWFDfi+MIrlfBjaK/UhrpBO6tdp9h3kaTyDdzySX8t
         npbxg5DVhf2CYyo7ajZCYU20Jn8/nVAHw5C98h0K0dasIb42h47oe3OPj/ACrG/xE6fz
         vdug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6Mzkh11+gPVQv0g+lHelrThmi5so8qNEowi7WN9pvFo=;
        b=U9v6VFvrwa5PB9p45gsw3VERWs1oAiFd8cFBC0md7MAEHXN6idI1a/TH7ds6+zdarZ
         EFsb5W81XdTeP/UA/hoJwaHejLkhlD324IHusJhZbakihR86do4DbfErMwkPkdn90wRB
         X/obQzRmQF/7lPdJn7XwukYXFOP3UI4gZgwMw2ja+lrTA0ntMIU+edfRxeeYMnkqDnpY
         f9IlzLQ0RfT3HbqGdqq7qFMeV9c+bzNZOxEHbJdo4zcQTZwEgv/ej/dgst9w3Hb+ZaAs
         g1LbwFG2WG1OBans0sYAJOofFPLzGNoA0uansF5VeCa1ddshawc7KfQIRgakyN9QLy7i
         CVXw==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=ddM0S+ZF;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com dmarc=pass fromdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=xilinx.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z9-20020ac87f89000000b00304b5e8b691si1329381qtj.105.2022.06.01.10.26.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Jun 2022 10:26:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=ddM0S+ZF;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com dmarc=pass fromdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=xilinx.com
Received: from localhost ([::1]:41982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwS75-0003zY-CJ
	for alex.bennee@linaro.org; Wed, 01 Jun 2022 13:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1nwS4u-0000oq-E7; Wed, 01 Jun 2022 13:24:16 -0400
Received: from mail-dm3nam02on2061d.outbound.protection.outlook.com
 ([2a01:111:f400:7e83::61d]:42400
 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1nwS4r-00073X-OZ; Wed, 01 Jun 2022 13:24:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1XufObPPwRqNzrRBr0MQKXvU29ibG5pDTRps34jcLhKO7OW76nx0deiZ46Je2OU6uirXdir0dnpLvZYP+iqyY7S/fbAAxl9sdOR1LEkgdGFiXUGaa5BE7mCzGj4YS/NDUkiysphn3wKnDqAgRzeEFVcKb0ps1LGyBZSLEaMlB0K4tNdOxE7Bn16g3y0qFUzslGwcBIfqH3gWWp3xuaCU2Xb9gqENZ3Eaer5oiosbHz85+zT+eHGMIBeGYOzm0L0G8UDCVDR1Dp3sw4khwcq+03JeNG2IjP3hhxQ7kcYTJDAcj8F42XWTwgYhEitCEFseHwxnfuWlNevpjLpkanp1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Mzkh11+gPVQv0g+lHelrThmi5so8qNEowi7WN9pvFo=;
 b=D2+7MRv/tObVgTH4C1xXxGBvwD+P8ZkjvkIVfZo7rFAfgtBFr6AjMjVBMHWMi+yiVPOu56/P6mQDXZ8l21pZq+OLnluXogIdnuDNQPfGFNnXciinap8VbBLeltGc8wfWqIXmFfZQRKm0qEcQlQjb1Ce9LbxuK/sJUz3k3inWcAqy18081aDb7FsPajgGWwJdWG+3L335kmZOThqqhl9jZKstXP67E7zwa1EvnFsZXrqG5z2TUyCQd/us10wmZaqUEDI/qTzb2nt5QT7RuW3Pw+ORUC8T8Xw6pJwewj2+JOAeTM5L1hllk2PqNt9w8Xw6YYOvrxxH9PphmuToBEua3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Mzkh11+gPVQv0g+lHelrThmi5so8qNEowi7WN9pvFo=;
 b=ddM0S+ZFG6dHkLmSIHWtgrtZxHqBslJ5kZb3MloNhxFDtcHQfaGP9pv1rfrgfPIY0/Wossk8PtO4NKB+SG4tdcZfIJtKe127dRkVJDznhcvWf2dQ1HRS4AQDUQNujXZqAkB/ciTQI1GmMGJD28FTVEMzas/pCfalDmiFsufG0RM=
Received: from DM5PR16CA0026.namprd16.prod.outlook.com (2603:10b6:4:15::12) by
 DM8PR02MB7942.namprd02.prod.outlook.com (2603:10b6:8:13::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13; Wed, 1 Jun 2022 17:24:10 +0000
Received: from DM3NAM02FT048.eop-nam02.prod.protection.outlook.com
 (2603:10b6:4:15:cafe::4b) by DM5PR16CA0026.outlook.office365.com
 (2603:10b6:4:15::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12 via Frontend
 Transport; Wed, 1 Jun 2022 17:24:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 DM3NAM02FT048.mail.protection.outlook.com (10.13.4.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Wed, 1 Jun 2022 17:24:10 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Jun 2022 18:24:09 +0100
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Jun 2022 18:24:09 +0100
Received: from [172.21.132.221] (port=53720 helo=xdcsswbld02.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <frederic.konrad@xilinx.com>)
 id 1nwS4l-0004Ck-TA; Wed, 01 Jun 2022 18:24:08 +0100
From: <frederic.konrad@xilinx.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <edgar.iglesias@gmail.com>, <alistair@alistair23.me>, <saipava@xilinx.com>,
 <edgari@xilinx.com>, <fkonrad@amd.com>, Sai Pavan Boddu
 <sai.pavan.boddu@xilinx.com>, "Edgar E . Iglesias"
 <edgar.iglesias@xilinx.com>
Subject: [PATCH v3 3/4] xlnx_dp: Fix the interrupt disable logic
Date: Wed, 1 Jun 2022 18:23:52 +0100
Message-ID: <20220601172353.3220232-4-fkonrad@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220601172353.3220232-1-fkonrad@xilinx.com>
References: <20220601172353.3220232-1-fkonrad@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 706c1e04-2a05-422f-8344-08da43f38a84
X-MS-TrafficTypeDiagnostic: DM8PR02MB7942:EE_
X-Microsoft-Antispam-PRVS: <DM8PR02MB7942A5AC38AA7861E603B996CCDF9@DM8PR02MB7942.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A1oZqOZxVkOmhFE/HvwHhrS8RGgMhoiwgsrmID3JFzquxrmwrmEHXsUiPErbwOKjjeIbgrvhxD9v8regNjLmZn8BKMWLI10vQ+/6Z4BLupu5N1zQfo6fd++d5bZpjEz9QDQiu6sxElpX32L0aPW4yl9YdoEkJzomsMWfZBjRQjmUiU1+0JVoM4re+HEz7KAjpxfYs6RUxuqjlxXEROPwLS2G8ETQWrMVoiJuYhn7CKz2KIvBKmc5cRYEayRREP0xw2WJddNdfrcLH4U7932xJwpZRfJk8I3dmyTivyOzIXePXwBr/bIny/0nB1fp6zQeAq1o/LnHncQ1qbtDpPWL2Fab9KZEV37GYy5E/6hCEjWKKTcq2/PsZCGdhC5C2yPyqOJ7nwcN1zqCHQ7CEhkBgWukBdQ5QHw4Ac29MjAycajBmiCLqUrK6mMFZ03KEx6AzhGtia6/7GsJqlfE72S9XK9BnDT6/C9T+ihpnIECDySNxtIOIv6pt+6rPtNieIxs5fVsrjN8gSY1FS5FK2eXX+UGEwyCaeMNzBYLW1JbAAjxtVrrFq+htk5hrJmx+P6BcUPVz93yZCKaziWXc6xPIML5Ca6yI159KQNMbbYtc3DHlYK5WlxkzDsNglfSS0qvdDORCme7vw52y+l/lSgbdtjHsUv55CouJhOiX+9ss5h+lt5rn4zgYq5pxZob+nArEIhKPT/2s0pn4LLJN0MKkg==
X-Forefront-Antispam-Report: CIP:149.199.80.198; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:xir-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-80-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(7696005)(508600001)(82310400005)(1076003)(426003)(336012)(6666004)(2616005)(83380400001)(47076005)(186003)(26005)(36860700001)(107886003)(8676002)(9786002)(36756003)(8936002)(4744005)(5660300002)(54906003)(316002)(40460700003)(4326008)(6916009)(70206006)(70586007)(356005)(7636003)(2876002)(2906002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 17:24:10.4213 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 706c1e04-2a05-422f-8344-08da43f38a84
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.80.198];
 Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT048.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB7942
Received-SPF: pass client-ip=2a01:111:f400:7e83::61d;
 envelope-from=fkonrad@xilinx.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eWY9ryp/u42D

From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

Fix interrupt disable logic. Mask value 1 indicates that interrupts are
disabled.

Signed-off-by: Sai Pavan Boddu <saipava@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Frederic Konrad <fkonrad@amd.com>
---
 hw/display/xlnx_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index d0bea512bd..eed705219e 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -889,7 +889,7 @@ static void xlnx_dp_write(void *opaque, hwaddr offset, uint64_t value,
         xlnx_dp_update_irq(s);
         break;
     case DP_INT_DS:
-        s->core_registers[DP_INT_MASK] |= ~value;
+        s->core_registers[DP_INT_MASK] |= value;
         xlnx_dp_update_irq(s);
         break;
     default:
-- 
2.25.1

