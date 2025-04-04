Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp5087018njd;
        Fri, 4 Apr 2025 15:36:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUkSEh0dNEW6EJi03kMem9kSvwWWHVRvSCvF96Ov7uzXChSs8hrWvWr/q56SxgPweTUVS0J+wZQ040E8w==@linaro.org
X-Received: by 2002:a5d:648e:0:b0:391:2c0c:1247 with SMTP id ffacd0b85a97d-39cb36b2a7bmr4710121f8f.1.1743806163764;
        Fri, 04 Apr 2025 15:36:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743806163; cv=none;
        d=google.com; s=arc-20240605;
        b=Pc3uFU2e/PJwckZ4tqFUHpAImILP9JhTGRRFXrxly7YKuF8mF/pHenMw5xz70onwYW
         K1zmAQ92RsBmU/QtVistHaWyBAeF+aGzF25C7g+jM5eBMb/4LtSSA4LDuQKYOPgf+PuD
         8hh5s1oc+XMIyAfLt9unBhSItx/zYTujcjlvD0k+3hEJk+YQGMkonzqd6SgjBGawv+0e
         5mIc+fF98wbvW8osPIaM+l9TXtw151Nn1OoJStXvzNY09YXv/+HBTTIlDAWzVv2fTblo
         YPM/8j19G9lugxk+ieFRuVTQ+HeypXBl92hSG/e67wRj05H22VV7+JpUX17KWedm3zHx
         5rqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=UbtmmP0oOdI2W/ScvwaiV+7++EOQsRdn8KA47Nc8msw=;
        fh=cN7fZPBtKZJYKMD/u8MEHQ9KqrYbBk7t5hCaOaVMzKo=;
        b=Cf6wj7DlKBoW53KCLz2lhg0gDa2RCAoIQ4HHPVlP8LNx86odgBActbZq+XS6lU+Gxt
         h2AJD1wGbMKuMfdWkIqH5tpm6VYKLgjnLwz2TMzzk9Y2p4KrDyFvMbYhnbh5xfGNHeS/
         5llWTOl9rEq5a4PT1ONEmBB88jbOsCP0kmSCT0J41xv/svFzyJ+Lt3YGc5WVRLNhz4CH
         FoigwBoNiqKbVPM5M79N0HIsddSirCY8SQToyVuharXi3+I6J5559T8gON686RxZc/mn
         B+y+1X3Cmc/iN/G2hs2B4lglrymsSUdhWm4de6JgO91pbMxL4eykeoMrbIQPf7pwC8Fo
         J6dw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZeUBMGE3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43ec2c6f89csor20835635e9.11.2025.04.04.15.36.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Apr 2025 15:36:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZeUBMGE3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743806163; x=1744410963; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbtmmP0oOdI2W/ScvwaiV+7++EOQsRdn8KA47Nc8msw=;
        b=ZeUBMGE3nsVJXN+VIHwpsuZ9NBKQiymmB01UzGrPioYmrLh25+CSZmpbCHPPBKP1Bk
         IaYh1P0p30WLd511UA/gJp/gKMuzZoWd6DJOMwD8ZYHpILZRM2qDXCBaKScCEbaKMtcR
         kzLGzTpOBePrtI6vBgllnceHUvBsAwHeMopMHKRDkZDHqd1pJdARp/VKUHbrvGI/O+Sj
         n4wnwtl5DGsK2r0u8OGOLkE3WtN5YeQGZkvT7ksbXVtVRKaQppz51dY78byKlgYRgktr
         76ZLSW9/rFNOC9OLyijuSJ/+jVD2R8KGmni7eS01iIKweO8hwSKN8PGkgQ7Eg2TkJr+f
         67bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743806163; x=1744410963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbtmmP0oOdI2W/ScvwaiV+7++EOQsRdn8KA47Nc8msw=;
        b=JbNtf8eo6nVXeZCWr/DEjkQE8xwViotuc4kupDzmvR6LVgd8EZ/k/drliYQcx+fFZ8
         +CW9sRVe3/YvbNHJvosryOv1TmyhoEnpWMwpysGo4BAmiTfUvDrJ+FWgRbPikjaT1pR8
         v9i2elTii9bk8QVgX4NDYxhoacRCtI66j5L2y/zkOEqp8s+VyoILz5qpN5pd/WB613XX
         v0iBvyFsf/nCHNO0E5ec8hyiW9k7ZTwmg3GZi3+cJEVD/kJ5MDgW85DYCpUdo7+6RrsB
         Fy8VPoYH9oJanRVjcNS7m1A0aJVEyQEF0tLr2PF3V1vVr0kRNgvQrbhqaRUG/aDkDiGK
         v6+A==
X-Forwarded-Encrypted: i=1; AJvYcCX2Lc70p5bm7BAPtPwRRyf4U72rm3nNyPRJxGOL3xJfjum9I7sTQcP5SYZ35fVGl2TFp7GazGHfvImwWw==@linaro.org
X-Gm-Message-State: AOJu0Yzk+jD86VcfV9X+Bu09eM/BfrxUWJ7ktjLVnWmkhbEUUmwZdiWX
	gzoqD8zxM7Q8Ed/yzGkwr3HpYfui0akwhDeEIL5tkcXuaWZHjS2sumdATPd5JDRBpA==
X-Gm-Gg: ASbGncuFNqLnlni/m54obbH/+V8oCFthJCKRvUTpj5k72XTEinRwNcpT4KEJFLqZcz6
	n38V7IinWainkp1Zkspyq9jwQ+kE1pGt9T49ZIdF9Yim/XGUheQkdgOLJ3TrkM+s3UyoJkAdVdN
	CwiLTkCb3g67wrYl4452EDbosM60FVLljcooV+VRW304YKXHZ8JjLzzD01kEdWDLLm8wBAsoZzg
	pa+ObdYGvtLpOQwiQPz6acoLpEeCaXy+07bcBB4AQtAOrLVw5f+ahOQJMPYuUuli7YqirJ6I6Rk
	+vmnyCXdGE+PgjVTSa65rxXZ3QHcmeE3sDr6BfcshwDMeSAhXkIsYKtxtezOCdj5ECCt+Nv+04S
	NTKbOyJkrCBRnmxaRt28QNrgQ
X-Google-Smtp-Source: AGHT+IGSdr7DxbVwhuVhiX68wKER9VgzAYsNnLkEibQmdNkzqlLvtbByQegi0We/lY/E/p0KaHYHdw==
X-Received: by 2002:a05:600c:1e03:b0:43d:683:8cb2 with SMTP id 5b1f17b1804b1-43ecf8ceb2dmr46985395e9.14.1743806163033;
        Fri, 04 Apr 2025 15:36:03 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec342a3dfsm57630445e9.4.2025.04.04.15.36.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Apr 2025 15:36:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 8/9] linux-user/arm: Implement MTE stubs for 32-bit user emulation
Date: Sat,  5 Apr 2025 00:35:20 +0200
Message-ID: <20250404223521.38781-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250404223521.38781-1-philmd@linaro.org>
References: <20250404223521.38781-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: dBqTQNjrKtqe

We want to build MTE code once, but on linux-user it calls
arm_set_mte_tcf0() which is only defined for Aarch64.
Expose the declaration on 32-bit ARM by renaming
aarch64/mte_user_helper.h -> arm/mte_user_helper.h, then
add a stub in arm/mte_user_helper.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 linux-user/aarch64/mte_user_helper.h | 27 +---------------------
 linux-user/arm/mte_user_helper.h     | 34 ++++++++++++++++++++++++++++
 linux-user/arm/mte_user_helper.c     | 13 +++++++++++
 linux-user/arm/meson.build           |  2 ++
 4 files changed, 50 insertions(+), 26 deletions(-)
 create mode 100644 linux-user/arm/mte_user_helper.h
 create mode 100644 linux-user/arm/mte_user_helper.c

diff --git a/linux-user/aarch64/mte_user_helper.h b/linux-user/aarch64/mte_user_helper.h
index 0c53abda222..63f63abff62 100644
--- a/linux-user/aarch64/mte_user_helper.h
+++ b/linux-user/aarch64/mte_user_helper.h
@@ -6,29 +6,4 @@
  * SPDX-License-Identifier: LGPL-2.1-or-later
  */
 
-#ifndef AARCH64_MTE_USER_HELPER_H
-#define AARCH64_MTE USER_HELPER_H
-
-#include "user/abitypes.h"
-
-#ifndef PR_MTE_TCF_SHIFT
-# define PR_MTE_TCF_SHIFT       1
-# define PR_MTE_TCF_NONE        (0UL << PR_MTE_TCF_SHIFT)
-# define PR_MTE_TCF_SYNC        (1UL << PR_MTE_TCF_SHIFT)
-# define PR_MTE_TCF_ASYNC       (2UL << PR_MTE_TCF_SHIFT)
-# define PR_MTE_TCF_MASK        (3UL << PR_MTE_TCF_SHIFT)
-# define PR_MTE_TAG_SHIFT       3
-# define PR_MTE_TAG_MASK        (0xffffUL << PR_MTE_TAG_SHIFT)
-#endif
-
-/**
- * arm_set_mte_tcf0 - Set TCF0 field in SCTLR_EL1 register
- * @env: The CPU environment
- * @value: The value to be set for the Tag Check Fault in EL0 field.
- *
- * Only SYNC and ASYNC modes can be selected. If ASYMM mode is given, the SYNC
- * mode is selected instead. So, there is no way to set the ASYMM mode.
- */
-void arm_set_mte_tcf0(CPUArchState *env, abi_long value);
-
-#endif /* AARCH64_MTE_USER_HELPER_H */
+#include "../arm/mte_user_helper.h"
diff --git a/linux-user/arm/mte_user_helper.h b/linux-user/arm/mte_user_helper.h
new file mode 100644
index 00000000000..0c53abda222
--- /dev/null
+++ b/linux-user/arm/mte_user_helper.h
@@ -0,0 +1,34 @@
+/*
+ * ARM MemTag convenience functions.
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+#ifndef AARCH64_MTE_USER_HELPER_H
+#define AARCH64_MTE USER_HELPER_H
+
+#include "user/abitypes.h"
+
+#ifndef PR_MTE_TCF_SHIFT
+# define PR_MTE_TCF_SHIFT       1
+# define PR_MTE_TCF_NONE        (0UL << PR_MTE_TCF_SHIFT)
+# define PR_MTE_TCF_SYNC        (1UL << PR_MTE_TCF_SHIFT)
+# define PR_MTE_TCF_ASYNC       (2UL << PR_MTE_TCF_SHIFT)
+# define PR_MTE_TCF_MASK        (3UL << PR_MTE_TCF_SHIFT)
+# define PR_MTE_TAG_SHIFT       3
+# define PR_MTE_TAG_MASK        (0xffffUL << PR_MTE_TAG_SHIFT)
+#endif
+
+/**
+ * arm_set_mte_tcf0 - Set TCF0 field in SCTLR_EL1 register
+ * @env: The CPU environment
+ * @value: The value to be set for the Tag Check Fault in EL0 field.
+ *
+ * Only SYNC and ASYNC modes can be selected. If ASYMM mode is given, the SYNC
+ * mode is selected instead. So, there is no way to set the ASYMM mode.
+ */
+void arm_set_mte_tcf0(CPUArchState *env, abi_long value);
+
+#endif /* AARCH64_MTE_USER_HELPER_H */
diff --git a/linux-user/arm/mte_user_helper.c b/linux-user/arm/mte_user_helper.c
new file mode 100644
index 00000000000..6fd19dc1073
--- /dev/null
+++ b/linux-user/arm/mte_user_helper.c
@@ -0,0 +1,13 @@
+/*
+ * ARM ARM MemTag user emulation stubs.
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "mte_user_helper.h"
+
+void arm_set_mte_tcf0(CPUArchState *env, abi_long value)
+{
+    g_assert_not_reached();
+}
diff --git a/linux-user/arm/meson.build b/linux-user/arm/meson.build
index 348ffb810d7..95e8c078e29 100644
--- a/linux-user/arm/meson.build
+++ b/linux-user/arm/meson.build
@@ -24,3 +24,5 @@ vdso_le_inc = gen_vdso.process('vdso-le.so',
 linux_user_ss.add(when: 'TARGET_ARM', if_true: [
     vdso_be8_inc, vdso_be32_inc, vdso_le_inc
 ])
+
+linux_user_ss.add(when: 'TARGET_ARM', if_true: [files('mte_user_helper.c')])
-- 
2.47.1
