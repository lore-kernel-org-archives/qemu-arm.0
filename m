Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp546826ejb;
        Mon, 13 Feb 2023 12:32:03 -0800 (PST)
X-Google-Smtp-Source: AK7set9tPrOExYKMAL63KWWo8c57fDfMRVQjj2d2lDrWpx0gV4g0BGZQPKOREBRAXmMYcm3Ay5h9
X-Received: by 2002:a17:906:7e45:b0:88b:23bb:e61f with SMTP id z5-20020a1709067e4500b0088b23bbe61fmr208589ejr.25.1676320323464;
        Mon, 13 Feb 2023 12:32:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676320323; cv=none;
        d=google.com; s=arc-20160816;
        b=DjW/RNq5T0LQCrX86U8x61kp85stzaieKupVUF3PJMCOWCGML0622QvvXC8cXsvvWf
         sqvD6VPljdel0kYuw31FZCgmooXi0GDd3uiVg/g18Ok9Hvsi5QDPWem7huorfn95I8P3
         cKC+QOSdpYKzNAcRVTrE70frlR8THh9jdGOhfvDC47jd3lW/vvVVDigNWBjk7l1QJI1a
         NdUgz7bPMsZ3FlztF7HmBXleXWSNgniF6jlrYSlR1jLBMMnvHDBCmIfhWmaZLBk/H2C/
         OAamuh3BhbcpoU2WdKL1elvOkXLkGnuxwV9Mi6/z3xaBCrzfBieMouiE0jyq2NfSTP6l
         Lt/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=PDBsSUNBuvCTZsCe3cF4kcJ5umecOKptDPKcI95U6nQ=;
        b=hV8XAicA47RbcWkbXuRWYtCdN5+JVHyvL+Ry8+8nahb6zNTAZjWW4Qo/TrwaHiRIOa
         88OYPDTUCFnCjQsJaCPMkuuIO6EyYzrNWZI9vhiRQXwFf8WF4eLg2w/Xh/wGtJy64HV+
         g3sutovb/dONBoH+GvkA/XkVKo5JgNe8dWmO4djfwqb0AeKJCPoyVsHrEhwm8CvqUVXh
         j0zq8gR2WD6QW//wkIlqcTl4PHZgIqjMZQ4ZaZE4vHRQVwwJNXamxuKRJHUdqa9Lp4Nr
         mzvKDevJgH1Vf6lK6sVZXgepDfYKrxiT4EZiFlny2JYD8Vx51O+7za6HuAaJbu7u9x/x
         tiAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=vglQBSua;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=8LgBhPHX;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id 17-20020a170906025100b008869f495216si17239283ejl.843.2023.02.13.12.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 12:32:03 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=vglQBSua;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=8LgBhPHX;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1027822344;
	Mon, 13 Feb 2023 20:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676320323; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PDBsSUNBuvCTZsCe3cF4kcJ5umecOKptDPKcI95U6nQ=;
	b=vglQBSuai01AvbaLnoH814OgdfHmP4bnz0Z1La5OLgwXCZKg+6bX66DhlYrn7MVHJvC7UA
	ZTIx4vy9rs9nprnZ/6DhkIEkfTEOOhMaG/3dW9khGEQCZiGZJb2SBolsi4Xe/3DWDSZW3Y
	bUijnAg5d+YstuELJoZUeJg+ysmAn0A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676320323;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PDBsSUNBuvCTZsCe3cF4kcJ5umecOKptDPKcI95U6nQ=;
	b=8LgBhPHX7gyJem5iHyoquHUYuVcFpr8XPScwE/hFoh4ZysFvGMXda3DTJgPLDEr5czfUS9
	QikcRGOQYxyimvAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F25981391B;
	Mon, 13 Feb 2023 20:31:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GDNLLT+e6mOVMwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 13 Feb 2023 20:31:59 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH RESEND v5 08/28] target/arm: Wrap breakpoint/watchpoint updates with tcg_enabled
Date: Mon, 13 Feb 2023 17:29:07 -0300
Message-Id: <20230213202927.28992-9-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230213202927.28992-1-farosas@suse.de>
References: <20230213202927.28992-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Vi8FdB0XGFGQ

This is in preparation for moving debug_helper.c into a TCG-specific
directory.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.c     | 6 ++++--
 target/arm/machine.c | 7 +++++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5f63316dbf..d7ceb626f0 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -536,8 +536,10 @@ static void arm_cpu_reset_hold(Object *obj)
     }
 #endif
 
-    hw_breakpoint_update_all(cpu);
-    hw_watchpoint_update_all(cpu);
+    if (tcg_enabled()) {
+        hw_breakpoint_update_all(cpu);
+        hw_watchpoint_update_all(cpu);
+    }
     arm_rebuild_hflags(env);
 }
 
diff --git a/target/arm/machine.c b/target/arm/machine.c
index b4c3850570..fd6323f6d8 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -2,6 +2,7 @@
 #include "cpu.h"
 #include "qemu/error-report.h"
 #include "sysemu/kvm.h"
+#include "sysemu/tcg.h"
 #include "kvm_arm.h"
 #include "internals.h"
 #include "migration/cpu.h"
@@ -848,8 +849,10 @@ static int cpu_post_load(void *opaque, int version_id)
         return -1;
     }
 
-    hw_breakpoint_update_all(cpu);
-    hw_watchpoint_update_all(cpu);
+    if (tcg_enabled()) {
+        hw_breakpoint_update_all(cpu);
+        hw_watchpoint_update_all(cpu);
+    }
 
     /*
      * TCG gen_update_fp_context() relies on the invariant that
-- 
2.35.3
