Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp709617ejc;
        Thu, 23 Feb 2023 05:11:20 -0800 (PST)
X-Google-Smtp-Source: AK7set8pdTzRH1d18n/ugBYziZd6aVF07Nfk9ugucX++yM1e7rR7aRc+nlmM7yiTlm8GXGogjiSJ
X-Received: by 2002:a05:600c:3420:b0:3dc:16d2:ae5e with SMTP id y32-20020a05600c342000b003dc16d2ae5emr8878166wmp.32.1677157880668;
        Thu, 23 Feb 2023 05:11:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677157880; cv=none;
        d=google.com; s=arc-20160816;
        b=B5bSIm93ZU8mqtpmm5GmsxgzOq2CxcYILoSBmnNt0O0bitnnvWhh5wmJ55M4k647ql
         lZvYBF/dOOwoUj2W2hnRoJOPPaWdA0ihzeK7fHAgm5iaEnW36C84KuMEt/gWkp6JJ8yx
         wAeuUrmIYzmOHKUP8/CDteHK6Dypmzda5p4mZ2vQBWZra0MjslbbFls+XBtQBFDKjtli
         +vBe9Ox+LLnlBTdu/kvEPTzHlvp7k5RE6ELO+KoiGVSzUyXyJWNDIOBn12nzNdo/gIEz
         aErztKNP7LMQ0CgoNKNYQC34pSX5kpFZlOV84YSkgn9rt42eQWaQAPBXZDzKT9HwNQM3
         1Vrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=8/PDkUrAPEsO7n+jaOxTqdYZW41mc81Im0qLDWNhc1k=;
        b=IJ5P4OZILiYsd8ATzIreGUjX7wPAytpfArf480MG2P2c8YvB6XMPd2JuF7NAMBEhkQ
         PRayChQscP/nVVvRqrl9Bn2avrTS5pUaPdtUx5UrhRwThruEzIQc+JscltcUxSLvbtyw
         81FhqRvrjRx2Nmp3T+6sbpm+C4Q7koI8xK8fe5zjY5t0HwB72z0GWzzXgVQCwtWpq8Vr
         Wfj9uCWQ/ob1M+TKrzfFI+HM7BX373haJDUMt7MoaM5WePft7wO7WQmlEYMc398EOPA/
         qJ6kGsQoTSmqidRUjd7ZVac+NXgYqjYxQ8oOT4bLaBeG41LV3sfoy2juAiRf4Osy0GFA
         clGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=uuubCfo3;
       dkim=neutral (no key) header.i=@suse.de header.b=un2FdEUB;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id m20-20020a05600c161400b003e00c4b18easi3717343wmn.40.2023.02.23.05.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 05:11:20 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=uuubCfo3;
       dkim=neutral (no key) header.i=@suse.de header.b=un2FdEUB;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4D3E233830;
	Thu, 23 Feb 2023 13:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677157880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8/PDkUrAPEsO7n+jaOxTqdYZW41mc81Im0qLDWNhc1k=;
	b=uuubCfo3GrKGTYHSAlc/LBLToGiWaImbshq/JV357VBMGDBo6oOQcej8n+5+OOtQkQQs18
	KKUB5c6Vvq7tEDVPTMsdpklBSEpUSgWKYrO++X90P+aioo23t2QsQSILDwp3fAyyo4aAWr
	pnIU/oPJlcacOjceUcpKwNEXte878bY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677157880;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8/PDkUrAPEsO7n+jaOxTqdYZW41mc81Im0qLDWNhc1k=;
	b=un2FdEUBViexnQfDThbIRHEtxzzmBaV6Xj6+HbScY7hXG+/XtcHmBeN1MWjn2TZlk5PNat
	N0FsQSTXKyZM58Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6D30D139B5;
	Thu, 23 Feb 2023 13:11:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id gHqiDfVl92MLawAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 23 Feb 2023 13:11:17 +0000
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
Subject: [PATCH v7 10/20] cpu-defs.h: Expose CPUTLBEntryFull to non-TCG code
Date: Thu, 23 Feb 2023 10:08:31 -0300
Message-Id: <20230223130841.25916-11-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230223130841.25916-1-farosas@suse.de>
References: <20230223130841.25916-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2vU3GdLV8Oqi

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
