Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp865702ejo;
        Tue, 12 Dec 2023 04:36:35 -0800 (PST)
X-Received: by 2002:a17:906:25d:b0:a1f:919d:dee3 with SMTP id 29-20020a170906025d00b00a1f919ddee3mr2526136ejl.129.1702384595007;
        Tue, 12 Dec 2023 04:36:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702384594; cv=none;
        d=google.com; s=arc-20160816;
        b=OEf4VONTElFhuJaMAKu5fmkinncZNFHuggnQ3Cjim+qnmaaY/FLu/7dECnDX7Zygr9
         xlBFz8NJ1hPRGZzZ0eXGNJv2cqm9Kg0rUuC3IMI1Hy8+9h3E537r5jKgk+JHSwC0LDCr
         Y1LpPUVweyNF5YhtcNFZCvjTvbSmzhu4rzG5Nmy4z1TUX3wy2IuX6nu6xlghKXe/onYT
         wTDxc0aqVv4CCCFgmfe/2g29O1RtVyoq9LZtDo5gNdudhKpvO0DK1Bx8nwhJm+OiBVHI
         nAk3S1sg5F8BNBj5pFe4EAnike7n594ILadolWJOka2R5b+KFsfWAfczgUq+gWtBhAsM
         aJhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=UFHPuaJlGIZrE/w+wBk6CARRnPU80SYEtnM2ju+CrtY=;
        fh=jUXvrctdLNvPTPf8EqilWtRTPbB+utYg2FT0iF33S44=;
        b=LLogCyDwv5ByOEoq5Er4kwjEwh0nGM1mu57IF/PbemJ2M3gjOjztb8ODD/VhPEyOms
         60Zm2aakhWMlgGo8OTRToj8qTcf3rk19aaRAphEUpmRZEtF0VHGcobtCiQsII2RLqhJ+
         G2d3SXj0Gnpi2aNSxFHrQFiBbhh1ZRPTbOgvKw1s/gfFqjAZVsj1qZQHebwk15hVWzc1
         5VC1+bZHCFsWGWUEVm8Yymx8O0N8/F+CrLnVuakrbtm3FOQa8uLpYw132O3qwnpbso8z
         20+vY+tnRsD6lHjCWlw6ixCghrTbdO7qAL+oO5MJ8BYrQDwwbPXIJfcNzXMyIwUDWQH2
         UF+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ZUbjViZ/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h16-20020a1709070b1000b00a1d4883f167sor2350205ejl.13.2023.12.12.04.36.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 04:36:34 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ZUbjViZ/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702384594; x=1702989394; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFHPuaJlGIZrE/w+wBk6CARRnPU80SYEtnM2ju+CrtY=;
        b=ZUbjViZ/29JioqQH9DjDZofBiQhcmBaWnMEQZY39RPKWXf9XodpNZPLbSgpD9xr8Jo
         brQIcmMp1Pj7OBJfwJQYMf+tsBroV46jAoBwRD595TLBHl+vC4dH4l9CaBa1QeFA5UUE
         JwG2QKFULxG8fek/EmAURj0SwfRYdmUveU2y5RlRTCLUj5BW5DoIRcvCiv5w3TLcTCaY
         ca3ORDruceY8GNvLAJXvZ4igSmNcnIco8nVs/dE2TiXPQhTxd6y0LpibH3Y9Fo4SJxGq
         zS1sxTT8DfiWZxKiCTs4R5mS5ahZ8zNgK/NHG1TCL+2qKWiuqPGArENk063pbY2thbDH
         AN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702384594; x=1702989394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UFHPuaJlGIZrE/w+wBk6CARRnPU80SYEtnM2ju+CrtY=;
        b=lxOQ3aCGu5h4KKdYVPJS+kzytRU4m4oCNq7es5+lmZ/omoS1PTXqNxjlKuMTRsklaO
         HZ5ubm+TqsCavqTaBNX6P8iJ9LQM1ySy3aQDmvCnKg2QQ00eYX30W+O0ibxpoPVUEh+f
         XM2RF8CO8OZvOeQ8hhaxgOyPt0LszLB6FBsGpbxiVOWn+qIk2XcXm/oSpWL7QJ4J6LL5
         AUpK9hwh+dByQ6FVRNLWRmUXWgZTHgr5c0C6jyt7Q8S1JcGWPqwBsEzyrXtEXqDjX7fZ
         t73kHuZnVOK70T0a37D5HGKkdps+OicjBQj2hRQwRTIaATKcNJKsDbRtjFA4OgJMxpFr
         mrGQ==
X-Gm-Message-State: AOJu0YxanHYWMSQf/nJfaUBvwOiGJnTEsg0OPxDU4e9wbq7GT6E1c2Fi
	ja5NM+omd7DRnzFmeeZntbT9eR/B
X-Google-Smtp-Source: AGHT+IGNAmk6pXo2b3cLPD4XysG56TpqFrfp7UlChY4rorxaBCoksAKV4l1tnnkqqSdoViFdZ/pQhg==
X-Received: by 2002:a17:906:44a:b0:a1b:86e5:4e1 with SMTP id e10-20020a170906044a00b00a1b86e504e1mr3066964eja.108.1702384594559;
        Tue, 12 Dec 2023 04:36:34 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id ll9-20020a170907190900b00a1cbb289a7csm6155242ejc.183.2023.12.12.04.36.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 04:36:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-riscv@nongnu.org,
	Brian Cain <bcain@quicinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	Warner Losh <imp@bsdimp.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Kyle Evans <kevans@freebsd.org>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 21/23] exec/cpu-all: Restrict inclusion of 'exec/user/guest-base.h'
Date: Tue, 12 Dec 2023 13:33:57 +0100
Message-ID: <20231212123401.37493-22-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: vgQupYXvFmrS

Declare 'have_guest_base' in "exec/user/guest-base.h".
Very few files require this header, so explicitly include
it there instead of "exec/cpu-all.h" which is used in many
source files.
Assert this user-specific header is only included from user
emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h         | 3 ---
 include/exec/cpu_ldst.h        | 2 ++
 include/exec/user/guest-base.h | 6 ++++++
 bsd-user/main.c                | 1 +
 linux-user/elfload.c           | 1 +
 linux-user/main.c              | 1 +
 6 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 95af418920..d2ddfae286 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -65,9 +65,6 @@
 
 #if defined(CONFIG_USER_ONLY)
 #include "exec/user/abitypes.h"
-#include "exec/user/guest-base.h"
-
-extern bool have_guest_base;
 
 /*
  * If non-zero, the guest virtual address space is a contiguous subset
diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 64e0319996..e039cc7f80 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -69,6 +69,8 @@
 
 #if defined(CONFIG_USER_ONLY)
 
+#include "exec/user/guest-base.h"
+
 #ifndef TARGET_TAGGED_ADDRESSES
 static inline abi_ptr cpu_untagged_addr(CPUState *cs, abi_ptr x)
 {
diff --git a/include/exec/user/guest-base.h b/include/exec/user/guest-base.h
index afe2ab7fbb..cf40151360 100644
--- a/include/exec/user/guest-base.h
+++ b/include/exec/user/guest-base.h
@@ -7,6 +7,12 @@
 #ifndef EXEC_USER_GUEST_BASE_H
 #define EXEC_USER_GUEST_BASE_H
 
+#ifndef CONFIG_USER_ONLY
+#error Cannot include this header from system emulation
+#endif
+
 extern uintptr_t guest_base;
 
+extern bool have_guest_base;
+
 #endif
diff --git a/bsd-user/main.c b/bsd-user/main.c
index e6014f517e..c331d727e1 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -36,6 +36,7 @@
 #include "qemu/help_option.h"
 #include "qemu/module.h"
 #include "exec/exec-all.h"
+#include "exec/user/guest-base.h"
 #include "tcg/startup.h"
 #include "qemu/timer.h"
 #include "qemu/envlist.h"
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index debea5c355..a8c106ec0c 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -7,6 +7,7 @@
 
 #include "qemu.h"
 #include "exec/user/tswap-target.h"
+#include "exec/user/guest-base.h"
 #include "user-internals.h"
 #include "signal-common.h"
 #include "loader.h"
diff --git a/linux-user/main.c b/linux-user/main.c
index 0cdaf30d34..84691d707b 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -38,6 +38,7 @@
 #include "qemu/help_option.h"
 #include "qemu/module.h"
 #include "qemu/plugin.h"
+#include "exec/user/guest-base.h"
 #include "exec/exec-all.h"
 #include "exec/gdbstub.h"
 #include "gdbstub/user.h"
-- 
2.41.0
