Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2397035njc;
        Mon, 24 Mar 2025 21:59:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVNfl12PQViTN1Pr0kAdBosthii6vjHA3iNIZ5JnXDrBpXx6KVMxdBN/hkUzIQeUVlalQlYrcZ25i8SHw==@linaro.org
X-Received: by 2002:a17:902:ecd2:b0:224:c47:b6c3 with SMTP id d9443c01a7336-22780c54ce8mr213597495ad.6.1742878773704;
        Mon, 24 Mar 2025 21:59:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742878773; cv=none;
        d=google.com; s=arc-20240605;
        b=eWwVvJUYpBllJxs1hDfhnDjYVx4oa19w9+Rv7Ed9KbLZ/CLpgSC1kAXkDQ+M7SdSvY
         p2yCeXJv7sTEmEKmQnPPF3xPvdBIGjIfABoFMn+/QZqfMoJFAJ7zPiKUZY/Dv/S02uE6
         mFR9GEZoxY5rqNNRy2Klb3Ogsi0IEoQn1myBKpHXy444ZPX0nfL8JKDf/YA0HvNP7VgO
         80Rdp2PW0gy6puoRcWqa4f6bUTj+TSKXozoe+h4Hsw3dkLBFtJlGSdPIGc6OyH98ymiW
         M9p7nXlgsPIqvSQNScpaG1fFhMWXzA5/XmOJxlHC+4u6Eh8Cd6aETeBuI99s1gwXGDOr
         tiIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Id5pPosDfyEQ/m8+tZSrdDNfNTCKXAcrGpGPGvWGZxY=;
        fh=IohS4na0njG35sc8YxWSqFcPnhpdaJOYVHkwA8Vxppk=;
        b=RgmwphZdQvor6HPY7sJ3hgfm1QyIpq6seyA8CHIfrzfKD+l6v3hOhpVCCA5RGe/hvl
         jLOlsgajKwHSLSMsUtn/FMRM/rW1pP9TLT+lVsace59whfVmRhEXxelxCW2DN0OY+iug
         CR4ZCWPZ+4i3GIM8mdBuZiBAulgUodAYzbo5oBKAxwUIlE8a+BVy524/2KfKwkfKgEfs
         yLfu1tyIuoiZakh9TKCM6GiK+VcaTkITsHweTzLx0Eq+8ZAm+bf+wMo3cgSk/BvTmc9D
         +tzIF64o1VEwW6vlS23zppe7gt5CddMp/d0H0m1J93iMaCZyM3SNIlOUi9EGcQAsioUj
         f6PA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bT3bQ96G;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-227811cc06csor54942365ad.11.2025.03.24.21.59.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 21:59:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bT3bQ96G;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742878773; x=1743483573; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Id5pPosDfyEQ/m8+tZSrdDNfNTCKXAcrGpGPGvWGZxY=;
        b=bT3bQ96GowKzaIkf0ZhSvvdiwadzMp/4AdOeqTQE1KRDyCwMP+kVk9zxSibpRnj0qZ
         VXVVWv2po9XAEVMqM1k4KEx9KT+6uuedL/FwW8gE3t17hKGtZ17/fwXRZY//LQNMGSfn
         6MCLJj9+LNfoZo93wuOQlUEC/brw6doibofHh2laehA0QhUwO9snGZjrrycXArf2e2L8
         5wJ1ArNU1ur2wO2LSWK+PcZ72Y2JFrTtdEF0epk2CB2VI7TCXsvlOA6UoCOBQ3ePniRc
         /sxWXGswlJHaCHvlGa6Us1OVrQX7i3LsMsGinwl4jyTLoXp+m2TVhnuo7Z/SyGy1RaM8
         j5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742878773; x=1743483573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Id5pPosDfyEQ/m8+tZSrdDNfNTCKXAcrGpGPGvWGZxY=;
        b=YYJbVmXCz97+6mDYg9AQqwYtQo4BeGhebSySt1mn3bvcszc/ZB5DoPL6dtp51CXdcq
         fFVKF5Ato26op0xRKhjK5Z4kR3OxdsdFp8IIRywIONeZslMkTEfzP0qp12/EAiAS6sQA
         Wqgm6ZzCTkqjZVvlhEZhFb2jApC9or9zt+TTiqwkSRF9YTHQSiaK3xitbAX4potguCH8
         s9+AccFKn0xnkzrYh3iu1ALPUUYlSJlXVBN7Wy4GLMnNAgbQJoNA779lkYoUzzOICkzS
         KIDDAeyQQZ3aJ5qwmiJM/PJpgLMpxYrcx9RRwsYAQYv9pma2cQpbx+fE449e51PiQuHv
         OndQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqtv1GoQAOSCGIkTUMI/BAP34KgQTsD/HYeOPQltB5djGbhGj3BKoq2397oOAICetT82+kLwh6Q9M9Aw==@linaro.org
X-Gm-Message-State: AOJu0YxqrBe1AwjKid3DTMPD3VGLNYysyP6PZe3GDKwhGrsHoRgVAkgR
	EzFHq3oemQuvKkkxZtuDZldT+9FRF6u/feRzVl/If99e23S52jNLRl4JK/ezno6IlUUcxBO2LWn
	HiEk=
X-Gm-Gg: ASbGncttriQ3ZEvkCVC780TKvCSoZFIINNiEthba6z7DQ3nm0n+nRXPBX5uN2McUplr
	dIGtsVfpmeaf7GPRbFevqN7iBlt7RDpJKgfYdj8cbo0kN6uAzCWT9iZmWG9x/VPJobKJI/5LhLp
	KDCtSwkgJD3BHSHVeJ5NcrL4n1MfU4NUL6GXNIl96W4H7lw68OVxAvGxN5iVIQv/DaQI9pDCK9A
	pIP/coseeYO1MqZHHG1mVnx3l2Jlqy6v6p2yNbWHiwkjLc5sDAkAvXXTBShMqGaT4fq5vudKSBC
	nsrpiA4d3hHkiej2X2SyfdF8sDxfaF1ScR+mE8oliqUp
X-Google-Smtp-Source: AGHT+IE3ojZ3dw6zf0DQN1QqM31clL7OO0QTiS/Hm2mkhOEWn1LSr74m3PtPxOJna5YJtYoKHucVJA==
X-Received: by 2002:a17:90b:1b46:b0:2ee:ee5e:42fb with SMTP id 98e67ed59e1d1-3030fe7f1a6mr19332641a91.13.1742878773114;
        Mon, 24 Mar 2025 21:59:33 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b413sm14595120a91.13.2025.03.24.21.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 21:59:32 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 12/29] accel/tcg: fix missing includes for TARGET_HAS_PRECISE_SMC
Date: Mon, 24 Mar 2025 21:58:57 -0700
Message-Id: <20250325045915.994760-13-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
References: <20250325045915.994760-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: oeEGn/iTu1BT

We prepare to remove cpu.h from cpu-all.h, which will transitively
remove it from accel/tcg/tb-internal.h, and thus from most of tcg
compilation units.

Note: this was caught by a test regression for s390x-softmmu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/poison.h | 1 +
 accel/tcg/tb-maint.c  | 1 +
 accel/tcg/user-exec.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/include/exec/poison.h b/include/exec/poison.h
index 8ec02b40e84..f267da60838 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -38,6 +38,7 @@
 #pragma GCC poison TARGET_SUPPORTS_MTTCG
 #pragma GCC poison TARGET_BIG_ENDIAN
 #pragma GCC poison TCG_GUEST_DEFAULT_MO
+#pragma GCC poison TARGET_HAS_PRECISE_SMC
 
 #pragma GCC poison TARGET_LONG_BITS
 #pragma GCC poison TARGET_FMT_lx
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index d5899ad0475..efe90d2d695 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/interval-tree.h"
 #include "qemu/qtree.h"
+#include "cpu.h"
 #include "exec/cputlb.h"
 #include "exec/log.h"
 #include "exec/exec-all.h"
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 667c5e03543..9d82d22bf40 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "accel/tcg/cpu-ops.h"
 #include "disas/disas.h"
+#include "cpu.h"
 #include "exec/vaddr.h"
 #include "exec/exec-all.h"
 #include "exec/tlb-flags.h"
-- 
2.39.5
