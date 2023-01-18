Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp787739ejc;
        Wed, 18 Jan 2023 11:38:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv6c8o0cE+wmOsVSMQ9lhaQmugitxJ9bWdi0Ig6jhFO0ki+JRiox175XNbvji/m/guj0Gex
X-Received: by 2002:a05:6000:603:b0:2bd:f651:3a67 with SMTP id bn3-20020a056000060300b002bdf6513a67mr8333503wrb.64.1674070694806;
        Wed, 18 Jan 2023 11:38:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674070694; cv=none;
        d=google.com; s=arc-20160816;
        b=kiCnmbKRtHYmvVwN+B/CZZ07MqVjnGk53iKfeqy/RRX1sZ+DJNc6MaS+1mlB5sJhUY
         Svrnz2UofLsHdpXoktIDvM/C1s+acnvEqx8rFD5gfnNKblpfURQvqMiQJ+K9TvU9jTpk
         S6SK7Bo3UMt8NBKColrce82dM2503V0aFo/lu399vzoiketE3O7kMprJYWRZ5V78fcQw
         OjNrRCTIYN9eFJwrNJbE/BgLdfi0BQIwambZDOfTYcxt8YucdRCcLMVRFFUu0sYXKIgH
         zeiunIu1NTJIKK+bcVf0eX8siQ490JL5acRSjEczigd3ZJNFxYu7ErEawi5G6RJ82suc
         5nkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=1mXhRdumUAtRLJGk0JssAkarGrJmpyFCqBrZ5ClX9uo=;
        b=sxvcKw9wSX0AnjaKweC2jrO7QhBuVpiWuhqCkbc5qNpVw72YhMvqTKVH4Dtawm3NuH
         3YELuQpqWZbGL3vREhZ6MPh7aU07id33pPfCYoriUaHYTZZLPKDU9cjj8t374WG7giQa
         8NY8vn5XOCErLZ1AZSvyYRJpOIm+b1cUb5yjw9JxPzuEUI2Ux1Pmw5bCiwxi6rJdUQ0Z
         EUuOoyA+gOnNMi6DUYttMTjlxbE1c+LqyvwzqtvSNZ+KZYLpgY7VlwjowXjfni2+YQXO
         hObNhPDYgHbSKLb9C8sYAvl7zJawNms0d9pssZ4hfy1DkspP2lyqq6XMDjX1QrEVp9g5
         NmdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=iwnJ2OoK;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id bo19-20020a056000069300b002bdec2949c9si13259034wrb.691.2023.01.18.11.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 11:38:14 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=iwnJ2OoK;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 701193F683;
	Wed, 18 Jan 2023 19:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674070694; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1mXhRdumUAtRLJGk0JssAkarGrJmpyFCqBrZ5ClX9uo=;
	b=iwnJ2OoKxDt0Tp0QnZLEBG36FdhABI1RFBDDgSvFQ6lNBrEkUc7sSdP46duFXkMep7NTbl
	hWHHyzeZ6VuUgG7z8+NC8ILl9Mvdx2YZ1AnPPUMRXc2543PvaBH05+oy6S2nZB3PooOEcl
	mP004m8AH1/qj7odHIeq/zu5+B81xrU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674070694;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1mXhRdumUAtRLJGk0JssAkarGrJmpyFCqBrZ5ClX9uo=;
	b=Ose44yX1P+gFIE/3/MPHRVsxYvPSEPhkxvKty/zn7MgoOOqZNSIRez4itGwS2yITfeCXxl
	UCTDHAkPKFfLr7DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C7565139D2;
	Wed, 18 Jan 2023 19:38:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4AHrI6NKyGOWBwAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 18 Jan 2023 19:38:11 +0000
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
Subject: [PATCH 16/20] cpu-defs.h: Expose CPUTLBEntryFull to non-TCG code
Date: Wed, 18 Jan 2023 16:35:14 -0300
Message-Id: <20230118193518.26433-17-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230118193518.26433-1-farosas@suse.de>
References: <20230118193518.26433-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Y5qgiiTK2442

This struct has no dependencies on TCG code and it is being used in
target/arm/ptw.c to simplify the passing around of page table walk
results. Those routines can be reached by KVM code via the gdbstub
breakpoint code, so take the structure out of CONFIG_TCG to make it
visible when building with --disable-tcg.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
