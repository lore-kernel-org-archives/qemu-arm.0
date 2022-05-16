Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1793585lfj;
        Sun, 15 May 2022 23:31:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyL/Erv91KYTNRoNr1SyUc5luqZMmDf8aOcpXZHzlGQbxzkJwyg6Vq66TIDOnovsjlD5PJi
X-Received: by 2002:a05:622a:651:b0:2f3:b1b2:4702 with SMTP id a17-20020a05622a065100b002f3b1b24702mr14270090qtb.239.1652682705181;
        Sun, 15 May 2022 23:31:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652682705; cv=none;
        d=google.com; s=arc-20160816;
        b=cq+SzjIZJK4CxEeqJ3zCjEK5v51cRw4NaYKO7pqUYpmS0scgVrYeXfdqFlYkJehOmM
         1CyurX0sDINFzbaShdei9AVF91YwY6CLYy46uePUwNmv2I6+hpRIXZ6on8P/lPLsPee+
         J81q/QnHP929ijgR/QLxtK1sPAzcKfOcc6dsCpli8187sEm8zGQuyc25DxCNmL21DMOW
         aQsBmu5gUhqnCO1CK7Po/thVzf+aTidklJaiVE6RzCmfnFkqY5xmGU03r0/eGi4Do4Pj
         r++CvKtvjtQyWUhR9rz/3ZEaDI1lXhvFpO+JebsrRxY8fvtp1HpCKnZ4LiYLyhD92sEo
         pyIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MhV2WzQFftexu84+S3Sz45mHbW9FTIjUzPcUF4rPqx8=;
        b=Lx4g+j7+GAlkIuToAWR1B4SoMzEu6CY3Mm/Z3ncO5xmzqr1AOo7khlmokFl2bl7e9e
         Q2MAgWZqGZE7TP9VeNv7TwYNXPWRTvKT1b1NDQRrrN4Pcd36G4nayeUIDQy8VI1y0TsO
         zcLH7DGO9l9gbN4/T2bJHCvCCaOP3zz22VKsx2XQnjqAhsKOxIdM1gGJlUVFBNZqVAXl
         zuB+scyhetsDR5SDV3oTty05e6HIp4DJqziopSleVpDJ+C8L+zjyU0ZexQ7+xLKd/FhM
         QMtH+HBAUBCQ7v6l5nJx18q/Q2Y/2KUcllrQNsY1y/2kfvRHgGyde8Q2JFt0JafhUrLZ
         f6Vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=nmPPW2Wj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13-20020a05620a280d00b0069fbb1b3ec0si7564083qkp.648.2022.05.15.23.31.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 May 2022 23:31:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=nmPPW2Wj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:37428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nqUGc-0005Nr-S3
	for alex.bennee@linaro.org; Mon, 16 May 2022 02:31:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6135bb9a91=pdel@fb.com>)
 id 1nqU93-0007Is-Ej
 for qemu-arm@nongnu.org; Mon, 16 May 2022 02:23:56 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:42632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6135bb9a91=pdel@fb.com>)
 id 1nqU91-0007RN-Oy
 for qemu-arm@nongnu.org; Mon, 16 May 2022 02:23:53 -0400
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24G0dSZL014361
 for <qemu-arm@nongnu.org>; Sun, 15 May 2022 23:23:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=MhV2WzQFftexu84+S3Sz45mHbW9FTIjUzPcUF4rPqx8=;
 b=nmPPW2Wj5Js2ejrFTyIapeFUNOmSdAE8gkDlsNn//8AX62VyZp3puMU6StWh/eId23g7
 rs3eRhPoxwQhYnpZbnAHQzVPSqT8LFHBkc3EcWrVE+uTEpUceV4+lYJKcHCIZspNGtJK
 ZBpHSyOPGe7dnZMt/FayY95HI4zWAR0rZ88= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3g2a5y78tg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sun, 15 May 2022 23:23:50 -0700
Received: from twshared31479.05.prn5.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sun, 15 May 2022 23:23:49 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 0CDC764DCAC6; Sun, 15 May 2022 23:23:30 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <irischenlj@fb.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, <clg@kaod.org>, <zev@bewilderbeest.net>,
 <openbmc@lists.ozlabs.org>, <andrew@aj.id.au>,
 <peter.maydell@linaro.org>, <joel@jms.id.au>
Subject: [PATCH v2 2/5] hw: aspeed: Add uarts_num SoC attribute
Date: Sun, 15 May 2022 23:23:25 -0700
Message-ID: <20220516062328.298336-3-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220516062328.298336-1-pdel@fb.com>
References: <20220516062328.298336-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: b6S6UPI2C4V0dT0BEsj-Pet3m2zI0Sdb
X-Proofpoint-GUID: b6S6UPI2C4V0dT0BEsj-Pet3m2zI0Sdb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-15_11,2022-05-13_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=6135bb9a91=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: sVvggmm54XKd

AST2400 and AST2500 have 5 UART's, while the AST2600 and AST1030 have 13.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/arm/aspeed_ast10x0.c     | 1 +
 hw/arm/aspeed_ast2600.c     | 1 +
 hw/arm/aspeed_soc.c         | 2 ++
 include/hw/arm/aspeed_soc.h | 1 +
 4 files changed, 5 insertions(+)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index fa2cc4406c..bb8177e86c 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -301,6 +301,7 @@ static void aspeed_soc_ast1030_class_init(ObjectClass=
 *klass, void *data)
     sc->ehcis_num =3D 0;
     sc->wdts_num =3D 4;
     sc->macs_num =3D 1;
+    sc->uarts_num =3D 13;
     sc->irqmap =3D aspeed_soc_ast1030_irqmap;
     sc->memmap =3D aspeed_soc_ast1030_memmap;
     sc->num_cpus =3D 1;
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index f3ecc0f3b7..a9523074a0 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -588,6 +588,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass=
 *oc, void *data)
     sc->ehcis_num    =3D 2;
     sc->wdts_num     =3D 4;
     sc->macs_num     =3D 4;
+    sc->uarts_num    =3D 13;
     sc->irqmap       =3D aspeed_soc_ast2600_irqmap;
     sc->memmap       =3D aspeed_soc_ast2600_memmap;
     sc->num_cpus     =3D 2;
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 96bc060680..7008cd1af7 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -490,6 +490,7 @@ static void aspeed_soc_ast2400_class_init(ObjectClass=
 *oc, void *data)
     sc->ehcis_num    =3D 1;
     sc->wdts_num     =3D 2;
     sc->macs_num     =3D 2;
+    sc->uarts_num    =3D 5;
     sc->irqmap       =3D aspeed_soc_ast2400_irqmap;
     sc->memmap       =3D aspeed_soc_ast2400_memmap;
     sc->num_cpus     =3D 1;
@@ -516,6 +517,7 @@ static void aspeed_soc_ast2500_class_init(ObjectClass=
 *oc, void *data)
     sc->ehcis_num    =3D 2;
     sc->wdts_num     =3D 3;
     sc->macs_num     =3D 2;
+    sc->uarts_num    =3D 5;
     sc->irqmap       =3D aspeed_soc_ast2500_irqmap;
     sc->memmap       =3D aspeed_soc_ast2500_memmap;
     sc->num_cpus     =3D 1;
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 709a78285b..669bc49855 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -91,6 +91,7 @@ struct AspeedSoCClass {
     int ehcis_num;
     int wdts_num;
     int macs_num;
+    int uarts_num;
     const int *irqmap;
     const hwaddr *memmap;
     uint32_t num_cpus;
--=20
2.30.2

