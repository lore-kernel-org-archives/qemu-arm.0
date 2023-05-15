Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6590537ejq;
        Mon, 15 May 2023 08:25:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4ky9qex/OSh+3aY5WuYxGcd+g9xaa4ai+8+Hl8b1ikN0c18Rjc2cxcs5jKIAvKPu6rl4tW
X-Received: by 2002:a05:6214:3018:b0:621:265e:f726 with SMTP id ke24-20020a056214301800b00621265ef726mr39744787qvb.43.1684164347368;
        Mon, 15 May 2023 08:25:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684164347; cv=none;
        d=google.com; s=arc-20160816;
        b=zjjgCvSClMETN0OQBgvUeBok1WsRuDz45PYcnean9qn1VYGi0q/l7O7t6rrrbfxikG
         GgRhAqASj+dUKSLWyfhRdlOsIJN7M66pFne+5sa3V1qOI0z2aEWmw6HdRd+u7MboqzBq
         EyLo4ahcHrwl7w/ajeRmMVgfMUtfCld3AaSD1XJUVrbzOx692yVVFa40stwRUbx3l8aQ
         UVKUetSoHqLJ4QpRMpD9CnPn5y67uCpBeuh0CDmcCh9zUoy+Aa+uCSTV7+zbi0nXDwSo
         KlxnTN0c0F+sEFkYDC837OeFS1i4eq2jeHY3J4Oef2s6ZVvHg9g2uYetcqz4GTcOwH+g
         Leyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WjHj7SEbww3DXTRNkJQIziiBJKKRW1RlTjQnuos+9yc=;
        b=nCUzXztzKKm7V51ruJGZFxkoB9Cwgc1TE+3dbfqM1R5mk7MFn9l1BYsaH1Gmd2Pvad
         PHq0wWGTS6kXIr6EES7rNlQ4aGTJ4hJ6hhVOXtJov08McozZJDRIrRBji9m2RbcFT00Z
         NMlufO2mIM1yk4iKKIaeTR4ChbIJRSLCKzY0MifwvyVMzzPbcugW2X6DTCf9/WOEmgmq
         5X9s17HmNjKTvfv+CUNyU3uoWgX5hgilErDw6lJMSqRBUtpx+8ZlSG6kmoVQNlTaUk/l
         IYLwNjZJv5kN6cJXofNhq39d6x91Wbw6tJvL3M9Xl9sza0sWMXDTFIbhp4KjCvkKa7xB
         1Nfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ahEt4rWQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d19-20020ac85ad3000000b003e970fedc49si8970702qtd.51.2023.05.15.08.25.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 08:25:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ahEt4rWQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZIW-00084j-05; Mon, 15 May 2023 10:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHK-0006vn-UA
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:28 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZGR-0004uA-59
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:33:37 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1aafa41116fso87159795ad.1
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161205; x=1686753205;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WjHj7SEbww3DXTRNkJQIziiBJKKRW1RlTjQnuos+9yc=;
 b=ahEt4rWQeXhEzDbAU6Ui5eLXYz1GIjQ7FlyH69ElqkXdM0GhYfGVf+eevcN8PfxAjj
 hNbNHcBCHjhNUvqJ/cSllWZd/vCxteA21LGj9hAKlbbeLqC3BvY6XOUAxn5vKM87yv8Z
 MxCd+mPeM56HV0n5P8DY+ugBXoQPjxezx4hpcMC1vmQmJW5L8U59mKx7qF0ZD0wtH7h6
 noI7l94N3Lg4T2pwezIfPSAV/io8kCD2yckQhuT6qFTvSuXbDIOFSEzUNcvv7rEtj8za
 g/tQssgcVipSDaUzyNuNAkg6Uv/80Xc8x+Au+SUbK3wbrljomqx0ACyoTl1TJXHIMDMf
 sHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161205; x=1686753205;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WjHj7SEbww3DXTRNkJQIziiBJKKRW1RlTjQnuos+9yc=;
 b=KJTAMSzqhlVYrN3VvLQDgfHefOZajnhvDl0vSx7h/KVWiRiB4ia2CHakymyNNmbjtf
 2Le88ioX1v+Babm5hRG6dwG8sNh3l4oc1CINTO7OGxVwIfaDl0WDRBc93DOngF4lxxSc
 JE1IqmxNTPw8/x1XCKvdF7ET2jka1VMODkecV80BaP1A7oCs7ZsEXdbCjGkxxNUWkLKa
 LXuY89Pp48jHchW9vseT0dNfVnJsFlImx8/4m5aiKBODM0vsl5eOXkwdkWnWak7LjKQD
 TVS72fNDkis5k2+tnbtzbtZI7nZvSIdzOxUUKhX8OsQY01r1y/yGF6rt12oDxj4S6pMN
 2C8Q==
X-Gm-Message-State: AC+VfDxOhxxysqbzmBCwMKPFXnBmbP9TYqCmM5aCSaQOiGlWzVLcNOPJ
 7hEN5fG2kJRdBsxgkW7l5IFv0Fe3tlAFBYH4pWw=
X-Received: by 2002:a17:902:c085:b0:1ab:d16:3c8a with SMTP id
 j5-20020a170902c08500b001ab0d163c8amr30257003pld.6.1684161205301; 
 Mon, 15 May 2023 07:33:25 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 12/54] tcg/aarch64: Detect have_lse, have_lse2 for linux
Date: Mon, 15 May 2023 07:32:31 -0700
Message-Id: <20230515143313.734053-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: A2t5qHpp+DTf

Notice when the host has additional atomic instructions.
The new variables will also be used in generated code.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.h     |  3 +++
 tcg/aarch64/tcg-target.c.inc | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index c0b0f614ba..3c0b0d312d 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -57,6 +57,9 @@ typedef enum {
 #define TCG_TARGET_CALL_ARG_I128        TCG_CALL_ARG_EVEN
 #define TCG_TARGET_CALL_RET_I128        TCG_CALL_RET_NORMAL
 
+extern bool have_lse;
+extern bool have_lse2;
+
 /* optional instructions */
 #define TCG_TARGET_HAS_div_i32          1
 #define TCG_TARGET_HAS_rem_i32          1
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index e6636c1f8b..fc551a3d10 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -13,6 +13,9 @@
 #include "../tcg-ldst.c.inc"
 #include "../tcg-pool.c.inc"
 #include "qemu/bitops.h"
+#ifdef __linux__
+#include <asm/hwcap.h>
+#endif
 
 /* We're going to re-use TCGType in setting of the SF bit, which controls
    the size of the operation performed.  If we know the values match, it
@@ -71,6 +74,9 @@ static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
     return TCG_REG_X0 + slot;
 }
 
+bool have_lse;
+bool have_lse2;
+
 #define TCG_REG_TMP TCG_REG_X30
 #define TCG_VEC_TMP TCG_REG_V31
 
@@ -2899,6 +2905,12 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
 static void tcg_target_init(TCGContext *s)
 {
+#ifdef __linux__
+    unsigned long hwcap = qemu_getauxval(AT_HWCAP);
+    have_lse = hwcap & HWCAP_ATOMICS;
+    have_lse2 = hwcap & HWCAP_USCAT;
+#endif
+
     tcg_target_available_regs[TCG_TYPE_I32] = 0xffffffffu;
     tcg_target_available_regs[TCG_TYPE_I64] = 0xffffffffu;
     tcg_target_available_regs[TCG_TYPE_V64] = 0xffffffff00000000ull;
-- 
2.34.1

