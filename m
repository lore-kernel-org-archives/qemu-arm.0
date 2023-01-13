Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp414639ejc;
        Fri, 13 Jan 2023 06:07:16 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuyp8F8p7MCyij/51Ul/ZJ/XPNl9BYCQGvPsl3qoTN9UL5NMNyIOZeGbZM0d+63DOSayaSw
X-Received: by 2002:a05:6000:511:b0:242:5d6f:3915 with SMTP id a17-20020a056000051100b002425d6f3915mr56136928wrf.46.1673618835787;
        Fri, 13 Jan 2023 06:07:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673618835; cv=none;
        d=google.com; s=arc-20160816;
        b=HG6hHuKmcq2wrsLl2QYHHzeFRkB43EmIUkJjE5JVQ3n75dZwvbwFM9EYrt6PFRWJp0
         MGhyDCQ0rlDMbgQaVskYtZu1shyQM7ceiX+lHIWlDyndi+OsPVMN6tvrYHJ+az4vnUIp
         IJidgthZ+jU2+kXYUXPujNYIbU4ZranILjWEAbL2CJw4TOaslv2JjzRmXDSpZBlI1YwD
         HzjxqnJg8hfSwrZ0FOm2KJc1ZfsPzHD+xdDSiopUGgKI+pQcuscKFxWELgGpM+m3/E20
         ufHbKMtSl5Bul39qZhs7NkMnAp42rLBrebDExm9kx0+8IGhfmAExY+mQrWKCPAQ3cveE
         +G2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=UcPvJ2TkX8BmU0xYGg1vpayMTRS1XI7tg4m7dSlXwDU=;
        b=eGVBT/h3fXhbfUoR7PaEGzPMTKbZe2SDKdWydv9133ayCIySZ4A/Q/K940SGdWGMTw
         SVpvsXMmwH7jeBLuvlJzB614davZDJHj1OxAqC3k6nC+WWdL/dz/8WMyC/zsE9nj5SSd
         HfRpA9+f3+qNC0XkZRb4OsQOKPvZSm4P3GI/01USdn3EWa30Imlnz71u1eS3EExevTis
         z3rdK2LyxSXAb7SqhqojwAqQYoA3f8vNYandHLl0deHx+AbOcagwDCVfgpeSC7Ncy40N
         CR9/4hIzW3M2u51M9mvwV5Sw0wUq1ZsBfzNxGvbqXA1llLd+kWuA6ZX21aRQvdwGog7i
         XxSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=rvSNQCxm;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=aZQLoH9b;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id m5-20020a5d64a5000000b002bb31e4caacsi22778947wrp.400.2023.01.13.06.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:07:15 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=rvSNQCxm;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=aZQLoH9b;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 41B724DE3E;
	Fri, 13 Jan 2023 14:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673618835; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UcPvJ2TkX8BmU0xYGg1vpayMTRS1XI7tg4m7dSlXwDU=;
	b=rvSNQCxm0xtkyyv+TFBoLpqwM9dqzluzgpxnByG1OlJVT71CYxgl7sJJ20wGWl4N+6qBHq
	9b2MQDu+1YwejA5njKuHFVgjkA9k6M3hzZRr618YCgZOqmKZlydmwpZJs2fxMGizGR+Xs5
	x/e65cS+peVJ48ygvD2eGqA5+Xt5jww=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673618835;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UcPvJ2TkX8BmU0xYGg1vpayMTRS1XI7tg4m7dSlXwDU=;
	b=aZQLoH9b5Ul1Ms+EjwxG8DRC5rh8Ces8aD7jmzcIfpU2TGLXMv6x0w5/xY/IwOKEvpvNVA
	4ZxvQJgxYHVALPBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A03541358A;
	Fri, 13 Jan 2023 14:07:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id AGxMGpBlwWP8DQAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 13 Jan 2023 14:07:12 +0000
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
Subject: [RFC PATCH v3 16/28] cpu-defs.h: Expose CPUTLBEntryFull to non-TCG code
Date: Fri, 13 Jan 2023 11:04:07 -0300
Message-Id: <20230113140419.4013-17-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230113140419.4013-1-farosas@suse.de>
References: <20230113140419.4013-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 8XQMiCZUmVDn

This struct has no dependencies on TCG code and it is being used in
target/arm/ptw.c to simplify the passing around of page table walk
results. Those routines can be reached by KVM code via the gdbstub
breakpoint code, so take the structure out of CONFIG_TCG to make it
visible when building with --disable-tcg.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
