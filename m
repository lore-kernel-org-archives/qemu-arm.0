Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp687255lfm;
        Wed, 22 Apr 2020 07:16:37 -0700 (PDT)
X-Google-Smtp-Source: APiQypIwvN9ZXq1lLF7gfR7wIdu96Nzi36SvbIkN2lZJ1Wc6JfpAMxIknIrCyyYSrL+KauFEKYVn
X-Received: by 2002:a0c:c590:: with SMTP id a16mr25201943qvj.21.1587564997616;
        Wed, 22 Apr 2020 07:16:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1587564997; cv=pass;
        d=google.com; s=arc-20160816;
        b=q/TxVJoTLioF8X8wLGxh1xsHlxm5rZfh8u5IQc025xCfhVpSzEhlwiFHdMaTTWM6Kj
         ozLZQM+UUKLWqKKMYLSpvl+832rNNNjv9yY0mfSJ64Ysh8v4aWk5KYKGOMQGHnz8E9Eb
         YRqdiXlSIk1BdpIYRg+CWDm2dkNP5mAlh+sf2249OzpM+NXUENoC/a8FaySN6u7eoSaD
         dZp4WGC/pUrVfe9tXyiNCeML2WZTR8VkaoHSbnVsUD7HitbLsW5nLsPIdX1NyLWf5U0m
         8z4tOQ45Doyyx20mOD3MWu9K2jmuaSggINGY8p6bFAHAQ/ryqV95GD5Qp2z8+K5u0lLn
         khjg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from:dkim-signature:dkim-signature;
        bh=wG2egIhf3BnLcVDdMkEzYOeJsfq60SQgxAN+lea+4r0=;
        b=mG+UiS2W2XlAYfLFs7Yt87sk1jV9Ih8jYDRoJcGdlvq6LHkxkVqR2r4e6zFPp7jI2k
         ZsVLKnxFrTIlqfl/DOXduFfymP8bdaW9/y3hOlIwHFUOA9HASBeEEFnrz/7LJ3VgCpni
         HSEpx5yOobk6u9aGVF4zoH1XRUJrWtI9GBn0O5epZQ2nG8fNk6QZbUmLifn5+ob1+wIB
         IzP+EFwyRg+MjMBSDDzrNard03hYtEu4TlqMWEkbekFrMjZ/fGIq2tUOClOLRykCQ+A/
         +ZztN8vkA8w38YsBh5JQ10EtBNwrKl7NivT5CfyRsa076CV1KFBPfA286gLLqX25Ho5M
         uRZg==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=fail header.i=@quicinc.com header.s=qcdkim header.b=fT58dQo4;
       dkim=pass header.i=@qualcomm.onmicrosoft.com header.s=selector1-qualcomm-onmicrosoft-com header.b=cUzRRUz2;
       arc=pass (i=1 spf=pass spfdomain=quicinc.com dkim=pass dkdomain=quicinc.com dmarc=pass fromdomain=quicinc.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k188si3383213qkb.381.2020.04.22.07.16.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Apr 2020 07:16:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@quicinc.com header.s=qcdkim header.b=fT58dQo4;
       dkim=pass header.i=@qualcomm.onmicrosoft.com header.s=selector1-qualcomm-onmicrosoft-com header.b=cUzRRUz2;
       arc=pass (i=1 spf=pass spfdomain=quicinc.com dkim=pass dkdomain=quicinc.com dmarc=pass fromdomain=quicinc.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1]:51584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRGB2-0002mf-UM
	for alex.bennee@linaro.org; Wed, 22 Apr 2020 10:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53768)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steplong@quicinc.com>) id 1jRGAm-0002bj-U6
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 10:16:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <steplong@quicinc.com>) id 1jRGAj-00087E-D0
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 10:16:20 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:14272)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <steplong@quicinc.com>)
 id 1jRGAh-0007vq-6g; Wed, 22 Apr 2020 10:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1587564975; x=1619100975;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=h6v9y1cj+6U/a4dGz//GeXuvQz/rb3gVH3KUNV539sA=;
 b=fT58dQo4SAb1IZTNBSDMv+wcp5jOcjYGE2KjtsTDNBXqdOwlZzJw7R6x
 ET4KeI8s7CKmRLt8hRigCbc3cc9F0zO/VlQ8s6G5l1w6LX5+6djGP+FRo
 G7K4sByZzSQzR3WpiIKegbotzoSAhALgzAn/WEJdKXabkVf0yPWVn6k4H I=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 22 Apr 2020 07:16:12 -0700
Received: from nasanexm03d.na.qualcomm.com ([10.85.0.91])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 22 Apr 2020 07:16:12 -0700
Received: from apsanexr02b.ap.qualcomm.com (10.85.0.27) by
 nasanexm03d.na.qualcomm.com (10.85.0.91) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Apr 2020 07:16:11 -0700
Received: from NASANEXM01D.na.qualcomm.com (10.85.0.84) by
 apsanexr02b.ap.qualcomm.com (10.85.0.27) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Apr 2020 07:16:10 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (199.106.107.6)
 by NASANEXM01D.na.qualcomm.com (10.85.0.84) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Wed, 22 Apr 2020 07:16:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JvZDGxyFxfmXctLVZbibWH4zusbOr44vGSQyNKJVhoxPSp7ptk3tjfGzc0nEdSpNkRZ3k0U6OZHV/P94dnCaiIr8nqeO5CJkiSyikYRyKQYGhUZ8HDjct82O+1L9qdhXnf4o/o7osOiAKS/Jj4KRcTT/c033jfZ5zCFY0/igR6nXkpqtjLuFw0NZapaiAucso5vu81TSW2OVxVNrsIv7NMIrQbEocuG7eduTE330iJiBs6eP0U5u5UwXQJ0Ugqg2JSQSa57XddX5k+eCtvklDgbRlY9AcLdUqP1+zI5WcqywGjCtIjwgPVJHXGjU4VVnyod4sPoXn6ho31jRNqv7Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wG2egIhf3BnLcVDdMkEzYOeJsfq60SQgxAN+lea+4r0=;
 b=Sd7G1A14J7A91aiMxdaGUYB5HQpkQ7RkkypNdxECPwFUOeoLfyLVhEd/4EWSbaTt9gyKrHbPEkInBXrW4bmPROYchyCZUP2bkcr5i+FnbJ5Nq7lzIyJu6eFq+PmYAwG3IikJdQ+6z3xJoIoGa8ZD2DmHGMHYukE8/vV+rupBQlrO8STaCMjUPGDGg60juqvFvn0/N7ooWSzy7LzN0qbrCt0lgo/h7vY5LkFHvs14N+b7BypZUwqAtYkL+OsM9/0GX3t9xdgjeRUKek0HQVC7xrcK9eYbjRJwk/+Py/8GbD2W12kyTp7/JudOr0qsjCh4GDrsQ9ezIn7bXR1R5Ctd6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wG2egIhf3BnLcVDdMkEzYOeJsfq60SQgxAN+lea+4r0=;
 b=cUzRRUz2rt49jvx+IWNckCcn36sw0WzNoOj+x6XR8MFIqFMK+2OKPLthjcdbF8aj4XqFRFFxZE6oluv+qTglAPJrZDTrrWoc5nN6Dxg8oD6z+z1RkBsirwCzPJeMnf3eLN9rvA+FLESvT9mMp2Mv4LH1B/TLtR1Y85FqwHKCSEU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=steplong@quicinc.com; 
Received: from MWHPR0201MB3547.namprd02.prod.outlook.com
 (2603:10b6:301:7b::24) by MWHPR0201MB3500.namprd02.prod.outlook.com
 (2603:10b6:301:80::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Wed, 22 Apr
 2020 14:16:08 +0000
Received: from MWHPR0201MB3547.namprd02.prod.outlook.com
 ([fe80::10ad:5df5:d575:1f37]) by MWHPR0201MB3547.namprd02.prod.outlook.com
 ([fe80::10ad:5df5:d575:1f37%3]) with mapi id 15.20.2921.030; Wed, 22 Apr 2020
 14:16:08 +0000
From: Stephen Long <steplong@quicinc.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2] target/arm: Implement SVE2 scatter store insns
Date: Wed, 22 Apr 2020 10:15:52 -0400
Message-ID: <20200422141553.8037-1-steplong@quicinc.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: BL0PR1501CA0003.namprd15.prod.outlook.com
 (2603:10b6:207:17::16) To MWHPR0201MB3547.namprd02.prod.outlook.com
 (2603:10b6:301:7b::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-L2LA14H.localdomain (108.176.222.2) by
 BL0PR1501CA0003.namprd15.prod.outlook.com (2603:10b6:207:17::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend
 Transport; Wed, 22 Apr 2020 14:16:07 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [108.176.222.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98b33b71-ee06-4f5b-7e6e-08d7e6c7b362
X-MS-TrafficTypeDiagnostic: MWHPR0201MB3500:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR0201MB35000D70E03C9A42B86B07CDC7D20@MWHPR0201MB3500.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:311;
X-Forefront-PRVS: 03818C953D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR0201MB3547.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(346002)(39860400002)(136003)(396003)(376002)(956004)(81156014)(2906002)(6666004)(6916009)(107886003)(8936002)(26005)(1076003)(6506007)(316002)(8676002)(478600001)(86362001)(6486002)(5660300002)(4326008)(36756003)(2616005)(186003)(16526019)(66946007)(52116002)(66556008)(66476007)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FDUue5kKEXncTyJ9Cp3qTnC6YzpHEDqUrhFlS2NzPabSqS8khc9ZCvO6M+eunkm8fqgktl0o/HU3MWS7EbyHzvWFL/TX7FNe+ClPtZcDqCOYd3jau3RChIapwb1rCD22x65fhRO3/iYd7h9KQf1YZD9die1hV9D1tR6M5Q9hj1dupsaH5vwfRkPI2f8O4xhj2q5p5q2QxAFnkwIqY1iWBHZU7ZsAZyrBJrYb6rYHNQcW5msk8N4YgUL6QLQ8UAZ+6+S60IetS0nksP19sSm14gLwkqxYyRjA/y9xLCeRc/On1zSLEzpdF6pp/E5vwFZXVzyhqQu2tvbhL07iz6eWZ0N9TkqGNfb/FR6QIT/QpO8pD/oLuBAAqvm+Hb7a79f0LgZV6VyK2nueAlbY66IUi2LUSCqR48FtxRt2oyB1aoNgzz49/Jwe1EFpIVK7ltU/
X-MS-Exchange-AntiSpam-MessageData: zZUAj+nH0vORW3IiV8gZRP6GiBd+7JKUPSfPWclzHlMtZurSqhNsi+0HKy0/Uxy+6FC3oaafeFaaL3WabJPtD2duH/iUxpoNxE8ngtipiVP1Get/5i5xRxqHQ1lMz9yK5gn0l70hRmbO7qClti4zzg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b33b71-ee06-4f5b-7e6e-08d7e6c7b362
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2020 14:16:08.0370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CIJB7J8SJ7iRg1bL/F5CMOWlpmbFGxATzTKm5HMZwrO3y5GWMDq+BaqAZOFFrKxUh40a4eo21DTvQVLsvuwn8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3500
X-OriginatorOrg: quicinc.com
Received-SPF: pass client-ip=199.106.114.39; envelope-from=steplong@quicinc.com;
 helo=alexa-out-sd-02.qualcomm.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 10:16:12
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
X-TUID: wkAh6k6XwSDm

Add decoding logic for SVE2 64-bit/32-bit scatter non-temporal store
insns.

64-bit
* STNT1B (vector plus scalar)
* STNT1H (vector plus scalar)
* STNT1W (vector plus scalar)
* STNT1D (vector plus scalar)

32-bit
* STNT1B (vector plus scalar)
* STNT1H (vector plus scalar)
* STNT1W (vector plus scalar)

Signed-off-by: Stephen Long <steplong@quicinc.com>

Cool, it seemed to typedef correctly.
---
 target/arm/sve.decode      | 10 ++++++++++
 target/arm/translate-sve.c |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index dd987da648..ef5dd281a6 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1387,3 +1387,13 @@ SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
 ### SVE2 floating point matrix multiply accumulate
 
 FMMLA           01100100 .. 1 ..... 111001 ..... .....  @rda_rn_rm
+
+### SVE2 Memory Store Group
+
+# SVE2 64-bit scatter non-temporal store (vector plus scalar)
+STNT1_zprz      1110010 .. 00 ..... 001 ... ..... ..... \
+                @rprr_scatter_store xs=2 esz=3 scale=0
+
+# SVE2 32-bit scatter non-temporal store (vector plus scalar)
+STNT1_zprz      1110010 .. 10 ..... 001 ... ..... ..... \
+                @rprr_scatter_store xs=0 esz=2 scale=0
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 29532424c1..4873e25182 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6038,6 +6038,14 @@ static bool trans_ST1_zpiz(DisasContext *s, arg_ST1_zpiz *a)
     return true;
 }
 
+static bool trans_STNT1_zprz(DisasContext *s, arg_ST1_zprz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return trans_ST1_zprz(s, a);
+}
+
 /*
  * Prefetches
  */
-- 
2.17.1

