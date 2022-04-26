Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp356603lfu;
        Tue, 26 Apr 2022 09:32:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkfRBDXVvWCBtP9pCWmK6qoi017AKvERX1kSQlSjJXSck/tLWzwcI6l3JGFEoKJBb2kqV7
X-Received: by 2002:a81:6355:0:b0:2f1:aed6:ad17 with SMTP id x82-20020a816355000000b002f1aed6ad17mr22778575ywb.381.1650990738297;
        Tue, 26 Apr 2022 09:32:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650990738; cv=none;
        d=google.com; s=arc-20160816;
        b=W/JDIviRbAeuCme+hyUiz+93bFkekZXUWR7iJmgAon8z2KSMd39GLiqs2GxoEh/snl
         xMXkA8xck9zuLrfXzcKaz1SLkUaSERH98QmxjNR6ph28WeKD0ONz1HAW2GBUjH9m32IN
         xR1A86X8+xP/EqabEh50fNldxxqiLsvKEeUVmII6WpVAhzYEiMjz2D/BzDepMx31YLiM
         W6a/t2JA3jr6Ukn7FVnn5jT07RRBMBvDoTOM08aYmK74MT9xpeYie5lOOBXlKyEv6xfX
         QXNoMbLtPYPIfwMz1IhPstOFsxJItAf5a0un7lnD/yNQ80RamrNYgXaa35txPYwv6GGZ
         syKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=A3nhL9lpF5kEdI3yITzr/5HwVsaS4vWPU90RPBOwW5I=;
        b=ZfhWwU67ac9okgUnrTpAxmVMlv+7rYMWXOaU/f+Nm6Ql6jjO0ezoZlt16yea162E/f
         D6kVOwoYPXasQ6Fg6e9KW/cWElwGTqjpCs/1oT3zrF7P9iYkHaIxK8ZBLISXtXeTKPdn
         d8EbiaEBu4GZHX8sn7pqgPjtawozUVne5mUTy0ROjz3cFKlfO4h9qSNpgyUJqNKhHCAX
         rbjHtQg1u3zg+4zJEGE3UXtYw2oxc+qHDO5e4qYDUTM3sRsR+HJ5UI2hhaQjJVc8qKEu
         oLN57g+wkymWkcti+xKGFPe2rr9lVd2Hd3lNDNzID/fK5uwWgYt06Q2475KpE2EFp8H/
         QAOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jExGMUTV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 83-20020a250456000000b00645db937e4bsi10163927ybe.669.2022.04.26.09.32.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 09:32:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jExGMUTV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njO6r-000340-M0
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 12:32:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5X-0002vf-3x
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:30:56 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:38607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5R-0003lS-3T
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:30:52 -0400
Received: by mail-pf1-x42a.google.com with SMTP id b15so18446822pfm.5
 for <qemu-arm@nongnu.org>; Tue, 26 Apr 2022 09:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A3nhL9lpF5kEdI3yITzr/5HwVsaS4vWPU90RPBOwW5I=;
 b=jExGMUTV0a+clhEs0uma1Nem8UT8VekwvnCypB9rPRKVacvCOejwxp3qzljQbMn21x
 FoHVqi/pWMjoWpGH0Eyw/sOmdYki5YdYLZBgpYYlBKiD3jE9ZUuQt5niQkX/vz5Cz8TC
 llT8JnLkRapUZaNJqnPtvZgwe5yioUdeDyrsssiUa4RjX1NpDWgRsFVKXg8pEwdVG7zy
 DiEyvBq0CYTIeJS5ij5++/fIQmoaRpI8qiTvGzHv9LNQAFTkgex/BwSLZ2fbtFfuuMI2
 z7UQETBzljzgfuNmYjIRNlg63oF0bLbNFIcc7AuFXL0PTaCk289tkCdfWNwFDEWqLb4+
 8Dkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A3nhL9lpF5kEdI3yITzr/5HwVsaS4vWPU90RPBOwW5I=;
 b=QO2iaaC/TJqnk0nAcmGS3u6NefklTxPE/23hl4aYEoEUDNybGHKEQ2TzTRFWFnjfO/
 IXpgOy/9fQWWQaslint5Wu/aa9Jzyql+FpI/iYU/fxjuQraLroYYbsMvr4jwxgzS+KUQ
 V0zk5Ei+rXC8E7PLrcUHZb8w1V0lrOYZE7Qtlbnic1Y8A5lqRBfSOKAPj4Q9xJFy47IU
 ANmCamvjNkMX38LMvMfEuHkIl27XQZqftT/ebxarLJ6rXBNX0Z1neaoPNfXQdwpJ9YDX
 n+QSeMjWq2/yfb80kjJYopkinsat6YhnWWjUtta86Wv9I+y91b9Ux7DWy2Mua/B8rW5w
 5kEQ==
X-Gm-Message-State: AOAM531oF8D7Pj0fHEl8+wN9rUOaFav95we8Gel+ZVmV68XTwiRansZf
 nzCAbtBv3uWh4UhyGTNcygA43A==
X-Received: by 2002:a05:6a00:21c8:b0:4c4:4bd:dc17 with SMTP id
 t8-20020a056a0021c800b004c404bddc17mr25100217pfj.57.1650990647197; 
 Tue, 26 Apr 2022 09:30:47 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:30:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/47] target/arm: Use tcg_constant in gen_mte_check*
Date: Tue, 26 Apr 2022 09:29:58 -0700
Message-Id: <20220426163043.100432-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t8a4yFCWyqHa

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index c6ab0433af..7b5bfb0889 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -258,7 +258,6 @@ static TCGv_i64 gen_mte_check1_mmuidx(DisasContext *s, TCGv_i64 addr,
                                       int core_idx)
 {
     if (tag_checked && s->mte_active[is_unpriv]) {
-        TCGv_i32 tcg_desc;
         TCGv_i64 ret;
         int desc = 0;
 
@@ -267,11 +266,9 @@ static TCGv_i64 gen_mte_check1_mmuidx(DisasContext *s, TCGv_i64 addr,
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
         desc = FIELD_DP32(desc, MTEDESC, SIZEM1, (1 << log2_size) - 1);
-        tcg_desc = tcg_const_i32(desc);
 
         ret = new_tmp_a64(s);
-        gen_helper_mte_check(ret, cpu_env, tcg_desc, addr);
-        tcg_temp_free_i32(tcg_desc);
+        gen_helper_mte_check(ret, cpu_env, tcg_constant_i32(desc), addr);
 
         return ret;
     }
@@ -292,7 +289,6 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
                         bool tag_checked, int size)
 {
     if (tag_checked && s->mte_active[0]) {
-        TCGv_i32 tcg_desc;
         TCGv_i64 ret;
         int desc = 0;
 
@@ -301,11 +297,9 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
         desc = FIELD_DP32(desc, MTEDESC, SIZEM1, size - 1);
-        tcg_desc = tcg_const_i32(desc);
 
         ret = new_tmp_a64(s);
-        gen_helper_mte_check(ret, cpu_env, tcg_desc, addr);
-        tcg_temp_free_i32(tcg_desc);
+        gen_helper_mte_check(ret, cpu_env, tcg_constant_i32(desc), addr);
 
         return ret;
     }
-- 
2.34.1

