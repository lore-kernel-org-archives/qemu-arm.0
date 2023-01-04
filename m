Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8306331ejb;
        Wed, 4 Jan 2023 14:02:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvqIrx3OlAwrRr+HcFAH5Fw8V+f4ceWvmztGhgO1N9z5BlWg0N945wYwFBDWTY5/Tf8yNBO
X-Received: by 2002:a1c:6a14:0:b0:3d1:f302:1975 with SMTP id f20-20020a1c6a14000000b003d1f3021975mr34454676wmc.33.1672869726194;
        Wed, 04 Jan 2023 14:02:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672869726; cv=none;
        d=google.com; s=arc-20160816;
        b=QYViIeWmN3KF2XZnoCg7oYfCG9qgPv9hKU6X7dwY3brdvCQWwYuKTSMUPz/KCUKA8q
         IKP4UCvs6V/9RlnWY8NL+rF1PgX1AH4bHm8hLikAPqueKnv0refXz+tPZbPKIrAvQFJK
         F78WGvU20ISfDSMgQYJE3ulo63m9N/RIxxZv5bE9WQ8owzZPA0RHe2uJxeO4Xk5WMX0q
         vturFMLRHx4V9hHgWsXNlWZTFoyLvUAaeQ4yqsH+p2TuzHAP/VCVzOCGdti4LgdS0f0l
         DexgBgzHtwWcoJaeGD4MQ32aMQaDUeQhyuKTswhyCmikC7eEqwE/lLajbaO/glbMSIEO
         dosg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=UrxGAv7LZM8RFPQI7euNbmnVH3n1hWGTIXV/qrCcDi8=;
        b=y1ZecIQViln8PPideiHP+VxHffLTw0wnX8oq1jSCdZbO2OXehuevlULrCuFi78jzkg
         M1y6LSegoPbut1JElI0wh6E5vfL3If6vCECAnH7c5BWgVrmTJQ/h4RflS3Bj+8x0OKzL
         UkJ2HJ9mQmMSHXzg5H1JpmTjfyqiSntkHo3mm3SkS8UPtP5LevYuAe85AjQM4i4NhHdn
         srEPCAuq+xr0ptY+qsOcHdFmQDYq9ANgiZrmxYt8BL+zUbsvVkShmb7+xSpkXSenyuUW
         s4T/NJDfq7TYgl+qjkF+1a6jHzwJfxj4IxJCzAoU15M/DHbQVXeTflar1lsGk8vrBwP1
         erGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=fwSWKhJr;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id be9-20020a05600c1e8900b003d9af2cf577si92083wmb.73.2023.01.04.14.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 14:02:06 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=fwSWKhJr;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C8AD24D816;
	Wed,  4 Jan 2023 22:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1672869725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UrxGAv7LZM8RFPQI7euNbmnVH3n1hWGTIXV/qrCcDi8=;
	b=fwSWKhJrTE5S2cGF0TqwfBEOE0+mWxQ752OAvYhyAyl5MGoVqh9MBc6KDblhT03qn6Dbfo
	qetSECyO3P3FR70VUHBM9LlgEeDWR5e7IC4DFC+yMli7SOHnlGg4FUQ6kQHP0CbS29b4sB
	I4Hn+9X1xt8eyMY+B2bkmLDzk3Z59wc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1672869725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UrxGAv7LZM8RFPQI7euNbmnVH3n1hWGTIXV/qrCcDi8=;
	b=L+nas0MiB7GcjTPz0iSGey1P8rH8VNetz+jETIxbEWvROobTAYizYZYNOSYgxliMD3xorE
	A29ptrQ7OB9oi1BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1EC021342C;
	Wed,  4 Jan 2023 22:02:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ABDdNVr3tWPwJAAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 04 Jan 2023 22:02:02 +0000
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
	Alexander Graf <agraf@csgraf.de>
Subject: [RFC PATCH 26/27] cpu-defs.h: Expose CPUTLBEntryFull to non-TCG code
Date: Wed,  4 Jan 2023 18:58:34 -0300
Message-Id: <20230104215835.24692-27-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230104215835.24692-1-farosas@suse.de>
References: <20230104215835.24692-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: w8aus/QbrR5F

This struct has no dependencies on TCG code and it is being used in
target/arm/ptw.c to simplify the passing around of page table walk
results. Those routines can be reached by KVM code via the gdbstub
breakpoint code, so take the structure out of CONFIG_TCG to make it
visible when building with --disable-tcg.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
This is the least painful way I could figure out of doing this. Let me
know if there's a better way.
---
 include/exec/cpu-defs.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index 21309cf567..d5a4f30717 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -135,6 +135,10 @@ typedef struct CPUTLBEntry {
 
 QEMU_BUILD_BUG_ON(sizeof(CPUTLBEntry) != (1 << CPU_TLB_ENTRY_BITS));
 
+
+#endif  /* !CONFIG_USER_ONLY && CONFIG_TCG */
+
+#if !defined(CONFIG_USER_ONLY)
 /*
  * The full TLB entry, which is not accessed by generated TCG code,
  * so the layout is not as critical as that of CPUTLBEntry. This is
@@ -176,7 +180,9 @@ typedef struct CPUTLBEntryFull {
     TARGET_PAGE_ENTRY_EXTRA
 #endif
 } CPUTLBEntryFull;
+#endif  /* !CONFIG_USER_ONLY */
 
+#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
 /*
  * Data elements that are per MMU mode, minus the bits accessed by
  * the TCG fast path.
-- 
2.35.3
