Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp569132lfb;
        Mon, 4 May 2020 08:44:28 -0700 (PDT)
X-Google-Smtp-Source: APiQypLuFnfeaEgakXOv9pB1Z0vc2WNi5SfRRAmz1G6cs8rejtVs230EaDADJTkILBvmlMOso71G
X-Received: by 2002:a0c:bec4:: with SMTP id f4mr17346899qvj.26.1588607068186;
        Mon, 04 May 2020 08:44:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588607068; cv=pass;
        d=google.com; s=arc-20160816;
        b=wVYg5jqkBbN3gaKAqcF0H49BdcC9A6C/G+8pxF7JXT96JID/+WectE2/7f4Keh0MfQ
         H4IqhbTGn1ZpLy9f4wHo74xQEcf+U0ljaROCJSq9mPFbGgQgeGktLXxCynlnl26aQxpO
         G21V7thOwjm7RSidCDHRZay/QOe86KeZJbKGFCivF+M4pi22KA+UFK/VsoybMBDfCKUz
         WS1Bbx9lnwJ78oUmzwXhJ+xNwK4g+8QhP/LnVpmw59hHi6m6hS6mueWRFeg/e81pIBhu
         QTx3x853dOckOhfxS83z6sIu5Sn6I8kKTpXbYN4hHDVEtnDULFYe/spKFpiVbeUwvsVZ
         Ldzw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from:dkim-signature:dkim-signature;
        bh=cWnirP3LzPrlq1CHL810a7JtZn92YI3zwIrVdmsWaRQ=;
        b=abPuH2zNHBYt+DKJ0izhgcDpjQphgkHtjLOTdc2+JnFf+GEZNzvTvfTPjSgHSGYX04
         tFhV5VfXJMmMxBw31CkR5dQvxQV4hli2gAKRfdO6oz/cq6uyRl9QEG8K6FOQTlsREjI9
         jJY2SGREHXfOF0my7pAzpM/PiSLXPILz5wObn6BmVtT40QDvp531d8Mt0XRroU9XrQOw
         6eyvNS5j9MVJRwOgWTD5IuVitgn1N8gfcy08/SvBXBhdi5/AlxLgJ6CVbZzs/afVxc0f
         F3V3Cm6IW5Rz1ZeOdNe10udh2N5Ycctg5/zO6RL+24NGeKphv9l/VDC40JdEQMwFdIA6
         IpUQ==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=fail header.i=@quicinc.com header.s=qcdkim header.b=bqyh+ZMF;
       dkim=pass header.i=@qualcomm.onmicrosoft.com header.s=selector1-qualcomm-onmicrosoft-com header.b="OGecNaO/";
       arc=pass (i=1 spf=pass spfdomain=quicinc.com dkim=pass dkdomain=quicinc.com dmarc=pass fromdomain=quicinc.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id p5si6929433qvy.13.2020.05.04.08.44.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 08:44:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@quicinc.com header.s=qcdkim header.b=bqyh+ZMF;
       dkim=pass header.i=@qualcomm.onmicrosoft.com header.s=selector1-qualcomm-onmicrosoft-com header.b="OGecNaO/";
       arc=pass (i=1 spf=pass spfdomain=quicinc.com dkim=pass dkdomain=quicinc.com dmarc=pass fromdomain=quicinc.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1]:34484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVdGd-000678-Jf
	for alex.bennee@linaro.org; Mon, 04 May 2020 11:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steplong@quicinc.com>)
 id 1jVdFi-0004Wm-5x; Mon, 04 May 2020 11:43:30 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:38893)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <steplong@quicinc.com>)
 id 1jVdFf-0008A8-GW; Mon, 04 May 2020 11:43:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1588607007; x=1620143007;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=0Ilf4IbxxZX2ZO09GDIffpefk3qWTPePdOtpFUe0TpI=;
 b=bqyh+ZMF2+cvEunsctMp1/pNpkGy5D0veYO/JsO9Dq7/Ku1DDhADomTm
 P09keuTGslJFlQiDcdEiuXC4BnpR+yVcL6QkUFN+Z/i8Ttm4hftx/VZdb
 W7jsoqE8T93mtq8vYOm978Ta7JWSGhcZsMcFES+CuK+Qj7B7jtSk5SlmT I=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 04 May 2020 08:43:24 -0700
Received: from nasanexm01g.na.qualcomm.com ([10.85.0.33])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 04 May 2020 08:43:23 -0700
Received: from APSANEXR01A.ap.qualcomm.com (10.85.0.36) by
 NASANEXM01G.na.qualcomm.com (10.85.0.33) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 May 2020 08:43:22 -0700
Received: from nasanexm03g.na.qualcomm.com (10.85.0.49) by
 APSANEXR01A.ap.qualcomm.com (10.85.0.36) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 May 2020 08:43:19 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03g.na.qualcomm.com (10.85.0.49) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Mon, 4 May 2020 08:43:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtg6+ta5KbqWEmTCLGpuTxQvpGcOnYMZ6y0TM2UwGYYiRz3G78M2lKHKSmG2c+N3Tvtz5PbdsSAZyzfSgpz6Q9shcYbn6/xXO6BMsuaXG9UaHohOomySZqa6tFORX/mYJCJc+s9jjSSlzabc2q1HmEE7zZgA3yupqtEOs78dQFpoMCxRtJJ1tVdGKyIncQQ31WAwsHOexPkk/37UzaCBZjMk4plRlcjgA6J7IPbhmFRVwrtdEGGn7iMNlMyrWVOEVQQtOPPRaE5d07myc2ROm5dXjIrB5yGgW+pJp1N7hmHdJG2g6F6rJkqBRybuKzNTfVk+C/FAiG5YffrADuZWXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWnirP3LzPrlq1CHL810a7JtZn92YI3zwIrVdmsWaRQ=;
 b=aogoM0fYnbTwXxwQoPryUviUOK+zPFloGx3a4jN9VFG+Xi2zweYnAY8N6kYloj8b6PB4mKa24W9B4+IZmvyDPI2R2isrsJWKTYmBYephg7FMDHFOLfFMk6eqMlaqEaCMZ2rQdqv00KPDzi//XJmLCXtM3rp5t7hqz6bMzMfQ2XDcq4ZCVq2v+tMyuNR4oFg1rnRyPn8K21aRwI0InHfI1uqH/I08L1ge3FbcWTmx/I+xXLZ0+yfdeLuZmbxrzzdzdFhtGQMK6Zt4ebRVX2598yXI/TUn5tTRGvVPMMYkJN9aecZkvofgWnCTej0bqkVEuXNbXE5/+wkB3Ul/OX2gRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWnirP3LzPrlq1CHL810a7JtZn92YI3zwIrVdmsWaRQ=;
 b=OGecNaO/hI7s/xGzLxTm+e1g382G4K9jRwok1MaQP4TVhtxco73WFXhLzx1/44Nvz11Fo+FVsYwHuk+bkzN4GLpiDdwcQX868EqdKU6e3RwrP+6Jfh5KHXoPFFaKqoUBAMSBC0P1b5r07PKIpenARawz1UOzGa3GUChVG8hjgwM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=quicinc.com;
Received: from MWHPR0201MB3547.namprd02.prod.outlook.com
 (2603:10b6:301:7b::24) by MWHPR0201MB3547.namprd02.prod.outlook.com
 (2603:10b6:301:7b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.29; Mon, 4 May
 2020 15:43:18 +0000
Received: from MWHPR0201MB3547.namprd02.prod.outlook.com
 ([fe80::10ad:5df5:d575:1f37]) by MWHPR0201MB3547.namprd02.prod.outlook.com
 ([fe80::10ad:5df5:d575:1f37%3]) with mapi id 15.20.2958.030; Mon, 4 May 2020
 15:43:18 +0000
From: Stephen Long <steplong@quicinc.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH RFC] target/arm: Implement SVE2 fp multiply-add long
Date: Mon,  4 May 2020 08:43:03 -0700
Message-ID: <20200504154303.5230-1-steplong@quicinc.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: MN2PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::22) To MWHPR0201MB3547.namprd02.prod.outlook.com
 (2603:10b6:301:7b::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from STEPLONG.qualcomm.com (24.102.122.190) by
 MN2PR07CA0012.namprd07.prod.outlook.com (2603:10b6:208:1a0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19 via Frontend
 Transport; Mon, 4 May 2020 15:43:18 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [24.102.122.190]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 796a5a88-9ceb-4359-38a5-08d7f041de0e
X-MS-TrafficTypeDiagnostic: MWHPR0201MB3547:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR0201MB35474B5320B0E174B5539EBFC7A60@MWHPR0201MB3547.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:28;
X-Forefront-PRVS: 03932714EB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9K5vRN2rE9z2WpA07+/NHRGT72d2qB8E521LP1OSSvePGboWPNgoc9cl101cwdfq5JNEtJJxc7+ZZrNSZOykGKIzZHmlIEx+6MDE7Bk8cJCHJGO60ennTVetArbwlIn69/GK7lJRuTEbOxTkjGdPJJvcnRbgl4/NUaBX/rRMtUdLQ+azi8jUwQC6nB0kUJ8pix5hFi8nXYlcgBQzw7hLW+foinZgPt/28KOgqQr+qsJkBbmBkzHyb0O9vMtfcLStl3cIaALjAKzOG/TOn/wNsRaCQd4ig+IRf98HbUrKndd9RRVR1Wsi6TT8dxz62NrMYLeoWGArgJpHc8jyABuYhKeN0cPneGj0YoiFJieCiGXPr8QpbbsG9lsTNZK1uvPshONwlA66TP0BpQ4rBbaoDO47sWhavd4yC9tRXywmKL+lzYz19gvCKVehiOmAcHRQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR0201MB3547.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(39860400002)(346002)(396003)(376002)(136003)(107886003)(8936002)(4326008)(2906002)(66946007)(1076003)(8676002)(186003)(16526019)(6512007)(5660300002)(6666004)(66556008)(66476007)(6486002)(26005)(6506007)(86362001)(478600001)(36756003)(6916009)(52116002)(956004)(2616005)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: oYaQQ1JlaDWbci56LkFRUXuWCefaEDSFke7vXvt+RYbLsrWCv2R+45C6vlY1DEwVSTtwDa9wIEJtsbRUKb4Tj4cy+vkbFG21tUZ11Z8fG2pC94n2c4wnFVG+h7B4hBdE3m5ZyJ5taA+H+dNtXjWWSMgFnyOWT/+TuUPh5LaCf9UkitRg2RH2iZp6cuFnhQebILT6/4I4h7ELX4Dvt0mthF353OOwa3T6wdntUOAYCraFOu+f3eF/4zln42RHTAexDVfMw5UED4Xnh+d+0AySv/4SuFP+dYjKHTv40g63rZFyRXVFRHWHWLHoqz40864ZtAEufWKiGlD21yjYA8i7hG3+WoeLGttoZf9XIsnoRQ+l3Ghg2xjKH5ORiDSTQMtNW3upulcNQhZxbSpIfrN0lKBNg1jQX9t99WpnqhHRJId+UxlRxWq3QrbSJ2bRKB7vAX9mgLHuEgx9DFpVdbTy8m0M7tV5MQtjJWXFR4Lx6JktyaApM1th8UYSu2XNyvholj2oERbiMp720c59htNNVKBLJxct/KU5wVuprdurMbqYCidhl/aMotUYVuiRdTD/btLkZRTnAxLei+guXjA3opXQ9XZYJHkShWl9abH0grIWGmr7Mhfs7fBjkoHh1zp+hnc8qrGT08Ze2sT83Lp7GiY1pBTjpeCye/M0+eOIkq6eCrdS6ssdOJdbIOjeZid4xfsFg05hQLtBgL/3F8uVHlJET8S0BeOJe8ba4X4RYHPzqTHSV2vQFQkXLz+QZ/ppRBPrQH7BgvJOTuazv6v3wLwQGMBRjfDF3bFWOwoex/w=
X-MS-Exchange-CrossTenant-Network-Message-Id: 796a5a88-9ceb-4359-38a5-08d7f041de0e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2020 15:43:18.7657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cb1sgFKZtYrxhcPd5grS2/gi7/IB+dG1n+s4SoR5eXJZxgFWbWAyK5Pd6s8l77zSUiaqOdBmygEaVqV50BxxEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3547
X-OriginatorOrg: quicinc.com
Received-SPF: pass client-ip=199.106.114.38; envelope-from=steplong@quicinc.com;
 helo=alexa-out-sd-01.qualcomm.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/04 11:43:24
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_PASS=-0.001,
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
Cc: qemu-arm@nongnu.org, richard.henderson@linaro.org, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xm3ZPVoFZfsb

Implements FMLALB, FMLALT, FMLSLB, FMLSLT

Signed-off-by: Stephen Long <steplong@quicinc.com>
---
 target/arm/helper-sve.h    |  5 ++++
 target/arm/sve.decode      |  6 ++++
 target/arm/sve_helper.c    | 27 ++++++++++++++++++
 target/arm/translate-sve.c | 58 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 96 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 0a62eef94e..803df6e973 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2731,3 +2731,8 @@ DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_idx_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_idx_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve2_fmlal_zzzw_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fmlsl_zzzw_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 3cf824bac5..89554fe46c 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1568,3 +1568,9 @@ SM4E            01000101 00 10001 1 11100 0 ..... .....  @rdn_rm_e0
 # SVE2 crypto constructive binary operations
 SM4EKEY         01000101 00 1 ..... 11110 0 ..... .....  @rd_rn_rm_e0
 RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
+
+### SVE2 floating-point multiply-add long
+FMLALB_zzzw     01100100 .. 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm
+FMLALT_zzzw     01100100 .. 1 ..... 10 0 00 1 ..... .....  @rda_rn_rm
+FMLSLB_zzzw     01100100 .. 1 ..... 10 1 00 0 ..... .....  @rda_rn_rm
+FMLSLT_zzzw     01100100 .. 1 ..... 10 1 00 1 ..... .....  @rda_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index aa94df302a..c3192aa223 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -7622,3 +7622,30 @@ void HELPER(fmmla_d)(void *vd, void *va, void *vn, void *vm,
         d[3] = float64_add(a[3], float64_add(p0, p1, status), status);
     }
 }
+
+void HELPER(sve2_fmlal_zzzw_s)(void *vd, void *vn, void *vm, void *va,
+                  void *status, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    intptr_t sel1 = simd_data(desc) * sizeof(float16);
+    for (i = 0; i < opr_sz; i += sizeof(float32)) {
+        float32 nn = *(float16 *)(vn + H1_2(i + sel1));
+        float32 mm = *(float16 *)(vm + H1_2(i + sel1));
+        float32 aa = *(float32 *)(va + H1_4(i));
+        *(float32 *)(vd + H1_4(i)) = float32_muladd(nn, mm, aa, 0, status);
+    }
+}
+
+void HELPER(sve2_fmlsl_zzzw_s)(void *vd, void *vn, void *vm, void *va,
+                  void *status, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    intptr_t sel1 = simd_data(desc) * sizeof(float16);
+    for (i = 0; i < opr_sz; i += sizeof(float32)) {
+        float32 nn = *(float16 *)(vn + H1_2(i + sel1));
+        float32 mm = *(float16 *)(vm + H1_2(i + sel1));
+        float32 aa = *(float32 *)(va + H1_4(i));
+        nn = float32_set_sign(nn, float32_is_neg(nn) ^ 1);
+        *(float32 *)(vd + H1_4(i)) = float32_muladd(nn, mm, aa, 0, status);
+    }
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index a8e57ea5f4..0dc35b601a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8253,3 +8253,61 @@ static bool trans_RAX1(DisasContext *s, arg_rrr_esz *a)
     }
     return true;
 }
+
+/*
+ * SVE2 Floating Point Multiply-Add Vector Group
+ */
+static bool do_sve2_zzzz_fp(DisasContext *s, arg_rrrr_esz *a,
+                       gen_helper_gvec_4_ptr *fn, int data)
+{
+    if (fn == NULL || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        TCGv_ptr status = get_fpstatus_ptr(a->esz == MO_16);
+        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vec_full_reg_offset(s, a->ra),
+                           status, vsz, vsz, data, fn);
+        tcg_temp_free_ptr(status);
+    }
+    return true;
+}
+
+static bool do_sve2_fmlal_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
+{
+    if (!dc_isar_feature(aa64_sve2, s) || a->esz != 2) {
+        return false;
+    }
+    return do_sve2_zzzz_fp(s, a, gen_helper_sve2_fmlal_zzzw_s, sel);
+}
+
+static bool trans_FMLALB_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sve2_fmlal_zzzw(s, a, false);
+}
+
+static bool trans_FMLALT_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sve2_fmlal_zzzw(s, a, true);
+}
+
+static bool do_sve2_fmlsl_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
+{
+    if (!dc_isar_feature(aa64_sve2, s) || a->esz != 2) {
+        return false;
+    }
+    return do_sve2_zzzz_fp(s, a, gen_helper_sve2_fmlsl_zzzw_s, sel);
+}
+
+static bool trans_FMLSLB_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sve2_fmlsl_zzzw(s, a, false);
+}
+
+static bool trans_FMLSLT_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sve2_fmlsl_zzzw(s, a, true);
+}
-- 
2.17.1

