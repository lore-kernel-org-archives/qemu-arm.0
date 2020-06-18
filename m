Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1268723lfm;
        Wed, 17 Jun 2020 21:43:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEIq0h9WMNKIMqljbYa4toI8ol6IDSDnAHVbPTw6+q+rDUtXy0JIllKKv1dvfrGxP8ee/d
X-Received: by 2002:a25:a0c7:: with SMTP id i7mr3769830ybm.420.1592455381756;
        Wed, 17 Jun 2020 21:43:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592455381; cv=none;
        d=google.com; s=arc-20160816;
        b=UdE/R4DBriJcjSHAXlUMnW1qs7ESdYZ+aAhzsgVYq0v7eZ+XlAM8eWmdxoozWzKdRJ
         KC5xYTmspfv1s8SiJT+2nA/I6XP2DkbXiTHT7ue91buy5ELDwFjm3ps5Qwyw1pVG9W9/
         Bf2bQcLNGEPAXXrvZT/PrIOwOb3ZTn6cMHQTzB8b0fWc3QbfiPGu9dq/5qXeyFmEkB9l
         jGXcxE1gJ6ycIq9M9cxIFOSYcv3wZbDkqKjD5jbzJvGUTqctUkanLvJLLQ1Tnzta6nlx
         /4r8YBvPJRZGg8UbSdMrfSzWA/4KrN1Wx5DfJo67tzypUDLtn4xuhgYlCdWXKNfUy/8P
         UD0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TcYJ9GWAAeNQFsbFc0TrzRMrgfv3ypUf8aqLBwT8bac=;
        b=k4jeZIfxCjY5L0aQXMOMGg1S+XnLE1BTmOpcLxV4pcx7nrXRvgh63QYKsIl97xk9WL
         cuYAWi8lE8noDnpL7118UYjdy4TzNcy/1nUaepiEZHzFcwwgWdzzlbdXIxMmE9rP0z2S
         Ana8QO4gNlC1xGqytRV2eiK1rRO9TYXtsxQ93IiDQ4pIkgTRQwcZAFgB/kQDiOjdcnMv
         9Q9aYeofuaWjxJTGBkTFpKDtSTaP1k2mcwTbT0RjGcVX2NH5PH9RhZvsZVHs9Vhh3p4o
         xJl6AsAgTW+DW29pRRpdb3M7loR/8Xdx8lbspjWH8HYKsviNp71GsSds7GmImRuS7Rtc
         hWpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wgpCNeYU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14si1424957ybp.184.2020.06.17.21.43.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:43:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wgpCNeYU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmOD-0000TR-2v
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmAn-0006KT-44
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:29:09 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:35160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmAj-0002pY-RG
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:29:08 -0400
Received: by mail-pf1-x435.google.com with SMTP id h185so2206888pfg.2
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TcYJ9GWAAeNQFsbFc0TrzRMrgfv3ypUf8aqLBwT8bac=;
 b=wgpCNeYU1sqqLKqYuCitwMHHe0Jw1OUyFvK29aeRjS/0/ggd8prlaLC4yykof3ecl9
 CbvYllyjite6V5IIDbZcsSGStdojA8625Xpiy0cnnBxgFmpD6WWmLA0I+ZF2XVh6AyTl
 7By9tkvGX1dE0NyMPXYtGRoTw2f6pH+FRDntTcSbgikNj49qQbtGjoKOE5doiMneQ9gZ
 TzSmsflI1OAJso/+JxqgfkuOpmCW02IZl6Bv8f7jZsBaqT9x9Uv+6dlTvcnWlH+HynpW
 17RRNlpFZV4WidN+d006Pbg7vp27+7MWVN3kGYLeR6bIXqXfyg3C9wWF9kL8tlIX159P
 DGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TcYJ9GWAAeNQFsbFc0TrzRMrgfv3ypUf8aqLBwT8bac=;
 b=O4JyosW+jJFgp0Nva1X/rQsr5EkPPydE/ZlkpA5EroqGdfPfAu1F282bGSLGddiWO6
 FSGjs1R1V8Rbotw9sc4i5xrq0wrzs6rDCzB0VdR3fLfJtQ4QJ7Ov6e6daCpbMZu/Navt
 fIKH2H1VrJ32wfrdXqvfdo5jOZCGeT5IzzxwKtdChzhP5IrWhRHM5EJVXJnLwvXE1SKs
 WqpA44+/d1RPPfz+h/0M459ZyhMsGXJsrdcOFFkU2ahBG6cK3iZOf12TyZYor00orRTU
 oRwk8VA43URmUggwmPNCXOmJpwJZVg/5F3nub8KLb6IhWgk5/GIntw5BuRrNz+k8SgdP
 5s5g==
X-Gm-Message-State: AOAM532eBdLTt2m9rZHZVu3ooAlUqtmm0iBFZhLvwEpA184ruhFG4vcy
 OZksFGIq+XhJqXh2buM99Cbxepzr5z8=
X-Received: by 2002:a62:1b01:: with SMTP id b1mr2025690pfb.14.1592454544507;
 Wed, 17 Jun 2020 21:29:04 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id mu17sm972324pjb.53.2020.06.17.21.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:29:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 035/100] target/arm: Implement SVE2 integer add/subtract
 long with carry
Date: Wed, 17 Jun 2020 21:25:39 -0700
Message-Id: <20200618042644.1685561-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5Cp2TrRJFDje

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix sel indexing and argument order (laurent desnogues).
---
 target/arm/helper-sve.h    |  3 +++
 target/arm/sve.decode      |  6 ++++++
 target/arm/sve_helper.c    | 34 ++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 23 +++++++++++++++++++++++
 4 files changed, 66 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 7fe2f2c714..cfd90f83eb 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -1928,3 +1928,6 @@ DEF_HELPER_FLAGS_5(sve2_uabal_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_uabal_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_adcl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_adcl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 6cf09847a0..f4f0c2ade6 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1247,3 +1247,9 @@ SABALB          01000101 .. 0 ..... 1100 00 ..... .....  @rda_rn_rm
 SABALT          01000101 .. 0 ..... 1100 01 ..... .....  @rda_rn_rm
 UABALB          01000101 .. 0 ..... 1100 10 ..... .....  @rda_rn_rm
 UABALT          01000101 .. 0 ..... 1100 11 ..... .....  @rda_rn_rm
+
+## SVE2 integer add/subtract long with carry
+
+# ADC and SBC decoded via size in helper dispatch.
+ADCLB           01000101 .. 0 ..... 11010 0 ..... .....  @rda_rn_rm
+ADCLT           01000101 .. 0 ..... 11010 1 ..... .....  @rda_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 401fc55218..184b946a5b 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1264,6 +1264,40 @@ DO_ZZZW_ACC(sve2_uabal_d, uint64_t, uint32_t,     , H1_4, DO_ABD)
 
 #undef DO_ZZZW_ACC
 
+void HELPER(sve2_adcl_s)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int sel = H4(extract32(desc, SIMD_DATA_SHIFT, 1));
+    uint32_t inv = -extract32(desc, SIMD_DATA_SHIFT + 1, 1);
+    uint32_t *a = va, *n = vn;
+    uint64_t *d = vd, *m = vm;
+
+    for (i = 0; i < opr_sz / 8; ++i) {
+        uint32_t e1 = a[2 * i + H4(0)];
+        uint32_t e2 = n[2 * i + sel] ^ inv;
+        uint64_t c = extract64(m[i], 32, 1);
+        /* Compute and store the entire 33-bit result at once. */
+        d[i] = c + e1 + e2;
+    }
+}
+
+void HELPER(sve2_adcl_d)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int sel = extract32(desc, SIMD_DATA_SHIFT, 1);
+    uint64_t inv = -(uint64_t)extract32(desc, SIMD_DATA_SHIFT + 1, 1);
+    uint64_t *d = vd, *a = va, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 8; i += 2) {
+        Int128 e1 = int128_make64(a[i]);
+        Int128 e2 = int128_make64(n[i + sel] ^ inv);
+        Int128 c = int128_make64(m[i + 1] & 1);
+        Int128 r = int128_add(int128_add(e1, e2), c);
+        d[i + 0] = int128_getlo(r);
+        d[i + 1] = int128_gethi(r);
+    }
+}
+
 #define DO_BITPERM(NAME, TYPE, OP) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5e6ace1da6..9131b6d546 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5937,3 +5937,26 @@ static bool trans_UABALT(DisasContext *s, arg_rrrr_esz *a)
 {
     return do_abal(s, a, true, true);
 }
+
+static bool do_adcl(DisasContext *s, arg_rrrr_esz *a, bool sel)
+{
+    static gen_helper_gvec_4 * const fns[2] = {
+        gen_helper_sve2_adcl_s,
+        gen_helper_sve2_adcl_d,
+    };
+    /*
+     * Note that in this case the ESZ field encodes both size and sign.
+     * Split out 'subtract' into bit 1 of the data field for the helper.
+     */
+    return do_sve2_zzzz_ool(s, a, fns[a->esz & 1], (a->esz & 2) | sel);
+}
+
+static bool trans_ADCLB(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_adcl(s, a, false);
+}
+
+static bool trans_ADCLT(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_adcl(s, a, true);
+}
-- 
2.25.1

