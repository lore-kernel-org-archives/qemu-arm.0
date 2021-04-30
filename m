Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp486684lfg;
        Fri, 30 Apr 2021 13:56:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHuDCBF9hq1tS3RCcVez6iRptKHL7Y4ngJ3T7cSfkUErWOTfLX7oHFftHI8E5ZWundVA1V
X-Received: by 2002:a05:6602:3342:: with SMTP id c2mr5679666ioz.98.1619816166900;
        Fri, 30 Apr 2021 13:56:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619816166; cv=none;
        d=google.com; s=arc-20160816;
        b=T7zqMeJhiCcmXaYNmNcTZaNh71vHm9E+MByEdFATysWP5m57d80OErFJ4S0XHRTudR
         tZh4EzaWKed/Ze2+ivgqyINx3JQV9NPadpvzszWQn0NZZPyuOf7AUsIRxTjgbXEGrP6Y
         3E07vYJhY1zJLNjd5gNtdGP5GXz44Rm3SSxZDgG91j/RoOO1bd+Su7keAFq73Yjl2+8i
         +9kfeV7vsFTOXSCWJKOsP+DcKMTbD2ExrSLW+fipo3v3UhuVxfLlximbWZJyAFqSZffm
         B8xp5pqh/zFlUVafc62c0b8LvMBnM6mXyKpNrJJw8E030BsdKyhcKRJyac+dRlSyrj5i
         gutw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JohW9Zep0eTrt4XneckLJzEv6J8bwztIac2YTHSBK88=;
        b=hNocROBFHdbDnW3CBToNhwR8mW8VUdQ2cVJM4IyXOwkCW2C5GCMAb1GzPa1BqVBefR
         FGE0xHucE2CXa3h3HDsaxaWLHhlTMQo4rAVX5uL/FEYRaHNxpjtxJWBsia4u4+yOLqy+
         mJr07vfMGKxXBJ7W0lY+rChts32BwOnTy/ZisqDpPy5xDuVcneBi/Jsr16JL9snQRx6k
         Ffxe+m+Fjdqk5b/RJdrJOs6HGezR4z9J453zI+eYkKbIUTyTSA0sqt6DYgkU3lZuVThx
         269dCpZVTBChERlHQvo/SLHr/mZKVXEuy01owFXOglxZNT85/k/SvpZ2dBj0KbSGi23s
         LC6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YeG9Jlsd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q2si4687552iow.34.2021.04.30.13.56.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 13:56:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YeG9Jlsd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcaBC-00034C-6W
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 16:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZjF-0000tv-MT
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:27:15 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:46751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZie-0006Df-RK
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:27:11 -0400
Received: by mail-pf1-x432.google.com with SMTP id d124so6493207pfa.13
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JohW9Zep0eTrt4XneckLJzEv6J8bwztIac2YTHSBK88=;
 b=YeG9JlsdzFIzsLM6jc7MewVLnPOg/KnT9WgfR1or9lDQCqx+K2fkBoxkexmVp5LZbz
 M7zQnGk/VAtcjYmO2VCn9foFOYbjMPndsiLOra6TL6i1FrSIVWNh6u4ib20401DwU89C
 dfi+ucDe3Xpn8kVagJ4hrfNeOvUfjGx12kD7nKzH57LHRh9VAought6GwflKmWEqJ1ec
 m20Xc4OXJWwAaMdz3VRKO7WOKhart/HKPY+i28nza6euGs70cp81pgS7tvcRW9pkMcS/
 H4URQ8ghPkEO7x/KQVp2Kbx6RPY0gSIhGKkR8ORt4iOIw50Orhrrhwjk4ebC40mFTEBB
 wQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JohW9Zep0eTrt4XneckLJzEv6J8bwztIac2YTHSBK88=;
 b=W3XUpICNzRN8WsrwJFWaerzlk39JchBrQWf8MeXn6Q7IGe3L2E/3SKAUYUrzW71a5k
 B3QuuV+rmqSVHojygnQxL3zzfjIlstIXn2vXMtD572NmZq7+uXYSBlScyz18wW/fA94M
 j/vnytUqboz+KHAVHZ3VUgCZgYGIsmf83U4slZfxDby7N7ekurJLS7mkoCX46+u6gM6f
 OOEXaLhPpXKDi/13FjhEMFVGDNo889B2qAisqiQSLf3SR7jaJ4DQnD8k8AySncyMZH0h
 4xl2x00Cs6JVlSolCxMawdyAyepksFAmAcdEsDLW4Tqzw3xp4cc6egDA3DLlQSMmBxHE
 8F5A==
X-Gm-Message-State: AOAM532WHziFXwXJavhXnDGBfDmlTwcDK3iSPXwk6GvNfbcmCeCb87hO
 E5WT+wCgIy2z3NmIUzQoBZGD/DeGLZ97aA==
X-Received: by 2002:a63:dc56:: with SMTP id f22mr6275720pgj.287.1619814395359; 
 Fri, 30 Apr 2021 13:26:35 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 39/82] target/arm: Implement SVE2 RADDHNB, RADDHNT
Date: Fri, 30 Apr 2021 13:25:27 -0700
Message-Id: <20210430202610.1136687-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wCq++yZPaxap

From: Stephen Long <steplong@quicinc.com>

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200417162231.10374-3-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix round bit type (laurent desnogues)
---
 target/arm/helper-sve.h    |  8 ++++++++
 target/arm/sve.decode      |  2 ++
 target/arm/sve_helper.c    | 10 ++++++++++
 target/arm/translate-sve.c |  2 ++
 4 files changed, 22 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index a369fd2391..8d95c87694 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2517,6 +2517,14 @@ DEF_HELPER_FLAGS_4(sve2_addhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_addhnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_addhnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_raddhnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_raddhnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_raddhnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_raddhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_raddhnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_raddhnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_b, TCG_CALL_NO_RWG,
                    i32, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_h, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 72dd36a5c8..dfcfab4bc0 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1324,6 +1324,8 @@ UQRSHRNT        01000101 .. 1 ..... 00 1111 ..... .....  @rd_rn_tszimm_shr
 
 ADDHNB          01000101 .. 1 ..... 011 000 ..... .....  @rd_rn_rm
 ADDHNT          01000101 .. 1 ..... 011 001 ..... .....  @rd_rn_rm
+RADDHNB         01000101 .. 1 ..... 011 010 ..... .....  @rd_rn_rm
+RADDHNT         01000101 .. 1 ..... 011 011 ..... .....  @rd_rn_rm
 
 ### SVE2 Character Match
 
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 2dead1f056..e6f6e3d5fa 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2135,6 +2135,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)              \
 }
 
 #define DO_ADDHN(N, M, SH)  ((N + M) >> SH)
+#define DO_RADDHN(N, M, SH) ((N + M + ((__typeof(N))1 << (SH - 1))) >> SH)
 
 DO_BINOPNB(sve2_addhnb_h, uint16_t, uint8_t, 8, DO_ADDHN)
 DO_BINOPNB(sve2_addhnb_s, uint32_t, uint16_t, 16, DO_ADDHN)
@@ -2144,6 +2145,15 @@ DO_BINOPNT(sve2_addhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_ADDHN)
 DO_BINOPNT(sve2_addhnt_s, uint32_t, uint16_t, 16, H1_4, H1_2, DO_ADDHN)
 DO_BINOPNT(sve2_addhnt_d, uint64_t, uint32_t, 32,     , H1_4, DO_ADDHN)
 
+DO_BINOPNB(sve2_raddhnb_h, uint16_t, uint8_t, 8, DO_RADDHN)
+DO_BINOPNB(sve2_raddhnb_s, uint32_t, uint16_t, 16, DO_RADDHN)
+DO_BINOPNB(sve2_raddhnb_d, uint64_t, uint32_t, 32, DO_RADDHN)
+
+DO_BINOPNT(sve2_raddhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_RADDHN)
+DO_BINOPNT(sve2_raddhnt_s, uint32_t, uint16_t, 16, H1_4, H1_2, DO_RADDHN)
+DO_BINOPNT(sve2_raddhnt_d, uint64_t, uint32_t, 32,     , H1_4, DO_RADDHN)
+
+#undef DO_RADDHN
 #undef DO_ADDHN
 
 #undef DO_BINOPNB
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 86f8a24b5b..af0d0ab279 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7474,6 +7474,8 @@ static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)                 \
 
 DO_SVE2_ZZZ_NARROW(ADDHNB, addhnb)
 DO_SVE2_ZZZ_NARROW(ADDHNT, addhnt)
+DO_SVE2_ZZZ_NARROW(RADDHNB, raddhnb)
+DO_SVE2_ZZZ_NARROW(RADDHNT, raddhnt)
 
 static bool do_sve2_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
                                gen_helper_gvec_flags_4 *fn)
-- 
2.25.1

