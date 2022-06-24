Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3345469lft;
        Thu, 23 Jun 2022 17:37:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tVtXMbQ/ZBhpAVGVj7+BDUOeB1ReGC+u0j7HFqWYMIbChN2CUgvhwR0aeVmtCYn8098Y4l
X-Received: by 2002:a05:622a:1b09:b0:305:2a8c:5121 with SMTP id bb9-20020a05622a1b0900b003052a8c5121mr10503683qtb.657.1656031074433;
        Thu, 23 Jun 2022 17:37:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656031074; cv=none;
        d=google.com; s=arc-20160816;
        b=w2Ij7cyptw3lj58L7fsrHTF+q1nja+VNgl4lLZ+mH36GJun6BnuJZho3uOj8MxaTer
         8LXZctiSIu2d5F8/3IdzZRj8i6QL818YTY7S/o5P794Xx4g2ZNg/sRAtkEClkV88NThm
         RA17F23YNLE18DhvzXMTV+okNyuk3L7UqpJ3StYc1nP+0Q2vYzhU45F/1XM+KNqH9C9r
         TBjMzWd6Da1WPzfJF8Hv3c9nBadvH5eNSq4pHtujhMJd8zWAXjHmuRhkSpacoQuB7DAo
         c59Ra3ZMT2aFoocXW8Ejp5cl9quQITt0CiziZmpLKpWvibb4kcaJbFan0zIOCCN2wSAU
         3AtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=k0DU65YOwjjbCNivxoBgRa+KMOXocJ3QQIw9Yfr12T4=;
        b=D9S023mDPvKfx9rIPr4OGO30UNmKuvtPDSTX0wBD0Ttw4yKPnVAumUKpDp5d00zY77
         igISwI5XN+ee22jXIH77W/m82B32czUxcRiKawNoXVwjRDREzppEABzLvg8JuqJMpsOi
         lVEFTvY+GWstadAvVDgvGpt74NCK/lDX1P3TOWUbXXTZz9PnSgkz2kqnhQ6IsVIA1HLX
         cV6nVnbt4QwKQS8PiAB+XYg544eK9qaE/Q27moBBK4qLL86mRZ74SR1NgBivqyCPztTW
         6GpQOp0hqujAKoNlI8jjWY/wYxy8fd1bC7xBSq2BFfMHPvD2hHu/wmm90hZqeuK1ukIx
         gM4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=EKBaH9wo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15-20020a0562140ccf00b004642756a9e0si530869qvx.390.2022.06.23.17.37.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jun 2022 17:37:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=EKBaH9wo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:55088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4XKb-00086D-RC
	for alex.bennee@linaro.org; Thu, 23 Jun 2022 20:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=717463a23e=pdel@fb.com>)
 id 1o4XK7-00084Q-NW
 for qemu-arm@nongnu.org; Thu, 23 Jun 2022 20:37:24 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:31436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=717463a23e=pdel@fb.com>)
 id 1o4XK5-00084A-8j
 for qemu-arm@nongnu.org; Thu, 23 Jun 2022 20:37:23 -0400
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NK2uHf018927
 for <qemu-arm@nongnu.org>; Thu, 23 Jun 2022 17:37:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=k0DU65YOwjjbCNivxoBgRa+KMOXocJ3QQIw9Yfr12T4=;
 b=EKBaH9wo/XduhGNO12j8ECBc8MREjww770AS40xk77/lgbLilWnFb4vIiti4itZ7rV9i
 kG3w6GgB8cy9sBneduSttNruBzTTEftNwsOd82INl6ZKrAgLmoLPZ1nMXdjp2vChY83W
 CPupVZVUSEW3zX+1ZVr4WhL8NIdv6jvlyi8= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gvqxxvg26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 23 Jun 2022 17:37:14 -0700
Received: from twshared18443.03.prn6.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 23 Jun 2022 17:37:12 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 320C588BA292; Thu, 23 Jun 2022 17:37:02 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <clg@kaod.org>, <peter.maydell@linaro.org>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v2 1/8] aspeed: Set CPU memory property explicitly
Date: Thu, 23 Jun 2022 17:36:54 -0700
Message-ID: <20220624003701.1363500-2-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624003701.1363500-1-pdel@fb.com>
References: <20220624003701.1363500-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: cfzP7kt2pKEEG5llTCcs-FFkejhyvUgx
X-Proofpoint-GUID: cfzP7kt2pKEEG5llTCcs-FFkejhyvUgx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-23_11,2022-06-23_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=717463a23e=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 4TamD7w9ARE2

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/arm/aspeed_ast2600.c | 2 ++
 hw/arm/aspeed_soc.c     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index f70b17d3f9..f950fff070 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -294,6 +294,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
=20
         object_property_set_int(OBJECT(&s->cpu[i]), "cntfrq", 1125000000=
,
                                 &error_abort);
+        object_property_set_link(OBJECT(&s->cpu[i]), "memory",
+                                 OBJECT(get_system_memory()), &error_abo=
rt);
=20
         if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
             return;
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index f530028874..06e5629800 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -247,6 +247,8 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
=20
     /* CPU */
     for (i =3D 0; i < sc->num_cpus; i++) {
+        object_property_set_link(OBJECT(&s->cpu[i]), "memory",
+                                 OBJECT(get_system_memory()), &error_abo=
rt);
         if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
             return;
         }
--=20
2.30.2

