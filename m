Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2883500ejt;
        Mon, 19 Jun 2023 08:56:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4uwCvabsZ0unEVpGE22iT1wv+rZAdXwRpUiZlr6y6Hvx3EK+WGxRxzIg0WCjcszFL8RW1j
X-Received: by 2002:a05:622a:138d:b0:3fd:d813:438e with SMTP id o13-20020a05622a138d00b003fdd813438emr1613844qtk.34.1687190213406;
        Mon, 19 Jun 2023 08:56:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687190213; cv=none;
        d=google.com; s=arc-20160816;
        b=lUhxVxjs4IozNo2KdcFQGL2hf5xV6HGY9rSlIZ+p3SrY7VKtCTlylOJWDrMeizs1aD
         ILDb+/CWio0lrwKDlmDGakvxmuXIBTTeX7CU0pBLv9Uvi5NcUMOsGQGMV8QKtycEzdHF
         N7E2W2bKhZQQ8+/zB6rDw+7dpD+a/83ys3xtR0zV/ELv9AB41nMoi5UP0qbCL2rFPEVc
         0ID6TQ7HPaDCBzPRdFqnS9fKh4BfmDBwOrkC1I0Jhn1ICLxeFBYeZLCHjRfjGeU6dXH0
         98ecAZOo5lFO9XHa8P8yFg2yUOWzo33Nct/xCfrygLhssMHc9/MQkTO/y6lYbnRytWAt
         iNPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=23Uq/LiawC+BbT2i2PShxSNrzbJwUdnbJp/ey1b/dd8=;
        b=ioC1nL/E1P/XrZFLk8gqMZDFoWCTw2agpKDLg/L+vNFfyhMoIODj43PQZNT9bBgkUR
         Rs8lnFQBxsGR+BOaExI8GeqtKIujvO1ipRBzek5wQK5qU4qpQKEJGEhja/Uv5CRcpICi
         CFlW7PVGgjp099ggYUS4B6VchPxH0vUHytc4R/jJPJGjjC1pRLBIa8dazusoOrarKe90
         G4rVDbEgwtS8eAYwSidvHdVQ4lmPGy6ZCDyciK+CLMT6IBUYyvPph40nJS4JyRnGQ3zE
         qCfVLE8hUgWUcyU6kiKkbkcZkkUU3HNlTdwL7deEqqTY1pTYxjV6tnbdz1PuvU8TJpIm
         ZmUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xA2RDmsm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z7-20020ac87f87000000b003ff1fe3cd3dsi24741qtj.180.2023.06.19.08.56.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 08:56:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xA2RDmsm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBHFA-0007aN-D7; Mon, 19 Jun 2023 11:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBHF3-0007Ck-Q6
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 11:56:33 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBHF2-000544-0D
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 11:56:33 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-514ab6cb529so9034930a12.1
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 08:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687190190; x=1689782190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=23Uq/LiawC+BbT2i2PShxSNrzbJwUdnbJp/ey1b/dd8=;
 b=xA2RDmsm4MJbxXO3n3RZdsxZXOlKQ+3VRUqmbWnxLTPxVlm6YTdtJQkXANg6mxz48s
 ZKdfnYdD7l6bq80NCeHewyoG9NjR6t34H6LSeW/lyQOOqDAmugy+T7iYCIALGGIdL7rU
 1W3U2VXq/MBstgMGRYkzogEUL8NKjFSzZZJupE4NO9eIep9YxQ4kcEHIiIQweC24Fmq7
 /6Gi3ODqbYfeAMZ4slMjII/wLYcJAn7FBAzdS2RIFTC1l9qSpzpZ7cq9LeiB88TNbzu5
 ZrnkszaHypgdE+rFGG3hz/NLCBN/YaHUNCoP6zsqjTk4QLdPsqfeCQShAEvuXQRc72xo
 de5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687190190; x=1689782190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=23Uq/LiawC+BbT2i2PShxSNrzbJwUdnbJp/ey1b/dd8=;
 b=PMWUOR3G6mYzM+NAkHqoANUokIR7Q36s3LwM1gX+5U41TnnBIhwMsovkwA3vDYyjCu
 8rdO57slPs4d33jLfjUI6qtJO+EE+RXfcUYj5JJSGFkNHjTTEiFcUmTFIaK9RBnLXwHr
 a8BJvhWx7aljDV9VJlCooxFCWG1dyIf0BHS1sniRl5ldnYk61jmmPxjIuxHDqLmd7atJ
 MPpsGW0jPzfWFxSHaWTcHQF5WNIhS502Zw0ixw/Ws2Eh1dX7wxWrgvdqKnjK39OY1Z+S
 521vftKPlNPh80E3J4tpcJRvRWhxa7fdN95N9fCcFFOrAJKme05+Ad+M4NWkPmZfa552
 J6Zg==
X-Gm-Message-State: AC+VfDzNBBcKlfpEsir28mqmhVg0mympEQfxENUSLlZVLTQKtMIXQSdp
 mWnsulDAlzHWUwueM1FTBX4dMyf9ePbBrmYFXt+XNw==
X-Received: by 2002:a17:907:2da6:b0:988:15f4:fdba with SMTP id
 gt38-20020a1709072da600b0098815f4fdbamr5571371ejc.14.1687190190615; 
 Mon, 19 Jun 2023 08:56:30 -0700 (PDT)
Received: from m1x-phil.lan (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 qw19-20020a170906fcb300b00988c3e96294sm1283875ejb.30.2023.06.19.08.56.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Jun 2023 08:56:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 21/34] target/arm/tcg: Extract crypto definitions to
 'helper-crypto.h.inc'
Date: Mon, 19 Jun 2023 17:54:57 +0200
Message-Id: <20230619155510.80991-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230619155510.80991-1-philmd@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
 <20230619155510.80991-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: JYwCDhxO8LDX

helper.h is used by all units, but not all require the crypto
definitions. Move them to a new header; the next commit will
remove it from the common helper.h.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.h                | 37 ++------------------------
 target/arm/tcg/helper-crypto.h.inc | 42 ++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 35 deletions(-)
 create mode 100644 target/arm/tcg/helper-crypto.h.inc

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 38d3d1a2f3..175589cbb4 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -108,44 +108,11 @@ DEF_HELPER_3(shr_cc, i32, env, i32, i32)
 DEF_HELPER_3(sar_cc, i32, env, i32, i32)
 DEF_HELPER_3(ror_cc, i32, env, i32, i32)
 
-DEF_HELPER_FLAGS_4(crypto_aese, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_3(crypto_aesmc, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
-
-DEF_HELPER_FLAGS_4(crypto_sha1su0, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(crypto_sha1c, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(crypto_sha1p, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(crypto_sha1m, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_3(crypto_sha1h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
-DEF_HELPER_FLAGS_3(crypto_sha1su1, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
-
-DEF_HELPER_FLAGS_4(crypto_sha256h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(crypto_sha256h2, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_3(crypto_sha256su0, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(crypto_sha256su1, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-
-DEF_HELPER_FLAGS_4(crypto_sha512h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(crypto_sha512h2, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_3(crypto_sha512su0, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(crypto_sha512su1, TCG_CALL_NO_RWG,
-                   void, ptr, ptr, ptr, i32)
-
-DEF_HELPER_FLAGS_4(crypto_sm3tt1a, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(crypto_sm3tt1b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(crypto_sm3tt2a, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(crypto_sm3tt2b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(crypto_sm3partw1, TCG_CALL_NO_RWG,
-                   void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(crypto_sm3partw2, TCG_CALL_NO_RWG,
-                   void, ptr, ptr, ptr, i32)
-
-DEF_HELPER_FLAGS_4(crypto_sm4e, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_4(crypto_sm4ekey, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-
-DEF_HELPER_FLAGS_4(crypto_rax1, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-
 DEF_HELPER_FLAGS_3(crc32, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
 DEF_HELPER_FLAGS_3(crc32c, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
 
+#include "tcg/helper-crypto.h.inc"
+
 #ifdef TARGET_AARCH64
 #include "tcg/helper-a64.h.inc"
 #include "tcg/helper-sme.h.inc"
diff --git a/target/arm/tcg/helper-crypto.h.inc b/target/arm/tcg/helper-crypto.h.inc
new file mode 100644
index 0000000000..d86f5002c4
--- /dev/null
+++ b/target/arm/tcg/helper-crypto.h.inc
@@ -0,0 +1,42 @@
+/*
+ * crypto_helper.c - emulate v8 Crypto Extensions instructions
+ *
+ * Copyright (C) 2013 - 2018 Linaro Ltd <ard.biesheuvel@linaro.org>
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+DEF_HELPER_FLAGS_4(crypto_aese, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(crypto_aesmc, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(crypto_sha1su0, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(crypto_sha1c, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(crypto_sha1p, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(crypto_sha1m, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(crypto_sha1h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(crypto_sha1su1, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(crypto_sha256h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(crypto_sha256h2, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(crypto_sha256su0, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(crypto_sha256su1, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(crypto_sha512h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(crypto_sha512h2, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(crypto_sha512su0, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(crypto_sha512su1, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(crypto_sm3tt1a, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(crypto_sm3tt1b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(crypto_sm3tt2a, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(crypto_sm3tt2b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(crypto_sm3partw1, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(crypto_sm3partw2, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(crypto_sm4e, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(crypto_sm4ekey, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(crypto_rax1, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-- 
2.38.1

