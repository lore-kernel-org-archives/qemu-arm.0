Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1643607ejb;
        Fri, 3 Feb 2023 10:11:37 -0800 (PST)
X-Google-Smtp-Source: AK7set9pp8DbCmivCXe967G9EW3SNvyjHDlzMI6TjFmYcHKVNWnlOXvnlHSzTp0O50uqa5viFEot
X-Received: by 2002:a1f:2895:0:b0:3e2:df7c:da88 with SMTP id o143-20020a1f2895000000b003e2df7cda88mr5402523vko.0.1675447897397;
        Fri, 03 Feb 2023 10:11:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675447897; cv=none;
        d=google.com; s=arc-20160816;
        b=vxCqiAZmM0C/sRpEAC0K0yYp8ITddyJ6JiRGotocXEMmfU5QH3yPt9tkXJsB+/bdPw
         sRziAkhWnYCA/tVDGvpUOJMONJPwGynZbkcry8btwT+wTmK3gyTLombMJTrbMHpkGBAQ
         xzi60Eeet1MO7LnrXp6xYEK35dfiY0TzeMVZvuMdxRCPs+8oF292QIaogOGixGZlfXOu
         paRwqp78JxQOZn3wMpVyXnNGaG5d++TdaBgBHwIxNoi4CezibdvYyoZGei9/uMV+dDR9
         2VELFTFyU03a8S6KbwJbO7PgqUNje7ikHUQQ4CvFeFTyCIsBXnB+B8SW2UOp7Ya4RXyE
         9Mzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=aWOXT8kEVLd1z9ooQiF6EcLH2zq0UxcZKoFli6u89Ts=;
        b=wZ5Vvj3Z3CWl/u6Te+dZhhxWWidLEXWRKaHDx9kAIf8ETpncisKmKkH9KP2T6P2/+i
         EVU0asQ/3Tqfxu2WhzFzawkcFZMqmKGA0967ZQ3Nzn19tzaymNpI9jl1hWMVH3S0PjBi
         Z2hPt7w7ctV/yFzfdaPFQlFhdUBmLpx4JUWKsWWdpqSazrsAZPoaBHjQsPEn2FEmCJsI
         V6ll1LUgHWUpI/wyZQ3CM3esITAMq4NiliZ+AGpr+nv9j7MYq42CSpOyv3M2oVClrZzG
         mejjDFhuKCIO1fNNxOccfC2gXed5nVa/8HOnSWqW+9XpFwmhpTm6Wht7quu+Y0A7no60
         +rSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gPkZFkbj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p7-20020a0561020e4700b003f386564ff6si870273vst.720.2023.02.03.10.11.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 10:11:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gPkZFkbj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pO0V4-00070g-7b; Fri, 03 Feb 2023 13:09:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0V2-00070K-Tp
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 13:09:24 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0V0-00089h-LH
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 13:09:24 -0500
Received: by mail-wr1-x42f.google.com with SMTP id ba1so1326968wrb.5
 for <qemu-arm@nongnu.org>; Fri, 03 Feb 2023 10:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aWOXT8kEVLd1z9ooQiF6EcLH2zq0UxcZKoFli6u89Ts=;
 b=gPkZFkbjBPKkz+Lji5ycmEN0K85IEZZIw2q6gtgnPP63BgwKuk/tCW51t36CDwFan0
 9XIRHgs7IcwxKJE6Hh5WSOlR3O+FmAiAxwHQ5z2eVUEjoL/5HGaQwGb5UGfdd0gy1LLS
 3T57/PRV6YsGTcUJxXG4LOkVsYakxjXsnjXtNBUVG/nXgzyhrldM9fTJXbJZNMQ9Xhnz
 3AsgbteWSP7p2lwiFi5f/mKleV0uSkfL95cP9KABfYn1JFAYh00Kz2jNDFkcVGOYdA3F
 rlYrTm2GhUzlSjGDwdOsMlc/9K5xJ7cBYt+LifPSsYGYyRXrYeOwjSkhkyb7+0FSqYgl
 VHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aWOXT8kEVLd1z9ooQiF6EcLH2zq0UxcZKoFli6u89Ts=;
 b=7KNjZkeLDkInqq+CrYLiL4TBCx+m7EkLn7t0AVE+DvDZpoamMYwNErEmYi4yg4H/Xc
 jrNnEZRf9zn4UCUjFAd+R/6nbcmCRqdBCbsTmD5vw0NaFpSNB2//DFumUSr/8rPIT0Cs
 S+6rOCWBIE69On6bUZnO96ImGrtTLO0pdCaIo3j+XKy7vrLCaRx3+ABYwrU1uOlkvHo8
 7FmNGSm/T4+r79QYyfrLoQkM1Yho4eVa9ny8tsQYK+he1yvjbPrmKzAI0bIcgyUCwvJS
 FBJ9VxF2b1xY2k69vusnQMKF0apMx3S/VUcJ+ZGMHwkDSlPCcfnvmmMSFpMZxzx1s2Fo
 yB1A==
X-Gm-Message-State: AO0yUKULiHf5eV50sF77XHlU+HQlLucAHPQ4i8FC44KBQeVRFyVd7bQF
 Sc6bomRvgJs0wxMOr/4kyGiAkg==
X-Received: by 2002:adf:c713:0:b0:2bf:e05f:53ac with SMTP id
 k19-20020adfc713000000b002bfe05f53acmr10227055wrg.45.1675447760909; 
 Fri, 03 Feb 2023 10:09:20 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a5d60ce000000b002bc7f64efa3sm2501936wrt.29.2023.02.03.10.09.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:09:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 01/19] NOTFORMERGE scripts/coccinelle: Add qom-qdev-prop.cocci
Date: Fri,  3 Feb 2023 19:08:56 +0100
Message-Id: <20230203180914.49112-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: FMi8OQvCZL0T

Script I used to generate the following patches. This is
not an automatic conversion as object_property_set_[u]int()
does not specify the type size. Each integer property must
then be converted manually. Therefore this script doesn't
seem relevant to be committed in the repository.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 scripts/coccinelle/qom-qdev-prop.cocci | 259 +++++++++++++++++++++++++
 1 file changed, 259 insertions(+)
 create mode 100644 scripts/coccinelle/qom-qdev-prop.cocci

diff --git a/scripts/coccinelle/qom-qdev-prop.cocci b/scripts/coccinelle/qom-qdev-prop.cocci
new file mode 100644
index 0000000000..21e6ed2b33
--- /dev/null
+++ b/scripts/coccinelle/qom-qdev-prop.cocci
@@ -0,0 +1,259 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// SPDX-FileCopyrightText: Linaro Limited 2023
+//
+// Convert QOM set_property() API to QDev set_prop() API equivalent
+//
+// Only bool / string / link properties are automatically converted.
+// Integer properties must be converted manually, since the QOM
+// object_property_set_[u]int() helpers don't specify the type size.
+
+
+//
+// bool
+//
+
+// bool OBJECT
+@@
+typedef DeviceState;
+identifier dev;
+expression prop, val;
+@@
+    DeviceState *dev;
+    ...
+-   object_property_set_bool(OBJECT(dev), prop, val, ... /* &error_abort */);
++   qdev_prop_set_bit(dev, prop, val);
+
+// bool dev
+@@
+expression dev;
+expression prop, val;
+@@
+-   object_property_set_bool(OBJECT(dev), prop, val, ... /* &error_abort */);
++   qdev_prop_set_bit(dev, prop, val);
+    ...
+(
+    sysbus_realize(SYS_BUS_DEVICE(dev), ...);
+|
+    qdev_realize(dev, ...);
+|
+    qdev_realize_and_unref(dev, ...);
+)
+
+// bool DEVICE(dev)
+@@
+expression dev;
+expression prop, val;
+@@
+-   object_property_set_bool(OBJECT(dev), prop, val, ... /* &error_abort */);
++   qdev_prop_set_bit(DEVICE(dev), prop, val);
+    ...
+(
+    sysbus_realize(SYS_BUS_DEVICE(dev), ...);
+|
+    qdev_realize(DEVICE(dev), ...);
+|
+    qdev_realize_and_unref(DEVICE(dev), ...);
+)
+
+// bool DEVICE(obj)
+@@
+expression obj;
+expression prop, val;
+@@
+-   object_property_set_bool(obj, prop, val, ... /* &error_abort */);
++   qdev_prop_set_bit(DEVICE(obj), prop, val);
+    ...
+(
+    sysbus_realize(SYS_BUS_DEVICE(obj), ...);
+|
+    qdev_realize(DEVICE(obj), ...);
+|
+    qdev_realize_and_unref(DEVICE(obj), ...);
+)
+
+
+//
+// str
+//
+
+// str OBJECT
+@@
+typedef DeviceState;
+identifier dev;
+expression prop, val;
+@@
+    DeviceState *dev;
+    ...
+-   object_property_set_str(OBJECT(dev), prop, val, ... /* &error_abort */);
++   qdev_prop_set_string(dev, prop, val);
+
+// str dev
+@@
+expression dev;
+expression prop, val;
+@@
+-   object_property_set_str(OBJECT(dev), prop, val, ... /* &error_abort */);
++   qdev_prop_set_string(dev, prop, val);
+    ...
+(
+    sysbus_realize(SYS_BUS_DEVICE(dev), ...);
+|
+    qdev_realize(dev, ...);
+|
+    qdev_realize_and_unref(dev, ...);
+)
+
+// str DEVICE(dev)
+@@
+expression dev;
+expression prop, val;
+@@
+-   object_property_set_str(OBJECT(dev), prop, val, ... /* &error_abort */);
++   qdev_prop_set_string(DEVICE(dev), prop, val);
+    ...
+(
+    sysbus_realize(SYS_BUS_DEVICE(dev), ...);
+|
+    qdev_realize(DEVICE(dev), ...);
+|
+    qdev_realize_and_unref(DEVICE(dev), ...);
+)
+
+// str DEVICE(obj)
+@@
+expression obj;
+expression prop, val;
+@@
+-   object_property_set_str(obj, prop, val, ... /* &error_abort */);
++   qdev_prop_set_string(DEVICE(obj), prop, val);
+    ...
+(
+    sysbus_realize(SYS_BUS_DEVICE(obj), ...);
+|
+    qdev_realize(DEVICE(obj), ...);
+|
+    qdev_realize_and_unref(DEVICE(obj), ...);
+)
+
+
+// int OBJECT
+@@
+typedef DeviceState;
+identifier dev;
+expression prop, val;
+@@
+    DeviceState *dev;
+    ...
+-   object_property_set_int(OBJECT(dev), prop, val, ... /* &error_abort */);
++   qdev_prop_set_XintXX(dev, prop, val);
+
+// int dev
+@@
+expression dev;
+expression prop, val;
+@@
+-   object_property_set_int(OBJECT(dev), prop, val, ... /* &error_abort */);
++   qdev_prop_set_XintXX(dev, prop, val);
+    ...
+(
+    sysbus_realize(SYS_BUS_DEVICE(dev), ...);
+|
+    qdev_realize(dev, ...);
+|
+    qdev_realize_and_unref(dev, ...);
+)
+
+// int DEVICE(dev)
+@@
+expression dev;
+expression prop, val;
+@@
+-   object_property_set_int(OBJECT(dev), prop, val, ... /* &error_abort */);
++   qdev_prop_set_XintXX(DEVICE(dev), prop, val);
+    ...
+(
+    sysbus_realize(SYS_BUS_DEVICE(dev), ...);
+|
+    qdev_realize(DEVICE(dev), ...);
+|
+    qdev_realize_and_unref(DEVICE(dev), ...);
+)
+
+// int DEVICE(obj)
+@@
+expression obj;
+expression prop, val;
+@@
+-   object_property_set_int(obj, prop, val, ... /* &error_abort */);
++   qdev_prop_set_XintXX(DEVICE(obj), prop, val);
+    ...
+(
+    sysbus_realize(SYS_BUS_DEVICE(obj), ...);
+|
+    qdev_realize(DEVICE(obj), ...);
+|
+    qdev_realize_and_unref(DEVICE(obj), ...);
+)
+
+//
+// link
+//
+
+// link OBJECT
+@@
+typedef DeviceState;
+identifier dev;
+expression prop, val;
+@@
+    DeviceState *dev;
+    ...
+-   object_property_set_link(OBJECT(dev), prop, val, ... /* &error_abort */);
++   qdev_prop_set_link(dev, prop, val);
+
+// link dev
+@@
+expression dev;
+expression prop, val;
+@@
+-   object_property_set_link(OBJECT(dev), prop, val, ... /* &error_abort */);
++   qdev_prop_set_link(dev, prop, val);
+    ...
+(
+    sysbus_realize(SYS_BUS_DEVICE(dev), ...);
+|
+    qdev_realize(dev, ...);
+|
+    qdev_realize_and_unref(dev, ...);
+)
+
+// link DEVICE(dev)
+@@
+expression dev;
+expression prop, val;
+@@
+-   object_property_set_link(OBJECT(dev), prop, val, ... /* &error_abort */);
++   qdev_prop_set_link(DEVICE(dev), prop, val);
+    ...
+(
+    sysbus_realize(SYS_BUS_DEVICE(dev), ...);
+|
+    qdev_realize(DEVICE(dev), ...);
+|
+    qdev_realize_and_unref(DEVICE(dev), ...);
+)
+
+// link DEVICE(obj)
+@@
+expression obj;
+expression prop, val;
+@@
+-   object_property_set_link(obj, prop, val, ... /* &error_abort */);
++   qdev_prop_set_link(DEVICE(obj), prop, val);
+    ...
+(
+    sysbus_realize(SYS_BUS_DEVICE(obj), ...);
+|
+    qdev_realize(DEVICE(obj), ...);
+|
+    qdev_realize_and_unref(DEVICE(obj), ...);
+)
-- 
2.38.1

