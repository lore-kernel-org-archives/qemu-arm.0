Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3348516lft;
        Thu, 23 Jun 2022 17:45:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s04VuJ3mtN0KONSRwFkGnYMPh2qC4LwWNN0SbuIc8naQ7rohkWPiQ4HfYS3b1kiqS0g2+m
X-Received: by 2002:a05:620a:2711:b0:6a7:9aa0:aba4 with SMTP id b17-20020a05620a271100b006a79aa0aba4mr9003325qkp.232.1656031527017;
        Thu, 23 Jun 2022 17:45:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656031527; cv=none;
        d=google.com; s=arc-20160816;
        b=LoHc8+yJ+AimX5EkVtWfR9lzjYXhXL1wlv6+SCc65bsdbjfaG1LLWdLqRzz0stB85g
         7kq3KWn2IJ4nGOgrM+rMV02mDKLPzMfueCE1wBDW2g+JMUHh0R8X0ozH34Wgs+Er6zMI
         cQhPCOaV4iWH0JlZ8at0MR7UYyzh19AUZhf/cNY031Zc1UIB/FwFnzWltFzMahJ3PkMm
         fLW+si7UdbwEVkKzvvC1iz3wYqGUMWSwqAndi4R3PODAz7iqfJXAep+w223ayDmJF84u
         wshYq+hEbVXPAt5a0sUvP7+ULVf3Ne+IEeSLBsMjch6c+ngwx/lS4Ud+CyYV2VIuCXAB
         PRDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pqU3U/WKTpBXAycKcFC2/dg1L0Fb3mBB43V8/WC/pbQ=;
        b=iTRvbs9dBFJ83xHhpOKFxCH3oJWTQlBwUSGP15iqEW9AJbtYpQZ84rOQ5fEXCYCSEJ
         bFxKEg/eZQsbf14HoGxD5HYJwkxrG83KvNCG0hck3XCyJOBKc1nSnzbihLf838YF4iu/
         Iiin372NZFm79sSJcLrHQkKLK2GC7B4chzmbwiDPohZnp64FXTbmwku0RnC4aweNV//G
         30LQzM/prV7LZN5WIB+NVpLaua8ZXuHYMYoJD4l8c/yjkCcCnNsikEfnuaAGvdHbbmGT
         zfG3pP3acme734kZ0dt/rmeJalIqyJ5CvROX2RXgLLXdyT18V1F6KWk2SJGIgAlvPVBh
         u0/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=iLWljQCO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17-20020a05622a171100b003052db83dfcsi646541qtk.750.2022.06.23.17.45.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jun 2022 17:45:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=iLWljQCO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:43378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4XRu-0002le-HT
	for alex.bennee@linaro.org; Thu, 23 Jun 2022 20:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=717463a23e=pdel@fb.com>)
 id 1o4XKG-0008C9-7H
 for qemu-arm@nongnu.org; Thu, 23 Jun 2022 20:37:32 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:1486
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=717463a23e=pdel@fb.com>)
 id 1o4XK9-0008Bg-GN
 for qemu-arm@nongnu.org; Thu, 23 Jun 2022 20:37:28 -0400
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 25NK2tlh012319
 for <qemu-arm@nongnu.org>; Thu, 23 Jun 2022 17:37:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=pqU3U/WKTpBXAycKcFC2/dg1L0Fb3mBB43V8/WC/pbQ=;
 b=iLWljQCOptd/Wha/sz5rpvAtq/574udeSrGgH/UjpSxDGLv/lovxLUYI81EhHKvRHD08
 xoZS4j/DqjIwEWp8CkwSG525soegOPlhXO7urNNfQKOZNQ5HUgEFCqb4OSrymL42anrb
 EFKOntg8tceywx1ZEDiXwB/kkbJSwrB08fM= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0089730.ppops.net (PPS) with ESMTPS id 3gvce7ysdq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 23 Jun 2022 17:37:24 -0700
Received: from twshared13315.14.prn3.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:82::e) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 23 Jun 2022 17:37:23 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 35F7988BA298; Thu, 23 Jun 2022 17:37:02 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <clg@kaod.org>, <peter.maydell@linaro.org>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v2 5/8] aspeed: Remove use of qemu_get_cpu
Date: Thu, 23 Jun 2022 17:36:58 -0700
Message-ID: <20220624003701.1363500-6-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624003701.1363500-1-pdel@fb.com>
References: <20220624003701.1363500-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: 6CrWb0EJUoKvugq_GX5sxi9T8MSb8U9H
X-Proofpoint-ORIG-GUID: 6CrWb0EJUoKvugq_GX5sxi9T8MSb8U9H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-23_11,2022-06-23_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.153.30;
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
X-TUID: f+68iMtdJdnv

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/arm/aspeed_ast2600.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 8693660271..0656c02889 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -322,7 +322,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
=20
     for (i =3D 0; i < sc->num_cpus; i++) {
         SysBusDevice *sbd =3D SYS_BUS_DEVICE(&s->a7mpcore);
-        DeviceState  *d   =3D DEVICE(qemu_get_cpu(i));
+        DeviceState  *d   =3D DEVICE(&s->cpu[i]);
=20
         irq =3D qdev_get_gpio_in(d, ARM_CPU_IRQ);
         sysbus_connect_irq(sbd, i, irq);
--=20
2.30.2

