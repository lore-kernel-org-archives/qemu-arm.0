Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2635257ejc;
        Sat, 25 Feb 2023 01:17:12 -0800 (PST)
X-Google-Smtp-Source: AK7set9Ltn1QlbxD5pSrn8EgvE2oQkd1nETPWZTJ3axrzLnkI/t5NaXXtuuA6I8DxmEDTGrFjbwR
X-Received: by 2002:a05:6214:1c4c:b0:56e:a2cb:574e with SMTP id if12-20020a0562141c4c00b0056ea2cb574emr37042506qvb.5.1677316632662;
        Sat, 25 Feb 2023 01:17:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677316632; cv=none;
        d=google.com; s=arc-20160816;
        b=JUHM3GhjmDnyovCEQG59GYlbSOm6BmxUKymnhZezyD7+D4/wAUpZXAea2KP+R+Ek4K
         y5GVxC24NSbQP3ELjY+VFavxGuCNy1AEVit3NBuX85EYnSc+symO9hMa91oMJ6sIeeRX
         9/r5FCHhbSK2qR91htKNAr+QUt1A3J9gr4FT0sjdJ2lI2EerhEwrMl4/5ZOJnuvz+R8L
         0/1OOBGK4JN+GAr6FqH9tLztFLIa89u9xiuMMj54BDJ5/Iyuh+c/USSHgnSb5d8+v+u0
         OCJIhok6ix4PWa8novg7Ao8XHNORFB8cQ5vp/wkdgjiruPwB0h36fC5lt/J/eh3hwgqx
         s5UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uAH8ikgVoM0tmsv4PlPVbF0wuX8FOHP0nhWlFFURJoY=;
        b=A3Ma6P8U4ZTRHF0bp72lH04s3Xi/35ZVyY0xtxgsFE2V1CNfr95ttZ44ZA70/OoOWK
         JLgNPJH6G22RJkAaTaPp+uqDrOmOeE1U5x9f9o6ibhNuVdvMuLqPy92R8d2/bArtKMhs
         ufK1j72QyUbszorgAlvYikVTiXmnXlblqAK4Qzk3T7Kjg7EFacxhiUJmQhPZuY+SmNyA
         l7sBmRTq5hegfqij3OOMrWQJV2eNPoyqcE/BYG5/9A2EOtJ1lAxZtrn1eN9vZkh3LkYZ
         MWpxpkx7/PqK1TPrgqP5uaCmlT8pfMt85wjyzbWiwhRpKBg2b2jtE3euyGoPwTyhuqWC
         5Syg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="o/IGM9L8";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b30-20020a0cb3de000000b0056eaa387bd8si1504093qvf.147.2023.02.25.01.17.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:17:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="o/IGM9L8";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqdn-0004i1-UN; Sat, 25 Feb 2023 04:14:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqdk-0004YJ-9V
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:14:48 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqdi-0001Ra-MJ
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:14:48 -0500
Received: by mail-pl1-x62e.google.com with SMTP id l15so1905741pls.1
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uAH8ikgVoM0tmsv4PlPVbF0wuX8FOHP0nhWlFFURJoY=;
 b=o/IGM9L8R9w/cR20YlJwuj3hjMu7CFK7fPDBLWcmnzj8xQ8qwlG1r+V3LxloDS7Mf2
 nr7Z7IKKOm5sgssUtZM5TIcQ3Q8/pfxFZtRdsw3pJMYoy4ZkwIxAgv1wgc/rfYWRFIwN
 vgltHgbpXJMCb9hzANcXQ8P1/ansK2X+krVGtmPGxJxqEKIuO/Y9jIFpuhUgrnNbHHyg
 03zBA7zc9tgdqz8EXx0WXJThYR+0DICXHR3lpRh8346l15wqtheQ5qh5UbY6v8k88Cns
 1Tm+pZaO3ppnIBaNCzHAP4HLfOsgpdz1chyD5CoQhUhVmTAkwqnswk99LWjqyK0GJ5Pc
 zoNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uAH8ikgVoM0tmsv4PlPVbF0wuX8FOHP0nhWlFFURJoY=;
 b=nrsFke66BrNBP1eTsMFFQfb7hjtNQDabqLC6KSJe2ircYSJEwizUjuA1WdYm4ko8To
 UmOjj3bHzK2124jfokAU0ZoRS/5EUF9tqV4j+uOHSa4bRMclHzBwQjTtSVdk0JeYOE9a
 gfDZnFxx0ObeV9Do3r+w2NjkRTNRdCaJHotK84+095lEZFvsczgbjsXEh6HIoGx66zOz
 38Npbfz5Xg92pz9P1xSCbbDEgnPx8BfUTNFdV8exCG5L/ia/NIB5CJHsIzZw+PEVq2O8
 jQ/t6Houdid5X/huCklZpqO1ADdUtCQRIT5/ULd572MIhytmg4Fr6+Fmfk1DoRWqtCPU
 YJ6w==
X-Gm-Message-State: AO0yUKWLBcWd5bhf34q/9wvCy0nAam5EYK3+FHHvOkomqCgsOeAK7Fes
 JKyUbyzM/el9fWMnvy/wwkC+0vJveduGkOt7zRA=
X-Received: by 2002:a17:903:1d2:b0:19a:a815:2868 with SMTP id
 e18-20020a17090301d200b0019aa8152868mr20911873plh.44.1677316485281; 
 Sat, 25 Feb 2023 01:14:45 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:14:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 05/76] target/arm: Remove value_global from DisasCompare
Date: Fri, 24 Feb 2023 23:13:16 -1000
Message-Id: <20230225091427.1817156-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: T0O6BbHP1WR1

This field was only used to avoid freeing globals.
Since we no longer free any temps, this is dead.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h | 1 -
 target/arm/translate.c | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 7f52f08c5e..db29e8d799 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -157,7 +157,6 @@ typedef struct DisasContext {
 typedef struct DisasCompare {
     TCGCond cond;
     TCGv_i32 value;
-    bool value_global;
 } DisasCompare;
 
 /* Share the TCG temporaries common between 32 and 64 bit modes.  */
diff --git a/target/arm/translate.c b/target/arm/translate.c
index a0a298f8f7..f76a83b473 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -672,7 +672,6 @@ void arm_test_cc(DisasCompare *cmp, int cc)
 {
     TCGv_i32 value;
     TCGCond cond;
-    bool global = true;
 
     switch (cc) {
     case 0: /* eq: Z */
@@ -703,7 +702,6 @@ void arm_test_cc(DisasCompare *cmp, int cc)
     case 9: /* ls: !C || Z -> !(C && !Z) */
         cond = TCG_COND_NE;
         value = tcg_temp_new_i32();
-        global = false;
         /* CF is 1 for C, so -CF is an all-bits-set mask for C;
            ZF is non-zero for !Z; so AND the two subexpressions.  */
         tcg_gen_neg_i32(value, cpu_CF);
@@ -715,7 +713,6 @@ void arm_test_cc(DisasCompare *cmp, int cc)
         /* Since we're only interested in the sign bit, == 0 is >= 0.  */
         cond = TCG_COND_GE;
         value = tcg_temp_new_i32();
-        global = false;
         tcg_gen_xor_i32(value, cpu_VF, cpu_NF);
         break;
 
@@ -723,7 +720,6 @@ void arm_test_cc(DisasCompare *cmp, int cc)
     case 13: /* le: Z || N != V */
         cond = TCG_COND_NE;
         value = tcg_temp_new_i32();
-        global = false;
         /* (N == V) is equal to the sign bit of ~(NF ^ VF).  Propagate
          * the sign bit then AND with ZF to yield the result.  */
         tcg_gen_xor_i32(value, cpu_VF, cpu_NF);
@@ -751,7 +747,6 @@ void arm_test_cc(DisasCompare *cmp, int cc)
  no_invert:
     cmp->cond = cond;
     cmp->value = value;
-    cmp->value_global = global;
 }
 
 void arm_jump_cc(DisasCompare *cmp, TCGLabel *label)
-- 
2.34.1

