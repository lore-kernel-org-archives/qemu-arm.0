Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp675448lfm;
        Fri, 17 Apr 2020 09:23:25 -0700 (PDT)
X-Google-Smtp-Source: APiQypKlp12WwZ1F+FnugJi/Rt3vrX7OhTJY3+D9w1zeGc3Wkuesl5/lHrm0HBvnmvlelu4aTdez
X-Received: by 2002:ac8:46d0:: with SMTP id h16mr3928827qto.242.1587140605072;
        Fri, 17 Apr 2020 09:23:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1587140605; cv=pass;
        d=google.com; s=arc-20160816;
        b=rZcG3/y96nSN8NY8o4xqDlWcO3ul+3kjPI2SM04+Ns4v6FYgsNR5RdUU/6U8g36Qi0
         1wrPx+b6JIOlWR2dL6sMkli31onZXWISSNPmEdHnynXiWX54rN429I9QHVarQAjN5gwH
         HM0rAmSDCd256HvzQFlW1mV0BS2i2f7nsz7iEq4sdN9wwOggmGxH2rdYouB1AbTFJw9c
         +ecfLy4v4JtsPwF2VSTvrDad+rrghFGF2UEy7KsvLH1nuARkvSu4Sq7wlSluGFMsjSd0
         i/Dj8o1dHG3BXtLZ1fl5bnDhZSBtK0t8qdzySnFKvzooQ9RC4df/wUJHq4pScHG8nH1E
         y1vA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature
         :dkim-signature;
        bh=Ao3bZOml2Kn2adA3FKMzT3BjUtNa7t17LDEtBuCGiZU=;
        b=W1rXF5x21uyqJ2CbTlaWrzKC+wyYwESsxBrmRizlqy0lPoMkrpX5QpGMt2uGqMOc/L
         /bSISyF7doYkJVHwO3//D1TJE3IOX0Hv5bESAwcymTj78C+dqcPkJiDYrW4GYTp2lVmw
         IBKL7QmUluHkSmcKrDAmJgS63rdPvPqgL3a9BcsQgTnNoD805z0SzuZEAmh55Eclnh6l
         04G9RtQyX3wgHoHKF2z69F9H1cxa7HDjAQJYuJgEL2cuidHT+B1c7g/R4VcfpClrrZ6+
         KAZcHzUdV2VU5bs8fzrVNOwwgv5muSEKXjS2e4HMAcjBUE4chhN+ITv/T+Y3rZ1MgK5a
         3D6w==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=fail header.i=@quicinc.com header.s=qcdkim header.b=qZyJqGri;
       dkim=pass header.i=@qualcomm.onmicrosoft.com header.s=selector1-qualcomm-onmicrosoft-com header.b="EVoD/kpS";
       arc=pass (i=1 spf=pass spfdomain=quicinc.com dkim=pass dkdomain=quicinc.com dmarc=pass fromdomain=quicinc.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o16si6502242qtk.370.2020.04.17.09.23.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 09:23:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@quicinc.com header.s=qcdkim header.b=qZyJqGri;
       dkim=pass header.i=@qualcomm.onmicrosoft.com header.s=selector1-qualcomm-onmicrosoft-com header.b="EVoD/kpS";
       arc=pass (i=1 spf=pass spfdomain=quicinc.com dkim=pass dkdomain=quicinc.com dmarc=pass fromdomain=quicinc.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1]:49450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jPTm0-0002JS-EB
	for alex.bennee@linaro.org; Fri, 17 Apr 2020 12:23:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37266)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steplong@quicinc.com>) id 1jPTlk-0002Ck-0h
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 12:23:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <steplong@quicinc.com>) id 1jPTlh-0007lv-WA
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 12:23:07 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:45089)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <steplong@quicinc.com>)
 id 1jPTlc-0007fW-4z; Fri, 17 Apr 2020 12:23:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1587140580; x=1618676580;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=m2F1YUEwmiM9nglFoxq7V0qWrAJl8rrHZRPXroYH7tw=;
 b=qZyJqGriUY3CvPaVQzprVgwpXUfPpazJsCuetfp6ssfF2vzvh5skNp2W
 Rkx/poT17DrRe5APyz3Kt09KHlow792XjGR6Hq7Lr2lwqU6tcqSffxuFZ
 fw5Hfe3NYhSfdjAlAkDdgOefcER+SN23qAFbxyCnt7O/+ebKiMYvRJu7G 0=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 17 Apr 2020 09:22:59 -0700
Received: from nasanexm01b.na.qualcomm.com ([10.85.0.82])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 17 Apr 2020 09:22:59 -0700
Received: from eusanexr01f.eu.qualcomm.com (10.85.0.101) by
 NASANEXM01B.na.qualcomm.com (10.85.0.82) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Apr 2020 09:22:59 -0700
Received: from nasanexm03b.na.qualcomm.com (10.85.0.98) by
 eusanexr01f.eu.qualcomm.com (10.85.0.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Apr 2020 09:22:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03b.na.qualcomm.com (10.85.0.98) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Fri, 17 Apr 2020 09:22:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNLvivrI4FGdWJBa1BPU7Yh05yLf56jmE3J1kBBkSBQke5AU5Nxyz+5RwGugGXvoUNVYuYjpm5H0s2kZYhlbBN+QXuSWyOKcV2+j4kze1B4M+Ft7YOpnA4HJT9alsmAs7gAr0MXUClaQZuWECoqVt+MSWE1+4NgJCuSMo20vyJwIqZuOi/tLcLxmaeLRi8Hj5YdVXhgho899PAA4osQECHrtXkf7LVI+U1UxFj8m0GGxvqFI6SLVSUT8oV5HGotqI5IkmZ2/7LLt/USpgSFEOghHxszPSlYvxoGzef5DnNiKf6ygkLxIJnFpaAq6EnARRnuP0WlCGL7nqeyISq+gEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ao3bZOml2Kn2adA3FKMzT3BjUtNa7t17LDEtBuCGiZU=;
 b=h/uAN60GvV40LkjleEEvox7GQYZDYtvMS017akku8IlRzqaI5se1LDI5kNijm5AcXiY8iFR0El4k+eHF9XGR59YR2uaGCLB1LEIhzjRkwrU8O/wso1MwCY8uEF2NZTFyOMVcTrRLxJEiZuEJtKoU0hXp29dRMmxDXBU/88FPDOox+D9xKNLMYUWKLv+BhB8cTfkusQl5+I6MV/HaE2B2LYpbszXTZRW+iMEPQgHQ4XaEQtB3SB+1bVheJjE6lAOamEt8I2/sbUO7KXVZJkO6HPDl4wsVEKKIIK5cjrUUs767WjrA2ghFQPAdP9x6HDBx/n4Jc+4Wa0hDftfulm1LIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ao3bZOml2Kn2adA3FKMzT3BjUtNa7t17LDEtBuCGiZU=;
 b=EVoD/kpSU5dVp76shO175N2S61xB9Kh1KBqfxyXnSwJuc/dxQX2q1MlNl7bugc+cVDnG/sNA/Qgfq90X2c4orRTJYHGal320+NRxOUgsuYoPFKDfG7tu12W6UQroOBS3gqyLgIO9QmerojEE/Gh7prk79Tit769beZiz6cp+KtI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=steplong@quicinc.com; 
Received: from MWHPR0201MB3547.namprd02.prod.outlook.com
 (2603:10b6:301:7b::24) by MWHPR0201MB3484.namprd02.prod.outlook.com
 (2603:10b6:301:77::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Fri, 17 Apr
 2020 16:22:50 +0000
Received: from MWHPR0201MB3547.namprd02.prod.outlook.com
 ([fe80::10ad:5df5:d575:1f37]) by MWHPR0201MB3547.namprd02.prod.outlook.com
 ([fe80::10ad:5df5:d575:1f37%3]) with mapi id 15.20.2900.030; Fri, 17 Apr 2020
 16:22:50 +0000
From: Stephen Long <steplong@quicinc.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 3/4] target/arm: Implement SVE2 SUBHNB, SUBHNT
Date: Fri, 17 Apr 2020 12:22:30 -0400
Message-ID: <20200417162231.10374-4-steplong@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200417162231.10374-1-steplong@quicinc.com>
References: <20200417162231.10374-1-steplong@quicinc.com>
Content-Type: text/plain
X-ClientProxiedBy: CH2PR12CA0017.namprd12.prod.outlook.com
 (2603:10b6:610:57::27) To MWHPR0201MB3547.namprd02.prod.outlook.com
 (2603:10b6:301:7b::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-L2LA14H.localdomain (108.176.222.2) by
 CH2PR12CA0017.namprd12.prod.outlook.com (2603:10b6:610:57::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.25 via Frontend Transport; Fri, 17 Apr 2020 16:22:49 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [108.176.222.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45a62260-17bb-4cb0-dad4-08d7e2eb9278
X-MS-TrafficTypeDiagnostic: MWHPR0201MB3484:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR0201MB3484C247E1EBEAD247E4A24FC7D90@MWHPR0201MB3484.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:65;
X-Forefront-PRVS: 0376ECF4DD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR0201MB3547.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(396003)(376002)(136003)(39860400002)(366004)(346002)(5660300002)(107886003)(4326008)(66946007)(66476007)(66556008)(6916009)(6486002)(478600001)(6512007)(6666004)(2906002)(36756003)(186003)(16526019)(86362001)(956004)(1076003)(2616005)(316002)(8676002)(26005)(6506007)(52116002)(81156014)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mkT2McmLQuAW7VB6Pw1OHSEQD8Zi3I6s8Wn+aobCBz00qWaBeK6sBt+5nnoN15Crf6CqdKXjz9o9xFqQW3i3GGuLzLc9wobUD7iBjOl0rVURThLBtkrJMAMOB8iQN138XFNJifwwshDYqJcnaWT2jWjtRX2xwbxhmKVnL/cL+7fK0Mqh9zUHAEoTRicJex/6AHxBG+iljAKK7Hf7CDNWysj/lXB6KLIigC6NELATqgihu1Tlv0cSRt35Uu5eSxnAT2VKQzAqqk+wJlmFgTbe9KX4PUKPRb8WmXSsDYOPxk8glvFp7HjOUdMOs9Akj2/DRUVXkF62iUSXyf4q/AFEtIesxFjpSjxQnbcuXTFf4+w9Lzm8mB9xAGVIYX76QZ10k4mUB8q/mKwycSsfmknuuNjF5u4I4s+K1BIEZpcAvW+0F26bMKRWJ/PoD686ZXNy
X-MS-Exchange-AntiSpam-MessageData: 0Fd4o+jQxlzCV9jFryimE8afpZk0mszAuJIVtQixbdxVE6fFt0uC4AHmzmvtnyWOP15r0G5kAWeYEGixhc24FDDHTjyYXF8rdH8CB0dShvPAg4NtQSKx4Vg+UanE5GA7tWicgYEDJiWR+oz1Dcio3g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a62260-17bb-4cb0-dad4-08d7e2eb9278
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2020 16:22:50.1448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aL2j8q1/hACzJN3bWqhT1EYRnpFab3UsudBoZgIZEt2YlO4PXJyx7Rfycno+0SHE1/Qkd/QRQfgbAby0q4QbXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3484
X-OriginatorOrg: quicinc.com
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 199.106.114.39
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
X-TUID: 6pbw/wrYW12O

Signed-off-by: Stephen Long <steplong@quicinc.com>
---
 target/arm/helper-sve.h    |  8 ++++++++
 target/arm/sve.decode      |  2 ++
 target/arm/sve_helper.c    | 10 ++++++++++
 target/arm/translate-sve.c |  3 +++
 4 files changed, 23 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 5d5542a82a..00e3706da0 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2532,6 +2532,14 @@ DEF_HELPER_FLAGS_4(sve2_raddhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_raddhnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_raddhnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_subhnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_subhnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_subhnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_subhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_subhnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_subhnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_b, TCG_CALL_NO_RWG,
                    i32, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_h, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 9d82677808..75996897a1 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1327,6 +1327,8 @@ ADDHNB          01000101 .. 1 ..... 011 000 ..... .....  @rd_rn_rm
 ADDHNT          01000101 .. 1 ..... 011 001 ..... .....  @rd_rn_rm
 RADDHNB         01000101 .. 1 ..... 011 010 ..... .....  @rd_rn_rm
 RADDHNT         01000101 .. 1 ..... 011 011 ..... .....  @rd_rn_rm
+SUBHNB          01000101 .. 1 ..... 011 100 ..... .....  @rd_rn_rm
+SUBHNT          01000101 .. 1 ..... 011 101 ..... .....  @rd_rn_rm
 
 ### SVE2 Character Match
 
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index f92b8dd312..f6e7694b9f 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2049,6 +2049,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)              \
 
 #define DO_ADDHN(N, M, SH)  ((N + M) >> SH)
 #define DO_RADDHN(N, M, SH) ((N + M + (1 << (SH - 1))) >> SH)
+#define DO_SUBHN(N, M, SH)  ((N - M) >> SH)
 
 DO_BINOPNB(sve2_addhnb_h, uint16_t, uint8_t, 8, DO_ADDHN)
 DO_BINOPNB(sve2_addhnb_s, uint32_t, uint16_t, 16, DO_ADDHN)
@@ -2066,6 +2067,15 @@ DO_BINOPNT(sve2_raddhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_RADDHN)
 DO_BINOPNT(sve2_raddhnt_s, uint32_t, uint16_t, 16, H1_4, H1_2, DO_RADDHN)
 DO_BINOPNT(sve2_raddhnt_d, uint64_t, uint32_t, 32,     , H1_4, DO_RADDHN)
 
+DO_BINOPNB(sve2_subhnb_h, uint16_t, uint8_t, 8, DO_SUBHN)
+DO_BINOPNB(sve2_subhnb_s, uint32_t, uint16_t, 16, DO_SUBHN)
+DO_BINOPNB(sve2_subhnb_d, uint64_t, uint32_t, 32, DO_SUBHN)
+
+DO_BINOPNT(sve2_subhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_SUBHN)
+DO_BINOPNT(sve2_subhnt_s, uint32_t, uint16_t, 16, H1_4, H1_2, DO_SUBHN)
+DO_BINOPNT(sve2_subhnt_d, uint64_t, uint32_t, 32,     , H1_4, DO_SUBHN)
+
+#undef DO_SUBHN
 #undef DO_RADDHN
 #undef DO_ADDHN
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index a36eb9cf98..4081fcb873 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7519,6 +7519,9 @@ DO_SVE2_ZZZ_NARROW(ADDHNT, addhnt)
 DO_SVE2_ZZZ_NARROW(RADDHNB, raddhnb)
 DO_SVE2_ZZZ_NARROW(RADDHNT, raddhnt)
 
+DO_SVE2_ZZZ_NARROW(SUBHNB, subhnb)
+DO_SVE2_ZZZ_NARROW(SUBHNT, subhnt)
+
 static bool do_sve2_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
                                gen_helper_gvec_flags_4 *fn)
 {
-- 
2.17.1

