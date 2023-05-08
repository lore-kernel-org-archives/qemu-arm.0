Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2220135ejq;
        Mon, 8 May 2023 11:16:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6BQSmlucZ8qfDWMtdzIC1U5kZUQcWaLzWq+dtVODTP6lzTMENW+WPiTrmcuwhinrwmH7Pn
X-Received: by 2002:adf:f4c3:0:b0:2ef:bc0b:e70 with SMTP id h3-20020adff4c3000000b002efbc0b0e70mr7733885wrp.54.1683569782444;
        Mon, 08 May 2023 11:16:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683569782; cv=none;
        d=google.com; s=arc-20160816;
        b=rJcqWWgbS+FAIUQcXF2L6pf2yTIHMszw2IAi5Fv+PiSZH1Ks5sfH6EK3TzURuletp6
         /c0ixrX1Cs0h0RuJ1NxnjRkmMAqy3KayeAH/M/X0nvUiWsCJ51pjJWROSGnse+JjCBsW
         LZCFEXmQlGCMxUX4G4gZanvvdRZEy+RU2gkENSY69KpdPmW41tu6bYX3v76dppJBL/ue
         XZ1sH0OjV1eqRg+c/4hAq3vtPvzhJL3rOh+wS1sF3F+LEeH+Im1zTd2eu6YtlgOaHA87
         RdxosOhkywSmTl+rQIhDQtKnH38BhyowWPJ46V19lKkW7N8dZH3B37k52KiyAkDYJKdx
         n9Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=6AcepwaYQZJzCLCMuL7Qdisp+94Cje2KJcI1iLK7IHU=;
        b=VVomOBKYNMsFvSuB6xg+IlKWemqV2jl/Fqg/Pld1Emcpx+BWCxJYeJeGL+xEJfMVad
         7dkKm9JQAFIc0lzmC/fKpg2EfZRSzLk7lSJ8fztIqWAtDe/ERj7/MytlnmnbrKa0zu/X
         0k6QQ0PhHCXybvSD1XkwWC5AumoLfb8YFggPCQf0m6ptuNkhko1/sJFJUJxqL7Z31vYf
         4riaBRA1JlUPoftWqsiDdE07DdnbqR61TDZ/5hcmE/tCYCoFTZhRo6mGaUVX+a7iu29x
         o3vKyg3YXLovDCwqVj8ptVocKmY14puQ+2zt5ylnZlgm+gQy33wuLblWTaBeqzO8Q8yb
         XNag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=w+apL8wX;
       dkim=neutral (no key) header.i=@suse.de header.b=dYaYLyNb;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id w2-20020a5d6082000000b0030630751700si4483046wrt.568.2023.05.08.11.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 11:16:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=w+apL8wX;
       dkim=neutral (no key) header.i=@suse.de header.b=dYaYLyNb;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 18E411FFD9;
	Mon,  8 May 2023 18:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1683569782; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6AcepwaYQZJzCLCMuL7Qdisp+94Cje2KJcI1iLK7IHU=;
	b=w+apL8wXnwtnz2fEWPzWej0Yc67sKWhyuuGKuN1bVDEylwao4MbgSewdSN6WmwrH05PSkA
	4Y2a1JZtadxHdcAIoKHs2AdJXKmaNNt0ifwjT8EbuHvq6unaBCf33JB57LaM4f/PTW2kQE
	Yqy5l3Iu/a/6gSTcAvP/rshCtAt+GLE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683569782;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6AcepwaYQZJzCLCMuL7Qdisp+94Cje2KJcI1iLK7IHU=;
	b=dYaYLyNbKhjBNBWMnZE5DAHVKVIZDpWfKKoHqSYeOg6Z/o/iLRw3jkkeFDC54/TfaW7OWP
	6U6LrlTGXJ1hgtAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BAADD1346B;
	Mon,  8 May 2023 18:16:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +Dn5H3M8WWSIdwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 08 May 2023 18:16:19 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 2/3] target/arm: Select CONFIG_ARM_V7M when TCG is enabled
Date: Mon,  8 May 2023 15:16:10 -0300
Message-Id: <20230508181611.2621-3-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230508181611.2621-1-farosas@suse.de>
References: <20230508181611.2621-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: m0VPu3fwZlIo

We cannot allow this config to be disabled at the moment as not all of
the relevant code is protected by it.

Commit 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a
KVM-only build") moved the CONFIGs of several boards to Kconfig, so it
is now possible that nothing selects ARM_V7M (e.g. when doing a
--without-default-devices build).

Return the CONFIG_ARM_V7M entry to a state where it is always selected
whenever TCG is available.

Fixes: 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a KVM-only build")
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index 3fffdcb61b..5947366f6e 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -1,6 +1,7 @@
 config ARM
     bool
     select ARM_COMPATIBLE_SEMIHOSTING if TCG
+    select ARM_V7M if TCG
 
 config AARCH64
     bool
-- 
2.35.3
