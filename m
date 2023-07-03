Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2171664ejy;
        Mon, 3 Jul 2023 03:08:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4yxegVWZ8ApPUqPUaX3mfiuv0+MMtk1c7Q6kzncRO1VwpXSrTP7OR6vtrsjp/78sOIcqUJ
X-Received: by 2002:ac8:5bd1:0:b0:403:399b:c7e6 with SMTP id b17-20020ac85bd1000000b00403399bc7e6mr11956586qtb.23.1688378899773;
        Mon, 03 Jul 2023 03:08:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688378899; cv=none;
        d=google.com; s=arc-20160816;
        b=uIVhDmHlTTBpi4X3L/P1Ur3ifbTSlrBCtTcMmvCOSDO/M/sRME+Z6iFcZTciENhdSi
         NIzJj0Un3nNmeYXktcXAeeN09DvNorvhWxeoFbbjTv/xkfmJ7JwAtg4iNDQl9GcTy0bX
         WP5wI39Yxu7+bVKPnlYPze6QeFzwN+f5qFOgOLbvVYyjC9Ii9+ZCp+2uTJCIdY8NZRkO
         DT2559VmmMHCe9Xo5TAbqXHnbfecVGOhuiR8cm9cdZDZkn+1I9ERgfKlS7QYIQWJSaal
         vrAWazX1hCzoiL2FfSjKkIBJV7k8Ho4YRWzppYFPZMdnS8lBzi4ytQL28IEqp2tbKo//
         M4JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OqJ8/74xslZqAPWuseMNlVx/dmpNm7/AQh+6yi6QQ/Q=;
        fh=yGBgCIAdw0xhdK58ttTTG5yX3hLvrsJsvO63zqD4x2E=;
        b=kfPCgYnxvKJpS61eT1g6KTudumUE4/bWwxsw51E61ImOT1aUbeMqRPf4IQ/6jKtoF3
         Ju2NssabeCDLR3sW8xNc+yec/RSridwEH1HO+TTTNhE71VtU4zuGMnw1fbbtlxKzfZsU
         jCGZX4oV/aHNNLWeSldgcMa+1RzLwQs9beVptowEvi9OFwRUxfvuAL58n/5Di5QCBNdf
         t8vxTrEzPA28xgPqM6fzppi/G8B34oWLwdr77mI0+AuT4S6/ksHXl3tslIHMw3qzzM0B
         Viigq1eWGQH9rBg8rqdpL3Ec6gP9lYeGSXL9kzsalA923c+pPH/eKrq8jc/jHHhzbHnx
         GTQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C8o2rooR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2-20020ac85b02000000b003ff1fe3856dsi5177242qtw.138.2023.07.03.03.08.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jul 2023 03:08:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C8o2rooR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGGRj-0003BC-2W; Mon, 03 Jul 2023 06:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRS-0002qZ-D1
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:06:01 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRG-0005jr-HF
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:05:58 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fba545d743so56884845e9.0
 for <qemu-arm@nongnu.org>; Mon, 03 Jul 2023 03:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688378729; x=1690970729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OqJ8/74xslZqAPWuseMNlVx/dmpNm7/AQh+6yi6QQ/Q=;
 b=C8o2rooRPqQYMAWpKdzFYgDoGcjTrndOODJvpVXvshPlKOSycu6pVsWJ3hUshe5zNB
 X3vRUPViH+aYGGNiLrKBvszBjwG4/dBDeoYDwPZ9+VR1+K3DvBeTQEVs2BgybxDlPyeA
 dW8MyjnctCnOyC4OCq7jhnp3a+O08BbuKy9ma0q/jSydm3TXihqq9o4eVNuCGpWpmRF1
 L0joFKggtGGXGIWEhfj1/oMHz3YYIaoFEkYn7Z6JWxWyGVGcHOKIc4BmglTiGiYd3/NE
 zg2ConM7Q7BSUdaquv3U2oBtltdUof3YOZMqdfmCSJ7qflASPwydkMH5bsj4Wq5KQUEl
 1fnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688378729; x=1690970729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OqJ8/74xslZqAPWuseMNlVx/dmpNm7/AQh+6yi6QQ/Q=;
 b=e7H4aAIDyhCT4DyLU8j0DeD0+VBsR46y7yZ07NekYGqPqhMTTjCOo7UrZXAXTqYz/d
 3O7hTyUREB13rfMI9WKC972y6+q4t7E5IqB9oV+oy5MURdD0MlCc3LJ6BwT+NIv04OQ/
 CmTHYvT7FCx6ED6IFGRjscN/YYGWeRrv3dlI2ZY6fLVxi72/IUwPOrntZRGm9vsD7k1A
 nT95xQRmaJJZ0JEO/bVJXHKgCaextcZFroNMR+3rRLZy9UjfGkypErF/P6vZGRM2TIha
 GWvttwcGpgOGJBXbw8/GCC+Fewi7BL5u+juGncesgLOOSag5MiB7vBAMUhITd+O/hnXu
 a29w==
X-Gm-Message-State: AC+VfDwgTF9ZsU9uqKRL2cnaL1seHpLeYZ9LmxxWrO2EWoJCznYl46XK
 jWi0AKsPlEsB5tzjcyhzAkq2Rg==
X-Received: by 2002:a1c:6a07:0:b0:3fa:934c:8356 with SMTP id
 f7-20020a1c6a07000000b003fa934c8356mr9003317wmc.10.1688378729553; 
 Mon, 03 Jul 2023 03:05:29 -0700 (PDT)
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:05:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v4 07/37] crypto: Add aesenc_MC
Date: Mon,  3 Jul 2023 12:04:50 +0200
Message-Id: <20230703100520.68224-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: mtfeJkYEELn2

Add a primitive for MixColumns.

Acked-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/generic/host/crypto/aes-round.h |  2 +
 include/crypto/aes-round.h                   | 18 ++++++
 crypto/aes.c                                 | 61 ++++++++++++++++++++
 3 files changed, 81 insertions(+)

diff --git a/host/include/generic/host/crypto/aes-round.h b/host/include/generic/host/crypto/aes-round.h
index c9b9d732f0..1b82afc629 100644
--- a/host/include/generic/host/crypto/aes-round.h
+++ b/host/include/generic/host/crypto/aes-round.h
@@ -9,6 +9,8 @@
 #define HAVE_AES_ACCEL  false
 #define ATTR_AES_ACCEL
 
+void aesenc_MC_accel(AESState *, const AESState *, bool)
+    QEMU_ERROR("unsupported accel");
 void aesenc_SB_SR_AK_accel(AESState *, const AESState *,
                            const AESState *, bool)
     QEMU_ERROR("unsupported accel");
diff --git a/include/crypto/aes-round.h b/include/crypto/aes-round.h
index dcf098b97b..7d2be40a67 100644
--- a/include/crypto/aes-round.h
+++ b/include/crypto/aes-round.h
@@ -20,6 +20,24 @@ typedef union {
 
 #include "host/crypto/aes-round.h"
 
+/*
+ * Perform MixColumns.
+ */
+
+void aesenc_MC_gen(AESState *ret, const AESState *st);
+void aesenc_MC_genrev(AESState *ret, const AESState *st);
+
+static inline void aesenc_MC(AESState *r, const AESState *st, bool be)
+{
+    if (HAVE_AES_ACCEL) {
+        aesenc_MC_accel(r, st, be);
+    } else if (HOST_BIG_ENDIAN == be) {
+        aesenc_MC_gen(r, st);
+    } else {
+        aesenc_MC_genrev(r, st);
+    }
+}
+
 /*
  * Perform SubBytes + ShiftRows + AddRoundKey.
  */
diff --git a/crypto/aes.c b/crypto/aes.c
index 90274c3706..ec300cda0c 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -28,6 +28,8 @@
  * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 #include "qemu/osdep.h"
+#include "qemu/bswap.h"
+#include "qemu/bitops.h"
 #include "crypto/aes.h"
 #include "crypto/aes-round.h"
 
@@ -1216,6 +1218,65 @@ static const u32 rcon[] = {
         0x1B000000, 0x36000000, /* for 128-bit blocks, Rijndael never uses more than 10 rcon values */
 };
 
+/*
+ * Perform MixColumns.
+ */
+static inline void
+aesenc_MC_swap(AESState *r, const AESState *st, bool swap)
+{
+    int swap_b = swap * 0xf;
+    int swap_w = swap * 0x3;
+    bool be = HOST_BIG_ENDIAN ^ swap;
+    uint32_t t;
+
+    /* Note that AES_mc_rot is encoded for little-endian. */
+    t = (      AES_mc_rot[st->b[swap_b ^ 0x0]] ^
+         rol32(AES_mc_rot[st->b[swap_b ^ 0x1]], 8) ^
+         rol32(AES_mc_rot[st->b[swap_b ^ 0x2]], 16) ^
+         rol32(AES_mc_rot[st->b[swap_b ^ 0x3]], 24));
+    if (be) {
+        t = bswap32(t);
+    }
+    r->w[swap_w ^ 0] = t;
+
+    t = (      AES_mc_rot[st->b[swap_b ^ 0x4]] ^
+         rol32(AES_mc_rot[st->b[swap_b ^ 0x5]], 8) ^
+         rol32(AES_mc_rot[st->b[swap_b ^ 0x6]], 16) ^
+         rol32(AES_mc_rot[st->b[swap_b ^ 0x7]], 24));
+    if (be) {
+        t = bswap32(t);
+    }
+    r->w[swap_w ^ 1] = t;
+
+    t = (      AES_mc_rot[st->b[swap_b ^ 0x8]] ^
+         rol32(AES_mc_rot[st->b[swap_b ^ 0x9]], 8) ^
+         rol32(AES_mc_rot[st->b[swap_b ^ 0xA]], 16) ^
+         rol32(AES_mc_rot[st->b[swap_b ^ 0xB]], 24));
+    if (be) {
+        t = bswap32(t);
+    }
+    r->w[swap_w ^ 2] = t;
+
+    t = (      AES_mc_rot[st->b[swap_b ^ 0xC]] ^
+         rol32(AES_mc_rot[st->b[swap_b ^ 0xD]], 8) ^
+         rol32(AES_mc_rot[st->b[swap_b ^ 0xE]], 16) ^
+         rol32(AES_mc_rot[st->b[swap_b ^ 0xF]], 24));
+    if (be) {
+        t = bswap32(t);
+    }
+    r->w[swap_w ^ 3] = t;
+}
+
+void aesenc_MC_gen(AESState *r, const AESState *st)
+{
+    aesenc_MC_swap(r, st, false);
+}
+
+void aesenc_MC_genrev(AESState *r, const AESState *st)
+{
+    aesenc_MC_swap(r, st, true);
+}
+
 /*
  * Perform SubBytes + ShiftRows + AddRoundKey.
  */
-- 
2.34.1

