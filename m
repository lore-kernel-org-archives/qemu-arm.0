Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp864833lfb;
        Wed, 25 Nov 2020 13:36:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyaEuwvar8jOzzOeWF8MyHLDhOe0broiQLvEHf5xijB2XFHvacSnagegkx3lJ9rIjzOXHUc
X-Received: by 2002:a17:90a:2b0b:: with SMTP id x11mr6524400pjc.65.1606340195701;
        Wed, 25 Nov 2020 13:36:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606340195; cv=none;
        d=google.com; s=arc-20160816;
        b=d7Du/PWEPa+ToppLTwJNNqXupAUA2e7bkBOp7yKd0lv28P8ZFOnoW++iBw+d6LZqxr
         ajRN3voTjqRzO8yICWigoNIxlnKZBhJSjZcFhYo39v08+qiGRbbgwN1cQUyrpG+GG/x9
         OAH5R8XvGvB3OmR/c8lfVcqUzhxxqWtT6GJ8/hslIcuMGkUQbkWquwTEB733KadLgw+1
         jtRxDjNUqYcGll5jikefbsTnIZU4kHQIA1gZ1Iw24dxeT1YqaEerWjjIUXfhPhDr34l/
         s1Y0Sx9H7e4V7UDScz1czLuhQIyKwzlwRgG77T0EWrkOYsrFtHm6hysR/zhXDVu5G5CJ
         bw5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=dKF027fXs2jW0c+ylTXjuovm//tll0AqRf8NM7cMCZU=;
        b=czFJb8ULdocFEKyLyEfPRV5xxmcwzn0LWW8lDiPZOhKy8dQGRSNz8hqwLR0ko73ACM
         /OnHnhFf4kZt+22vbD2neDfVZTEDWe+MsCgK3Ly/Pr4T2Fuq+XNIllrUPG6KWtZBaLdI
         najDJamSa5ZuHZqsnyHF4SV+S9/Qsh7/ikGxyVqzvjAiMee1u6vHyeDTeiS8ANbYI/y2
         Z4tuQ/XHMq2YkXZy4wdasCoE1ujvQ5rWTDogyMsmP23hh6zeqqX/07o5fuX0eGSZVG3f
         p7+9ORpA43yxOrsHZ6u/WLwtDtGW3z0FoKKQFkXIHiYybLc9LWl1JVHU0KYiblhKcKvL
         8hRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=GfsxZTib;
       dkim=pass header.i=@keithp.com header.s=mail header.b=NukZG3Dx;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id i20si3308821pjl.152.2020.11.25.13.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 13:36:35 -0800 (PST)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=GfsxZTib;
       dkim=pass header.i=@keithp.com header.s=mail header.b=NukZG3Dx;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id 887533F2E28D;
	Wed, 25 Nov 2020 13:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1606340194; bh=FgE+/ceRdQ5QyczkoIKEDBQkeANqnbnZZ159aE22FPc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GfsxZTibe8Udu5GnRr2FGaSJgAgUAJ/OU3wuvsXClaDgKq/0B7F70y5FzIp7nIdxR
	 z2XlXuVX6lmKdgP//BxLtWuEhUURQyxfZzh18RRQsQkxFO07+EF/r1WhBsuIrnjr0x
	 vD+sA7pay6dAN5euR/KtdlgoaxfxlfVumEk53lTQ14kiIRJ/SAMIBE3x4hyEv2yqoT
	 wreljoMw+pBCwpJeprpgjvFYxANZ1gY8SImD9Bm/p80j5xntoOPHu0CBG6aQY9zy7F
	 7jOl+CkIbpQQa5KFIIedECcjRououIeSwHRN4FEYlFr29ZjShh5KbpYidwrFq9fTI6
	 QwQRhddULBnCQ==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 328h7N6Smk8K; Wed, 25 Nov 2020 13:36:34 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id DEB2A3F2E290;
	Wed, 25 Nov 2020 13:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1606340191; bh=FgE+/ceRdQ5QyczkoIKEDBQkeANqnbnZZ159aE22FPc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NukZG3Dxu+PDk2NKh4YZIKRnizoHsVPc9HYjba3XvSdjsBZjIJ8UxHJmcJi4QRMeG
	 JbSFYkdLS0AjJA4H+cL7Dfc3bJxjcfUqWgd2e2sHrHd0Bnf0hEha7R7fUocIdVB3Ub
	 uAuPNLT8sxFrt0IAPHo0vZSR08Qkz05KiYPvoQu6ZJobB9nOixEgnmA1JREAhJOQ4e
	 AYx4mjizBm1og9CiGy7bL+SEmJpTmQsf6N7JSDEq7iBmEYLvQ5RszC98AwJmdioupK
	 Gd+VqBEbULn6+2M30ZnIp7iXNlyDwJXLGcRzyhI0RakUU5kyYvWe2dS9bFAO+G2JFi
	 dCEr5MuW9mF3Q==
Received: by keithp.com (Postfix, from userid 1000)
	id B5D6C15821C8; Wed, 25 Nov 2020 13:36:31 -0800 (PST)
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
Subject: [PATCH 8/8] semihosting: Implement SYS_ISERROR
Date: Wed, 25 Nov 2020 13:36:17 -0800
Message-Id: <20201125213617.2496935-9-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201125213617.2496935-1-keithp@keithp.com>
References: <20201125213617.2496935-1-keithp@keithp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: s12Ew5qjHogb

Part of Semihosting for AArch32 and AArch64 Release 2.0

Signed-off-by: Keith Packard <keithp@keithp.com>
---
 hw/semihosting/common-semi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
index 9a04d98e4e..fda0e714ef 100644
--- a/hw/semihosting/common-semi.c
+++ b/hw/semihosting/common-semi.c
@@ -55,6 +55,7 @@
 #define TARGET_SYS_WRITE       0x05
 #define TARGET_SYS_READ        0x06
 #define TARGET_SYS_READC       0x07
+#define TARGET_SYS_ISERROR     0x08
 #define TARGET_SYS_ISTTY       0x09
 #define TARGET_SYS_SEEK        0x0a
 #define TARGET_SYS_FLEN        0x0c
@@ -962,6 +963,9 @@ target_ulong do_common_semihosting(CPUState *cs)
         return guestfd_fns[gf->type].readfn(cs, gf, arg1, len);
     case TARGET_SYS_READC:
         return qemu_semihosting_console_inc(cs->env_ptr);
+    case TARGET_SYS_ISERROR:
+        GET_ARG(0);
+        return (target_long) arg0 < 0 ? 1 : 0;
     case TARGET_SYS_ISTTY:
         GET_ARG(0);
 
-- 
2.29.2
