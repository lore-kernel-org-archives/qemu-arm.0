Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp475696njc;
        Tue, 20 May 2025 05:53:43 -0700 (PDT)
X-Received: by 2002:a05:6a21:900c:b0:1f5:790c:947 with SMTP id adf61e73a8af0-216218f7a98mr22162212637.19.1747745623200;
        Tue, 20 May 2025 05:53:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747745623; cv=none;
        d=google.com; s=arc-20240605;
        b=SCZwWTFBWgMh9Mf957rLcpgea4XZ/LYQF5lXVF1PnskXX82M3cMC3XvVBxDdYjxK4f
         PV56OD7bB8tgKOHnDMyanZzhAodQKHe9z/4Sv44PpIJqGkyHIdTFurGJoWmJQsgBfoMG
         uVsliSbjyB+pj/N0EcjPWGZ3b/+W3ktgyFFuww3mBaCuGVK/6hMxHlG4VfxjyQj+I3p3
         1y8jg50wSmocC9hXs0jWUVc1qnjhUkpqLoc3PAZb+tC4RoRyjOwVlQca8h/yiTffYvi8
         wWqhbaxomj8cZtqw6OxUZVW9NbROqwWXv9vOqW9KZzf4/S6zzNuOikMySTZYvjQfdw8l
         sOnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=muYREexfGkNao6CbCGkvnw0ziWfWGPqgkjYPqsUlkEQ=;
        fh=SuZ3Il6+juWVFnsT/VTUHa0tfVGc7ktLxlz+cyhP4vk=;
        b=IUITWNNNi2zADOrq84MZ9cgVb6AVA7q369I8v7q4CiLLov/ri7J7lrh4VEW5IiRRDZ
         DEMS2xY/9u70zxQ4c9qVfATEXPt8e/41nk6ke46aie5lhOJufc6hk55jGAVpqHeiizwt
         TNSEwvWE3W/bRr0VugnSzdxVztzhJ1Pxkzw3TuAkhUCYeeMRDxtwxfGqtxIjRqwzkWFv
         4xELNflmAdezXVbGgnYVzKmJM268EGXAVaKlvs8gWla0kadtJ0VzuJB/v66I4sVbxK09
         Ds6cgRo8qpF3z4fLnPLYN3pGPiBFmgn+SnJYYpq6bL7VSPgvlja+LVJTQUb0sI1hUaZm
         hxnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=FHfbDkhJ;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b26eaf60b37sor5444198a12.1.2025.05.20.05.53.41
        (Google Transport Security);
        Tue, 20 May 2025 05:53:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=FHfbDkhJ;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745621; x=1748350421; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muYREexfGkNao6CbCGkvnw0ziWfWGPqgkjYPqsUlkEQ=;
        b=FHfbDkhJd/Sff1kftEuTt07U7m3+7qG46YQ/7AzLtWYcD7OVF9RczSS0qQ7WzCvq4t
         7AISoER4oPrFKsBCWxWElUB0dXCh6qCiDeuvygGdtaKeEr5qdFxPnFgNrAW/hc7oOORL
         A5SMLN6MTjRtWUiEKNeQJCnhlkN9S8XMWNlcv9JXIsBWFRuoqUCotFV+UHN4IF5TVCvx
         hT9ZRWsqr2CJI0cnBli5e3jvkRvxPTDrUJ9lLQqRgMcY99H9sWV4jQ4JaxVi/2MEOQV2
         NrngXdL6IWlMmGTdOMy9BSqe9zg3kQ29pdZs9mF2/4XVadaIFc7bPAu/nEwwzPs/I6TB
         iEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745621; x=1748350421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muYREexfGkNao6CbCGkvnw0ziWfWGPqgkjYPqsUlkEQ=;
        b=D9TCPpl/9gdLMy14QBr3sFWfCHl9CI+LBogEjwLHmsdFHgo2uch8nE69ePobOBKiLn
         pVnTBYZUJUiuEfTdzgc35UCGUU5iUGabCNZAtV/L55/Yuy663Y2f6CewbdOQh68Pq46L
         53ykH6wiNThYB9eX2OTMYEaiu0fT4NiEQGlXJH2sh/SBJIFloxjUopZIDenwcPzD+bSR
         uW+w+YXt377R+qmoWvQwAyO42R/R8wa0eBsP2cSkmV1FS7gR4WxI0JgTXIz7e07/GdXh
         Hx3YLck4DO6GGZrDw01BiQAI6sI7OQjDKFeGgW67VsmW0+QcyDpyw2VZG/MxbcClGQCE
         VdlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbGa9PmbxtMPOfgXhnudFmPA0NbfgEZ/2490lg3lPXcA1C6w82160nwaHKSScTwca4uJiX2hbccY1etCFunTh7eg==@linaro.org, AJvYcCUez2/hKiBJqvBJ0owkpsa01Gvbu/vgTWMPaa2lKNE2u7CXMcHReonriHheMdcS81aoEFx81NL9NoV9A91mOiRXOmE=@linaro.org, AJvYcCVbcdh5G3yU5xFOmLNM+wYAJ/Z34fUqt6g+lnI6mVwpcLg8eXUx3+JcfiaauEIbvtmtPsN3Xjs=@linaro.org
X-Gm-Message-State: AOJu0Yz/AtXiM/crJugGvC3DKVUQjLxFm7xobbYB18gO1xHCdKYePOir
	VCDUI/kom9f67HXg+Q8LIC+0FkYX5hdIvH3xuuc7DhJdb27Snp8bDO3D
X-Gm-Gg: ASbGnctzGJY9GGEoX3SpoMEI5OE90D7BOPbMXfnLeoZh1GUi80B+9HdjWAT5DTuhtY2
	YUEa/Rm37mwUMGvJRP8MhFTDLKa17soXl+AXUuq3Ck6ma9ZAf/Ye/MM61Dp+m4mJGHGBoKEyaeK
	g394UtIf6Mwrf8BjNYetvIJzE8jhfREmAQRqiOpshzU6Npb9keZx+g5m9yIIvq2Udx5G4Jt5qV9
	K1rQjI/QQ+7hRR/M4XLqyp/T+inupdRvKW/1STwWW5X+dcrZZAcXUq+QJGxvg9w9Ga6r81fKDlA
	ITWiTjl2QR5sUUe6c2/KZD0/AKU2R1vrhVMz9ahiUu6FbOMQrRY=
X-Google-Smtp-Source: AGHT+IG0tzA7tiR6O7xDX+cIgsbg7F1YbaiTFl+UQp9GDGzuq1KjR9A3Fqt0K9BadY1lb0SPFB22fA==
X-Received: by 2002:a17:90b:51cb:b0:2fe:84d6:cdf9 with SMTP id 98e67ed59e1d1-30e7d5ac8abmr21767013a91.26.1747745620806;
        Tue, 20 May 2025 05:53:40 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:1bde:8310:e993:5dcc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36364f9asm1625916a91.4.2025.05.20.05.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:53:40 -0700 (PDT)
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
Subject: [PATCH 15/33] tcg/wasm32: Add andc/orc/eqv/nand/nor instructions
Date: Tue, 20 May 2025 21:51:17 +0900
Message-ID: <711394a374ef6df21e8759a1768ab542a787353a.1747744132.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747744132.git.ktokunaga.mail@gmail.com>
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: OudzuV7IjF6Z

This commit implements andc, orc, eqv, nand and nor operations using Wasm
instructions.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 tcg/wasm32/tcg-target.c.inc | 55 +++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/tcg/wasm32/tcg-target.c.inc b/tcg/wasm32/tcg-target.c.inc
index 66d3977d31..50d772f3d6 100644
--- a/tcg/wasm32/tcg-target.c.inc
+++ b/tcg/wasm32/tcg-target.c.inc
@@ -520,6 +520,56 @@ static void tcg_wasm_out_op_not(TCGContext *s)
     tcg_wasm_out_op_i64_xor(s);
 }
 
+static void tcg_wasm_out_andc(
+    TCGContext *s, TCGReg ret, TCGReg arg1, TCGReg arg2)
+{
+    tcg_wasm_out_op_global_get_r(s, arg1);
+    tcg_wasm_out_op_global_get_r(s, arg2);
+    tcg_wasm_out_op_not(s);
+    tcg_wasm_out_op_i64_and(s);
+    tcg_wasm_out_op_global_set_r(s, ret);
+}
+
+static void tcg_wasm_out_orc(
+    TCGContext *s, TCGReg ret, TCGReg arg1, TCGReg arg2)
+{
+    tcg_wasm_out_op_global_get_r(s, arg1);
+    tcg_wasm_out_op_global_get_r(s, arg2);
+    tcg_wasm_out_op_not(s);
+    tcg_wasm_out_op_i64_or(s);
+    tcg_wasm_out_op_global_set_r(s, ret);
+}
+
+static void tcg_wasm_out_eqv(
+    TCGContext *s, TCGReg ret, TCGReg arg1, TCGReg arg2)
+{
+    tcg_wasm_out_op_global_get_r(s, arg1);
+    tcg_wasm_out_op_global_get_r(s, arg2);
+    tcg_wasm_out_op_i64_xor(s);
+    tcg_wasm_out_op_not(s);
+    tcg_wasm_out_op_global_set_r(s, ret);
+}
+
+static void tcg_wasm_out_nand(
+    TCGContext *s, TCGReg ret, TCGReg arg1, TCGReg arg2)
+{
+    tcg_wasm_out_op_global_get_r(s, arg1);
+    tcg_wasm_out_op_global_get_r(s, arg2);
+    tcg_wasm_out_op_i64_and(s);
+    tcg_wasm_out_op_not(s);
+    tcg_wasm_out_op_global_set_r(s, ret);
+}
+
+static void tcg_wasm_out_nor(
+    TCGContext *s, TCGReg ret, TCGReg arg1, TCGReg arg2)
+{
+    tcg_wasm_out_op_global_get_r(s, arg1);
+    tcg_wasm_out_op_global_get_r(s, arg2);
+    tcg_wasm_out_op_i64_or(s);
+    tcg_wasm_out_op_not(s);
+    tcg_wasm_out_op_global_set_r(s, ret);
+}
+
 static void tcg_wasm_out_shl(TCGContext *s, TCGReg ret,
                              TCGReg arg1, TCGReg arg2)
 {
@@ -1618,6 +1668,7 @@ static void tgen_andc(TCGContext *s, TCGType type,
                       TCGReg a0, TCGReg a1, TCGReg a2)
 {
     tcg_out_op_rrr(s, INDEX_op_andc, a0, a1, a2);
+    tcg_wasm_out_andc(s, a0, a1, a2);
 }
 
 static const TCGOutOpBinary outop_andc = {
@@ -1707,6 +1758,7 @@ static void tgen_eqv(TCGContext *s, TCGType type,
                      TCGReg a0, TCGReg a1, TCGReg a2)
 {
     tcg_out_op_rrr(s, INDEX_op_eqv, a0, a1, a2);
+    tcg_wasm_out_eqv(s, a0, a1, a2);
 }
 
 static const TCGOutOpBinary outop_eqv = {
@@ -1788,6 +1840,7 @@ static void tgen_nand(TCGContext *s, TCGType type,
                      TCGReg a0, TCGReg a1, TCGReg a2)
 {
     tcg_out_op_rrr(s, INDEX_op_nand, a0, a1, a2);
+    tcg_wasm_out_nand(s, a0, a1, a2);
 }
 
 static const TCGOutOpBinary outop_nand = {
@@ -1799,6 +1852,7 @@ static void tgen_nor(TCGContext *s, TCGType type,
                      TCGReg a0, TCGReg a1, TCGReg a2)
 {
     tcg_out_op_rrr(s, INDEX_op_nor, a0, a1, a2);
+    tcg_wasm_out_nor(s, a0, a1, a2);
 }
 
 static const TCGOutOpBinary outop_nor = {
@@ -1822,6 +1876,7 @@ static void tgen_orc(TCGContext *s, TCGType type,
                      TCGReg a0, TCGReg a1, TCGReg a2)
 {
     tcg_out_op_rrr(s, INDEX_op_orc, a0, a1, a2);
+    tcg_wasm_out_orc(s, a0, a1, a2);
 }
 
 static const TCGOutOpBinary outop_orc = {
-- 
2.43.0
