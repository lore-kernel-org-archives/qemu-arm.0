Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1913979lfg;
        Mon, 23 Aug 2021 07:20:34 -0700 (PDT)
X-Received: by 2002:a17:90a:b00e:: with SMTP id x14mr13321836pjq.155.1629728434567;
        Mon, 23 Aug 2021 07:20:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629728434; cv=none;
        d=google.com; s=arc-20160816;
        b=FopsFWxKzKDp/scRP2dD/TxZh/xK3mh0F/Y/rcKBMcW+syQdHFW1bl/QFprsTMc4Yh
         YLXUN1Tgs9+DJ0+5j7plKIVoNdLBta5mVna6yz4ZnU42j6dCbfsT/HcwSyLnL84ofiVm
         6CvXeGFvymoqwEXhsNZiyq4NNSRzJAr381E6l3D/LrCgeq4o+n5LTqY84jDjWGMFcTky
         sn0mHfOxE4kkBV4RTHm5efv9zWHuvI9mBRIUeNKS2/x88LWi+u579F1C0rt6tnczXaKA
         +JmEDlvkq+NJ/NkhlPJm0/1wT6KnqeQYz+O0dmCgzRLu0BOK0Opw7xggtdGO7IJc1ZnM
         2CNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ggCfymzLYMC+amAfxrR2+TolBGW7f52SX4zTVW4/JcY=;
        b=kAwNIC8t+f2sjuUuJPyNmcY1Pt3fZdd2DACjz3ecoKFmYkWn0WG0FwhAQ9K5JHOIG/
         tp1WlvlajLKeDZR7wEwoMo8NlUqNGl0tSBmlvBJZVzUVPIFJ2LctlsGgGerfxwoRi32q
         Jm+O6uq/dAsr00eblo3DqWnB216eaGMXDbDSJFdgjhIQHAuqAFgs+J2ragWqrCVLRcBV
         2z7BvHa5UHGWEe5LFjDZSPMirdXP1OB0WqFlgFpY8aXLvcFTx/vv+/ZNpqE+ZYH1tQQ3
         mJxJX4pa7iEMv0/w6aEnPaHXA2O1HKNWv+DvyxgUCkXJKyA+aIhGprGgleHaGYTUYWX3
         TjLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=j6xdwYSG;
       spf=pass (google.com: domain of changbin.du@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=changbin.du@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <changbin.du@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m4sor7280129pjo.28.2021.08.23.07.20.34
        (Google Transport Security);
        Mon, 23 Aug 2021 07:20:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of changbin.du@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=j6xdwYSG;
       spf=pass (google.com: domain of changbin.du@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=changbin.du@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ggCfymzLYMC+amAfxrR2+TolBGW7f52SX4zTVW4/JcY=;
        b=j6xdwYSGYiOIlvlZpTRsXOPQLtkGoyib6HeQtyzMHh7bIasr0393bjLgQX+geIdeIW
         zBhsmBTjT95FozMCNRRLJ27sAvEOqEfMcu/wDfL/O8cTDCQ+EOgMO4rkzPrXqgSA8moW
         cV10Ej6YXk1x5Q1BR/dOAgRNRo01O1U1uGI5PouZrzcBU3O4lXOz+1Bbx5n9gir8IJ2b
         VlGlEgxTw6EojLSQfpOp1R9uYB9VF48KtEI9A3NQ5yiPgZdEiPauzT7PE6cx5f8keOjF
         nFBEQ9b+m6JP0mz3jjeIpm0NioXm0M0KiPM+2+UEzgGbN1FnPpW/f/++LlPgfkRwOWAq
         vsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ggCfymzLYMC+amAfxrR2+TolBGW7f52SX4zTVW4/JcY=;
        b=IRa0cLvXB/sPQsvw+k+cKiJXkGx9tQ9C4wi+wJ6XkT8ZNQBeDneiSxM90/+DqbxVsN
         VLWEzdc+LfxD7oylv8E8MXna4+2RfGY4vFFTaeGF1txpckLyoc/ssCmQ36PTzIMgPvu6
         WoVQB3BOTM15iUlqWEGI9ugzO9als9KHx4OuiTEeMGpzTnsWNyeMpVH5Ri2HGAcqNo1m
         WQ/alqa++Of/hmkZpAD+SyYSiJ+LoSb1W7uxoJEaEuiPD673P17UMsDUJ2lLA/xB9bAR
         itQQz3ya6OnH51r7RxirIs5ykI4OZH3B+3GojlLFe5R8putjJZDZDN/lDMUEeDGy4L1p
         3VeA==
X-Gm-Message-State: AOAM530g+bARNoK6FYX4Ke8Ma+aDo0pHFl5PYVpjYFnB6cbhc0IZhqxE
	QzxsLjnQpUu5Esj/8tt2F35DNp1VwZry3g==
X-Google-Smtp-Source: ABdhPJwaKrCbvAnJLvM2QLSibM/8zqOO4VdGgNvgucOMhB6ZJ7f6UVHyQ7uPlRiwJWesgixMI/Idsw==
X-Received: by 2002:a17:90a:9318:: with SMTP id p24mr19881423pjo.138.1629728433965;
        Mon, 23 Aug 2021 07:20:33 -0700 (PDT)
Return-Path: <changbin.du@gmail.com>
Received: from WRT-WX9.. ([141.164.41.4])
        by smtp.gmail.com with ESMTPSA id ev12sm4700796pjb.57.2021.08.23.07.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 07:20:33 -0700 (PDT)
From: Changbin Du <changbin.du@gmail.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	Changbin Du <changbin.du@gmail.com>
Subject: [PATCH 2/3] arm: gdbstub: add support for switchable endianness
Date: Mon, 23 Aug 2021 22:20:03 +0800
Message-Id: <20210823142004.17935-3-changbin.du@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210823142004.17935-1-changbin.du@gmail.com>
References: <20210823142004.17935-1-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: O0uVAyesHaGZ

Apply new gdbstub interfaces we added previously to support both little
and big endian guest debugging for ARM. And enable the
TARGET_SWICHABLE_ENDIANNESS option.

Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 configs/targets/aarch64-softmmu.mak | 1 +
 configs/targets/arm-softmmu.mak     | 1 +
 target/arm/gdbstub.c                | 2 +-
 target/arm/gdbstub64.c              | 2 +-
 4 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/configs/targets/aarch64-softmmu.mak b/configs/targets/aarch64-softmmu.mak
index 7703127674..14e7f166a7 100644
--- a/configs/targets/aarch64-softmmu.mak
+++ b/configs/targets/aarch64-softmmu.mak
@@ -3,3 +3,4 @@ TARGET_BASE_ARCH=arm
 TARGET_SUPPORTS_MTTCG=y
 TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
 TARGET_NEED_FDT=y
+TARGET_SWICHABLE_ENDIANNESS=y
diff --git a/configs/targets/arm-softmmu.mak b/configs/targets/arm-softmmu.mak
index 84a98f4818..5f40e858f9 100644
--- a/configs/targets/arm-softmmu.mak
+++ b/configs/targets/arm-softmmu.mak
@@ -2,3 +2,4 @@ TARGET_ARCH=arm
 TARGET_SUPPORTS_MTTCG=y
 TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
 TARGET_NEED_FDT=y
+TARGET_SWICHABLE_ENDIANNESS=y
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 826601b341..188e82d938 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -74,7 +74,7 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     CPUARMState *env = &cpu->env;
     uint32_t tmp;
 
-    tmp = ldl_p(mem_buf);
+    tmp = gdb_read_reg32(mem_buf);
 
     /* Mask out low bit of PC to workaround gdb bugs.  This will probably
        cause problems if we ever implement the Jazelle DBX extensions.  */
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 251539ef79..5358ad31b4 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -47,7 +47,7 @@ int aarch64_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     CPUARMState *env = &cpu->env;
     uint64_t tmp;
 
-    tmp = ldq_p(mem_buf);
+    tmp = gdb_read_reg64(mem_buf);
 
     if (n < 31) {
         /* Core integer register.  */
-- 
2.32.0
