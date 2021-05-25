Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4040145lfm;
        Mon, 24 May 2021 18:48:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz05/gU+EGdkSBC/AnMaJCJavt4LOdYaEIQV3EbWaXF9P6/qOJlbdapaMXfyCnZcWxb3wvU
X-Received: by 2002:a02:c912:: with SMTP id t18mr26797101jao.100.1621907316359;
        Mon, 24 May 2021 18:48:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621907316; cv=none;
        d=google.com; s=arc-20160816;
        b=dQTmLRhPBjVEwF+SQ76F+0oW5F8t5+GBt+13wIVsUClHXrI0L6IMLxLtwMQuwlnKjQ
         Gj10/KLM0wffzQ0vE1qmFBkKP2vt51Gz7hFMRJrkZFI/xH0JXV4r8F8PLBLoB3bINZQ3
         ceikzes6OZ4dVbAd6sTIvq0JSsR8TTqUFlPfg2nUKYOTcvcB+qJDsUv1EcVmqkxHRSFj
         DsOA41c6PGLs+Ld7aauFyW3qnqe2J1e/Mr3E6A9UJhRmH1E3VXEEij48EsME7YlWsvyr
         RUtCuuby7/7wToegTdMTdtjNFo5ZKZZkIPLIu0bTw7RS7T6sz/09BhzYPomCQEIkDq6P
         /8vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bfCAhe9/uQHtOdN9hcGfCpP2k7jny4Jk9ySklgsWsZk=;
        b=c6okEftTv0c+WZkNcHjKO6Y/DUr654RnyByjk7NEu/rif2JVatsokF7cbaTrVnDkpt
         BUrGAbSKprCzibUCtTzHdyT509EcoGU9vIBVrgxshizDAZwhWT+jQV7UAny8AFJQu+KN
         X+X97982/mnJMGkOfgMn4hoUe7oOsSgCCNqf4lxUeQVC8dsd12THX7MnmSs0qO39jvoF
         gt74orNoQnM9rTZ1Pjti+EK6xpWkYj/uB3g5GhbCv4aSbYVrkbvXz/6JlZ6AHHugRHNp
         dJj46QSFTuu9NKOZTuZ0NUFVmF8gob31SOKza1oBr27hIBjhTizs6rokgnrOb6Q4am+m
         uipA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G2UDNpnB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w3si17316981iov.75.2021.05.24.18.48.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 18:48:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G2UDNpnB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llMBP-0008OH-N1
	for alex.bennee@linaro.org; Mon, 24 May 2021 21:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYJ-00006G-EM
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:11 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:35516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXr-00045R-P2
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:11 -0400
Received: by mail-pf1-x42c.google.com with SMTP id g18so20613852pfr.2
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bfCAhe9/uQHtOdN9hcGfCpP2k7jny4Jk9ySklgsWsZk=;
 b=G2UDNpnBC7aPm3QHyVoOFxnLx5sxvPNwPjdp8KkAvYPotbeMbI9Fitt1glO+/MBsrK
 6q4yBFyI8LVOXVzYknWmfdLP+R3J/rotwLFSXuraHDeLc/XgWmE4LLFSYkHnvEX6uPUk
 Ck8pQTn50Fm6nHv6M4z0zxSTBy6KNsyvXozyNZGjEndyXZiMSrdHk5183xRv4tqGVzd1
 N8DgPSgGsz9jZWyEmMqgFbdZthJdysXOD3uxXKhZi5rfSYBd+pYPrb6m+6GElFFQ0vWi
 5AiD4O0UY7eJdsjWACgAbVbkEcQnqoXXzealsl+f6Csk6K1AxDTA49BrxvEDeN/EqohK
 5Ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bfCAhe9/uQHtOdN9hcGfCpP2k7jny4Jk9ySklgsWsZk=;
 b=OTTrYsjs6yCA49ZCwFlWGMNW0dYBoRqOma+41FakcXpA3pcoEEiUbXNReSHrveyyx4
 bI7rzbM/E2ITOB/QAqiC0RAuoxD596+JSfWftKlGNNWPmnDwu2vsLEkCmenLpx3etbNn
 5P36HgtNI6ipsM/CjWqnsiLwaBre/ef1MbaSfXv3gfJ7XLymzaM8r8rgFkqS+aCMib+A
 cOZlVi9qBdeeOvXpEuBv8CtWo84g2abCHmxv5QZ4oIMaEkPLY5RyZ6WduH5MNRABQAO7
 n5tvKbzIjLFK7oNsFQ1b46TUumyOENKT1Bqb1rlzM30CAC3yU82Ao5CIdP7z50dFlFsQ
 YsUw==
X-Gm-Message-State: AOAM531ZfyGwvoEQ5gEGLkaiIcIFC1w62hJdVFtguqPFpMhJTaPNe0Rv
 7ddvZ+q0DHx+s31l9D21ypix9QZK5ISRwA==
X-Received: by 2002:a63:dd12:: with SMTP id t18mr16221331pgg.361.1621904857212; 
 Mon, 24 May 2021 18:07:37 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 61/92] target/arm: Implement SVE2 integer multiply long
 (indexed)
Date: Mon, 24 May 2021 18:03:27 -0700
Message-Id: <20210525010358.152808-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gc0WQWAYnFLG

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v7: Rebasing dropped from v6.
---
 target/arm/helper-sve.h    |  5 +++++
 target/arm/sve.decode      | 10 ++++++++++
 target/arm/sve_helper.c    |  6 ++++++
 target/arm/translate-sve.c | 10 ++++++++++
 4 files changed, 31 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 4a0e70ee91..3bec807e13 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2710,3 +2710,8 @@ DEF_HELPER_FLAGS_5(sve2_umlsl_idx_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_umlsl_idx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_smull_idx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_smull_idx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_umull_idx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_umull_idx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index dd50b9b5c0..9c5761347a 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -841,6 +841,16 @@ UMLSLB_zzxw_d   01000100 11 1 ..... 1011.0 ..... .....   @rrxr_2a esz=3
 UMLSLT_zzxw_s   01000100 10 1 ..... 1011.1 ..... .....   @rrxr_3a esz=2
 UMLSLT_zzxw_d   01000100 11 1 ..... 1011.1 ..... .....   @rrxr_2a esz=3
 
+# SVE2 integer multiply long (indexed)
+SMULLB_zzx_s    01000100 10 1 ..... 1100.0 ..... .....   @rrx_3a esz=2
+SMULLB_zzx_d    01000100 11 1 ..... 1100.0 ..... .....   @rrx_2a esz=3
+SMULLT_zzx_s    01000100 10 1 ..... 1100.1 ..... .....   @rrx_3a esz=2
+SMULLT_zzx_d    01000100 11 1 ..... 1100.1 ..... .....   @rrx_2a esz=3
+UMULLB_zzx_s    01000100 10 1 ..... 1101.0 ..... .....   @rrx_3a esz=2
+UMULLB_zzx_d    01000100 11 1 ..... 1101.0 ..... .....   @rrx_2a esz=3
+UMULLT_zzx_s    01000100 10 1 ..... 1101.1 ..... .....   @rrx_3a esz=2
+UMULLT_zzx_d    01000100 11 1 ..... 1101.1 ..... .....   @rrx_2a esz=3
+
 # SVE2 saturating multiply (indexed)
 SQDMULLB_zzx_s  01000100 10 1 ..... 1110.0 ..... .....   @rrx_3a esz=2
 SQDMULLB_zzx_d  01000100 11 1 ..... 1110.0 ..... .....   @rrx_2a esz=3
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 2ec936a8b1..20ed2f34bc 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1599,6 +1599,12 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)            \
 DO_ZZX(sve2_sqdmull_idx_s, int32_t, int16_t, H1_4, H1_2, do_sqdmull_s)
 DO_ZZX(sve2_sqdmull_idx_d, int64_t, int32_t,     , H1_4, do_sqdmull_d)
 
+DO_ZZX(sve2_smull_idx_s, int32_t, int16_t, H1_4, H1_2, DO_MUL)
+DO_ZZX(sve2_smull_idx_d, int64_t, int32_t,     , H1_4, DO_MUL)
+
+DO_ZZX(sve2_umull_idx_s, uint32_t, uint16_t, H1_4, H1_2, DO_MUL)
+DO_ZZX(sve2_umull_idx_d, uint64_t, uint32_t,     , H1_4, DO_MUL)
+
 #undef DO_ZZX
 
 #define DO_BITPERM(NAME, TYPE, OP) \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 1f6a61bf55..e8e2a4e948 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3886,6 +3886,16 @@ DO_SVE2_RRX_TB(trans_SQDMULLB_zzx_d, gen_helper_sve2_sqdmull_idx_d, false)
 DO_SVE2_RRX_TB(trans_SQDMULLT_zzx_s, gen_helper_sve2_sqdmull_idx_s, true)
 DO_SVE2_RRX_TB(trans_SQDMULLT_zzx_d, gen_helper_sve2_sqdmull_idx_d, true)
 
+DO_SVE2_RRX_TB(trans_SMULLB_zzx_s, gen_helper_sve2_smull_idx_s, false)
+DO_SVE2_RRX_TB(trans_SMULLB_zzx_d, gen_helper_sve2_smull_idx_d, false)
+DO_SVE2_RRX_TB(trans_SMULLT_zzx_s, gen_helper_sve2_smull_idx_s, true)
+DO_SVE2_RRX_TB(trans_SMULLT_zzx_d, gen_helper_sve2_smull_idx_d, true)
+
+DO_SVE2_RRX_TB(trans_UMULLB_zzx_s, gen_helper_sve2_umull_idx_s, false)
+DO_SVE2_RRX_TB(trans_UMULLB_zzx_d, gen_helper_sve2_umull_idx_d, false)
+DO_SVE2_RRX_TB(trans_UMULLT_zzx_s, gen_helper_sve2_umull_idx_s, true)
+DO_SVE2_RRX_TB(trans_UMULLT_zzx_d, gen_helper_sve2_umull_idx_d, true)
+
 #undef DO_SVE2_RRX_TB
 
 static bool do_sve2_zzzz_data(DisasContext *s, int rd, int rn, int rm, int ra,
-- 
2.25.1

