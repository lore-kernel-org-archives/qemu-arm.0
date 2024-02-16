Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp1151186ejb;
        Fri, 16 Feb 2024 03:04:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXcH2nU2kccmmsF+6iPMMX6W3B5iflv6YoZELFQ6+gaGUOXEBAI+5SUjxpTeRbVJM/7FSfOzx6P6dThtKMzOcUDcdzMp5y2
X-Google-Smtp-Source: AGHT+IH5FOO1rVaLGGP7v9SthiVM+fqGjUQER53QZHGpX1/PpM2kGVdgrWii+LMGdgKh8A30POC+
X-Received: by 2002:a05:620a:c17:b0:783:1e5b:8e57 with SMTP id l23-20020a05620a0c1700b007831e5b8e57mr11830072qki.34.1708081463100;
        Fri, 16 Feb 2024 03:04:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708081463; cv=none;
        d=google.com; s=arc-20160816;
        b=sZkQpCMz2rP0LqM3kaiMVZsevb/Pjx8nhunw1NfZrq59ytz8yY/5u1g+3nGHf6H6PE
         y1aSs+ygK0l5ecWvuLwZ+bYxswegegrfFdhiBQYVJZHFUY8Pgyiwe+N48b79Jn5YK07L
         fP1+iCci/PWVZuma+vbGbZ8Vk86NNI1eEiy43qLB3dVgDHjCe9bPDokb4kvPGdljVxFe
         QLFkx8ec8h5wUGmaICX0gsl7mJbpjOY7snMh3z8TIf/ffCPlpntS972lmAGp89T9hQqf
         R5I1MDweyzKILrTclPvboQ+cwQDGGwT/r9YJM/pP++UaAKMdVcce3Sd2WbAdi/eS64Yi
         NBUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+4cWnhsBShzzzFHqb9EuQ4ogMglB6l+e/nMze0glgi0=;
        fh=SdHfmMk08V6qaPboySf3LNyDMll0JLG4w+P8OAJe5oA=;
        b=hQQ5r/FZVwK11vUQqE8AF5huXXO0uQdaCEQaKKRNUOtxnbeUnFH3yVEBRGX/4xX6sV
         ap79kMcfvDJ6Bxss4EAAIdtcMPL1QbbMcoFvRkV1jQSgCwjMoP8VQbhaTyUZHW5I4lDI
         XQ2jzkPxh0YEQalASMtoa6cfheiGojou6bsBQIfeNMUJm1M5RQMdtOycPEivfHkiEm77
         4mLb2KYc2k7zKjmpyZXzlbvhJX/KxiZXe63qiOOwm7x4optNkQfi/ASO9kupdcwAF9b3
         iy1pmeMmyyWV5bOtOoLU1oQyApqf2Dmgx6KMO7p2hkpE187EjNKC3g64BLTqeWqtCxAN
         A6TA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=loa2CLhH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pa17-20020a05620a831100b0078633c24de6si3637701qkn.90.2024.02.16.03.04.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Feb 2024 03:04:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=loa2CLhH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1raw0r-0006ml-QN; Fri, 16 Feb 2024 06:04:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1raw0n-0006h7-49
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 06:04:10 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1raw0h-0000yv-K6
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 06:04:05 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-411de7c6b3dso14587985e9.3
 for <qemu-arm@nongnu.org>; Fri, 16 Feb 2024 03:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708081441; x=1708686241; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+4cWnhsBShzzzFHqb9EuQ4ogMglB6l+e/nMze0glgi0=;
 b=loa2CLhH2eVGucz+5u/ZHrF/tVm3Kb1XtkZaChSqNZYVLfUMD0wrsLSiUCIX1v+ZZ2
 jnXz5aRtVP6cTU3+P5FB0lxpBp84TcD4B/ZpIHLL0UwDR370wc10Ayzy/MMmX50KDTzZ
 z/Xk/1TgaS3HGA1tZzbOYyJ5yMj5iqUmsvFOtz/mMibvVNmyGoDg6pE7J3ywZfZoyJM+
 rP5QIqhDB64AJm+QA0C/hkCE5WkVITAfkMzFpGjp46DbKKpYv+z9A4zHOKszin2d1q8w
 vxNA667jv1R8UcE5ccNyourlTN6BHYxI41xFsKfuTAlNPqFyqEWYIVrJQHdFX1xTtkID
 EDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708081441; x=1708686241;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+4cWnhsBShzzzFHqb9EuQ4ogMglB6l+e/nMze0glgi0=;
 b=A6Zk0G0+MZVFEOK1RhXH7ZhtLbuDe1m9SgVLUVhJo9CZ3GYUKG+qvMRpPuE6O8ECP6
 8l1dfDX23nEucy5+VXR/meIhPdWYgGNCRqUQIx0Ng8tXTeWXlTZekZp7nKHlRp3ZL/m5
 1+ZRZl6ge0wW6026h5m97/2fjGsgXzdEaO0pPGInHCOv5+IfLzlfeAedGypSTrLCp9W/
 17IUrm0Y3qSBOHb8hOtgO1Ort7icBLlfvDy1Rexft2I8aCcSAttVMlow8H+nkEfv/YJc
 1uGuEhgRzedrtoRP0YxG1Flwwf779QBzFTHC6mgaQei2h/huclcxMMmepOVweTshM5i9
 8h6g==
X-Gm-Message-State: AOJu0YwwV9HqKF/U5XUl+CKaY1WtzSoWtc/3hbvmDDa9G2JsGcCQUEyT
 NFJJUAY9zUgrseWSLd7fhncVZ4lfALZI8Aa8utQMwlXRyJKfa9d43S67rAqqEYI=
X-Received: by 2002:a5d:6143:0:b0:33d:2437:e739 with SMTP id
 y3-20020a5d6143000000b0033d2437e739mr252251wrt.54.1708081441727; 
 Fri, 16 Feb 2024 03:04:01 -0800 (PST)
Received: from m1x-phil.lan ([176.187.210.246])
 by smtp.gmail.com with ESMTPSA id
 x11-20020adff64b000000b0033d157bb26esm1880818wrp.32.2024.02.16.03.03.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Feb 2024 03:04:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH 07/21] target: Replace DEVICE(object_new) -> qdev_new()
Date: Fri, 16 Feb 2024 12:02:58 +0100
Message-ID: <20240216110313.17039-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216110313.17039-1-philmd@linaro.org>
References: <20240216110313.17039-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 3yROxAFDiNAE

Prefer QDev API for QDev objects, avoid the underlying QOM layer.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/cpu.c   | 2 +-
 target/xtensa/cpu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index d644adbc77..6b3909ee08 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -649,7 +649,7 @@ MIPSCPU *mips_cpu_create_with_clock(const char *cpu_type, Clock *cpu_refclk)
 {
     DeviceState *cpu;
 
-    cpu = DEVICE(object_new(cpu_type));
+    cpu = qdev_new(cpu_type);
     qdev_connect_clock_in(cpu, "clk-in", cpu_refclk);
     qdev_realize(cpu, NULL, &error_abort);
 
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 79f91819df..4f9408e1a0 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -205,7 +205,7 @@ XtensaCPU *xtensa_cpu_create_with_clock(const char *cpu_type, Clock *cpu_refclk)
 {
     DeviceState *cpu;
 
-    cpu = DEVICE(object_new(cpu_type));
+    cpu = qdev_new(cpu_type);
     qdev_connect_clock_in(cpu, "clk-in", cpu_refclk);
     qdev_realize(cpu, NULL, &error_abort);
 
-- 
2.41.0

