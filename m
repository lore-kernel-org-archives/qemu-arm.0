Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp864821lfb;
        Wed, 25 Nov 2020 13:36:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqLP8qzvBxRoIboinAhwpzlLxruRXXYM9FIFo1Lxwb7Z1niYD/G5ipy9/QHMmj+Snc5DQS
X-Received: by 2002:a17:90a:bd16:: with SMTP id y22mr6318211pjr.203.1606340194998;
        Wed, 25 Nov 2020 13:36:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606340194; cv=none;
        d=google.com; s=arc-20160816;
        b=fpBB2EeHJciX/v0rOe1LzH8JlHRXqvFpKyqgm1skzCylMKC67fNdsW38qxTbtoBSqZ
         TRNjUeUpNw9WgE3mwZgM5rodZN2tAgOJB5TewMhK4DuXAb7o5LUIoRHU1U0hwheaa+EB
         rA7JHrNEgRGqPI7uO62zemaG1CGym6104auclzqe71jEu9K0DcoQ73ld1/XTVPAzFZ4H
         hTHR9zFhZoIaELbkP/+5hsoxTyFHPoIROWMKgyqU1O5G2S+lRxVLq2KYffRNXGMQaoL2
         QSgA5oMLMt09oHurlmHZZUYkg1KVRvSSke6T7hIh2x8t4+so5KmbQr3INTA0tX9jL2GU
         bG7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=vGYL+yzMLYVHJC3s8eX4nzNsiu+mJjDkko6IjwYkb1A=;
        b=JFK6HysToHtiy6HYXYSAigpKofu0CTYvCwdrjYTBmGIn2aEPfmsrn3KDLGpqubbrBF
         mvb86sZCHakMx1KS/RylyBsZLXo7sn4ufyQIBEqwjff+S/5agnQhWEovLivaUhikXhmU
         UgnB8etQfkc6wtp26rTeid1D4qe7wPLhEZrd2SeCr44PUt9zqagZYaE3vWqgVL46lmNK
         37UVqzN13+MYJ0c08MoAAFcU6ZjC5T5sm+a6IiW0yBxSDRfOvbaHwah3AciPVH7P9cLw
         4cSRHZIf+IPheINIVSBp1e8yMBcDXEbwn+/zQW8RUWcD7MfxinN1aJqjpSOPH04MqxYk
         QWeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=YL6SMk4T;
       dkim=pass header.i=@keithp.com header.s=mail header.b=AybZBxEd;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id a14si3265322pga.370.2020.11.25.13.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 13:36:34 -0800 (PST)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=YL6SMk4T;
       dkim=pass header.i=@keithp.com header.s=mail header.b=AybZBxEd;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id 959963F2E291;
	Wed, 25 Nov 2020 13:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1606340193; bh=J0co6Q1vvgc8Jd0e8SYQj/3vWhrlTCZVfePzl9fHZPs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YL6SMk4Tx+GNfe1/7NISeGih86kPAnHHKLyNGDkffUDURhh6jKVzFmTccYW8t6Xok
	 tVnDcT2XwFSJ2940afIaZoZa69VPhaJoTl5coVJkoJBNSSEImP9TG7gTrxXTGUPpPr
	 cTwxNLk/Ya7+KbVMIQ7SpHLqrN47GRHLiXM2BVMUt5TZTebGGqAX+6UK/0dokKpjPn
	 g410F2SsGqPgQHqa6I2SpQR3KXS6FlzZAC+02OZsx1TROms3c0oCT+QO/9KVHUjqp1
	 Hv4TI83IFhKnI4MIZpUSLMyOr+yo3bxN1xdjyN7kG3qsAVPMdZko1uI67OA2o22w8U
	 J1GuqSOp92zGw==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vPNEEQmJ2HBk; Wed, 25 Nov 2020 13:36:33 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id BAC323F2E28B;
	Wed, 25 Nov 2020 13:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1606340191; bh=J0co6Q1vvgc8Jd0e8SYQj/3vWhrlTCZVfePzl9fHZPs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AybZBxEdusU8xZeG2JNQSQPKtFwQCEt12ZT8pVigybZVDBIx6AGD5wqgPO8TuASEK
	 wUy/i9mXJx9UIsDt1Y3ldIvKkO+ZH2DygPHIU/z/h2XbAxD/u7SpkDcl3rb9F1n8BZ
	 NiDtlKMrssVg7bgZtOF7nySvVa68eEhFoBjb0adFJkdNpayqH2bK4+wyxuPLI2GTc3
	 /dXhnzI34ApKoezKVwY+d9/oU/B4fdZHt+K7I5p0fo2YVy9LnXQyVTLGlCmWN7axv2
	 szYqCqqgWILwrezbJopw889KvhEqKan4BQ6YIeRy79eukofAJRD8ywmVDJLsf2fB09
	 7Jsi37+B3uPoA==
Received: by keithp.com (Postfix, from userid 1000)
	id 9CC4115821C4; Wed, 25 Nov 2020 13:36:31 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Laurent Vivier <laurent@vivier.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Keith Packard <keithp@keithp.com>
Subject: [PATCH 4/8] semihosting: Support SYS_HEAPINFO when env->boot_info is not set
Date: Wed, 25 Nov 2020 13:36:13 -0800
Message-Id: <20201125213617.2496935-5-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201125213617.2496935-1-keithp@keithp.com>
References: <20201125213617.2496935-1-keithp@keithp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 5GQaCWNcsDS0

env->boot_info is only set in some ARM startup paths, so we cannot
rely on it to support the SYS_HEAPINFO semihosting function. When not
available, fallback to finding a RAM memory region containing the
current stack and use the base of that.

Signed-off-by: Keith Packard <keithp@keithp.com>
---
 hw/semihosting/common-semi.c | 42 +++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
index 27bdfd0e83..ddfa448cc2 100644
--- a/hw/semihosting/common-semi.c
+++ b/hw/semihosting/common-semi.c
@@ -133,6 +133,35 @@ typedef struct GuestFD {
 
 static GArray *guestfd_array;
 
+#ifndef CONFIG_USER_ONLY
+#include "exec/address-spaces.h"
+/*
+ * Find the base of a RAM region containing the specified address
+ */
+static inline hwaddr
+common_semi_find_region_base(hwaddr addr)
+{
+    MemoryRegion *subregion;
+
+    /*
+     * Find the chunk of R/W memory containing the address.  This is
+     * used for the SYS_HEAPINFO semihosting call, which should
+     * probably be using information from the loaded application.
+     */
+    QTAILQ_FOREACH(subregion, &get_system_memory()->subregions,
+                   subregions_link) {
+        if (subregion->ram && !subregion->readonly) {
+            Int128 top128 = int128_add(int128_make64(subregion->addr),
+                                       subregion->size);
+            if (subregion->addr <= addr && int128_lt(addr, top128)) {
+                return subregion->addr;
+            }
+        }
+    }
+    return 0;
+}
+#endif
+
 #ifdef TARGET_ARM
 static inline target_ulong
 common_semi_arg(CPUState *cs, int argno)
@@ -171,7 +200,18 @@ common_semi_rambase(CPUState *cs)
 {
     CPUArchState *env = cs->env_ptr;
     const struct arm_boot_info *info = env->boot_info;
-    return info->loader_start;
+    target_ulong sp;
+
+    if (info) {
+        return info->loader_start;
+    }
+
+    if (is_a64(env)) {
+        sp = env->xregs[31];
+    } else {
+        sp = env->regs[13];
+    }
+    return common_semi_find_region_base(sp);
 }
 #endif
 
-- 
2.29.2
