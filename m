Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2725576lft;
        Mon, 27 Jun 2022 15:33:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u2on61wLBua3/ldwFTLIn/4i5UosZMOs6jriM2baH2jmRRRRuS6rp1+8Q4h+W7kUgy0hXI
X-Received: by 2002:a05:6214:628:b0:470:afcc:a9f5 with SMTP id a8-20020a056214062800b00470afcca9f5mr380294qvx.92.1656369212487;
        Mon, 27 Jun 2022 15:33:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656369212; cv=none;
        d=google.com; s=arc-20160816;
        b=qrjTR0ZmYhfgmSX5a0K8cJDsg1PtR3YyTybkGsVmbVarkkxuGNajY2x3SpcEv8t3gn
         XzBH70nQ3Oc1waoDZguq5A744UuDIQSTTZpdKt/bLQRxprjAE+X8wjrqoHx8/rtrDZXB
         jQNPUR/Azt33xIuRbElTejSice0E5MPq/yh6jay5xgnSRuGyKI09kPNOlZr4L6sA4dx7
         IO3+igCWYNiyomwtrd619u1cHYSN5ULmtv3I7RMlxZtk3MKVur78xw+YarEEbgg5aKNl
         OGohbnxYkl+0DGF2e0cITipfL4dQxCURbJh9o4Ct7BbF1TEjY1xbUG7w2P6OJkRYgYIm
         qoKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Bw7XoG6awIMmvJr5R9bCVLNrhcgYvu83aW4B8DXh7oY=;
        b=Xv9PJttAYfCLLAfcZTVF5VlCmfgxNQzCyXsTVhPpc9tkYkSQW6bTWzLNTIw/P/LvQX
         /+TJgAe4Szc5B/4DI6gOcpWOv87iaOAICXKtvTLl2XhXl7Xl3fr/6/SK7ofATvUsuZvv
         JwEZZ19zASHNWqs8WhJHvBLt/5lvatJMYgVgbyXWVbHUPPXFQI/2TIsd5gmeWF6DuyxL
         +34DU84xv7+9kOs3yquGaWtUixjyVkDkVeIc9aMNaPaQkg37BqO3Clnvuxk0u2dXVYt5
         oR9qLfBieggCqvad1PFGHPv/yaoNbWfqah8q9aO0FU9i7SuqHgCASabZP765re34d4Un
         mG1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=WEkwCru5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9-20020a0562140cc900b004463873b601si5893082qvx.533.2022.06.27.15.33.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 15:33:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=WEkwCru5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:41966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o5xIR-0003N2-Us
	for alex.bennee@linaro.org; Mon, 27 Jun 2022 18:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5xHR-0003It-8A
 for qemu-arm@nongnu.org; Mon, 27 Jun 2022 18:32:31 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:7886
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5xHD-0006Tf-2O
 for qemu-arm@nongnu.org; Mon, 27 Jun 2022 18:32:25 -0400
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 25RJ1eYm019490
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 15:32:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=Bw7XoG6awIMmvJr5R9bCVLNrhcgYvu83aW4B8DXh7oY=;
 b=WEkwCru5UZrL2qlBjeSCubvp8fByg2jdkKc2bgknPSIdiv9efu8DFksl2ONEjC8T+qoU
 8WMZ9UaT102qJXERJ2Lewn4Fe6P1CmavmBvYKcEDCGZUZn6f85W6jGV9/qwUzDLccceB
 +OYa7EIjLTm4Q0kgG/Fe49fcia89EMuamM0= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0001303.ppops.net (PPS) with ESMTPS id 3gwx1v64k3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 15:32:13 -0700
Received: from twshared6447.05.prn5.facebook.com (2620:10d:c085:108::8) by
 mail.thefacebook.com (2620:10d:c085:11d::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:32:12 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 586E28D319DE; Mon, 27 Jun 2022 15:32:07 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, Peter Delevoryas
 <pdel@fb.com>
Subject: [PATCH 13/14] aspeed: Add intel-me on i2c6 instead of BMC
Date: Mon, 27 Jun 2022 15:27:36 -0700
Message-ID: <20220627222737.1011989-2-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220627222737.1011989-1-pdel@fb.com>
References: <20220627195506.403715-1-pdel@fb.com>
 <20220627222737.1011989-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 82Cnxphc88q2b9lOhOgrxaH5oNnR0VyZ
X-Proofpoint-GUID: 82Cnxphc88q2b9lOhOgrxaH5oNnR0VyZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=71779173e5=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: s9gfjU6knrwk

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/arm/aspeed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 88e9a47dc2..375d87e6c7 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1448,6 +1448,7 @@ static void oby35_cl_i2c_init(AspeedMachineState *b=
mc)
     i2c_slave_create_simple(i2c[1], "adm1272", 0x40);
     i2c_slave_create_simple(i2c[1], "tmp421", 0x4c);
     i2c_slave_create_simple(i2c[2], "intel-me", 0x16);
+    i2c_slave_create_simple(i2c[6], "intel-me", 0x10);
     i2c_slave_create_simple(i2c[4], "isl69259", 0x76);
     i2c_slave_create_simple(i2c[4], "isl69259", 0x62);
     i2c_slave_create_simple(i2c[4], "isl69259", 0x60);
--=20
2.30.2

