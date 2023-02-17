Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp127504ejb;
        Fri, 17 Feb 2023 12:13:59 -0800 (PST)
X-Google-Smtp-Source: AK7set+KV/6IFzNJDWawbw83ZUUozhI0vCfJx0R0cOp0aKvRwct4EwbRDEce2/7MCPLvcGwLbVkm
X-Received: by 2002:a05:600c:80f:b0:3dc:5390:6499 with SMTP id k15-20020a05600c080f00b003dc53906499mr1454882wmp.1.1676664839411;
        Fri, 17 Feb 2023 12:13:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676664839; cv=none;
        d=google.com; s=arc-20160816;
        b=Fx5rK+NhiX02Y/K0DlvQzIabGdaSrIt/Tc/1z0XcouaCRsFcrEne2Tl0D2BIvmSg5h
         xn0t02cKgzRMZWa7wgfoMaS2CciOS/R0Y1QEtGfHBV0cG029EqtjmZVSfOacxyM/SNqB
         LLFxRXHkzXOHOJZdqjVQqjowHBDxu0MNndI2rU8h6Yc4lA2DoT1ZOt8pKX3jfh7X/KEX
         wc0HWSoHwF9O3o/q8YBnanZb2lZOrncUsl+PcuIghNBkvJ6sy3OsydwqpZgaGVVahuyD
         9Pa8NYjaG5kvJiGclZNQetyj//F2SmYL3jhMDD7A8b/7EU52LB025pDccbjT1+xgfNB6
         k8JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=ipMAz6UcFNMUrmyN7w6MpZ1C6upGc9sisx6pYN2PzOw=;
        b=xeP6LOgW/56RHet8n0LhJYVP7meiC+hcB/XDUBzXK0M2B38q8mWAVzzmws9sdes6nq
         SMTqUd9Gj5JIUCGY0l3WZa3phZimpmKUlTeduEne30B0gfXKP9SNrouDLlTZ8Rrf8SaW
         sW+8XsAhzUTVw2NQ5yqMOY2S9mxgXaDySDW7RsqajnHGe23ACwTtbji2JkCT+hdb5eHb
         S8Bs4yQ/HPhQNwjHcixWiTW3MT3iFisSXKRNvwv9UBfAZNa8CBW8jxylUExcLyUAnMks
         XfwJwefa79hmDYv30jLsPOJrG0ArwTNwxjTzENi6kF1/Z8R0hNUwYC54DMpG1BedIOjX
         xhhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=tgxH2JQ3;
       dkim=neutral (no key) header.i=@suse.de header.b=WawK8vPZ;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id c185-20020a1c35c2000000b003de0c899bf2si7623680wma.131.2023.02.17.12.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 12:13:59 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=tgxH2JQ3;
       dkim=neutral (no key) header.i=@suse.de header.b=WawK8vPZ;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F1A7E20FB3;
	Fri, 17 Feb 2023 20:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676664838; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ipMAz6UcFNMUrmyN7w6MpZ1C6upGc9sisx6pYN2PzOw=;
	b=tgxH2JQ3xYLjzSw4qtwfArlOujJyGDUMfLiKU4WTUlnZRD/WQi3V5zDlxbb/eqL6MESpSK
	RCqhjbxb3QV1JUbZmO0ZUT2CMa160gaS5zEd82JQ+vn5f9vxYBfWSohzN7TVk9zX1LnVg6
	n2CFdsAJomkdqy4l+u09+Gv7R1/b4Cc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676664838;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ipMAz6UcFNMUrmyN7w6MpZ1C6upGc9sisx6pYN2PzOw=;
	b=WawK8vPZT7suDo21pf01WxSoyhgeos25rO0nrRAUqJaMC86YDgfrbHhAchPQodQhBPA7yw
	w6X5KomhArDYxkBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1AA52138E3;
	Fri, 17 Feb 2023 20:13:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4MULNQPg72MwIAAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 17 Feb 2023 20:13:55 +0000
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
Subject: [PATCH v6 01/29] target/arm: rename handle_semihosting to tcg_handle_semihosting
Date: Fri, 17 Feb 2023 17:11:22 -0300
Message-Id: <20230217201150.22032-2-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230217201150.22032-1-farosas@suse.de>
References: <20230217201150.22032-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: be9isHR6FtgI

From: Claudio Fontana <cfontana@suse.de>

make it clearer from the name that this is a tcg-only function.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c62ed05c12..190be1a64d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11006,7 +11006,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
  * trapped to the hypervisor in KVM.
  */
 #ifdef CONFIG_TCG
-static void handle_semihosting(CPUState *cs)
+static void tcg_handle_semihosting(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -11068,7 +11068,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
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
