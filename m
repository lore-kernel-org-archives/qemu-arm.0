Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3170426wrs;
        Mon, 19 Aug 2019 14:38:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyTWP1SUSqoJQdSp+1fHMoaRupDCSfEilmtBe05sYo+IIMbCCBhg0iXkYBHS84FhuqcpeKN
X-Received: by 2002:a05:620a:14b8:: with SMTP id x24mr22550487qkj.419.1566250700740;
        Mon, 19 Aug 2019 14:38:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566250700; cv=none;
        d=google.com; s=arc-20160816;
        b=S2nBd/GSWqK50Ks07VTe6RHzVD2V0CEO+sh27WSRRhulxfGBsiKgDMoR1Hi2aBx74u
         AsEVUC2X0d9e8FQumyFAdeyH7fCekU+kyJ8hKkLxyCWOxKt79zXYUXa7mUdhjAgzYnZI
         l1EiONzgdFSjhwFcIz5Nl/wv5hz5EhEuJhKzgYHe3OmRkSBy35GsKdDcCel9ibZM4kdI
         PO9J/ciu9oYGYYHCnb4G5Qy6H6vi66NOAk5VmTpitdLum+YJWtlsbt7Y3z7ajJ4jgLxl
         Uu7ISFnwiNZugvFEaPEynTNgOGWYoMoSZREuTMi6iqIjCPmu2tSnhUIxiFEuEEtZOMF8
         P+Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=2Kulh9+xu3WIHTQp568/rqttxBdLC2HThk9gtIjvuts=;
        b=yjNXMhFJ1Ve5WoBlRwSFSa1Jn3yMkv+aYcQvgoiktHKMhm7uITaoB0sYMM1azo+XGt
         0jK6U0MF0B5Y65ToOGFu5hs0cvm2Gmv1ntFnqPUf0janxlh9mv7bOHT+jqil35IUioDm
         Y14RY7PhED7mdowKwSgKeO5Fj/XB6Nnc6g0lZrfAIdbG+89gOl5TdNZLjGECj+GYq/Ap
         OcBN9AHrDxWEn/UlKUyQ3gOY+5Ers6Ag/9jZRHabvcSZjAceR3o6X4P0RASUe5M3i2e8
         x63lFdxggPpSsjva6YOuW6yvN7HmnKK2UTSnzGUmW98lj4gMtiVDrMXu4wI+ZYYiC9RZ
         xiuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bcDdgqJg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d1si9041954qkk.283.2019.08.19.14.38.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 14:38:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bcDdgqJg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpM3-0001B8-JI
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 17:38:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58413)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpLk-00019q-Vt
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpLj-0005wa-VG
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:00 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:37825)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpLj-0005wC-Pq
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:37:59 -0400
Received: by mail-pg1-x543.google.com with SMTP id d1so1932414pgp.4
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2Kulh9+xu3WIHTQp568/rqttxBdLC2HThk9gtIjvuts=;
 b=bcDdgqJgtfww91QUIwvYvDmy1SzpiaiU7oJ0yEBY+oshoiBQJ00X3efqYkGkapY2uT
 RkWzqYsT+io2tz0G/A0PbLYULvV8ZyJWpnmPgmgYXNJkWeHUI/OPTfinbfXINrpH1nyG
 74C0j15KycMM6MvVHsAVv4h+BLTKIPZ2rhi3yp1q2IIRMAW2yykbeJLLRAB1z5J8yzpC
 PhV3qIJ8mv8ONN75al+TKMLnvCTf+nyHbdRLlF1MSbSs6VXZga7n5WsskSNRUnk3K4cy
 Bq0VeuLzDZXL0KPko1KnXlQkRFAUN4KDyvCZQQf48vvKD9ziKjkeRNo0TVi5iInbfYdM
 T9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2Kulh9+xu3WIHTQp568/rqttxBdLC2HThk9gtIjvuts=;
 b=swjtLEMASswLtNbeAwV95LPDVfqwXc+nuJGX7iDz5qJ2vgYfUoTNrYFIF04iNWGGWB
 cUqi4mwGjaHvvAsqLfvELWoJ7hnO64zAvEV0LbxJIpn2408ymO2o9V/mgXmBwEL/f7mm
 JuwICPDMsTMTVc6BVgXAaLJqtvkoaIYXdxlzq8Yhz3lh8h7fVPKXk5uh/gPEt3WyO1xe
 dF+568DRjuKrXAeVJ3sXMYsCbeTxpEWg/6lY333cB4x74mSQ4HRxdY7Le7IJYzLm+74d
 vYqMXFSBFzqUtKASAKY6KGhLFMFY5ArR3pHnhH2goA6aAnU7mtzpYJ0fmyo3sx+zJ8WO
 HPoQ==
X-Gm-Message-State: APjAAAWnl/3VsS/BKzwUXGw7POfp2MKO9mCGDI0SkCiPthrJComBQYCR
 mH3v0rkwqyRftKVzc7oyqSbREiwtowA=
X-Received: by 2002:a63:3203:: with SMTP id y3mr22150875pgy.191.1566250678807; 
 Mon, 19 Aug 2019 14:37:58 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:37:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:36:48 -0700
Message-Id: <20190819213755.26175-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-arm] [PATCH v2 01/68] target/arm: Use store_reg_from_load in
 thumb2 code
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vE8nLot3aPMc

This function already includes the test for an interworking write
to PC from a load.  Change the T32 LDM implementation to match the
A32 LDM implementation.

For LDM, the reordering of the tests does not change valid
behaviour because the only case that differs is has rn == 15,
which is UNPREDICTABLE.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index d948757131..db69d998eb 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9714,13 +9714,11 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                         /* Load.  */
                         tmp = tcg_temp_new_i32();
                         gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
-                        if (i == 15) {
-                            gen_bx_excret(s, tmp);
-                        } else if (i == rn) {
+                        if (i == rn) {
                             loaded_var = tmp;
                             loaded_base = 1;
                         } else {
-                            store_reg(s, i, tmp);
+                            store_reg_from_load(s, i, tmp);
                         }
                     } else {
                         /* Store.  */
@@ -10854,11 +10852,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 tcg_temp_free_i32(addr);
                 goto illegal_op;
             }
-            if (rs == 15) {
-                gen_bx_excret(s, tmp);
-            } else {
-                store_reg(s, rs, tmp);
-            }
+            store_reg_from_load(s, rs, tmp);
         } else {
             /* Store.  */
             tmp = load_reg(s, rs);
-- 
2.17.1

