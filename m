Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp989011eju;
        Fri, 15 Mar 2024 06:09:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW02Z56UWnFOWVD3Vwi0ttPnkqVojpxs2EWmSma1NFdP8+KwKbK6EOaJlo2Rv89wpUZ0isXJzzfwNO9prdpgyIu917V8UDS
X-Received: by 2002:a17:907:3594:b0:a44:e34a:792f with SMTP id ao20-20020a170907359400b00a44e34a792fmr3027328ejc.15.1710508174385;
        Fri, 15 Mar 2024 06:09:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710508174; cv=none;
        d=google.com; s=arc-20160816;
        b=qvmJwSVGFdmJZxS6xcr59tpn/aryjOqJ9RqPkE3waKE3BhjBObFNGEZkPA4N+PteYn
         VMQj6uCjqpjBadHGi5rjO2u9cV1N7FcD1JAyW5q+1Zdk+dYnq0UsjcsAFZysGNfbjMaQ
         dYoTbl8G897l38WNRnzfDCoIWMRP3cKzrsI5zH44qhY57+u+YxRELUqNzTdVPt79udFZ
         RbFG+P4aBAkGELSN27DZIwI7uHHYWe+/DVFip5EaPS/zFhZWXDpqX9QQiWIUWQckSn4q
         r5fIKBykJoj8XlPbhHN80jTFX6I3YMFC+8Ea/jYznLKx3QI+vTBNd6Xjl1tK+aS8Oy7W
         7VcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=QXR+KoDyjF3DzCtPRlneMC/cDzpoxSokp1VWknBDtAc=;
        fh=A1yJP7hR2hAZDDCZ8YC2QGTOM8vdD3b4IExP5XujwdI=;
        b=P/oQWdKlP4MYxlSQPwzwYnm/ka1rHSaz+veF92PmFlBhvIRrokjhVUuZSTS/0gZj87
         i0WgfgExF4lQ7RIDrm+eo9TZTrnXL11+wn7bDyAZoIZiE+0NlaJyRyeGTR7hg+k1FibV
         yFeXg8vOjC7AjdBS+rEoLR2gjTBfHf4zaDZ1QbiB81SgbT5sZ6VgnA/ImlCuZByjWX/o
         4f0oXiDXG+8cqCcpR1F5AX7ipPz9auvWFK9pMfB8DJ7nIWm10gMkpByWh98EZOi8/4dx
         rEqiFwi3nUAbJzIoZItgm2yvtrR2dPC3lLDbXutzF/SIBrKVZIn+NhBTrSVyme+u/fyE
         euvQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zXDxuXZH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z14-20020a170906074e00b00a4665858df5sor1270076ejb.18.2024.03.15.06.09.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Mar 2024 06:09:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zXDxuXZH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710508174; x=1711112974; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXR+KoDyjF3DzCtPRlneMC/cDzpoxSokp1VWknBDtAc=;
        b=zXDxuXZHi2PMzhg1JuZAh9DaM/0/2w2mstqrn6SkVjno6L4TvOLGo56GX85a/dMT+y
         BpHqp9CI/rl7jB3Wj3ruvsCPazJC1CyP7sQoFza6rW73JlCUmC1yPlEkvilVoso8i4tE
         YdI+X4NPbaGawD+KToW+NwzL26/g25RKUZr1ann5PCytyiPH9eZkIG0Npn7EzkDuHw0x
         um7wMrzSEVb0vNIfKxhiTUSTNp13RQ7y7SP1wt2dD7BXmIrF8BPPTLRY/T21leU1qNXd
         cPs9ZxPFbE+IMZShoh4nfmJL0OsdvdjJY20yriYyxqdeY1gCvrdQYjIG7gJUq5TS2t8K
         7u0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710508174; x=1711112974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QXR+KoDyjF3DzCtPRlneMC/cDzpoxSokp1VWknBDtAc=;
        b=bL/cqDgZFO+i0h21KE41qba6IEc1QrWsoLFLAw4o0bW80hAXn08eJfVWFEGquCQqZ0
         Ktb/RU6eYpn3qytC/4zR7xcFOp2mWAJPxcp6X86K0uoFVIo8ZSj8WF7V1MEV3W7J09Yl
         q6BQSrLOV+8sAn3jMGJUC8sOPeWpWhPh56DloIA4pNbVyZ895RD5wjjcCHCxtba1yjMi
         7A7zdI71pAW/45uHqrjnAR7O43X8C5ZofwapPf9NmBKEeJcwRBHkpQBN49FLsbosGbWy
         9wAGh2C+S0/2VmydfhkfSK4XoXKqYZKmhVyysi7eNFJRW3USQbiUw0TnKStASkM0/QLb
         Hipw==
X-Forwarded-Encrypted: i=1; AJvYcCXU/i/E/0WqiUJc4pPETr7WBsxsiUCpQNKmqlrarH6vPC/3SiS3rkr+h65tGp3GjJuIGBDNFC1EU20MQ9MzH4OVBwQMTXV5
X-Gm-Message-State: AOJu0Yx6fRRJGPnTWYtgPkj1s1B6wCDeXYG+HHyS5I3F5YfiCCzWW3Lb
	UZKlK5fZ/RDUZWljP6Ti1SUGU1boZh7RshJZTJ7MmdGA501kK1siMv4L8dSDfHnnJw==
X-Google-Smtp-Source: AGHT+IHzBClF6y3leG9X1IH7huHpryichprPqecACIGO7r5xFYMO3bWZ334I3If9L1+1vr9CkQSmGw==
X-Received: by 2002:a17:906:c30f:b0:a46:2a85:b37b with SMTP id s15-20020a170906c30f00b00a462a85b37bmr2902264ejz.51.1710508173970;
        Fri, 15 Mar 2024 06:09:33 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.145.26])
        by smtp.gmail.com with ESMTPSA id v23-20020a1709067d9700b00a461a7ba686sm1707470ejo.75.2024.03.15.06.09.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 15 Mar 2024 06:09:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-riscv@nongnu.org,
	Anton Johansson <anjo@rev.ng>,
	qemu-s390x@nongnu.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH-for-9.1 03/21] target/ppc: Declare CPU QOM types using DEFINE_TYPES() macro
Date: Fri, 15 Mar 2024 14:08:51 +0100
Message-ID: <20240315130910.15750-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240315130910.15750-1-philmd@linaro.org>
References: <20240315130910.15750-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: mW5Ax9/nJWBI

When multiple QOM types are registered in the same file,
it is simpler to use the the DEFINE_TYPES() macro. In
particular because type array declared with such macro
are easier to review.

In few commits we are going to add more types, so replace
the type_register_static() to ease further reviews.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231013140116.255-16-philmd@linaro.org>
---
 target/ppc/cpu_init.c | 52 +++++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 29 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 7e65f08147..d5e227a6fb 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7432,39 +7432,34 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
 #endif /* CONFIG_TCG */
 }
 
-static const TypeInfo ppc_cpu_type_info = {
-    .name = TYPE_POWERPC_CPU,
-    .parent = TYPE_CPU,
-    .instance_size = sizeof(PowerPCCPU),
-    .instance_align = __alignof__(PowerPCCPU),
-    .instance_init = ppc_cpu_instance_init,
-    .instance_finalize = ppc_cpu_instance_finalize,
-    .abstract = true,
-    .class_size = sizeof(PowerPCCPUClass),
-    .class_init = ppc_cpu_class_init,
+static const TypeInfo ppc_cpu_types[] = {
+    {
+        .name           = TYPE_POWERPC_CPU,
+        .parent         = TYPE_CPU,
+        .abstract       = true,
+        .instance_size  = sizeof(PowerPCCPU),
+        .instance_align = __alignof__(PowerPCCPU),
+        .instance_init  = ppc_cpu_instance_init,
+        .instance_finalize = ppc_cpu_instance_finalize,
+        .class_size     = sizeof(PowerPCCPUClass),
+        .class_init     = ppc_cpu_class_init,
 #ifndef CONFIG_USER_ONLY
-    .interfaces = (InterfaceInfo[]) {
-          { TYPE_INTERRUPT_STATS_PROVIDER },
-          { }
+        .interfaces     = (InterfaceInfo[]) {
+              { TYPE_INTERRUPT_STATS_PROVIDER },
+              { }
+        },
+#endif
+    },
+#ifndef CONFIG_USER_ONLY
+    {
+        .name           = TYPE_PPC_VIRTUAL_HYPERVISOR,
+        .parent         = TYPE_INTERFACE,
+        .class_size     = sizeof(PPCVirtualHypervisorClass),
     },
 #endif
 };
 
-#ifndef CONFIG_USER_ONLY
-static const TypeInfo ppc_vhyp_type_info = {
-    .name = TYPE_PPC_VIRTUAL_HYPERVISOR,
-    .parent = TYPE_INTERFACE,
-    .class_size = sizeof(PPCVirtualHypervisorClass),
-};
-#endif
-
-static void ppc_cpu_register_types(void)
-{
-    type_register_static(&ppc_cpu_type_info);
-#ifndef CONFIG_USER_ONLY
-    type_register_static(&ppc_vhyp_type_info);
-#endif
-}
+DEFINE_TYPES(ppc_cpu_types)
 
 void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
@@ -7658,4 +7653,3 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 #undef RGPL
 #undef RFPL
 }
-type_init(ppc_cpu_register_types)
-- 
2.41.0
