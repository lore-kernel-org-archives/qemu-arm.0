Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1155854wrp;
        Wed, 4 Sep 2019 13:18:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyCpO4F5DqPbJdagu61QjCsVFXUZ8bIlb0x+s4Ric4fBVvkbbL2pP5XnE0NLYOVX3MOvaMC
X-Received: by 2002:a50:e8c5:: with SMTP id l5mr129197edn.120.1567628330982;
        Wed, 04 Sep 2019 13:18:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567628330; cv=none;
        d=google.com; s=arc-20160816;
        b=G+dsjvuZ3n0NFssjFaOxswT/T90r4eWEZOE6RxKNEdC1tg06s4VNF7FXXVusjvwDxd
         oevoTZLe1m3/rp5vJ84UBzFhcQa3BAR5IrqdPTHK7KbioFs8+tYzIaD1n77rjAUAKZsi
         3k9vEIdzLoR0WkrKPsHNm4bnnE7AJCtJWC3xZGfGw+Xyr2DXpipSQ0oQp+1ClsWISbqb
         h/ei7DFSGiHXUz9aQuV2l1wAtReJss3cmWNrffWS1HEsMJekn1ld8tKNmnHpVlR7hcWW
         bifX7DovJtCkA7TKKVppTSX1PFEJrMlZdM3HvxBcL01J51MP6Qk15ZWviPG3vxzIYP4C
         iVGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Fo5ttwZvsmkPEs0WmaySuPJsLNa+8A7SD8ER3vUViKo=;
        b=lSSlocHeJqi/yBnpZAj2BIYGx07iVKW28F9hj/+lLWbHbuKf/fVTBZOn7WvRtieEiw
         4zqKmcKCubhHCDq10XZwkbDGgBw05lBqQANiWcJOy0EmR+fjbldxbI90nMnD53xpsInO
         8uTWs0X9dS+MiSNVNdCG051h0RlykeAYhak4wevTfuVK4q5CGViSW/emSOkOdVOBqHe2
         vbK5qBv3myiWBkV0AtA7+1nX6M3G2Y2yEUlaXxsL0NyUta6Ijh2C5OdWlxyjrSepCKZB
         nvhKNmpltfZkXE/NUj5OSWYauwryNjL9HfnCl3DF8OPGJT99LXpDhUE5Bkpm5HcaA8e6
         lT6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="erN+N/Sm";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id sd1si50182ejb.342.2019.09.04.13.18.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:18:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="erN+N/Sm";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bjt-0003Ef-C9
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 16:18:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41027)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0n-0005NF-9I
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 15:32:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0l-000337-9P
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 15:32:13 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:45741)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0j-0002ze-8R
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 15:32:11 -0400
Received: by mail-pf1-x444.google.com with SMTP id y72so6329476pfb.12
 for <qemu-devel@nongnu.org>; Wed, 04 Sep 2019 12:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Fo5ttwZvsmkPEs0WmaySuPJsLNa+8A7SD8ER3vUViKo=;
 b=erN+N/SmolmS9y4EmJ7QfaqckvwulGaPc5uOBw00cWdKKgkybjxPAKBy6de0NrCHxS
 jUvfHm2VJg/ywfkWrlpl2uLqx4C/adY9JuP9DYeE0RhEJmk2J8ytZ12xyqOgIF7etv5y
 LVyI/3VsPuVM08Ot3KWtPww/2plWDxsIhsdmnoODM9/FVzAR7CDBiL64aDMnIcL6Ik3h
 KLYEmJqF75GXgMpLJFkBQC56hu/nEQkOTLuqQzVHMuxKH9TqMyxhFaizMmIiBsrWiNFX
 28O+ZRgC3v60QspPSkzuEYObsKGBfbyODabD1dRbOr/3FbyTRYYRfXBfLU61gq9fhF6k
 U3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Fo5ttwZvsmkPEs0WmaySuPJsLNa+8A7SD8ER3vUViKo=;
 b=pfRkCNUMNiHyojAEi59SqXOmqqhhn0jSKcZzWWcKGzFc3LENUHIBKLvTrLhkuEGBU+
 Fhinu3PkXE62sJZD1D/OPFYe7Ks5fuDJQraPqKodrUYIMU1yShQYmpl5Pn/64tS5RZnJ
 HSOodpEMdECMujdRZuX46FYuv8cywlZXYfWAvNovCDwKV/pUOC4XKPi8BaJRoyNfvN3+
 IKoAqA2SPyiq19nex6UlxmoGxbMXR5/f9ranu/hZ73SUrFWDnX1UkrFUi46Wzrjz8ijJ
 lUo8sd0tEoSo2KzDaMxx+ZLgNlTTFNxTjAipA+BRR4wkn7t3BVHZ4ngzGDKTBirO8PE5
 QNKA==
X-Gm-Message-State: APjAAAXO1K6qdg8DlQ8P2M3hsBVSxstFMAa1cvU4w0mpCk8S0r/kNcHT
 iiUG6qOyazLdz0q0NfoDc+QGS2DMnoU=
X-Received: by 2002:aa7:85c7:: with SMTP id z7mr11061358pfn.58.1567625526060; 
 Wed, 04 Sep 2019 12:32:06 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:32:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:41 -0700
Message-Id: <20190904193059.26202-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-devel] [PATCH v4 51/69] target/arm: Convert T16 add/sub (3
 low, 2 low and imm)
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V2A0+5LZQY4f

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 26 ++------------------------
 target/arm/t16.decode  | 16 ++++++++++++++++
 2 files changed, 18 insertions(+), 24 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f9d4b619fa..45d617a2d3 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10691,31 +10691,9 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
              * 0b0001_1xxx_xxxx_xxxx
              *  - Add, subtract (three low registers)
              *  - Add, subtract (two low registers and immediate)
+             * In decodetree.
              */
-            rn = (insn >> 3) & 7;
-            tmp = load_reg(s, rn);
-            if (insn & (1 << 10)) {
-                /* immediate */
-                tmp2 = tcg_temp_new_i32();
-                tcg_gen_movi_i32(tmp2, (insn >> 6) & 7);
-            } else {
-                /* reg */
-                rm = (insn >> 6) & 7;
-                tmp2 = load_reg(s, rm);
-            }
-            if (insn & (1 << 9)) {
-                if (s->condexec_mask)
-                    tcg_gen_sub_i32(tmp, tmp, tmp2);
-                else
-                    gen_sub_CC(tmp, tmp, tmp2);
-            } else {
-                if (s->condexec_mask)
-                    tcg_gen_add_i32(tmp, tmp, tmp2);
-                else
-                    gen_add_CC(tmp, tmp, tmp2);
-            }
-            tcg_temp_free_i32(tmp2);
-            store_reg(s, rd, tmp);
+            goto illegal_op;
         } else {
             /* shift immediate */
             rm = (insn >> 3) & 7;
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index a7a437f930..2b5f368d31 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -117,3 +117,19 @@ ADD_rri         10101 rd:3 ........ \
 
 STM             11000 ... ........              @ldstm
 LDM_t16         11001 ... ........              @ldstm
+
+# Add/subtract (three low registers)
+
+@addsub_3       ....... rm:3 rn:3 rd:3 \
+                &s_rrr_shi %s shim=0 shty=0
+
+ADD_rrri        0001100 ... ... ...             @addsub_3
+SUB_rrri        0001101 ... ... ...             @addsub_3
+
+# Add/subtract (two low registers and immediate)
+
+@addsub_2i      ....... imm:3 rn:3 rd:3 \
+                &s_rri_rot %s rot=0
+
+ADD_rri         0001 110 ... ... ...            @addsub_2i
+SUB_rri         0001 111 ... ... ...            @addsub_2i
-- 
2.17.1

