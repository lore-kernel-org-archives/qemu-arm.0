Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1995275lfb;
        Fri, 27 Aug 2021 15:37:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysYdiIjCC8lCvvOODiEm6yt5so0mD9eHS1Zut9Ou+hHXNwkCUEBrFWg6y4+9RhZ4WEjbLv
X-Received: by 2002:a05:6102:1276:: with SMTP id q22mr2538902vsg.7.1630103860108;
        Fri, 27 Aug 2021 15:37:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630103860; cv=none;
        d=google.com; s=arc-20160816;
        b=LetBZcvMiOxg+lbRXlvaLMKsceM4OSIuR6Xanq7hmHVOM8GryOpQnxKDx0w97vO1FR
         /UEDnOlDGyo367c/zfo0vepyuTPOhoAfIuDSJJXW/O45Do4e09sZlToE2gZWAJcR30ef
         eDKrosiLZleWN+m+td8KnaQ8+E2bTlyJNHIaEpbgVgHY0n0Hg1Y08/K0XsPo0ttOkXJ/
         5JXjYUugc1N6bzaPB+kt6F86YBlPIrxEtuQBFZhCrf5+w17gzqjYWbnZYq12zaeu8bLX
         y6Ze/HQjXQI2TrCwCGh3Iv09ftipIwfV/pfr4bQ/0s+K2+cM92yUn/pZOssCOjU5tvlW
         r95g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/loIWSp6B85T8RoaS4kqWMLnn9oXmwg9e4FVG1PWIgU=;
        b=l4kQ5biTsPv/1+VwQwcnjod7aN4NnvPeamSl2qqzFQPiM2dA7OKCAi/bFlNdbD/LKl
         lPGqW+vqMPVqNhg5r/0bAJbj7X2n/ZX+6c4RKDzKQrtq9rByV6rvlPCCsets2E2oTjFd
         w1jHy1geJmW/b3oPZ4XRmVqIFivRf8QxhF/aYkh8tAs3yzr1jJe+8aR6cj4ff9El9ibP
         KhRGl4tHc8WFWvyksFNJ57RL3whYtgNUMb3EaottpG9j+WG81gFEd9tx3kAANaY9Y0Y0
         PcHE1q4bAcNS0fT7EoiODxf9ryFDy0RV552OqGpknNM7BaObICO0PbABvO0CG3BByPVE
         rVFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=q3o0hOR0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z4si4222600vsq.130.2021.08.27.15.37.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Aug 2021 15:37:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=q3o0hOR0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:39302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJkTj-0005Va-6E
	for alex.bennee@linaro.org; Fri, 27 Aug 2021 18:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=78736a82b9=pdel@fb.com>)
 id 1mJj3Q-0006WE-Mv
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 17:06:26 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:29392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=78736a82b9=pdel@fb.com>)
 id 1mJj3O-00038z-Cz
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 17:06:24 -0400
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17RL0jRp008699
 for <qemu-arm@nongnu.org>; Fri, 27 Aug 2021 14:06:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=/loIWSp6B85T8RoaS4kqWMLnn9oXmwg9e4FVG1PWIgU=;
 b=q3o0hOR0Ktm5lnAgSyLGFu1whrBSsfOpEocZjbOUTLGRKZlEoFL7Ga+KAPKT1oGw3loO
 N6aHGlshNB06P9TyeWcl8zgxSQkCpMdinRCl7GXs5Y8TVCaC1kvhureyY4Nbv0b3Hgfc
 /+2/nrJVJTVFuobnA5OE3uj9qxbCz67eBg8= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3apeb9s9br-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 27 Aug 2021 14:06:13 -0700
Received: from intmgw001.27.prn2.facebook.com (2620:10d:c085:208::f) by
 mail.thefacebook.com (2620:10d:c085:11d::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 27 Aug 2021 14:06:11 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id 3056DE74C04; Fri, 27 Aug 2021 14:06:08 -0700 (PDT)
From: <pdel@fb.com>
To: 
CC: <clg@kaod.org>, <joel@jms.id.au>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, Peter Delevoryas <pdel@fb.com>
Subject: [PATCH 1/5] hw/arm/aspeed: Add get_irq to AspeedSoCClass
Date: Fri, 27 Aug 2021 14:04:13 -0700
Message-ID: <20210827210417.4022054-2-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210827210417.4022054-1-pdel@fb.com>
References: <20210827210417.4022054-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-FB-Source: Intern
X-Proofpoint-ORIG-GUID: L7-cfjwUNvlo0BofXVRbWfM4nMU4BlSZ
X-Proofpoint-GUID: L7-cfjwUNvlo0BofXVRbWfM4nMU4BlSZ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-27_06:2021-08-27,
 2021-08-27 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0
 clxscore=1015 mlxlogscore=966 spamscore=0 mlxscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108270124
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=78736a82b9=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.743, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: KkOoToqzglQF

From: Peter Delevoryas <pdel@fb.com>

The AST2500 uses different logic than the AST2600 for getting IRQ's.
This adds a virtual `get_irq` function to the Aspeed SOC class, so that
the shared initialization code in `hw/arm/aspeed.c` can retrieve IRQ's.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/arm/aspeed_ast2600.c     | 1 +
 hw/arm/aspeed_soc.c         | 1 +
 include/hw/arm/aspeed_soc.h | 1 +
 3 files changed, 3 insertions(+)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index e3013128c6..56e1adb343 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -527,6 +527,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass=
 *oc, void *data)
     sc->irqmap       =3D aspeed_soc_ast2600_irqmap;
     sc->memmap       =3D aspeed_soc_ast2600_memmap;
     sc->num_cpus     =3D 2;
+    sc->get_irq      =3D aspeed_soc_get_irq;
 }
=20
 static const TypeInfo aspeed_soc_ast2600_type_info =3D {
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 3ad6c56fa9..c373182299 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -476,6 +476,7 @@ static void aspeed_soc_ast2400_class_init(ObjectClass=
 *oc, void *data)
     sc->irqmap       =3D aspeed_soc_ast2400_irqmap;
     sc->memmap       =3D aspeed_soc_ast2400_memmap;
     sc->num_cpus     =3D 1;
+    sc->get_irq      =3D aspeed_soc_get_irq;
 }
=20
 static const TypeInfo aspeed_soc_ast2400_type_info =3D {
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index d9161d26d6..ca16e1e383 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -84,6 +84,7 @@ struct AspeedSoCClass {
     const int *irqmap;
     const hwaddr *memmap;
     uint32_t num_cpus;
+    qemu_irq (*get_irq)(AspeedSoCState *s, int ctrl);
 };
=20
=20
--=20
2.30.2

