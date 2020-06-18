Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1276806lfm;
        Wed, 17 Jun 2020 21:57:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEmfY2peveTTadeQzQ9F5YdvgTfoNg5bQbKpOnS0P2or8m+ibpgFpGJMWR495pvmV0Cgp+
X-Received: by 2002:a25:aad0:: with SMTP id t74mr3629282ybi.265.1592456240672;
        Wed, 17 Jun 2020 21:57:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592456240; cv=none;
        d=google.com; s=arc-20160816;
        b=09OVHkT5rhbrmw7skyr/Jt1t/WXo5+Xdn8vfQSAV3REXQofzk+Std9w6TW1267rfVK
         BTocVETnwz8SFh1T+rY5aLJiYbhyFX5EohmuSnraE0jrq15qimxjF78lEwdvhUpb/Sdr
         Gl2tQI0po1TU/Ugs7ANpCU64e4tixdfq378fO0sacnpvbQmM3elRbSXey/GzdGjFsLzT
         HvwpPQwSCskJm4ct5+QmNUlHcO+9gwiEAQaBartIVO+2P50yL0pVqJqS0/isPBSkAtV0
         UBbi1/BTnlsOB5IV44omqdCZg5wm/F3h4eHncFB0TYM3Z+nPNt+NK5mnbAFaoGZMQnhw
         nNJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Cw8PC7ojj7h0r+iSkQynSb+Rabvgq1P4FgsvZJDiChw=;
        b=balfyBSusfETaF9u0KG81h5+dtBOAazpymTrqifNvv/5W2WDZWcTlSIlLdl+DLTIFS
         Ozz+T30OprlzLHCzj+/frCml+q69EegN3ZZIO5dBehFK5pvhqmOEnqrJZZeNBhOH8Z6K
         Z72+ov1rtlcMkcEGakBE1Tgtfjg2AUQVqMckuR4JRlka/djrJq1uOBkD+oTS1g/yMzXV
         TjJt3BEE24InuJ9heUQT10EoSQrmrfnslaiE7RE97/hRMjsyJOzDzuH8Hq2lW9gyUZlb
         4fQpT2AvG4zRbwgmvNRJT7EPVTmQnkcd6SXRs3eukS+1nKO9GEGY5BcMJX/ACMWBObQB
         F0bA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M4cHVKRr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d11si1532428ybs.21.2020.06.17.21.57.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:57:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=M4cHVKRr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmc3-00056M-0N
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmCD-00021C-Lp
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:30:37 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:37895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmCB-00038G-93
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:30:37 -0400
Received: by mail-pf1-x435.google.com with SMTP id x207so2201187pfc.5
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cw8PC7ojj7h0r+iSkQynSb+Rabvgq1P4FgsvZJDiChw=;
 b=M4cHVKRrLkkjcswZtYHaJ/t/hyGkIhC0QD0EPAHV04thhIs+cA4s2QYR/CJIe0axo9
 hOQMZs+mGZ+1ADrygiDEoXEIfu4IC/GiUIKOz/cx5PXlD2gPKHlJ6OM37G7lXGglFg9R
 GyQSQPKU8uLU2Xa6h8RFi4PyG9udBoWAjANAOduGjuPN4aLs+jq9ERDdy4Ze6OwFoNWc
 9gRmirRg2KXUbOMlBcujCJqEoWtF1kKHZDRy2Y/MK+opfphNoGkj8wdYYtDkT3QsLwXT
 IpUEDKn+HTAxTHNMgB9GKczwvtaHwXF3+ONP9SrTnl5o6VubTjxMpyZXMhFeXyFHzjkl
 81kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cw8PC7ojj7h0r+iSkQynSb+Rabvgq1P4FgsvZJDiChw=;
 b=rRcUF6QPLMfb3vlAMVQUQSuVifTZoH34NPDXoe3U8F4aD1FbEj6m31oZXMaqzzywGy
 WJtMQ2601310/7ixqzQ5r/Td68TSI3MAkZ1ys07APZvGO7D5q/sU1AxQIys55a0vK6xi
 zXdoA+ipuGQMrL36nDFz3qdb4llYuwjvHp43dt+WroTABED+a7g5tbiJQViAt+CKrS03
 lEhfcu5I3lzrtxdAd/0LI43b99jgWahyBiqn+VlhF/ACnSiobjOdCf9hd4uKgGAK0AHp
 o+PaXFTRu3nkTM9pNvo9ZyQnwwdCyqRFUNOjOiDztq6OKcArknQT0yGWnzbWWBGNlY4w
 Ba5w==
X-Gm-Message-State: AOAM530kr5fwcvZrAWCgqb6Tx4zfGXTHgWP+VpUHc25wB+LnZepfoytn
 Tb9SiC2Kfp1TDSKu8IdnEVOlHA==
X-Received: by 2002:aa7:96d7:: with SMTP id h23mr2021315pfq.320.1592454633015; 
 Wed, 17 Jun 2020 21:30:33 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id i191sm1298861pfe.99.2020.06.17.21.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:30:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 055/100] target/arm: Implement SVE2 RADDHNB, RADDHNT
Date: Wed, 17 Jun 2020 21:25:59 -0700
Message-Id: <20200618042644.1685561-56-richard.henderson@linaro.org>
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
X-TUID: MoLhKd1c6PR8

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
index 84281e3f9d..7627e0cd5f 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2029,6 +2029,14 @@ DEF_HELPER_FLAGS_4(sve2_addhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
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
index af9e87e88d..a33825066c 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1324,6 +1324,8 @@ UQRSHRNT        01000101 .. 1 ..... 00 1111 ..... .....  @rd_rn_tszimm_shr
 
 ADDHNB          01000101 .. 1 ..... 011 000 ..... .....  @rd_rn_rm
 ADDHNT          01000101 .. 1 ..... 011 001 ..... .....  @rd_rn_rm
+RADDHNB         01000101 .. 1 ..... 011 010 ..... .....  @rd_rn_rm
+RADDHNT         01000101 .. 1 ..... 011 011 ..... .....  @rd_rn_rm
 
 ### SVE2 Character Match
 
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 7f3dd2dfdb..281a680134 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2114,6 +2114,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)              \
 }
 
 #define DO_ADDHN(N, M, SH)  ((N + M) >> SH)
+#define DO_RADDHN(N, M, SH) ((N + M + ((__typeof(N))1 << (SH - 1))) >> SH)
 
 DO_BINOPNB(sve2_addhnb_h, uint16_t, uint8_t, 8, DO_ADDHN)
 DO_BINOPNB(sve2_addhnb_s, uint32_t, uint16_t, 16, DO_ADDHN)
@@ -2123,6 +2124,15 @@ DO_BINOPNT(sve2_addhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_ADDHN)
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
index 7dc30ed1bd..7e3ba2e4f7 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7035,6 +7035,8 @@ static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)                 \
 
 DO_SVE2_ZZZ_NARROW(ADDHNB, addhnb)
 DO_SVE2_ZZZ_NARROW(ADDHNT, addhnt)
+DO_SVE2_ZZZ_NARROW(RADDHNB, raddhnb)
+DO_SVE2_ZZZ_NARROW(RADDHNT, raddhnt)
 
 static bool do_sve2_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
                                gen_helper_gvec_flags_4 *fn)
-- 
2.25.1

