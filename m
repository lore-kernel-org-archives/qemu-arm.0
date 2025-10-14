Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17A6CCD18E
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 20:18:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8lJp-0002UG-49; Tue, 14 Oct 2025 16:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lJZ-0002Ih-Ao
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:08:13 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8lJ1-0005Md-C0
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 16:08:07 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-27d4d6b7ab5so78104205ad.2
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 13:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760472452; x=1761077252; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yRaxPSO4dMwTU7bjid4OQ5BAEwqmP9lcBzf0KnY7hNw=;
 b=TXT0UBMzoQikr/wZqxmK5Jc2b21TgbIpy1MPOLD8mXmA726t/rIclYjxpUyVjKkHnl
 iOxIBh+sSc4wi0pNys11M9pvoRhDnhPQqIjpnUMJ1vpCoES2d+BXpCgHN7aE6NRC7EHY
 WAosxUN9rY8noV4Wq9f1ikVEUUNX7W2kKalCZlBg6vnPAJDar7RGZDovWhjMNriiyB71
 4ZUpo8mjoi3kpw8e0do3PNpBJb4CXx9uFSAyBgHwVccutwGZS9a8/0LDRuS8fX/+lNyo
 CczkbnO/V43cDN+gOI04Rk59Hfwt4TSEtJH4iSagRwqZWhHtpL+DRlOgxF4fqe4B5iG7
 docQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760472452; x=1761077252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yRaxPSO4dMwTU7bjid4OQ5BAEwqmP9lcBzf0KnY7hNw=;
 b=cnyF2rLncrzD/QqXzLq/zFZ74eM9WsFr4NJPvRGN8cCUX0G0yNpQssZxfjGq1oEScH
 +JgJSbKhQcaektopA3Ii97w73UPBkWwWbILBtP0Xr6cXNA4SCZkJO88VdjG7FwDCC1Bd
 7VOmtkSxz80Ma2cs+BuzprIOXJopAPFhIyhAVn9G6n7pun1nq5ymncqthjft/qKa/Qf6
 gNHG3fgZBFfCkdQqq9y1N6aUjvgjnN154/4O+GXJDoFFLoTb+xaXBbgmaJLQpdRTKPOQ
 bRvBShhBSv0tFEkWOwPbyTBrgvkipEf1trLc5e/Yyw46STvVYytfRv073erLkNDkW+u6
 zbXQ==
X-Gm-Message-State: AOJu0Yy0Jm26YTRD4+FjxaAnAkM7v9dplOA64wvl3OHJhENfJX9td1ha
 5wX8LCDL7k2g4DFyK9SQTBJQflEzQcQH8QIicF9zSTaFDSjgzWz82jBvaIgq85aN06c=
X-Gm-Gg: ASbGncshP2mJSbq4btrApxlHw3kupiP9H3b/vShckP0vuUnhhSZPrdAmrqMxH+Fah6X
 xI7/dt5VhLpiCHnD3GHtcsyn4BlTMNwpBNdOnVc8kkRR0KahXwPzJhLj05OM2cSlAe+8HTlu/Fe
 Zp0LqWJ25bfabtAiWO3S9661WWi9SIufky0M6cENpu+8Kv4hxU2hDnjfHQ/dwdM0HEtcOgsgjHz
 xvWRNVBNmYkGAlXlwcW161RZU+4ZYlvVuJIxUhaR+QSCxMCQ2bo8d5PqeqIjKIHbzhi/X46mYnJ
 sS0o7HFbnLZdF1tWJFIwbCwU+bMU2lVGg1WoBa6MkmsVpy+ZS31RsJ+dDcYGfB9KT3qMcKoYEjV
 vcqVgr0bL4rJ7F3B7RWArV74ixaERE3ARGuKtrYxXc9RP2yqJ86U=
X-Google-Smtp-Source: AGHT+IEK9RR5sH8HJh2tDFhiar/aojYHHVRrKRHfotWTPFS1+LRx8AZwiu/DbcX5pJgV7hbxk/+eeQ==
X-Received: by 2002:a17:902:e784:b0:24b:270e:56c7 with SMTP id
 d9443c01a7336-290272155cdmr351352835ad.7.1760472452206; 
 Tue, 14 Oct 2025 13:07:32 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f93ea2sm172100975ad.126.2025.10.14.13.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 13:07:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 18/37] target/arm: Introduce helper_{get,set}_cp_reg128
Date: Tue, 14 Oct 2025 13:06:59 -0700
Message-ID: <20251014200718.422022-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014200718.422022-1-richard.henderson@linaro.org>
References: <20251014200718.422022-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Helper functions to invoke the write128fn and read128fn
methods of ARMCPRegInfo.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper.h    |  2 ++
 target/arm/tcg/op_helper.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/target/arm/tcg/helper.h b/target/arm/tcg/helper.h
index 4636d1bc03..45bb87fbaf 100644
--- a/target/arm/tcg/helper.h
+++ b/target/arm/tcg/helper.h
@@ -90,6 +90,8 @@ DEF_HELPER_3(set_cp_reg, void, env, cptr, i32)
 DEF_HELPER_2(get_cp_reg, i32, env, cptr)
 DEF_HELPER_3(set_cp_reg64, void, env, cptr, i64)
 DEF_HELPER_2(get_cp_reg64, i64, env, cptr)
+DEF_HELPER_4(set_cp_reg128, void, env, cptr, i64, i64)
+DEF_HELPER_2(get_cp_reg128, i128, env, cptr)
 
 DEF_HELPER_2(get_r13_banked, i32, env, i32)
 DEF_HELPER_3(set_r13_banked, void, env, i32, i32)
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 4fbd219555..9c7b18fe65 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -1026,6 +1026,35 @@ uint64_t HELPER(get_cp_reg64)(CPUARMState *env, const void *rip)
     return res;
 }
 
+void HELPER(set_cp_reg128)(CPUARMState *env, const void *rip,
+                           uint64_t valuelo, uint64_t valuehi)
+{
+    const ARMCPRegInfo *ri = rip;
+
+    if (ri->type & ARM_CP_IO) {
+        bql_lock();
+        ri->write128fn(env, ri, valuelo, valuehi);
+        bql_unlock();
+    } else {
+        ri->write128fn(env, ri, valuelo, valuehi);
+    }
+}
+
+Int128 HELPER(get_cp_reg128)(CPUARMState *env, const void *rip)
+{
+    const ARMCPRegInfo *ri = rip;
+    Int128 res;
+
+    if (ri->type & ARM_CP_IO) {
+        bql_lock();
+        res = ri->read128fn(env, ri);
+        bql_unlock();
+    } else {
+        res = ri->read128fn(env, ri);
+    }
+    return res;
+}
+
 void HELPER(pre_hvc)(CPUARMState *env)
 {
     ARMCPU *cpu = env_archcpu(env);
-- 
2.43.0


