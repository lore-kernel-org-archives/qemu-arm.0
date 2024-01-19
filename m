Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp880571ejg;
        Fri, 19 Jan 2024 03:41:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHcrSoHVTPYvvrbkgQ2F0wbpN0uxZpzex/+04HFWZIpXe6+C/ElFqvVgqH9CsJCdBRZA0f
X-Received: by 2002:a0c:f203:0:b0:681:99c:8b64 with SMTP id h3-20020a0cf203000000b00681099c8b64mr2253235qvk.21.1705664468686;
        Fri, 19 Jan 2024 03:41:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705664468; cv=none;
        d=google.com; s=arc-20160816;
        b=R+nvlX2Ej+0Ao79eNmmO7Iz0Vk1l1MwSuJ9QchS8f0zCvo4NGXYVx0w13ht2/p2kAI
         9lvKT2fdsaZCsFzFOsgnb3td+pWmVL6EQ0M6XIaXsD5sjVcjJNkOCjzuMGBQdnrDEl5b
         Si5E3ze1QJLIZ5+EFFhwmXbneMAy7LDo+UXyBS37ArYFHQmTS2lByQCypJU9SCpBkAVQ
         vaiF1/HWSJBI1KtxvvC+NSrtJwX1AVfcRjDA2dUyi2cFJ8+KgK2+GGPezXvci8CI+NHu
         xL540A9afSPIoXQe1Q6IlMLxty7pMJZNnzecjuRYHXoqzMw39SxnLv2AOZf+FyiyVzhS
         4bPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wl7mxe76TBuEvV14rO6cbAGreHvKKNVNpG5LWETBxoQ=;
        fh=/0aowDTBust7MhosflTPkHrz6StB6kNrFDkiv8gL7GU=;
        b=ZzlVsKDH8eXIdix+zT51ynBg7OLGTrzOkp9dPv60AGy9jsSdCLEkI+7hgx8ZaRa7ki
         1b2qgfb3UfmGRKT8fKB3Q2FZ3LJjy3WXXWP8NzoLjUgPQcY8V7Uv9zTNCPDmXWVoTb95
         Go/GvGzRrDZkx0+US+DSJ0T4ibKJJ2Vpz7FtyvJH/4M/tiLXjmDUnjGiuKNRPbgUQGDK
         M2DZafNttKNwwDyNPqp3DwsB3c7YmFbREW80xhzeKUXX1H4nB9bGM1jOHVYcv7Bss725
         w278DWDFjZmXiX+QzYRCOLD7O9oNbsaYHEImoUvgxcY6CavZb5+PCbXwOEcavkMGqs8y
         voZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HYyucrNS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b23-20020a0cb3d7000000b0067f69b84b0asi7533913qvf.356.2024.01.19.03.41.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 03:41:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HYyucrNS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rQnBF-0004rP-Ug; Fri, 19 Jan 2024 06:37:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnBE-0004hg-BH
 for qemu-devel@nongnu.org; Fri, 19 Jan 2024 06:37:00 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnBC-0002uI-Bp
 for qemu-devel@nongnu.org; Fri, 19 Jan 2024 06:37:00 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40e86a9fbd9so6782335e9.1
 for <qemu-devel@nongnu.org>; Fri, 19 Jan 2024 03:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664216; x=1706269016; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wl7mxe76TBuEvV14rO6cbAGreHvKKNVNpG5LWETBxoQ=;
 b=HYyucrNSdK1YgB5NhB2yFJ30d1OmQ17aFSAn0mlHcWixhylJ1r7/+7sxml4NC2C2VG
 6YGKY6kMt0xpAN7d5RgzHeYP1md9RC9PoaIHEi7p5wGYo2zQ8X+sVbZeNQ3itXznLVLZ
 LpIa5k76jOsKFQu4qxCmZP++irxEnB+nl8iUY3vf0z7DLpBWCNAKxNPUNcMZIkLovZvB
 goARdhOnR7zG6R+AhfMIajoYAznFWl+fdTHkgd7+1CNLDoSwY/ahXJ5h2b9NHvlqd2cV
 zbd9RfFMFFnPTnjBPjQvvh5jZznanbVEUO64vrBP0fthTl8EnbFnHrSyt0zyHuQCL7b/
 Si1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664216; x=1706269016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wl7mxe76TBuEvV14rO6cbAGreHvKKNVNpG5LWETBxoQ=;
 b=GR/gn6GTUulbM8nyciClOBgL5HdNSrCqlFW/Xq+2QDCLyiKoJwHxff1lAkZ3JQns0J
 foZTTNY34DqGgUAGeAsAEyxyBcUROdr3mERUW1aNIHnFNcHBhStUKRVpzbJ+sMVCG9JJ
 VFKpucgRmrZD8td8jDicHJuYvfAN2UoVXaok+9vGcJbwN2e7S0aNe3xsBhwMfZbVG7ST
 8YkHWgKzVTvxPti8Y8hwG1scrYZdhGuKwO3VjJMrPtw4cPdtbTBEw/o8BBmPNY0z465p
 GhUr57xN4CmeoPJq6WiiH8t1SDmzOOSkqwoGXK0WI9s8KXCWlMKo5NSmy0Wb8+P8zMuD
 VFIg==
X-Gm-Message-State: AOJu0Yy7EtWBfZNaJFYmppD/zJbmtKVsZcHpWE61UvkfYvC0yXKew2lq
 SsSSFLHP4/shZc8SJZnWAyvaZzmRHC+5anjekfwfBspO0+bE55TtKiHeC+m5rb2FLSOm5RUG1Bq
 EyN7Ytg==
X-Received: by 2002:a05:6000:1742:b0:337:bf29:b6ca with SMTP id
 m2-20020a056000174200b00337bf29b6camr1154943wrf.23.1705664216774; 
 Fri, 19 Jan 2024 03:36:56 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 o2-20020a5d4a82000000b00338ca0ada22sm1402247wrq.111.2024.01.19.03.36.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:36:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 24/36] accel: Rename accel_init_ops_interfaces() to include
 'system'
Date: Fri, 19 Jan 2024 12:34:53 +0100
Message-ID: <20240119113507.31951-25-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RiPHqwK3vsiN

accel_init_ops_interfaces() is system specific, so
rename it as accel_system_init_ops_interfaces() to
ease navigating the code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-ID: <20240111120221.35072-2-philmd@linaro.org>
---
 accel/accel-system.h | 2 +-
 accel/accel-system.c | 2 +-
 accel/accel-target.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/accel/accel-system.h b/accel/accel-system.h
index d41c62f21b..2d37c73c97 100644
--- a/accel/accel-system.h
+++ b/accel/accel-system.h
@@ -10,6 +10,6 @@
 #ifndef ACCEL_SYSTEM_H
 #define ACCEL_SYSTEM_H
 
-void accel_init_ops_interfaces(AccelClass *ac);
+void accel_system_init_ops_interfaces(AccelClass *ac);
 
 #endif /* ACCEL_SYSTEM_H */
diff --git a/accel/accel-system.c b/accel/accel-system.c
index fa8f43757c..f6c947dd82 100644
--- a/accel/accel-system.c
+++ b/accel/accel-system.c
@@ -62,7 +62,7 @@ void accel_setup_post(MachineState *ms)
 }
 
 /* initialize the arch-independent accel operation interfaces */
-void accel_init_ops_interfaces(AccelClass *ac)
+void accel_system_init_ops_interfaces(AccelClass *ac)
 {
     const char *ac_name;
     char *ops_name;
diff --git a/accel/accel-target.c b/accel/accel-target.c
index 7e3cbde5df..08626c00c2 100644
--- a/accel/accel-target.c
+++ b/accel/accel-target.c
@@ -104,7 +104,7 @@ static void accel_init_cpu_interfaces(AccelClass *ac)
 void accel_init_interfaces(AccelClass *ac)
 {
 #ifndef CONFIG_USER_ONLY
-    accel_init_ops_interfaces(ac);
+    accel_system_init_ops_interfaces(ac);
 #endif /* !CONFIG_USER_ONLY */
 
     accel_init_cpu_interfaces(ac);
-- 
2.41.0

