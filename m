Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp290620ejb;
        Thu, 1 Jun 2023 02:36:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7vqJdADMt/5ukHQAcioylhskiedNWhbY+ad7i2bOeOFw1iiiiJdKDD54rLgVw70H6MuT5k
X-Received: by 2002:ac8:5a44:0:b0:3f3:8e79:5742 with SMTP id o4-20020ac85a44000000b003f38e795742mr9103329qta.19.1685612166619;
        Thu, 01 Jun 2023 02:36:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685612166; cv=none;
        d=google.com; s=arc-20160816;
        b=Z2CBkNKy6Ftpiwy5MZemujHr0NZ65wwrbH/4bNvq8UDTYLALnXGoZdTNnCoLFQ8vdk
         Ee7xAKsXid7wopdwUm1Ah/ZVx6Vp16WkZd5Gk71OfwNAnU9nR+kwBUL1lavQMnb4c0dI
         qP8Cl8G+indELaV3OnuOG9fQ9nPyvAKhZd5BC4eYIh5QitN3cu7oS8ce1090ZjC3Q56p
         Xq/Oq3RRii5n9VFbceBNtnJmMhuU2Bn+nPNIsBgAdEbC6vQ76bLuGhwHOJi0XIRTYOtT
         jONZslhOIRf24YpzauxXvS9tR1XMls5ohTgmR8O2lBrCn3Yz8xtGfOceQn6T2f6DNg2I
         PVcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iBmRFGSCUyWrpqUCkJ9/kvAcmY0X7VBtc3pe1bAu4Nw=;
        b=OCmBNa9uaugq5op+xjokDtUZqeVDzTVxkpysAPUquMEVnvf/G4NaR2yQ4PfiwuNLkN
         i0g2h1Wx2xwg8Cw0+nM/kHNWczqjYm2ZuST0wih7rG+ROckH0ewIN5vVLEbBFsioBn+V
         k1FHGWiOtPfDX/HomlVbtZK8a8qceoBpm+YBpJmtH8yWdazd+QU8kF22z3RAhnXvOAjq
         Kg2FF8vyqAVKlrGnxCGL6gcfIsqPpB3uudUAMcdV1jkdAz+x6RmHcmovlVe5O23Xyixq
         TM5OXERvJWFQpZxSMxDXea8u2aRHAUO1oVRDApQ0JHJfNyKCAjonfqoxIT0W/9l94O6Z
         iuhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m+53Rqw4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d13-20020ac85acd000000b003f6c51a5c34si9774239qtd.358.2023.06.01.02.36.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Jun 2023 02:36:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m+53Rqw4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4eiK-0007jT-30; Thu, 01 Jun 2023 05:35:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4eiF-0007hM-U5
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 05:35:21 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4ehy-0008Sq-EE
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 05:35:17 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f3a99b9177so692207e87.1
 for <qemu-arm@nongnu.org>; Thu, 01 Jun 2023 02:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685612100; x=1688204100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iBmRFGSCUyWrpqUCkJ9/kvAcmY0X7VBtc3pe1bAu4Nw=;
 b=m+53Rqw4BvkMKcWgY8ijZYQZ3MvEhO4yd3IBzpmQXtgmat8Fuijcn8ZNKPpJQyO2Gq
 hnDP6OQNh8fYfyAERrj1toGGmwNqkcH+wCrSBrd42VH5mOcu/Vdu+o0XRK7A4hNcGKMj
 IPCUt2is3km3TLvkvpkm4lGzDT8Zt0xNmxY2p5LZTPxptADt+xXkYnrWK/9YSCozNVwc
 W7USHT5gnm1ZZZvkd3g0HcmgKdckwmcPnyzv/L1da5lC4ambnmmDTI50z0MrV8PveJ2L
 YUl7HbEO3LWXKanfwJ+Vvx5R2BidfMjvOx7XOWj/mT1VdtapjSkwy/sedFUscRS0gQQ5
 R0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685612100; x=1688204100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iBmRFGSCUyWrpqUCkJ9/kvAcmY0X7VBtc3pe1bAu4Nw=;
 b=ZiBIGfl6G62BplzSVmAOb2Gzf5vnogkAsCaxvv3ILB1y3O98rHVeSEFPrLVvkNa8+K
 FmFfQrFQuZ1oUVB/XD/3GP4dvf7LUqwizylOBRG1AC6gdLWEaIUjeyLgDanjbTLrsx5z
 uOSpvd/6fFODTA+9DWQZB537yaL0XskFN+iEIgvyR5SNrbIbH3zF0x0g1b2svFrVwo/G
 A8d3NKZde92QWxabwmHIco4Q/LC1pxvXF2BHPukhEoC7BNFviFxGcyCkGNmPqIifkTq9
 7c7pa0eyH5rhpVubM8sPIB1kZMAbIJSfS8wvtHpiR6lR8C8i6zEsBPDHKV2o8mg9Qt6m
 RmQw==
X-Gm-Message-State: AC+VfDzSONQekuskgzLekbtIAr7jIiExeYBRUSU5u9UlQZ3RjLvtM2ky
 0VnMmEpSuRKu4zbGDyjtc/nYZw==
X-Received: by 2002:ac2:5505:0:b0:4f3:b221:558c with SMTP id
 j5-20020ac25505000000b004f3b221558cmr914245lfk.43.1685612099981; 
 Thu, 01 Jun 2023 02:34:59 -0700 (PDT)
Received: from localhost.localdomain ([176.176.141.224])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a1c7210000000b003f60119ee08sm1658709wmc.43.2023.06.01.02.34.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 01 Jun 2023 02:34:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/2] scripts: Add qom-cast-macro-clean-cocci-gen.py
Date: Thu,  1 Jun 2023 11:34:51 +0200
Message-Id: <20230601093452.38972-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230601093452.38972-1-philmd@linaro.org>
References: <20230601093452.38972-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6GpW4cyfm33e

Add a script to generate Coccinelle semantic patch
removing all pointless QOM cast macro uses.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS                               |  1 +
 scripts/qom-cast-macro-clean-cocci-gen.py | 49 +++++++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 scripts/qom-cast-macro-clean-cocci-gen.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 4b025a7b63..37a2412011 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3044,6 +3044,7 @@ F: include/qom/
 F: qapi/qom.json
 F: qapi/qdev.json
 F: scripts/coccinelle/qom-parent-type.cocci
+F: scripts/qom-cast-macro-clean-cocci-gen.py
 F: softmmu/qdev-monitor.c
 F: stubs/qdev.c
 F: qom/
diff --git a/scripts/qom-cast-macro-clean-cocci-gen.py b/scripts/qom-cast-macro-clean-cocci-gen.py
new file mode 100644
index 0000000000..2fa8438a14
--- /dev/null
+++ b/scripts/qom-cast-macro-clean-cocci-gen.py
@@ -0,0 +1,49 @@
+#!/usr/bin/env python3
+#
+# Generate a Coccinelle semantic patch to remove pointless QOM cast.
+#
+# Usage:
+#
+# $ qom-cast-macro-clean-cocci-gen.py $(git ls-files) > qom_pointless_cast.cocci
+# $ spatch \
+#           --macro-file scripts/cocci-macro-file.h \
+#           --sp-file qom_pointless_cast.cocci \
+#           --keep-comments \
+#           --use-gitgrep \
+#           --in-place \
+#           --dir .
+#
+# SPDX-FileContributor: Philippe Mathieu-Daudé <philmd@linaro.org>
+# SPDX-FileCopyrightText: 2023 Linaro Ltd.
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import re
+import sys
+
+assert len(sys.argv) > 0
+
+def print_cocci_rule(qom_typedef, qom_cast_macro):
+    print(f'''@@
+typedef {qom_typedef};
+{qom_typedef} *obj;
+@@
+-    {qom_cast_macro}(obj)
++    obj
+''')
+
+patterns = [
+    r'DECLARE_INSTANCE_CHECKER\((\w+),\W*(\w+),\W*TYPE_\w+\)',
+    r'DECLARE_OBJ_CHECKERS\((\w+),\W*\w+,\W*(\w+),\W*TYPE_\w+\)',
+    r'OBJECT_DECLARE_TYPE\((\w+),\W*\w+,\W*(\w+)\)',
+    r'OBJECT_DECLARE_SIMPLE_TYPE\((\w+),\W*(\w+)\)',
+    r'INTERFACE_CHECK\((\w+),\W*\(\w+\),\W*TYPE_(\w+)\)',
+]
+
+for fn in sys.argv[1:]:
+    try:
+        content = open(fn, 'rt').read()
+    except:
+        continue
+    for pattern in patterns:
+        for match in re.findall(pattern, content):
+            print_cocci_rule(match[0], match[1])
-- 
2.38.1

