Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4347804lfm;
        Tue, 23 Jun 2020 12:48:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzk5z/mnlzRYf2ph5cpG8CprbVntDEdVlP+4sZ1Xst1fjGqpmIbno6Gj1BWsJkbGGoeUOZt
X-Received: by 2002:a25:ac5e:: with SMTP id r30mr41130410ybd.68.1592941721709;
        Tue, 23 Jun 2020 12:48:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592941721; cv=none;
        d=google.com; s=arc-20160816;
        b=GyFRM3ihdEvDfvSKsVIuqOxYa+9CkAuplTVCvjnB2DKO9CP1wBMHZ7Oe9LKdpg4WF8
         iwCXiaTY65l8J8H0hKmv+xqWYc4NPFp2KJpYtoWDKVw6Q2vzLXdQ6bvm6eYiwZkYZbCN
         4nM2zRdl085gDm4FzgdHkABxog06FtxTRK3/UrIDvotB2nB1Ej69zfNSWFduXT2z2eiI
         O20nBTO+txVe4+WuvzrV2smqtWUBgpuT9THeGIL+yncAOoAab7bYoK3UXAwaj+NrrooR
         js48iSTulXhgueiCq80HatTphv3urVtXW8F547K6JMj5Pqk5g0VSecUIh9CdtV/dkdMq
         +o8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Kx8luF5ClxmLvI42GDbuDKC8aWFBMysnWnLJuq5GSRg=;
        b=RmOT4nkU+006iHJppW9BCiaC9FUN+pLvWCinZYR7rTrwLgKsKLYs4ZOQ30jwJ+7NV1
         5twzESUl9E3skdGQ0Vt9lXxi4eEivUQo3jnHQCAGkCppSZDzWAsVUxc80jBodhMLkiu3
         0E/os5LpRn42K4LRLEGDVevU3v2ZKaD/1bXJDe1Ud/ZPkyvncMWzx4vzMv4tajmpjQ9L
         rAuM+ANec4mNmKJdafpV0NrlMUACD/qwB3GrWp/7Fb86a5AnuDsy4j+i16QNutmyuTvy
         7o2T3e0hmTcRYEdnEdrIUTwZle+a2m6RALK/f+QxmjcfQoUgyJH1+DAhXKrtgxGvlBLd
         RkYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vP7XhaxH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a5si16133507ybq.296.2020.06.23.12.48.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 12:48:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vP7XhaxH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnouP-0008N6-0o
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 15:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojp-0004fN-Lh
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 15:37:47 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:54139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojn-0005qq-V5
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 15:37:45 -0400
Received: by mail-pj1-x1042.google.com with SMTP id i12so1910235pju.3
 for <qemu-devel@nongnu.org>; Tue, 23 Jun 2020 12:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kx8luF5ClxmLvI42GDbuDKC8aWFBMysnWnLJuq5GSRg=;
 b=vP7XhaxHaxpQt8ZUNjF93Ta9BoANxuQhhqZdr1qwGm7Xtj6PvwozxnAtdZNjqi4pgl
 yNFwWucyW5qU1yf0o20ZDdMtoOQVh5p9taGrT7G9Unn4xLaC5ddXIRJow9JjNVI20VJm
 QIV6g5lqiiD7oycULWM8HlkYWOZORm4vPqnd02KAw8FmcYhubfim7M8D9kxHB9iIYHi2
 fDL5Akv90dXcnwINGiqcesRi8TGoGehahxphZcjYAilxZx74lepLk/2+4LvGcOwXDD8I
 AJcWz2d157Kiy4IFO4ykTxnzqi4Mqg2No8gLzXCSiB0KrHxDE+oI502iPFT3zXKOL9OU
 /Evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kx8luF5ClxmLvI42GDbuDKC8aWFBMysnWnLJuq5GSRg=;
 b=XPcI9Ky79V2OqaIpjpPBzIm+GQH3UkzFzqmIX6xbv0Wgk7K7MWd3OJVthUom2wEwSb
 A5hVL5voNaOgmzSXuKVaUQTRYcmiUH7nrJbc7zCCvMvV/IGxcD3/EVt3KZ1xDFc1987p
 TQiHfttIGGMLmqTy7BO582ZgLadbe7IQZzYVLFroURa44OJ0EnvCOCgBEDX09LjBDLDd
 WuCl6bKo57m5xG7MEs11KU0vcQQvSONE/ic+z5re76OseiMpzYN8MY7hIyeR9u2EAlll
 LZwrgVwTTFBoLhs/gyix9TI0HBZYAv6oqlkqKtS/Bc6AVUuIGaFZ9EHuwws2gpVWQ7AB
 twVg==
X-Gm-Message-State: AOAM533RqXrb3AqcMyEe6JY5o7Csyl+SmboH3JHQ8W/iQwhqy8PT3W04
 JPH3kCpRtkXdR9NiiDWCiE+G7/whdww=
X-Received: by 2002:a17:90a:a2d:: with SMTP id
 o42mr24980972pjo.101.1592941062282; 
 Tue, 23 Jun 2020 12:37:42 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p12sm17927642pfq.69.2020.06.23.12.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 12:37:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 30/45] target/arm: Use mte_check1 for sve LD1R
Date: Tue, 23 Jun 2020 12:36:43 -0700
Message-Id: <20200623193658.623279-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623193658.623279-1-richard.henderson@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D74uvYp8DbIQ

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 4a613ca689..4fa521989d 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4892,7 +4892,7 @@ static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
     unsigned esz = dtype_esz[a->dtype];
     unsigned msz = dtype_msz(a->dtype);
     TCGLabel *over = gen_new_label();
-    TCGv_i64 temp;
+    TCGv_i64 temp, clean_addr;
 
     /* If the guarding predicate has no bits set, no load occurs.  */
     if (psz <= 8) {
@@ -4915,7 +4915,9 @@ static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
     /* Load the data.  */
     temp = tcg_temp_new_i64();
     tcg_gen_addi_i64(temp, cpu_reg_sp(s, a->rn), a->imm << msz);
-    tcg_gen_qemu_ld_i64(temp, temp, get_mem_index(s),
+    clean_addr = gen_mte_check1(s, temp, false, true, msz);
+
+    tcg_gen_qemu_ld_i64(temp, clean_addr, get_mem_index(s),
                         s->be_data | dtype_mop[a->dtype]);
 
     /* Broadcast to *all* elements.  */
-- 
2.25.1

