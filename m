Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2803488lfm;
        Tue, 16 Jun 2020 10:14:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzE2Gracq8ouhDE3rb766EeaiJVTZ7nntXOoRPHNWfADCfrf8qH8un5syQxrpw8MP1bc2o
X-Received: by 2002:a25:cd8a:: with SMTP id d132mr5557471ybf.443.1592327682512;
        Tue, 16 Jun 2020 10:14:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592327682; cv=none;
        d=google.com; s=arc-20160816;
        b=VOXkuUg4ChV3f8fdY/AXpGQX/k5wGOwTNwlm0sUq9QmlMX5eeas+YCoqJV7M1xBWcQ
         /ADDJcoQNjBKNjBuJiTTpOzCvSai0xN6yNkrxGzQYfKOylpLv1kqfr57BepdgOBrR3xL
         zpXRmYDmvMijQMDqjX2fjYCBw2okk6k7a2hJSCCHy+YjsyeQ6LfM+YYj7bokwipXN0ZC
         F/EtzK0HELWtQ/4UL4jfRPMrtLLrHdtVcDwRzJxeMeSfiJvz9I55z0eL1WJTHNm3+c9O
         DBW4vINNWHGlQXagWxdRrwzY+k80o3hu8b7jOHEobgbw9ZtxorfcC7aCB2WTZjCWEEeL
         uOlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Q+0uZHHdicr4FHXDVL/N22V2qnJh66s6U25qsKc1zpA=;
        b=eMC00TvUFR0bCuTpNyeLemXQJmeHbfUDY6OzROvVlGBHRwZRFUEgkUhF6G6z28kw0P
         9DmqvnHdEB2PPn7GwT2dPxj7jLDuTVM5296JdgArtxI/8ifcnj901w2ht5sl5APNTW7r
         u9DPaoHL3Bd5OR4Ql6suDG/dwf8Pxa9jd2JalsAuRoQS8kdZ4sOJKpo6S5jds2DtC+KG
         xSLxEeoQB0RTiWqpD6FRyp/CsrZCZvOUe6FiDNR33aGCXWH2qawVir0mlIPkSK2X6I0h
         xj3gp7JOzDuwZp3v/cZgrlHKMn6szGPo/sVbT6BOHIjN2nwdinqsxwvkZoRN+tjjHCom
         6ZsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="P4//LCdp";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x138si15864590ybg.413.2020.06.16.10.14.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 10:14:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="P4//LCdp";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlFAX-0007eC-Tl
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 13:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlF5B-0001c3-1k
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 13:09:09 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:40851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlF59-0007W6-6j
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 13:09:08 -0400
Received: by mail-wr1-x443.google.com with SMTP id h5so21591884wrc.7
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2020 10:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q+0uZHHdicr4FHXDVL/N22V2qnJh66s6U25qsKc1zpA=;
 b=P4//LCdpdE9XCKe56D5wKz06ioLvBJCQMZNlJg6Ac1VLLt7iLP7jGbEqovNw44Zi0L
 QCfZaemXs8gYIU4IBAuxtig5RTyIdJKoAoBzxsoqCb38pBlRjAGYgqbuUivDJ9b/5lWw
 ytmLfcVptE5Xk2PmIOvoFxJG7VRxJklD+zGGOme26i1CuP95gQJhaaRk1UX6GA2KYNKH
 C2Bzx2dsC3vJ1xSjqjMqNnk9hkBt1T0mC9W8PLgLIXMgNxouc8uLeSnR0u0+v9mlhwXy
 Eyi9i4BthXf50oiL/9y3YtyAPjQBfCkCQZtrcyRPLuWcdSfrLdyX8CfH5Bl6NyIDcSME
 RPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q+0uZHHdicr4FHXDVL/N22V2qnJh66s6U25qsKc1zpA=;
 b=VP5FxBGpzBJyvowg/gU1MsuQ2jvFrfhlFLv4aexqoylOO0Y8Qi/lt4HAhf8Lhbu2Mi
 j/fdJSkwEJrhUHLI0J4mlBmH/YE0ZKG53BcFtZykyiXbhoH9N2GrqXKbzpPgvgDyE5Vk
 /2HLmOmpHGZPwKZbB4j3j1mIpxn9EZ0KC5jHVwKxi3vbB39jE9PmrLaYDlWBJ1XH+bX3
 g0IhYH459zLpLUGVMnzu0eruJU2oM611HtLb25Bbgr3KL7JZS3Fadd8pfUXqf+6jkXmu
 koTv8vSgs1UVGggJvJtmQYpagepopFuIGbC/Bx0+oTl9vVsAXwY+74nZxuaNlNNpXnrh
 KVXg==
X-Gm-Message-State: AOAM532GRP7mBZbmsfZUgvZpaTtTGpQG2cSjigzA+xGiHBCxUjI1KnD0
 dsldooEGYfZWVj7qvU5Xm+vxlquQUprRCg==
X-Received: by 2002:adf:a18b:: with SMTP id u11mr4046191wru.102.1592327345499; 
 Tue, 16 Jun 2020 10:09:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y80sm5263216wmc.34.2020.06.16.10.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 10:09:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 14/21] target/arm: Convert Neon VQABS, VQNEG to decodetree
Date: Tue, 16 Jun 2020 18:08:37 +0100
Message-Id: <20200616170844.13318-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200616170844.13318-1-peter.maydell@linaro.org>
References: <20200616170844.13318-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: 6fBCzHcXk4F0

Convert the Neon VQABS and VQNEG insns to decodetree.
Since these are the only ones which need cpu_env passing to
the helper, we wrap the helper rather than creating a whole
new do_2misc_env() function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/neon-dp.decode       |  3 +++
 target/arm/translate-neon.inc.c | 35 +++++++++++++++++++++++++++++++++
 target/arm/translate.c          | 30 ++--------------------------
 3 files changed, 40 insertions(+), 28 deletions(-)

diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index f947f7d09f0..f0bb34a49eb 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -465,6 +465,9 @@ Vimm_1r          1111 001 . 1 . 000 ... .... cmode:4 0 . op:1 1 .... @1reg_imm
     VPADAL_S     1111 001 11 . 11 .. 00 .... 0 1100 . . 0 .... @2misc
     VPADAL_U     1111 001 11 . 11 .. 00 .... 0 1101 . . 0 .... @2misc
 
+    VQABS        1111 001 11 . 11 .. 00 .... 0 1110 . . 0 .... @2misc
+    VQNEG        1111 001 11 . 11 .. 00 .... 0 1111 . . 0 .... @2misc
+
     VCGT0        1111 001 11 . 11 .. 01 .... 0 0000 . . 0 .... @2misc
     VCGE0        1111 001 11 . 11 .. 01 .... 0 0001 . . 0 .... @2misc
     VCEQ0        1111 001 11 . 11 .. 01 .... 0 0010 . . 0 .... @2misc
diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 336c2b312eb..2b5dc86f628 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -3671,3 +3671,38 @@ static bool trans_VRSQRTE(DisasContext *s, arg_2misc *a)
     }
     return do_2misc(s, a, gen_helper_rsqrte_u32);
 }
+
+#define WRAP_1OP_ENV_FN(WRAPNAME, FUNC) \
+    static void WRAPNAME(TCGv_i32 d, TCGv_i32 m)        \
+    {                                                   \
+        FUNC(d, cpu_env, m);                            \
+    }
+
+WRAP_1OP_ENV_FN(gen_VQABS_s8, gen_helper_neon_qabs_s8)
+WRAP_1OP_ENV_FN(gen_VQABS_s16, gen_helper_neon_qabs_s16)
+WRAP_1OP_ENV_FN(gen_VQABS_s32, gen_helper_neon_qabs_s32)
+WRAP_1OP_ENV_FN(gen_VQNEG_s8, gen_helper_neon_qneg_s8)
+WRAP_1OP_ENV_FN(gen_VQNEG_s16, gen_helper_neon_qneg_s16)
+WRAP_1OP_ENV_FN(gen_VQNEG_s32, gen_helper_neon_qneg_s32)
+
+static bool trans_VQABS(DisasContext *s, arg_2misc *a)
+{
+    static NeonGenOneOpFn * const fn[] = {
+        gen_VQABS_s8,
+        gen_VQABS_s16,
+        gen_VQABS_s32,
+        NULL,
+    };
+    return do_2misc(s, a, fn[a->size]);
+}
+
+static bool trans_VQNEG(DisasContext *s, arg_2misc *a)
+{
+    static NeonGenOneOpFn * const fn[] = {
+        gen_VQNEG_s8,
+        gen_VQNEG_s16,
+        gen_VQNEG_s32,
+        NULL,
+    };
+    return do_2misc(s, a, fn[a->size]);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 17373743889..3cbd2ab0c96 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4945,6 +4945,8 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                 case NEON_2RM_VNEG_F:
                 case NEON_2RM_VRECPE:
                 case NEON_2RM_VRSQRTE:
+                case NEON_2RM_VQABS:
+                case NEON_2RM_VQNEG:
                     /* handled by decodetree */
                     return 1;
                 case NEON_2RM_VTRN:
@@ -4966,34 +4968,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                     for (pass = 0; pass < (q ? 4 : 2); pass++) {
                         tmp = neon_load_reg(rm, pass);
                         switch (op) {
-                        case NEON_2RM_VQABS:
-                            switch (size) {
-                            case 0:
-                                gen_helper_neon_qabs_s8(tmp, cpu_env, tmp);
-                                break;
-                            case 1:
-                                gen_helper_neon_qabs_s16(tmp, cpu_env, tmp);
-                                break;
-                            case 2:
-                                gen_helper_neon_qabs_s32(tmp, cpu_env, tmp);
-                                break;
-                            default: abort();
-                            }
-                            break;
-                        case NEON_2RM_VQNEG:
-                            switch (size) {
-                            case 0:
-                                gen_helper_neon_qneg_s8(tmp, cpu_env, tmp);
-                                break;
-                            case 1:
-                                gen_helper_neon_qneg_s16(tmp, cpu_env, tmp);
-                                break;
-                            case 2:
-                                gen_helper_neon_qneg_s32(tmp, cpu_env, tmp);
-                                break;
-                            default: abort();
-                            }
-                            break;
                         case NEON_2RM_VCGT0_F:
                         {
                             TCGv_ptr fpstatus = get_fpstatus_ptr(1);
-- 
2.20.1

