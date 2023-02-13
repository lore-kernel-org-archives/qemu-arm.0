Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp546665ejb;
        Mon, 13 Feb 2023 12:31:47 -0800 (PST)
X-Google-Smtp-Source: AK7set8gDgyCScagLoXv9Gt7x+MD4C5yos0cfyhz+VSl/skF1WpZejGCF8b6k2+xzEZpQQaQSiGD
X-Received: by 2002:a17:906:1e45:b0:8b1:ff:7588 with SMTP id i5-20020a1709061e4500b008b100ff7588mr262881ejj.13.1676320307829;
        Mon, 13 Feb 2023 12:31:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676320307; cv=none;
        d=google.com; s=arc-20160816;
        b=No8u/3B1pw+x9sFF3UWf8CzcY75ulfSfGh2kHMlnt7rLHMvX/Wmt7vlfgOAqlscaS+
         a+MZvzCW2wLuqyyUrjk3eqWijCYrV32Yzp7fMR5rBF9LYCYexDcDOkpLdUafym+1iwK3
         vNRsZKrMUpaN9jOHXZhWO1qoXUbFQ61ZI3GVILO81Ka8oxKqAV1cnCwNtYDiK2BOmQmN
         1ObIkXmkia+MBbljJX/tWNQeuPB4vMnYH7kWHfMCKhh5oIf8fvqxHmQXRAIuWdNw9xAw
         sK7W/RsbkN6EAqRa22SEjPFdqVegWFQcwm+iUjO2vp/+BqyFBvgqfDBLUuCj73Bzg/DY
         4cGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=Vmu/tZEOvDxJsSgDXhKLFroXqmMIraIq6twXvpPip20=;
        b=dTpiug1Uz99wrFFLq7yTeniM2bsELAwIHy9qTX1n2xsKXt0NfXUaPX9s+AkLlni+WJ
         hOholtgKvInD71afaYHCtMtox8m4oMP3+dweliHcBtDtlJiTDYON8FpAnVMjJ5IxWvep
         LcRa/VnO7jZjswAwCkyPj4YIoKhN4CGmh+eP1rQpQQ6zfnA2SqDj/DMQES3PpCYgps/j
         ZwNdOYWrOpu2IcNOjtxIkEvxCTxra430KZMTp8BHT+2zmvDWeI59Ka7Vqd0dKdtzFMoD
         mOOIjPubSYpRUGj5tosrwQxSuCm+PihFkkuBJeqXqZyIC2Nt9hHIldm+SWS7xkuea4DQ
         Q7LA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=1BGn45h4;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b="E/vUcfJm";
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id j23-20020a170906535700b0087f5eb7d738si18887591ejo.618.2023.02.13.12.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 12:31:47 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=1BGn45h4;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b="E/vUcfJm";
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7853220193;
	Mon, 13 Feb 2023 20:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676320307; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vmu/tZEOvDxJsSgDXhKLFroXqmMIraIq6twXvpPip20=;
	b=1BGn45h4uK6sn5zqg9iLZFishd9mGQF6E/luDlOM/fRbX6mIEi0MTqvl8gCXcWka9dsNjh
	O4rHW5xp3TkcWes/BmUAVf6X51X+SqL8FEbhM249ioPsUr+WP2RIX57oLZQnu3KyuMFqiA
	zTjlY2m2M+v05vzC4kN8JYWE8eojLQE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676320307;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vmu/tZEOvDxJsSgDXhKLFroXqmMIraIq6twXvpPip20=;
	b=E/vUcfJmrwqS+BlbMKHfAb2Viv/+2UNM0fHA/8rujxSQuxFOLuBw8fXlahU9sEkoruEfs8
	pLHbTiDC383J5lBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6E1751391B;
	Mon, 13 Feb 2023 20:31:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id EMMVDTCe6mOVMwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 13 Feb 2023 20:31:44 +0000
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
Subject: [PATCH RESEND v5 04/28] target/arm: Move PC alignment check
Date: Mon, 13 Feb 2023 17:29:03 -0300
Message-Id: <20230213202927.28992-5-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230213202927.28992-1-farosas@suse.de>
References: <20230213202927.28992-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 58rIvYCxAtzM

Move this earlier to make the next patch diff cleaner. While here
update the comment slightly to not give the impression that the
misalignment affects only TCG.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
