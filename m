Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp10326181njk;
        Fri, 3 Jan 2025 09:22:53 -0800 (PST)
X-Received: by 2002:a05:600c:468f:b0:434:a815:2b5d with SMTP id 5b1f17b1804b1-43668b785ddmr390711515e9.24.1735924973705;
        Fri, 03 Jan 2025 09:22:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735924973; cv=none;
        d=google.com; s=arc-20240605;
        b=BUDergKtUf89QWpOmmT6lvPKFB7Yu7NJLddGas8hIGh7GJFpcRBR25KGII1HgHn4L1
         07AFo7uY3NMJS3SJVEwScQCLM5bZNIyWg42GYCnTadYVIgmB39uIAsF+gwM5hh8Rm+ZF
         kXLDmRkbSYzFKcFi1r+BNj+HAkUmVPCKs3Jy06Aj3com3R62z6UyN2BLRGPKoMnnjPsD
         1EA6HKH3+enWeKLNco6ylfIKA/WwglTwBseg9d/+S1f0LhXiYbNdeunD468rfmjlNdZJ
         J+aEWP7pKiH5MbiLe+5Heqy+VczIVJVwJA228miX0r52ko8bEUQSuB4vn82qh+QKji1j
         Sypw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GlVN5y46CcSMejJupZx1BQuV3ovHng+r81SDig0PPcM=;
        fh=sOXhaDUqTNtWZrrLHpwVOLbAyi3Of/7BDc3BkRLfsYs=;
        b=SfrYskeuJ9GuUugpV1/AlUyHeaxvHubAfsOpsYOpWAweOY8IjQMV+JWr3AIs5mH0rG
         +2a6R5uEndhJOBcmja9zaab0poDFng/xUE/O7dUI6AroqB8uyxbp2OpvabDyKny70CaR
         MCCUC0jLGFxCXnx0VBEvy3leLTX+0LQIQq3ubpz5AGk6aQokowGdJUTZUIbDDMXMkSj0
         pLywEirxFexd97y4wc7TT2HkmbGTfaerQoBBmFnk6SsP8S1rH9Wgc6+UI5lw/fuAoQgP
         YZGRVYxapyK83kaqM/rZP2TSNdaLa76RlrRAZX+d9Q7iR8sGdJLXYB8oqEC4HGRDvnhi
         S3eg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BxEI39S3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43662caf7c4sor93068225e9.2.2025.01.03.09.22.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 03 Jan 2025 09:22:53 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BxEI39S3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735924973; x=1736529773; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GlVN5y46CcSMejJupZx1BQuV3ovHng+r81SDig0PPcM=;
        b=BxEI39S3CVA9T3ozVpTa0sK2neDt98LpmTyhZKf3+rRjX0YL7zetJ908Bv3O1GeQ/A
         pyOaBhBYIUvoL1c0mnH4ripZmVYpo5vnBNFx/7ytvUT93wwj8+SNW92agvWq4kZCKcI4
         TYud2FMbpxY+03wVniRiag27B18NLK8/PIDYLDzzX3XK3Te5nXkFuSmnFL8XipQEiXJJ
         B93kUQanfeoPtJYFm7gagrjzPqJUMUqXsAUHGMPsT+0/cHY5n0E6pZXIP5ALPPFvDbRF
         NtxWXHBzQKku4UqedC6xZbxjJzcYlbJwM+o6b/Rvr5JBIA8OC7udtOG4W9WNvY29h2uR
         qtjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735924973; x=1736529773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GlVN5y46CcSMejJupZx1BQuV3ovHng+r81SDig0PPcM=;
        b=Pqw4JKSA9NhkRuiXKvowpknpkuzGMQdHAnWZIuatLDrzLHAYQz9biWSR9Umzum4XA8
         nsZXaa5tnlLHHFFvuLcIkHlZdxuV+I6LhlXL40d8MGx6+WqHs/Ub09HpyweiuUfCE73b
         bsDf6QAjktS0bR8fydF2Ht0ieukqZ+wtaTEe97zJxcjKKYJmG5zT1ijF/OraOsutDjV2
         yKEKU5X01HgGJKhBQxILsTiQD3BoeOwa5ZUKAIKb1mvc+e2NVCS04MifFY0GRq7V1lEj
         aO4nCRArbbxyLuYWXeOYRQowfNE7pqYtd1Xdwd/zOrUcocM3pFiQkzaNJlyKlxp96i3J
         nMGg==
X-Gm-Message-State: AOJu0YzMAFyvUz+xcQNo8osMqBiufQmCcKz0U0rSVPdTSBSd6wJQowyq
	/8dEGbKNOAshg0xq3bwg8wDTLkifGgFzL2lllUls745bClb80A6gGdoOLa+EOuy1wPAQjWQV/mU
	FUEsTOw==
X-Gm-Gg: ASbGncu1dtocbgRHGtFbZ7Zj91rAF0B0E3B1LQSEfBOnf+Eu+4ssL6CrCvm6Tce4mtL
	+eUVfaDgRZOpv0sHleoh87BsVhyJjYk8aMKPU40pNPXG0gLPVmsiF9XlwZxwPgoUjtMJ5iuxa+V
	m80Hzg0zbRP08N68AW/prTdM0FKatyRKHNxSSXdSGSfHh3+WeZPpHxra0xf/Sa2Unr5QHikZMtn
	lG38heKawjSfoE08G8FI8pTb2iS3k3pKIlvXciO07eNaw6t6pic/qJWr2hiStVg/Jp9CcSWm7EC
	P32wVQBxnNK0jtL3mKafw5xJGaD8Gr8=
X-Google-Smtp-Source: AGHT+IGyxVCndHj/pTMGfjvPSV9eCuiFdx3ug/8h2WJ9LNhi+aADdu5rL88R184yUE7q9jIyCyFPdQ==
X-Received: by 2002:a05:600c:154a:b0:434:fd15:3adc with SMTP id 5b1f17b1804b1-43668b786bamr376435975e9.25.1735924973185;
        Fri, 03 Jan 2025 09:22:53 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c508sm488947785e9.33.2025.01.03.09.22.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 03 Jan 2025 09:22:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v7 2/4] tests/qtest/boot-serial-test: Reduce for() loop in PL011 tests
Date: Fri,  3 Jan 2025 18:22:37 +0100
Message-ID: <20250103172239.18562-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250103172239.18562-1-philmd@linaro.org>
References: <20250103172239.18562-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 00dNZWhygyFU

Since registers are not modified, we don't need
to refill their values. Directly jump to the previous
store instruction to keep filling the TXDAT register.

The equivalent C code remains:

  while (true) {
      *UART_DATA = 'T';
  }

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
---
 tests/qtest/boot-serial-test.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index a71d2857807..553575ca75c 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -70,18 +70,18 @@ static const uint8_t kernel_plml605[] = {
 };
 
 static const uint8_t bios_raspi2[] = {
-    0x08, 0x30, 0x9f, 0xe5,                 /* loop:  ldr     r3, [pc, #8]   Get &UART0 */
+    0x08, 0x30, 0x9f, 0xe5,                 /*        ldr     r3, [pc, #8]   Get &UART0 */
     0x54, 0x20, 0xa0, 0xe3,                 /*        mov     r2, #'T' */
-    0x00, 0x20, 0xc3, 0xe5,                 /*        strb    r2, [r3]       *TXDAT = 'T' */
-    0xfb, 0xff, 0xff, 0xea,                 /*        b       -12            (loop) */
+    0x00, 0x20, 0xc3, 0xe5,                 /* loop:  strb    r2, [r3]       *TXDAT = 'T' */
+    0xff, 0xff, 0xff, 0xea,                 /*        b       -4             (loop) */
     0x00, 0x10, 0x20, 0x3f,                 /* UART0: 0x3f201000 */
 };
 
 static const uint8_t kernel_aarch64[] = {
-    0x81, 0x0a, 0x80, 0x52,                 /* loop:  mov    w1, #'T' */
+    0x81, 0x0a, 0x80, 0x52,                 /*        mov    w1, #'T' */
     0x02, 0x20, 0xa1, 0xd2,                 /*        mov    x2, #0x9000000  Load UART0 */
-    0x41, 0x00, 0x00, 0x39,                 /*        strb   w1, [x2]        *TXDAT = 'T' */
-    0xfd, 0xff, 0xff, 0x17,                 /*        b      -12             (loop) */
+    0x41, 0x00, 0x00, 0x39,                 /* loop:  strb   w1, [x2]        *TXDAT = 'T' */
+    0xff, 0xff, 0xff, 0x17,                 /*        b      -4              (loop) */
 };
 
 static const uint8_t kernel_nrf51[] = {
-- 
2.47.1
