Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421A3CAC598
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Sep 2025 14:32:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyWco-0008TV-AG; Tue, 16 Sep 2025 10:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWan-0006Bh-Mn
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:23:38 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyWaU-0008OD-Sa
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 10:23:32 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-b5241e51764so4102126a12.1
 for <qemu-arm@nongnu.org>; Tue, 16 Sep 2025 07:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758032585; x=1758637385; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EJhr2YI6iB2xGTJI/fnQ7ZhqiroWE31mRa2JZAO6wpc=;
 b=DkyZ0KEbOHhbNvS6YiF6I1l9K306+pmiUnMIAbP1o5P1f02/j34jkVEjZY+YzsCQhW
 oa0vCXBlhkblrXBhWUeZY/+w1Fo6kRLhO0gTLChII8KFqSszeU3NFj4JkbUxQINGMB/L
 hA4x44Tf8bj/Y/uUiPYj4OMpLUZeXoT22xXFrX7pYiiDsde/7YDoiG096sMussNwoPSD
 RWaFAPvUJyZfPeX7yfiuQrMLajcO9w9rPvr3lUTKfQlqFxGfiV6IHUlk314qY/O4TOGT
 4RvDGYWryHCjBmk+5MtQ0p32dvjfaGFMPMI+tCRAXGYJWi8ldyYeu31R6aLSKK/p+viv
 7jmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758032585; x=1758637385;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EJhr2YI6iB2xGTJI/fnQ7ZhqiroWE31mRa2JZAO6wpc=;
 b=bf0Bix5bYGkBblYgSxsOwWr1+ApaCtS8rGUFuEE0CLkVk5vZ4a8oxEdWolMHryJlj/
 1XPU8PPs9m4j3+cRSlNnfkHgt7upz+g6LU3w9Fd2ItkxdWDHxjCXm+8eVssNYzmaKx/D
 tR/UURa1m17LL9xuzsR2M6hYbtEn5hm5uOLrkn5CbpFTO2wNMLmtgytxX8AcL5VYYF4t
 JFrevKg16clW2eT9h6Lt63BVyAgLuiNWUsOWh0NPzo3WGM7t9tldNkUYsb0G2DXVA8xu
 lM6COikxl7Ju9zn/lYRXv0oBw0koUlHiXEg6U/ulgiqqYhXAcIE6JokYsKE+1Xv3CQ8k
 75bA==
X-Gm-Message-State: AOJu0YwP93X0YcLivKR5ToUMsbauJ4XA4wAUg10H/zrONkv5+BjDil+H
 UUap8EKfpVIKO9Jmid/6gzFXxiIxGD1kPQOU9VtHKvm75pBKY2g4LZ7qupTT1ozF72ej3veFUHF
 pHiSa
X-Gm-Gg: ASbGncu/sxskka/wfQ8Kk+Gyzj2O1RXEngG10i24dsEUPvQ8rXJan9HkpVfP+IBTkWL
 F0477fO/hdx6QWr+i+FR5/s9wHKgj+ktNE5Jgpqn2dQK8KXvRtHfEbZc21SsX7CHbYd7Ax9OSGe
 sk+vYkKf3aBSoSgP4PoVS/7TpobMzTsYL6uf4E8FWnmnPwCZQQhvnHBtGJjZfqerACgzFGUImR2
 kNjeOeF+pWGOrpoAGNc4IgdlQ3Ze1u64TxZQw3G6Kk4BKCMeHzshyIDhcZ1xUQKcLAO1Q1/PUTS
 vsBiZF+0gFntWvaQkc8bgOUAy9+K//o4oDF3+BqdFjRapUShxkr3VisfKhM8fiH/XAtmNZfJsff
 z1+3cJ+4IcMFgnZWSp0+j2LUhNxsy
X-Google-Smtp-Source: AGHT+IGhEzeXjMpW0/gcNvT1rjfrJiTwVqmyvMwcbWvYdRG0lXVuWQb/QzeAQf6aqtXPmeqO0mBp9Q==
X-Received: by 2002:a17:902:ce8b:b0:24e:e5c9:ecfd with SMTP id
 d9443c01a7336-25d26a589bemr229082835ad.42.1758032585462; 
 Tue, 16 Sep 2025 07:23:05 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2651d2df15esm73459905ad.45.2025.09.16.07.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 07:23:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 32/36] target/arm: Split out redirect_cpreg
Date: Tue, 16 Sep 2025 07:22:33 -0700
Message-ID: <20250916142238.664316-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916142238.664316-1-richard.henderson@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 599e7a36ee..c0fa2137b6 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2455,6 +2455,19 @@ static void gen_sysreg_undef(DisasContext *s, bool isread,
     gen_exception_insn(s, 0, EXCP_UDEF, syndrome);
 }
 
+/*
+ * Look up @key, returning the cpreg, which must exist.
+ * Additionally, the new cpreg must also be accessible.
+ */
+static const ARMCPRegInfo *
+redirect_cpreg(DisasContext *s, uint32_t key, bool isread)
+{
+    const ARMCPRegInfo *ri = get_arm_cp_reginfo(s->cp_regs, key);
+    assert(ri);
+    assert(cp_access_ok(s->current_el, ri, isread));
+    return ri;
+}
+
 /* MRS - move from system register
  * MSR (register) - move to system register
  * SYS
@@ -2603,9 +2616,7 @@ static void handle_sys(DisasContext *s, bool isread,
          * fine-grained-traps on EL1 also do not apply here.
          */
         key = ENCODE_AA64_CP_REG(op0, 0, crn, crm, op2);
-        ri = get_arm_cp_reginfo(s->cp_regs, key);
-        assert(ri);
-        assert(cp_access_ok(s->current_el, ri, isread));
+        ri = redirect_cpreg(s, key, isread);
         /*
          * We might not have done an update_pc earlier, so check we don't
          * need it. We could support this in future if necessary.
-- 
2.43.0


