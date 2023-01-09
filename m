Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2663326ejc;
        Mon, 9 Jan 2023 14:42:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvk/oAtzlzhQmGGXfh3TiQXLzsifvoduSNZVRAQ/MPld+8UL6uH+sBHB0O3GI7h4PO/pRzh
X-Received: by 2002:a5d:664c:0:b0:281:b594:c716 with SMTP id f12-20020a5d664c000000b00281b594c716mr34635173wrw.36.1673304160856;
        Mon, 09 Jan 2023 14:42:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673304160; cv=none;
        d=google.com; s=arc-20160816;
        b=dr9nIXKGHOjmyk3/ffSCWJaMJQ58dWwHC/+zy8hwFiQ7GAzFFwBl9tqM97Wfp2ZGWT
         BxbNgceTC21Gspot3hMKoMqxIkUhIL8q4pLuu4LfquMsAMv7xit0M9vj7KA56YDsxQaO
         U9FIBOIZAHsCbK1PMC7kzF3PntGOI8ucrtF55fdAeN0yxA9zK/ALu0Cw0P8KP3cqsb35
         WAXi9CSlR5UjX43vhVKE9o06grLhVjLemf2Kvpvid4KFZmGFWBySilsa7Uj2ZQbR5qsc
         aE6m1x+7nsFf9dML+L7SEaw/eUY6zi6WzRaEsybdsv7OrRU/UHKamOuikfANt0giTaXd
         A8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=jtBlDG6AzO3GlcmI9dLf0KajP9v35d6tlu+6KN68VhM=;
        b=Xudb/CjGqYN33JRk7p5nYtIXQo+urODGbhQeqgYT/b1VRPmwEniJI7ZeojvtRbmt01
         OuGgswCNgoK2kZ6bbcizPmmQKuM7Odxjr4ZFt0nRsWHHlBIiCAwSrGZsZIHhVFAvj+RM
         8kEg/GmV/XJ4Txqhb+PbFs1GsxXhOtDdIZxVxHbHUtmDnaHQcdEnhoAwvwjr5Zc2nM3r
         qUx4lA5dXgPjsQIE1MP8EqKGsYq+P4mIfShRF+gKkDiFlsEBEbofM3bNS1guwcGQVhZT
         vNd+JG7YPlSJ1Er4Whhvjge6FFz3M2tkqNnRB0CP+YmshpDT7JzJdGM5+FaBqG/aTx7n
         2f2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=b20Wjfdj;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id n12-20020a5d484c000000b0028c17b4c277si7279016wrs.232.2023.01.09.14.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 14:42:40 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=b20Wjfdj;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6766F5CDD7;
	Mon,  9 Jan 2023 22:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673304160; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jtBlDG6AzO3GlcmI9dLf0KajP9v35d6tlu+6KN68VhM=;
	b=b20Wjfdj49+6UZy4f7UN5spygZQ4CIdDxx5K8K+JtO8hn7F2c9Ao7UBuV41H/fvmN9qqrR
	caaSUhylWuoLLI/fGKj/GiK0SL2sMiJRgiFBCxegYYL0W6XK+DiEWR8iFxu0DVHZezqV1I
	94FdgS5wF9FkZpTqQPh0bdOnnwx+q6c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673304160;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jtBlDG6AzO3GlcmI9dLf0KajP9v35d6tlu+6KN68VhM=;
	b=pFA+8el8wPtQN2WUN4f9B5X04Wax0w1KpTQR7cRTQB61eCyzRstYpEzIDU2aiaVNJm2Cw+
	U+2yLHFOW1OBXDBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CAB2213583;
	Mon,  9 Jan 2023 22:42:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id QHORJF2YvGMdIQAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 09 Jan 2023 22:42:37 +0000
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
Subject: [RFC PATCH v2 01/19] target/arm: rename handle_semihosting to tcg_handle_semihosting
Date: Mon,  9 Jan 2023 19:42:14 -0300
Message-Id: <20230109224232.11661-2-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230109224232.11661-1-farosas@suse.de>
References: <20230109224232.11661-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: otrjvuQZ3XXl

From: Claudio Fontana <cfontana@suse.de>

make it clearer from the name that this is a tcg-only function.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index cee3804354..e02a463d46 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10765,7 +10765,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
  * trapped to the hypervisor in KVM.
  */
 #ifdef CONFIG_TCG
-static void handle_semihosting(CPUState *cs)
+static void tcg_handle_semihosting(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -10827,7 +10827,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
      */
 #ifdef CONFIG_TCG
     if (cs->exception_index == EXCP_SEMIHOST) {
-        handle_semihosting(cs);
+        tcg_handle_semihosting(cs);
         return;
     }
 #endif
-- 
2.35.3
