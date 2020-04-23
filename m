Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2431233lfm;
        Thu, 23 Apr 2020 15:38:23 -0700 (PDT)
X-Google-Smtp-Source: APiQypLxCNH58opqDNEx1weKXtTjnt1SxpW3kgp9aVdmLbo8gNDqeZnT3ifzk6GhPTzLxmZNoWMS
X-Received: by 2002:a0c:d7c8:: with SMTP id g8mr6402438qvj.148.1587681503208;
        Thu, 23 Apr 2020 15:38:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1587681503; cv=pass;
        d=google.com; s=arc-20160816;
        b=jNiSvkUAQCjzFLn9fOQDFTvn8EACsBlQ1y48AdPteu/WTeYFrylKEwjY488DIgwbb9
         X/fnyDQwfsWT5REZdm/tiXJyzT8v7X4gciU1NuX26GpXYPsrXZyOZtQLwVNC12I9XZeh
         AHbuegp1RQjnxkX1YBXQpTnFWkTaanJ997aR5U9/3YEmjQYPBLuOnnTv6RCu6JqCQxyf
         Wu3BX8GW/UGEvJtY6S4A1725NxIyWyEzaoOchigIT/nDBIs9cWyTeNkZ4+ErtMB/BHxX
         LnVzGxUQeozcoFsyE0qIa3AHXuDl5xITkqTPpmrY+5NtMawL76VW7xFqq8AWkKTlryL7
         bAxg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from:dkim-signature:dkim-signature;
        bh=1GnpI989aVgZ9ZD2TsqadiEwUHMdeut+641DhTlX6zo=;
        b=tEynoVBssod6J9Am2fRFj/HC8jPMxZRK/Q0ZF89X7NkHgSW9tfimiyDzhgzVvDFsn8
         zMFbPK0i5sK3CNwveBgszgK1vDqns5KAdxe3LPXyrzgOz+Hua7S0ds4ixcah63z3BOPF
         nKrIs2Q0V45x8JogfFbGVgzlXwTwMJOH5TphB5kVR5hSaKVsnQKscaivWgR1i3E6CXNi
         PUy8F/b8EYEMfJQO7fW0+IXjidXIg06R5/6e3IJLNfZpxDMWhhvbWqeH1sOFoEEjwS9e
         9iPNz5ILb76gtX2aoWxR3tu/ZJ1J2chdCyeu85uLJCkMyBC8nBhKaXiGRG0p042nhmlA
         Ow2g==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=fail header.i=@quicinc.com header.s=qcdkim header.b=Z38YgOcQ;
       dkim=pass header.i=@qualcomm.onmicrosoft.com header.s=selector1-qualcomm-onmicrosoft-com header.b=MBk+zLau;
       arc=pass (i=1 spf=pass spfdomain=quicinc.com dkim=pass dkdomain=quicinc.com dmarc=pass fromdomain=quicinc.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u4si2423992qvq.128.2020.04.23.15.38.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 15:38:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@quicinc.com header.s=qcdkim header.b=Z38YgOcQ;
       dkim=pass header.i=@qualcomm.onmicrosoft.com header.s=selector1-qualcomm-onmicrosoft-com header.b=MBk+zLau;
       arc=pass (i=1 spf=pass spfdomain=quicinc.com dkim=pass dkdomain=quicinc.com dmarc=pass fromdomain=quicinc.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1]:43750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRkUA-00044J-A3
	for alex.bennee@linaro.org; Thu, 23 Apr 2020 18:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48196)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steplong@quicinc.com>) id 1jRkTu-000412-7e
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 18:38:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <steplong@quicinc.com>) id 1jRkTs-0007f2-Jh
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 18:38:05 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:4303)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <steplong@quicinc.com>)
 id 1jRkTn-0007LL-LK; Thu, 23 Apr 2020 18:38:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1587681479; x=1619217479;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=/NMbB+vr3g33n02L1CGnoiVVEoPsOTTwl4D8VU89LMU=;
 b=Z38YgOcQr2Usley68G1fsvNBuWVgBDvmvX0ZEbatiDBEK41qW7rpDNu6
 ONSXjp3RKjrTJeEsXs56fQYVNFuTum/SNb701Ap1bAkvj+djn0FY2ou/G
 CNkbCFEsRhYWoa+R2I1ZIFPTGwrIVSi5Xi22wAFCsRknP5R8ucEbE8bbW c=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 23 Apr 2020 15:37:57 -0700
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 23 Apr 2020 15:37:57 -0700
Received: from apsanexr02e.ap.qualcomm.com (10.85.0.28) by
 nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Apr 2020 15:37:57 -0700
Received: from nasanexm03f.na.qualcomm.com (10.85.0.47) by
 apsanexr02e.ap.qualcomm.com (10.85.0.28) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Apr 2020 15:37:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03f.na.qualcomm.com (10.85.0.47) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Thu, 23 Apr 2020 15:37:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7mBN1btYoABS4kOpnAzSuaaqPd0wN0r3foJn98uAL40NM7p777EpWf8Dzg2mABkflcYGhAA14GDOI4yR0Qm5lP1z3Ctf4NhqKyyA2grnVsQaZ6KXzPXZeeLdZLONd0bPLLORgqlrhX2Ml7m5S/byibHCeoKD4kv2/3loerDDv+tQN3/loX9bYQM1Nup0TiULD/FyLd/wV+/WHbdzZ9Rh7EdWRDYH/5NuuzSdFchmm7LgMb2mfI4Au9l+JFzRjqpQfXtSamDLwEZrVff1+Yosn2bCxkQKLY03w+BDuaSpqBZ/y1D1LM5GIDHqJEdZqy3TtFwNtDeepDgXRBqN3cVPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1GnpI989aVgZ9ZD2TsqadiEwUHMdeut+641DhTlX6zo=;
 b=Ug8qEpdobP2fz2tiiMkdJjuHUvwNvJr2I61pBIrPrh6EffjJYCT00vvL0mehlkl/vWAZUpgZIRyADeHLNDnUfqco8IfIdikVWyBGpnEmQdNdq7aoPvNUWjJKIUDJHiH0zJ45IXrgpiSWbLQQQvqZnN3eS11ub1GlvO7wTdBUyBZaLO/rLM13TimlSXR9W3pIUUgACl/67pRfNnp9fKV7hG6D8Cj1aSEpjpSeNwd6WiK7+n04GrpYS8NqY2Rj1ZZDlQ19TekpLb0rBCmmToY7OxMZdXB/IG/y3WN9gizsv2qYxZrNAZpsSFJHUPuzB2OOhQQQEwBiSN7s7bNa8eSGyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1GnpI989aVgZ9ZD2TsqadiEwUHMdeut+641DhTlX6zo=;
 b=MBk+zLauJiGNqZ1qLM7fmE/VzyZUsRkrN+rp+cTCpugriBmAajv8nescg+zrjTDkQuT8suXQn87KjsxuUbI1aXYETC3KOFUfBJGBSvJTiamMYpX0/wj6ZP30SAHdc5gWygBPBEcYYSaxu0NNUaiHlaZQ7ocwLf83tq5C5dPsCII=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=steplong@quicinc.com; 
Received: from MWHPR0201MB3547.namprd02.prod.outlook.com
 (2603:10b6:301:7b::24) by MWHPR0201MB3532.namprd02.prod.outlook.com
 (2603:10b6:301:77::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Thu, 23 Apr
 2020 22:37:54 +0000
Received: from MWHPR0201MB3547.namprd02.prod.outlook.com
 ([fe80::10ad:5df5:d575:1f37]) by MWHPR0201MB3547.namprd02.prod.outlook.com
 ([fe80::10ad:5df5:d575:1f37%3]) with mapi id 15.20.2921.033; Thu, 23 Apr 2020
 22:37:53 +0000
From: Stephen Long <steplong@quicinc.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH RFC 0/3] target/arm: Implement SVE2 Crypto Extensions
Date: Thu, 23 Apr 2020 18:37:36 -0400
Message-ID: <20200423223739.31715-1-steplong@quicinc.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: CH2PR17CA0025.namprd17.prod.outlook.com
 (2603:10b6:610:53::35) To MWHPR0201MB3547.namprd02.prod.outlook.com
 (2603:10b6:301:7b::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-L2LA14H.localdomain (108.176.222.2) by
 CH2PR17CA0025.namprd17.prod.outlook.com (2603:10b6:610:53::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.13 via Frontend Transport; Thu, 23 Apr 2020 22:37:53 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [108.176.222.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7faa3ad3-4f6e-486f-0898-08d7e7d6f64d
X-MS-TrafficTypeDiagnostic: MWHPR0201MB3532:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR0201MB3532630B2B6D5F0C924CA248C7D30@MWHPR0201MB3532.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 03827AF76E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR0201MB3547.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(346002)(366004)(376002)(39860400002)(396003)(136003)(6512007)(6666004)(8676002)(2616005)(478600001)(956004)(4326008)(6486002)(66556008)(107886003)(66946007)(86362001)(16526019)(186003)(66476007)(4744005)(6916009)(8936002)(2906002)(26005)(52116002)(316002)(81156014)(6506007)(36756003)(5660300002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bNfQzf3zzyTQ1patd5VuVjwD//5MSylAqeQVrNSbIq8iedS6iT4jkQjBGXn8ImUa4IDGxRJdDnPi6mcdQ4k0sPTtIpy68qKj/8HD5umJaYSCcZd67thnx83Opqk/1S/yBJXnyu9GQgIom/AMXOgYTk/e2RQ3UGdUKGcj+KIfMPXiKRrXRrv3T+pvlkc8DraKp0OJkoQzbgZKwr6eYkrK70XZawZ0HJuDs6hviaDeo7cAHP9iuSs8eSF0Ygb91IMAbnNEVRqgF1JDSJKZRkTYu6U4oFEJX6zlvMzCQaOjfIeXL9t+XE5N7ie/0uFA9/XG7191j40hch09SDWT5dxmWi4VhsoTOjfecV9lHr2nHO87u8FX1C7NC+v1Y02NQPGxm2tFL1RcKJS7l0qeihEOZsZSANopAcPhX+wZavuHxzcNWIih8/fwsVvaSzIfOs/h
X-MS-Exchange-AntiSpam-MessageData: lxxbYcheumJj38g7AdW1rKYjFt5xjFIbmkLfL3ePTBGovvI7CH9SxVY+uBl4huVNuLjLG3rIJq+LELXZlU/8flLFTt49CT3AOu/6yPKCQJaQPaD1SiTsRsSmMqqbST2XR79cWTidEhcd7+ulvH7QtQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7faa3ad3-4f6e-486f-0898-08d7e7d6f64d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2020 22:37:53.9294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: An0/FXV8wannI5o+gRNDRUpUb4Xj1Jjj2K7erJ7TBQeih1JqXbT4hyFDKtNNJ2lGvcROn7mmoXzoD/h4jOisyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3532
X-OriginatorOrg: quicinc.com
Received-SPF: pass client-ip=199.106.114.39; envelope-from=steplong@quicinc.com;
 helo=alexa-out-sd-02.qualcomm.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 18:37:57
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
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
X-TUID: 6e4w9KFqV4o9

Used the helper functions in crypto_helper.c to implement the helper
functions for the crypto insns.

Stephen Long (3):
  target/arm: Implement SVE2 AESMC, AESIMC
  target/arm: Implement SVE2 AESE, AESD, SM4E
  target/arm: Implement SVE2 SM4EKEY, RAX1

 target/arm/cpu.h           |  5 +++
 target/arm/helper-sve.h    | 10 ++++++
 target/arm/sve.decode      | 20 ++++++++++++
 target/arm/sve_helper.c    | 59 +++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 64 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 158 insertions(+)

-- 
2.17.1

