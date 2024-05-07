Received: by 2002:a05:7022:ef03:b0:7c:9548:a19d with SMTP id qy3csp2003937dlb;
        Tue, 7 May 2024 06:01:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXBOEvagChpI70uC+p70/WMP3XElUO5M13EhrXm4A3A1ycVfuKB2+j4LH8DFQu6HnI5GhV70W8YkNx0gIy7UKwgyzWfSeDZ
X-Google-Smtp-Source: AGHT+IGa1SVISpL8HtEKYb85kIXeJNs2p7poNcGE4VbMdf2742UVB3JuMQXrB1Sxh8e9OqX7/0eI
X-Received: by 2002:a05:620a:4085:b0:792:8d92:35a4 with SMTP id f5-20020a05620a408500b007928d9235a4mr11004462qko.60.1715086879996;
        Tue, 07 May 2024 06:01:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715086879; cv=none;
        d=google.com; s=arc-20160816;
        b=HqXa+fYynlncFkORfNxqAWA/55W/EDInVjhOQKWg2P1xATD1kdcXCwlCwA7JKsXqPu
         PKep/rWSkfg6a7xRwsKXaSPqtnEYI2G6LQVHNfD8ECGp6rTD+vHMiUdpDTi+a2YCz7cl
         hJyYSgHSBwfDp9gSuMKCyJ8mY1b7UVi6h265SgHRbOkPyd9gVSoNLxQwwMjsGo04b2+p
         nI7TDG/1d330weLKYxFsoJvJbu4sQXvo/CdVC+34FNTabBUmg03y0B4Kd1vg/wFlfgjO
         lw9FR2uWI5nmAEFybffyyGYSnIFGOL0V+fEDG1ShL9j7x4iAsHo1zvfQN+BhsTsH5AUC
         6u9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=pACIz8+oioVEIvAuPWEw3KYhogrx4jtvuZWd4bTHPz4=;
        fh=7J5PU8lpRWY1tFrffbMb41SUyhqQ95ZSUeonCUUpoxQ=;
        b=0+fnSpo+Gc79fO1xlr6kVnyDKzFTifVrmfe+NPIusOOrFZBI6c/muxHsgluH3poIlE
         Tm5vJmkCnLu09Yav04fCg5BK627RwQsfnTmg4R4O0haPh8+NcnZE6vK6/7BHM9mC4Mhu
         8MnzD52eaKv1cw2qOWyY3k3N84+zAgtkms9yy/Y9qAvm4WKSEyqFseo13sHry0S4w85e
         M+xTvZ/LkpHUiHuA7ySAWwLuIPpCg5Rvvyq3pUMywJV8tmHzLjUIEXgiVeAnTVtRsdiz
         hC5JWvqvDqvrkphAqsIaxU/tl3xm7wfro+gJgTOBOoGXephB8uYGxtDGbuiJdZL1eKnd
         0icA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br13-20020a05620a460d00b00790f91b39ccsi12765728qkb.108.2024.05.07.06.01.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 May 2024 06:01:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s4KRO-0005o1-Ki; Tue, 07 May 2024 09:01:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1s4KRG-0005ic-44; Tue, 07 May 2024 09:00:58 -0400
Received: from dedi548.your-server.de ([85.10.215.148])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1s4KR4-0006ec-Dx; Tue, 07 May 2024 09:00:57 -0400
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by dedi548.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1s4KQz-000MMd-WE; Tue, 07 May 2024 15:00:42 +0200
Received: from [82.100.198.138] (helo=mail.embedded-brains.de)
 by sslproxy03.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1s4KQz-0000IY-1T; Tue, 07 May 2024 15:00:41 +0200
Received: from localhost (localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id 59D7D4801C4;
 Tue,  7 May 2024 15:00:41 +0200 (CEST)
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavis, port 10032)
 with ESMTP id UbGTGNqQxyJN; Tue,  7 May 2024 15:00:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id 180D14801C5;
 Tue,  7 May 2024 15:00:41 +0200 (CEST)
X-Virus-Scanned: amavis at zimbra.eb.localhost
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 9ujnIY5Nxawu; Tue,  7 May 2024 15:00:41 +0200 (CEST)
Received: from zimbra.eb.localhost (unknown [192.168.96.242])
 by mail.embedded-brains.de (Postfix) with ESMTPSA id E876F480157;
 Tue,  7 May 2024 15:00:40 +0200 (CEST)
From: Sebastian Huber <sebastian.huber@embedded-brains.de>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Luc Michel <luc@lmichel.fr>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 1/2] hw/intc/arm_gic: Fix set pending of PPIs
Date: Tue,  7 May 2024 15:00:37 +0200
Message-Id: <20240507130038.86787-1-sebastian.huber@embedded-brains.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <CAFEAcA8DAt+o-XZepg8xtj4i3xLW_yChwPnDZVM0O=rW8+9qJQ@mail.gmail.com>
References: <CAFEAcA8DAt+o-XZepg8xtj4i3xLW_yChwPnDZVM0O=rW8+9qJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Sender: smtp-embedded@poldi-networks.de
X-Virus-Scanned: Clear (ClamAV 0.103.10/27268/Tue May  7 10:25:13 2024)
Received-SPF: pass client-ip=85.10.215.148;
 envelope-from=sebastian.huber@embedded-brains.de; helo=dedi548.your-server.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ayk6akb7JCc3

According to the GICv2 specification section 4.3.7, "Interrupt Set-Pendin=
g
Registers, GICD_ISPENDRn":

"In a multiprocessor implementation, GICD_ISPENDR0 is banked for each con=
nected
processor. This register holds the Set-pending bits for interrupts 0-31."

Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>
---
 hw/intc/arm_gic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 4da5326ed6..20b3f701e0 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -1296,12 +1296,14 @@ static void gic_dist_writeb(void *opaque, hwaddr =
offset,
=20
         for (i =3D 0; i < 8; i++) {
             if (value & (1 << i)) {
+                int cm =3D (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_M=
ASK;
+
                 if (s->security_extn && !attrs.secure &&
                     !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
                     continue; /* Ignore Non-secure access of Group0 IRQ =
*/
                 }
=20
-                GIC_DIST_SET_PENDING(irq + i, GIC_DIST_TARGET(irq + i));
+                GIC_DIST_SET_PENDING(irq + i, cm);
             }
         }
     } else if (offset < 0x300) {
--=20
2.35.3

