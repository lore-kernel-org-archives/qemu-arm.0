Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2174044ejy;
        Mon, 3 Jul 2023 03:13:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4JQYTkQwIbtQkAD1dIqq7VMt1RW7WS8MQhJ0QF/GDp69/euQVZPV0b8lSVMD+xKD0fPoYM
X-Received: by 2002:a05:620a:8e13:b0:767:1b8e:811e with SMTP id re19-20020a05620a8e1300b007671b8e811emr8164783qkn.17.1688379210053;
        Mon, 03 Jul 2023 03:13:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688379210; cv=none;
        d=google.com; s=arc-20160816;
        b=BQV7mVniL9eMuPFzy/cGRWRwCYSjaV7S1WKfT2A+y1eVpMvp98YgoLKPomWEe3NhXd
         Kgl8qqfWp7dnJZQvCfRcsAGI+8J+tFpSchEubETLU5eJwMJQu4JwONcfIIovOrF3dBZl
         U1DG8QbO13XUwKtJsnZPLJvVC2PGWl/ADYu+28Rqmp99tstmVqFoZJM+DubZiXC9i2gw
         YcK2cSBjzpHw0DV5XLUnAbh2sCq3y7KBMrO8b+S7WRGghUBLBX18SAVK2rTmFWqYYNeo
         GSHai/WR6NLuruenTynq0MO0gTcLDvx5SIm7Z7mjtDoILjnnbXp78D9OuDeHQI8frE1W
         BGAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/QBtvBQSI1Tt7HA/Hos/l3dVZOAq+hVRSg1lIqyT39k=;
        fh=QgDoIuhvPgc2IEOs0IRGDFwvtZaiTfC8q6Rpekinx9Q=;
        b=uWUcioIss1+KUoNG4Hr40VCxdaNkfD3EUxOwGJhyAkALNyy9nNssHpCFCP6eEI4Iug
         8DqwpFW8jqL9i9pAEKzYvIs22+t637I/4qzJdEDjPwGODMBLNwYM09nD75ImEuCziOrl
         1QNSS+kaoFyJh8yeR+7hV7PlwY8X7bEt0BMoRuqdW5+/oNXXZJPAmhewmLzDZEna1XZs
         SlL+oLMOUq3ZgTaMgJm+RvzgPQGP1ljbdAvqXYhAglHFYqnCd9syAVmbodHKjy/yIp+2
         dRT5P7BiF+e54hp8pKVBVijeogU9SO9/hvAZkdizaLJX/VcNWwk4ApN6OjwRtF/+p1gu
         Rgyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AhmLxzxS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qz4-20020a05620a8c0400b00766b22110absi9833627qkn.750.2023.07.03.03.13.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jul 2023 03:13:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AhmLxzxS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGGRH-0002d9-Ng; Mon, 03 Jul 2023 06:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRF-0002aq-G3
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:05:45 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGR7-0005nA-5j
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:05:41 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fba8e2aa52so51011375e9.1
 for <qemu-arm@nongnu.org>; Mon, 03 Jul 2023 03:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688378734; x=1690970734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/QBtvBQSI1Tt7HA/Hos/l3dVZOAq+hVRSg1lIqyT39k=;
 b=AhmLxzxSb4U5V2xacDX4rGa7xUh+9bH+lkN7yFR9dlOsxxS1YM1kHxK4I3oG/w6G1K
 35g9uv79cI5/mBMaD8MpNMWGssZcEW69AxBYw1s5St9HqAHykxL2I9T+qiEM2YUV5CAp
 7QjWM2b7QmoQj8k8ke4TO0WFn3aSd0ZOjv7sNoobK+UwN4SmTvXN5Pap8FeIxg048ji5
 iXokiEeEZuCXQR6j2RMRbAvSxtPRJPqm0YprxWkSDba1Rfd2Q6OGCs3ajuez6AnUNv+g
 1mMJ/L+A2SimQw8TQwl1qi7+Yo5cRjboPpUnAgodCEscpOdbJxYxrYnkF0PxlhCBiAMs
 ii8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688378734; x=1690970734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/QBtvBQSI1Tt7HA/Hos/l3dVZOAq+hVRSg1lIqyT39k=;
 b=eOCKB8RxH94VU8sb6MvsiCVLX8swaTkfci/o1pUkCZVeWidB2l02qt4LfhULClU9El
 9yTTIeaZULtDy2D5XZKSmnIo/GRqe6nT1Wwl8J094jcA+CDME9lqROC4e+Ffsh7fPaOy
 EKlPYvFtL0M46XXuYpuSiLQZfe6Tu+AVHP3uUK2tiSGGJy2IWdv910KAuamtIK2ZjUTn
 Qko1fNtEEc6OvENUoU3y+kaWsDpY8xmz7Q9m2W8kYeuDnLvETNm0ZkZovP3cHJ8SEzHs
 pcjdsz75jXqnEAsmELxCq38R1UUhq6jMdWBcSELGGQ+LRWPr9L8Iy3hZl1dj+wesyBLI
 BTWw==
X-Gm-Message-State: AC+VfDwEEzeYW+UZWDvCxFWXEb/TuhEW2G/GW9InRJhBI3ctaesHMMIU
 7DZHcIFlrs2XOC722c6tlc8KPA==
X-Received: by 2002:a7b:cc87:0:b0:3fb:a917:b769 with SMTP id
 p7-20020a7bcc87000000b003fba917b769mr8537659wma.21.1688378733988; 
 Mon, 03 Jul 2023 03:05:33 -0700 (PDT)
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:05:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 11/37] crypto: Add aesdec_ISB_ISR_AK_IMC
Date: Mon,  3 Jul 2023 12:04:54 +0200
Message-Id: <20230703100520.68224-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: CyAwCe0PBygJ

Add a primitive for InvSubBytes + InvShiftRows +
AddRoundKey + InvMixColumns.

Acked-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/generic/host/crypto/aes-round.h |  3 +++
 include/crypto/aes-round.h                   | 21 ++++++++++++++++++++
 crypto/aes.c                                 | 14 +++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/host/include/generic/host/crypto/aes-round.h b/host/include/generic/host/crypto/aes-round.h
index db8cfe17eb..1b9720f917 100644
--- a/host/include/generic/host/crypto/aes-round.h
+++ b/host/include/generic/host/crypto/aes-round.h
@@ -23,6 +23,9 @@ void aesdec_IMC_accel(AESState *, const AESState *, bool)
 void aesdec_ISB_ISR_AK_accel(AESState *, const AESState *,
                              const AESState *, bool)
     QEMU_ERROR("unsupported accel");
+void aesdec_ISB_ISR_AK_IMC_accel(AESState *, const AESState *,
+                                 const AESState *, bool)
+    QEMU_ERROR("unsupported accel");
 void aesdec_ISB_ISR_IMC_AK_accel(AESState *, const AESState *,
                                  const AESState *, bool)
     QEMU_ERROR("unsupported accel");
diff --git a/include/crypto/aes-round.h b/include/crypto/aes-round.h
index 9996f1c219..854fb0966a 100644
--- a/include/crypto/aes-round.h
+++ b/include/crypto/aes-round.h
@@ -119,6 +119,27 @@ static inline void aesdec_ISB_ISR_AK(AESState *r, const AESState *st,
     }
 }
 
+/*
+ * Perform InvSubBytes + InvShiftRows + AddRoundKey + InvMixColumns.
+ */
+
+void aesdec_ISB_ISR_AK_IMC_gen(AESState *ret, const AESState *st,
+                               const AESState *rk);
+void aesdec_ISB_ISR_AK_IMC_genrev(AESState *ret, const AESState *st,
+                                  const AESState *rk);
+
+static inline void aesdec_ISB_ISR_AK_IMC(AESState *r, const AESState *st,
+                                         const AESState *rk, bool be)
+{
+    if (HAVE_AES_ACCEL) {
+        aesdec_ISB_ISR_AK_IMC_accel(r, st, rk, be);
+    } else if (HOST_BIG_ENDIAN == be) {
+        aesdec_ISB_ISR_AK_IMC_gen(r, st, rk);
+    } else {
+        aesdec_ISB_ISR_AK_IMC_genrev(r, st, rk);
+    }
+}
+
 /*
  * Perform InvSubBytes + InvShiftRows + InvMixColumns + AddRoundKey.
  */
diff --git a/crypto/aes.c b/crypto/aes.c
index c2546ef12e..c765f11c1e 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -1542,6 +1542,20 @@ void aesdec_ISB_ISR_IMC_AK_genrev(AESState *r, const AESState *st,
     aesdec_ISB_ISR_IMC_AK_swap(r, st, rk, true);
 }
 
+void aesdec_ISB_ISR_AK_IMC_gen(AESState *ret, const AESState *st,
+                               const AESState *rk)
+{
+    aesdec_ISB_ISR_AK_gen(ret, st, rk);
+    aesdec_IMC_gen(ret, ret);
+}
+
+void aesdec_ISB_ISR_AK_IMC_genrev(AESState *ret, const AESState *st,
+                                  const AESState *rk)
+{
+    aesdec_ISB_ISR_AK_genrev(ret, st, rk);
+    aesdec_IMC_genrev(ret, ret);
+}
+
 /**
  * Expand the cipher key into the encryption key schedule.
  */
-- 
2.34.1

