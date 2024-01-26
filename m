Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp877455ejc;
        Fri, 26 Jan 2024 05:34:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUvyjV0cWuOODJDUFzZRsXd8lCLmbXqiowaGFyqMatvtb3SW1qXHJFADTFMXU12Fr8VvqK
X-Received: by 2002:a05:6214:caa:b0:686:9deb:9f58 with SMTP id s10-20020a0562140caa00b006869deb9f58mr1478625qvs.19.1706276049249;
        Fri, 26 Jan 2024 05:34:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706276049; cv=none;
        d=google.com; s=arc-20160816;
        b=ZaNinq0/1Q2ShLURSMbhQgfd6uSXaMA5giDj0GFrBYpy4ue24ApNq1Za2/XFqmPmtk
         o/e+9mjYtRFMNiYiAQDjdbzaVYXghwKQLJTclRkXh7btbdBnRqqGdi6KF4mQKM5nTt9F
         zOc/Whb9AqDn39nHawZ2W9M4ksDXPXnVbSXPe5XuQrO25RGqk0g5F5xxiwKiN3fPqwHT
         zS+9jmf5svN/Adh9npDiLJBluE9KMyQGFwBhnjTAhSDSZiSLRIL+Huc8BqDDORsmvSN/
         MpO1RQBEAf73FTb3daaRJhcTnEvVLTGLAawpuTWiCMtVWUEIrgjhIhyrV8Vh4gIB+EW8
         CYWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=fQxRch7Kxo1d1LxhKrh/t4UI8ChNb7wRo0wewQVsz/E=;
        fh=jLTX6LcWZDFHmzG0EpD0PNf260/p6eka/EHAnWM+BUw=;
        b=y4Yeu+C/GGuJBjhMgWxv51nCHcq08RHHSkxJITA/YGwfA3WgI20912ShrNu/mO61cn
         3bSkuknf0IkNWAko8PE4KCS/4HBgDO0ecQyRQM6CQBxq0RRbX1bEtAIujwgm2X/7khLC
         jdor0agomDNeBE3LEhUUnyBbW6pnoMvXQhM4ItMnG1j6t/j/aT/8cXZdKtNFg8kVadLJ
         R/F8cOqbkqtyLPHKw45hZhvx+SxI2upmrHc+O18J3xfltux+Of2rY/rAsZYWcB425ZOy
         aLczMfnL6iTCmc1GUqCHMSqIEGnpjPGqRfnsP30O5fh037E26xSC7pVVdQD7bMR331Nj
         eZcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fn1-20020ad45d61000000b00683aacb7933si1308851qvb.341.2024.01.26.05.34.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 05:34:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rTMKz-0005Yx-V2; Fri, 26 Jan 2024 08:33:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTMKW-0004uh-2L; Fri, 26 Jan 2024 08:33:13 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5gEp=JE=kaod.org=clg@ozlabs.org>)
 id 1rTMKR-0008B8-AS; Fri, 26 Jan 2024 08:33:08 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4TLzCh5Q7Hz4x80;
 Sat, 27 Jan 2024 00:33:04 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TLzCg1lBQz4wny;
 Sat, 27 Jan 2024 00:33:02 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Ninad Palsule <ninad@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 17/17] hw/fsi: Update MAINTAINER list
Date: Fri, 26 Jan 2024 14:32:16 +0100
Message-ID: <20240126133217.996306-18-clg@kaod.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126133217.996306-1-clg@kaod.org>
References: <20240126133217.996306-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=5gEp=JE=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: e/m9gmka9muD

From: Ninad Palsule <ninad@linux.ibm.com>

Added maintainer for IBM FSI model

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dfaca8323e91..39deb8ee1f24 100644
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
+F: tests/qtest/fsi-test.c
+
 Firmware schema specifications
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Daniel P. Berrange <berrange@redhat.com>
-- 
2.43.0

