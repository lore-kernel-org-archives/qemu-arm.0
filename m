Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp255197lft;
        Thu, 30 Jun 2022 04:28:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vHV1bu38R/MvsZHnZxl0NQi8LAUxBJf8rWuPmtRdG4jFnQJiS7FdABLmKs/eDX6SIG301d
X-Received: by 2002:a05:620a:46a5:b0:6af:6638:e811 with SMTP id bq37-20020a05620a46a500b006af6638e811mr5765458qkb.35.1656588534211;
        Thu, 30 Jun 2022 04:28:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656588534; cv=none;
        d=google.com; s=arc-20160816;
        b=kYkFJnCEZ6bt/rHKH2bdpjUC5GuAK0bPud+pZCX+2u0Iwhu6A/jCPz+mHkmqpYi4yV
         EJZQkMfWjT7niFgorWnaSdOpKfmcY4IQXPJgPVAVVD2ynzkWNh/f2x+iQahmOkM7/31j
         TQrbuc2CTvG0gffW/7VisY9I02nFt1XYEYbzqC/yTmz1v+gyquG0NebyIedUwAQA25N8
         xmjah7+0If0avifuPw+DMpg2+hOkw5Ds2RkHEGv2+aE+g8vvr2a9jwMs+s8fJZeN1cvb
         Ik1e+C26SRzFFuxZ4V0CanfIPNRmZlH290uHGd1kIOzoS96qH63X9cKy7CWu0tIyBgse
         YVbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=I+OHGYMaqN9zPv/FnltKqXZ2bonaXd769rgLKoG2GtE=;
        b=RJSHOpy6gHWayHWuUnXDS391oafmFmwpOuq4830zXoOsUvn6qPFTqmvwTIzCaUD6/p
         19pFsNc43aNlKP2aSDJHLXY828UzTLkKMwajMAw9GMl2n/5GVPjull5lEwqOQ07803I+
         wr8aGLTzDizgd2ygIBCStIChgKQ93JTi4LFuy+vAtMknOHyLX4CfO35dNdTRi0tzU+Rg
         ijX2Wj1diHcDfeel032tCLtuxNBn3+Jk2ZiWxBMAslmpr34c/k4Ol5f5W4r5/X39a0k1
         h0rIabaUaCR9uEcQ1ti2RtgukVxwMrCI+jFICP7rBndF9YFe2pgq+YzQe00D0h4Rp4RI
         MTsA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z124-20020a379782000000b006a5fd463026si10506398qkd.356.2022.06.30.04.28.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jun 2022 04:28:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6sLt-0005r2-Ld
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 07:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sHr-0007Xi-4N; Thu, 30 Jun 2022 07:24:43 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:33485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sHp-000215-2R; Thu, 30 Jun 2022 07:24:42 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LYbZv72Xfz4xYN;
 Thu, 30 Jun 2022 21:24:39 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LYbZs6pCrz4xD5;
 Thu, 30 Jun 2022 21:24:37 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Delevoryas <pdel@fb.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 08/27] aspeed: Set CPU memory property explicitly
Date: Thu, 30 Jun 2022 13:23:52 +0200
Message-Id: <20220630112411.1474431-9-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220630112411.1474431-1-clg@kaod.org>
References: <20220630112411.1474431-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: 5JRAaexXyfXV

From: Peter Delevoryas <pdel@fb.com>

Signed-off-by: Peter Delevoryas <pdel@fb.com>
Message-Id: <20220624003701.1363500-2-pdel@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_ast2600.c | 2 ++
 hw/arm/aspeed_soc.c     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index bb5927c36bbf..a4d90daf3702 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -290,6 +290,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
 
         object_property_set_int(OBJECT(&s->cpu[i]), "cntfrq", 1125000000,
                                 &error_abort);
+        object_property_set_link(OBJECT(&s->cpu[i]), "memory",
+                                 OBJECT(get_system_memory()), &error_abort);
 
         if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
             return;
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 3e6055ac9129..a53a0ca6d63a 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -242,6 +242,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
 
     /* CPU */
     for (i = 0; i < sc->num_cpus; i++) {
+        object_property_set_link(OBJECT(&s->cpu[i]), "memory",
+                                 OBJECT(get_system_memory()), &error_abort);
         if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
             return;
         }
-- 
2.35.3

