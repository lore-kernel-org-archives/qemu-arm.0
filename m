Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp45096lfb;
        Fri, 8 May 2020 04:12:24 -0700 (PDT)
X-Google-Smtp-Source: APiQypIVqshBqULmSPy9IH4VtDQ1/Kw7GEzCRBWE8B8M6ZfF07cuj5iBk+a0bV+z+0fE5wyUjBgy
X-Received: by 2002:aed:234f:: with SMTP id i15mr2554278qtc.249.1588936344025;
        Fri, 08 May 2020 04:12:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588936344; cv=pass;
        d=google.com; s=arc-20160816;
        b=FU6ZOjzG5QUKw92BgpmHccVsgOPNURaNhPaJJeZyx/D4eEH6HAAGxM0p+AsxmX+mi8
         T+2ohsZ0M+sGcGv944kiIgYPDyaL6Fe07BQuN7whnwpg1sFQAqx7fkOXBHbaZQI0f8Iw
         CNKYLksNHPqcccxSGjHF9W3QrShRKAW644n+Nj3F5IiinvCSZnWdfjAZnMEVOJH4i3Mz
         Q/2edjN1FUdjcEzd6g7jujFEkzqt39ZCgYAOIdy6cC+jfUIvgrly/MYsYXu/dEoNSaDS
         POnwnE6l5JhTSJEJE1GR+ocHbGC1sqtimbWwkcjRAnj0MZPF0bqCKMMYvSWopyefyxs1
         E09w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=RC8slCZyxUtSJ0l+ao8ellzyeEKZrcXfFj+qTnHkgKI=;
        b=IBW/KaxPnnnGvr/5RO4upmYSwVTgFdj22LOhacKv2HNcZ4Nfj7Em7AW6JjT/RSQu+R
         RfBQ6f0Tabemvzte2XeFtGugWnkj4fTW8SqZy6iOCRjptXCNIKkk/90M6KmL5o2IGYpO
         e9yzhE85zaFDfbYRVGYUgvM0AG3//dKae/CbGBP7DRKOc2cThWOeSxZ24u55l4DuiKhk
         yvEaqfODxmC4a2XfQdoS1j4fcKDW9OOjjgx18DXbxZFNMLpDiNATykJZSq/0PvYitPT5
         s+2SM1+MQtfytYHV+9V1E0k4egaxwPP6tcd2ft83kQmm+rZ2Ok6WADsx9CkArXdVKRmp
         7K3A==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=k7R2R4zY;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id a10si907588qka.238.2020.05.08.04.12.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 May 2020 04:12:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=k7R2R4zY;
       arc=pass (i=1 spf=pass spfdomain=xilinx.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jX0vX-00052T-Cg
	for alex.bennee@linaro.org; Fri, 08 May 2020 07:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1jX0sN-0007rT-4J; Fri, 08 May 2020 07:09:07 -0400
Received: from mail-eopbgr700053.outbound.protection.outlook.com
 ([40.107.70.53]:30111 helo=NAM04-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1jX0sH-0002Ga-UJ; Fri, 08 May 2020 07:09:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jH/S6JWiM2YHbP6mmpHDP9oFx5XSAxwitCgBryknl6eJa+8SuFnrl0iOnZps1WpEvpvGPmNJCZ9aJt9my20UznO/Ou5Bw6YROBJ8dSSMgd7mLTj3kiK1Vi1q7e5PzUXp8n0jpREr9WzLOVr1eFon4YDrjS2CrIA8ljzPWTyMiCwSMfZyvfqpTveKGHN/HY92IHn8VV4QwmfAGby8I1vd6bGHd0n+JCh3WFSb6iEOgSGrAxeABK7Zu/Ur0hvP9m/SON9CGwCz1yPOnAIL0EBctL6POZJSDQxUpasbQ6WQ0H2gMMEEG8MKirLVZ0opItJfjzwEA8Sg3AqBAlVzgH/7Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RC8slCZyxUtSJ0l+ao8ellzyeEKZrcXfFj+qTnHkgKI=;
 b=Ed7wRurtyyh5KmJ3vSiPgh8j21NF2r7JmcnU7CHCrYRY48XeG7PkLTjSRRjDmTdHdKiJkrJ5OyiGKjOE+AAislO6RHPSLyW7skcwf5W0mlMjiCKcT1b6Gp976MOIX6r++b6e8aKIo6uTB9/3rRQ/udky+7EMKdLdG0CgP8We/G+jR+w+luUw3pfnEJVl7UUaVBKa/NiI7HYZ6Q7D1LjELp4naggfdEQI6XxCqhYWgYbMO6Q0h0GGd4dyoJgrmzjDgl7KIJoz1AFLjZgKiVN61+u5d8DCpve3BJubsVtfA5n22Kk4fvIOiitFLDYXQt6DUqC3U1Q7SUHrClWA+Q8SLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=wdc.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RC8slCZyxUtSJ0l+ao8ellzyeEKZrcXfFj+qTnHkgKI=;
 b=k7R2R4zY+v7bhUlyh81tkXABLiBQJYDu8iESxuKk0st4ZJvppVVKFj4NJV+B5oBWNtW0jJCMmX8d184T87Zn/7oel5H9ABwnP/iTFl0FOL3lFgI8ECkjUD5iawOXqJsEQsUkWozUjMKR5iaKlpP7/nW6Z2bmLYem1DF8IZ1caTE=
Received: from BL0PR01CA0022.prod.exchangelabs.com (2603:10b6:208:71::35) by
 BYAPR02MB4856.namprd02.prod.outlook.com (2603:10b6:a03:51::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.19; Fri, 8 May 2020 11:08:58 +0000
Received: from BL2NAM02FT046.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:71:cafe::28) by BL0PR01CA0022.outlook.office365.com
 (2603:10b6:208:71::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend
 Transport; Fri, 8 May 2020 11:08:58 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT046.mail.protection.outlook.com (10.152.76.118) with Microsoft SMTP
 Server id 15.20.2979.29 via Frontend Transport; Fri, 8 May 2020 11:08:57
 +0000
Received: from [149.199.38.66] (port=36293 helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1jX0s2-0002UF-O5; Fri, 08 May 2020 04:08:46 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1jX0sD-0005gK-HG; Fri, 08 May 2020 04:08:57 -0700
Received: from xsj-pvapsmtp01 (smtp-fallback.xilinx.com [149.199.38.66] (may
 be forged))
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 048B8u25017645; 
 Fri, 8 May 2020 04:08:56 -0700
Received: from [10.140.6.35] (helo=xhdsaipava40.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <saipava@xhdsaipava40.xilinx.com>)
 id 1jX0sC-0005fk-8M; Fri, 08 May 2020 04:08:56 -0700
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 34BF313C042F; Fri,  8 May 2020 16:31:04 +0530 (IST)
From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Tong Ho <tong.ho@xilinx.com>, Ramon Fried <rfried.dev@gmail.com>
Subject: [PATCH v3 10/11] net: cadence_gem: TX_LAST bit should be set by guest
Date: Fri,  8 May 2020 16:30:44 +0530
Message-Id: <1588935645-20351-11-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588935645-20351-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1588935645-20351-1-git-send-email-sai.pavan.boddu@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(376002)(346002)(136003)(396003)(39860400002)(46966005)(33430700001)(6266002)(110136005)(4326008)(82740400003)(70206006)(47076004)(2906002)(70586007)(5660300002)(8676002)(8936002)(33440700001)(336012)(6666004)(356005)(42186006)(316002)(82310400002)(2616005)(426003)(186003)(36756003)(26005)(81166007)(478600001)(42866002);
 DIR:OUT; SFP:1101; 
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b3eb208-ee8f-4865-bcd4-08d7f3403470
X-MS-TrafficTypeDiagnostic: BYAPR02MB4856:
X-Microsoft-Antispam-PRVS: <BYAPR02MB4856134CEC43B34B98E2ED33CAA20@BYAPR02MB4856.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:255;
X-Forefront-PRVS: 039735BC4E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GVJkTB5kLph/ukqzrQZkyS2tDWbfZqh1JrRweRM83HBAjtZHBZAG5ySqAitIUSR27/GjhiggViyez8bV7AT24geUOmVyIbbEiiIX0NlFuS1VYYEsfZQ+JcIhiGogK86SqWvvahPrrRsh2fNWkxD7N30AxVT91RWdMrXKMTW8ZtPQzoYzw0ns1iU0fZJ3MXoMDi533mZDdXs452PsAfLkM+U3n2nvKcgxCeiNOLwfXdb6BSZ6R4ep2pfdXj7m5dQbcm4GQ3C6IWIzrTL8bxmQzqVsvoBxeKwpGSzET35ddueVyVV+RIci64Wcu/aPxxtzYUGvLiaeYRPZrcanpKws39wEwbhz7sRAVYrsy+WjEMErCQB/MiwnvDTyusarn8RvXOdsuOr+GR524KkCn3aIUDpdMX6gKZjJ9PlcuNW4XkWBMTbcAI9xz3tfREGUj/MM0rJxtqiVaS8LoExBKSDn0znlZbFtisPmRx+VHu/zwa0GDWC84yIqsUPMURFpjcwwo0HGJhUmuKQ7tVrqoJfaiA+YAJXbb5my5plARfustkvhF2rimEl6qKxYF4UbQBXDNSsEjfbyYkAgOyo4jbZDfcKFrEiHvp4clhvbDKew+iQ=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2020 11:08:57.9339 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b3eb208-ee8f-4865-bcd4-08d7f3403470
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4856
Received-SPF: pass client-ip=40.107.70.53; envelope-from=saipava@xilinx.com;
 helo=NAM04-SN1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 07:09:00
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
X-TUID: TPq+ceTnDAB2

TX_LAST bit should not be set by hardware, its set by guest to inform
the last bd of the frame.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/net/cadence_gem.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 45c7390..f8cea63 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -348,11 +348,6 @@ static inline unsigned tx_desc_get_last(uint32_t *desc)
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
@@ -1271,7 +1266,6 @@ static void gem_transmit(CadenceGEMState *s)
 
             /* read next descriptor */
             if (tx_desc_get_wrap(desc)) {
-                tx_desc_set_last(desc);
 
                 if (s->regs[GEM_DMACFG] & GEM_DMACFG_ADDR_64B) {
                     packet_desc_addr = s->regs[GEM_TBQPH];
-- 
2.7.4

