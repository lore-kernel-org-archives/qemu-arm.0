Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp6981896wrr;
        Fri, 15 Nov 2019 08:00:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqzzRc5EQh1qSyx0Kv1blqaDsw+6z8RatsySL6tQYX2veoK3QqsWr7qpkfbInJ45JIj80et2
X-Received: by 2002:ac8:4517:: with SMTP id q23mr14658331qtn.359.1573833610330;
        Fri, 15 Nov 2019 08:00:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1573833610; cv=pass;
        d=google.com; s=arc-20160816;
        b=n9FB6UAJYedtQE1msKakqi3MRToeG93a7KI2ZLF09E410AIrIthOufpuoaRrWXvUVg
         IlHFYi/G2JdQPIItjRsyyc+f+MmYHOmEWwpgok7UWFNM/X3YQ/+OV/IcH0pWN1KM+ZdU
         JbMFQjZe85k2jG0+iXPKKtyvNBfDo8v1V1J2CtzEPoP+hAlDwoTXXP5zavBzpXsDUgUL
         lQzLo2kEcMFchnyMBLgFxnh69dD+wtrsGduZOijbXzGgSKcFT48bWSyx8sseqMT1Cfdt
         GmJOjyC6gTyJeEdQJAfN3L65KJHNw+/QXrbs22/yZZXpEltAh2E1c/aBmmL2CobcQbFv
         WwrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from:dkim-signature;
        bh=kbT//pRSydV+5D1MLfAJkGEQWlkxqIXLW20d+05apxw=;
        b=L/Tl8QlcFKtEELx4ONAQe+8d5A+li7CdLecBlELUxj+9GC50lhI8/P+uVEulJ3Gun8
         fRTo2tuDbQMA19Oiwhs8TUmCq+XnhXLtDh8H1gWKbOKcLGEik46cYcHYLE06OWDhiUBD
         V/AA7srAUeIZhEFjR1HCTzNItbA9hUtmAtunorLWiCCQ5MaxBdTl3wKLLDQ8/ifCHSEl
         p1/rWOdcdbtBuVeNXvkTOYqVeD1W95RTYdCOZ3JfROC72d6A8d+lTHAdq0+fRcx76cs+
         /kHkbd/fb4U19iWfHEq9pcCVWGAjDRGWXgYEPwVslZKahmddP/AHiU/tPREh022JunKG
         RJ4A==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=fGBiceG9;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18si5732282qvz.172.2019.11.15.08.00.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Nov 2019 08:00:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=fGBiceG9;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iVe13-000111-9e
	for alex.bennee@linaro.org; Fri, 15 Nov 2019 11:00:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47567)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <saipava@xilinx.com>) id 1iVdyJ-0006oO-5C
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 10:57:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <saipava@xilinx.com>) id 1iVdyH-0005hb-LL
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 10:57:18 -0500
Received: from mail-dm3nam03on0602.outbound.protection.outlook.com
 ([2a01:111:f400:fe49::602]:37979
 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <saipava@xilinx.com>)
 id 1iVdyH-0005cL-7E; Fri, 15 Nov 2019 10:57:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esDQKX/meDngSYhnCwOmT6eJ/6Mph0mVi/XBfW26Ifqj6uIUl54Vm1bOrYM6ZBcQx0Hrah4xGW+1RWpu7dvsR3HPfyS7/+DiFei21z/AVExFV+rzPeuZsJp658gc7n/hQgbQP0Xx6d5CKopfy48guIqkjh//AbjwWfNETerCj+GIsA1wpQvD3W28MbzwmKZQCgga3ZNEjT18vhhzSXkosEpg3qqslG2NNh5N+zn4dIQOp4gbzGz9Mtsj/jylU+XWExvFqByK4Klr/ySbn0mSA9YwMNTnsqLIejkj46Jc3YBCQUL1Gh662Uu1g3tGgddpOvn8NmplWPCJOnyLYyTcOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbT//pRSydV+5D1MLfAJkGEQWlkxqIXLW20d+05apxw=;
 b=mu8beNQCLtCNmKxqYBnPE4KSciuDEiENFRbLfBopdWSOLzTegL0toSUvK9vgdrI9rkBpOTnXAd3dzLGmTL7ZU+OfDcFqIblEv9QTE6VQa8E2TVxxibGzly+kUmbicWQ14qO+/AKGf6DltXwamL+KoMdszbnv53nvSuS6SOK5yx9paxj2DMsnih4m8csYh6MNV+bxbPAjFpPtbAmUFqo0rmGHnge4m2hXETPVQm7eNivcqz50fGYnJE7tX5uzMunPGN8iENSj6EAnWfBb+jq+9uJN5HgUl06f1PewJotrbqRWqMZWQFAcZ2S8gEf1B/t/aOI11nTuucoJGsbF9U+P6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbT//pRSydV+5D1MLfAJkGEQWlkxqIXLW20d+05apxw=;
 b=fGBiceG9m+1mxFsL+13jBkegMBqdT6L86mhANYDd/LCVrg7cAhT0QiX65OHtINGXzp6UnjTszXH//IRhO0M180RO9wefedvW639rykPvsWdxLTv1Oba3u7Akjx0HBr4oN1nNEQ1ArUw901D2hQbqHEv0y6jtU551OSjwBPRV7WU=
Received: from CY4PR02CA0040.namprd02.prod.outlook.com (2603:10b6:903:117::26)
 by BL0PR02MB4882.namprd02.prod.outlook.com (2603:10b6:208:5d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20; Fri, 15 Nov
 2019 15:57:12 +0000
Received: from BL2NAM02FT054.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::206) by CY4PR02CA0040.outlook.office365.com
 (2603:10b6:903:117::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Fri, 15 Nov 2019 15:57:12 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT054.mail.protection.outlook.com (10.152.77.107) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2451.23
 via Frontend Transport; Fri, 15 Nov 2019 15:57:11 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1iVdyB-00006W-DT; Fri, 15 Nov 2019 07:57:11 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1iVdy6-0002Ti-A8; Fri, 15 Nov 2019 07:57:06 -0800
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id xAFFv5aw006402; 
 Fri, 15 Nov 2019 07:57:05 -0800
Received: from [10.140.6.35] (helo=xhdsaipava40.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <saipava@xhdsaipava40.xilinx.com>)
 id 1iVdy5-0002Ta-7l; Fri, 15 Nov 2019 07:57:05 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 12EA113C1F8A; Fri, 15 Nov 2019 21:26:51 +0530 (IST)
From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
To: Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 KONRAD Frederic <fred.konrad@greensocs.com>
Subject: [PATCH] display: xlnx_dp: Provide sufficient bytes for silent audio
 channel
Date: Fri, 15 Nov 2019 21:26:48 +0530
Message-Id: <1573833408-2388-1-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(39860400002)(136003)(189003)(199004)(70206006)(26005)(5660300002)(50226002)(8936002)(478600001)(8676002)(6266002)(4326008)(186003)(81156014)(81166006)(106002)(47776003)(486006)(51416003)(356004)(426003)(42186006)(336012)(2616005)(316002)(6666004)(16586007)(2906002)(103686004)(70586007)(110136005)(50466002)(36756003)(305945005)(126002)(476003)(48376002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR02MB4882; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1; 
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e456dd59-d4be-48dc-0a6b-08d769e47a4e
X-MS-TrafficTypeDiagnostic: BL0PR02MB4882:
X-LD-Processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
X-Microsoft-Antispam-PRVS: <BL0PR02MB4882A8D608EDC7F7E6B0E886CA700@BL0PR02MB4882.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:226;
X-Forefront-PRVS: 02229A4115
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KLxL8T5+WitKwt0G8sPGq2FkNZGT2CyCPmZFEaEQstsIsqF7Z1pQ6jNjqYWchpY0n3Zftax0z3vzHRZVELLfJ47/3FTSmXuG5IkJ5fVh5Ac1nabPMjGoXCGz/Uo409O+qCe8TiKZEUbv3CvKPl566CBUWMsyg9sw9Z7V+hdh3YvPj8MeheXluvz+DQXM1vdJqWdVxcfe9AAOfKOQG3iuGrZIAU8W7t4IB3Y3a9tMp6OcHHtG1lVN4Un6jP7vIFYindZ13sbIF1+re3UFLiHhT0TdG33PY6mPKAwDXGpEnvBz9RbrhNK98WTmbPra4B9KklXa32ChQB35toykJ4ESmfwryQ2KYuov8UDqSumpP1KUaL+cAiIoMoedhhOOWi5Z+X5BWvnfrcr/8rLWhCWlHud+pJgWwkfLxLx8kV4c8UfxgQkvDbH1xlzUUOY7Lp6/
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2019 15:57:11.9877 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e456dd59-d4be-48dc-0a6b-08d769e47a4e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4882
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe49::602
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8bWHWhtxHhYQ

Fill the audio channel with required number of bytes to cover the
elapsed time. This prevents rate control reset, and avoids debug prints
like below

log:
	Resetting rate control (65692 samples)
	...
	Resetting rate control (65721 samples)
	...

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
---
 hw/display/xlnx_dp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index fde3b21..7058443 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -394,13 +394,18 @@ static void xlnx_dp_audio_callback(void *opaque, int avail)
             written = AUD_write(s->amixer_output_stream,
                                 &s->out_buffer[s->data_ptr], s->byte_left);
         } else {
+             int len_to_copy;
             /*
              * There is nothing to play.. We don't have any data! Fill the
              * buffer with zero's and send it.
              */
             written = 0;
-            memset(s->out_buffer, 0, 1024);
-            AUD_write(s->amixer_output_stream, s->out_buffer, 1024);
+            while (avail) {
+                len_to_copy = MIN(AUD_CHBUF_MAX_DEPTH, avail);
+                memset(s->out_buffer, 0, len_to_copy);
+                avail -= AUD_write(s->amixer_output_stream, s->out_buffer,
+                                   len_to_copy);
+            }
         }
     } else {
         written = AUD_write(s->amixer_output_stream,
-- 
2.7.4

