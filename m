Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2042444lfm;
        Sat, 2 May 2020 11:03:35 -0700 (PDT)
X-Google-Smtp-Source: APiQypK57Tji4Wtgk/3HB67c2iV//azCJT+Qp2iUTBGKXgnwK/+TAeISr3Ixh+c+t4uSUhNYgJyu
X-Received: by 2002:ac8:46d8:: with SMTP id h24mr9667632qto.352.1588442614888;
        Sat, 02 May 2020 11:03:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588442614; cv=pass;
        d=google.com; s=arc-20160816;
        b=zU7sWQbkhN6SDK/s4jif5Veus/Ix0MlD/2id8tIhRo0QLojJZUmCJ7/6xqCWMd60bY
         Abnmmbrcwfei9ITSfgD9qWqrrV3ZQU4idlhMIfvH+cmFelHl/g0GdP3C7cv4r8uudF3f
         WQKTqnulA5xowqikmPyCWpt5F2NE7+u8CyHNZc3wYF5bu/Fa5O8O7DyCV4CxK0BqLnG+
         vg/kY/uNIkEemEiMxCAbvMN2ggZF+u7YQSbBpPaBLTsjcLJGz4qoc/1e0Ljb9sVW/q5x
         chQoFzijf+xV1MwOdVyY0ZepEs2QwUdWqKiMvn4HUOGCTg8MohMwvLyJi46fVv/Fzmq4
         dVrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=UTx9UF+InGXehI9Qo7XS0x8fwvu+YCyKIhaHtJH0hKo=;
        b=kJxeKFR8Rqhq+ccJFLyL+pQyGdxJT/rQklqTlZjLB2PLqSUdbAvzNzJ3/PONQRg5Pj
         FCDqY4mE6Z33wIvqiEOHEBES+Q0jIe8SeN4FiTQmwgMyVf/cz27M3PydPrwxvVpCNBwJ
         tcsYPnAdiKx9xOCSPCRUlSi+AvcsOGSUEw0x8pn9DlxwRvXdxJTZ+55LQhAzG4FOOoId
         yv8YtCZ40h61kqwX/THOjDlu9hF6lszbW+K8TbSMjIlDwLIo49cylToUSbZfDJiaSjHE
         dcnEUFWv4EAKqI+d9Q1o4wbYl65cEifidelBYCXsTRrtuy0mIURm/4lnYSNGrv594VaM
         /Ixw==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=CLYzrrzj;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id o19si795121qke.115.2020.05.02.11.03.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 02 May 2020 11:03:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=CLYzrrzj;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUwUA-0003Gk-8Z
	for alex.bennee@linaro.org; Sat, 02 May 2020 14:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1jUwSW-0000nI-KW
 for qemu-devel@nongnu.org; Sat, 02 May 2020 14:01:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <saipava@xilinx.com>) id 1jUwS3-0000Se-Uo
 for qemu-devel@nongnu.org; Sat, 02 May 2020 14:01:52 -0400
Received: from mail-dm6nam10on2085.outbound.protection.outlook.com
 ([40.107.93.85]:50834 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1jUwS3-0000Pl-DW; Sat, 02 May 2020 14:01:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4Dd3z/2lGNBPpCM3cq+iBuJi5+Ldpb4W2xdjJ/ju+RW4jQ0LPfz2EUXGUYSVCz3fictKjJ26jvn9vyhpbQp1IBlfvDQQSO3DoC9odxvE/hgpbcwdyMWjMgtPTjoSx+btvd8SvlgR6aY+UB7P2PWEkJVJF6jvVOQnVvplBdq5ECKgfuaKlRzkZ+a9uSKOi68osOWSyRb4DMWpHwraCkrJna6fJy35LEnyH9QpcElvD7L9Y6aXwtXF6CVtRdOKZuCUys6B/EgmDMi/C/9g5R6+MdYm4U3cqAubShlcQYeKIF1zAjacvQRxx018jBw68wtjbNYqF1FBbshJRbRx0SOlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTx9UF+InGXehI9Qo7XS0x8fwvu+YCyKIhaHtJH0hKo=;
 b=dUNuXd5QxdF7xPep8IcaBdDSEfkBXQ23k018LaLn02MN6P6JS7cTrp4Yxcy3QXc6WPpHl6KErldz2fbdPB7g6ju1w4cM8UG8ppS0vRb5IRIl9RKek/Vo9Oarh9QRtFdtTnOC9c1Ja2v5C/mfdTybI2VrYH+ZfXUum1+B8AH01Kj8Uw5dN5asUXkMCI8ilXC7Ng+/GBKf5Oa7HLH1FLLqxWTIoOAZTrnNd/zdgHahbd+RLsNVSlzRtbYnvUIKFYu309/Ks9fL3LOntgRpiR4XtfB8jbvgqIiC7oQJ83AyLhXhPxOQX+Poc9w12/XF4VqhXF66ADuIE2wh8DpmtuiGkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=wdc.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTx9UF+InGXehI9Qo7XS0x8fwvu+YCyKIhaHtJH0hKo=;
 b=CLYzrrzj4aXVfmypk1QZHPIh1OQviRiDI0Yr+BtnebrnR4Kkf5WsQAyHi/iBiuE3RcCWSb5FPPmhSxvLc2n7XWYnZQ929SEl/Qiz/HY2mQp9DoYQ4Ca5ybhgAvifb4wgr/I8JnbwKhVQ0LIFaYJVgArHPlv/RbIuDlzNjfoh2VE=
Received: from DM6PR08CA0005.namprd08.prod.outlook.com (2603:10b6:5:80::18) by
 MW2PR02MB3819.namprd02.prod.outlook.com (2603:10b6:907:3::32) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20; Sat, 2 May 2020 18:01:20 +0000
Received: from CY1NAM02FT028.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::e2) by DM6PR08CA0005.outlook.office365.com
 (2603:10b6:5:80::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Sat, 2 May 2020 18:01:20 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT028.mail.protection.outlook.com (10.152.75.132) with Microsoft SMTP
 Server id 15.20.2958.27 via Frontend Transport; Sat, 2 May 2020 18:01:19
 +0000
Received: from [149.199.38.66] (port=60296 helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1jUwRw-0004ne-Bb; Sat, 02 May 2020 11:01:16 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1jUwRz-0006ws-JJ; Sat, 02 May 2020 11:01:19 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 042I1HMO011723; 
 Sat, 2 May 2020 11:01:17 -0700
Received: from [10.140.6.35] (helo=xhdsaipava40.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <saipava@xhdsaipava40.xilinx.com>)
 id 1jUwRw-0006vq-UA; Sat, 02 May 2020 11:01:17 -0700
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id DABC413C25A5; Sat,  2 May 2020 23:23:39 +0530 (IST)
From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Tong Ho <tong.ho@xilinx.com>, Ramon Fried <rfried.dev@gmail.com>
Subject: [PATCH 09/10] net: cadence_gem: TX_LAST bit should be set by guest
Date: Sat,  2 May 2020 23:23:13 +0530
Message-Id: <1588441994-21447-10-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588441994-21447-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1588441994-21447-1-git-send-email-sai.pavan.boddu@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(136003)(346002)(376002)(39850400004)(396003)(46966005)(8676002)(186003)(81166007)(6266002)(26005)(8936002)(5660300002)(82310400002)(82740400003)(4744005)(356005)(2616005)(6666004)(47076004)(336012)(478600001)(42186006)(2906002)(110136005)(316002)(426003)(70206006)(70586007)(4326008)(36756003);
 DIR:OUT; SFP:1101; 
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd4c9534-4a2a-4bbe-966e-08d7eec2d151
X-MS-TrafficTypeDiagnostic: MW2PR02MB3819:
X-Microsoft-Antispam-PRVS: <MW2PR02MB3819AFA2883A69F72562BFF6CAA80@MW2PR02MB3819.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:255;
X-Forefront-PRVS: 039178EF4A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4O+ItRYULHEhRZVF+WTz+1OuziHByT6OYjY3kzFKHAdFU+NEBRYxzz4zZUn8mvehMycpevo7MnaJC3qEVlJD2OTTVj01J1HSNFwhoyCjlJNHFNmRXC00sMBWBE2x4JPak0Hg4vSA/ST0pLRipE3kbFsZUOZi464W8QcyClGrcf5OxoYmUVhdjFdfV8fBys1ujJWJfgjGW8bdvlF0q7yn7OJHYxfkm6S+ztc18cCb+pM6pSiug1SgUcMqM1koPYTGCpWLErCyfx7flmoXDgYuoxcTEtwRDkO4nLKslut0vro8i1YNBybxivgW6cgWD1mL5boITy0ipbx5tEYCfHBKoRP+lgL3svKzmVdvSt3wIe3zNHtV4eWhD/Z/wKS7yjpIiYHTFvKIS6h5ufG+xAswCjPP8fQaJfIwslULwrfd7bjHR0imJ7L1A9fLDg3vxJhk7wTCgJ5PYRvsjwf+1+ktLK/H3b9wDAU8sNB+0jGI1E8Wf6KvH0erPcAgNRaGVQBCpMRvZ07tqVNC1+ulqZPDWA==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2020 18:01:19.8935 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4c9534-4a2a-4bbe-966e-08d7eec2d151
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3819
Received-SPF: pass client-ip=40.107.93.85; envelope-from=saipava@xilinx.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/02 14:01:21
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Received-From: 40.107.93.85
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
X-TUID: sHIrQHmENFKV

TX_LAST bit should not be set by hardware, its set by guest to inform
the last bd of the frame.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/net/cadence_gem.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 68df92d..06128c2 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -345,11 +345,6 @@ static inline unsigned tx_desc_get_last(uint32_t *desc)
     return (desc[1] & DESC_1_TX_LAST) ? 1 : 0;
 }
 
-static inline void tx_desc_set_last(uint32_t *desc)
-{
-    desc[1] |= DESC_1_TX_LAST;
-}
-
 static inline unsigned tx_desc_get_length(uint32_t *desc)
 {
     return desc[1] & DESC_1_LENGTH;
@@ -1269,7 +1264,6 @@ static void gem_transmit(CadenceGEMState *s)
 
             /* read next descriptor */
             if (tx_desc_get_wrap(desc)) {
-                tx_desc_set_last(desc);
 
                 if (s->regs[GEM_DMACFG] & GEM_DMACFG_ADDR_64B) {
                     packet_desc_addr = s->regs[GEM_TBQPH];
-- 
2.7.4

