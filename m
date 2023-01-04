Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8305726ejb;
        Wed, 4 Jan 2023 14:01:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvW5Xooumf32gdS4dyg1D6X08E40QTHvjjSK96n8o9+K3UHbSgHbbNv0I4n5tHAay40toW7
X-Received: by 2002:adf:f4c5:0:b0:291:3f93:b7d1 with SMTP id h5-20020adff4c5000000b002913f93b7d1mr12115374wrp.64.1672869680535;
        Wed, 04 Jan 2023 14:01:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672869680; cv=none;
        d=google.com; s=arc-20160816;
        b=b/zJTmaNPWeGMMKab0eO6fYYc9b0GW99AzJYNjvEswwutaX8sLuf9ao226ErOQVbc1
         hepu9hxPuAr6PFM/yJ+sR2HgdoKuF6bcflYauN0soPghQfhENtDQNisLtuhTSV0OsISr
         w/Jklp3uv71WTtQRE1DSUAvJrX2AGypnHPpQLqUgzZRpjU52si8Y8Up5tC8tzFy8Epxk
         j6LkTIpK5ksgdx3sFM3qG9ZFvZImu2g4rtidik62qwUmvIwgrWyl4y5kAzRwPuZoiDiz
         966EmrxTZThW7shFIOOR3t322N7WY0HoJfY7BsFc3nbu+O/UiqV5Gipr9CqyvNeQ4MBF
         FJbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=EeLIRVUeh2Pt5Zg9ehzMatpAATK0dyNysxyXF1CFvdY=;
        b=yoNPXLLye1Y0csSu+kCawFcfs/XerSKi2Ok8avmReY6K/y0PFFhRKnTFVHyVxBLakD
         jFCkEID8ggZDP6F3LVVrpnHQdRKxOS0N/LxIeBTVR9HKDk0xHpbkci165N9hgbtFJnBq
         P0H9Aiq7ck2IrdF+CSXxxCLmLquaWt9PGBK34OUi/UjlZCdSBx04lOmIzQwo2kO6y+Kt
         EPXS+Um8Bn9mNSOrG4PfYhQccImS7/ndcTdlrs4p6Vt4qcuxH3ZH09LJ/vSDPhWlK3VM
         B99uaAaugu5yEKxYHT2OMit9Ks6X5pH9dtvUWgjg7qsOllG9BIViXc63UUDboRCI6/Qq
         K/4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=knlF2Hta;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id i11-20020a0560001acb00b0024214d06657si25635304wry.885.2023.01.04.14.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 14:01:20 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=knlF2Hta;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 06D213E8AF;
	Wed,  4 Jan 2023 22:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1672869680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EeLIRVUeh2Pt5Zg9ehzMatpAATK0dyNysxyXF1CFvdY=;
	b=knlF2HtaSFXl2nJZcEl41lrH8e/xDvtai2b/IENg61vnrnQasQQMoz7YGj1k/nfqlSeBgy
	bVaVCMo9ac02tMrMpsEMEQEgRS2+qfSFT4G6mR3UtMJdmZ9MBS2MAxB8N8bUDcQatG0uIe
	S4gbjaMDT9UmTSeKaOT0zV7wld4aruA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1672869680;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EeLIRVUeh2Pt5Zg9ehzMatpAATK0dyNysxyXF1CFvdY=;
	b=clcLW1HvjPVJUvHLX77HuUUjDzMG99rlX+PhRfpcbcTHls+ZcGjJX55CQpGMgc/0xamSGP
	azHv3HB/B1gS9gDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 57D851342C;
	Wed,  4 Jan 2023 22:01:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id YAJKCC33tWPwJAAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 04 Jan 2023 22:01:17 +0000
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
Subject: [RFC PATCH 12/27] target/arm: Add tcg/meson.build
Date: Wed,  4 Jan 2023 18:58:20 -0300
Message-Id: <20230104215835.24692-13-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230104215835.24692-1-farosas@suse.de>
References: <20230104215835.24692-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: dr7wL8w2JTHP

This introduces the target/arm/tcg directory. Its purpose is to hold
the TCG code that is selected by CONFIG_TCG.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
We could squash this onto the next one perhaps.
---
 MAINTAINERS                | 1 +
 target/arm/meson.build     | 4 ++++
 target/arm/tcg/meson.build | 0
 3 files changed, 5 insertions(+)
 create mode 100644 target/arm/tcg/meson.build

diff --git a/MAINTAINERS b/MAINTAINERS
index 7a40d4d865..50ccb74593 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -159,6 +159,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: target/arm/
+F: target/arm/tcg/
 F: tests/tcg/arm/
 F: tests/tcg/aarch64/
 F: tests/qtest/arm-cpu-features.c
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 87e911b27f..3225dbd693 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -67,5 +67,9 @@ arm_softmmu_ss.add(files(
 
 subdir('hvf')
 
+if 'CONFIG_TCG' in config_all
+   subdir('tcg')
+endif
+
 target_arch += {'arm': arm_ss}
 target_softmmu_arch += {'arm': arm_softmmu_ss}
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
new file mode 100644
index 0000000000..e69de29bb2
-- 
2.35.3
