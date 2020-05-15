Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp547503lfb;
        Fri, 15 May 2020 07:21:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRjE7pmWV4g5Dwq6CmTsmddx2ZVhhb94tcxmmLOTFdNxxvm8/tzf6EXuGljkjACAa6Z6SB
X-Received: by 2002:a0c:f887:: with SMTP id u7mr3751249qvn.127.1589552486475;
        Fri, 15 May 2020 07:21:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589552486; cv=none;
        d=google.com; s=arc-20160816;
        b=fI9dWiq3Efyvimv0yqfwVdZeH10B61OxyQeQvactellGLrz0zu5Tzni81qTiNAhgKD
         1gRnDjlgVnVtfgWOg8roi4o1xh4U/Mn351WaNNySwpUKAG6uJsUDPoK7Y+jBFEPgGOmW
         TT0XgvBOww+eq1E5EuBb6HbofU3fOfV/zMQ0zb2OLe8MbWyJuiGgZz9Hk4jJt/Uf5LaI
         1bJUnNj16njq70M2vPIbNT6zRC41LbiKQDN25a2nP3yu6D/gxfn2viPMl85Z3bQIzBvD
         5soK/w3xDT03FmuT1aw0dpWzrfE9L8sXiEwx+eOxDjY3aKTeRJYOgXsJPiP+ThartDdM
         7V1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YD8Dvuo5pUfHRMo8RpEeRFbdBBgINC3AFc9P3kqEPfY=;
        b=Zv2OHIpN+26DW93H5j+x0NXw0xRI5nytzCWiV54kS9UKBIsrwASwm9/gwewbfbmPY+
         bMiB362orZ1852VfhBfq/MQgl+hm7peAlyrWOlf7loCeS8a3VIB6sqH6hLaMPlhrOo+a
         anE4cvQrVUUKr9jIZdEAgtsnNIojAQuCgPCK9ZYgbHq2zM9VHhicJyVLpI05i0FlXSY5
         3tdDX4UFFJz9+J26F+2MhTMWrtEIgqRXnBdhio8ocEeKrbMprDHtZV3zDDtBjZyRM42T
         z0hKTAYzkMzYpLPT1CqROyWhZoaTD8624JGncELYG4l2IQIwf+YPXMsZMQbvZjft1U1g
         wOng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IL4BxIWV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o19si1228527qke.115.2020.05.15.07.21.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 07:21:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IL4BxIWV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZbDJ-0001BB-Ny
	for alex.bennee@linaro.org; Fri, 15 May 2020 10:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZbCw-0000bj-4P
 for qemu-arm@nongnu.org; Fri, 15 May 2020 10:21:02 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:33782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZbCv-0003rU-Dr
 for qemu-arm@nongnu.org; Fri, 15 May 2020 10:21:01 -0400
Received: by mail-wr1-x444.google.com with SMTP id l11so3824812wru.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2020 07:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YD8Dvuo5pUfHRMo8RpEeRFbdBBgINC3AFc9P3kqEPfY=;
 b=IL4BxIWVkbgjozh8pyu59eUNZoYCsRxcoX9jcmSXkrX6RP+zFcp5HFQrlD3uBNVEiP
 LvuBWuQAEBZN20CzSjE8u6TjIZU1B4gau5IfQTqCw6vQ3BmjxTu/+HVEAJO6fKK//MrR
 JkQ6Uto1eSdpCUOXg1C8/SNW2pN1+UK8MzNq8G3NHIIzwa4/U1IF2SMmNy43+ZwZ6s5J
 8t9DrDotDulXrbrEEzgUQpjtbNY12TKcffzDF7TvYlcKT0nciyPGhoRp20uzoTd0f/Wo
 BQdAfTTTGNn8wkiBxN84EkUbpxJTFsoeI97ENMhxnDeok1UKYslRjDBdB2SntLeAMqYq
 ZmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YD8Dvuo5pUfHRMo8RpEeRFbdBBgINC3AFc9P3kqEPfY=;
 b=MAFFSG5pQ6+oYKtByml5FWSNkIf8d6KW6ExKzarnT0E3iRbEpej7Ovs4mxKrshda8l
 2vCYvpJZfTB13EqnENYDwVfolZWpA2GrwErkF3HD8ZPbY89RCFrIYNmgrWslDPuR4Hft
 aIeFHV4szHI3ni92gJUvZ7Ig6WqFp9oA9Cyd/Lj7JAMFikyACaMNUoj2bb1EsDmOUJDZ
 KZQGvH3U8IdMerUuEFZ9CwSuSTZspCmKqxN8d6vNyZvZY1LVDS2rf/6K4LCPVR+bZSgV
 80pyt/b1t/JvCkG4JhpJlEHALIUhbXFoZ73y3qiYTnhkkNW68HaY3msWxCXh+UePskgH
 0wSw==
X-Gm-Message-State: AOAM531yQJ/l6k1Fk9Q0pQRFdKPTOxoOKG+UuPOU16Rl5K4FdjawfLep
 SPUeyPUWzTMgEtVWWjRwQda7odbWA6///A==
X-Received: by 2002:adf:80a3:: with SMTP id 32mr4472357wrl.199.1589552459820; 
 Fri, 15 May 2020 07:20:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s14sm3738327wmh.18.2020.05.15.07.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 07:20:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 01/10] target/arm: Remove unused GEN_NEON_INTEGER_OP macro
Date: Fri, 15 May 2020 15:20:47 +0100
Message-Id: <20200515142056.21346-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200515142056.21346-1-peter.maydell@linaro.org>
References: <20200515142056.21346-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zWI45CjzKsYT

The GEN_NEON_INTEGER_OP macro is no longer used; remove it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Between Richard's cleanup and mine we deleted all the uses of this,
but since neither series on its own was sufficient to delete all
of them we failed to remove the macro definition when it finally
became unused.
---
 target/arm/translate.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4c9bb8b5ac0..c8296116d4b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3034,29 +3034,6 @@ static inline void gen_neon_rsb(int size, TCGv_i32 t0, TCGv_i32 t1)
     default: return 1; \
     }} while (0)
 
-#define GEN_NEON_INTEGER_OP(name) do { \
-    switch ((size << 1) | u) { \
-    case 0: \
-        gen_helper_neon_##name##_s8(tmp, tmp, tmp2); \
-        break; \
-    case 1: \
-        gen_helper_neon_##name##_u8(tmp, tmp, tmp2); \
-        break; \
-    case 2: \
-        gen_helper_neon_##name##_s16(tmp, tmp, tmp2); \
-        break; \
-    case 3: \
-        gen_helper_neon_##name##_u16(tmp, tmp, tmp2); \
-        break; \
-    case 4: \
-        gen_helper_neon_##name##_s32(tmp, tmp, tmp2); \
-        break; \
-    case 5: \
-        gen_helper_neon_##name##_u32(tmp, tmp, tmp2); \
-        break; \
-    default: return 1; \
-    }} while (0)
-
 static TCGv_i32 neon_load_scratch(int scratch)
 {
     TCGv_i32 tmp = tcg_temp_new_i32();
-- 
2.20.1

