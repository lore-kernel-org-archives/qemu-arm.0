Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp435833wrp;
        Mon, 11 Feb 2019 23:49:07 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY4AHDEmC3Wk2sxHsZzSdxXdo5oObyA9Zq8XvWZDTgyDCf6a8pjoucENCCgcQLqwdQ18wUx
X-Received: by 2002:a25:b55:: with SMTP id 82mr1724126ybl.23.1549957747271;
        Mon, 11 Feb 2019 23:49:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549957747; cv=none;
        d=google.com; s=arc-20160816;
        b=c0ITKVDqquThmMFLJvgtznNL9gJm4AbGXAQHyFgGy5g8Rke66xyS0h1K/GPz7V6TUu
         ZeCM3z6hSoKamUocxxBbQ2+JxhhBEpHv7M3CjgUZLxTf9BnEnk/CPtCC1eAn8F5X97O9
         gmUhz/vLbdZbymuVoUiYZiKxYs0d0Ngr/FYAx2FTYuwstr3vNZcwqRGVaujNCvqrZR41
         IkO09Yah9LGGSO/NAcY67PpQNY+Ka0/Q4vDNc3Fb128EpYqklELnsp5ylskdVox7mEn+
         sKTvpsRBezYbUGk8sBwXFZsr7T/jtU1I2K2sjf4BaOi9uGKi9PXwdu6Gt+m3Tv6/egjg
         5IiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=8VR2NCBStrzK5fg9pKiT2jRDK0BBrG59FKQTP8Fe2kc=;
        b=ZPP7+TK4NK0laUQBIKWnxPPIEs06875JMA7BAFMc8QFfhg85E1qWRLFxyG+xEsEZ+J
         l1nyD66fsGTsko1cR6E+e9APd0do7n8NW0uP1o1NwV/cRU9N4VZfdVReO882KUtoanQY
         ECEjB8yG9a1w6MYNd2bG0XesFERj28Nj390l3MxKVqCsiUeKI7JV7j9AKMa+fFBPAFFp
         AARVm7olYXtcoVjfxm3GZ0NIcioVTmhT2Zi2w5XBwuQuCCuOCcuvuEVTzYKT4RzhlZ1l
         XdhiMO7i8xyw0gpJpZCDI0o5AUZWWXZKebhFQD/5DQN86t8g50sL5Lm6fpXin+g5E4gO
         jbew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LhsLS70k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n145si7129183yba.166.2019.02.11.23.49.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 23:49:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LhsLS70k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35139 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtSoU-0004GQ-NL
	for alex.bennee@linaro.org; Tue, 12 Feb 2019 02:49:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtSoI-0004Di-GC
	for qemu-arm@nongnu.org; Tue, 12 Feb 2019 02:48:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtSoH-0005zR-1A
	for qemu-arm@nongnu.org; Tue, 12 Feb 2019 02:48:54 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:46121)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtSoF-0005p4-0y
	for qemu-arm@nongnu.org; Tue, 12 Feb 2019 02:48:52 -0500
Received: by mail-pg1-x544.google.com with SMTP id w7so857360pgp.13
	for <qemu-arm@nongnu.org>; Mon, 11 Feb 2019 23:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8VR2NCBStrzK5fg9pKiT2jRDK0BBrG59FKQTP8Fe2kc=;
	b=LhsLS70kgj/RdIrmlBo6//j//aOLLWl5Wn9Go8Wqcjx4bXDGgdZXjB9+Wi5OdXdybd
	4nY+4c2/seoObNh4gEDleTnVBXVMO7rCSA2Y8Rbn8K687jRvlsEjSDFz1UScCtWzvoi6
	tq1zfmMOAeFr6zp2pJFgHcRbFZMWoWvx+xCn0JMtk0VT0zN4bSArV1kupWZ8mf7t3Te+
	5m7IXPJw6NDGUgR3Sz5Uv849e/5XqJx7HE5YQWt7aFxP6AyPwZUtTs0cUeReP72LE+wt
	yDnoWkINh4dD+VR7CwqgKBf/AbDbbXhCj1M1/s3uER5NhWrZcUhc3IazoLrXguc43E0o
	aayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8VR2NCBStrzK5fg9pKiT2jRDK0BBrG59FKQTP8Fe2kc=;
	b=bGWt89eSeZr0P1iFS5WPflC8aJIe4OKEcRz/q5kwmP/+QoB+nhfzGEtt3CQ4zTUDdR
	IISOpZfc03uqjUlzl1B9xuAWE4fg8m5VDUI5jYMLncOphVx2/LF/RazAhNfypWQGapKA
	48nJhn6NJ8RnDBV9UIyPauqHsn6XyJ0aixFX6u2PmfVMevhP2FbxyolhE3kyKgyKAThb
	uKV5TYw7R4J0SEGZ5+76JZIC0nKEfG1sMHCOf1kZOGOJJ3iuDXS4e5iELE4s/NfuAzSQ
	eWs0EJPJTNw1wDuFQu+DI7HOjdxezN95I4gXtA+iuHLDkjTvpegq1x9js8fIpusGIo2U
	D4Hw==
X-Gm-Message-State: AHQUAubPT2fOTXTC+Pm4QMeLKoeT9acphLOtvCeEZ1iRVYMKrrQxBYcB
	MnOIgGqXpQHjtgC1hfIEZa56y1M/WEQ=
X-Received: by 2002:a65:5c02:: with SMTP id u2mr2419976pgr.13.1549957723505;
	Mon, 11 Feb 2019 23:48:43 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	z62sm20975215pfi.4.2019.02.11.23.48.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 23:48:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 23:48:39 -0800
Message-Id: <20190212074840.13542-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190212074840.13542-1-richard.henderson@linaro.org>
References: <20190212074840.13542-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-arm] [PATCH v2 1/2] linux-user: Add ELF_PLATFORM for arm
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
Cc: qemu-arm@nongnu.org, laurent@vivier.eu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dwR0mmYarHk3

The 32-bit kernel has strings for v4, v5, v6, v7, v7m.
The 64-bit kernel, in compat mode, has strings for v8.

Fixes: https://bugs.launchpad.net/bugs/1813034
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Include v8.
---
 linux-user/elfload.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 775a36ccdd..d796d51ec6 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -500,6 +500,37 @@ static uint32_t get_elf_hwcap2(void)
 #undef GET_FEATURE
 #undef GET_FEATURE_ID
 
+#define ELF_PLATFORM get_elf_platform()
+
+static const char *get_elf_platform(void)
+{
+    CPUARMState *env = thread_cpu->env_ptr;
+
+#ifdef TARGET_WORDS_BIGENDIAN
+# define END  "b"
+#else
+# define END  "l"
+#endif
+
+    if (arm_feature(env, ARM_FEATURE_V8)) {
+        return "v8" END;
+    } else if (arm_feature(env, ARM_FEATURE_V7)) {
+        if (arm_feature(env, ARM_FEATURE_M)) {
+            return "v7m" END;
+        } else {
+            return "v7" END;
+        }
+    } else if (arm_feature(env, ARM_FEATURE_V6)) {
+        return "v6" END;
+    } else if (arm_feature(env, ARM_FEATURE_V5)) {
+        return "v5" END;
+    } else {
+        return "v4" END;
+    }
+
+#undef END
+}
+
 #else
 /* 64 bit ARM definitions */
 #define ELF_START_MMAP 0x80000000
-- 
2.17.2

