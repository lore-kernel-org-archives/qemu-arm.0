Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp5086885njd;
        Fri, 4 Apr 2025 15:35:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXTHDeYqc7QQ5hP6yME4aIjAHgH17pE1pT9R9YCBEMOt1VqsxuAoqb35KjCb4jfeO/3mrNTneH5ZmLRuQ==@linaro.org
X-Received: by 2002:a05:600c:4e09:b0:43c:eeee:b706 with SMTP id 5b1f17b1804b1-43ecf9fe6d2mr48179155e9.24.1743806140876;
        Fri, 04 Apr 2025 15:35:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743806140; cv=none;
        d=google.com; s=arc-20240605;
        b=lAefT0DZ3lB4nk91lhcTBhWb7QtseS5j/V9NUgSog6AA0zCk/eeCtkCR8pstwVLDjD
         vt8oA5M5wSStEUc9Pydw3jpO2V2aVOQUweklqqepLbFq9GPLQmMhLhpOwa51Ew3f4pOI
         odjtaWMEYry5NmrwfZ5tS3CZbFxu66ssuJ3sGJ7q3ARngW40lCUS1IUYncYsE4Kgk7D5
         lGD6UDbdrFgFnN50zibUa1FsWk6O5HjbV+oUrh6MPFTnqgpkg59X7+rqqB/u+WNsX5ie
         YAz3Mq7ZOJV2apwCTnqSWjZZIL7F7W2yKCZBqiYgKnbkvXAqeswr2zOqbg9H81cCIQvc
         JRUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7aHt9/+1RoqryMMLez5mxrSk/pFneV/cWior93LSBnc=;
        fh=qfpd4xjX0C05IbxebuTGOmXJVzqGQsAbWBwoXClNP8s=;
        b=d2U2jY32IX53znZsDFQDZ6ESWNlIXrkfTD300Edhw7gDIepbDyiIDJiOS9jxX6OBko
         CGdlZHpFRXyvK2Rp3gCTcMjiKT65y9jyU8Xgmv3U+W8bb7zx7pHbugCLx5IE0UvUB+kg
         GU4GJxuwWmnnPj8IsnmhIKSIMWj5qeDci1Ujt56aGsgRXGUztSB5Un5XG9KlpQ0DcPxy
         S6zDXvuv3t6bKokVo8SjfLR4WOa4bF3PB+2UPc0ydW7RPYCohUi3SgOAw0J9tvpmzKhF
         G/PlxD+qlJnRrz11vcEwbjugPeJbvoC6NGQVNfPZKX+I8vIzO3hKdN6ycUjVMkcmoyWO
         i1eA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="o/dj6NX0";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43ec2b6e123sor20672745e9.5.2025.04.04.15.35.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Apr 2025 15:35:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="o/dj6NX0";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743806140; x=1744410940; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7aHt9/+1RoqryMMLez5mxrSk/pFneV/cWior93LSBnc=;
        b=o/dj6NX0M06WFOeUC0KB1BlOwGh9njuC2Ey7PNd6oTajLiLUnIGR74TWjRCteHAB8H
         guxErT8AjQbhd8ArmtuAyfcrmpLQHJI6auNU/C2IqdkfWwYfoJDlf9940HgHdNjRZJWh
         UMMcSlwVpreAyVRAuURmZppD0jt8MPch/ybM8+rBCURTHLws+7vNMkeHqqxTGl689fh5
         uk91PZ4ZxPImKEgzm0tKisOnkexVssCeXhGWY1usfl3iFiIi8edtOXSB+ccNl3EJgP//
         hd0JWGF+8QLrIEKAM8vx9W48hdbaVBUvgQeA+fD6yUHVqbCot39JPox16Ll3Hq2uwA0C
         BIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743806140; x=1744410940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7aHt9/+1RoqryMMLez5mxrSk/pFneV/cWior93LSBnc=;
        b=UWI6BOy+PefUWY243bSf7o9pRz1lsZmRVJ4Un9XWRlatYv42XcCdU8rTNrABo7ODCs
         sjGNSFwVPvIe8Ccn0Pc2AAoexjeJs6venc41Q6ZfxkoXDRgQCL0/YSILRcU+eNugbNmf
         nOECsh8ff/cvYfQ/XYL/qmkx03+IfYDyWo1k6K2dbqnaXjg0FKZq6ZP6iSVzwY++8So9
         KBUkLxCiw68OVyZUcyXTwIZEdkgX4R6rTaGDxndKAbMsMNZWUJEYsNjBQrrUncolbHsm
         0bf+iRwXUOyT0AleyXd0H9wKqm6XnhVHUW527sychkZxH063WZBRa4LYb6j5Yy9Lu11i
         dRSw==
X-Forwarded-Encrypted: i=1; AJvYcCVGwyNhmevmPgTOEEKQSwIGygONcR/bVxBWG6BNE+1X8MFsxSCw1dHFWsie8MwezDdDLqoXDqm7Pv61tw==@linaro.org
X-Gm-Message-State: AOJu0Yz3d6kDkFSgdpJwSrbnHQkBKrBIaMZ9p9C9GV2SM8J9AC8IgpD4
	tXKvjCM1P1vHW/iW8HtC8YkZjD/hQmvKajk/BwtLQ/u2XR2nMZDtP3uErRqOe12Vtg==
X-Gm-Gg: ASbGncs2tXmC7LlgjjemTqxYMx2BY07ZIuOe/7S8B8iaXW38/EpfbxPH3hkojBQs0RZ
	v3td+Vgdr1FYMOc5q+dKCEznqledc92vwYA31FRxEIM8uDNSkvIVy7QEcTfDG3/fd8NOthMOq/6
	R2VK6Kw46w82v2GMP+ThZsB7u9DfqhEmdHGzmD+9MLNAmvcarOrICoetgO4KvA9QAfQFrr30RlP
	qENZMYVS165Vra31pFiDYyKkgoYesRydxpAMjiXOIhZ20SMD4F65+5C5zLyqYo6fMSNtpd4QcP6
	pR6vJ/nmYJ8nNVidtmf6e6HIvy95kD/wNhUUxuE5dGYZ3jvbR927ldvgmLV+S0RYJXlTngYBC1W
	muFTMwhqmu0NDPprj+RDCH44d
X-Google-Smtp-Source: AGHT+IGY5N3blidZWq1yLJ/x7LLJTJQ8O9dacZzGNjQpzlIco5pH3CCHtEorFuricFu0h1ERBe/M9Q==
X-Received: by 2002:a05:600c:3b07:b0:43d:563:6fef with SMTP id 5b1f17b1804b1-43ecf9fec44mr37994195e9.21.1743806139405;
        Fri, 04 Apr 2025 15:35:39 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16313edsm60101395e9.6.2025.04.04.15.35.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Apr 2025 15:35:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 3/9] target/arm: Remove use of TARGET_AARCH64 in arm_cpu_initfn()
Date: Sat,  5 Apr 2025 00:35:15 +0200
Message-ID: <20250404223521.38781-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250404223521.38781-1-philmd@linaro.org>
References: <20250404223521.38781-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: sH9+u3Ot3hJN

Introduce the QOM arm_cpu_is_64bit() helper, which checks
whether a vCPU parent class is TYPE_AARCH64_CPU. Use it in
arm_cpu_initfn() to remove a TARGET_AARCH64 definition use.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 95afa9b72f1..ef95f31f249 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1471,6 +1471,13 @@ uint64_t arm_cpu_mp_affinity(ARMCPU *cpu)
     return cpu->mp_affinity;
 }
 
+#ifdef CONFIG_USER_ONLY
+static bool arm_cpu_is_64bit(ARMCPU *cpu)
+{
+    return !!object_dynamic_cast(OBJECT(cpu), TYPE_AARCH64_CPU);
+}
+#endif
+
 static void arm_cpu_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -1482,16 +1489,16 @@ static void arm_cpu_initfn(Object *obj)
     QLIST_INIT(&cpu->el_change_hooks);
 
 #ifdef CONFIG_USER_ONLY
-# ifdef TARGET_AARCH64
-    /*
-     * The linux kernel defaults to 512-bit for SVE, and 256-bit for SME.
-     * These values were chosen to fit within the default signal frame.
-     * See documentation for /proc/sys/abi/{sve,sme}_default_vector_length,
-     * and our corresponding cpu property.
-     */
-    cpu->sve_default_vq = 4;
-    cpu->sme_default_vq = 2;
-# endif
+    if (arm_cpu_is_64bit(cpu)) {
+        /*
+         * The linux kernel defaults to 512-bit for SVE, and 256-bit for SME.
+         * These values were chosen to fit within the default signal frame.
+         * See documentation for /proc/sys/abi/{sve,sme}_default_vector_length,
+         * and our corresponding cpu property.
+         */
+        cpu->sve_default_vq = 4;
+        cpu->sme_default_vq = 2;
+    }
 #else
     /* Our inbound IRQ and FIQ lines */
     if (kvm_enabled()) {
-- 
2.47.1
