Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp722923eji;
        Mon, 18 Dec 2023 03:34:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBvSiV55LQL3OhFiLDvAJU7YDbnpJCOqVEFFmAFQClHeAFJQ9OzomUi1HA8DmfIanfTvI0
X-Received: by 2002:a05:620a:26a4:b0:77f:d52:f791 with SMTP id c36-20020a05620a26a400b0077f0d52f791mr20046039qkp.68.1702899283232;
        Mon, 18 Dec 2023 03:34:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702899283; cv=none;
        d=google.com; s=arc-20160816;
        b=Upc1x94AOQIhJW5vd/9SOil401ytWMz0E++CLUI+8D4OMmhmvUHtJO9NKQ2S3xdMZT
         7nVvFstEsL1V5YQcUl8NmuJgDql7R5wrfNlxp1UBgtmyX008vpwhluXavdzPf3+uwR+f
         lr49xZYkF4uUbxOPv48uMRkis3/TD4hD6DgbJfUNF+wIyK4dPHToiiJ4XO9wWNj3RBlj
         ghZ+GGjc2d+wzy0shIG+c1E096Hfn2Y2eQ8d1Y38oULVRhIHtJ4XvVqdEhZpnIAkFjQU
         2P/UZGtfAoZ4H6caSuZpJ0grPxENcwCGe7T6iLk4oBWQNHxQzOi/JhIAwnlsL+itdUUE
         jE1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gThDCBT1NLIns1yMSSTDgKj1hf4iO2zsqHlQHQg2dD0=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=xHszHWh0fgOuYHuExxBA9oJP1R5TwxSgS4kIiMPQZE6lB39N3T5C9xh5D4x98DmKuP
         FXIqvMX/0sfAxEI447ueus0wOadBL0sjJmDq0z/Zcmwmusfpmk3IUxgF//KB6Ysv6qEN
         iekHwG/1zDqzTXf7P5XZrS0rYZx9+nG0KpiVdmrtP7aSvqcExDSVAdZR7QH2SbAItef8
         COVZwhJuUQ4bOGT/feJkdXUQWQlYQPt9vAxUDb4IMYRBGCwnTTc0fS0POUB6r2E+5OWf
         cRtHYeHiO0sd3QhsaZoncGXHtm39EkEeqttCLp9KXiU2gMuE2XYEq6bbvenn5U+jSTZq
         THoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EobsDH45;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u21-20020a05620a121500b0077fb70aaaa1si6278657qkj.83.2023.12.18.03.34.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 03:34:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EobsDH45;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFBs9-0006fA-J8; Mon, 18 Dec 2023 06:33:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBs8-0006dY-0x
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 06:33:20 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBs1-0003JC-QU
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 06:33:19 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3366ddd1eddso114031f8f.0
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 03:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702899192; x=1703503992; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gThDCBT1NLIns1yMSSTDgKj1hf4iO2zsqHlQHQg2dD0=;
 b=EobsDH453GwtUpWwiFLUjKldhTjHXn8VtQP50zzFbwNjeY2vKlBH8pd9j5MMkrl+W1
 lBLuBHhA1D2Z1h1sGKUEi+gYvKmV4Xo8GJbtnmsuu6wGE9EFjDnmbiQ3bdNvC/KEC/L9
 08LDlP0FUXCXMxCCsnD7K5qae0r98RO/atr9VN2cJq8itR2Cv50/1FDESFt8J4GXF94J
 U8hly7vRmrncbhnKI51xF6iDdzwV0xKpn1QEgZAif/Zq8TlfC5cr9AKpuUhqopfewFmb
 AUO6K0DoQyRrQm0bqB2kraeP8VvAJq/VjV2oXAgyDdPGx68MjH6YCSZ6xuoiIFM7SvXJ
 9GKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702899192; x=1703503992;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gThDCBT1NLIns1yMSSTDgKj1hf4iO2zsqHlQHQg2dD0=;
 b=Fy/KwNqOlG1HvJo8byuXkqALGxvmMUULJEKlNfHzRO8ETycNv9VEBmEHi4skFtBP6f
 kK0FwkKKIZn5njbEp/fw+6WYq6LeJSTj+2eTZFe6SJQ/im6aXLQPik5kW74gF3c9dIz9
 O8BjhlelgxCkeGQ/oXGm691lSQUGdXRCKY3F4USOkur3W1I12oOlk4YsZSUP8a6U+GPo
 quIKodgkw3IxgnwDTz9PuP+AkXnEmy0V+yAuoISiZpOPWnyUyFBm/VhJuZGero5XIsR1
 HlG90urqGravqbzR5CKaiz1yWmEsnLVBdzxMl8cZPH6iot6T+ryEaI27dt5vlQXPILir
 0dSg==
X-Gm-Message-State: AOJu0YzvpBLm35ZjzMfgnWQSdWLu0SrzVN+NtgOFHcfo8Hx8WS8q/QMa
 U4VhfVyNTE5Zhf16PjtKXCpjpnn153WrygOjsw0=
X-Received: by 2002:adf:f3ca:0:b0:336:64b8:9d3c with SMTP id
 g10-20020adff3ca000000b0033664b89d3cmr502236wrp.67.1702899192343; 
 Mon, 18 Dec 2023 03:33:12 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adff012000000b003366da509ecsm671193wro.85.2023.12.18.03.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 03:33:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 12/35] target/arm: Move FPU/SVE/SME access checks up above
 ARM_CP_SPECIAL_MASK check
Date: Mon, 18 Dec 2023 11:32:42 +0000
Message-Id: <20231218113305.2511480-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218113305.2511480-1-peter.maydell@linaro.org>
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 3xivbHVrCWZr

In handle_sys() we don't do the check for whether the register is
marked as needing an FPU/SVE/SME access check until after we've
handled the special cases covered by ARM_CP_SPECIAL_MASK.  This is
conceptually the wrong way around, because if for example we happen
to implement an FPU-access-checked register as ARM_CP_NOP, we should
do the access check first.

Move the access checks up so they are with all the other access
checks, not sandwiched between the special-case read/write handling
and the normal-case read/write handling. This doesn't change
behaviour at the moment, because we happen not to define any
cpregs with both ARM_CPU_{FPU,SVE,SME} and one of the cases
dealt with by ARM_CP_SPECIAL_MASK.

Moving this code also means we have the correct place to put the
FEAT_NV/FEAT_NV2 access handling, which should come after the access
checks and before we try to do any read/write action.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-a64.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 00d12e148ca..2d26cb6210f 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2189,6 +2189,14 @@ static void handle_sys(DisasContext *s, bool isread,
         gen_a64_update_pc(s, 0);
     }
 
+    if ((ri->type & ARM_CP_FPU) && !fp_access_check_only(s)) {
+        return;
+    } else if ((ri->type & ARM_CP_SVE) && !sve_access_check(s)) {
+        return;
+    } else if ((ri->type & ARM_CP_SME) && !sme_access_check(s)) {
+        return;
+    }
+
     /* Handle special cases first */
     switch (ri->type & ARM_CP_SPECIAL_MASK) {
     case 0:
@@ -2267,13 +2275,6 @@ static void handle_sys(DisasContext *s, bool isread,
     default:
         g_assert_not_reached();
     }
-    if ((ri->type & ARM_CP_FPU) && !fp_access_check_only(s)) {
-        return;
-    } else if ((ri->type & ARM_CP_SVE) && !sve_access_check(s)) {
-        return;
-    } else if ((ri->type & ARM_CP_SME) && !sme_access_check(s)) {
-        return;
-    }
 
     if (ri->type & ARM_CP_IO) {
         /* I/O operations must end the TB here (whether read or write) */
-- 
2.34.1

