Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8305899ejb;
        Wed, 4 Jan 2023 14:01:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtOIJ7iYMmNcSWh5EyckreXddNn5NF87vxau+ysAAYMYnVXfLwWc0jXMaAdATRKDI0Bp5hP
X-Received: by 2002:a05:600c:b92:b0:3d9:779e:9788 with SMTP id fl18-20020a05600c0b9200b003d9779e9788mr25779056wmb.37.1672869693005;
        Wed, 04 Jan 2023 14:01:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672869692; cv=none;
        d=google.com; s=arc-20160816;
        b=dhOlmMsd6ndXWCHRLS086Tl6LMtTOgQiODfKRWJfjxkFJdWBm1YNbOCcmJjwjjsfDK
         1TCkLKeO05b22gMzA7Z444J301m470pTKY6eC1rBtyp0pmp3ZZkINoY/AmVf1pd+9x43
         DAy5PfWXqh2efeiQpQ9ZPzFIsl5u9c6AwtLOUTmKjmCTMDPy2QnXuBig0FOvvvPS555X
         0A5OwS7HPeZ+5W+MKjbZKtczqCYHuX4DHTd6s6x3K+IC5H/t4WfF7JjGGvQZV6F1WLTQ
         LKKpzahUYzr/ANBiQJWRfOgja2QLJQanLcXllG/RlU5awqMzSUuwiydB9VaVN9+/Dj7w
         n5nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=VbGdZk4+EnEWHm/+Ds2v7NcsQYnDD6xr91jSk1S+N6c=;
        b=r31w9RGhIb+WfPKGXXomdC+KgZ1PB2cXNWMZQa3CLt0GWNoMQfaHdMmx0AwADdmhpQ
         A/COHajKtL6NJryd01B0gFBqH/iR3mzCv4DVQwtmQzAtaFymJehM+YpXMF+PK9mlMjyJ
         izA9oIBNqIX0+RSeo77O3bX4GlPXTn5EtmpXIIDbO36a9Ad4I3hgMCNFsc9X1g1uoYBk
         iYCwpoi7+Q1e8N48QC89yjVe7tWGVUXHzwH4Atx8w3dPKIKspeCP05V/xv0+L76oOyWy
         NCR6SES5fEs1L+s0mgTvIr/bsx4q47Lzwcg1iE//yDldHj/8TcBG+psKEjNrQKyxLamu
         iSpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=zeOzGMyx;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id ay29-20020a05600c1e1d00b003d34dfca178si68944wmb.175.2023.01.04.14.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 14:01:32 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=zeOzGMyx;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8862A3F0C3;
	Wed,  4 Jan 2023 22:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1672869692; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VbGdZk4+EnEWHm/+Ds2v7NcsQYnDD6xr91jSk1S+N6c=;
	b=zeOzGMyxPLTJ/i3B3Qt5r2P7Sh5FO3H+B2p0N2Tzyab8FyI0T3+gaNl4IfssIWMR+fn9CH
	1YKO4LoMVaptmpNJ4Q3BW3dCWI7Ta5xMuSU3+EADCNQaezOp52cBEbM6zw6bbDAPK2Nplf
	J51L04lfPR68KHLKZAtB31dzf8BdBPc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1672869692;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VbGdZk4+EnEWHm/+Ds2v7NcsQYnDD6xr91jSk1S+N6c=;
	b=nDessRNCcC08tHzWAgnYatk5oqO6DeNhdsfPOnGdfl+LPQJQQu1fVaG0j6WcEoHxDyKXn0
	uch6Pd/TEDNibaDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D1A391342C;
	Wed,  4 Jan 2023 22:01:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id uKS+JTn3tWPwJAAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 04 Jan 2023 22:01:29 +0000
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
Subject: [RFC PATCH 16/27] target/arm: only build psci for TCG
Date: Wed,  4 Jan 2023 18:58:24 -0300
Message-Id: <20230104215835.24692-17-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230104215835.24692-1-farosas@suse.de>
References: <20230104215835.24692-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2LUogrd2a5W/

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/meson.build      | 1 -
 target/arm/tcg/meson.build  | 4 ++++
 target/arm/{ => tcg}/psci.c | 0
 3 files changed, 4 insertions(+), 1 deletion(-)
 rename target/arm/{ => tcg}/psci.c (100%)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 0a9fd09b3d..68a87dff0a 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -21,7 +21,6 @@ arm_softmmu_ss.add(files(
   'arm-powerctl.c',
   'machine.c',
   'monitor.c',
-  'psci.c',
   'ptw.c',
 ))
 
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index c27ac2939c..47006f903c 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -44,3 +44,7 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'sme_helper.c',
   'sve_helper.c',
 ))
+
+arm_softmmu_ss.add(files(
+  'psci.c',
+))
diff --git a/target/arm/psci.c b/target/arm/tcg/psci.c
similarity index 100%
rename from target/arm/psci.c
rename to target/arm/tcg/psci.c
-- 
2.35.3
