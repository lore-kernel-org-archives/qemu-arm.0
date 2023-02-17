Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp127619ejb;
        Fri, 17 Feb 2023 12:14:06 -0800 (PST)
X-Google-Smtp-Source: AK7set8i3ZpFg0li5la4BlsS+9T8X8s5BOUeKpSNGrdfEplW01V0BqrapsE/+TXpoQVF89nsuJM1
X-Received: by 2002:a5d:65c7:0:b0:2c5:5ca4:ef14 with SMTP id e7-20020a5d65c7000000b002c55ca4ef14mr2302518wrw.9.1676664845950;
        Fri, 17 Feb 2023 12:14:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676664845; cv=none;
        d=google.com; s=arc-20160816;
        b=tmjGRgEQZmduXN+be4hzB4yt+/ETHVaeSP9dCdmVYapiJbbA6pPQ8JSu45OHpEsX/v
         nKzVNzD00lNdMy0TxwquVmuIWnI5N3i2g4nqa4Nu7l509gWOuS5SSSjNWLdioNum+RQL
         YMWpFwVH4vtG/iCOYm0kpeGXOYm5kJn8rrpyjRtxAi+Xm015CJ856SmMDsyrNYtmpTJn
         UsaUXGiCLutqMfTxk9jGwj+PcBrcc1g7LMz3LtpP5DhXnPk0f+bR2LavM1nOwckEZlmd
         XfWcs6W/tfWwjkAoJwMdmWV84pJ2sY4ogbzA2e0kq7OWPz+6qgYLsfScABapfaCJ9shM
         XKCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=IneoIjeaaItZ9WFIdyjktzS9t1bCTfcOcWOa6rg90xU=;
        b=GPZNcgiaXFjoNu4polhb62RZ2NhM+WjcOk9S6TdCu3EAFN9/wUtbw4WJ+rEd0DgGwp
         q1mhPSxF+i6EpklllW4H+PY0gyR6mGj5yrvAoqDlQiMpsPzsTj3Z8vu7MOAE3BJzdQqb
         K2q/eLZazqypup/CB3ohItatoaQyzEarcniyWz1yrHt+yPvc3FNta+5s+jpSNb2ioDQm
         BxE0v48LUC9Vtuy7Sv96CfW9vLG9W4Oj6a/EGvVtcVwmFtMHu9pbRmPEUkLtprWaQ6Qw
         4x8aJWxz7Pzc7uGXdDSU/Xf2WOJXj0gcT6rphwFPMijDR9UDOJjQZBvVaE9K/jSMwCp3
         ucGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=GhUjd+8e;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id b9-20020adff249000000b002c576bc6c11si5856154wrp.121.2023.02.17.12.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 12:14:05 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=GhUjd+8e;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 94F5B20FB3;
	Fri, 17 Feb 2023 20:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676664845; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IneoIjeaaItZ9WFIdyjktzS9t1bCTfcOcWOa6rg90xU=;
	b=GhUjd+8e67kPR0dZq3k0OsNpqv6Oxm2du4YQj48G6s36mUzFiL1YD9WVFaYlm448zcW5/J
	beVhtBbstC17sWPz1sCJDjP5RhzOV0Em0g5oeU0WpXpmsK75F3JVGci8gCXnTGYUNUKuWH
	lw5g1vjOXryT7CpnjvZK/NSLxoWLEm4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676664845;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IneoIjeaaItZ9WFIdyjktzS9t1bCTfcOcWOa6rg90xU=;
	b=pyNQCG3NXVXOzeJ9Y/tiupouWgvGAIkQNUaGXrYj3sOoYut3fMNSXbsuGnTy/QT0YSROX8
	V4Fh4nVxUAtPhNCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B737B139BC;
	Fri, 17 Feb 2023 20:14:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sADGHwrg72MwIAAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 17 Feb 2023 20:14:02 +0000
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
Subject: [PATCH v6 03/29] target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
Date: Fri, 17 Feb 2023 17:11:24 -0300
Message-Id: <20230217201150.22032-4-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230217201150.22032-1-farosas@suse.de>
References: <20230217201150.22032-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 82Qx/gaggVdj

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1fc860e039..bd704396e0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10819,11 +10819,13 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     unsigned int cur_el = arm_current_el(env);
     int rt;
 
-    /*
-     * Note that new_el can never be 0.  If cur_el is 0, then
-     * el0_a64 is is_a64(), else el0_a64 is ignored.
-     */
-    aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
+    if (tcg_enabled()) {
+        /*
+         * Note that new_el can never be 0.  If cur_el is 0, then
+         * el0_a64 is is_a64(), else el0_a64 is ignored.
+         */
+        aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
+    }
 
     if (cur_el < new_el) {
         /*
-- 
2.35.3
