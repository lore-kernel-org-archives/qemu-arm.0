Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1264885lfm;
        Wed, 17 Jun 2020 21:36:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKBO/HtBfHo9xNFs0hY2TUdk9OJmXXrrB6YyfxXcAyXT7yTifCkHUqP4snvz49VN56ZixG
X-Received: by 2002:a25:8b05:: with SMTP id i5mr3460468ybl.301.1592454987831;
        Wed, 17 Jun 2020 21:36:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592454987; cv=none;
        d=google.com; s=arc-20160816;
        b=H1hMxnelsDGHW5i2kNTSCUshqJ1OHVcLGVUGV0Z9xIddmwPhzOv/PJWHHeE091wYBV
         Yc1TNus6uNrr0WEMIHbwb8UGpIgCWsIztNbhyjDG2JT0la0Rj+Y5NuODG10QyvFyTZcD
         4oJ3UjgM0dlnqxTEIKLwVOFYb0fpszaxtjDaMpuOEoaWQ6qMG+ujleaJdgkt4WhZYiiH
         9nfNKTZDNYJxyn4g5n5by/M1KCX69kqlD4RresAxZnFqts8Xsedd1edpKQcxSkZmW+S0
         uaEnfDWiFmuDsg3lwmBVzQ2UDXfP4rlh2hbFR/zZFIi27ZycNWwrL1lSqoMWlYlz0Xpt
         NiFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=S8d9wYd6JfxR/z1eZTZ1Bv+kl2k04WrbW+eEXzxdm/s=;
        b=BhogruKI/BuvGvFRHGRsH9KQ0jSmNFQEkFpwdMSkNj/AdsGb/j/AMveFmJFxSaTF+J
         hxHzpVocmGhOFZuey4q4SvTwyHa6GHLOny1dU6pRrdkI5Cuqug8J+oj2Mja6K98ZeBhB
         eQPlaHEmgovlaJzdpoNGYZteALGmq9O1tpkKNs2kd28wOqiwHD6yiiZuqtXCTYeEXsCK
         Hzwz/P5uzIM5X0mS/X3SeHJQZT19J5SAJDeUQ23DOxYngy4570EcyoloEMpgIDkMjRSu
         5R/md+1pkUrNuBLe3OjbTsI9mid3ACq8jxlEtJ7MctTydGdNTXylhlhFABkmMNUgg7lF
         ebsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E9TbqeXo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p79si1430618ybg.319.2020.06.17.21.36.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:36:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E9TbqeXo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmHr-00042I-64
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlm9z-0004W2-EY
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:28:19 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:39789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlm9x-0002Wq-7B
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:28:19 -0400
Received: by mail-pl1-x62b.google.com with SMTP id v24so1907801plo.6
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S8d9wYd6JfxR/z1eZTZ1Bv+kl2k04WrbW+eEXzxdm/s=;
 b=E9TbqeXopqkhn8T3Y+pbxOJ8W9fiPo97mslPpxSRxMUXU1oQcFCNbJSjp0eBAwo4Q7
 DD5myf5wXrbENABTq3vXU4D8dmubaYjTEOVNt/alXlUjuCSMzznQ8C4CMFnddwGiwf6Y
 E7k5C84oPagQRkN/C77tkCixrLx938vsXd6lCLt3hq8p2ufhvml+VDhwoI+GTPKzR+Gq
 QlBV3xnn0ghFkfDG2wfVz601w/eS5rlwN17g5T0O7Wb8nq1O8B1xCrPsJotoz2nuvHAd
 symb159iu5Nj9tpV8WC1rnYXuoHRD1+rkoxoirbNP5iCFPhbwIooNnZH1BpG1DpVL2GJ
 742g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S8d9wYd6JfxR/z1eZTZ1Bv+kl2k04WrbW+eEXzxdm/s=;
 b=f9Slsf0nKnt0TqrG8xVp5rEUphCUQEw0rlQAkqOJDKfTeBo8jhIavjF/9lG6E38Ngc
 cyODDvNiSvINETrm5+UDNr2/JKQL2GuaBmYMF2XiTh/Hr4Ndmq18Md1PdZcmHFqu/1Sw
 mLyZ+E6Nk+PwV234l0hxviuVGcGbDtmf4sanCdBChFXCEPQUhfR7twgiKEKbQPDJ5Q32
 OzQsS1nnJ371egoQhwH+iH/aFYijAQLfefRbIfEl+RXiIaxsRcz26mRdxKISF3P5Uwhy
 OxDTXMfGm5e4dZ/L3DopyLJEqDkPC28asuIygBYHwEy2sLhx3b0KfYBZ2tSzh0A+vehy
 lp/g==
X-Gm-Message-State: AOAM530h02mJ5cOe1uCFmp00Vgq9ES43Rhs1M0hyUmAf6x7tqmfN9uJd
 nid4UEJ5g2gfEO5z3MJJMu8d8A==
X-Received: by 2002:a17:90a:294f:: with SMTP id
 x15mr2231039pjf.97.1592454495835; 
 Wed, 17 Jun 2020 21:28:15 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id l134sm1154412pga.50.2020.06.17.21.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:28:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 021/100] target/arm: Implement SVE2 integer halving
 add/subtract (predicated)
Date: Wed, 17 Jun 2020 21:25:25 -0700
Message-Id: <20200618042644.1685561-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
X-TUID: Xd3AuSq6LygI

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 54 ++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      | 11 ++++++++
 target/arm/sve_helper.c    | 39 +++++++++++++++++++++++++++
 target/arm/translate-sve.c |  8 ++++++
 4 files changed, 112 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 53c5c1d3f9..e02c3661c3 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -226,6 +226,60 @@ DEF_HELPER_FLAGS_5(sve2_uqrshl_zpzz_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve2_uqrshl_zpzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve2_shadd_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_shadd_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_shadd_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_shadd_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_uhadd_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uhadd_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uhadd_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uhadd_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_srhadd_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_srhadd_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_srhadd_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_srhadd_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_urhadd_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_urhadd_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_urhadd_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_urhadd_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_shsub_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_shsub_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_shsub_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_shsub_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_uhsub_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uhsub_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uhsub_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uhsub_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_sdiv_zpzz_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_sdiv_zpzz_d, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 2bf3eff1cf..2d5104b84f 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1132,3 +1132,14 @@ SQRSHL          01000100 .. 001 010 100 ... ..... .....  @rdn_pg_rm
 UQRSHL          01000100 .. 001 011 100 ... ..... .....  @rdn_pg_rm
 SQRSHL          01000100 .. 001 110 100 ... ..... .....  @rdm_pg_rn # SQRSHLR
 UQRSHL          01000100 .. 001 111 100 ... ..... .....  @rdm_pg_rn # UQRSHLR
+
+### SVE2 integer halving add/subtract (predicated)
+
+SHADD           01000100 .. 010 000 100 ... ..... .....  @rdn_pg_rm
+UHADD           01000100 .. 010 001 100 ... ..... .....  @rdn_pg_rm
+SHSUB           01000100 .. 010 010 100 ... ..... .....  @rdn_pg_rm
+UHSUB           01000100 .. 010 011 100 ... ..... .....  @rdn_pg_rm
+SRHADD          01000100 .. 010 100 100 ... ..... .....  @rdn_pg_rm
+URHADD          01000100 .. 010 101 100 ... ..... .....  @rdn_pg_rm
+SHSUB           01000100 .. 010 110 100 ... ..... .....  @rdm_pg_rn # SHSUBR
+UHSUB           01000100 .. 010 111 100 ... ..... .....  @rdm_pg_rn # UHSUBR
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 341ec23491..b578556a22 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -639,6 +639,45 @@ DO_ZPZZ(sve2_uqrshl_zpzz_h, uint16_t, H1_2, do_uqrshl_h)
 DO_ZPZZ(sve2_uqrshl_zpzz_s, uint32_t, H1_4, do_uqrshl_s)
 DO_ZPZZ_D(sve2_uqrshl_zpzz_d, uint64_t, do_uqrshl_d)
 
+#define DO_HADD_BHS(n, m)  (((int64_t)n + m) >> 1)
+#define DO_HADD_D(n, m)    ((n >> 1) + (m >> 1) + (n & m & 1))
+
+DO_ZPZZ(sve2_shadd_zpzz_b, int8_t, H1_2, DO_HADD_BHS)
+DO_ZPZZ(sve2_shadd_zpzz_h, int16_t, H1_2, DO_HADD_BHS)
+DO_ZPZZ(sve2_shadd_zpzz_s, int32_t, H1_4, DO_HADD_BHS)
+DO_ZPZZ_D(sve2_shadd_zpzz_d, int64_t, DO_HADD_D)
+
+DO_ZPZZ(sve2_uhadd_zpzz_b, uint8_t, H1_2, DO_HADD_BHS)
+DO_ZPZZ(sve2_uhadd_zpzz_h, uint16_t, H1_2, DO_HADD_BHS)
+DO_ZPZZ(sve2_uhadd_zpzz_s, uint32_t, H1_4, DO_HADD_BHS)
+DO_ZPZZ_D(sve2_uhadd_zpzz_d, uint64_t, DO_HADD_D)
+
+#define DO_RHADD_BHS(n, m)  (((int64_t)n + m + 1) >> 1)
+#define DO_RHADD_D(n, m)    ((n >> 1) + (m >> 1) + ((n | m) & 1))
+
+DO_ZPZZ(sve2_srhadd_zpzz_b, int8_t, H1_2, DO_RHADD_BHS)
+DO_ZPZZ(sve2_srhadd_zpzz_h, int16_t, H1_2, DO_RHADD_BHS)
+DO_ZPZZ(sve2_srhadd_zpzz_s, int32_t, H1_4, DO_RHADD_BHS)
+DO_ZPZZ_D(sve2_srhadd_zpzz_d, int64_t, DO_RHADD_D)
+
+DO_ZPZZ(sve2_urhadd_zpzz_b, uint8_t, H1_2, DO_RHADD_BHS)
+DO_ZPZZ(sve2_urhadd_zpzz_h, uint16_t, H1_2, DO_RHADD_BHS)
+DO_ZPZZ(sve2_urhadd_zpzz_s, uint32_t, H1_4, DO_RHADD_BHS)
+DO_ZPZZ_D(sve2_urhadd_zpzz_d, uint64_t, DO_RHADD_D)
+
+#define DO_HSUB_BHS(n, m)  (((int64_t)n - m) >> 1)
+#define DO_HSUB_D(n, m)    ((n >> 1) - (m >> 1) - (~n & m & 1))
+
+DO_ZPZZ(sve2_shsub_zpzz_b, int8_t, H1_2, DO_HSUB_BHS)
+DO_ZPZZ(sve2_shsub_zpzz_h, int16_t, H1_2, DO_HSUB_BHS)
+DO_ZPZZ(sve2_shsub_zpzz_s, int32_t, H1_4, DO_HSUB_BHS)
+DO_ZPZZ_D(sve2_shsub_zpzz_d, int64_t, DO_HSUB_D)
+
+DO_ZPZZ(sve2_uhsub_zpzz_b, uint8_t, H1_2, DO_HSUB_BHS)
+DO_ZPZZ(sve2_uhsub_zpzz_h, uint16_t, H1_2, DO_HSUB_BHS)
+DO_ZPZZ(sve2_uhsub_zpzz_s, uint32_t, H1_4, DO_HSUB_BHS)
+DO_ZPZZ_D(sve2_uhsub_zpzz_d, uint64_t, DO_HSUB_D)
+
 #undef DO_ZPZZ
 #undef DO_ZPZZ_D
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 77c4ba95b0..dac662a586 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5515,3 +5515,11 @@ DO_SVE2_ZPZZ(SRSHL, srshl)
 DO_SVE2_ZPZZ(UQSHL, uqshl)
 DO_SVE2_ZPZZ(UQRSHL, uqrshl)
 DO_SVE2_ZPZZ(URSHL, urshl)
+
+DO_SVE2_ZPZZ(SHADD, shadd)
+DO_SVE2_ZPZZ(SRHADD, srhadd)
+DO_SVE2_ZPZZ(SHSUB, shsub)
+
+DO_SVE2_ZPZZ(UHADD, uhadd)
+DO_SVE2_ZPZZ(URHADD, urhadd)
+DO_SVE2_ZPZZ(UHSUB, uhsub)
-- 
2.25.1

