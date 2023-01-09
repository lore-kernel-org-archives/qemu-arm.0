Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2663463ejc;
        Mon, 9 Jan 2023 14:42:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvNORml/djhJl/wYVM4B6dPemHlPrR7E0JFCsMAv2yK2AoiDYWM9p8uzldcz6gS03Ch/QG6
X-Received: by 2002:a5d:5c0d:0:b0:242:1809:7e13 with SMTP id cc13-20020a5d5c0d000000b0024218097e13mr51279915wrb.11.1673304170276;
        Mon, 09 Jan 2023 14:42:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673304170; cv=none;
        d=google.com; s=arc-20160816;
        b=n/4UcLIqLHB1csWpMOgklhbIHmglZN8r8Kl0ZbU6wazRrAA9sE6m8dQ3NMkMEFBIBV
         kjpSGMjAfog0tlr3qqk2T6GJb5xtiKozApnDajCQqguco4nN0quttalo+0gHGQC0292E
         J3W8cyM9dQQf6ccArbeDJiyPB9OUa9/dOuISRThySbqgIh3j+k3o4O3APZSAYjMISjIZ
         63oPwoBQoFF6Guex+tLHFlb3AD7YyLqvza1EmuotbIetiHWtNpciToI5lZWRVTpXsoaK
         7Sb07MkfcnN530+QgxZwlkNX0Io2pakrhfHqRlQlYqcQdC7BUNPd/dmI70kIofn9m3Xv
         TK2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=eeJh5uMajepX2o6i3IFybvlJ7FeTuN8w6d/EVXkaFcg=;
        b=aWMFPU9KCaa9ZQIisDaH98DwU9W6+IjDDaM+ExVxUQacINdfflBWPkKwNP/2JX+0ot
         dZbEksxUW7BXThkAVHROPpnKgA7rLi+P5/xGZ/C69nRCR3fvB2tEk1abhV3vwkbkf2Kd
         gzj92TWYbg/or/yZFCcXSHw16jjCIRdtdNEIZARhj/WDAI65MNPAM87Y6UAkojhSTmx3
         4lks4KBhUifL/uN2ruV6xA+0qTrkYvW/E0/f61/+h2+RwBnFL9NvH+QzEKIl8BvqOcoO
         13szeUP2cC2qvGgZ7SJqJORxSbqLcUIFSBdAk/EBOXbPg8Sl2bw1T6aMQ2ie2VO15nW1
         j8hA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=W7w2ZfA+;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id i22-20020adfa516000000b0028290c22fdfsi7486874wrb.376.2023.01.09.14.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 14:42:50 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=W7w2ZfA+;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5FF7D4D35C;
	Mon,  9 Jan 2023 22:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673304169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eeJh5uMajepX2o6i3IFybvlJ7FeTuN8w6d/EVXkaFcg=;
	b=W7w2ZfA+OS3TLuHnzSQQmo/0hO4Bjh7AXLJo32S+dXnb28aS5Djcrl0O5YbhgOYY4MoTBq
	FIlSRbhXystX61n2VXVBGiZVDK7+G7CtZDlnM2bgjjhwwYplpuwyPheaXUAUByZt/Ex34P
	3KNBlo1tXio6Y9C21jSFKIwHEiG9G8w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673304169;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eeJh5uMajepX2o6i3IFybvlJ7FeTuN8w6d/EVXkaFcg=;
	b=JTBLw/p+onaNR+xQy818F0DlmfB58GdF2iio0dn2dCCAFDqjMqC1ssZsTlpjA+yeARDdvh
	gan8XgoRPgjj0yCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CB19913583;
	Mon,  9 Jan 2023 22:42:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GI3vJGaYvGMdIQAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 09 Jan 2023 22:42:46 +0000
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
Subject: [RFC PATCH v2 04/19] target/arm: Move PC alignment check
Date: Mon,  9 Jan 2023 19:42:17 -0300
Message-Id: <20230109224232.11661-5-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230109224232.11661-1-farosas@suse.de>
References: <20230109224232.11661-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: b2AE0kEhvaI+

Move this earlier to make the next patch diff cleaner. While here
update the comment slightly to not give the impression that the
misalignment affects only TCG.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/machine.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/arm/machine.c b/target/arm/machine.c
index 5f26152652..b4c3850570 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -839,6 +839,15 @@ static int cpu_post_load(void *opaque, int version_id)
         }
     }
 
+    /*
+     * Misaligned thumb pc is architecturally impossible. Fail the
+     * incoming migration. For TCG it would trigger the assert in
+     * thumb_tr_translate_insn().
+     */
+    if (!is_a64(env) && env->thumb && (env->regs[15] & 1)) {
+        return -1;
+    }
+
     hw_breakpoint_update_all(cpu);
     hw_watchpoint_update_all(cpu);
 
@@ -856,15 +865,6 @@ static int cpu_post_load(void *opaque, int version_id)
         }
     }
 
-    /*
-     * Misaligned thumb pc is architecturally impossible.
-     * We have an assert in thumb_tr_translate_insn to verify this.
-     * Fail an incoming migrate to avoid this assert.
-     */
-    if (!is_a64(env) && env->thumb && (env->regs[15] & 1)) {
-        return -1;
-    }
-
     if (!kvm_enabled()) {
         pmu_op_finish(&cpu->env);
     }
-- 
2.35.3
