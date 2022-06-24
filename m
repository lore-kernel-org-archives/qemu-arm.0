Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3345488lft;
        Thu, 23 Jun 2022 17:37:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uiCCeu/MVJlQeQrqW62QSbuF+4Wl7Qp2nscL/r/lQbjqUUSDf/AGaaotcOLby6FcXqfwI8
X-Received: by 2002:a05:622a:1906:b0:305:9fd:d39a with SMTP id w6-20020a05622a190600b0030509fdd39amr10643605qtc.25.1656031075922;
        Thu, 23 Jun 2022 17:37:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656031075; cv=none;
        d=google.com; s=arc-20160816;
        b=jqtrMnv8n+5NDtVxlbGVhI3gdgMHcDdQpM6g6/5Q2b0kf73c+Q+yRNi/fV4xBueM/7
         h42NyijtOqlD4heCaWtdcSeSl1cTNKsBV41YEXxaBSazMWsLh+SOLPh0noP+UyI69Tqk
         JBzksmXmy34ufUd0vIFPejx8AwkTvbpcoRNPP2bv1j1SQaS2RBMZI+blKh/tcBGFz3L/
         2d0dYUC+OGtbBkYoVDrbSNF0PR0jWCAnkbxXGL5O6dN3jm/KQKByMOqNA9+lpKo2RwKQ
         +Vyldvz7xfAcmj1rrcmqZcodle5lxbYR8kgd8RJfh8OJU/4gBEl023ShihB2SWZOZ2oy
         3xWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:references:in-reply-to:message-id:date
         :subject:cc:to:from:dkim-signature;
        bh=n/8BZ5TEcm+c++ILZsy2AhjmkGiHhcykgXuKaRvX4cE=;
        b=Ll9E3Hldx9XPcdIa2iMLYLeeiqPJMxlPwvuzaNerB9GqxhAW5HQb+hoez5xBvnKOzo
         iQ2S8fXSLQIVSZ8H+qsufQ712TxuLhMDvmVnaMPKVGr7VYPnF1Ah52odjrplXtd4itMF
         65omOUBM/JXMG3fqjNXBsivp2q4KL2I4JihRhWGT8yufxnLgbrVZWalo0rYyNtbEC17G
         nTHfTjJzrJs3H6DEsYcwKAUNB3ZgEORjA4zijD4+Tcv/MmP39NrSdWvoj1TXjEKcxOH9
         UtIXPyv4F24Vx/1NP30lAi9IAAn0IIrDeF7qUB94YRqiIIqu/23yVZ5DhopknW2d06XP
         dlFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=DHr2KWRY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f20-20020ac840d4000000b002f3d3ada058si563721qtm.207.2022.06.23.17.37.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jun 2022 17:37:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=DHr2KWRY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:55102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4XKc-00086y-80
	for alex.bennee@linaro.org; Thu, 23 Jun 2022 20:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=717463a23e=pdel@fb.com>)
 id 1o4XK6-00084J-CN
 for qemu-arm@nongnu.org; Thu, 23 Jun 2022 20:37:23 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:1768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=717463a23e=pdel@fb.com>)
 id 1o4XK4-00085c-4T
 for qemu-arm@nongnu.org; Thu, 23 Jun 2022 20:37:22 -0400
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NK2wLC013298
 for <qemu-arm@nongnu.org>; Thu, 23 Jun 2022 17:37:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=n/8BZ5TEcm+c++ILZsy2AhjmkGiHhcykgXuKaRvX4cE=;
 b=DHr2KWRYLQ/SN2QvK1dfzQUOQc77mM5RzLRTe9+mZF45m0HqMabn9XuP3cT7N+nvwF9/
 cR5vb1ZfaRxIXlUKVFwJVf0gbLacbbSwFVDEtAspm2d17t2Lp/mLlwPhY5t/gwucRyjN
 1LRIay7sy8zs29TVdS0fUHAwLRtFGBzEgyM= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gvua9b3jn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 23 Jun 2022 17:37:18 -0700
Received: from twshared3657.05.prn5.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c085:11d::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 23 Jun 2022 17:37:17 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 36F3688BA299; Thu, 23 Jun 2022 17:37:02 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <clg@kaod.org>, <peter.maydell@linaro.org>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v2 6/8] aspeed: Add fby35 skeleton
Date: Thu, 23 Jun 2022 17:36:59 -0700
Message-ID: <20220624003701.1363500-7-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624003701.1363500-1-pdel@fb.com>
References: <20220624003701.1363500-1-pdel@fb.com>
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: dioyP9iDuZEnt5EftOC2Bzd4GSJa_i-k
X-Proofpoint-GUID: dioyP9iDuZEnt5EftOC2Bzd4GSJa_i-k
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-23_11,2022-06-23_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=717463a23e=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: r6FNxBJeoWQQ

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 MAINTAINERS        |  1 +
 hw/arm/fby35.c     | 54 ++++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/meson.build |  3 ++-
 3 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/fby35.c

diff --git a/MAINTAINERS b/MAINTAINERS
index aaa649a50d..b43b428a30 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1067,6 +1067,7 @@ F: hw/net/ftgmac100.c
 F: include/hw/net/ftgmac100.h
 F: docs/system/arm/aspeed.rst
 F: tests/qtest/*aspeed*
+F: hw/arm/fby35.c
=20
 NRF51
 M: Joel Stanley <joel@jms.id.au>
diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
new file mode 100644
index 0000000000..dc1ae8e62a
--- /dev/null
+++ b/hw/arm/fby35.c
@@ -0,0 +1,54 @@
+/*
+ * Copyright (c) Meta Platforms, Inc. and affiliates. (http://www.meta.com)
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy
+ * of this software and associated documentation files (the "Software"), t=
o deal
+ * in the Software without restriction, including without limitation the r=
ights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included=
 in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS=
 OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/boards.h"
+
+#define TYPE_FBY35 MACHINE_TYPE_NAME("fby35")
+OBJECT_DECLARE_SIMPLE_TYPE(Fby35State, FBY35);
+
+struct Fby35State {
+    MachineState parent_obj;
+};
+
+static void fby35_init(MachineState *machine)
+{
+}
+
+static void fby35_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+
+    mc->desc =3D "Meta Platforms fby35";
+    mc->init =3D fby35_init;
+}
+
+static const TypeInfo fby35_types[] =3D {
+    {
+        .name =3D MACHINE_TYPE_NAME("fby35"),
+        .parent =3D TYPE_MACHINE,
+        .class_init =3D fby35_class_init,
+        .instance_size =3D sizeof(Fby35State),
+    },
+};
+
+DEFINE_TYPES(fby35_types);
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 2d8381339c..92f9f6e000 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -51,7 +51,8 @@ arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_soc.c',
   'aspeed.c',
   'aspeed_ast2600.c',
-  'aspeed_ast10x0.c'))
+  'aspeed_ast10x0.c',
+  'fby35.c'))
 arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2.c'))
 arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2-tz.c'))
 arm_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-soc.c'))
--=20
2.30.2

