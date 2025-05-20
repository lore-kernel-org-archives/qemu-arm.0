Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp475235njc;
        Tue, 20 May 2025 05:52:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:7287:b0:1f5:7f56:a649 with SMTP id adf61e73a8af0-216218c9b17mr23788002637.13.1747745570396;
        Tue, 20 May 2025 05:52:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747745570; cv=none;
        d=google.com; s=arc-20240605;
        b=SyL4/0fq10AbCrvAG1QMO70dSacDi7ihqyJocyAxEvbA/QGBF4nVjrCtP7KkC9/bFq
         EJKS4OGYYOaC/n3NOSP6mhK7Yyk32MIhvh4G/ENJzVfBmsP3ajcmp3fOin+vtRlUzF97
         yUFAka/Q9CELm8eIwfJDMAZjvJMmBOhM2gEjsb8XEtmULxQ0dOCkWBnoaB8WL9fggIPE
         QKzpjPyneC2q4zPdo1AoHGmU2TNjAoxYRQd5E9xZyz+/u8bCs4PGTPaHR7X9pY6iKmlR
         0CwH9doR8mjckQ2F7YDA1r5DFYcHiE3nAu91TXpK3YerzziXAW1uYNH0nxDgxUN4nRbn
         yKww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=a3aqhzF4R3IS+EMJ/1tKp0zJy/CqsldgOlglF6FuQWs=;
        fh=dTv/VTVNVP0rycedCSupglf4ZygpmKf1LxcouyI9Tpw=;
        b=H6ZnhfMeDT2/r8hWGKN2UCtDxAc3Gs/57yJK9c/hOkYLlfG37hFIecV8Z5Cita6MBL
         2IJPIHJbPxUC7vgxhyYynPEr41g2nlPsV6z4dBSQGM+nX4OlriirIY+fS+QgJEUPjFtN
         CYVsDpom6DSXhQoRNiC1v/DfUldEL216zb+I9nDUKOJLXdZzpp2ZQULP8GYw9HExPfRJ
         TxIZK1uZIV+8JHcOVYX20XiLLENoe3Ou+TWkwkzseUAYySPI/ImHAvPTvx2/4yxkozav
         0GG3ufVuidj+zk3z8+9lamzpNrDwhYWj1zlVecomdWmmTwFVCBddqQCG6fVuaibBQz/I
         0NhA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=EyqP787a;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b26eb07712bsor4526340a12.5.2025.05.20.05.52.50
        (Google Transport Security);
        Tue, 20 May 2025 05:52:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=EyqP787a;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745570; x=1748350370; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3aqhzF4R3IS+EMJ/1tKp0zJy/CqsldgOlglF6FuQWs=;
        b=EyqP787aeUYc7lnlUNv8mJPbysVgflFwK5g8kTOXLkpAZcRhRL3YXBEIQT0W1SkOIN
         hghIg3E9JUggkSe00mPiheb2vNv56cF5qC6RrgcwjN1UBSgyKfkTHIKiuGihWAVW62Gr
         MiTSTq/et0d7hEIXF24sxw1m6bPgoLsqNcwfUqT/d0aJZDdwzal9hXHV+KnYA4/WdzUf
         8viyS99CNpPM5wchEbYavWTROVPYNVd422CSq3fGkpeWSfrj+Q1k28ZoZcUnBuJqILW7
         s7RK4+6oYFiLhY0FeNdQbpnyzoWn73y60owJlDU74X/VUfhqw8bH5F8OZ1UEXU6nAG75
         IQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745570; x=1748350370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3aqhzF4R3IS+EMJ/1tKp0zJy/CqsldgOlglF6FuQWs=;
        b=lLotfutWlB8jM/xbk7Ovafjo3bg8kU2bQu6XM5fkJ6enXncHbPx+b2eDDCOTWsVj0y
         yhe58CzFIfPrHH4/NRQuiv0bMN6hYtrZeW0ApTPd7Pbb6GEPzMWOBdQ5M9XZ/HBTTkq2
         NixwnBdTtlw09CujrMQ4j5Wwz6Jc3ErXItvCWaZKHmPB+NDtbInVn7MSQFcaax9FKGnk
         5YrZ4C228iAYYlVyH5rj9rW+Ge6ymfDTqwZGpao818lLsPcQ9PxnhfNkAlv8wijwHXl7
         bMu+rxaCWv1+rf3dryP/6lxctOg+2ZtrwJ5FXZFiyj0W0Z1dYDNgXM6YV4JXvKna7dIj
         R3Cg==
X-Forwarded-Encrypted: i=1; AJvYcCW6+pIVrFnc+F19u6CURKBzTO3BdjgsYdR5bMo9eUqKaB0+WEdZUA2a0lZzhCeMtltUXD2leTVEow0j+55dl+VcWA==@linaro.org, AJvYcCWBFdQd5OmgmI6r0yVfzBe7XgvSo4/8eHfbuIpkNsfEIy8Wd2uQqu3hauDhJwQmnAC5S3/T6Bo=@linaro.org, AJvYcCWRs8Sb9MecyfK3W7beBfeXB6CCN5E46DGLbfXbl10QMJIb8xB4LLCq5Py4pkBRWxJoogHyU0RyI81AbOkvgYSLef8=@linaro.org
X-Gm-Message-State: AOJu0YzxRojl70MKhRZNKNnqgMPtYJpXYViaG9id/LASWCsYGZ35AJnW
	s9d3pSQvnb8UGxDlBnL2txb4LqToARl97/D7g+3lh4fAmu8WZ8WJRpRO
X-Gm-Gg: ASbGncszimWgbyro7NjsN1NGhSRuoveKulXLKAMOLFsIn3Jb9V1ivsf9yneasd+khOS
	5Q0wkgSAFSBpPCfCnDz4HYmgFAqiRcIlGh2qm7wTdXaIijtHP0+D02o7PhJ+VVd6ohErIIp6tfq
	jJxq0BGTvMhbfyoOP6iGaQyPtjTLWciygJlaXMKe5UEBz3YTsb1bfR6jwlasFwlvA08exc57WBF
	8wLFdbwOSeWkVDJIJzx/dGOemJADLde89JDu+sS/0tAP1l9v9jjDo6THKZND/Y4EOz9Q1hevcVq
	42k7O9cHTkDkCj/TtPtAvuYDZ5IfBj1zBjbQsvcATcHcWcexvzJGZLjHOv1yzQ==
X-Google-Smtp-Source: AGHT+IEyrDe8Cdf9g26TH4wCWMETQ0+XWu9RhDQiEyiZTUrrFG1lMyYXyT2WhVrPka++rXuTJgqTBw==
X-Received: by 2002:a17:90b:3e8e:b0:30e:54be:37cc with SMTP id 98e67ed59e1d1-30e7d5a93a3mr21688031a91.23.1747745569700;
        Tue, 20 May 2025 05:52:49 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:1bde:8310:e993:5dcc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36364f9asm1625916a91.4.2025.05.20.05.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:52:49 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	WANG Xuerui <git@xen0n.name>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Stefan Weil <sw@weilnetz.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 06/33] tcg/wasm32: Add add/sub/mul instructions
Date: Tue, 20 May 2025 21:51:08 +0900
Message-ID: <a29467e1232fa65417e0d2e4d9038737d8d31d30.1747744132.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747744132.git.ktokunaga.mail@gmail.com>
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: r8bILXH1FwTu

Add, sub and mul operations are implemented using the corresponding
instructions in Wasm.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm32/tcg-target.c.inc | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tcg/wasm32/tcg-target.c.inc b/tcg/wasm32/tcg-target.c.inc
index e3a35c8415..e4204d3956 100644
--- a/tcg/wasm32/tcg-target.c.inc
+++ b/tcg/wasm32/tcg-target.c.inc
@@ -195,6 +195,18 @@ static void tcg_wasm_out_op_i64_xor(TCGContext *s)
 {
     tcg_wasm_out8(s, 0x85);
 }
+static void tcg_wasm_out_op_i64_add(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x7c);
+}
+static void tcg_wasm_out_op_i64_sub(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x7d);
+}
+static void tcg_wasm_out_op_i64_mul(TCGContext *s)
+{
+    tcg_wasm_out8(s, 0x7e);
+}
 static void tcg_wasm_out_op_var(TCGContext *s, uint8_t instr, uint8_t i)
 {
     tcg_wasm_out8(s, instr);
@@ -229,6 +241,9 @@ static void tcg_wasm_out_op_global_set_r(TCGContext *s, TCGReg r0)
 tcg_wasm_out_i64_calc(and);
 tcg_wasm_out_i64_calc(or);
 tcg_wasm_out_i64_calc(xor);
+tcg_wasm_out_i64_calc(add);
+tcg_wasm_out_i64_calc(sub);
+tcg_wasm_out_i64_calc(mul);
 
 static bool patch_reloc(tcg_insn_unit *code_ptr_i, int type,
                         intptr_t value, intptr_t addend)
@@ -632,6 +647,7 @@ static void tgen_add(TCGContext *s, TCGType type,
                      TCGReg a0, TCGReg a1, TCGReg a2)
 {
     tcg_out_op_rrr(s, INDEX_op_add, a0, a1, a2);
+    tcg_wasm_out_i64_calc_add(s, a0, a1, a2);
 }
 
 static const TCGOutOpBinary outop_add = {
@@ -810,6 +826,7 @@ static void tgen_mul(TCGContext *s, TCGType type,
                      TCGReg a0, TCGReg a1, TCGReg a2)
 {
     tcg_out_op_rrr(s, INDEX_op_mul, a0, a1, a2);
+    tcg_wasm_out_i64_calc_mul(s, a0, a1, a2);
 }
 
 static const TCGOutOpBinary outop_mul = {
@@ -1000,6 +1017,7 @@ static void tgen_sub(TCGContext *s, TCGType type,
                      TCGReg a0, TCGReg a1, TCGReg a2)
 {
     tcg_out_op_rrr(s, INDEX_op_sub, a0, a1, a2);
+    tcg_wasm_out_i64_calc_sub(s, a0, a1, a2);
 }
 
 static const TCGOutOpSubtract outop_sub = {
-- 
2.43.0
