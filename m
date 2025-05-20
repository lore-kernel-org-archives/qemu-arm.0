Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp476194njc;
        Tue, 20 May 2025 05:54:37 -0700 (PDT)
X-Received: by 2002:a17:90b:4a50:b0:2fe:e9c6:689e with SMTP id 98e67ed59e1d1-30e7d509f14mr26828793a91.8.1747745677813;
        Tue, 20 May 2025 05:54:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747745677; cv=none;
        d=google.com; s=arc-20240605;
        b=HPoAZJ5e4UGMi82ShKAkikTWT1NnctTEC6digE0lQv6wAQpqqJo9N2KkbGfVghszVM
         sAMh8as7mWfGs0/CzYIXOsH8V4F6Rmgdrptr+fYxJlP9va085UazFnYjLt4577VS4nRt
         SSF9B1arWZTbtJNL5wivByEG4Ie+rshear0er61ducSWjbpZjwHz3E0JtcuGG9Nc11R8
         b4FKKEBCEtnorVLoijBugnO8BnjjxCvY/trvTyO7NcgMyKyiJU+VIj4XXV/CSSw1IXIR
         xqTmmALnreWiSueQTqNEOgHyQfdum9D7414AktEF9YJ77GztVjDOmN3WOuFN6KTW9Lvu
         cxKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7eabZrzKs+cL55IaJg89VzpBHaEX4pjQLmBcxb/tbcE=;
        fh=3O+6U6iQorZgxFR7gH3dwICMqV9lQLKOjEn8at5nHL8=;
        b=VHlMdobQYlWqKUB4cwLk4SAImjG6d9L/yS3UmhPviHPMNmsCb4pC5i/GGVfcbcgQ/G
         eSk1gzFEC6NLtYk9xMzvpjgy19omVwdu4a6jrJKCljp+f0heFBc1zbpNsz44H7cmzu0P
         OhfGjYdsJ1aNH/lHMkxwtIYuslC7tHOqr1/pARV+gr/Dcn2ksXQgEjhs//zQtwGGqQoN
         e4KsCTdtOYsSktEu4aulwcii74OUZt3MJh//jhR9B8g+1HEzRJ9FMow/ymFA/LQgxndY
         dViFx6FWZjKPPtRTdgPHSCu4ZmXJ1hq8b62FqkuXCvzTDBrdUfxd4dizKLZucqiSWgRo
         zq2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=hyzhHLvW;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30e7d59ca08sor7516866a91.8.2025.05.20.05.54.37
        (Google Transport Security);
        Tue, 20 May 2025 05:54:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=hyzhHLvW;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745677; x=1748350477; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eabZrzKs+cL55IaJg89VzpBHaEX4pjQLmBcxb/tbcE=;
        b=hyzhHLvWIiAHPTkxIopnPwiAFmEN7yYacRpfHdmkQ1hk9y1DdS2gn9kHrpIhnZhupm
         0qShbWqLmp9wk1He6eWCrPLlQgex872XQ+CS8E3gFYR2oSNE1vzBvulunnXUXqglQkx7
         PFEfJnDeJmAuzcKx16OrkuIWktpVeQCRWMUiEQABWvZhvHl5E4vLLGccWvLsTfBkuAWp
         G9hZhxn94RErVk0p8BWsvfdczUSY4eUAFRqW11Ddd3hwYADU6PtjOTVYbGfnewrMNAz4
         3kYbdJHAZosGrd8KMxAmrLwDxbspM0FyL8FtyuxSPgRgw9OA1oaYyP3wYxQBSWDi2XFl
         y7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745677; x=1748350477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7eabZrzKs+cL55IaJg89VzpBHaEX4pjQLmBcxb/tbcE=;
        b=mvrDpfMFeIFCmvgcy/zUSHJiYoxLLbAiwxhRvrI+65YrfCwk2k/hAdRXDrlN68CKjp
         e+n4dyQyCqlz6mxgQsJxPW2aoiQdTNKBm3w3gaTL+/Rsqo75RLH61gIy+Tg0bOEYooJU
         MJdTdQ5FozR0nOC3PLpjx1z+RlhsevxwPKIW+9Zg+XYQQHPOLawwMjAGv2Gr8YpQ0opW
         9cmxaU6xV+LxxoAPlQ3TfqoWcV9pwZz7kQZC/peCyIXW9SoU1Hefr4Sv2oadmEuoeUKz
         rAwV11sC0ht4YiJr05wc56uIXIsbRDfEHOEQWepNMsyBD2NZZrBbgqzVJ8/XSE6XU8F+
         KQZg==
X-Forwarded-Encrypted: i=1; AJvYcCUU+DNkxxmBwPR6K7JfiOhf/tUz4JO34PJdGmv6pheCi7V9a8BYhw84gWKewLHzAihvHiLEEmTftYtk73ULRH1t4nA=@linaro.org, AJvYcCUxZ4whM3LpQ2uKv5AqCEX+bqUp2ZHyE/Zsr7F0hh8JERbwu4BW1/rO8ABfFbUPOHksclV6v5eEHps1kqBfVW/GYA==@linaro.org, AJvYcCWNyu4GkhNCXwouAnAm4HQ2wU3Djwwsx3YXd/2VKogZqQ+HBufzVDReare4McnhbnS35MAH9os=@linaro.org
X-Gm-Message-State: AOJu0Ywf2pgJzw5ffM5CQrdDFkA9NQgzZ6oSafa98TQZ3OBwzz7cnKDP
	LC6Uhy0plsbiFb8Grq3kwMHwX7ccIhID1rVhg2L4Licd/mMnyNsM6dzp
X-Gm-Gg: ASbGncvCbS8h9FQV+l8BSrMQXJ52U4/0xKpI1+DMXmwOPrb7JGp4icVc1pyDsxc9wEO
	gyuF8tY3mzvJNT+UPI9hFbR+OXxy+H11Aq7NIvrjwCN80FzCiURl+bqaWHeiYqicjNt13OTi0tM
	K64FW/EARZ/y3r4Q+YWVfjWcQKoiGPly+0oBuzRnKNf2r1cof5keVsisEUYdJ/P1caLHUdujy/V
	b9yiiRSz1dVRZJ/9USE4tuTDebmpGgI2xVjYpExwvTXZA+sPj382nkW0D5zbLHdwGZzGYXYQ/V1
	dsYtJOL9f9oxua6eK9Egoigs6hCfaJdhI4e+6N8qrQOClFyjKv4=
X-Google-Smtp-Source: AGHT+IEZCo8TLYMPhGsfPoyVD7cxyqqI5vVtGGele8JzfzU/R/+q5jO0KcIFs8Gd49flFHnnc/IHyQ==
X-Received: by 2002:a17:90b:6c8:b0:30e:8f60:b4c with SMTP id 98e67ed59e1d1-30e8f600d77mr26832066a91.16.1747745677188;
        Tue, 20 May 2025 05:54:37 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:1bde:8310:e993:5dcc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36364f9asm1625916a91.4.2025.05.20.05.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:54:36 -0700 (PDT)
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
Subject: [PATCH 25/33] tcg/wasm32: Set mulu2/muls2 as unimplemented
Date: Tue, 20 May 2025 21:51:27 +0900
Message-ID: <0e228847d902b25d643bcbee028d67e3cb0f0464.1747744132.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747744132.git.ktokunaga.mail@gmail.com>
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: k3Wr+k9EQvxX

These operations have no direct equivalents in Wasm, so they are left
unimplemented and delegated to helper functions.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm32/tcg-target.c.inc | 38 ++-----------------------------------
 1 file changed, 2 insertions(+), 36 deletions(-)

diff --git a/tcg/wasm32/tcg-target.c.inc b/tcg/wasm32/tcg-target.c.inc
index 9fad96d0fd..df34097267 100644
--- a/tcg/wasm32/tcg-target.c.inc
+++ b/tcg/wasm32/tcg-target.c.inc
@@ -2076,19 +2076,6 @@ static void tcg_out_op_rrrbb(TCGContext *s, TCGOpcode op, TCGReg r0,
     tcg_out32(s, insn);
 }
 
-static void tcg_out_op_rrrr(TCGContext *s, TCGOpcode op,
-                            TCGReg r0, TCGReg r1, TCGReg r2, TCGReg r3)
-{
-    tcg_insn_unit_tci insn = 0;
-
-    insn = deposit32(insn, 0, 8, op);
-    insn = deposit32(insn, 8, 4, r0);
-    insn = deposit32(insn, 12, 4, r1);
-    insn = deposit32(insn, 16, 4, r2);
-    insn = deposit32(insn, 20, 4, r3);
-    tcg_out32(s, insn);
-}
-
 static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
                               TCGReg r0, TCGReg r1, TCGReg r2,
                               TCGReg r3, TCGReg r4, TCGCond c5)
@@ -2610,37 +2597,16 @@ static const TCGOutOpBinary outop_mul = {
     .out_rrr = tgen_mul,
 };
 
-static TCGConstraintSetIndex cset_mul2(TCGType type, unsigned flags)
-{
-    return type == TCG_TYPE_REG ? C_O2_I2(r, r, r, r) : C_NotImplemented;
-}
-
-static void tgen_muls2(TCGContext *s, TCGType type,
-                       TCGReg a0, TCGReg a1, TCGReg a2, TCGReg a3)
-{
-    tcg_out_op_rrrr(s, INDEX_op_muls2, a0, a1, a2, a3);
-}
-
 static const TCGOutOpMul2 outop_muls2 = {
-    .base.static_constraint = C_Dynamic,
-    .base.dynamic_constraint = cset_mul2,
-    .out_rrrr = tgen_muls2,
+    .base.static_constraint = C_NotImplemented,
 };
 
 static const TCGOutOpBinary outop_mulsh = {
     .base.static_constraint = C_NotImplemented,
 };
 
-static void tgen_mulu2(TCGContext *s, TCGType type,
-                       TCGReg a0, TCGReg a1, TCGReg a2, TCGReg a3)
-{
-    tcg_out_op_rrrr(s, INDEX_op_mulu2, a0, a1, a2, a3);
-}
-
 static const TCGOutOpMul2 outop_mulu2 = {
-    .base.static_constraint = C_Dynamic,
-    .base.dynamic_constraint = cset_mul2,
-    .out_rrrr = tgen_mulu2,
+    .base.static_constraint = C_NotImplemented,
 };
 
 static const TCGOutOpBinary outop_muluh = {
-- 
2.43.0
