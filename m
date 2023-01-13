Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp414402ejc;
        Fri, 13 Jan 2023 06:07:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt8L5RE69zU+43ZxYy6FBI4Uh4VFUHm63FoFxlkbIY3eRf39P32EC9/m9C/gMSCvsY5y1Hb
X-Received: by 2002:a5d:624f:0:b0:24d:12ce:2dca with SMTP id m15-20020a5d624f000000b0024d12ce2dcamr52851680wrv.53.1673618820521;
        Fri, 13 Jan 2023 06:07:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673618820; cv=none;
        d=google.com; s=arc-20160816;
        b=ENyFqZQMKtm5sZXPO42W4YdMowCnGz1z+3G5BoZ6o+JOhajh1KyyeamrjIS9Z1jN6K
         o4YTbrl1+LACux750COtHlrdtAM07tuhmAWZH3hg74lVt8h2iDmw8csuUiHlN1YnxDDL
         P4mEKGiKZjHmsWxbrSKVTQhPKumg/SHQP2hA6Tfeq6lBjDgnStk3plv/jbkJdLZ9AY19
         oMADvr6ps92ttwW2jBE/EZs9lHV2dzlxzlCVB9q52GO8lM2TIgnA1pOtfrmlmIuDrHEi
         aWbGzmhm9dqHPITJinKUCvMVoibrKtbrbDMosAN0FiDWLDt+AntYGNo8kkfbFA/Pnpws
         Dr6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=2bZNRFBZ+XzBgzjYJl5VTmOByJ6GMFubKN5YaXKn3TM=;
        b=m03mW4U5XDAd5UeAMRS8nVfzocZZVRrF8ISFfLzLravJGree0W78P1CbADdU9trxL9
         aNc7EYvYudFzVpYChp3DaH9PUl5VI+4n9e5VSB1PhMv1tacjyFQ2AZCx2TvCs0OsPwLO
         0b12wQWatyqXPQJtyzg/7Kiov7+cDXCdJYzhj/IJHSt/jjQ5TqdXp1rFjYa0zeWsN7HM
         RxxKopduHRO/fEdBKDf3D6/SNTQTmvwLxhS+EM7nq6E/5zJvXHvtIdAYCcLRHykltGiO
         6d7pvtNmareeTYmtS69/YLVs2BAxgCbT9dWPfFzY6uz+o28rJM2LO0ugNbmmtYp+SR5g
         q2Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=DyZT4kBk;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=uBBavFlo;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id cl4-20020a5d5f04000000b002bdd1b83fcfsi4370365wrb.575.2023.01.13.06.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:07:00 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=DyZT4kBk;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=uBBavFlo;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F003B60313;
	Fri, 13 Jan 2023 14:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673618819; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bZNRFBZ+XzBgzjYJl5VTmOByJ6GMFubKN5YaXKn3TM=;
	b=DyZT4kBk1NRttRDXENVEgUmLcf/mLmr2M/AR1U8/NzCiApUWPRqS7hpGGXSyg/SMYilLQz
	kQaWExK+EfeF9fslmQLgvIKyz0avR84cXvGCh5r3FhdZnRjmhaRjIT/LUla5a43lC8MGl3
	e28oUiwR5sJEKoG/0Z93/6jzaG4RLgI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673618819;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bZNRFBZ+XzBgzjYJl5VTmOByJ6GMFubKN5YaXKn3TM=;
	b=uBBavFloHsUWwlFdnaxCG0iMx9VNl+kopYdiudSr6JkZ3UIcp8XjK0l51YMf3bSrw9asaW
	+wCdX0r+5wRBt9DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5A8CC1358A;
	Fri, 13 Jan 2023 14:06:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id wLViCYFlwWP8DQAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 13 Jan 2023 14:06:57 +0000
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
Subject: [RFC PATCH v3 11/28] target/arm: Move psci.c into the tcg directory
Date: Fri, 13 Jan 2023 11:04:02 -0300
Message-Id: <20230113140419.4013-12-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230113140419.4013-1-farosas@suse.de>
References: <20230113140419.4013-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: iaF1V9/fckda

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/meson.build      | 1 -
 target/arm/tcg/meson.build  | 4 ++++
 target/arm/{ => tcg}/psci.c | 0
 3 files changed, 4 insertions(+), 1 deletion(-)
 rename target/arm/{ => tcg}/psci.c (100%)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 01143a805c..595d22a099 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -22,7 +22,6 @@ arm_softmmu_ss.add(files(
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
