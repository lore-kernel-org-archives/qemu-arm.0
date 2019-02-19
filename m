Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3375134wrx;
        Tue, 19 Feb 2019 04:58:49 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbfmHWPwp6ezSnddfkryXm0dr5f8QkA96rRyyygBCNw0yQkRiE4x1La+V7Ea4v8G2VZjBJU
X-Received: by 2002:a0d:f8c6:: with SMTP id i189mr23046878ywf.286.1550581129123;
        Tue, 19 Feb 2019 04:58:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550581129; cv=none;
        d=google.com; s=arc-20160816;
        b=h7Vld3eyWUeQa+q87FUE/fUA27UFdzfTfiiOuOvfdtwhgbf9vh7vmfKXixeR40F2NL
         ZXjP52Rj94bRmSBHCOJiNY5vzFGfnRe3WrDyBQTxaoslDdOjoKfeKSo7Xd1Hp9s2Uz5C
         CCsMp+Hn3A2Cqb7V24Ta92SsHsQePxjt1Z8Fsjal437l+LviNBtEwFssxMzVeTLU9ycH
         SMLhF389U7mNB81RSBMNFelA/Z+WaL9DjC5O5shKXUK1xLlZCZPJniTX4RtLKi3vwfRu
         +nu7YDI5qBVbrFFlwE/pjd02ho1CC4MV1ifLl6xJ8vOvcDSmNv71yDFSxFOLT/8k0qZk
         tn8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=+7hrcQXswMt8u3DqhSZ2esGYAUAMYuaF4oZO23FfjSM=;
        b=OLZKDFZLZzqHOHhRo1a894rCJV4FbEAMV7So6hxiyT9Ir0JUCNQAIhn6z8I/0qqrP3
         5Q7v0CcsvmRS1Lno2ieYOgs+fnAVmBZhfE82+ltucJfU3l15HiLO2X6Qy5CP47na31E7
         UId6JGJ+txDUat8jWsXbwElAKJOHqjIk+ciDM1fnjkh2z2HJ4FDZlc+sDlZPNYkTX2c9
         tQqS8pRmvlhR6R6zQtwn0unQrCv9lj0OG4g9dTOKWqd55ZUbsuIgoxHK236nTk+sXEhP
         yYM0v95xqYlHjFIbvLU+JGHeywTmnSG6tV++9yV6ZU2XSI/4JrTWJAmnNQgJ0Wn1Vuqk
         Pr9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DS2amq8j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w69si9352076yww.428.2019.02.19.04.58.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Feb 2019 04:58:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DS2amq8j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:47709 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gw4z2-0001wN-EM
	for alex.bennee@linaro.org; Tue, 19 Feb 2019 07:58:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53193)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gw4yY-0001gQ-4n
	for qemu-arm@nongnu.org; Tue, 19 Feb 2019 07:58:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gw4yX-0002p1-5g
	for qemu-arm@nongnu.org; Tue, 19 Feb 2019 07:58:18 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:37582)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gw4yW-0002oE-Uy
	for qemu-arm@nongnu.org; Tue, 19 Feb 2019 07:58:17 -0500
Received: by mail-wr1-x441.google.com with SMTP id c8so21857200wrs.4
	for <qemu-arm@nongnu.org>; Tue, 19 Feb 2019 04:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+7hrcQXswMt8u3DqhSZ2esGYAUAMYuaF4oZO23FfjSM=;
	b=DS2amq8jdXrXtWOfFJggiEtrJGMsH+G+jKafRTkoiKJa5++2mlLssdWEPHJPg8ZyI9
	LPldjrg0jzeMRwI+2tI8USr2S+E0OpG3WGVkgpNFH4akv9o+UpwlPsJOF3lWVxTVoEsw
	UnYU+y1oB3IJ0xqwKE1E5vrs3iUTY/sdZbdCc03/mswhRvijSurICFU5olmHAtVZGLyk
	t+PTCWdXF/5zw1NE9uDFKVILmZv0uL1HJD9VvYolWrrni0xDPnXuBYLJIhC4XWxamUzW
	WyUflwwPpEdDs1ymbHk6qeXLfFMX6mK57S28Q5ipNZJB1pJxd3880CENLi0/vR+FsJ/x
	TC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+7hrcQXswMt8u3DqhSZ2esGYAUAMYuaF4oZO23FfjSM=;
	b=nYLyaZsTp+ES9Emu3x3ZtQe9YjwDn7BXBcrSqBq4ru6CGFUyZYSiZ24nO8298wasWD
	rLK0O28sRHTypyXeT6cKV9rvUD9RuHzDAH7BVdRNb1BPfKtiheHP8BB1Lm2tRxH2Pit+
	BXuvhcr0S4DdCjV9l4ChNlOBRl9/dlUVER8Qscu+Kce8zgTmfWYwWnBXfHyamHGfpuQ9
	ZILFsZ/vGFuQC3IZr4i/CN9Wx7utNe1dN4dKPKxgl2xplAQ8ehicpyWgMbdJ45sLp0+S
	H1Pv9BUEI8P8kkDSRcZicOhg6RJsRmp7VT+UNP1cwwcH8Tq8R3TdxY7PlSSzG+eJo1p7
	pQgg==
X-Gm-Message-State: AHQUAuZY/1MaLBeT12MX5ftJQcdOni991xVfH22qLYGURRmnxw70YLNm
	xtIdmcfqTApQGDZ5cYxbZ+HIELoPFilhYA==
X-Received: by 2002:a5d:51cd:: with SMTP id n13mr19934551wrv.310.1550581095787;
	Tue, 19 Feb 2019 04:58:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	e75sm5226113wmg.32.2019.02.19.04.58.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 04:58:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 19 Feb 2019 12:58:03 +0000
Message-Id: <20190219125808.25174-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190219125808.25174-1-peter.maydell@linaro.org>
References: <20190219125808.25174-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-arm] [PATCH 3/8] target/arm/cpu: Allow init-svtor property to
 be set after realize
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CDyzSGhP3yOn

Make the M-profile "init-svtor" property be settable after realize.
This matches the hardware, where this is a config signal which
is sampled on CPU reset and can thus be changed between one
reset and another. To do this we have to change the API we
use to add the property.

(We will need this capability for the SSE-200.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index edf6e0e1f1c..a418ac5cc32 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -22,6 +22,7 @@
 #include "target/arm/idau.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
+#include "qapi/visitor.h"
 #include "cpu.h"
 #include "internals.h"
 #include "qemu-common.h"
@@ -771,9 +772,21 @@ static Property arm_cpu_pmsav7_dregion_property =
                                            pmsav7_dregion,
                                            qdev_prop_uint32, uint32_t);
 
-/* M profile: initial value of the Secure VTOR */
-static Property arm_cpu_initsvtor_property =
-            DEFINE_PROP_UINT32("init-svtor", ARMCPU, init_svtor, 0);
+static void arm_get_init_svtor(Object *obj, Visitor *v, const char *name,
+                               void *opaque, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    visit_type_uint32(v, name, &cpu->init_svtor, errp);
+}
+
+static void arm_set_init_svtor(Object *obj, Visitor *v, const char *name,
+                               void *opaque, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    visit_type_uint32(v, name, &cpu->init_svtor, errp);
+}
 
 void arm_cpu_post_init(Object *obj)
 {
@@ -845,8 +858,14 @@ void arm_cpu_post_init(Object *obj)
                                  qdev_prop_allow_set_link_before_realize,
                                  OBJ_PROP_LINK_STRONG,
                                  &error_abort);
-        qdev_property_add_static(DEVICE(obj), &arm_cpu_initsvtor_property,
-                                 &error_abort);
+        /*
+         * M profile: initial value of the Secure VTOR. We can't just use
+         * a simple DEFINE_PROP_UINT32 for this because we want to permit
+         * the property to be set after realize.
+         */
+        object_property_add(obj, "init-svtor", "uint32",
+                            arm_get_init_svtor, arm_set_init_svtor,
+                            NULL, NULL, &error_abort);
     }
 
     qdev_property_add_static(DEVICE(obj), &arm_cpu_cfgend_property,
-- 
2.20.1

