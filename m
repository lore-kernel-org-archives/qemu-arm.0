Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp128222ejb;
        Fri, 17 Feb 2023 12:14:46 -0800 (PST)
X-Google-Smtp-Source: AK7set+qXDoGoGoJaKaa3sM18zgO43/Um4q2iNhAm3mNnnbTxp1iFBf4PY+PZL6u/gugpOalU3su
X-Received: by 2002:a5d:5253:0:b0:2c5:ab27:d344 with SMTP id k19-20020a5d5253000000b002c5ab27d344mr3328280wrc.20.1676664886411;
        Fri, 17 Feb 2023 12:14:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676664886; cv=none;
        d=google.com; s=arc-20160816;
        b=IJHIrpvaFJdKoSp0tZX1fzILXHdGgeGUa7lLK/UtiXz5Mp4GTwEkkfwOrW+yW30rd0
         JMj+Owp582PW2I7pZZ3lWVDo4aqelmm9xeiX4oMGOZX/uWdURMy9lQM5u5n8koGHuqCx
         DyZJYRhlU4dpFpOHyvsFZPSEbjmeNeqJqYuHo3ETRbuKbR/hOqYLwOrtnV4yDscj3v88
         aPdK5N+VuyXpK6tsmwsewuIU/pZglSuYKKgWR2B72zebNs33FMSlh5JSQNGFLxfyCpci
         SAeJ7uVaCm3Yu3OQFhqztkfOHXnvOzTzo3jKGdiG49haHwiEps+8WJvBHiAAcNG/nzhg
         SYfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=8/PDkUrAPEsO7n+jaOxTqdYZW41mc81Im0qLDWNhc1k=;
        b=gAMu+WwKjljd08YM0zG+j7PKr32kLZCZi1FfXK32zC/SNhrXxkHweIDUjE53eU2Re0
         opf+Oq29FrDxlnIUKWIVrODeYvaT3GkW7HcjJp0RNbW83IRPn5og9xRDKYwLp4qKuisq
         d8uI7qcJNmqZhRA2Ol+zkjGY6rzpousrhIjbH0CU0DraiBvA5SikAFyuhtGUGszINggH
         +sRdeshNMPYKkcKI+h3Bxr/YI4/8oX/+P9aABv4okdqkdMZD3BkTlwdDl2uPyk9fzzvv
         8uAbutxVsOpfvGLnUqZb/pW8tBp+k1XbpIkddFgpow+VyzKXfSHXyE0aizo4xYSnnCBG
         JgCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="M55Y4O/w";
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id g6-20020adfe406000000b002c59a6b964fsi4221996wrm.994.2023.02.17.12.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 12:14:46 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="M55Y4O/w";
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0405020FB5;
	Fri, 17 Feb 2023 20:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676664886; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8/PDkUrAPEsO7n+jaOxTqdYZW41mc81Im0qLDWNhc1k=;
	b=M55Y4O/wmIDJawq1vl8uiOaKytI52LU539kk/Q7/tk6XwmVjrMnD4dCrd/jxhF7/7wg9oq
	ncShzc9r/ARlqss6oeoHClCvNhP/wsA7o6QRZehUoqfh3/rjKMF5K7cmhZv1EkvWe+lCqP
	uZVqzPQmvqI9ioPM4D0HUbMBE+Xwy90=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676664886;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8/PDkUrAPEsO7n+jaOxTqdYZW41mc81Im0qLDWNhc1k=;
	b=77zDeXnJlo9GQ2zn/KGKsvf7sgS+HmHE1mdurLq5yNRroosyfIK9i/pJIqywGQBWmd+6Hd
	rncDw92UW5CLBPCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1504E138E3;
	Fri, 17 Feb 2023 20:14:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id OEWuMzLg72MwIAAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 17 Feb 2023 20:14:42 +0000
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
Subject: [PATCH v6 15/29] cpu-defs.h: Expose CPUTLBEntryFull to non-TCG code
Date: Fri, 17 Feb 2023 17:11:36 -0300
Message-Id: <20230217201150.22032-16-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230217201150.22032-1-farosas@suse.de>
References: <20230217201150.22032-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: VxmT853SY6jM

This struct has no dependencies on TCG code and it is being used in
target/arm/ptw.c to simplify the passing around of page table walk
results. Those routines can be reached by KVM code via the gdbstub
breakpoint code, so take the structure out of CONFIG_TCG to make it
visible when building with --disable-tcg.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
