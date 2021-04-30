Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp492606lfg;
        Fri, 30 Apr 2021 14:04:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/RG72YaiqXIYmfyazWJGoE/QEiBwVXJxqmIjNKGe8/9skL0OwSNLNo++rfnOtf5reamtS
X-Received: by 2002:a05:6830:1289:: with SMTP id z9mr3037228otp.86.1619816641471;
        Fri, 30 Apr 2021 14:04:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619816641; cv=none;
        d=google.com; s=arc-20160816;
        b=Rjarj6GKL5su8kFn1Y32+Tis5IsSDIL1o5RyfE+tHe+9edyXTSDmr4iHqZBv4T0lBu
         WRJCA+0GdukGVC0X38QMoEu2Ukt1JA53btSGBJYJaBE9x+yV5nEjr4qAGj/gXxN11g8R
         MMxH8plrZuuOdtTx9T3h+lvtcTRUAnI872go8kZTa4S2nRo79ZJOy35oz0Ze3Cae1hxQ
         MWAwxKZ3rEs+R0kU5W7ZxEFa0bSsS3idQ2TeuDDkkiQUreF8zwZ4tSNdXG+Sskcwg11B
         BEAhDeE2gmGUqbWV1ynZownKqSwEIP/VyKAeJg+8Vi9Q4+StoO1/qaOCg+cSs7dtx8iV
         GRrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ieCAX8JfYanxGz+tnZF3xTMiEcjdmHvb76wqgRW4ePI=;
        b=oWWoQruLDVU77MqlEY0P+Q4YGv3wQRCYbg9kvoZ9d2q7gbeiIvC8UlqKAmm2ZBKMGu
         Q1+8uvEaXib2cJvjFsrlH963SdPt0OlXJ8KBFnxqTgb1B2kY5vKYHkQTGtyYvA8vrurD
         c8hQ8Wroucc6wDXPZeENgNx0/GEJOrg7VbjkJ3AD9Q5+CWM/tDMrQR80opCTXiMdWm2x
         DofoLzEmf6Amy3/59X6swYooBGBgRwyg7tPAM/qm+1lurqQsG6hnhWfj2CEITQC5Xkvt
         yyYH8qBwarHPnuI22zvNDQAkUMNyMLJpmYj81mvz+Y7ohxpR1lkRZbLWUUh8xzObTIYo
         qbgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lnyJEec3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j12si4082137oiw.46.2021.04.30.14.04.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 14:04:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lnyJEec3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcaIo-0003io-Vm
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 17:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlm-00049V-Cr
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:29:50 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:55079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZla-0007fe-0p
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:29:48 -0400
Received: by mail-pj1-x1030.google.com with SMTP id t13so10987103pji.4
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ieCAX8JfYanxGz+tnZF3xTMiEcjdmHvb76wqgRW4ePI=;
 b=lnyJEec3yYsHoCQMnWYIIDb3FEvXZHLqxZ48470RL/NJwwW0IBod0PIIOqev7Gm6Jb
 DaYFwwTJEeRA92i1avMseC7FefX4DSg8SBOcDClou3xFzHNbH9VB0QCM4f5oUpCUBMtA
 5Y/2oQ5PAsswrMZFv/6IqUerJE/5PRen/E9449k6J34yDoJRoA7O6wU/P1IsR7a2U9hS
 pvO05xLbEuf3pcrq94nTM6TVzSWrlEvjLG3yScnZL43VQ4qyl+RJkmPSfqXdStXxmytH
 J7CAdsO9SE3H9vldMArUZrrSGhdF+96J0/bFq/anjifnRPQQ2jHcfVuGxMX+qEq40CgD
 Sgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ieCAX8JfYanxGz+tnZF3xTMiEcjdmHvb76wqgRW4ePI=;
 b=og6fo6UJ4ZNHaP+Ho6T9X2xhjH29tBSsN3rUlqzUerykQ0InFtIFaSA+6Ds49oPGZ9
 QimcH1yvqJvPkaU1wUAdOXRhpQ2xyWdZkfcs0mAPfmvbsX17TWCqYDB6WiFKYhIBdW/Q
 XsuwACVAC2ASBr/uBRfVhEZRHL1mWM+2Q96d/1CHbwZYWZZJud/fFlqZswjfPfDlSg8A
 DQiJhN23ORTKphsF0rkMVpao8QrIDfI/+JrXbAfsSxzA8gb+ZG2IOSfmSxm2vTbtRRfW
 v0pjuOHGzo4+2BGD8WdN6Eu/qqvPA5Piy007i1qrEUSMEIyGeMVWT1hu5ZJZYPAeOL8h
 AEWA==
X-Gm-Message-State: AOAM533ITr5VohTPyW+RBF+MbQ7PngSVGcV32pFdb+ExyC93bIDdA3wg
 Qs9uRXt6MWtxGimJo2UEXe8E9g8k+V76bg==
X-Received: by 2002:a17:90a:4108:: with SMTP id
 u8mr7151941pjf.126.1619814576358; 
 Fri, 30 Apr 2021 13:29:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 40/82] target/arm: Implement SVE2 SUBHNB, SUBHNT
Date: Fri, 30 Apr 2021 13:25:28 -0700
Message-Id: <20210430202610.1136687-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +ZNuXqbvgH7O

From: Stephen Long <steplong@quicinc.com>

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200417162231.10374-4-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  8 ++++++++
 target/arm/sve.decode      |  2 ++
 target/arm/sve_helper.c    | 10 ++++++++++
 target/arm/translate-sve.c |  3 +++
 4 files changed, 23 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 8d95c87694..3642e7c820 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2525,6 +2525,14 @@ DEF_HELPER_FLAGS_4(sve2_raddhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_raddhnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_raddhnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_subhnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_subhnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_subhnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_subhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_subhnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_subhnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_b, TCG_CALL_NO_RWG,
                    i32, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_h, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index dfcfab4bc0..c68bfcf6ed 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1326,6 +1326,8 @@ ADDHNB          01000101 .. 1 ..... 011 000 ..... .....  @rd_rn_rm
 ADDHNT          01000101 .. 1 ..... 011 001 ..... .....  @rd_rn_rm
 RADDHNB         01000101 .. 1 ..... 011 010 ..... .....  @rd_rn_rm
 RADDHNT         01000101 .. 1 ..... 011 011 ..... .....  @rd_rn_rm
+SUBHNB          01000101 .. 1 ..... 011 100 ..... .....  @rd_rn_rm
+SUBHNT          01000101 .. 1 ..... 011 101 ..... .....  @rd_rn_rm
 
 ### SVE2 Character Match
 
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index e6f6e3d5fa..0df70effe3 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2136,6 +2136,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)              \
 
 #define DO_ADDHN(N, M, SH)  ((N + M) >> SH)
 #define DO_RADDHN(N, M, SH) ((N + M + ((__typeof(N))1 << (SH - 1))) >> SH)
+#define DO_SUBHN(N, M, SH)  ((N - M) >> SH)
 
 DO_BINOPNB(sve2_addhnb_h, uint16_t, uint8_t, 8, DO_ADDHN)
 DO_BINOPNB(sve2_addhnb_s, uint32_t, uint16_t, 16, DO_ADDHN)
@@ -2153,6 +2154,15 @@ DO_BINOPNT(sve2_raddhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_RADDHN)
 DO_BINOPNT(sve2_raddhnt_s, uint32_t, uint16_t, 16, H1_4, H1_2, DO_RADDHN)
 DO_BINOPNT(sve2_raddhnt_d, uint64_t, uint32_t, 32,     , H1_4, DO_RADDHN)
 
+DO_BINOPNB(sve2_subhnb_h, uint16_t, uint8_t, 8, DO_SUBHN)
+DO_BINOPNB(sve2_subhnb_s, uint32_t, uint16_t, 16, DO_SUBHN)
+DO_BINOPNB(sve2_subhnb_d, uint64_t, uint32_t, 32, DO_SUBHN)
+
+DO_BINOPNT(sve2_subhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_SUBHN)
+DO_BINOPNT(sve2_subhnt_s, uint32_t, uint16_t, 16, H1_4, H1_2, DO_SUBHN)
+DO_BINOPNT(sve2_subhnt_d, uint64_t, uint32_t, 32,     , H1_4, DO_SUBHN)
+
+#undef DO_SUBHN
 #undef DO_RADDHN
 #undef DO_ADDHN
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index af0d0ab279..55303ba41d 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7477,6 +7477,9 @@ DO_SVE2_ZZZ_NARROW(ADDHNT, addhnt)
 DO_SVE2_ZZZ_NARROW(RADDHNB, raddhnb)
 DO_SVE2_ZZZ_NARROW(RADDHNT, raddhnt)
 
+DO_SVE2_ZZZ_NARROW(SUBHNB, subhnb)
+DO_SVE2_ZZZ_NARROW(SUBHNT, subhnt)
+
 static bool do_sve2_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
                                gen_helper_gvec_flags_4 *fn)
 {
-- 
2.25.1

