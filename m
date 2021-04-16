Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp737922lfr;
        Fri, 16 Apr 2021 14:23:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2Zt7y+RiGN27rd11weWHVbs3vNTQQJ/PuKHBiGWWqwojRnKRaUn2tIatEDEMAnQK1QR6w
X-Received: by 2002:a5d:8893:: with SMTP id d19mr5244874ioo.167.1618608220413;
        Fri, 16 Apr 2021 14:23:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618608220; cv=none;
        d=google.com; s=arc-20160816;
        b=C8Qsy06YZI1Hb1eVFixms0ZfqVxHAZkgM43K6/2ZMVhl0tmrTFSd/tNWejIX+d9j/m
         UfxIwY1fQzEUebGu7GF6+rhkZicyX3w4do9jCJ4Q+rNOq9+XImfJPmrf4vrPoOGUd2eG
         UGh0xW3lzSa27PTH8qwD2BT1gcFtObsVS4AXRNJfYFP5Vzz3s1pGjCiYa5E6cdwaYw/9
         PZJ6+eFlraB8yVtdBL+bEILeDFMa8Y5DavEVjzwhmrxG6+rl/pqqDRY+aZ+GkWPE3wLg
         cICUuXV+hKXYnONljx5FTINhPvZQx7oFLSDT6g0EO9NMFEqdIOUOOqQRoI9FfF7qdSbH
         gbNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JohW9Zep0eTrt4XneckLJzEv6J8bwztIac2YTHSBK88=;
        b=zXBPys1z912FC1d4d6TBmOMljySwjQYEqd61I4HBxMuwRvxKL4/jnFDURIMVJ4S5Ed
         rm5BBTNptFwH1/uMwHXnLYqgmXMG2YUGXxTTa5wXAaYUOFdp79BlOJvTXahwyzRcfig3
         0cIDVhv7WpTXzi1QlyQt+0xc9JOZ2c4mZvKCs0iUfGqseYCfhq/13F7dagzwAaTHTPHp
         5os0z2O4NJlKybrG/HN0grFFMtWkG4LFpXGsR6I3Wya0GIvb8vtHr3n5MfOjZHqcfryq
         aMWmwPKHy0n01380sMwPkyO6KofTQB0SUQ4NUWEoATFI/lSrQtuSGy7NhBs16EXn69OR
         zh6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y6CsIIna;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l15si7701449jak.34.2021.04.16.14.23.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:23:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y6CsIIna;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXVwB-0007g4-OS
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcr-00052X-ED
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:03:41 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:35511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcY-0001N1-2w
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:03:41 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 j21-20020a17090ae615b02901505b998b45so1748392pjy.0
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JohW9Zep0eTrt4XneckLJzEv6J8bwztIac2YTHSBK88=;
 b=Y6CsIInaIc6UaX+riQKIDV0KoWgZ+svJNUkMxqvpVwOXnFvuU7cu06IH16a06teARG
 /LYuoRIzhyXsHXOARCvo9ojodyRIMpucYLr2VzWdmUuCrC64J/4pqRq15VgEIN5b3ibj
 oH9ffk1oi0mCy/UObrKPDHkKOYylCpMZAj/Uxt5r2wUC7g5k1TvKxyRdE78cEEEl25Hs
 jfrKFrtZBemILxRyicIcRRTHJLzhFe4CRRMxZEKnFxyMnwPijyH+gv47unUsfR7QMNPe
 7WsWNO/VatxA5ypUhGmWTlsfu6m8+xuAVad2vi4oHZV3X8PECsdiKyfGGDWC3ssyETnU
 1eNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JohW9Zep0eTrt4XneckLJzEv6J8bwztIac2YTHSBK88=;
 b=IgLgOuvmxqMF5d3D2OSRPXNWBcAn/+q3CLiCjpD0VZ7VUkWqu4R9FPpdoC5URo6rFz
 NK+Eca0TLv3JXoMCKLn6bAFCZ2HGMHh22vw3O1j+xVowrtccvQKaDQwsSWIlU7f0csLx
 /bqPaZs30FmGL3G1rcu3EcHzQDJ/PxL5GUzEibFSA5T8QJkVRVtZIOU0HW4F40MJczll
 Q9cFN28JGjOrfPjA/DemcouZ9gvsmIDpn9xxH+v+mSfe/kgg2NlZ9sPCuXm9695wKkcS
 pu6yqD3t4tyaYXOSl0LIW0pPdPeHP/5DHGvVjCxORUphC39Qc7zT1MTTByUHby/SBNZG
 kyAQ==
X-Gm-Message-State: AOAM5310hvFYwoBR6YTCvo6X6/MRRlqGcwhl9w9Agmcbn1K0EpsgUNkg
 nA2/zfpo5IVIiQoivaNnefrk7A==
X-Received: by 2002:a17:90a:cc0d:: with SMTP id
 b13mr11555262pju.219.1618607000878; 
 Fri, 16 Apr 2021 14:03:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m15sm5920640pjz.36.2021.04.16.14.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:03:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 39/81] target/arm: Implement SVE2 RADDHNB, RADDHNT
Date: Fri, 16 Apr 2021 14:01:58 -0700
Message-Id: <20210416210240.1591291-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: rhz+ASNcmWnW

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

