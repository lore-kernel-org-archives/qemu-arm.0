Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp593236ejm;
        Wed, 26 Apr 2023 11:00:26 -0700 (PDT)
X-Google-Smtp-Source: AKy350bnszYiPmzXoNs1zLoNPS9tHc0ZtjUMGYoWfVOy9Cr0IcsS3BDdhDzSVm9vHnhdzWXMB0h/
X-Received: by 2002:a05:600c:2183:b0:3f1:8372:d575 with SMTP id e3-20020a05600c218300b003f18372d575mr13870037wme.38.1682532025888;
        Wed, 26 Apr 2023 11:00:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682532025; cv=none;
        d=google.com; s=arc-20160816;
        b=UdRi7kzRs0FBijeN2OD5QEdqaJ1LwacImAIQA9ZewXboeZb6IAjyLOSEJDimUayE0B
         cFS10tieh4QttgcQlggFmYlFrNi7O0889AwGYcDXiNtdj9ZD8SAS1aVVy17JHgGNek52
         7SrgDQmhwVYNtKdvra39yhIMptdEkilfZY9FFApgEQHoP7N9G9Tx4eK5Sk/OfNZz1uQf
         NhjDMWO9qICkxVCkfVmdTlZhJSo8lgD87WdAMUr6irTPPrEVfRV+AagF6iKEDJhHURXc
         Su456RDsYiSTR+Jjy8CiLiin2v3Szq2x+QpLNNGKh+51cBFH6E/1/XSGQyHHnTXrLpMc
         nBLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=1NeR+j7RqgopAMvlUClcyIOKnOHjYTzEQ3oxPQoE8lQ=;
        b=YXqCGnpdHCO/AUPsW6L1+NUNgYXsz2TgL5yDZuAglMoNtR+xE9tCC/fW4EACxdyhxL
         pTUTEGkheqiqbvoK9PpBVW3a5YYjU3F5nmu5Z34nTIbpXUEHaJLqs8XVi2MMZFX2E2iV
         HV6vSk5DzN7Log5GUd/Tl9uyeTpvkLcyFyHeEuPmraxkpAh0Ds/5yTWIh+d3e7oqhScy
         zBPoVnee6Dpqi2nZIO56W5z4urdqMF+iIjA1AvNkp5y4dAUrU0PoBUvsFcDgCl0DOH45
         JXJ/MtE2DtixKgSI3dx/Txesl2DhaPrsKGZwsdEBkMLB2dTaz8ceg794YFMx6A2xC8g9
         ttdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=lYOFxugs;
       dkim=neutral (no key) header.i=@suse.de header.b=tjgQo+bJ;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id z8-20020a7bc7c8000000b003f250aa7071si4665558wmk.95.2023.04.26.11.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 11:00:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=lYOFxugs;
       dkim=neutral (no key) header.i=@suse.de header.b=tjgQo+bJ;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8737521A14;
	Wed, 26 Apr 2023 18:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1682532025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1NeR+j7RqgopAMvlUClcyIOKnOHjYTzEQ3oxPQoE8lQ=;
	b=lYOFxugs5fHY6h353Rr+hMXKeWKZSPke5mOGWSASS7XKRbtbup+BEbFuXfdOf4qTpGET2G
	6rC0n75FrY6LYjgDmdSSRyvuyufhJBGXAS1j9VT1RARbQa1fw22q7LUqBGncpelrj39plT
	Dl6W4oGu9uzRHKoplBlUIQXCyBOh5CI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1682532025;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1NeR+j7RqgopAMvlUClcyIOKnOHjYTzEQ3oxPQoE8lQ=;
	b=tjgQo+bJMeTDIYNKz4wCW18S2YGdCLtjU2OinN0qTeHU0+5WHhvNc1+QOV7Dvg5h9JidWY
	U1dwLAoFckr2fvCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A4EF4138F0;
	Wed, 26 Apr 2023 18:00:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id yFc9G7ZmSWSoVQAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 26 Apr 2023 18:00:22 +0000
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
Subject: [PATCH v11 02/13] target/arm: Remove dead code from cpu_max_set_sve_max_vq
Date: Wed, 26 Apr 2023 15:00:02 -0300
Message-Id: <20230426180013.14814-3-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230426180013.14814-1-farosas@suse.de>
References: <20230426180013.14814-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4YqbzmE8sulS

The sve-max-vq property has been removed from the -cpu max used with
KVM, so code under kvm_enabled in cpu_max_set_sve_max_vq is not
reachable.

Fixes: 0baa21be49 ("target/arm: Make KVM -cpu max exactly like -cpu host")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/cpu64.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 76891c9288..fb5e1b69db 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -336,12 +336,6 @@ static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    if (kvm_enabled() && !kvm_arm_sve_supported()) {
-        error_setg(errp, "cannot set sve-max-vq");
-        error_append_hint(errp, "SVE not supported by KVM on this host\n");
-        return;
-    }
-
     if (max_vq == 0 || max_vq > ARM_MAX_VQ) {
         error_setg(errp, "unsupported SVE vector length");
         error_append_hint(errp, "Valid sve-max-vq in range [1-%d]\n",
-- 
2.35.3
