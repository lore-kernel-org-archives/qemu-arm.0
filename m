Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2779749njj;
        Mon, 5 May 2025 16:24:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVjhWb2BWzI6IQ7XoBH15EGGzFtBL8QN8GhpGW7AShOTFtfvPIytpjC+Ea5aaL+oCI1gENOSrfztR0ozQ==@linaro.org
X-Received: by 2002:a17:902:e74e:b0:216:3c36:69a7 with SMTP id d9443c01a7336-22e3311ac3cmr16153835ad.45.1746487448587;
        Mon, 05 May 2025 16:24:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487448; cv=none;
        d=google.com; s=arc-20240605;
        b=c/DaCXGSoLSV0/bI3Xc/IFVr1wUOMY2vIWT6ufs3oC7HQn7sdyrUbqvTIRAXLPVItK
         ivS7ez8xvXQzyqGhRRIBFPVfg4ZJfRoBcPn3ZEaGxT+7xS5swgFxQQfqPvYL88znp7Me
         Ikr3FH07Rl20MR+Twc+6Jq4Wbu65JISuyRBZyNubVFjrdXRFOm2cx2MIu5Bk7kD46oPd
         AV9MBaUhAZ4ZshhstsQl2nezedyRN3b3B5/N0lkGANmx28QpNVUCkE+1CQHzKP3W/Adw
         n4CYJPmzdfH7ZriJXgPbF9ZgUuxBA23kvnOP3I3HhwuefdgQBofsU/J7RDo7VddaqldF
         y8uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=F6rvyCptpZZum3a3XLfgy4KbKHlT47oeB0wfjegrLwc=;
        fh=EferPNnSxsUr9/kLevRI4DeMeNBWAN5/yhBuJL8jJwg=;
        b=eOkKc/BGJgIJR9f3tMUbxQyNF9cNA5ZKWw8NkMIQkdXWdTXbK4vTFfOic5DZWAbcAk
         7kLxYBr72NMv6OylyakgvRjDeVTJ5DZxGS0BEAWXaN+1IbzKocuREo7AuK4qgiTNxOzE
         obY+ytgRsGP2gn96isrc+fs1AaS+dmuibsxWyPFa4WACKSFEGPdUdEornQ/Fxi06rh4g
         4+NxpTqGDjZ60Qdt7Jky9iEYZbK0WzQfplfBEcZ1bmfb4btbbLrc7S7KFsiRgXioPqaP
         wUukYPO0MQDO6eAXp6+EqEMOJ2R9NV+ZGT7os0rgI3GWkRlmQR9jhuzf/GydFETbUiov
         3zXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GH5eAuzk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0be82ad9sor86396945ad.15.2025.05.05.16.24.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:24:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GH5eAuzk;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487448; x=1747092248; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6rvyCptpZZum3a3XLfgy4KbKHlT47oeB0wfjegrLwc=;
        b=GH5eAuzkG9r+E8AquHCBdv9IcLnAmLG5ZtcF9nVh0iyym4n42AIHizmfJZsZCCRLDS
         vTW/i8kJqTt3Rx+k5g6O4kSUyhNnMGB/KonoRS/NAIVT6orqLi3EwE/RUCUGSf+ZT1NO
         mJFCjEeRUEhggpswBSnTcGQ5DaMCscwR4DgOImUj7mlRcvdyk7MNKELIVJGrySPT/pB+
         t/iBatU0beKE25z5Uzuk467T9Gs75jzR+UPEsHUIpNEVM4zsvCqr8fY2s7xOb5V5U86U
         3IB7zjvx8Qd1uboRD1DiTIA0hy4A68+M6hWmo9I8JujTjnyXn5RPqKTTKp+oa/1SC9FZ
         ecFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487448; x=1747092248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6rvyCptpZZum3a3XLfgy4KbKHlT47oeB0wfjegrLwc=;
        b=p8jpP+UXIajhCZWCtR6ueC6iqxIWGBeY+soTDFI3K/M1hRZOuV6y+0rYMnp3s73Yo9
         uULfoUZymWIDr+0ox8a64qdE22LNQXVF4M4qq+LnETlaQ+eCavM2A4ucGMvfUrnsiowH
         TYGSjBHR1aXyTGkAkXXqhOqfTDJsKZNTnxEYk1DAMCSLwkvqHZL6Qg8P0mBYRE+f8O9m
         FxTNYGANepUBre560WzCRBP6Nvd77uRpemoWxJtUJzRz4Ba2cLvfBCSUJ2E3iOxoGRaI
         IM+hOd/UxoM4+dehBPJ19yPio2/jKizajKUG/iC4HMOBolcA7tDmNAjnU8v7644rpQ3e
         84mg==
X-Forwarded-Encrypted: i=1; AJvYcCXTQvZ8B7TS1M2Wg6eXMADAH+F/KPAGwsE0MVQRZRjamBPMht+qeIpZE8F5G+y+xsi4Ioj1mexXlLVEmg==@linaro.org
X-Gm-Message-State: AOJu0Yz0TH3b6CXHtQoo8ZDWy1/jgB6vJU5hFbJc72wSTkDruTPfJx2J
	m5wyvLqmMAJhZIHEZGm3a74dvzHKqRZNBs+5i2BcyOOillR5cgfrNKJEl/lcJR5/jg==
X-Gm-Gg: ASbGncs7A9ZYc4qdFVUAXoM4W2c8/1NOFKwDzeRGcjy5POdBK++wJM+YqqrAsqqYtAt
	srGlqPI6XQop7ARNILI9VoZU2rVpJVxJa+wHfe3ucdwSjn2N0/IDCoKgFDTIX8TMYGONoFP5f6H
	CQIcJYTnYMrmxhOjN9RhEefHRk8JIzJRAkHV8Bm7KKnb+CFoYGZqKqdp7oJsWvoZy1RC5yD49Om
	3BzCCxJNlf5l/HyNozF7thA5GxYb1CsxPvxyrX+fsO3WKEoTXxdLJI3yk+BhmQKUUpXUVNvrPh7
	BQTy3tQWA6AYOJa83jD3y7Jk7nbSfeDXouTazJx5
X-Google-Smtp-Source: AGHT+IE4m0x6yn3Dhs8eTavS88cR0qWGl83trW3I/6iVUauH6UbtpdaA/Q0wYvVh89mav8zm9Mw0kQ==
X-Received: by 2002:a17:903:124b:b0:21f:1202:f2f5 with SMTP id d9443c01a7336-22e328a2987mr12958275ad.8.1746487448131;
        Mon, 05 May 2025 16:24:08 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e16348edasm58705265ad.28.2025.05.05.16.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:24:07 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 40/50] target/arm/machine: compile file once (system)
Date: Mon,  5 May 2025 16:20:05 -0700
Message-ID: <20250505232015.130990-41-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: J3jxOt5DidtA

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index bb1c09676d5..b404fa54863 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -13,7 +13,6 @@ arm_system_ss = ss.source_set()
 arm_common_system_ss = ss.source_set()
 arm_system_ss.add(files(
   'arm-qmp-cmds.c',
-  'machine.c',
 ))
 arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'))
 arm_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
@@ -39,6 +38,7 @@ arm_common_system_ss.add(files(
   'cortex-regs.c',
   'debug_helper.c',
   'helper.c',
+  'machine.c',
   'ptw.c',
   'vfp_fpscr.c',
 ))
-- 
2.47.2
