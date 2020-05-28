Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp489962lfc;
        Thu, 28 May 2020 05:46:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyF5zuFtTADjgbo7lFGv8XiJtLvgFlOPnZhIu73ZJyNJQhjQ6SsNn0cw1ASIDQOruOnKILm
X-Received: by 2002:a25:f20f:: with SMTP id i15mr4891937ybe.72.1590669993935;
        Thu, 28 May 2020 05:46:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590669993; cv=none;
        d=google.com; s=arc-20160816;
        b=f8HgzU9RwqnhfJ/Bn3fJst7kGUx5LGg9L7ijXShxKlPn0OhnZ69XnWhKyarRTlXW+/
         eFo84iTqCCRbU76uzUkL2EzdKwWNsPOLjPMPrkZEUW3ELRQ9QjDyGvCGQHhQFVzvPAvK
         qsr+hXXlo4EV6iMPcm1J6jnd9EF7+LXe4Uyn7h8+ZFr/JRU7j2ZStUEJO7VGavAKS220
         OWgCN9r39EwFchrFRhttClzdx7wA2eidSGt8NdTKVjGzlKq7Dx/QJm6KkYFPGca3777p
         0zs7u3VNq62RtblbedHkc8PzGFpSTh1uNE+CQYgIHpANWXtSM6hgcwPIp2yvoZ1GiNzS
         wKVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=2IsMfaxaTTz5vy0Vupg6v30s/PyqIpQcE0ZMO3BCp/U=;
        b=a43Hctr1NWm81lMRSxF5Trsxvd0yCq+HVgUuTRlT0LHWq4NMLiALfrkR2ok9HtxjYg
         7nDsfu/SSyjkNjkuYwzefcEXoLXhBwAl4bt99zSOm7tMiEy68U93FAZ6nkjH7DiFIvdL
         Nk1/JI+FXTZHPTnnUhmYAbB59wX9qw7LMSLJms5gD2EJA0YiXA437ovXNQrwgDP+AmZH
         zXt+s8CTed6Ric0wZuwGRyIvhBKZ8bLwjTktAQREdsqf1a6MUbqkALr0QusB1FmBRaGi
         YaJNU3vYrnh0PKPWbxJVHQbTP4QVwIKQoB+OyH/HyE47it4cx3Rxb2VGhvswCw11Nfsx
         R4zA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GhEDAWtj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o62si1644316ybg.90.2020.05.28.05.46.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 May 2020 05:46:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GhEDAWtj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jeHvd-0006R8-BD
	for alex.bennee@linaro.org; Thu, 28 May 2020 08:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeHlx-0001oH-LR
 for qemu-arm@nongnu.org; Thu, 28 May 2020 08:36:33 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27814
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jeHlr-0005Ck-Kl
 for qemu-arm@nongnu.org; Thu, 28 May 2020 08:36:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590669386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=2IsMfaxaTTz5vy0Vupg6v30s/PyqIpQcE0ZMO3BCp/U=;
 b=GhEDAWtjbee60KMUwh8g3U2dA0pp+RRijlzNZOatiGJ28nGvQyq2P8M8Hu3oA6MBNjyIvi
 9JP91q4NbCKT3UGqstKivGf80vB46qtzcI7yTJpTii1RQXCSYSgeRisRo2Ep+ZsrGn3ght
 01YAXbakAgGH2ufOu/blmCEt/3mz7RA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-emKINCxxMzis6e2BQMv_Wg-1; Thu, 28 May 2020 08:36:21 -0400
X-MC-Unique: emKINCxxMzis6e2BQMv_Wg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 485001855A0D;
 Thu, 28 May 2020 12:36:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF37E10013C3;
 Thu, 28 May 2020 12:36:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1BBB39D72; Thu, 28 May 2020 14:36:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/21] sm501: Optimize small overlapping blits
Date: Thu, 28 May 2020 14:36:08 +0200
Message-Id: <20200528123609.27362-21-kraxel@redhat.com>
In-Reply-To: <20200528123609.27362-1-kraxel@redhat.com>
References: <20200528123609.27362-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 03:11:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6ot+hBFz/Q56

From: BALATON Zoltan <balaton@eik.bme.hu>

AmigaOS tends to do a lot of small blits (even 1 pixel). Avoid malloc
overhead by keeping around a buffer for this and only alloc when
blitting larger areas.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-id: 7946852258d528497e85f465327fc90b5c3b59fb.1590089984.git.balaton@eik.bme.hu
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/sm501.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 8bf4d111f4b3..e7a9f77de7bc 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -750,6 +750,7 @@ static void sm501_2d_operation(SM501State *s)
     switch (cmd) {
     case 0: /* BitBlt */
     {
+        static uint32_t tmp_buf[16384];
         unsigned int src_x = (s->twoD_source >> 16) & 0x01FFF;
         unsigned int src_y = s->twoD_source & 0xFFFF;
         uint32_t src_base = s->twoD_source_base & 0x03FFFFFF;
@@ -812,10 +813,14 @@ static void sm501_2d_operation(SM501State *s)
             de = db + width + height * (width + dst_pitch);
             if (rtl && ((db >= sb && db <= se) || (de >= sb && de <= se))) {
                 /* regions may overlap: copy via temporary */
-                int llb = width * (1 << format);
+                int free_buf = 0, llb = width * (1 << format);
                 int tmp_stride = DIV_ROUND_UP(llb, sizeof(uint32_t));
-                uint32_t *tmp = g_malloc(tmp_stride * sizeof(uint32_t) *
-                                         height);
+                uint32_t *tmp = tmp_buf;
+
+                if (tmp_stride * sizeof(uint32_t) * height > sizeof(tmp_buf)) {
+                    tmp = g_malloc(tmp_stride * sizeof(uint32_t) * height);
+                    free_buf = 1;
+                }
                 pixman_blt((uint32_t *)&s->local_mem[src_base], tmp,
                            src_pitch * (1 << format) / sizeof(uint32_t),
                            tmp_stride, 8 * (1 << format), 8 * (1 << format),
@@ -825,7 +830,9 @@ static void sm501_2d_operation(SM501State *s)
                            dst_pitch * (1 << format) / sizeof(uint32_t),
                            8 * (1 << format), 8 * (1 << format),
                            0, 0, dst_x, dst_y, width, height);
-                g_free(tmp);
+                if (free_buf) {
+                    g_free(tmp);
+                }
             } else {
                 pixman_blt((uint32_t *)&s->local_mem[src_base],
                            (uint32_t *)&s->local_mem[dst_base],
-- 
2.18.4

