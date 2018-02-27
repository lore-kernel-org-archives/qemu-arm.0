Received: by 10.28.71.27 with SMTP id u27csp4678498wma;
        Tue, 27 Feb 2018 02:49:52 -0800 (PST)
X-Google-Smtp-Source: AH8x227TDHCiQQ4lkbVn1D+VwkEnud+jTfn9Kh9a3nUoNOV1WgRsIDV02uxyt9jABqEHn2yUhRag
X-Received: by 10.13.225.18 with SMTP id k18mr8813700ywe.512.1519728592135;
        Tue, 27 Feb 2018 02:49:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519728592; cv=none;
        d=google.com; s=arc-20160816;
        b=WeRKx+vRj5eBj3l6r1hGXEe75DD23INK29l3POZlozKHRXTRTtxoFEbeYAVgNwJv9b
         8nJkCa76VPEESOKKZXgVGegEjlDHU7iQZt4aAlm5eW6vybtm1mWw0v0cs/OniLHWzuob
         hBIIj61gtLVl247qmxjyh2zGXaNOT5q7VfQLfknHTNlkeq0kjj5w3iwXyBrWIjagLbHj
         0zheRmlJvNh96lq7tn81wwp0SdFQQU2dP067s9NfwLzvInGhkbrJRqaz60xfd4tSSw0i
         3D6tQ3zXBF6yxt3Ljsz1qQQVuWVbsLQkviCbAOvM3tKaCXjyd/hbkdjFnOSi2bqZn8KK
         1wmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Twqxi8BDJv63Fx0OmA4mzSxVFDLjBcftrJ1XbHyLRmQ=;
        b=Yn26bGC3EtoIVxIoPJBiGl1XIYGgLKCLBrIC7TLLiu2UdLBnhvlE96tqwSipISx2Xx
         2v7yvdbXM0KAK1tZrTnNfoCTCAr3huC+YYfQww020E5kUAQjNbLBGrJuzL8uKeXn0xF8
         sS0NZUNGsxC4oadl5gLmq3bIwzJ1lX1sJXDtW2ftalRN3EKnD7MaWY9abHjVetOwtH54
         lw4XZzlVLua+PhJkwT/ylMj2qe8HzAwEMdhGdxv9Oqq/tO4ojh3Di5BBprMcXCnNexhm
         JQinklfxKbQgvPxdFtY8zPqbkTw0KoaCQOK5TV4edJ9kchNiHHCi0TF55R88ftVwXOOs
         fIZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gsFOflii;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z7si1824018ywj.123.2018.02.27.02.49.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 02:49:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gsFOflii;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36160 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqcpT-0006Kj-HQ
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 05:49:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1eqcos-0006Jh-Gr
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 05:49:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1eqcor-0004BV-Gv
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 05:49:14 -0500
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:40229)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linus.walleij@linaro.org>)
	id 1eqcor-0004Ah-8D
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 05:49:13 -0500
Received: by mail-lf0-x241.google.com with SMTP id 37so26791850lfs.7
	for <qemu-devel@nongnu.org>; Tue, 27 Feb 2018 02:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Twqxi8BDJv63Fx0OmA4mzSxVFDLjBcftrJ1XbHyLRmQ=;
	b=gsFOfliisx+w6qA4RO3mVDUwM5nSPZShAx3JM5hCUcVT9Pg9+HQLROmqmEGRsaxIuz
	K26oAFpzc29d/UgKbOn2AngiH5oRtGhWGDCE08T6w9dIlPQVfLLjkOZuBz+j9ByYKu2s
	GOLVy5iuIzcNTNcC638XvoQ8vKAq9pVmIUUG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Twqxi8BDJv63Fx0OmA4mzSxVFDLjBcftrJ1XbHyLRmQ=;
	b=rqO2jGSkmYbYOrYzQjQZXT25D+qarCY7EDpuD3zyyf1mjDlHgz2vENV1EjViHrNNdt
	WL0M0Q3yoQXOMEv1xpO4thDvvyyQKtjv0F2E9fzB0jSxsmu7SjtC7KLylZf+124KQasj
	0dlgMN/5j8IDzE/rT7XESw1/uLkEVG3FiehHOkGgQUI/lGpFQQ4DEE5k0WG/9yEp+G02
	Qt9OB/TrjsnUX49NoEOiua6hL8eVwc4es3+VPaUI71oUfcRboZgEk44c8c0NJT6Eo2KC
	JVG9E53zCxDgaRMQz6mmi8+Osv3RKt18We74kuxKZK78luqBukPC1ZZDegHQ+MNiI5DF
	AmIQ==
X-Gm-Message-State: APf1xPC185/zPvXQ7WkLRbsv3qAW7AArdtDnCiiGtK3nHqLEUSty6IKi
	wQu+DlmVHE9gLAcz1SeFlrtg/IfqjYw=
X-Received: by 10.25.43.136 with SMTP id r130mr10141019lfr.48.1519728551677;
	Tue, 27 Feb 2018 02:49:11 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
	by smtp.gmail.com with ESMTPSA id 74sm2484148ljq.32.2018.02.27.02.49.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 27 Feb 2018 02:49:10 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 11:49:00 +0100
Message-Id: <20180227104903.21353-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180227104903.21353-1-linus.walleij@linaro.org>
References: <20180227104903.21353-1-linus.walleij@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: [Qemu-devel] [PATCH 2/5] i2c: Move the bus class to i2c.h
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>,
	Linus Walleij <linus.walleij@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eZnZTmWGfCWc

From: Corey Minyard <cminyard@mvista.com>

Some devices need access to it.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 hw/i2c/core.c        | 17 -----------------
 include/hw/i2c/i2c.h | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index 9a54b61c1dbd..cfccefca3d6c 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -10,30 +10,13 @@
 #include "qemu/osdep.h"
 #include "hw/i2c/i2c.h"
 
-typedef struct I2CNode I2CNode;
-
-struct I2CNode {
-    I2CSlave *elt;
-    QLIST_ENTRY(I2CNode) next;
-};
-
 #define I2C_BROADCAST 0x00
 
-struct I2CBus {
-    BusState qbus;
-    QLIST_HEAD(, I2CNode) current_devs;
-    uint8_t saved_address;
-    bool broadcast;
-};
-
 static Property i2c_props[] = {
     DEFINE_PROP_UINT8("address", struct I2CSlave, address, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-#define TYPE_I2C_BUS "i2c-bus"
-#define I2C_BUS(obj) OBJECT_CHECK(I2CBus, (obj), TYPE_I2C_BUS)
-
 static const TypeInfo i2c_bus_info = {
     .name = TYPE_I2C_BUS,
     .parent = TYPE_BUS,
diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 8fd449f645f0..d727379b487a 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -56,6 +56,23 @@ struct I2CSlave {
     uint8_t address;
 };
 
+#define TYPE_I2C_BUS "i2c-bus"
+#define I2C_BUS(obj) OBJECT_CHECK(I2CBus, (obj), TYPE_I2C_BUS)
+
+typedef struct I2CNode I2CNode;
+
+struct I2CNode {
+    I2CSlave *elt;
+    QLIST_ENTRY(I2CNode) next;
+};
+
+struct I2CBus {
+    BusState qbus;
+    QLIST_HEAD(, I2CNode) current_devs;
+    uint8_t saved_address;
+    bool broadcast;
+};
+
 I2CBus *i2c_init_bus(DeviceState *parent, const char *name);
 void i2c_set_slave_address(I2CSlave *dev, uint8_t address);
 int i2c_bus_busy(I2CBus *bus);
-- 
2.14.3

