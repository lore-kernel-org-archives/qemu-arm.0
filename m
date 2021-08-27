Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1995366lfb;
        Fri, 27 Aug 2021 15:37:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHgRFWZPjbvRvvDspnYdJKMre8sV0fcVq3aPSQrTVNEysik/ZbrZ5xU9VtECMOy7oqeChT
X-Received: by 2002:a9f:23d0:: with SMTP id 74mr9618590uao.69.1630103871953;
        Fri, 27 Aug 2021 15:37:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630103871; cv=none;
        d=google.com; s=arc-20160816;
        b=MQu6q9W+vMETjfTW7T7ocL/M24U/fmGmzy8UyPhyvHCBwn7wGvh7MRo3jAK6S5JX4L
         Tq3pbuNt/gx19B/L2Sy5GtpxhDdfi/OSehGotq1y03uCppKFv+u0u7DEJRbBHF1/OQUX
         Z6+WoT5DnvNxugOk2+njGGTUrcF3213co3mn7cnF/GCy7guyFEqlQ8Pphgnql0Bu3aqH
         GeiZrgAJVRH7layQFsWHBH9nILf6Kdzn+FmxVE6hEiftGS7HdwpugZsFrctUKawoQzpS
         TeyStUemjCOTliIYeUtmkSTTAptrxgVcPvPGVraYcFIC3JQlWB4YQygBC1KRaht9N9cv
         hSTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IzrchiaM8+qj0Z5lGqkXZbKy57ldr9wgajCVCWCdVXY=;
        b=kbXnrt5u3sWVq92TXC7jobxJGUvsOStkvYr2GbLjf8wETBz44M2kbAud7+J7RcRIih
         5I5TspqgkR2DUJl9H8o7ms6Djv1NGPo7Uv/3EPD2myyFTETIrFbgjGyu3ZpM5ENaqy6l
         Vpa9M0j8V8N4wAp2pdZemXh4mqa7HUM+atf16nzqYYQ7zK+egpCPLdOXX4qHltYCiQBp
         ADnTkUdErddZeHJxoIlIDbUwuz9tQxT1XcrxrDeZsAnxLHmjd5Xe3gg5ZFurg01wqbHl
         J4tPyPbQracxWNMiPVzwX6r4SZoRySJdET85857Jzm7PM0IkPUDa+7Tp0SiDBSFmrzf4
         Di+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=nd3arV3W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h74si3917211vke.26.2021.08.27.15.37.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Aug 2021 15:37:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=nd3arV3W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:40202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJkTv-00068Z-6B
	for alex.bennee@linaro.org; Fri, 27 Aug 2021 18:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=78736a82b9=pdel@fb.com>)
 id 1mJj3U-0006YZ-Ie
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 17:06:28 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:61386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=78736a82b9=pdel@fb.com>)
 id 1mJj3Q-0003Fx-Lt
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 17:06:27 -0400
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17RL6KMJ032729
 for <qemu-arm@nongnu.org>; Fri, 27 Aug 2021 14:06:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=IzrchiaM8+qj0Z5lGqkXZbKy57ldr9wgajCVCWCdVXY=;
 b=nd3arV3W8R2giNJv0S6yeKyAXgNSyIEaezL7U37s3DU2FBf3Q182uJjSY9OqfQf7d3qa
 fIct9cgvW7lLBzqnyhtitAF03v83e2aQh8PoV0mOaiY8tPspX4B0Alfp4aSak476KsGS
 zoNU0Szr8p0YJ+pD9g5+cYUiHgm9QC/RhME= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3apfpfrk0a-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 27 Aug 2021 14:06:23 -0700
Received: from intmgw001.27.prn2.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c085:21d::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 27 Aug 2021 14:06:16 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id AECD2E74C1B; Fri, 27 Aug 2021 14:06:14 -0700 (PDT)
From: <pdel@fb.com>
To: 
CC: <clg@kaod.org>, <joel@jms.id.au>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, Peter Delevoryas <pdel@fb.com>
Subject: [PATCH 3/5] hw/arm/aspeed: Add fuji machine type
Date: Fri, 27 Aug 2021 14:04:15 -0700
Message-ID: <20210827210417.4022054-4-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210827210417.4022054-1-pdel@fb.com>
References: <20210827210417.4022054-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-FB-Source: Intern
X-Proofpoint-ORIG-GUID: b7xNyvhpirV770U9d9cYo5K0EuhXD9-9
X-Proofpoint-GUID: b7xNyvhpirV770U9d9cYo5K0EuhXD9-9
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-27_06:2021-08-27,
 2021-08-27 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 mlxlogscore=989
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108270125
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=78736a82b9=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 27 Aug 2021 18:37:28 -0400
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1FuRSFmCRoLb

From: Peter Delevoryas <pdel@fb.com>

Fuji uses the AST2600, so it's very similar to `ast2600-evb`, but it has
a few slight differences, such as using UART1 for the serial console.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/arm/aspeed.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index ff53d12395..d2eb516a1d 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1029,6 +1029,15 @@ static void aspeed_machine_rainier_class_init(Obje=
ctClass *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 };
=20
+static void aspeed_machine_fuji_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+    AspeedMachineClass *amc =3D ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc =3D "Facebook Fuji BMC (Aspeed AST2600, Cortex-A7)";
+    amc->serial_dev =3D ASPEED_DEV_UART1;
+}
+
 static const TypeInfo aspeed_machine_types[] =3D {
     {
         .name          =3D MACHINE_TYPE_NAME("palmetto-bmc"),
@@ -1078,6 +1087,10 @@ static const TypeInfo aspeed_machine_types[] =3D {
         .name          =3D MACHINE_TYPE_NAME("rainier-bmc"),
         .parent        =3D TYPE_ASPEED_MACHINE,
         .class_init    =3D aspeed_machine_rainier_class_init,
+    }, {
+        .name          =3D MACHINE_TYPE_NAME("fuji"),
+        .parent        =3D MACHINE_TYPE_NAME("ast2600-evb"),
+        .class_init    =3D aspeed_machine_fuji_class_init,
     }, {
         .name          =3D TYPE_ASPEED_MACHINE,
         .parent        =3D TYPE_MACHINE,
--=20
2.30.2

