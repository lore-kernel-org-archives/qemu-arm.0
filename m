Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp60074lfm;
        Thu, 25 Jun 2020 20:57:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxo1Oi33M8g+sO4FUIt3XX+Xc8AO8P6wLtUS6AeaOrRhKqYr/gptYs5uRN9T+Zu9I7b3Zsy
X-Received: by 2002:a25:d354:: with SMTP id e81mr1903653ybf.398.1593143841660;
        Thu, 25 Jun 2020 20:57:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593143841; cv=none;
        d=google.com; s=arc-20160816;
        b=rGPcHtavPNDOe19snOXYTYSNf5xHOsQ4WFP6ZKiEJPN32X60sIfdtwjEiyBxlBLaYW
         LrdgFbBbh08eQ9gnNygqxbsIFLzDhQ4NFlMH4wX0H5lvoguqFyFzQOZFgsbhv7c1uvKG
         XL0pzD35I5H4Kma42G3RdBw50voD/0vKSGtyjg4Lc+RPzTRRx7i//ZERtPQ0zCfUdIdI
         8jvnU+a1uDJFHpV0GVK3kYwj0R5kx8Nyt4bk1AK0u+cV14SC9ytT+wdsWzGiFQuYnY9r
         gb/I5X0ke0wLLylwUay3bay1u/uBUcxj0Twd3x9SRBKrp3u5Y+r5wyDawA3Sh0fHBb/H
         bArg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=73dckcvlkTiMvsVB7ETeQRaRlxizQr/3gWMqHjU/tSo=;
        b=kqxGOeLLwoJUH7exGBQ3SWBKB+d6/ev6RAUArQfYzKffAOtH988xXHmTeh+D5rXfpt
         jixKWZhEZ/hp/tYb8PyG9uUdxD4/f6wt/2iRUSWUotgVI+q86UCI0sA3yUOzpKIoclqp
         A+kZRq8ldAvwFBOxcZwP6KIT5x7Bmi+bEl1eY2F3GwX8KheLHmlNCbbQ8Thpf/zs2x/G
         BJQR3DNxSr6a2EGFoBFyE8ycwHWtoz/8mwESrrj6M7LkWOSDZ4RDrd7RZ4Ckk7tZRQzi
         Aa94uwVmaUG5/KiABYdUEK9YaUMJH7arO6z71Vqvcpyfr808/zI45SA//nyVT1YoLfyY
         ydaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W8Qbi1wL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y4si27254692ybk.397.2020.06.25.20.57.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 20:57:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W8Qbi1wL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jofUP-0002Qn-0T
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 23:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6U-000141-3W
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:38 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:39708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6S-000247-9v
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:37 -0400
Received: by mail-pg1-x541.google.com with SMTP id z5so4357131pgb.6
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 20:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=73dckcvlkTiMvsVB7ETeQRaRlxizQr/3gWMqHjU/tSo=;
 b=W8Qbi1wLW52QmqrXSHjYeU1TMlq5oXRauaNOtuTZIeOkuhO6/Ge0hMowIOeQDC/mAO
 SSXW9OKf0KPJIat3Pa7uC0nQRt9lBTQBGSOFM/wNOLZYpWZECLgp0H0EKpCp9w+p5TZe
 N0+exm6aeLNYnsMss0/VF58f6NUU353fvdnx0Mg2iTTNuwmPf9hysBOQCHN/8GmRU3Ui
 fj9IU02MXpW2XFNzrrtq7qGdXLroCt104CKfgUyLvWAW+Ggi/Z7ME/4sueTsg1xhvv0j
 q39hIt4IZHJ757A+zBH7Alh8AdOvTHTjvt6OP058xJB0fzsUyTdZ2O5lOOul5TPCsllW
 NgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=73dckcvlkTiMvsVB7ETeQRaRlxizQr/3gWMqHjU/tSo=;
 b=AvDaw2POjbKRQKKf1iqttUUQ55t9eG0y3Qqj8JeNSWJYy6eynN2WIGShdOD4U9Rty7
 gnuyyP2F4oIjbuzMUWalsyusUVDFqzq/u/vpel4tGuuvE5333WmQaCuChskkyd9VVvnk
 3RAnybmrH/DcGdqsTvDL4MhlvsnaZAG+4gxK3faKud6AhV6okvQdn9TBLDGqBhH1YjBz
 Vy1pS82SDchh1jkQIgsRPIz+4GPuojRXrby4KZSWIkGfILXKUpyqCZA2S2xvnQbp5JAL
 OLEkn13ci+Ln2nlNQn4hBFLr6l2nm2Kjzwc9DZCfSu0bJ8isiDgqZ0Oih2REBfWUyDNv
 Lb8A==
X-Gm-Message-State: AOAM530POWDNBj53rqNk0KDLbT+3D+f6mHreyA83/bIhp8RqG76j7vUv
 YsB7Edy/fCvX0lLSrzpTUCdI/Q==
X-Received: by 2002:aa7:85da:: with SMTP id z26mr819894pfn.13.1593142355015;
 Thu, 25 Jun 2020 20:32:35 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y27sm1605256pgc.56.2020.06.25.20.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 20:32:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 36/46] target/arm: Handle TBI for sve scalar + int memory
 ops
Date: Thu, 25 Jun 2020 20:31:34 -0700
Message-Id: <20200626033144.790098-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626033144.790098-1-richard.henderson@linaro.org>
References: <20200626033144.790098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ohfDEfa+lKJX

We still need to handle tbi for user-only when mte is inactive.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h | 1 +
 target/arm/translate-a64.c | 2 +-
 target/arm/translate-sve.c | 6 ++++--
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 781c441399..49e4865918 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -40,6 +40,7 @@ TCGv_ptr get_fpstatus_ptr(bool);
 bool logic_imm_decode_wmask(uint64_t *result, unsigned int immn,
                             unsigned int imms, unsigned int immr);
 bool sve_access_check(DisasContext *s);
+TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr);
 TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
                         bool tag_checked, int log2_size);
 TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 7a3774bfda..e46c4a49e0 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -215,7 +215,7 @@ static void gen_a64_set_pc(DisasContext *s, TCGv_i64 src)
  * of the write-back address.
  */
 
-static TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr)
+TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr)
 {
     TCGv_i64 clean = new_tmp_a64(s);
 #ifdef CONFIG_USER_ONLY
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e4fbe48493..04eda9a126 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4587,9 +4587,8 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
      * For e.g. LD4, there are not enough arguments to pass all 4
      * registers as pointers, so encode the regno into the data field.
      * For consistency, do this even for LD1.
-     * TODO: mte_n check here while callers are updated.
      */
-    if (mte_n && s->mte_active[0]) {
+    if (s->mte_active[0]) {
         int msz = dtype_msz(dtype);
 
         desc = FIELD_DP32(desc, MTEDESC, MIDX, get_mem_index(s));
@@ -4599,7 +4598,10 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
         desc = FIELD_DP32(desc, MTEDESC, ESIZE, 1 << msz);
         desc = FIELD_DP32(desc, MTEDESC, TSIZE, mte_n << msz);
         desc <<= SVE_MTEDESC_SHIFT;
+    } else {
+        addr = clean_data_tbi(s, addr);
     }
+
     desc = simd_desc(vsz, vsz, zt | desc);
     t_desc = tcg_const_i32(desc);
     t_pg = tcg_temp_new_ptr();
-- 
2.25.1

