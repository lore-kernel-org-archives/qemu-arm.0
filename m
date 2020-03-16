Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp250525lfe;
        Mon, 16 Mar 2020 09:07:29 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vujzFuXhmh8IbszPGQrcdg7Un05PBOf/iEsbGlI5X475GyS/mvyhtxgJ6rgXeKV+KF+oUF2
X-Received: by 2002:a1c:6146:: with SMTP id v67mr29524945wmb.78.1584374849070;
        Mon, 16 Mar 2020 09:07:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584374849; cv=none;
        d=google.com; s=arc-20160816;
        b=H83wFkm/Q4s73U0lkxe8cTq5eMhNDVVJzbTmDzcwdRRkEzX6zVQrIatm+SZGuNtzM8
         MPkQar1abte8C3iiXJO0M5Z+O5sUDkqZ/j5lwKTY0/osymqgBUPSFlcOZkajQuydOZrc
         1yeG6Xf665Bnhf1Rl9uO1aNZD3gXt/3k/reiUNnTXhqxfPfnPqyjxO/CmYdk3Pz2YCF2
         EeEPDj9jkxEIJNigSEg5spFpNGwz60jJBlldvFn03eYAlcRWIuVPElLaYAe1GcNveGdw
         h0U8TayNwRoEYC9oJO5pMfIOqBdn4/mxw0T0h8AEJrbkBlFtK4YvsNUmNhUJAmeLFib5
         /Ctw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5MseejxD/7No0UFmjuvYKtOzc/OHo7duv42MWn+BaII=;
        b=nZP4XeAsJRc89WDEghtGdWuMy2SLiSiAgUy3QDq0BC3WwIOF13VYBr2RfUq0kGdtEN
         eOcUnGUri7+8QG3cwkYtuDXOTn13BQYOcO6FO7Zw+4Ye8zUuXBOiHtTzauk1Sh0QEtld
         DODuA4q9jw9mW4dfFvw522IdvkzQu0A4+6gTGdVtFZrYn4/qCRPr8S60tbfukEQ4YViG
         cNsCLm9fjDEhB5TmfhVrsVVZ4pOtyx6xQ8xzsA9IwLIOIYbhQZVvLOJ36WubYeJo1RKd
         zWlhMgw2BLbIU1Fr0T9rpogdMTERpGzBvBJIHA1DbESONdSQlnbM2d/JnvibWc/Nz7Xy
         NsqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MjsUOyfO;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [216.205.24.74])
        by mx.google.com with ESMTPS id f10si253383wrq.455.2020.03.16.09.07.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Mar 2020 09:07:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) client-ip=216.205.24.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MjsUOyfO;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584374848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5MseejxD/7No0UFmjuvYKtOzc/OHo7duv42MWn+BaII=;
	b=MjsUOyfOw5B5aqAcs1Srh06XkDqiNVq9cNrjWtLv19RcFr48lEYtT84wdFqjQHj39AIH0/
	VQ7GCwhnK4CKCgU0MkrMfqeBTiknTchbl6RC0+/oiYQaEvi5i5KJZ+2+hwgEWkoJft3SVz
	d+XhQikjp7/40YRxzMe1M4vZS9JPwtg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389---411KgiPRq84xXGWqpXQA-1; Mon, 16 Mar 2020 12:07:22 -0400
X-MC-Unique: --411KgiPRq84xXGWqpXQA-1
Received: by mail-wm1-f70.google.com with SMTP id 20so4821572wmk.1
        for <alex.bennee@linaro.org>; Mon, 16 Mar 2020 09:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CXjQwOZg5TRrzV2gPeofWVxsNWA85AadaVJBm5vW278=;
        b=Wn8bE07rrotpF0h/LWwLZ1oqXE4SsNxLn2JxxJ4WBWGYrMxQbbiTla9cKrNg+77o5A
         FvodGE/S24iEcpUqA8nQyL+aUiiAz0a4vpktU2sOsqbYhEOB0+49EKJd9Nz5pHtmfd9a
         ae+JsBhaCPZOKh5YC1VRI/0M25Q3GJ2DhjbB1f2JzHzxNHmzW9ZzwVWXiASLshneTLSn
         SYypgkkfREtUKF7ueSCa3pxkFnr+FdIw+wiCVNddWwnqg/33G1em/tGmle+9/op1rtCr
         8cDuSlE9XXZZXqPnh7ItnTufKREujfO08CGkYahefRn0emTlFIDz380HdEO1lzIibuec
         rGtA==
X-Gm-Message-State: ANhLgQ00CuyI6VbpDRBwJn0BXzxVJIvmqWySBghlj2FTkmSBZF2+pWQt
	povNkTd+E1S4UJiR84M75AlNMmnsSCzxW0LaAFSFBcRvyefY7pXl14dt1+slLlI0BUUNk6nJP38
	lFEABpYj0WDD9sioI
X-Received: by 2002:adf:dd8f:: with SMTP id x15mr63151wrl.201.1584374841784;
        Mon, 16 Mar 2020 09:07:21 -0700 (PDT)
X-Received: by 2002:adf:dd8f:: with SMTP id x15mr63130wrl.201.1584374841621;
        Mon, 16 Mar 2020 09:07:21 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id u204sm185104wmg.40.2020.03.16.09.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 09:07:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 08/19] target/arm: Add semihosting stub to allow building without TCG
Date: Mon, 16 Mar 2020 17:06:23 +0100
Message-Id: <20200316160634.3386-9-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316160634.3386-1-philmd@redhat.com>
References: <20200316160634.3386-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: PSDo7oCa9SfG

Semihosting requires TCG. When configured with --disable-tcg, the
build fails because the 'do_arm_semihosting' is missing. Instead
of adding more few more #ifdeffery to the helper code, add a stub.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/arm-semi-stub.c | 13 +++++++++++++
 target/arm/Makefile.objs   |  3 ++-
 2 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 target/arm/arm-semi-stub.c

diff --git a/target/arm/arm-semi-stub.c b/target/arm/arm-semi-stub.c
new file mode 100644
index 0000000000..47d042f942
--- /dev/null
+++ b/target/arm/arm-semi-stub.c
@@ -0,0 +1,13 @@
+/*
+ * Arm "Angel" semihosting syscalls stubs
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "hw/semihosting/semihost.h"
+
+target_ulong do_arm_semihosting(CPUARMState *env)
+{
+    abort();
+}
diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 0c6f8c248d..fa278bb4c1 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -57,7 +57,8 @@ target/arm/translate.o: target/arm/decode-t16.inc.c
=20
 ifeq ($(CONFIG_TCG),y)
=20
-obj-y +=3D arm-semi.o
+obj-$(CONFIG_SEMIHOSTING) +=3D arm-semi.o
+obj-$(call lnot,$(CONFIG_SEMIHOSTING)) +=3D arm-semi-stub.o
=20
 endif # CONFIG_TCG
=20
--=20
2.21.1
