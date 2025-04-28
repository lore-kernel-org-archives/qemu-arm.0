Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5713369njd;
        Sun, 27 Apr 2025 19:30:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxehJkwRSzTx6ohEM9Bl6OOH0juH5ULQay/cFVVtr/9R5I1EDN8Rgfk8eCMxBAOIjfdkDD4pYVIflRyg==@linaro.org
X-Google-Smtp-Source: AGHT+IGUsnqcsydslMUfnPWEzZ7u4Uhbgh537qC+NH8qH1pj+UyhQE7PIFqn14+p/JKKhyfBvkcP
X-Received: by 2002:a05:6214:5090:b0:6e4:2dd7:5c88 with SMTP id 6a1803df08f44-6f4cbb5a6b5mr192977716d6.38.1745807413396;
        Sun, 27 Apr 2025 19:30:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745807413; cv=none;
        d=google.com; s=arc-20240605;
        b=C+zRa60dYMZpexWmKF2llGLKkE4jPvCHjSBYMpRJDxWim/jeyIuJs743xHJp7nKr+T
         edOu6bJ4R0oHtylfrXPRqSVIVRBOkTCO94ueeR1MPAhzGnsrOK7LWW7/afvV9MPFMOo9
         EjKjOMNcwSU+hlRZRwvr/hNZ0a5StG+Y22VDXOZRIBO+HkzyGGXqXKdj5qomg8/SdAOK
         S0225xsqlIMTM7Z3IyFyE64mG3KqnbKWh2rXO8Z1j2BsPOqFNkXoLL5XIR6C5u09mzM+
         rdvY8Ja5TKDTjvJN4IJmdEH1hmFtGWXEDZy1rdLAvyFv4JWnyNZj71JljT/MDPg2PMBv
         TU6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=SgIEZVqP2SoL72AS38TPlzGLTk7c9CmbSWc1OpOBnGc=;
        fh=SVNFL6xxfNNXB+aDOYBV8ZAEaLkoSJOCu7n8Yhv9iWE=;
        b=AqIn5GeXG35AAPDBDTT3dae08+PWGEJGdfkZSq2ZLRGQDb2nTEPKrtouH7NbeROs5j
         YiFBTvNCRZMlpw8HhNMIvHlWHn34kETmw4MPtBunNUFY0PbhG3Lt0TLJl5EEgLUwNjTc
         U0cQnL/zGVZABuOKaow9nHumznjDZtT5mWGlnkhkVq/nyDPEL9blxZFEJATwB0UMyKml
         X8EhpjnCX5KLQmbD5KyAvtEjIdJ0uFqdLa5RkHaz3HuOxgRqbMJvvaimUOMsJxWh20g8
         oyPsksCUp3X9d3XeU+zFwsyXNJElRa5j2jcg0AqbIfcaKSDBxegEytHUk81gze1cVe/3
         i8cQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=hqS2W+b3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f4c0b0e956si93256206d6.458.2025.04.27.19.30.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 27 Apr 2025 19:30:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=hqS2W+b3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u9EFj-0001G5-Ji; Sun, 27 Apr 2025 22:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <timlee660101@gmail.com>)
 id 1u9EFg-0001B6-0A; Sun, 27 Apr 2025 22:29:49 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <timlee660101@gmail.com>)
 id 1u9EFe-0000HE-92; Sun, 27 Apr 2025 22:29:47 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-7376dd56f8fso5767535b3a.2; 
 Sun, 27 Apr 2025 19:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745807384; x=1746412184; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SgIEZVqP2SoL72AS38TPlzGLTk7c9CmbSWc1OpOBnGc=;
 b=hqS2W+b3Qx2+EmAgBwuVkCMMoR8nxC1Sm1bMGG+KFuiz8mIUpTrPzZ1MFl3o7J0TLJ
 AyahEsTXeM4Y4yLLYQbzrW8HxWB0hvRiI1Athqb3L6DM8gMMxEd0XPdGDfGsde5PjBQe
 HnqcBjnjCTPwRXxAhKGN93PlXp3tjFEXzNiGzCXr7FX6a9NwaZLYr92L1mjTIErNcYQZ
 62mmaoUz1Afe/H8DOy40OI3v3Ek0LkG42B3fVtjPt8ejR1u/GHwb9F3mptowAORff4UK
 maZs2CrGoOlqsE+kBlEm9eTqJXb32/Ao4RlD+Q+N3zQzZ8ETVJSgUrPmMpsun15vE96g
 eP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745807384; x=1746412184;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SgIEZVqP2SoL72AS38TPlzGLTk7c9CmbSWc1OpOBnGc=;
 b=aYek2yxVhzi604Wi3AT8ysiEHB7p6abkbjOO1t9CUC3XGTa7NST2Ie5g88WHJL70nt
 WDVQbIIld4xWPTn6KBHHn1Z0XRUZG9CjSUfsszni8duVBcPc+okrenjG5gknSeg7Mq0N
 0/71dx1eXBxB8UKZsMvx1rccHniQ8dseHvKLOGJb/eeBMZk3TEb3vrlk0Anx1OkMToq5
 dIktwiQdaa1LyA3iqpRyubvFTY9wvEDZO2g/jyExKqTfONLEDeEPRyzrpBbN7Q+om0HK
 qhf5Z/fgLIz9eJqparCpuAAG5k54lYZhWpi37zHPdnrsjrkDoMlS5qMx71fKYrbDaebE
 ocRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkdpcyLh9YxdnMpprkSyRx6ITjATdSe+3QjWt51Oe3UMIlFjYsXMXhm4X9RDeH7sDg7kAotTtdHBy1@nongnu.org
X-Gm-Message-State: AOJu0Ywmk635RRmFYhJ+ZqKVGOfvQrWUx6WPlQgjGwg73q+0ZnSr6XBL
 j1n4QRCNFrln3nt7WRvaH5pxLft2ecmzhz5x79EofOQvvStTTlC4
X-Gm-Gg: ASbGnctd8lejwHoizkUZpK7bH9jTYiBdoduL6wWKe6dRnHZCT+aWUt+1/GfuB/PjAaO
 yWWypD5RsMRPZSO2Nmxga5SURhoKUjLwU1k46zbXatL57nNADvnjS8ZPKkgPaYqeu/GbamMJfKv
 bGm5jwo1dsDV1jBd2Kd9QIML1MW2bz6ZIjBV+qEPjfwpbDsyRg572ifyY+cZtAt8Qu7HHD0INdS
 o/yB2bSvJXTC6oukRmD0x9n9NDqUVNaSxGiXMwuGMWE/su3Tu0k4nqsydNv/jsWfWIDccy5+VuV
 0sWcpbmWDj2Qd4067clZ3oUkesf+MZPveDc1txTJRd6NO35Zx1Y+w+k1vmyXKghc71cMDJpqi83
 tJKashYttQXu/2uWjojQ=
X-Received: by 2002:a05:6a00:99f:b0:73b:71a9:a5ad with SMTP id
 d2e1a72fcca58-73fd897ac9amr13151151b3a.16.1745807383829; 
 Sun, 27 Apr 2025 19:29:43 -0700 (PDT)
Received: from hcdev-d520mt.. (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25941eecsm7085557b3a.54.2025.04.27.19.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Apr 2025 19:29:43 -0700 (PDT)
From: Tim Lee <timlee660101@gmail.com>
To: peter.maydell@linaro.org, wuhaotsh@google.com, kfting@nuvoton.com,
 chli30@nuvoton.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Tim Lee <timlee660101@gmail.com>
Subject: [PATCH] hw/arm/npcm8xx_boards: Correct valid_cpu_types setting of
 NPCM8XX SoC
Date: Mon, 28 Apr 2025 10:29:34 +0800
Message-Id: <20250428022934.3081139-1-timlee660101@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=timlee660101@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DxOJDQs7qG+Q

NPCM8XX SoC is the successor of the NPCM7XX. It features quad-core
Cortex-A35 (Armv8, 64-bit) CPUs and some additional peripherals.
Correct the `valid_cpu_types` setting to match the NPCM8XX SoC.

Signed-off-by: Tim Lee <timlee660101@gmail.com>
---
 hw/arm/npcm8xx_boards.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/npcm8xx_boards.c b/hw/arm/npcm8xx_boards.c
index 3fb8478e72..6d3e59f6b9 100644
--- a/hw/arm/npcm8xx_boards.c
+++ b/hw/arm/npcm8xx_boards.c
@@ -213,7 +213,7 @@ static void npcm8xx_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
     static const char * const valid_cpu_types[] = {
-        ARM_CPU_TYPE_NAME("cortex-a9"),
+        ARM_CPU_TYPE_NAME("cortex-a35"),
         NULL
     };
 
-- 
2.34.1

