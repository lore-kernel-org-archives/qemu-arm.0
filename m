Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4678530ejb;
        Tue, 20 Dec 2022 14:06:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvpn3woc0c6FbzyVTKhs0H5xlw/ohYZEs4+veLivs+1TVwfYeZG59xfG1LM46fUL03c5drs
X-Received: by 2002:a05:600c:3b88:b0:3d3:5841:e8b4 with SMTP id n8-20020a05600c3b8800b003d35841e8b4mr6811496wms.35.1671573995619;
        Tue, 20 Dec 2022 14:06:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671573995; cv=none;
        d=google.com; s=arc-20160816;
        b=AGLi7i0KaZjy6SkIBh3eB3nbIkCBdfJAmhCcnCgGlGzfcupzv1qk4MrCJlsQFW6OFG
         mWzlCd3SwJBODcQZCt6lyO7drZl0Sx4aubQsrad12RImxu0xVN6ozKdENAfVGy3VQm3d
         /H4IknlHm5RP93Rk6uu1eKc64GjBHFgN9naVUgbv8yEYY1tLUUQMiqWwNPC/8XYfFFRx
         KvPMjk8YNtrmeDvN9dVeD8/IyqGPk43q3YXz2y82JLpF7juPiO4nBqQgbAKxxTOSshQH
         G0veJq+rgKg8uRNhtvZpgzPMJF/JEl9n63EqkBEDWvgNcrIxKD2LQFGIyEnmPGDM6Z6a
         OY+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=JEbhiLQ2GQcRGDL18XkLMZphLvwc1KZfcAacZO5hMYQ=;
        b=uf9jPk8+fIOThFOrmO2xqWiWvMExO8HpeRn94wJCnqn8Iom/xTKNbF+WgqHn+gda4U
         DN3UXF0QHscKwIyYhU7xcvmUssK8ASOBqVy0OTpaI6NxGxW/F2DT/2tqIrppueDYbZp7
         5b/wtsE7ywSBwB3kEsXHd0m20xJ6BN1G9/mYD1ZCn08TsEMhluGvu9I1/5MUPvHGdLTn
         L1DkoCXVPVKWPb3HyIDfFv/i0RzelzlFVusuq/Ej6lfV6G68VC3dTUwtDxeoW566Prsv
         wXpLSthfYMCsPTXzY70YcLPMZi7FMbUoz5bwf/TMRRthZoXhs/jA803eLDo/IeYo+YsG
         629g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=eWoq0rrF;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id y5-20020a05600015c500b00241c5ec0d13si10513690wry.870.2022.12.20.14.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 14:06:35 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=eWoq0rrF;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2051B4DC6B;
	Tue, 20 Dec 2022 22:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1671573995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JEbhiLQ2GQcRGDL18XkLMZphLvwc1KZfcAacZO5hMYQ=;
	b=eWoq0rrFocW378BztHhZ9/36aRCgrm02mucDkys7s9Z+TGoenXNkIBKf3RpOGbcvkhttb+
	aX5CI/z0k66PzfsoVQYLboSb31JvuuqnJHXU33XxXXti3N90sOmr2pKfCdhwI3CaRSRPIJ
	ngPk0x3UBR+4Z2mXX2SOazSeSPV/2EQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1671573995;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JEbhiLQ2GQcRGDL18XkLMZphLvwc1KZfcAacZO5hMYQ=;
	b=cHtnGp8bfaU4T+aiuafhnlg3kmaaDRvzjVStDKU5LcrQbabRj0QVsbgBSt70oEjWm/0+Bk
	bspqNfZ5fwv7uGCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3D50813254;
	Tue, 20 Dec 2022 22:06:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id iN7tAOgxomPwfAAAMHmgww
	(envelope-from <farosas@suse.de>); Tue, 20 Dec 2022 22:06:32 +0000
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
Subject: [PATCH v2 1/5] target/arm: rename handle_semihosting to tcg_handle_semihosting
Date: Tue, 20 Dec 2022 19:04:22 -0300
Message-Id: <20221220220426.8827-2-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221220220426.8827-1-farosas@suse.de>
References: <20221220220426.8827-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 1zfzBQqyhCIP

From: Claudio Fontana <cfontana@suse.de>

make it clearer from the name that this is a tcg-only function.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
This function moves elsewhere in the original series, but the name
change doesn't need to wait.

Originally from:
[RFC v14 38/80] target/arm: rename handle_semihosting to tcg_handle_semihosting
https://lore.kernel.org/r/20210416162824.25131-39-cfontana@suse.de
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index bac2ea62c4..fa741d5175 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10293,7 +10293,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
  * trapped to the hypervisor in KVM.
  */
 #ifdef CONFIG_TCG
-static void handle_semihosting(CPUState *cs)
+static void tcg_handle_semihosting(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -10354,7 +10354,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
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
