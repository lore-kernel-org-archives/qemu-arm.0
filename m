Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2899247ejm;
        Mon, 24 Apr 2023 08:40:04 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZB51bsBhTbLLsOPUKnTNqjSmOGcUsyBikFnoMThHQXfceFnDESfMaFKLRanSk5zgEOwtMv
X-Received: by 2002:ad4:5f0d:0:b0:5ef:4a4b:cdd7 with SMTP id fo13-20020ad45f0d000000b005ef4a4bcdd7mr28547669qvb.16.1682350804599;
        Mon, 24 Apr 2023 08:40:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682350804; cv=none;
        d=google.com; s=arc-20160816;
        b=o1a9JTBW81W8C5jo8rEO/WIyJlU/vXWz84EqVSgYHTYqtdoKd4S4IeezTdP3/95jUS
         353uppMKyrUTkIkhZp6/qzZTsusV0IzFCeyQ9lHX1whA1k6DtLrva6FSgcLmteIAhuH+
         CxNSNuVrtsx//WCN2yEx1/RicDSYYz8Szq9Q/jRPBU2Z++MYBsmXVWYvU4xhzHxVvIum
         hH/ukIb5nq+f26hxGekIHQkCvZqB44RMPSYfyshlztWHL9+znK4BFakp6XeHWoOjeEQO
         /OVBMwtPenCNbDM1UGcbGFfZJL4vl/fAOmlSJ3XflbmvsXHKLpC//kJ36jtDf54ANXBM
         vooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jPHvum9pg5ew6ondz5ZuZU1I3DpYSbO9f6BzlFBLlvg=;
        b=noSBqwPV4Iifh41G9nlL7SetA2Jkbh64ImUQxAFJW9Mnwe4azCQMe94fordN+eaLSW
         5Jmt7HpbzXLeHyBhe+TIBJ0QXlCmlBn8r1D5ZJ6DiySXJhvlt5Wlh0nCuE4qLwsma68k
         LCvXxFEOiSUupw0BFCPfpyIhn2aiWXCKy86TenDMfX/iR5jKsnAadFbjslHlrhlQ9iGn
         c9Ku8wwI5L4/HuaOdQtPkpulvoDanBaFrMo9UmP3CP5e5XiFk6lzU8hLQtDbRpb3MpmN
         o04ddWA5IOgm/l4Pq9vHKgTvEc2YeNGsxRCc9hn7ebl7vnx2vFDabmJiCMhO52dwagOb
         Fo1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nz70+VJD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020ac8590e000000b003ef40f82fe6si1615114qty.506.2023.04.24.08.40.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Apr 2023 08:40:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nz70+VJD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqyHo-0007Ae-Nj; Mon, 24 Apr 2023 11:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqyHl-00078U-Ix
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 11:39:25 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqyHf-0001UG-MW
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 11:39:25 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-2fa47de5b04so4449661f8f.1
 for <qemu-arm@nongnu.org>; Mon, 24 Apr 2023 08:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682350752; x=1684942752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jPHvum9pg5ew6ondz5ZuZU1I3DpYSbO9f6BzlFBLlvg=;
 b=Nz70+VJD5dFtTdK0a8YWflKK3pfEpYdEuIAOuyYVfaJhBuzU9jQ/2uBizKHKj++wxF
 FrznW2eQh/ms2Ft0A5267n8y6jc4f8Gr/e9KpYwUkcodyGFLp1s4l8XgFZSzmuDsbE0e
 2NODMsIYYixPyQF2OB/YwkL6qJUcP+Mj7RwSA2C78RMMjDQO10yA+f/I5mYbC0ccPfR9
 ZHMR/Bb9TDbcjNWzaR3bT2C3k4+ffMRw66NGn0xPSHNcWfIr1rawmWfZy+7X+XK5MsuA
 ZZJXhzcpZEBFHGOhVZpKYbgZxjOQlo4LWNFHYNOQ+M1pTKbqg7i1OYp7ZKrnc7Obo6IG
 U0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682350752; x=1684942752;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jPHvum9pg5ew6ondz5ZuZU1I3DpYSbO9f6BzlFBLlvg=;
 b=UkzuckPZSf6dcdT2DDuFvSusrJ/jXfYlmCUAbdn8dW1EwFD05en6NF4QIDZjurUXuN
 X4K/wzUdL3GAIU0Q0dzIdbA7Xx4X9frmqcWYTdbOoF4PKO2xhdFPlN0LN3Wx00gW+rgW
 pQVOJAy+Tw/VNsCS8BOkelbZ7JQMAGXvGRLF4X5p0Q0FcftkY43wVRkCP2UgH658Unl9
 qgOk0IshCnhU0751W1xMUqG3U09l1dYww3XJPC5/7jvQuh4IHQf2xucNRfv569uoV0rJ
 MIs61WYEmic05bVHQCPhz+N3DJvhd+7dnyEjbDW5Ra8su4nWaI027LccUQ69G4ncfjlX
 FbqQ==
X-Gm-Message-State: AAQBX9dzYsTfoGoyFe+v+yBNdZ9Dxko3qBTAgLYl3gd7s3NQeONynfyc
 YgrJ8e76gdHx8sQyNlzLqU8alsFaOI4DOnljkic=
X-Received: by 2002:a5d:5485:0:b0:303:7457:d7aa with SMTP id
 h5-20020a5d5485000000b003037457d7aamr7147032wrv.15.1682350752053; 
 Mon, 24 Apr 2023 08:39:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f3-20020adfdb43000000b002efb2d861dasm11041241wrj.77.2023.04.24.08.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 08:39:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH 2/2] target/arm: Add compile time asserts to
 load/store_cpu_field macros
Date: Mon, 24 Apr 2023 16:39:09 +0100
Message-Id: <20230424153909.1419369-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424153909.1419369-1-peter.maydell@linaro.org>
References: <20230424153909.1419369-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
X-TUID: Iv2GgsPEWEkU

Add some compile-time asserts to the load_cpu_field() and store_cpu_field()
macros that the struct field being accessed is the expected size. This
lets us catch cases where we incorrectly tried to do a 32-bit load
from a 64-bit struct field.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a32.h | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index 067044292a4..c2bc3ab8567 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -59,7 +59,12 @@ static inline TCGv_i32 load_cpu_offset(int offset)
     return tmp;
 }
 
-#define load_cpu_field(name) load_cpu_offset(offsetof(CPUARMState, name))
+/* Load from a 32-bit field to a TCGv_i32 */
+#define load_cpu_field(name)                                             \
+    ({                                                                   \
+        QEMU_BUILD_BUG_ON(sizeof(typeof_field(CPUARMState, name)) != 4); \
+        load_cpu_offset(offsetof(CPUARMState, name));                    \
+    })
 
 /* Load from the low half of a 64-bit field to a TCGv_i32 */
 #define load_cpu_field_low32(name)                                       \
@@ -70,9 +75,13 @@ static inline TCGv_i32 load_cpu_offset(int offset)
 
 void store_cpu_offset(TCGv_i32 var, int offset, int size);
 
-#define store_cpu_field(var, name)                              \
-    store_cpu_offset(var, offsetof(CPUARMState, name),          \
-                     sizeof_field(CPUARMState, name))
+#define store_cpu_field(val, name)                                      \
+    ({                                                                  \
+        QEMU_BUILD_BUG_ON(sizeof(typeof_field(CPUARMState, name)) != 4  \
+                          && sizeof(typeof_field(CPUARMState, name)) != 1); \
+        store_cpu_offset(val, offsetof(CPUARMState, name),              \
+                         sizeof_field(CPUARMState, name));              \
+    })
 
 #define store_cpu_field_constant(val, name) \
     store_cpu_field(tcg_constant_i32(val), name)
-- 
2.34.1

