Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4652642lfm;
        Mon, 27 Apr 2020 14:41:35 -0700 (PDT)
X-Google-Smtp-Source: APiQypJrkJy7KWRLiotrtEaZFDF2eRLaAPvQDVuid7T/wPCS0kO+S9n/B4C3T5UCskhyw//Rem2D
X-Received: by 2002:a05:620a:1370:: with SMTP id d16mr23458818qkl.233.1588023695167;
        Mon, 27 Apr 2020 14:41:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588023695; cv=pass;
        d=google.com; s=arc-20160816;
        b=SDL3gfLfuOz1WojuMCLf5SS8fS/a/Qz8uULFQxQQIJBdt5tNkdAHGSUqIbr4CQytxY
         psENKbuj2qVsFXC6rCVJyrZG4gbLl56hiROxLQShUvpFU9/B+tYot4N36u6M5i767pe0
         uqulL2ck17QZ7e8O5/8lzYI8ewZpFlcQG+o4bYRNpmnAVdrz8S8rfJtDhmY0IWfZJe1Z
         LimdVrqoEFmdDRVqkC3uUHm1V33nf8jEnPvXxFbOJcZgGJe2DufUMvQVNqL3fq7Hr65L
         IYxQAoIxgYtuIn+QNEN4JTtdR3GF4AW5QNRFJqsx6rlJNnUI5A8BbO+DTklwHqN8AR++
         O8HQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from:dkim-signature:dkim-signature;
        bh=rMj4Sni8n53+S50wB6ywMbuOmQ2XXZnDuH9edwq07jg=;
        b=HeOvN7HSe2/WikGU7ne0fNEp4G9tkCWtgQc0+Fm1FeFk5ob7VdA3PDNcJLsk5QHtlB
         g/vkn0o/nyxR+hTAl8vDW5kp+7WQUV0r1hVkCaM4MYsKk1x7428yT52eBeawVJoJ38GM
         L7gzf8On7ob03aBJSL4B8Coj7pgQxbV3XjwhMU3IxUqZ4IUxfhn+D3O8Uf+RHv7Z1QST
         Hb997A64hk1WZpiq7E/CIM9dnIT150e+QikWQRMPwGa9gonG6+Uz7ujVJ5NUTprcrIKh
         gvKti6phfnk6KROdZl2ponVIRBBSAmZCCUPkPhnw4HxvORd+IGfvJeCFwgQSo7aCTlis
         nLxA==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=fail header.i=@quicinc.com header.s=qcdkim header.b=t43w5G2T;
       dkim=pass header.i=@qualcomm.onmicrosoft.com header.s=selector1-qualcomm-onmicrosoft-com header.b=RGh33Ghi;
       arc=pass (i=1 spf=pass spfdomain=quicinc.com dkim=pass dkdomain=quicinc.com dmarc=pass fromdomain=quicinc.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w20si9620175qvl.205.2020.04.27.14.41.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Apr 2020 14:41:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@quicinc.com header.s=qcdkim header.b=t43w5G2T;
       dkim=pass header.i=@qualcomm.onmicrosoft.com header.s=selector1-qualcomm-onmicrosoft-com header.b=RGh33Ghi;
       arc=pass (i=1 spf=pass spfdomain=quicinc.com dkim=pass dkdomain=quicinc.com dmarc=pass fromdomain=quicinc.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1]:34362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jTBVO-00075S-8E
	for alex.bennee@linaro.org; Mon, 27 Apr 2020 17:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33230)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steplong@quicinc.com>) id 1jTBV8-0006tq-77
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 17:41:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <steplong@quicinc.com>) id 1jTBV6-0003a1-Lo
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 17:41:17 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:18991)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <steplong@quicinc.com>)
 id 1jTBUy-0003YO-Si; Mon, 27 Apr 2020 17:41:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1588023668; x=1619559668;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=jCmMY3DNt6TGecRkT08nqLfuZytCGQb9zOfQRttBkhY=;
 b=t43w5G2TdbcUx9mwEQdQMUNY9Hthhyj7FSZS+xTwGXVdvlqF68ypWqoS
 spUMypXCiTfN6j5JjUEm7CX4G0aooDVEX+EY5kypHph/ICWOZSoleml5Z
 /hbBXio5jui5QKxNlUsJfe7A0OlL9+dnG6scGDL5S5UEHecQLKX+qymO6 w=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 27 Apr 2020 14:41:06 -0700
Received: from nasanexm01f.na.qualcomm.com ([10.85.0.32])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 27 Apr 2020 14:41:06 -0700
Received: from eusanexr01a.eu.qualcomm.com (10.85.0.97) by
 NASANEXM01F.na.qualcomm.com (10.85.0.32) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Apr 2020 14:41:06 -0700
Received: from nasanexm03g.na.qualcomm.com (10.85.0.49) by
 eusanexr01a.eu.qualcomm.com (10.85.0.97) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Apr 2020 14:41:04 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03g.na.qualcomm.com (10.85.0.49) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Mon, 27 Apr 2020 14:41:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZqqp/B+l5ITlwFI5q1G5la1VgWeSNqmwRutCMJWVHyhT/rnv6Z9LWB9VZgcEqgzseoxqSBTk1iJ+Dl+OSaQuydqMypkvswL5CqhDInT3xrA1nkQJuKU3omPIEA7QdOoxLdf2yXuoIsKPKOoXt0UyYvVllfWLDyFzfz/nZq/cQGqrQYRA/KVMjJjIwkJDbwQQQyQT4jxMgtQj2gfosy0uEIWtaT4hthbffix2hjsUGiHzHqJ6E/vuE1odhYbB1tstXys1sxXo9T16RI/KO5BDEv5EaNje7lbJSu/1rkaJcCK4ioa4zgnUd7+rEU0I0C1rqE0+Ru22ug4fVc5pMPDHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMj4Sni8n53+S50wB6ywMbuOmQ2XXZnDuH9edwq07jg=;
 b=OQrjG9JyIMgaeOhNHkc9rWkCLFrvhYGm+8M1N60pAnCK6B3pyrwFS88AG7hdDakzz3bRQgcZJv/x1kh332P3fZ5fs9v9Vicyo+uSYX2HGU9yHSgyBykMO37zRi8NNzoBQt1Vd8mXCau+kNufPcpHwi7fNoJw4Sm39EAu85VMCVwfXy2xKICgjHWsX0xDsPV84VM5vDNqtl+odHan1GSaIzpA9X7CL/9wp5iLstedx9vM18WuOs0ULBox1yo+FYjNbZE1scFFW8LPKxKklczRoeU1YUWg8IlQHpILVOivl0f12M2ICjeQxTPa0H5fr9ljMotlOHLsiI/yfd+kQihj/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMj4Sni8n53+S50wB6ywMbuOmQ2XXZnDuH9edwq07jg=;
 b=RGh33GhiP5LsiRkxrQqJ/qKgDvQt6mqC5JtIkuMfHaAJqklzO81qT9QsAquUGjyEvZiJEmGpxQhYNSrRfQq0c7pKQql7o9SMrP+fLuX9ryleH5lURhtSONGouvV/JOVymcQgvLkD8DHq/3k3qSc1UKiWAJY4F65HO/+adD1ftWs=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=steplong@quicinc.com; 
Received: from MWHPR0201MB3547.namprd02.prod.outlook.com
 (2603:10b6:301:7b::24) by MWHPR0201MB3577.namprd02.prod.outlook.com
 (2603:10b6:301:76::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Mon, 27 Apr
 2020 21:41:03 +0000
Received: from MWHPR0201MB3547.namprd02.prod.outlook.com
 ([fe80::10ad:5df5:d575:1f37]) by MWHPR0201MB3547.namprd02.prod.outlook.com
 ([fe80::10ad:5df5:d575:1f37%3]) with mapi id 15.20.2937.023; Mon, 27 Apr 2020
 21:41:03 +0000
From: Stephen Long <steplong@quicinc.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH RFC v3 0/3] target/arm: Implement SVE2 Crypto Extensions
Date: Mon, 27 Apr 2020 14:40:43 -0700
Message-ID: <20200427214046.31401-1-steplong@quicinc.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: MN2PR12CA0014.namprd12.prod.outlook.com
 (2603:10b6:208:a8::27) To MWHPR0201MB3547.namprd02.prod.outlook.com
 (2603:10b6:301:7b::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from STEPLONG.qualcomm.com (108.176.222.2) by
 MN2PR12CA0014.namprd12.prod.outlook.com (2603:10b6:208:a8::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.13 via Frontend Transport; Mon, 27 Apr 2020 21:41:02 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [108.176.222.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82accb84-f6cc-4dc9-8d27-08d7eaf3aecb
X-MS-TrafficTypeDiagnostic: MWHPR0201MB3577:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR0201MB35779AEBCCB4A901D00B3646C7AF0@MWHPR0201MB3577.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0386B406AA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR0201MB3547.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(376002)(366004)(346002)(396003)(136003)(6666004)(2616005)(478600001)(36756003)(6512007)(107886003)(66556008)(2906002)(66946007)(6486002)(66476007)(4326008)(316002)(1076003)(86362001)(6506007)(8936002)(81156014)(26005)(8676002)(16526019)(956004)(186003)(4744005)(52116002)(5660300002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SiDQHBMXnr/2QjEo8mmc0w0In8HM1AYoxeHSKaLW7QD7LVB6gbfwHXqGo9i+w0f+yaBNTk/2xlGSGnpiuoMbEzaVyWW2EZ7425CsnEK0fCigq+oTE4I8mfKhohpA0H5XKW6wGNTTwxyzSL8E8i0RvctDOqoYu13UXg5ZzcDBOlo33OIHX2fJmOWTYiNDQ6i7zycWYFp9CzoWtvM3HPqhsyY0gLzoI0IGR8rt1Od+Hj/efmk40NwI2VKdAgIBFKQeWnhn9g/fFcH4VGnskMJzxY7bY9Up0J0VGhp5UrTgv0UvDKSC05+HXGmPKMA8McKygR2exfJt+/hu39mN8LY9wkt4E29Bphggfj4gHySbHYStO5cho0qEl341VXe2tTCtiaNxpe8hqDav/qef8TFuZju5SubHrw/b2EgeEx2oz0vpQc3RcF8zQu42KF7ojmLH
X-MS-Exchange-AntiSpam-MessageData: RlgTdRrmqXGKicE97axuZRTVqxa6+HRKrNqQYK/134xBxfnpwUpzwb4j07/5SpRDqVW7w4eOb8JYY2DXIjsASUiJHl6aLrHoxi/e2L2td3fQobUfmc077ki4mQhHAOTD1IjsNNICIG35FtRej0ZcHPkYv3HbFv4qux1meF3d0KcsBpViCateEJ2uS+CAKtOF7V2WUa7KnzubH4Oi9P/6MbAjOPgVOQzN5QVbWYidRUejbs87wihDyo3W7ndsPX08aTOwhL6x6flAKe0U2cYTcaeCZ+K9kdx5f86OQb8XwKgaSTjBxqM5qlXKvMhfgWCEP9LOmMa6PkXd7JuypIv14/RmoD/brFParpn/WTaHNEqSU94oq+a1gArit8FvRhWXaQWLsHbiCOWJoLQJsVaQ+TRnA4F7JMdlzSNjrkqjFUZyi55PZP8idfrFH+HCR/RDl29JBb/AbLesXji05sqSMf6NYDrbv4TGASbF8zhqa4GOJw2juDnGQaJ2ZPvWC+bRRt1y2vhSwG1QqQw2LGjAlRpEFDHt6lYfOLGeZUUvXuslofe2GM7v5XuW2hhjvqoWGrKalrZuKQ898Wa+/m5dBGqul/rpkkJh64GOvjTl8AMWXQngWGD+ylhll2phI9mOE7DgmiVP8MZ2QOEZnUkFgdC9G2LY23zwtbetfot8bKhy9GTfHCvFkpK/eIridRGLfLdSUF+MTcrzF9k/S1ZU/g/qh4O258N/7idU81fVvSYbkovaAKANHOmeycbj4A1OP1PcVFq+7uZzIzzv4XRC5CedcRYfr69a93HaYUDUETc=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82accb84-f6cc-4dc9-8d27-08d7eaf3aecb
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2020 21:41:02.8881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TxeT655Zeza2Gpxvcc95SXVU3wD+PtrLSjHHDl7PsWXuqowW7iYDE+quiQP52j+3joHKIahRxKq7oKbchI4+dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3577
X-OriginatorOrg: quicinc.com
Received-SPF: pass client-ip=199.106.114.38; envelope-from=steplong@quicinc.com;
 helo=alexa-out-sd-01.qualcomm.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/27 17:41:06
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Received-From: 199.106.114.38
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
X-TUID: 6cKGBEIB3CtQ

Modified some of the crypto functions in crypto_helper.c to take in a
desc parameter.

Didn't add a desc parameter to SM4E and SM4EKEY since it is used in
translate-a64.c and the functions in there need crypto_sm4e and
crypto_sm4ekey to stay the same type (i.e. take 2 or 3 parameters)

Stephen Long (3):
  target/arm: Implement SVE2 AESMC, AESIMC
  target/arm: Implement SVE2 AESE, AESD, SM4E
  target/arm: Implement SVE2 SM4EKEY, RAX1

 target/arm/cpu.h           |  5 +++
 target/arm/crypto_helper.c | 86 ++++++++++++++++++++++++--------------
 target/arm/helper-sve.h    |  3 ++
 target/arm/helper.h        |  2 +
 target/arm/sve.decode      | 20 +++++++++
 target/arm/sve_helper.c    | 16 +++++++
 target/arm/translate-sve.c | 64 ++++++++++++++++++++++++++++
 7 files changed, 165 insertions(+), 31 deletions(-)

-- 
2.17.1

