Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp547168ejb;
        Mon, 13 Feb 2023 12:32:31 -0800 (PST)
X-Google-Smtp-Source: AK7set//80vjaKjYHzI4USQ3exvsjDxa69OStrT9hpcca9zEo1SuUL+08RXns9pXgHBeqg+s2Dzf
X-Received: by 2002:a05:600c:319d:b0:3dc:5950:b358 with SMTP id s29-20020a05600c319d00b003dc5950b358mr21836753wmp.14.1676320351752;
        Mon, 13 Feb 2023 12:32:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676320351; cv=none;
        d=google.com; s=arc-20160816;
        b=QOBURST98X2NMfhf55A8KqG+qrfQwtOV3hRWBdBOzdnc9bRgXoUNDLIBRuy0l6872X
         XtEKmwEAqRQ4dEDwcuKxRzACGWI8IKFXLjNA3G8acYdbl5VUd0wFMrPIUZT0QA9Y+Aq+
         tbLB7rT/8FMcZLgG65NmfYQuWgCOXJVifuANlThgqF8MEfdnlDj49RkaLUIAFgKRxVpG
         08nbSOhYsa6X2kTdjEGwk8EJHeBFLAP6Jm6OQclnOuLMQEes36CSd6psU0KRqoS2D41o
         6OPAUjKuFl8IYJheBnVFDEHTQE5zi42EoRkZZ59eYNgcWW7xu5OxLDf+Lg1unC9xhCp4
         KmqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=8/PDkUrAPEsO7n+jaOxTqdYZW41mc81Im0qLDWNhc1k=;
        b=RPYszGEo4Y4XRjGIZBYlW1yDoLPp0neYzLxbusYz9tHa/lVrKm460CJWcTjYyZsmgB
         eNispOd6edmbcZSiajGRbuL/ZGJAETfH5vEjxuLT/rvJn/r26Ov0hdfyp1OHmMEeIuKp
         Rei6AVwKyHTZ4MuTmQM7Q9BQgNM8n7Rmf4VG53DrqSN9m/90PmoAdc2lc/DLDa5aLsco
         slr2MfBq/KdW5i9dwR1ZYg4Bfp6fbp8CdMiTIqHbpJJ835MH9WNNFs1uFKZKUz4twAzw
         kVtzGcIla+/Z2QdFWuzuFqpwWM4QLxb+s/gxH55BlhSfP7BC9z9pYIsgH+6ollqCeuKX
         wI1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=weIzMOG6;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b="A/lpdvNO";
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id k9-20020a5d6289000000b002c5621263efsi541892wru.838.2023.02.13.12.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 12:32:31 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=weIzMOG6;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b="A/lpdvNO";
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5C70722348;
	Mon, 13 Feb 2023 20:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676320351; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8/PDkUrAPEsO7n+jaOxTqdYZW41mc81Im0qLDWNhc1k=;
	b=weIzMOG6wqx+PR9BLbt0wApLtM24cw4L2fmkB2iIEBW4ufBgYJc47D8R7vhbMtoZGqk3Le
	uUc8R1SpWSJW04pF91P47B/E+4rNVLOl7fMer3+A8GA1JciOFM3wZskzYvC0fJRZwTmldL
	iYRmY3OGVnbfd2T9fLk+ZPn44udkgPI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676320351;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8/PDkUrAPEsO7n+jaOxTqdYZW41mc81Im0qLDWNhc1k=;
	b=A/lpdvNOY5Aprs56ZFPBeze7C4FXTVh9SRYPyIcTj/sw19uq0ZiH7oHH7T21uLnSGhWKyx
	HYvH0cnggZbfpSAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 48F7F1391B;
	Mon, 13 Feb 2023 20:32:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id yEvPA1ye6mOVMwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 13 Feb 2023 20:32:28 +0000
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
Subject: [PATCH RESEND v5 16/28] cpu-defs.h: Expose CPUTLBEntryFull to non-TCG code
Date: Mon, 13 Feb 2023 17:29:15 -0300
Message-Id: <20230213202927.28992-17-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230213202927.28992-1-farosas@suse.de>
References: <20230213202927.28992-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: NtGjzwH0r93Q

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
