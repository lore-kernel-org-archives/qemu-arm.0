Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1242199wrm;
        Fri, 18 Oct 2019 11:03:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzCexd7tn8kOtJXsEjE8MRRwxy/PjepsWmC9y3mtQmhFbvvG05q6xA5o2GL+PAPlYs+7E7J
X-Received: by 2002:a05:620a:12b9:: with SMTP id x25mr6599901qki.4.1571421820499;
        Fri, 18 Oct 2019 11:03:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571421820; cv=none;
        d=google.com; s=arc-20160816;
        b=EQKqF6/m5WqGbqm8/9VMUZU5SQdAKaYbB5DAo6WpvyiFIcJcA2W9DYlx2cKBfC2V2Y
         aqJy9jy4f1AUznVl8h4kgy6Rq9rJ4mxNgE1hkFwUbMo3k1DD6oKVltOnZjMbSkb6DRDi
         oLbSPWAF95JXv9aqNLbaDEAC2ewDnbOrCAbdg9Z+E3rBHFgucTC3p/95Turg1MEQyw3q
         CXX0CiAwqLBHo2KNI2qES4hMUlQTBAWojCkDUrlH8deHrSTN8UGQSvGCn1yi4cGRqgwi
         yhA9zDB/5ZVQrO4GEn23SwG38HZDJ3s+XNlR7h/I2Dk/1htEaiq8rSaYfL4YqNcEH2Ef
         LpQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=4z2zPWedOviyKqg3qmIWn8g3R8jv2yS1u67ka41eHWc=;
        b=HHhNJq72uGWXQERjhNfy72p7ixC9vNLsUqGvoRdYavFcz3cb9nMc9UUcn/LnVgy29Z
         kSms+olSJcB3XWJLguJe5wQ0/Tk+py5dz0UhJ7pEp9qsCj1oSL0fv3YtIUuLv+uhj8e2
         hTNxWIS+1zGrMY+X2s3mG/YJp63BNZp42oqSlUtDBVYgNVN/KNfTwRrIdHdzpS1GXVKu
         J17iEToWTQLd83mYtkix/JCKM7QW6Th0upl/G2G8TO+tKmGzZ+3AJ6xBMUvwdugS8YtT
         tHFII15fqdVDiQxHRahCka0nWOM4DWakADuXj5WgHc7R8MuO+h2WWulTGFGe+nf88G53
         q0xA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nI0rWgGQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f12si5687514qkg.221.2019.10.18.11.03.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 11:03:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nI0rWgGQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLWbD-0000Ds-8O
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 14:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59490)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWJ9-0006rE-3c
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:44:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWJ7-0005dw-Vz
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:44:58 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:40071)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLWJ7-0005dQ-Qz
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:44:57 -0400
Received: by mail-pg1-x543.google.com with SMTP id e13so3750371pga.7
 for <qemu-devel@nongnu.org>; Fri, 18 Oct 2019 10:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4z2zPWedOviyKqg3qmIWn8g3R8jv2yS1u67ka41eHWc=;
 b=nI0rWgGQzrA9U6zEdQj3b1jl+SAttb9L65Ev0KMFewggAH/JgNkTbBgKH5FUFPaVUk
 yT77aBDq1capTDD5XBJ0kHvzCdLzW6UtviyBLhNXknkCHDTIdwRE8n4wPP/ipPvq42lN
 huTPPuL9IbYNLT2RuvJF2FZm+rZf1BQUIvcsqi+l1ne7UiawUsAaimf2vg27SEVhGf2Y
 +wu4VSTc9ZZovdt++QjjrMcI3FwGjhB9l1KOmwFPGGedB55xqNd0bG3gyY2o/8br/beF
 RsaaHHn7Symv/XgyQANNCF1A4200J3lPZGuMZYYgVaGIvAb3DJl4GBKNwIs0/ZH65EE3
 JFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4z2zPWedOviyKqg3qmIWn8g3R8jv2yS1u67ka41eHWc=;
 b=isAgvnkhVpwRsNGRp77zdYWxQG5oaGtr0p0zrWzJ+9jOLtF9EwXC6Xo56SFZFZxUKj
 53Q31mTPcqkxA8zkYNDcBhtomBDUiWJs2nggl1zMy977UYKB+KPfIAncrLjZ60kXePbt
 h9e4WHoubPL/rf3N6xN2RpZYB8tJZovuedxngDUlv6mVUjo8phX8oItCWQtJ/ay25FfM
 /ozWc7tys9L7FTQ/MYWHFHTm07E43UffD8ztZdnrMycdql56zgT6I5kq3XB0ustK2jCi
 N77HJ2JrU3aHxaxbLiUqJ0R+qUtn1SnWvqSjVKOVXfujMTB2cFZbgoEqWF34gW7Aq3Ag
 lydQ==
X-Gm-Message-State: APjAAAUq+iqxGajxnijP54MR83oYzIi2uIxxNtR91MAgswy6RiCf/7dw
 Dsuxrg98gUM0WNyjLGZmhsM8FUYMch4=
X-Received: by 2002:a63:ff54:: with SMTP id s20mr9314597pgk.398.1571420696525; 
 Fri, 18 Oct 2019 10:44:56 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d20sm7857534pfq.88.2019.10.18.10.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 10:44:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 19/22] target/arm: Rebuild hflags at Xscale SCTLR writes
Date: Fri, 18 Oct 2019 10:44:28 -0700
Message-Id: <20191018174431.1784-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018174431.1784-1-richard.henderson@linaro.org>
References: <20191018174431.1784-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
X-TUID: H/kvIT/fnx5e

Continue setting, but not relying upon, env->hflags.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index aae7b62458..c55783e540 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4174,6 +4174,16 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     /* ??? Lots of these bits are not implemented.  */
     /* This may enable/disable the MMU, so do a TLB flush.  */
     tlb_flush(CPU(cpu));
+
+    if (ri->type & ARM_CP_SUPPRESS_TB_END) {
+        /*
+         * Normally we would always end the TB on an SCTLR write; see the
+         * comment in ARMCPRegInfo sctlr initialization below for why Xscale
+         * is special.  Setting ARM_CP_SUPPRESS_TB_END also stops the rebuild
+         * of hflags from the translator, so do it here.
+         */
+        arm_rebuild_hflags(env);
+    }
 }
 
 static CPAccessResult fpexc32_access(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.17.1

