Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp103679ejb;
        Thu, 8 Jun 2023 19:25:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ726hyJ2AIHmQRmMUY0MOdxrg8eeoC3siVo78EWiyOV6TspM0gxUmohXGRthXUSrlPG6YBU
X-Received: by 2002:a05:6214:c67:b0:61b:5afc:d4be with SMTP id t7-20020a0562140c6700b0061b5afcd4bemr374287qvj.7.1686277553219;
        Thu, 08 Jun 2023 19:25:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686277553; cv=none;
        d=google.com; s=arc-20160816;
        b=m+QatGlW27Fa1bd/csOksxfbbJltl3ML6p1RB9ga7vgclT2/tYWACzNvfqIiWV6+4m
         9ZeEoeUnYQH4FXSKlfw65paMolAA7emjPeC4o77x/lg9jJxMvwQVT0UKhPgu1Kh7vSvx
         dJ/kqS3kdzmj/GqkfwmF2oxJcWfieAukxo5vvPaBXOUl7YHVTGldFm/gJ3IGN9zBKn0G
         drOD3JMKZJn5kWqVo2tR/RXM5nZ3tq9EZBZ+KpCcfgSw69kpvwEWDPQZrLVfQdi89nuP
         t7LzIUTIVj4UIvHRS4GhC20RmYYh8mi0aYsokJ83EldfFDjpNoNmggl1fCSr30jCoxx9
         EeVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pqEpHLv387miC8e5l2/HE3hMgLmxzv9wY41InkeK+gI=;
        b=L8b3uRAcWSBN8XH0Q1QlZ5WPvVURkjpxJBEv33HtTgdMlqSTDgQ/MH+H7AmbcD9f5g
         ETNZygxCfGC/fqSNUGvTQci/9tT7Xu0YMVRNe/zwpkPaKUKbJoGYq7IaBXDtzSizTh+x
         1HVWwp5q+klK94xKixMwEdjUzucxpR9rvpEHcotj+xTZ6EFNHPR9LiPWQ49Hkb9zVghc
         T6iff6PEHLG/NqqExryLozerGvtPb05udT0N04kpCymamg2XI20aXqhdtu81xR8ipHkl
         8tRYPpWQyjzB4o9bpiGRqhkNLaC380a5qcFPAkfSreSYIPYGrcl9kJSTVlMCsyiN4zTO
         DOnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q2j94Mv+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iu8-20020ad45cc8000000b00625b9a391e6si1691328qvb.105.2023.06.08.19.25.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 19:25:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q2j94Mv+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7Rnw-0002u5-Ts; Thu, 08 Jun 2023 22:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7Rni-0002g9-P6
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 22:24:30 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q7RnS-0005bV-Ur
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 22:24:29 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-651ffcc1d3dso1009341b3a.3
 for <qemu-arm@nongnu.org>; Thu, 08 Jun 2023 19:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686277453; x=1688869453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pqEpHLv387miC8e5l2/HE3hMgLmxzv9wY41InkeK+gI=;
 b=Q2j94Mv+e7Zpjw1sM4pKwrTS4TSbaliX1MWs+rVCYyPore6uwpj6Xbu9DD7l9ytDKp
 Me+fnnQcE0sCPAi45ggfMD2g8FwkCN9L/4k2tokPse0NmKur8nT1uvYPkLhy57NqN+L0
 +j48YxWVRRAB9WRs37bUARbn/4JCdxr/vb8+Q+IAczSGGXwgDHieveGTlykeq+HrCbua
 BczPH12fvt5sGvPscDZPL7DWa25i1XhnaWG9WbGos28YXZ7v1tozstybz82gW5vOAE+X
 I76toN/6s5CuKDQq4HqUnMlOE+kBxYxGQuyLkPixKLQ+/pMf5uyC7BEymBE+6m88O8oz
 rZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686277453; x=1688869453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pqEpHLv387miC8e5l2/HE3hMgLmxzv9wY41InkeK+gI=;
 b=TnjxuZkuVsKf3EsFsNgYe5r9orZ5kYhNCsCdwXFrNAOnEs5T4Co+WrsJEvI9NJU+rf
 bP9v1S1mxsX6l4iHDknowNCBZQQzD+2c6Nu2CY42fcCqmYLw6n6LXAQCfLhyiIl+s3uO
 OhGFQCFuvFyvBEnemPBwbn7KFRxxGD37wmdaaym8w9bOVgtvSMrecRhIyPwLzb1N3ptI
 GNuByspGIJmgPDOg0VfBuIHAC6AO2DvSQwI1cONy6uje3tWx+FSfBissDrG0KpQuJAlQ
 zT4E/ldlNpmqlqpvAwceD+yIEMuCYPXaVbwsAzsxHGvoGw/uWe23C3wac2/YLDMU+yO2
 fUGg==
X-Gm-Message-State: AC+VfDzwCyD+SyM5FxQoP5lZjxWT0tJQHXS2PDkJZVoLWA5/McMwnTwz
 mcoGY8owU35KcMxwh8labYas3g==
X-Received: by 2002:a05:6a00:1911:b0:663:8255:8cc3 with SMTP id
 y17-20020a056a00191100b0066382558cc3mr29055pfi.7.1686277453528; 
 Thu, 08 Jun 2023 19:24:13 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:b071:df63:5761:f449])
 by smtp.gmail.com with ESMTPSA id
 x25-20020a62fb19000000b0063afb08afeesm1686458pfm.67.2023.06.08.19.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 19:24:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH v2 11/38] target/riscv: Use aesenc_SB_SR_AK
Date: Thu,  8 Jun 2023 19:23:34 -0700
Message-Id: <20230609022401.684157-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609022401.684157-1-richard.henderson@linaro.org>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 4EooI7KshX6E

This implements the AES64ES instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/crypto_helper.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index 2ef30281b1..b072fed3e2 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -22,6 +22,7 @@
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 #include "crypto/aes.h"
+#include "crypto/aes-round.h"
 #include "crypto/sm4.h"
 
 #define AES_XTIME(a) \
@@ -136,6 +137,8 @@ target_ulong HELPER(aes32dsi)(target_ulong rs1, target_ulong rs2,
     AES_INVMIXBYTE(COL, 1, 2, 3, 0) << 8 | \
     AES_INVMIXBYTE(COL, 0, 1, 2, 3) << 0)
 
+static const AESState aes_zero = { };
+
 static inline target_ulong aes64_operation(target_ulong rs1, target_ulong rs2,
                                            bool enc, bool mix)
 {
@@ -200,7 +203,12 @@ target_ulong HELPER(aes64esm)(target_ulong rs1, target_ulong rs2)
 
 target_ulong HELPER(aes64es)(target_ulong rs1, target_ulong rs2)
 {
-    return aes64_operation(rs1, rs2, true, false);
+    AESState t;
+
+    t.d[HOST_BIG_ENDIAN] = rs1;
+    t.d[!HOST_BIG_ENDIAN] = rs2;
+    aesenc_SB_SR_AK(&t, &t, &aes_zero, false);
+    return t.d[HOST_BIG_ENDIAN];
 }
 
 target_ulong HELPER(aes64ds)(target_ulong rs1, target_ulong rs2)
-- 
2.34.1

