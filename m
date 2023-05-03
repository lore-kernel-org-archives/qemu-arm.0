Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3058721ejm;
        Wed, 3 May 2023 12:38:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7u3l3rQfTXlfxj3HmMv6tbESJePiZ2yOpHi58c9tPoRWcndgSnnXwbiphTRWA70NHCgEJ+
X-Received: by 2002:adf:f012:0:b0:2fa:6e37:3d97 with SMTP id j18-20020adff012000000b002fa6e373d97mr765442wro.54.1683142720689;
        Wed, 03 May 2023 12:38:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683142720; cv=none;
        d=google.com; s=arc-20160816;
        b=zvrvTIX+sN0rtAzgbp3bj4aqmYvi7HT+jc8T1R3UvR4pwv5LjTnzqOJRwGH9NEovcB
         N2mcsutTXIHvYMvNLbk/wIJNaxHNhNG+9mwKet+unJk2zMvN9t1Nu5VOedGX3PHV9J57
         /g1rPpqCyIMLhIioP7926uPNQlXrse4OQ9hH4G19asnau+FOMK8GmPLJ1Ljk2s1R/v9I
         DN0tsqWIiXaI+0swT7BGbdB/7fXvuQIzvVA0/b3fSD74eCSNsa++Ipnje9fLf3Q/plJs
         c8F9ej7Fth79eXDQjfjAKU8wmWufW8iK2os1fMuAAcsVM1Qlkg8qkxz/vTjmkmoLTLos
         C+1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=FMkR8ROiTDRblwmZyLlgCGzvw8AEIUBQf4MAED6t31Q=;
        b=qE66LgQlpd+I0eFKJ5gzn9v7RHgIgV0afbZ9V4g8w6kj8izOXaM7yaEn7RR1U1r0u9
         G7T11R9DE59QWYyc24N8qAoEPZ708Qri5Xj4dY+x4JEmDtagjmj/hohB4/jUxh7o5Q0C
         yMsyJ39oUa2qmHueX04b4yFq2GGKSt2vT5LUT0740Rt3C0ajv7vqY9Fuxo2dWu9N/JDe
         rmfxVofcqQ4Vs7z+sQ/1Qtr9bV1KfEjzJM3EGkU2GoVbl36hfiJPGg1nXTzLJcvt08Eh
         XJKcTpYdgztlkmHri0sCv5wab9mTxaqMu1HqbKUYnjc6+CqzNrWoLGnhSus+a55oHdr2
         C4xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="OtG/eHpD";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=CuWj5nnW;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id f11-20020a5d4dcb000000b0030632043624si4008936wru.228.2023.05.03.12.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 12:38:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="OtG/eHpD";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=CuWj5nnW;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3C89B22A6A;
	Wed,  3 May 2023 19:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683142720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FMkR8ROiTDRblwmZyLlgCGzvw8AEIUBQf4MAED6t31Q=;
	b=OtG/eHpDZnJSHx+Y5rszzGe7ePRjsPKFsTuhyJ+mYW5ljg7ZnAZX98FDyxnD8ujE/JI4LJ
	T983HlAtbx/xk8f5/Nn0JAixEOBrBtGgJAgO3XGjrs7RrraqkxXhv2PsowmRkL8pSjWgL/
	lp0hyUx9ZQC9VyJGlIXY6XRSzQAQAak=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683142720;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FMkR8ROiTDRblwmZyLlgCGzvw8AEIUBQf4MAED6t31Q=;
	b=CuWj5nnWlkzrhIMNUcQovQHlLhe9HMy1GdRtwkmmD1AxPp8W/8zB0mQ98jEREEHO1AZDH3
	1kcMbc1/wMdcMFAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 728EA1331F;
	Wed,  3 May 2023 19:38:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GMauDj64UmTNYQAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 03 May 2023 19:38:38 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 1/3] target/arm: Use CONFIG_SEMIHOSTING instead of TCG for semihosting
Date: Wed,  3 May 2023 16:38:31 -0300
Message-Id: <20230503193833.29047-2-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230503193833.29047-1-farosas@suse.de>
References: <20230503193833.29047-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Cs/ZNB7gIBYa

When building --without-default-devices, the semihosting code will not
be available, so check the proper config.

Fixes: 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a KVM-only build")
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/helper.c       | 4 ++--
 target/arm/tcg/m_helper.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2297626bfb..24bb7efb34 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10972,7 +10972,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
  * We only see semihosting exceptions in TCG only as they are not
  * trapped to the hypervisor in KVM.
  */
-#ifdef CONFIG_TCG
+#ifdef CONFIG_SEMIHOSTING
 static void tcg_handle_semihosting(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -11033,7 +11033,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
      * that caused the exception, not the target exception level, so
      * must be handled here.
      */
-#ifdef CONFIG_TCG
+#ifdef CONFIG_SEMIHOSTING
     if (cs->exception_index == EXCP_SEMIHOST) {
         tcg_handle_semihosting(cs);
         return;
diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
index 9758f225d6..4261f1bb1e 100644
--- a/target/arm/tcg/m_helper.c
+++ b/target/arm/tcg/m_helper.c
@@ -2345,7 +2345,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         qemu_log_mask(CPU_LOG_INT,
                       "...handling as semihosting call 0x%x\n",
                       env->regs[0]);
-#ifdef CONFIG_TCG
+#ifdef CONFIG_SEMIHOSTING
         do_common_semihosting(cs);
 #else
         g_assert_not_reached();
-- 
2.35.3
