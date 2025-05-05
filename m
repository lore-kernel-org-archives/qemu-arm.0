Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778323njj;
        Mon, 5 May 2025 16:20:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWq4wFIOLBpnd5T+YfYjqNPOuZpR7Od6UMasozjQ2/KYXMgCq6xXZEe4d1MWrAcKqz/hYghu55CTVmueg==@linaro.org
X-Received: by 2002:a17:902:ce0b:b0:215:8809:b3b7 with SMTP id d9443c01a7336-22e328b44d0mr15847545ad.7.1746487245798;
        Mon, 05 May 2025 16:20:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487245; cv=none;
        d=google.com; s=arc-20240605;
        b=SKnwShykYra9hrE9+R/BA5vn94IzlmVWmVXs9aKdubJH8LBJcfstXd01VVTAy0gGuV
         JQAVUdxjQ5ESiruE4Aopc53N5LrHs0qtaxPyddOXcFQddOdrlEIeZobdDuJX/6Rwl60w
         RwQ91Txo7QbSAHVzaW85Ucc3PYHasH9gWgQGLmd4WVTLvVRhPYf6IhEEUpkQH/1bhC7E
         gsa33am0shiUk70nhVFXbYXZ+txaUX0DPb9QiaSd9MZaVVlYWKullkEk+wwM8MLvaPfd
         LPi0ZWQY3cQjker2i89xhr266CYQgyG9G0Pf0LRTNptfR6B55zMqtHsPDNqg9fRSSEjq
         0WfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=j3Dpv/gYklKxQ6NcaNjklM8os0pkN4N34WBJsdRDY08=;
        fh=jiJFNgLVIGqRWPrJE7Wtq+NDe0gxzhDsVBVemGggwCw=;
        b=FuJyUUqZxDTviQYHvHvJHtvK4N466TqKxN7Yf7dmJMt2dszLGIY9Tq2qwPnvxWv91A
         jxYzHVOOvwbRcJ+tRtSOfkND1+JuU/+pHqUlWwXQWPze/wFgKsXNJSgY5DvqOp0JRK3i
         ikMsUkdzTj2RndEhVXcNhtvdxxQxYBkcr7WdsRwGRSwGyM7br7j4ylu5GjQqehuCZ7VA
         C+2dL/FXA1v68M9pHPwf05B+NwNzbc4/9QY8Nb7eLRAy/Dqeo6SWUpYwhfl2s/N6g1CW
         FUcEvdMHmVjyrrRvXxvhoxd7QDrllM60oDL/GlQjUHIsexsmpnzSqoyQ6Si1o3x4xX+F
         lgcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hAUn/BgM";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bc6e473sor60748355ad.11.2025.05.05.16.20.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hAUn/BgM";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487245; x=1747092045; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3Dpv/gYklKxQ6NcaNjklM8os0pkN4N34WBJsdRDY08=;
        b=hAUn/BgMAvQdxVozr0gJkkq0bINY69yHBWBLwW1qRl9CDV38vsw/xQD1QLQc/s2I/k
         cM7v2MMTsrcVpv0O9SRfbSjMEhZEpDU4AphCpO6VVcF2tBLOZoX6YilzM0yMroKG3xhp
         Eir6aEkFLlOr2qsGg5OG1Jlr3DJujvUp4ooLLOIfvZI2pmQL6xysvF81t/dvcSRlcZM8
         JwOwoA/6JhhvqabJCwVffSc8mnZaCXYM8wRFIj3FrmUuK2Cuajj4s+DjHpCOB7EId6p0
         KVElKuZDEPk/Z3mQBZrsKtv9M9goQI/ZpskGnp0kVQ+RTbAGylx1qejjkJawgdrDJpiO
         0xIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487245; x=1747092045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3Dpv/gYklKxQ6NcaNjklM8os0pkN4N34WBJsdRDY08=;
        b=eMel7YLwSQyLRbTEj5je8Cfz4lF4QwM1jOssQqVrUj1mceRzJB/fSJ2DOeHG+Mrw0h
         hEOQlsTjzdF/158ViGFynW2AH9qYMFYKesZh44Y4d+1+jCTy6XyBRuC+DaUlHD3Zlznt
         hstrPXu5QSbohREXpcUHNltFzmaML7nBfyRTrnon0Pr8onDjRJfh0zDuRCfGFfALRwGm
         v3hH/dbg6e/6tSrwcnLEM4G73oEJGkLGYNZqVp0LYiWyvqtXPjT2HnQM+xLhOACyHhts
         W3gsTIWgDNZCKjKhC22eGUJ8OeJLAVXZnHMUkRXKtKmNklStLsvFi1xt1to8HkV/iQFk
         KD+w==
X-Forwarded-Encrypted: i=1; AJvYcCU4du9FnqVIUJWsBfY+BMAIpxHUUJopPsyB04+2VbXTHAaYOkkpZ/8p6If+WUJvQ9t41NAr51QlAxnfUA==@linaro.org
X-Gm-Message-State: AOJu0Yyh4c2//VIDbZjpN/zgwku5ddoyNyyQw15u4V47GNsh8CW0b2oN
	/YADIcJeyrvnQMl/RA5/d0xIlBQDE0JmrLwxwIZcJCJCWzkiAK6kfltrTgGHXRSiAQ==
X-Gm-Gg: ASbGnctzVSiQlv12vhgiEqUkoILqwtK5btgAD0KF81/yKFm8p5khU5WPZOvudRmGStn
	yeGgMGjlIZmbcqZeGjCsYbRpw2AvLHqbDvEJyBoJqylsWcpAadkwhYiC8zwKGG130xtcLEW/UE1
	lFN8Q+D9O7gf/l+39TYPA/bpTeUh/3oCTA6SYlvWgyxToczkDj5uNoj1fWQsu0GHO2ZPpogwc6Y
	M5RYeoAY8jZ7+cF4bjMUI3xW+C9prHcuZvTD10RFu0kYR/yka57VXwZcyY1VaOp2qQcWB6frS0G
	v3EsMVxwn6XfBSpvEFE+mz8tVxr9CrMJOyyOGmOWR22RAljNvl8=
X-Google-Smtp-Source: AGHT+IFWk5AXwcjBNUYuo0qo4bKVRD9ScvDTBj0++wYSaqbR7Xj3yAofodCIxA1kzM4MSYlJ50aRUA==
X-Received: by 2002:a17:902:db0e:b0:224:1c95:451e with SMTP id d9443c01a7336-22e32eff604mr17816945ad.33.1746487245422;
        Mon, 05 May 2025 16:20:45 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:45 -0700 (PDT)
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
Subject: [PATCH v6 28/50] target/arm/arch_dump: compile file once (system)
Date: Mon,  5 May 2025 16:19:53 -0700
Message-ID: <20250505232015.130990-29-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 4JrviyZz3lyP

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 06d479570e2..95a2b077dd6 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -15,7 +15,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
 arm_system_ss = ss.source_set()
 arm_common_system_ss = ss.source_set()
 arm_system_ss.add(files(
-  'arch_dump.c',
   'arm-powerctl.c',
   'arm-qmp-cmds.c',
   'cortex-regs.c',
@@ -38,6 +37,7 @@ arm_common_system_ss.add(files('cpu.c'), capstone)
 arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
 arm_common_system_ss.add(files(
+  'arch_dump.c',
   'debug_helper.c',
   'helper.c',
   'vfp_fpscr.c',
-- 
2.47.2
