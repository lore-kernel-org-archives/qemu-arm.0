Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5811496lfm;
        Tue, 28 Apr 2020 10:46:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypKzE8eHk7uM9ADMigLPrniXB3UrQ78w94UwSG1wTg/7NCNdP26bbd+FjMB4e2Wx0URreTZ8
X-Received: by 2002:a37:a555:: with SMTP id o82mr28027017qke.397.1588096012577;
        Tue, 28 Apr 2020 10:46:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588096012; cv=pass;
        d=google.com; s=arc-20160816;
        b=hqtFFF5T3XyLhN7+k9GTeIVgOHTDS0Q9viyPhCZ0ONLY8WZLl3MkQUEOjiBT4Mi1C3
         XCT01n7bitHQ19Tw1BFmJfvVZKWd167n9mw/b0HNWk1Q43GujgYdC/rWP6iidtdm5mjM
         d8OPBJY+GHAv3Ts1RNqV1CH3wgN7Git8p5IjisFkqZRMO4TQCmIqu9bKJbvJorCKxTSQ
         pFLV4S4v7P21vp0Evn2bp33EgeSHPbvHTqnQ9GUrqpOEQh7K5RxfV0Nz69+HTk2Y0CkQ
         9pyT36JXU21a0VAvEesCpU5xgdlvB31stvXJ/8RoX0OXkRNHOw77zWg745sZIgrV0QAD
         zQ1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature
         :dkim-signature;
        bh=076eq/q30umxZyrFe7vpjThmxoLX7Wu9t3nEAi40/94=;
        b=vIA61WUWWxYax+D/2+HsTHvbuufpuZjFUSe8KpgukMnlz8elimsSnpB/iTA9WrLHr9
         p2H195ib2iePpVGn+vBQBlYbDrYoQN3TyN++dDJNdS7dE3qQr7boRgHTCO5VoGjFHScC
         4plu2EgMz9/oPmBlHBXcJ1kLFoNYGEXTIOOinqN2lVJROZIyYgjP82G/EqJcsvtJRGG1
         By1VYLC2yKyPPv/FLaNT3XYLb713nsapo/sgWaqwkidykm15fGTvxFAcfe4AdrVFFW1d
         Le18o0hRIArLFOVQhq6sM5TWgjjrCacl/uZ3aXrhnClS22VB4veg/FLadc41FFtsP1CP
         ZFXQ==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=fail header.i=@quicinc.com header.s=qcdkim header.b=LNnW7tTZ;
       dkim=pass header.i=@qualcomm.onmicrosoft.com header.s=selector1-qualcomm-onmicrosoft-com header.b=A9+P3d+g;
       arc=pass (i=1 spf=pass spfdomain=quicinc.com dkim=pass dkdomain=quicinc.com dmarc=pass fromdomain=quicinc.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o3si10890887qke.167.2020.04.28.10.46.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Apr 2020 10:46:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@quicinc.com header.s=qcdkim header.b=LNnW7tTZ;
       dkim=pass header.i=@qualcomm.onmicrosoft.com header.s=selector1-qualcomm-onmicrosoft-com header.b=A9+P3d+g;
       arc=pass (i=1 spf=pass spfdomain=quicinc.com dkim=pass dkdomain=quicinc.com dmarc=pass fromdomain=quicinc.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1]:42338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jTUJn-0006jg-KR
	for alex.bennee@linaro.org; Tue, 28 Apr 2020 13:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44604)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steplong@quicinc.com>) id 1jTUJB-0006DA-U5
 for qemu-arm@nongnu.org; Tue, 28 Apr 2020 13:46:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <steplong@quicinc.com>) id 1jTUGw-00027L-Id
 for qemu-arm@nongnu.org; Tue, 28 Apr 2020 13:46:13 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:19618)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <steplong@quicinc.com>)
 id 1jTUGv-0001ro-RP; Tue, 28 Apr 2020 13:43:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1588095833; x=1619631833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=yjNoooJNGb2FYkMmatFKkZhDKEFuIsrVvEX1QA1XlHE=;
 b=LNnW7tTZJ63zGSyavOD6GtmA8LAOM5lEorW+7ni+ag1iT3kb9tRfs/I0
 zgpbTAzbBmsw5041fAP4KOPZVJjhjSd/V9Joc84w+afs5hVB6XaoXg1iU
 3Fxx5LZA5wQobzNg/fJ4PNsHO2znsERd02eYHEQzmCOUsEQYs2BwyS5Yj s=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 28 Apr 2020 10:43:48 -0700
Received: from nasanexm01f.na.qualcomm.com ([10.85.0.32])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 28 Apr 2020 10:43:48 -0700
Received: from NASANEXM01F.na.qualcomm.com (10.85.0.32) by
 NASANEXM01F.na.qualcomm.com (10.85.0.32) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Apr 2020 10:43:48 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (199.106.107.6)
 by NASANEXM01F.na.qualcomm.com (10.85.0.32) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Tue, 28 Apr 2020 10:43:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9e8xPWSFy+MG6lw4ZAk2AEC0bNF9Wj0b1I99059GPRjzKRmNtWNf82Tyvzuk4/I2WpM+r02iv1eDBle31MKCd1KrtbAiqTavI6U3yYN0ONB0t93iEqDSX+sOIfXNK2650X5sFCXsC1RhhVU3iuxvdHxsLhz/jUrlQBpmjc1kq7U9e/clRRDuHKruP9MiXNqZqQQeTGHM82ATBIW41Pg2d4sNY3TtYAy0TyiNt9GFMTsWcZ5DUS8W90xKm+6Nvb70L7dZwHpEXv9SkrlHm0b3XsewVIzz0Ef7vHD1i8wFMeijW65PuJESZ9f/7qqPC/zXz4Fk6zAgoizyxTOVM8uZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=076eq/q30umxZyrFe7vpjThmxoLX7Wu9t3nEAi40/94=;
 b=aj01Br/aTwScndMWfFvsjZRfDfsCfL+eWomKvlVA+ZhS46We3vUzSAx5IFq/wVpshSBY/sykipxpn/Q/LsjKeqxu4yp3GDcVIXKr78bCy8ynPpUW7UbLbMXmKemtUA3aM9xjynW/D61/RH8REgL7Rq1YdbLb+KrcFF6/lBC8r3o3AOhsHiSh5tP+QJNBHUGgst7oulgYmYYCwfIYh3ps5fulUB8K08K5DGr7TXkGcmPqIsUILhC59L7Iw7R2DW8Z7yjRy1jjmVCNZam4o0YQEyWrYHDVzBfhyjMN7VQ3ZVNXQBUTeq2iLW68fYU4NeQgcpeTK3bXBby9eqZa8TN3+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=076eq/q30umxZyrFe7vpjThmxoLX7Wu9t3nEAi40/94=;
 b=A9+P3d+gKLy6TuocWEIQU7BesYY1lIux/LwpcblJP7EXvbo3LIWzcRDE9WkGz7/dqERc9keJpeByFDOsfuLezk028llFWBxBgz9PWJOJdfEznjwlU5B1fOBmMFI7JU/I+yJACuPmy40PiQ+SbjnTIwhUJbta8S/m7+oVJ3RZLpQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=quicinc.com;
Received: from MWHPR0201MB3547.namprd02.prod.outlook.com
 (2603:10b6:301:7b::24) by MWHPR0201MB3531.namprd02.prod.outlook.com
 (2603:10b6:301:7c::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Tue, 28 Apr
 2020 17:43:47 +0000
Received: from MWHPR0201MB3547.namprd02.prod.outlook.com
 ([fe80::10ad:5df5:d575:1f37]) by MWHPR0201MB3547.namprd02.prod.outlook.com
 ([fe80::10ad:5df5:d575:1f37%3]) with mapi id 15.20.2937.026; Tue, 28 Apr 2020
 17:43:47 +0000
From: Stephen Long <steplong@quicinc.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH RFC 1/3] target/arm: Implement SVE2 FCVTNT
Date: Tue, 28 Apr 2020 10:43:30 -0700
Message-ID: <20200428174332.17162-2-steplong@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428174332.17162-1-steplong@quicinc.com>
References: <20200428174332.17162-1-steplong@quicinc.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0043.namprd15.prod.outlook.com
 (2603:10b6:208:237::12) To MWHPR0201MB3547.namprd02.prod.outlook.com
 (2603:10b6:301:7b::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from STEPLONG.qualcomm.com (108.176.222.2) by
 MN2PR15CA0043.namprd15.prod.outlook.com (2603:10b6:208:237::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend
 Transport; Tue, 28 Apr 2020 17:43:46 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [108.176.222.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b6b9816-c621-4e33-b717-08d7eb9bb3f9
X-MS-TrafficTypeDiagnostic: MWHPR0201MB3531:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR0201MB3531FDF57F5F5985BD4046DBC7AC0@MWHPR0201MB3531.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:13;
X-Forefront-PRVS: 0387D64A71
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR0201MB3547.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(136003)(396003)(376002)(346002)(39860400002)(6512007)(6486002)(8936002)(186003)(16526019)(26005)(4326008)(36756003)(316002)(5660300002)(6916009)(86362001)(107886003)(6666004)(52116002)(6506007)(8676002)(956004)(2616005)(2906002)(66946007)(66556008)(1076003)(66476007)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TpMHrPQbpO2X7VAjaL480ilCgrJ6V5Kv+56ganQYK7zL8jRZSNtF968AEreh8cH/xw2r9uGA3X10ApHIGaS++FXrtE9Iq+67Id9tMlTB5pPqDEvKWlS/SfMJ/ftmrSwjqUFA8s9NuhrjcYV7UZTNp543g2Cdl/uTYddKEMw28UjwfYUUslWE9J/26gHwcDQAEJYBxI3/jA9qvIot1ZaA+NCNo0B3wCcTqVJbdPxMdSUgP42vrsUu/ktDTq3t6+wwVNp5F77KpEH9j09i6t7LPyZROyvXZnfuM7IvD0MeR5cjy1Fnu3iokSHQSxf7AHNwJGkQAeVobDUGxaAvSb0FVEylgl/yX/anBCgvBdmbHRT1NiWvgQF6kKg8LqPVGK/7xUkc096bwylfNbvdQQNwCuX24nHNlEJMvaS0l5u8DAwxGLbLaeO+pdlXWsAMAjeY
X-MS-Exchange-AntiSpam-MessageData: DvTK2DCvhILWyQiFeNgt4kqAV5u6bFzJEsusB3mTG8kgSe1HtUTW7YYOSSMxppdkE06r+Q9NQxspFhD/ITGBK84NF4Ou7ihDfOgDcxfHxUf3V/p1gWplvFAv7lccmBIBrbWpUWtqKNvpHdFQulZYWkyh6Ny53ZSOFhK6JqvNK2TidSbsToMrlO6dBgvbPT4GemjxdB0Vn66XOpzYJLlslUFp96W1KSPKA+kAf9Vi+xcVzek7cdhEvILk7VLofJTqnHYuaDM3fU/M++ntuj6ttBL8sDm7VWFbl5i9Eug8+QhUb1QeRl+ygSjBr7p12VnTSlLQrf3H2qoTuBRuEcZxRLfvgo52bQEyQQjJXdV40QDzI+rqs/8qr26RmwHAwFnnzjym7dqroIDr/TR6fBX+d4RNNOy+hUtKyZDX7z/7iIE7+uQVn9dmtlcEOMwm+jvbE/HmF3eVv67JRHY6Nm5sLnhoQCSazUFgOr2fRXPNGJ6A2G9kdTUQmUNF+/ohMoc8t07ayPGVeJAmjSCpgBlvqDpxVgJVmZiU5apNfpZKGQBGVt7jgne6+C7AV9z7Sq6JMvACT0n2KNWEmcKDkWyV+zaZCO5dnWAUV1VHS9MIr7g04F3YfnUW104Vm5OZk562wVc4AxsxX3uBTRgneF5ghk4YwhQ/XAUjY9tm9X8c5yB7iu7UPdVSgeLBfe+WlKOVDDa2F7DBLtHDrYU8uPtJqll7P9DSeXRdpHflxrfZLD9Y78lI942aVd8anso2qhxDgpkmUb5ANMROtJVFu+736M3K5QzbKVJrwHKd5SV1iG4=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6b9816-c621-4e33-b717-08d7eb9bb3f9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2020 17:43:47.0678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fp1r96wFEqiCAi7WoP8cjnjfjZKpjT4JNILKlmJ/y9of2D5lnE/yt5iMJFbzGINmzXBvXdCtorSXuUCmlxABXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3531
X-OriginatorOrg: quicinc.com
Received-SPF: pass client-ip=199.106.114.39; envelope-from=steplong@quicinc.com;
 helo=alexa-out-sd-02.qualcomm.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/28 13:43:48
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
X-TUID: npiAHfAaK4SD

Signed-off-by: Stephen Long <steplong@quicinc.com>
---
 target/arm/helper-sve.h    |  5 +++++
 target/arm/sve.decode      |  4 ++++
 target/arm/sve_helper.c    | 20 ++++++++++++++++++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 4 files changed, 45 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 6b64c844bf..154593f110 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2713,3 +2713,8 @@ DEF_HELPER_FLAGS_5(sve2_sqdmlsl_idx_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_sqdmlsl_idx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_fcvtnt_sh, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_fcvtnt_ds, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 22ed626784..355b8eec75 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1478,3 +1478,7 @@ STNT1_zprz      1110010 .. 00 ..... 001 ... ..... ..... \
 # SVE2 32-bit scatter non-temporal store (vector plus scalar)
 STNT1_zprz      1110010 .. 10 ..... 001 ... ..... ..... \
                 @rprr_scatter_store xs=0 esz=2 scale=0
+
+### SVE2 floating-point convert precision odd elements
+FCVTNT_sh       01100100 10 0010 00 101 ... ..... .....         @rd_pg_rn_e0
+FCVTNT_ds       01100100 11 0010 10 101 ... ..... .....         @rd_pg_rn_e0
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index b8c8d10c99..a35983b7cd 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -7570,3 +7570,23 @@ void HELPER(fmmla_d)(void *vd, void *va, void *vn, void *vm,
         d[3] = float64_add(a[3], float64_add(p0, p1, status), status);
     }
 }
+
+#define DO_FCVTNT(NAME, TYPEW, TYPEN, HW, HN, OP)                             \
+void HELPER(NAME)(void *vd, void *vn, void *vg, void *status, uint32_t desc)  \
+{                                                                             \
+    intptr_t i = simd_oprsz(desc);                                            \
+    uint64_t *g = vg;                                                         \
+    do {                                                                      \
+        uint64_t pg = g[(i - 1) >> 6];                                        \
+        do {                                                                  \
+            i -= sizeof(TYPEW);                                               \
+            if (likely((pg >> (i & 63)) & 1)) {                               \
+                TYPEW nn = *(TYPEW *)(vn + HW(i));                            \
+                *(TYPEN *)(vd + HN(i + sizeof(TYPEN))) = OP(nn, status);      \
+            }                                                                 \
+        } while (i & 63);                                                     \
+    } while (i != 0);                                                         \
+}
+
+DO_FCVTNT(sve2_fcvtnt_sh, uint32_t, uint16_t, H1_4, H1_2, sve_f32_to_f16)
+DO_FCVTNT(sve2_fcvtnt_ds, uint64_t, uint32_t, H1_4, H1_2, float64_to_float32)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5303d2e236..d410d0024e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8105,3 +8105,19 @@ static bool trans_SQRDCMLAH_zzzz(DisasContext *s, arg_CMLA_zzzz *a)
     };
     return do_sve2_zzzz_fn(s, a->rd, a->rn, a->rm, a->ra, fns[a->esz], a->rot);
 }
+
+static bool trans_FCVTNT_sh(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtnt_sh);
+}
+
+static bool trans_FCVTNT_ds(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtnt_ds);
+}
-- 
2.17.1

