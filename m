Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp259897ejb;
        Thu, 1 Feb 2024 06:15:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaUewhPkKj8UtuQ+hEColqCs+gtFJq+/EEwJ1XiVXhTqNTBMyxyjvZSl1XSlUzGCosf5kv
X-Received: by 2002:a05:622a:1003:b0:42b:e73e:f105 with SMTP id d3-20020a05622a100300b0042be73ef105mr5224016qte.47.1706796945855;
        Thu, 01 Feb 2024 06:15:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706796945; cv=none;
        d=google.com; s=arc-20160816;
        b=mvSqjfIITw+/y+XAKhJehYFjLih0oGDX9dtepHOi8anEpvXMZabjVx/p2iJMzBnQJi
         5aW5mBxCn9LJc9pBrvPlvmx4qOj9jnxAlQrlgVOaam9IBonUccOVhcm8vfmj7eVBx1Kj
         yoboM+U+XEzZgRDNN4XN17vd8yvKBAaCQ8IlKzUtMJM02KpA5cudkL1bSFAfGL1T4sxq
         VbkVMeIfDoU4lvw/zVlfCwu5qmkZNn6289KpKLBap65iCmmzEEouySz/hRBWuqEk9ZFj
         UG5gvxcNSNMlTh5yv/zilkqyQOI/eTwM68bAmjlg6uThYntYIjrhdQ8AhsINUH69KBzk
         d/Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=JLTGdwWLnbfWIH/r1K0olr5xuwKQgAzxhS/xr6akl7I=;
        fh=vXOjomOC8+0S5Brrfc/hBJ+j2EzElC6wOsNSHY9UigA=;
        b=K1HOEO4mpVk4tnNU0EYaGhxCeiF4Y4NdVUtCEa/2DcRO6Qb995bdC7RCPLX5K4ss1v
         Yx4Nom+B1azGgnypkDp6kvQnNICHzu2h4s0YwCN4Mxv7ghUAbhdy6cX2VY+WGlYWvxhf
         H26DT7FYhr4rNqreWg0ONT8RuH2Rkx/9lk0v28s6Era0Hzj/xHBOxxarfGlzNP1YfQNw
         lpy5iPxJoFO4MWv28UQMpiXpyYXihBO9QrJ+byBbixIwL6vRQMT3Iq/fCXqqRtK0TnRm
         piw7SD9gUcFmLm6Uy6OcxruevlIYU5uM4bij67oF2BMSF1zRUijd7A1NeGP5L8srTTon
         Nnlw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
X-Forwarded-Encrypted: i=0; AJvYcCU3gdxr3tvTPHPkTw0qKz4w0Vjw+nndAfBIBOok1Z8enjfhc6xPPlb9ysHnOhswSC0fsPIQESdBAo4gGiMXoPZu1ZsKgHrA
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bk12-20020a05620a1a0c00b00783d48c8158si13392087qkb.169.2024.02.01.06.15.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Feb 2024 06:15:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rVXpN-0001Xd-De; Thu, 01 Feb 2024 09:14:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Qo6T=JK=kaod.org=clg@ozlabs.org>)
 id 1rVXpB-0001Iq-8d; Thu, 01 Feb 2024 09:13:53 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Qo6T=JK=kaod.org=clg@ozlabs.org>)
 id 1rVXp3-0007qt-Ut; Thu, 01 Feb 2024 09:13:51 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TQgqm707cz4wcq;
 Fri,  2 Feb 2024 01:13:40 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TQgql3B42z4wcM;
 Fri,  2 Feb 2024 01:13:39 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Ninad Palsule <ninad@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 17/17] hw/fsi: Update MAINTAINER list
Date: Thu,  1 Feb 2024 15:12:53 +0100
Message-ID: <20240201141253.806055-18-clg@kaod.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201141253.806055-1-clg@kaod.org>
References: <20240201141253.806055-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=Qo6T=JK=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: 7bGL8eA1WPof

From: Ninad Palsule <ninad@linux.ibm.com>

Add maintainer for IBM FSI model

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
[ clg: - slight change in commit log
       - fixed file list ]
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dfaca8323e91..2f9741b898e8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3585,6 +3585,15 @@ F: tests/qtest/adm1272-test.c
 F: tests/qtest/max34451-test.c
 F: tests/qtest/isl_pmbus_vr-test.c
 
+FSI
+M: Ninad Palsule <ninad@linux.ibm.com>
+R: Cédric Le Goater <clg@kaod.org>
+S: Maintained
+F: hw/fsi/*
+F: include/hw/fsi/*
+F: docs/specs/fsi.rst
+F: tests/qtest/aspeed_fsi-test.c
+
 Firmware schema specifications
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Daniel P. Berrange <berrange@redhat.com>
-- 
2.43.0

