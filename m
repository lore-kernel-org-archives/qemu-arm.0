Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4685484ejc;
        Thu, 12 Jan 2023 02:42:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu/lPVHdee2T5l0SLm1AyjCN/GkCSOunk9X3KwuFt7T70gVxJBiChnYUhmHS2bTDBZkURih
X-Received: by 2002:ac8:65c5:0:b0:3b0:d8a4:62c8 with SMTP id t5-20020ac865c5000000b003b0d8a462c8mr7120682qto.23.1673520142389;
        Thu, 12 Jan 2023 02:42:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673520142; cv=none;
        d=google.com; s=arc-20160816;
        b=yHYPPLkwQ7lS7Yik0BPqR0BJkdzqCjeEuzFYhTwPjV/5e6//rZuUtnIF3qBzXOezYG
         Rwal8agIUolObqHyiQjItc87tx3A6z7uIGTPl0FwlGrMkMqRrM04pPsvF05A0qT3jPES
         NeRlYXct9Zs7aR7bat8zg98RqfJI8b8XRkeF7VToJhgw0wRAh/fdchH06UOjcZYPr5bO
         OcQOs5JaR+g6pY7e5VerT+fjez10aavUOmgVveiEKsL3fJJDYU+5XECh+G5H59Wdl0jA
         8WAydu4o2ZueheEycE9PcTztvxfytiCKLwMGB4vW/PSmEwr77Q18KRWMwKNfCEhy1FN8
         cyzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mUA0s/OLF3irpYz8q/+5iIV+g6F7cgz94WGYfbGpTw8=;
        b=ubA20CcDmbtGABmTegEA2H/m4RYykP8WKiaxv0v7ONzCWKfB9ZnuXHfPv3B35RJbDk
         qLCDoc6xmEwVHw4M3optszuzJN4BwQEFCH/0eMxcCS9AK4QqtiiIW7iGOT2mYS5aVCeM
         z7Te2IqOhROkyoLLGttzG7VTjy8VkeOXjuKHYqI73H8h5ojy9yRNMLhjwuhePHFdf8yH
         jk4rHgm5SljUQ/KxPFfXSm5oyLZUdYX385RTim3b6XVP/PiExcHnrd/7b5+MOrKEY12a
         2cfqq3kt6KIZ/oZceVBjhqCXJG0pQyDhutu4rxyNFfRlKQju5q0xaHjXJ11KCPU/3Zvl
         rRDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sewkk4bC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTP id m10-20020ac866ca000000b003a7eee6dc26si9817924qtp.671.2023.01.12.02.42.22
        for <alex.bennee@linaro.org>;
        Thu, 12 Jan 2023 02:42:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sewkk4bC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFum3-00036m-6U; Thu, 12 Jan 2023 05:25:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFulp-0002vo-1l
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 05:25:18 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFuln-0000Wd-5p
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 05:25:16 -0500
Received: by mail-wm1-x330.google.com with SMTP id ay40so12850689wmb.2
 for <qemu-arm@nongnu.org>; Thu, 12 Jan 2023 02:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mUA0s/OLF3irpYz8q/+5iIV+g6F7cgz94WGYfbGpTw8=;
 b=Sewkk4bCLwBH/pHnaleAQkGb1+NuBVt+ZNiur7WAfGsG1gemNpSTO7lxNQlBC5tOBG
 4gLNx9CTD7F/sGHD7yeKdGNOJzKJEyZNxri4fVNbbAfgu7ShGM07pW/096/nVMMg+Kmb
 BRPRpghh+ABTSWdNyaREaB5P7UQxr4hQeeYCarGz0FeiHzKlQPCSaua7zmlRsgCvu6u8
 zLdRLIbwYx6gfedLxMXIScVH8Ma4P/P+ZlkGqva8AnZ44zdvKk1Ua48b8UQ+3Qmabf9a
 ymWbGsEn21c6QGfgnj6b8VeCyk9UIKznn+8O3bLmHbJkhte9zAk/qi9mdfcmJukXzrsM
 PlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mUA0s/OLF3irpYz8q/+5iIV+g6F7cgz94WGYfbGpTw8=;
 b=kXAquyJlRHZl+OAsBRJrdn6+HU0PVB+zEJ+k+cK14M5x17CRCdy21orF6b1Mp1g4nd
 EigJ+jJt75gf9iLrfYir6FsthS2zjfFvK2lNvoI0MEoFpVoSnIrB4uVWmzaHBI68TRa7
 1/C32M9JuBSyffKJDoUa1MK8lsE/AODVoBYwVZYSeGU04qPTOrSUFJiot4qmIXxP25kv
 iV8ndwjcRf2p/o+x2XUhJHleRyT5v7m0I8tlo22PQL4zeSpTjUTvacJT+gQpb/EurdKM
 DOpov1aTexyADS9aDbLxWszjGnnFPiXTJgORzfrBl75RoY4jM+/9QBTtOqmj/T5Huljh
 kECA==
X-Gm-Message-State: AFqh2koG6hH87lA6ruKA9xmKpywPFB0AHBiWTTqdn84ouoCkG+VbnaVy
 8nTkqkPLGA8jjVYDNNhhAeN+2w==
X-Received: by 2002:a05:600c:19c7:b0:3d9:7096:262a with SMTP id
 u7-20020a05600c19c700b003d97096262amr48776350wmq.27.1673519113813; 
 Thu, 12 Jan 2023 02:25:13 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 ay13-20020a05600c1e0d00b003d34faca949sm21317183wmb.39.2023.01.12.02.25.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Jan 2023 02:25:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 7/7] target/arm/sme: Unify set_pstate() SM/ZA helpers as
 set_svcr()
Date: Thu, 12 Jan 2023 11:24:36 +0100
Message-Id: <20230112102436.1913-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230112102436.1913-1-philmd@linaro.org>
References: <20230112102436.1913-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0gQj6wm49piS

From: Richard Henderson <richard.henderson@linaro.org>

Unify the two helper_set_pstate_{sm,za} in this function.
Do not call helper_* functions from svcr_write.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230112004322.161330-1-richard.henderson@linaro.org>
[PMD: Split patch in multiple tiny steps]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper-sme.h    |  3 +--
 target/arm/helper.c        |  2 --
 target/arm/sme_helper.c    |  9 ++-------
 target/arm/translate-a64.c | 10 ++--------
 4 files changed, 5 insertions(+), 19 deletions(-)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index d2d544a696..27eef49a11 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -17,8 +17,7 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-DEF_HELPER_FLAGS_2(set_pstate_sm, TCG_CALL_NO_RWG, void, env, i32)
-DEF_HELPER_FLAGS_2(set_pstate_za, TCG_CALL_NO_RWG, void, env, i32)
+DEF_HELPER_FLAGS_3(set_svcr, TCG_CALL_NO_RWG, void, env, i32, i32)
 
 DEF_HELPER_FLAGS_3(sme_zero, TCG_CALL_NO_RWG, void, env, i32, i32)
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index cf77bdd378..1d74b95971 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6762,8 +6762,6 @@ void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask)
 static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
-    helper_set_pstate_sm(env, FIELD_EX64(value, SVCR, SM));
-    helper_set_pstate_za(env, FIELD_EX64(value, SVCR, ZA));
     aarch64_set_svcr(env, value, -1);
 }
 
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index 3abe03e4cb..1e67fcac30 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -29,14 +29,9 @@
 #include "vec_internal.h"
 #include "sve_ldst_internal.h"
 
-void helper_set_pstate_sm(CPUARMState *env, uint32_t i)
+void helper_set_svcr(CPUARMState *env, uint32_t val, uint32_t mask)
 {
-    aarch64_set_svcr(env, 0, R_SVCR_SM_MASK);
-}
-
-void helper_set_pstate_za(CPUARMState *env, uint32_t i)
-{
-    aarch64_set_svcr(env, 0, R_SVCR_ZA_MASK);
+    aarch64_set_svcr(env, val, mask);
 }
 
 void helper_sme_zero(CPUARMState *env, uint32_t imm, uint32_t svl)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 035e63bdc5..19cf371c4c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1847,14 +1847,8 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
 
             if ((old ^ new) & msk) {
                 /* At least one bit changes. */
-                bool i = crm & 1;
-
-                if ((crm & 2) && i != s->pstate_sm) {
-                    gen_helper_set_pstate_sm(cpu_env, tcg_constant_i32(i));
-                }
-                if ((crm & 4) && i != s->pstate_za) {
-                    gen_helper_set_pstate_za(cpu_env, tcg_constant_i32(i));
-                }
+                gen_helper_set_svcr(cpu_env, tcg_constant_i32(new),
+                                    tcg_constant_i32(msk));
             } else {
                 s->base.is_jmp = DISAS_NEXT;
             }
-- 
2.38.1

