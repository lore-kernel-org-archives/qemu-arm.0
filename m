Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1286616lfm;
        Wed, 17 Jun 2020 22:12:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzvaochTU4FJZq3T6VNpMaOLaryPLleoQI8lddEdawS9xA0mvR122EVHrEQJgld1y4GkZN
X-Received: by 2002:a5b:18e:: with SMTP id r14mr3674463ybl.355.1592457152995;
        Wed, 17 Jun 2020 22:12:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592457152; cv=none;
        d=google.com; s=arc-20160816;
        b=Rd+ALYrHMAMVRpUojfb3QCubIVErCkRsGNovWonTSKlB2PICZZ65tIuvDb+toWlCpz
         KtTPnNiZ384sfLE4DQm8xwVowr72w216re/GxUWYPE01VAyyUi2++QKoCXsvbG1WN+WH
         PVox48DPBoymQ/pvYRS7zjU/QWz0OskhYO0N2rvMuflKlbgv1HtJPuEtpo1rgk71bxjD
         itLzxn+F1RWwX0637mKN1hf8ZtGPl9oDMsmBHvJT8N1URIDb2Fda55To+7tXQTo4PH1m
         uwxNndmFtoRi+JR7E+rUqOtL2skfZcBt3CK3inE7rVW7ltLst4Jwt2h5he0sn/mjkc/e
         37qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=E14O64whYVWkcjjdESbOpmxAElX5odxSSFhOR+o6tVA=;
        b=nLRpRqdNkE11L9iN2Vt3EecEho6XfPyshysvqVuOsS0pyjN715RE4GbwfOTR7NXwp6
         siTw/BNvs0WDRKZmar0f/fCMys4oSlLcPY/QSgu/PI+T+0sPEnbMugKIt/7ZNhuahd2T
         DPvA+xpMxEJNxAfT+vIPvFUrZvyWBjgiJDI4BqTMJG0617bgPXtYL+1ZUIa7g+zOnmC0
         YLy4hlOsCpkkJBmEaSHDvyo/xC/1wKCwfF8A46qWYZfcK/wLTOt/FNi2HsF00IdZHltM
         ZuaFTuxrGDHOrcNU6n/moZl5KuHiTI89dsn4sDL2QQpvp2Ji4VV7S/1ch+YwnVAtykxS
         c1wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fqoAoBTU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i25si1574885ybj.233.2020.06.17.22.12.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 22:12:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fqoAoBTU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmqm-0007Ho-Cx
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 01:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmF2-0007G1-0w
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:33:32 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:32891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmF0-0003gD-DO
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:33:31 -0400
Received: by mail-pf1-x435.google.com with SMTP id b201so2217632pfb.0
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E14O64whYVWkcjjdESbOpmxAElX5odxSSFhOR+o6tVA=;
 b=fqoAoBTUzhTy/6XCbZEVq1IKvFVp6D+fTRwtO/G22UZPvnEtJbwB8Y0D7zpgB3SfWS
 5aTESsoy+cpyw+MXo75/p8oSBS6b9WFpilptEwEA6+8RyScPfSN4P1URhqoUKAIiy+cE
 /8oFMPK2f6g+8feRAyKCb3bSLFcaHFdVIw2H2IRne2B+DNDigCjIjdTueiYoe5XVKaua
 A3LYRKbrKvJwkJnKN/d92Ksa6+vTGOHiBpEcfyjBVW8JyLM3kU70bt5vAn6FD5ySTfYf
 KMbLKxarvLfXZt7AwM6VCdgHT4ilWxCphJKZLUrWoiXw3ZdRRLdDwv2yMoC0Y43uzfcV
 ExSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E14O64whYVWkcjjdESbOpmxAElX5odxSSFhOR+o6tVA=;
 b=GZ6553466SC5HQic9OZTJihv8rfF+IuNjTXNBqhSqf23a5OXmwD8UKxD7/SsKFrypm
 Z0mjxJAe0DWMIMw3JUGapyEEeYgxNhmFUBGyVbKxvY+z3GNir2KzBPYsEb8q1/fge4P1
 92Y6CwxRaIcTvunSNmyfksfxFGPpA5cXKD2uDGoRv8trAIhwREdqnum685/F87QfUTgp
 FaH7P85CzB6Uv0etrPuT8pp5AqZFrdHvv6Lrtx+bPlrDuLhp6IxwSHHzkMTsYoTrHOKf
 mMPF4QV8dAcbEbWVl0jEImnULZlOxIWJCk45Gc6iyXvSM8kqxohrPvlyWnb/zQyjUrZ9
 F8KQ==
X-Gm-Message-State: AOAM533KSUo4rXFNxwH0zmwVlTmxQ9LtoSd2G6d39eW0YON+WsM8C9Ra
 WU0VjWeAgWWqzttvnn5tZtkTag==
X-Received: by 2002:a62:5ec2:: with SMTP id s185mr2011010pfb.0.1592454809187; 
 Wed, 17 Jun 2020 21:33:29 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id q22sm1288212pfg.192.2020.06.17.21.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:33:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 095/100] tcg: Implement 256-bit dup for tcg_gen_gvec_dup_mem
Date: Wed, 17 Jun 2020 21:26:39 -0700
Message-Id: <20200618042644.1685561-96-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Eek9ExlJZMJK

We already support duplication of 128-bit blocks.  This extends
that support to 256-bit blocks.  This will be needed by SVE2.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op-gvec.c | 52 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 49 insertions(+), 3 deletions(-)

diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 3707c0effb..1b7876bb22 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -1570,12 +1570,10 @@ void tcg_gen_gvec_dup_mem(unsigned vece, uint32_t dofs, uint32_t aofs,
             do_dup(vece, dofs, oprsz, maxsz, NULL, in, 0);
             tcg_temp_free_i64(in);
         }
-    } else {
+    } else if (vece == 4) {
         /* 128-bit duplicate.  */
-        /* ??? Dup to 256-bit vector.  */
         int i;
 
-        tcg_debug_assert(vece == 4);
         tcg_debug_assert(oprsz >= 16);
         if (TCG_TARGET_HAS_v128) {
             TCGv_vec in = tcg_temp_new_vec(TCG_TYPE_V128);
@@ -1601,6 +1599,54 @@ void tcg_gen_gvec_dup_mem(unsigned vece, uint32_t dofs, uint32_t aofs,
         if (oprsz < maxsz) {
             expand_clr(dofs + oprsz, maxsz - oprsz);
         }
+    } else if (vece == 5) {
+        /* 256-bit duplicate.  */
+        int i;
+
+        tcg_debug_assert(oprsz >= 32);
+        tcg_debug_assert(oprsz % 32 == 0);
+        if (TCG_TARGET_HAS_v256) {
+            TCGv_vec in = tcg_temp_new_vec(TCG_TYPE_V256);
+
+            tcg_gen_ld_vec(in, cpu_env, aofs);
+            for (i = 0; i < oprsz; i += 32) {
+                tcg_gen_st_vec(in, cpu_env, dofs + i);
+            }
+            tcg_temp_free_vec(in);
+        } else if (TCG_TARGET_HAS_v128) {
+            TCGv_vec in0 = tcg_temp_new_vec(TCG_TYPE_V128);
+            TCGv_vec in1 = tcg_temp_new_vec(TCG_TYPE_V128);
+
+            tcg_gen_ld_vec(in0, cpu_env, aofs);
+            tcg_gen_ld_vec(in1, cpu_env, aofs + 16);
+            for (i = 0; i < oprsz; i += 32) {
+                tcg_gen_st_vec(in0, cpu_env, dofs + i);
+                tcg_gen_st_vec(in1, cpu_env, dofs + i + 16);
+            }
+            tcg_temp_free_vec(in0);
+            tcg_temp_free_vec(in1);
+        } else {
+            TCGv_i64 in[4];
+            int j;
+
+            for (j = 0; j < 4; ++j) {
+                in[j] = tcg_temp_new_i64();
+                tcg_gen_ld_i64(in[j], cpu_env, aofs + j * 8);
+            }
+            for (i = 0; i < oprsz; i += 32) {
+                for (j = 0; j < 4; ++j) {
+                    tcg_gen_st_i64(in[j], cpu_env, dofs + i + j * 8);
+                }
+            }
+            for (j = 0; j < 4; ++j) {
+                tcg_temp_free_i64(in[j]);
+            }
+        }
+        if (oprsz < maxsz) {
+            expand_clr(dofs + oprsz, maxsz - oprsz);
+        }
+    } else {
+        g_assert_not_reached();
     }
 }
 
-- 
2.25.1

