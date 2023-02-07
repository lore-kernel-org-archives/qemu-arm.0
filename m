Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5180681ejb;
        Tue, 7 Feb 2023 02:08:16 -0800 (PST)
X-Google-Smtp-Source: AK7set8A5pdiH7u0L1EGO1b3VwwB9YmkXcAB+F8nwSNFSe/8GJsSAD5gnLQMdBEHlsSfJd2BYL03
X-Received: by 2002:ac8:59c1:0:b0:3b9:b6e3:c78e with SMTP id f1-20020ac859c1000000b003b9b6e3c78emr4775586qtf.8.1675764496336;
        Tue, 07 Feb 2023 02:08:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675764496; cv=none;
        d=google.com; s=arc-20160816;
        b=vHI4CCOEQV3yXFZXTZB3Z2E6C6vEou2uXCw1B3aScikeZGe6wsdY3wFVrECeqqh6jb
         FsQnTXdeogH7kCDGOOK1kK0YH525eRIAJB5H+jgm1Ifv1ocUyTzMXA28lqtErUZqTry4
         m9U5X3nqtpfghprOq24XHj7y3XsG0k7CmkZUhh2bmGwhIy5cI8rZEZevubg6d/jjCvWL
         UROLfO3RB7iwi9E0v0eeUAOsE5xID5keDo41V0fz3p5/l1FQHpRWO1+4vcSlC6o3h1mF
         kBh03G0PB9hJa/P5UehC4m/BLoWypnuDiOL9TYwWtjFGXyxqAQiwDQAY1hxi55bbsn38
         UGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=TyYCKwrZnDpgNZ4syhoxxhohuXTd9EgetizyUrRIrHA=;
        b=L60i3BBFszmX4ugqQvPAiMUwvXcGX+ULvZmeO/qWI/n+vTnRd4JnoXEliBb3Yqh4EW
         xjiBG1hkcsUGqSUv9IO++kaEspSFH4aDf2Xu7GAhEk+JBNKyKw/uN1Al1btjq03/0vkm
         hBgsSCsDDznez7x2zz6xHcgnldJ+0yWQdvBTKDm1MmowfByUNFOwC5gkt734C7Uy8pQ0
         OjXXajed61N7ORWOSaSaTMDchmY/IPeCeYFXKj66eaOD7eiQ3MRr+aYBJhSSNFEAmNob
         wIncucgsuAk7c0L4uMXP0uvYLHtEDzocJCrVdOVSVbqkBkRyrKhx3A+MCJSx+vLVkqOW
         ONXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i1-20020a05620a248100b00720263e936dsi12196725qkn.60.2023.02.07.02.08.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 02:08:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPKtY-0000Pv-Qo; Tue, 07 Feb 2023 05:08:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKtS-0000Oz-Az; Tue, 07 Feb 2023 05:08:06 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=a43c=6D=kaod.org=clg@ozlabs.org>)
 id 1pPKtQ-0002Lo-Hn; Tue, 07 Feb 2023 05:08:06 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4P9zMt49ZPz4xwl;
 Tue,  7 Feb 2023 21:07:54 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4P9zMr5jwKz4wgv;
 Tue,  7 Feb 2023 21:07:52 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 01/25] tests/avocado: Introduce file_truncate()
Date: Tue,  7 Feb 2023 11:07:20 +0100
Message-Id: <20230207100744.698694-2-clg@kaod.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207100744.698694-1-clg@kaod.org>
References: <20230207100744.698694-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=a43c=6D=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EGBVTrJsykpz

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Link: https://lore.kernel.org/r/20230120134314.81956-2-philmd@linaro.org
[ clg: remove image_pow2ceil_expand() factoring ]
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/boot_linux_console.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 8c1d981586..13e6688624 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -30,6 +30,11 @@
 def pow2ceil(x):
     return 1 if x == 0 else 2**(x - 1).bit_length()
 
+def file_truncate(path, size):
+    if size != os.path.getsize(path):
+        with open(path, 'ab+') as fd:
+            fd.truncate(size)
+
 """
 Expand file size to next power of 2
 """
-- 
2.39.1

