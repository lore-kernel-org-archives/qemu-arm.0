Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2150548njk;
        Sun, 1 Dec 2024 07:12:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVUnyCaMbtIuWZwGdW6noaJYGv3pNFLFz9VkYa2ipSBDgVJt1Wf/1J4BB+Jf7ms8Bt8Q/8KmOmWyEGAeg==@linaro.org
X-Google-Smtp-Source: AGHT+IF98Yz+qZtjLYKyEUU90L7I+tzKwPaZn8j8drGCH5ovE/o9pgINqBGxfi3Jg5zE1FNKjVRu
X-Received: by 2002:a05:620a:40c5:b0:7b6:773f:4bd9 with SMTP id af79cd13be357-7b67c44623emr2692094785a.42.1733065925457;
        Sun, 01 Dec 2024 07:12:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733065925; cv=none;
        d=google.com; s=arc-20240605;
        b=G5h1OuSrP3x1i2ytDAwqL9wOnQohtjPnv5YU0RLtGZq2tEh+zvwXZ4O3HUI2eCksHC
         VxEgoUGrk1bf9AyWjVyVNHBUzZp+QRHYkwxXSp1fBavCu0/SQclZ9zw95kskS3PEwzqQ
         wwRbws1fqUg7oA1WILPsZCRpWWXjIQ+/DyeW+f8bkyrRLMw5+YnhlL4VMogvPganA5SW
         uXnPGHJP2Yd1sDwV9BbEOXWl0PmZu9WyIImPJtAgTKMTIvLO7R00WT6a9AgOfkermE+5
         JwH5u1IzfjLMaCsH1Ej/0SFUmqCfk1ce3Vpkux7MqPd7yuEIg0crluToH9OLG/lG+a82
         l5DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=K96QLs+zfxQ8t/7EKBzD/pLvl9nlUU6j6N8gKw/ic4M=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=PJ10sWiBRmjANu67hIhtPqon3DzRV6lgJL6RCcS/63YFLho/ESkeX9fOaqc7fEtAqF
         eclEXK67imG1Hpx4OdmpcbrD2c/2SXFyCGHV7WD5l4uVsdI+jdErfbNxr2mpexeOLzIg
         JslliITxb/pakQhRMj5JJczZgKsHwqMg/zf/mZcugeyVYkXYXloHt7cNDvQ9P0e2Q5SH
         w7gY69KsNEOZvFXDE8iYk5exRL5iFxXh7ioMg+V+ifU5Vi9tvrnHqwUfsKqMHi9dyUTM
         A00VVFA+rFdoWtudUYZytDN12MS7OaDbI0pbIBdSztjT2rFCBldrefZAz990XWbQgOqY
         jp3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UJx0Bgz9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849f2661si954062485a.637.2024.12.01.07.12.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:12:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UJx0Bgz9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tHlWl-0001HZ-F7; Sun, 01 Dec 2024 10:06:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWh-0001Eb-KC
 for qemu-devel@nongnu.org; Sun, 01 Dec 2024 10:06:23 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlWf-000482-GF
 for qemu-devel@nongnu.org; Sun, 01 Dec 2024 10:06:23 -0500
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-71d579d9658so1156397a34.2
 for <qemu-devel@nongnu.org>; Sun, 01 Dec 2024 07:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065580; x=1733670380; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K96QLs+zfxQ8t/7EKBzD/pLvl9nlUU6j6N8gKw/ic4M=;
 b=UJx0Bgz9sKsJuO7k7nkfUZmaVefvGaJB2Ts7y1Aqxt4UPG+kmpKw6OXC7lARMFVjmB
 MaeLJvQ9tOEHwi7ou4j3JCONmCDzQwUx0/cpNVCELTrsatLvXjO7F2sBV/hPiunzOGpX
 iRVwRteR7EL/H4IKpwKavlvKKmDnRlEPfZNY2LVz2GtZ6RASifUeLmvRUXc9/rjEIhCZ
 4QQxDRU2q6wIvWMax8wvoZYA0Trf9WwARFvvsldVhRYdO+khw0PsEsiMkN+n/kLgmI6J
 6x0lZOZQOxsWk/6Ss1R6a993iRoNUMWKB/NYUvq+AHzFaosCuRIwMVETcYTnmlf/kHbB
 C8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065580; x=1733670380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K96QLs+zfxQ8t/7EKBzD/pLvl9nlUU6j6N8gKw/ic4M=;
 b=hj/D6vPDCPxeAx1/xsVf8AhLMFABXLdzRnzlh8TwhS57Bf7X+IWXXRwdrDkhDlIPLg
 Ev9cRop2/ea0b/uuIM+wB23uTGJ4p9emEpAj4I1zsO5cAHnMqEgNM6fxfzDOJ/u2TA9U
 BjLXZ84m3jAJ0hlelOAIbIm72fwRDXFa+fr8TvOnXePsEz05yvIbgj3QrHHLYvOkq4lx
 EGSNZ4zsQtSOp3oVbUDeyJDH935DvZwGiAvPxZapjZ3nqEp6q5US/PytRjse4iidKyhL
 tn7yjKBuoOFo3qR4/T9lZMqakhQ4wejgf5JjnmQ32uq3nOIiwseJaCJdiiPc7cOhiafL
 uIeQ==
X-Gm-Message-State: AOJu0YzmtN8Ni8Ogfig5a7PjzxGpb6JPK83g5+2DDw9PsZEPO6fDNiMR
 Ku0pmtS9dI4FVF2qUcBaQEpfJu50j7I/AmNL1MYSmCUL85psvnHik2AXJ2uyz6gCeH9ztsL08+v
 nmBs=
X-Gm-Gg: ASbGncsF22KBGJ1/wajnTlIYfyz9D777OZomWlo0+THt8G6CHIyq4khw6ohKTKAgc1J
 Qb6jQlz95tUvjVgGcvUEehgUVHWyePKdhbmfSNTjrvSsN9u6JwYwKgwZ1E+5SOBD4nc0DG7yN2j
 meypiEa8crTfJxu92NlMj4y2FsFllZq6ekBwaOS9lLZIh7GNWEWg3fZ/EOQ5ubPgz0jFJwJaus/
 QIC/oLBvmp+PC1cNag97VAJCIthK5qGGMLI2Jp4WZwCBprOQRq8G5WcZN9BrFfa7da/7MehfGaK
 XRmG4o1NwO/7mp/Czgns813P1Je5OkSFfzyN
X-Received: by 2002:a05:6830:2aa8:b0:71d:4196:d92e with SMTP id
 46e09a7af769-71d65cc2d84mr13820098a34.18.1733065580397; 
 Sun, 01 Dec 2024 07:06:20 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71d7254473asm1822220a34.27.2024.12.01.07.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:06:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 09/67] target/arm: Convert PAC[ID]*, AUT[ID]* to decodetree
Date: Sun,  1 Dec 2024 09:05:08 -0600
Message-ID: <20241201150607.12812-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: vFnb5qijoCcB

This includes PACIA, PACIZA, PACIB, PACIZB, PACDA, PACDZA, PACDB,
PACDZB, AUTIA, AUTIZA, AUTIB, AUTIZB, AUTDA, AUTDZA, AUTDB, AUTDZB.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 173 +++++++++------------------------
 target/arm/tcg/a64.decode      |  13 +++
 2 files changed, 58 insertions(+), 128 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 552b45b4e2..852545dfcc 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7764,6 +7764,35 @@ static void gen_cls32(TCGv_i64 tcg_rd, TCGv_i64 tcg_rn)
 TRANS(CLZ, gen_rr, a->rd, a->rn, a->sf ? gen_clz64 : gen_clz32)
 TRANS(CLS, gen_rr, a->rd, a->rn, a->sf ? tcg_gen_clrsb_i64 : gen_cls32)
 
+static bool gen_pacaut(DisasContext *s, arg_pacaut *a, NeonGenTwo64OpEnvFn fn)
+{
+    TCGv_i64 tcg_rd, tcg_rn;
+
+    if (a->z) {
+        if (a->rn != 31) {
+            return false;
+        }
+        tcg_rn = tcg_constant_i64(0);
+    } else {
+        tcg_rn = cpu_reg_sp(s, a->rn);
+    }
+    if (s->pauth_active) {
+        tcg_rd = cpu_reg(s, a->rd);
+        fn(tcg_rd, tcg_env, tcg_rd, tcg_rn);
+    }
+    return true;
+}
+
+TRANS_FEAT(PACIA, aa64_pauth, gen_pacaut, a, gen_helper_pacia)
+TRANS_FEAT(PACIB, aa64_pauth, gen_pacaut, a, gen_helper_pacib)
+TRANS_FEAT(PACDA, aa64_pauth, gen_pacaut, a, gen_helper_pacda)
+TRANS_FEAT(PACDB, aa64_pauth, gen_pacaut, a, gen_helper_pacdb)
+
+TRANS_FEAT(AUTIA, aa64_pauth, gen_pacaut, a, gen_helper_autia)
+TRANS_FEAT(AUTIB, aa64_pauth, gen_pacaut, a, gen_helper_autib)
+TRANS_FEAT(AUTDA, aa64_pauth, gen_pacaut, a, gen_helper_autda)
+TRANS_FEAT(AUTDB, aa64_pauth, gen_pacaut, a, gen_helper_autdb)
+
 /* Logical (shifted register)
  *   31  30 29 28       24 23   22 21  20  16 15    10 9    5 4    0
  * +----+-----+-----------+-------+---+------+--------+------+------+
@@ -8373,134 +8402,6 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
 #define MAP(SF, O2, O1) ((SF) | (O1 << 1) | (O2 << 7))
 
     switch (MAP(sf, opcode2, opcode)) {
-    case MAP(1, 0x01, 0x00): /* PACIA */
-        if (s->pauth_active) {
-            tcg_rd = cpu_reg(s, rd);
-            gen_helper_pacia(tcg_rd, tcg_env, tcg_rd, cpu_reg_sp(s, rn));
-        } else if (!dc_isar_feature(aa64_pauth, s)) {
-            goto do_unallocated;
-        }
-        break;
-    case MAP(1, 0x01, 0x01): /* PACIB */
-        if (s->pauth_active) {
-            tcg_rd = cpu_reg(s, rd);
-            gen_helper_pacib(tcg_rd, tcg_env, tcg_rd, cpu_reg_sp(s, rn));
-        } else if (!dc_isar_feature(aa64_pauth, s)) {
-            goto do_unallocated;
-        }
-        break;
-    case MAP(1, 0x01, 0x02): /* PACDA */
-        if (s->pauth_active) {
-            tcg_rd = cpu_reg(s, rd);
-            gen_helper_pacda(tcg_rd, tcg_env, tcg_rd, cpu_reg_sp(s, rn));
-        } else if (!dc_isar_feature(aa64_pauth, s)) {
-            goto do_unallocated;
-        }
-        break;
-    case MAP(1, 0x01, 0x03): /* PACDB */
-        if (s->pauth_active) {
-            tcg_rd = cpu_reg(s, rd);
-            gen_helper_pacdb(tcg_rd, tcg_env, tcg_rd, cpu_reg_sp(s, rn));
-        } else if (!dc_isar_feature(aa64_pauth, s)) {
-            goto do_unallocated;
-        }
-        break;
-    case MAP(1, 0x01, 0x04): /* AUTIA */
-        if (s->pauth_active) {
-            tcg_rd = cpu_reg(s, rd);
-            gen_helper_autia(tcg_rd, tcg_env, tcg_rd, cpu_reg_sp(s, rn));
-        } else if (!dc_isar_feature(aa64_pauth, s)) {
-            goto do_unallocated;
-        }
-        break;
-    case MAP(1, 0x01, 0x05): /* AUTIB */
-        if (s->pauth_active) {
-            tcg_rd = cpu_reg(s, rd);
-            gen_helper_autib(tcg_rd, tcg_env, tcg_rd, cpu_reg_sp(s, rn));
-        } else if (!dc_isar_feature(aa64_pauth, s)) {
-            goto do_unallocated;
-        }
-        break;
-    case MAP(1, 0x01, 0x06): /* AUTDA */
-        if (s->pauth_active) {
-            tcg_rd = cpu_reg(s, rd);
-            gen_helper_autda(tcg_rd, tcg_env, tcg_rd, cpu_reg_sp(s, rn));
-        } else if (!dc_isar_feature(aa64_pauth, s)) {
-            goto do_unallocated;
-        }
-        break;
-    case MAP(1, 0x01, 0x07): /* AUTDB */
-        if (s->pauth_active) {
-            tcg_rd = cpu_reg(s, rd);
-            gen_helper_autdb(tcg_rd, tcg_env, tcg_rd, cpu_reg_sp(s, rn));
-        } else if (!dc_isar_feature(aa64_pauth, s)) {
-            goto do_unallocated;
-        }
-        break;
-    case MAP(1, 0x01, 0x08): /* PACIZA */
-        if (!dc_isar_feature(aa64_pauth, s) || rn != 31) {
-            goto do_unallocated;
-        } else if (s->pauth_active) {
-            tcg_rd = cpu_reg(s, rd);
-            gen_helper_pacia(tcg_rd, tcg_env, tcg_rd, tcg_constant_i64(0));
-        }
-        break;
-    case MAP(1, 0x01, 0x09): /* PACIZB */
-        if (!dc_isar_feature(aa64_pauth, s) || rn != 31) {
-            goto do_unallocated;
-        } else if (s->pauth_active) {
-            tcg_rd = cpu_reg(s, rd);
-            gen_helper_pacib(tcg_rd, tcg_env, tcg_rd, tcg_constant_i64(0));
-        }
-        break;
-    case MAP(1, 0x01, 0x0a): /* PACDZA */
-        if (!dc_isar_feature(aa64_pauth, s) || rn != 31) {
-            goto do_unallocated;
-        } else if (s->pauth_active) {
-            tcg_rd = cpu_reg(s, rd);
-            gen_helper_pacda(tcg_rd, tcg_env, tcg_rd, tcg_constant_i64(0));
-        }
-        break;
-    case MAP(1, 0x01, 0x0b): /* PACDZB */
-        if (!dc_isar_feature(aa64_pauth, s) || rn != 31) {
-            goto do_unallocated;
-        } else if (s->pauth_active) {
-            tcg_rd = cpu_reg(s, rd);
-            gen_helper_pacdb(tcg_rd, tcg_env, tcg_rd, tcg_constant_i64(0));
-        }
-        break;
-    case MAP(1, 0x01, 0x0c): /* AUTIZA */
-        if (!dc_isar_feature(aa64_pauth, s) || rn != 31) {
-            goto do_unallocated;
-        } else if (s->pauth_active) {
-            tcg_rd = cpu_reg(s, rd);
-            gen_helper_autia(tcg_rd, tcg_env, tcg_rd, tcg_constant_i64(0));
-        }
-        break;
-    case MAP(1, 0x01, 0x0d): /* AUTIZB */
-        if (!dc_isar_feature(aa64_pauth, s) || rn != 31) {
-            goto do_unallocated;
-        } else if (s->pauth_active) {
-            tcg_rd = cpu_reg(s, rd);
-            gen_helper_autib(tcg_rd, tcg_env, tcg_rd, tcg_constant_i64(0));
-        }
-        break;
-    case MAP(1, 0x01, 0x0e): /* AUTDZA */
-        if (!dc_isar_feature(aa64_pauth, s) || rn != 31) {
-            goto do_unallocated;
-        } else if (s->pauth_active) {
-            tcg_rd = cpu_reg(s, rd);
-            gen_helper_autda(tcg_rd, tcg_env, tcg_rd, tcg_constant_i64(0));
-        }
-        break;
-    case MAP(1, 0x01, 0x0f): /* AUTDZB */
-        if (!dc_isar_feature(aa64_pauth, s) || rn != 31) {
-            goto do_unallocated;
-        } else if (s->pauth_active) {
-            tcg_rd = cpu_reg(s, rd);
-            gen_helper_autdb(tcg_rd, tcg_env, tcg_rd, tcg_constant_i64(0));
-        }
-        break;
     case MAP(1, 0x01, 0x10): /* XPACI */
         if (!dc_isar_feature(aa64_pauth, s) || rn != 31) {
             goto do_unallocated;
@@ -8530,6 +8431,22 @@ static void disas_data_proc_1src(DisasContext *s, uint32_t insn)
     case MAP(1, 0x00, 0x04):
     case MAP(0, 0x00, 0x05): /* CLS */
     case MAP(1, 0x00, 0x05):
+    case MAP(1, 0x01, 0x00): /* PACIA */
+    case MAP(1, 0x01, 0x01): /* PACIB */
+    case MAP(1, 0x01, 0x02): /* PACDA */
+    case MAP(1, 0x01, 0x03): /* PACDB */
+    case MAP(1, 0x01, 0x04): /* AUTIA */
+    case MAP(1, 0x01, 0x05): /* AUTIB */
+    case MAP(1, 0x01, 0x06): /* AUTDA */
+    case MAP(1, 0x01, 0x07): /* AUTDB */
+    case MAP(1, 0x01, 0x08): /* PACIZA */
+    case MAP(1, 0x01, 0x09): /* PACIZB */
+    case MAP(1, 0x01, 0x0a): /* PACDZA */
+    case MAP(1, 0x01, 0x0b): /* PACDZB */
+    case MAP(1, 0x01, 0x0c): /* AUTIZA */
+    case MAP(1, 0x01, 0x0d): /* AUTIZB */
+    case MAP(1, 0x01, 0x0e): /* AUTDZA */
+    case MAP(1, 0x01, 0x0f): /* AUTDZB */
         unallocated_encoding(s);
         break;
     }
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 410eaa9333..9083ac4ac3 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -699,6 +699,19 @@ REV64           1 10 11010110 00000 000011 ..... .....  @rr
 CLZ             . 10 11010110 00000 000100 ..... .....  @rr_sf
 CLS             . 10 11010110 00000 000101 ..... .....  @rr_sf
 
+&pacaut         rd rn z
+@pacaut         . .. ........ ..... .. z:1 ... rn:5 rd:5  &pacaut
+
+PACIA           1 10 11010110 00001 00.000 ..... .....  @pacaut
+PACIB           1 10 11010110 00001 00.001 ..... .....  @pacaut
+PACDA           1 10 11010110 00001 00.010 ..... .....  @pacaut
+PACDB           1 10 11010110 00001 00.011 ..... .....  @pacaut
+
+AUTIA           1 10 11010110 00001 00.100 ..... .....  @pacaut
+AUTIB           1 10 11010110 00001 00.101 ..... .....  @pacaut
+AUTDA           1 10 11010110 00001 00.110 ..... .....  @pacaut
+AUTDB           1 10 11010110 00001 00.111 ..... .....  @pacaut
+
 # Logical (shifted reg)
 # Add/subtract (shifted reg)
 # Add/subtract (extended reg)
-- 
2.43.0

