Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp2086572lfp;
        Thu, 7 Oct 2021 20:36:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwV0JaPFipn7GmUana6f0nyAexvtYkkm1gpIXqHJAYBDdWxIGeuX6Exw5ESz5rz3UjSAJnj
X-Received: by 2002:ac8:5f82:: with SMTP id j2mr9365022qta.75.1633664166328;
        Thu, 07 Oct 2021 20:36:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633664166; cv=none;
        d=google.com; s=arc-20160816;
        b=M0nY2EgRkcUG9Ym8GDXRceq6EgGidfPBe6xDGd3bm8gzgK6tTGZFe7ASaiHeVlcF+0
         7E/P15l7x+CLt48WwsXxAJlw6u6TbbtbJ9Btu0pUsf2aHlCJ5HT15j8rKqlZKy72TA87
         nQiYTw2cH0FASDtx2iMf6NGzD8dhjjvAsgrDHuLS6d7IAKjUTR/KdsrxGlI5BOK6Jnjx
         xuwTvEdFgFUpmZkaGnjSpJ1oZBiIkwX0+TVLeNiPDzIm6tQ96c4ZfPBPg03DOPCPl7da
         BP5GigKrtIvDtbT2lv+rqSWMp6yWXhsqnp6+bB3qM8BsyZPgZh3S8mkQP3O/wDRyUHL0
         op/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=r/Oba0Z47BhpY+L2el6t8NOBgPINy10BbV1LiOux/Ek=;
        b=kuOOA0gDgp0Ar+9MfY9ZGECJmn7tZAY5F1bEsHQ2ftorZKGwwJiOijyKNoZ8aiI6b6
         0IbN+nHHiRD7DdGqhSlOTGYim9HhG+6ppFhQgnlLblyWRE6SuZseUUJI8ZYFxmzqnlbi
         bRY0AMGD643+8GRf2wCBlzyAqKC40ty8kqBj1Q7m0J0Z+51E+nouauc5lPKv5VlTahU3
         CjY3Ds4kVxyyhf9I3+hXlyvQZCM6O2cuszsfZ/RhqOnd4jo6bDlnVoCZcMGX7KEZISxw
         9Javp5XU71MPGeDB3goNyCoAKwSWogO9koI8yJzWRAm2p2HMzVtupE9JErL7HBNbXVBU
         AjXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=dE2xwpwP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a29si839640qtd.150.2021.10.07.20.36.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Oct 2021 20:36:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=dE2xwpwP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:42290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mYgg1-0000dq-Mp
	for alex.bennee@linaro.org; Thu, 07 Oct 2021 23:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=991596d384=pdel@fb.com>)
 id 1mYgfM-0000cR-Cq
 for qemu-arm@nongnu.org; Thu, 07 Oct 2021 23:35:24 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:54308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=991596d384=pdel@fb.com>)
 id 1mYgfB-0005hD-Ry
 for qemu-arm@nongnu.org; Thu, 07 Oct 2021 23:35:22 -0400
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 197NSq3b014714
 for <qemu-arm@nongnu.org>; Thu, 7 Oct 2021 20:35:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=r/Oba0Z47BhpY+L2el6t8NOBgPINy10BbV1LiOux/Ek=;
 b=dE2xwpwPhfzyCFHd50cAaCg8P3tzHf4hSf0db/FYvYwl3+dmWm8RPh4+zw8EL1bPvqaK
 2A4W+WzqywRUgP8j8dVoqAwxRJxbH/qTRKLVcP7iqCY/8z5ZH4xnpfUZpOMKKNLLioUz
 IldTetau49NrpsSeKP+jokHMIQ4LIh7H6tU= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 3bjakq1fe0-18
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 07 Oct 2021 20:35:12 -0700
Received: from intmgw001.05.prn6.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:82::c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Thu, 7 Oct 2021 20:35:10 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id B3B095733F5C; Thu,  7 Oct 2021 20:35:06 -0700 (PDT)
From: <pdel@fb.com>
To: 
CC: <clg@kaod.org>, <peter.maydell@linaro.org>,
 <andrew.aj.id.au@devvm660.prn0.facebook.com>, <joel@jms.id.au>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, Peter Delevoryas
 <pdel@fb.com>
Subject: [PATCH v2 0/1] hw: aspeed_gpio: Fix GPIO array indexing
Date: Thu, 7 Oct 2021 20:35:00 -0700
Message-ID: <20211008033501.934729-1-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
X-FB-Internal: Safe
Content-Type: text/plain
X-FB-Source: Intern
X-Proofpoint-GUID: bYLMzawOextCgRqX2zkOFbZV-BkOvL5C
X-Proofpoint-ORIG-GUID: bYLMzawOextCgRqX2zkOFbZV-BkOvL5C
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-07_05,2021-10-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0
 suspectscore=0 mlxlogscore=846 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110080019
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=991596d384=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-TUID: 6GLChf5/thDL

From: Peter Delevoryas <pdel@fb.com>

v1: https://lore.kernel.org/qemu-devel/20210924061953.1996620-1-pdel@fb.com/
v2:
    - Standardized the size of the GPIOSetProperties array for each
      Aspeed SOC so that we can use the constant
      "ASPEED_GPIO_MAX_NR_SETS" to iterate over all of them.
=20=20=20=20=20=20
      This adds some unused, zeroed memory, and the for-loops spend some
      time skipping over zeroed entries, but I don't think it's a big
      deal, and it's simpler than tracking a variable-length nr_sets
      property on the classes.

Thanks,
Peter

Peter Delevoryas (1):
  hw: aspeed_gpio: Fix GPIO array indexing

 hw/gpio/aspeed_gpio.c         | 80 +++++++++++++++--------------------
 include/hw/gpio/aspeed_gpio.h |  5 +--
 2 files changed, 35 insertions(+), 50 deletions(-)

Interdiff against v1:
diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 78b0f64b03..911d21c8cf 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -759,7 +759,7 @@ static void aspeed_gpio_set_pin(Object *obj, Visitor *v=
, const char *name,
 }
=20
 /****************** Setup functions ******************/
-static const GPIOSetProperties ast2400_set_props[] =3D {
+static const GPIOSetProperties ast2400_set_props[ASPEED_GPIO_MAX_NR_SETS] =
=3D {
     [0] =3D {0xffffffff,  0xffffffff,  {"A", "B", "C", "D"} },
     [1] =3D {0xffffffff,  0xffffffff,  {"E", "F", "G", "H"} },
     [2] =3D {0xffffffff,  0xffffffff,  {"I", "J", "K", "L"} },
@@ -769,7 +769,7 @@ static const GPIOSetProperties ast2400_set_props[] =3D {
     [6] =3D {0x0000000f,  0x0fffff0f,  {"Y", "Z", "AA", "AB"} },
 };
=20
-static const GPIOSetProperties ast2500_set_props[] =3D {
+static const GPIOSetProperties ast2500_set_props[ASPEED_GPIO_MAX_NR_SETS] =
=3D {
     [0] =3D {0xffffffff,  0xffffffff,  {"A", "B", "C", "D"} },
     [1] =3D {0xffffffff,  0xffffffff,  {"E", "F", "G", "H"} },
     [2] =3D {0xffffffff,  0xffffffff,  {"I", "J", "K", "L"} },
@@ -780,7 +780,7 @@ static const GPIOSetProperties ast2500_set_props[] =3D {
     [7] =3D {0x000000ff,  0x000000ff,  {"AC"} },
 };
=20
-static GPIOSetProperties ast2600_3_3v_set_props[] =3D {
+static GPIOSetProperties ast2600_3_3v_set_props[ASPEED_GPIO_MAX_NR_SETS] =
=3D {
     [0] =3D {0xffffffff,  0xffffffff,  {"A", "B", "C", "D"} },
     [1] =3D {0xffffffff,  0xffffffff,  {"E", "F", "G", "H"} },
     [2] =3D {0xffffffff,  0xffffffff,  {"I", "J", "K", "L"} },
@@ -790,7 +790,7 @@ static GPIOSetProperties ast2600_3_3v_set_props[] =3D {
     [6] =3D {0x0000ffff,  0x0000ffff,  {"Y", "Z"} },
 };
=20
-static GPIOSetProperties ast2600_1_8v_set_props[] =3D {
+static GPIOSetProperties ast2600_1_8v_set_props[ASPEED_GPIO_MAX_NR_SETS] =
=3D {
     [0] =3D {0xffffffff,  0xffffffff,  {"18A", "18B", "18C", "18D"} },
     [1] =3D {0x0000000f,  0x0000000f,  {"18E"} },
 };
--=20
2.30.2

