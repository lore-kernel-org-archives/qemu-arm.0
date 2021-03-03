Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5706523lfg;
        Wed, 3 Mar 2021 13:48:45 -0800 (PST)
X-Received: by 2002:adf:d20b:: with SMTP id j11mr649655wrh.397.1614808125034;
        Wed, 03 Mar 2021 13:48:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614808125; cv=none;
        d=google.com; s=arc-20160816;
        b=yc6tfzK95lYXlAxkyNTXU/nSXjF0n31D6N3o7POzLyRie0APOMaDqNXoZ3qY1KLMOc
         V00HH2jwMCJ3dovl50MBaoHsStc5q6dd5iHFbL8KbwuyiCdJSvTrfQeVn44Y0PEqL2yf
         hmGX2YghsHhYj6l7kabMShxsWjKNHxaBFwG/YW6QlJiDjPLFkYSSx7NsfZtR9L6/mT7D
         JF6ZSmRveVHK7ORORVH6RszVSrE/JECbbfTdzE7I7bSrCFmAIyKAg+sK30w5MKQc+vSq
         m7/bRfYDwiLRy7qYsQf2r9HKfFeCSA4JcNHUQmTV0DuBnbIide4AhQB+rmgX2bU5Phno
         pyrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=UwRUo7hC4h9vgJMC9crYDnluKvk2tzZcvKCkSEg/uSc=;
        b=rSCAucqHAEhIcU3eItp35fo+yYpv1Hq4OpIKl6WeBSVrPoF7wQjI5l5nlKTqyOMw1k
         hi7fBArSQWH9fAi9JLpE3yhu1glNy+Ca80zB4YBhxrz6H/y2pRWNHv7/rFvV2K9W8vsc
         a34lV+1KpqURWKaQ/epqsVMe78FpDwnBb4Cnta7OUiVGgCooQsr3ArAsIv1udY6TnIcL
         RbCKVWTzlAAj3/bl5eHAI9mOBILTjA/gqcd3h3QL10YkGEcG9yx5OTR1+IlbERH06E1w
         2y6Oezjy5c5wfXh7YSu34w//B71SraZtwnvkj5ytwrc7CRe8E2lk39PZDfJk6Xz1vLjE
         Xw4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=VGl8wx3p;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f14sor13258441wry.8.2021.03.03.13.48.44
        (Google Transport Security);
        Wed, 03 Mar 2021 13:48:45 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=VGl8wx3p;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UwRUo7hC4h9vgJMC9crYDnluKvk2tzZcvKCkSEg/uSc=;
        b=VGl8wx3paFjSVhst0xwZVNTJfVvVPedOVkbRO5IhEaTM4nkJ/u9cZtz2AN+I70neKU
         lVME3Kx+VPZ9mGv50Y+tBC4C5r4qNzzhoaQFGcodwEeAldpOMcMbfrP5gUyJu4h9u6aN
         xicgkHdiuYUG6j3WSFVJtK+N+xCh20qXDBLgTlznxNLwp60/InFosxGANfxgjR6pzOdF
         Gl4lwdzUO9LhZ2w9HjlXhA4vSGyxRmaA8QGgL9Ir/qNWTlLSFo9NJWLWol/XdORkK22a
         3oy8CU9AXspmg3aHVsQuriCMzeWA4ha9tKBEqTdB+ZxlH2qPdm9Kk3IlaMjbvjrdLg73
         ZKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=UwRUo7hC4h9vgJMC9crYDnluKvk2tzZcvKCkSEg/uSc=;
        b=tkCoN4ACLA0726VhrGrihjJAvuHYC75xy2dkMGT5PoKJdZMvELdpYLLJPv0LwEdDK9
         epnlxA6aU4LhCTLT+Y8PmiMomLk/rS8//XiUJKmHQwHhvtvFq7lz9zbO8iQywlobNJTg
         gLaKOyk45LGsBLcYWLPFIWXzazSUeERzPtbR5HMFM2d1qN2rxfsr82OEgK9WPKhqnJKU
         Ztmok/Dh6gurACcNAcgkXdXJwAFg2V/he7aNIUPxPjGnR0DuKQGl5uN9Md/iyddilY2U
         KY0tG/YXuyjNjUyK1jeTmWg3ClfESt8LtpLjsB/0WZmEfBgoFT763AaTPmjHXir9P03B
         geaw==
X-Gm-Message-State: AOAM5320kbsYM6pNggbP4cl0xq4IPL/SU4iF0r4Xpyqi1NmqFaj91DRn
	eRqGw4u7QxqqDW/B6E5SI9o2chkRVhw=
X-Google-Smtp-Source: ABdhPJxlz6DIchAGvKj7W4FAU5GQPu71/RTvZT2TVu4N9FvUNDg2Ns2Csov7QXRiPjgQP7q5Xx0Sjg==
X-Received: by 2002:adf:ce0a:: with SMTP id p10mr671741wrn.255.1614808124862;
        Wed, 03 Mar 2021 13:48:44 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id s3sm14468228wrt.93.2021.03.03.13.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 13:48:44 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-ppc@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Cornelia Huck <cohuck@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 17/28] linux-user: Remove dead code
Date: Wed,  3 Mar 2021 22:46:57 +0100
Message-Id: <20210303214708.1727801-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pTX5p53ksjHJ

We can not use watchpoints in user-mode emulation because we
need the softmmu slow path to detect accesses to watchpointed
memory. This code is expanded as empty stub in "hw/core/cpu.h"
anyway, so we can drop it.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/main.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 81f48ff54ed..d7af3ffbc22 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -200,7 +200,6 @@ CPUArchState *cpu_copy(CPUArchState *env)
     CPUState *new_cpu = cpu_create(cpu_type);
     CPUArchState *new_env = new_cpu->env_ptr;
     CPUBreakpoint *bp;
-    CPUWatchpoint *wp;
 
     /* Reset non arch specific state */
     cpu_reset(new_cpu);
@@ -211,13 +210,9 @@ CPUArchState *cpu_copy(CPUArchState *env)
        Note: Once we support ptrace with hw-debug register access, make sure
        BP_CPU break/watchpoints are handled correctly on clone. */
     QTAILQ_INIT(&new_cpu->breakpoints);
-    QTAILQ_INIT(&new_cpu->watchpoints);
     QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
         cpu_breakpoint_insert(new_cpu, bp->pc, bp->flags, NULL);
     }
-    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
-        cpu_watchpoint_insert(new_cpu, wp->vaddr, wp->len, wp->flags, NULL);
-    }
 
     return new_env;
 }
-- 
2.26.2
