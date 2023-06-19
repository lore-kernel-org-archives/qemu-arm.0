Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2883963ejt;
        Mon, 19 Jun 2023 08:57:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6RuV25kX+NOAkcCpuT1/3YgNbiyya+GRhKK+wC1cgVXNmZPnuCstjpKq8VPMnow1cTXq0y
X-Received: by 2002:a05:622a:1105:b0:3f5:1495:1a98 with SMTP id e5-20020a05622a110500b003f514951a98mr12906225qty.37.1687190278097;
        Mon, 19 Jun 2023 08:57:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687190278; cv=none;
        d=google.com; s=arc-20160816;
        b=rBKmXyuOu7hrZX4+8jZId6RXRn3X/54AD73EkZ+1TFz0tO4pGfXlShbJOMdq0+VQCu
         JBx9kmB3snRq9rRvNxn4euhUQeLOlOcyKqDSrQAKXlc1C7+EHW9/qRXBJ/LfU0tDDBOn
         X0rTnvtPSTy3i5GYoFfRmKopA6UzQouKfQEL2udnsg4D89ROksOifbYH7koXA3gpL8TK
         f0VjMr1x3CNLgldVDsbRcushJhl3zXPtvwAdXEt6u3sJNEHiFYxzx5frdOIPUxpFOAfo
         ZqwZ+ZtOh9bzR9H2m8eaCyWO4x3FxvEYEIDAWOqTN5owZT0Nz52r6OHPJ9j1OhCoAqNp
         Z3jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Z2jMOqP0txK9r7JLBWhB+MQlTl1Nm4HNVxv5EqHk7Co=;
        b=c8q0ikbT9GpWShhCz1CTBcjQgNdI6BfRxkfu2uS2dqqmMml6n6AXt34UvGaoIbnVTw
         COJGWhAhtn7w/E1mqOOU2wmPJYdLPmCGMk5c2YKycMnVkBSBTjY6OLk05etvcY3UgO93
         8Mfyh9iZOjpvgXMntVW/v6Ky2nudpOSKEdPtrOjD23vSRFDjA8UWr0N+ye1Ydq7eabXS
         XcHukXEIMGz3Ji8clHBNqSCZmfr8DvfKWuAngsBBOdiUzqnGarlxqTadmBrlCsQys9aT
         +9pNAS+mf9tCFuE4YexSkiEl1YCvN4I1PFlJ6mDJSwpetqm+IhodBohq0cBNWZSotm/2
         qMVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HvJ5gDfb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i13-20020ac85e4d000000b003fdea42e02bsi18130qtx.371.2023.06.19.08.57.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 08:57:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HvJ5gDfb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBHEy-00077T-9E; Mon, 19 Jun 2023 11:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBHEw-00070A-8g
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 11:56:26 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBHEu-000538-Gs
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 11:56:25 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-978863fb00fso590713466b.3
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 08:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687190183; x=1689782183;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z2jMOqP0txK9r7JLBWhB+MQlTl1Nm4HNVxv5EqHk7Co=;
 b=HvJ5gDfbl9YzJXddB419cG8Jy22v7qYW+IWMmXC/NguxSSjFaRbwjLywt/708UxNFa
 631CEdOWHKNwQ9/WekHHt6bC5tShbjBsUIRTBwbf+A15Aj/A7w81s6SqMN3DdrNXhNIy
 GR8zMDHLYcDrTd0IGdbWohjS6NebK6xOjIQrgBhtdeHFRuz67Q7twvsRtsI4eTUJ4tgw
 yWc4y9p7JreLrr5Sr6xLheMXK6Mn6tgdelFKZgd3gHTcj2RhCyw+y9VNKoxe05EZLYHx
 HTKUyJ0+86MEmfTx9/N2pJy8IpYeHkCkmyGxKhnCEzPA1W9qv5IdtBK7ML5x35cwpzrg
 275w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687190183; x=1689782183;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z2jMOqP0txK9r7JLBWhB+MQlTl1Nm4HNVxv5EqHk7Co=;
 b=ECnv/qBsB5hb5StVRHtPoVGR5Wpdvc4maJKDhSlQnmK84SxsFf3heIs3Y5TMFeVpwm
 FV4y7BT3INSzVQe0SCXC6K8rKzaSdoFsHuw8GYLUEQ9ZYiJYoIbFm8CnDaY9M29/rsf/
 4o3V2sfG73fO/Iyd8P/xd/rjbIXB4jh2GKDRIoD/CX8Ba948W5L1EMw7azWqOt+ocDSw
 omCbCxnnIGGPWlVaRfeiV8skTAb2w/YJGDp94Z24BQo9Ve+Pg4HsCfmRUJ3wNw3Yflut
 EofeDbz233DjDW2h8ax3cmLWb1nPMy8Vm4sJLYl9OfAWsUWX5KQDSf/+Yf7rIZSe5Ouc
 0f6w==
X-Gm-Message-State: AC+VfDx/2vG2pVew9sd9q4nqSGzCOoxylPK+Ms/IB9P/9vU8cr4alI8s
 3ijpAuitHz878k7+k62kXuYt/YjEdlvATa6JGfkEsA==
X-Received: by 2002:a17:907:1c07:b0:94a:8291:a1e3 with SMTP id
 nc7-20020a1709071c0700b0094a8291a1e3mr10347732ejc.74.1687190183292; 
 Mon, 19 Jun 2023 08:56:23 -0700 (PDT)
Received: from m1x-phil.lan (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 lo25-20020a170906fa1900b0098692f1b803sm4425152ejb.166.2023.06.19.08.56.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Jun 2023 08:56:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 20/34] target/arm/tcg: Reduce 'helper-sve.h.inc' inclusion
Date: Mon, 19 Jun 2023 17:54:56 +0200
Message-Id: <20230619155510.80991-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230619155510.80991-1-philmd@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
 <20230619155510.80991-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
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
X-TUID: 6+6+GFpK6f5/

Instead of including helper-sve.h.inc via helper.h which
is included by all TCG files, restrict it to the few files
that require it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.h            | 1 -
 target/arm/tcg/sve_helper.c    | 4 ++++
 target/arm/tcg/translate-sme.c | 4 ++++
 target/arm/tcg/translate-sve.c | 6 ++++++
 target/arm/tcg/vec_helper.c    | 4 ++++
 5 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index f347305c0f..38d3d1a2f3 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -148,7 +148,6 @@ DEF_HELPER_FLAGS_3(crc32c, TCG_CALL_NO_RWG_SE, i32, i32, i32, i32)
 
 #ifdef TARGET_AARCH64
 #include "tcg/helper-a64.h.inc"
-#include "tcg/helper-sve.h.inc"
 #include "tcg/helper-sme.h.inc"
 #endif
 
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 8a0d966aae..79a42af591 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -33,6 +33,10 @@
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
 
+#define HELPER_H "tcg/helper-sve.h.inc"
+#include "exec/helper-proto.h.inc"
+#undef  HELPER_H
+
 /* Return a value for NZCV as per the ARM PredTest pseudofunction.
  *
  * The return value has bit 31 set if N is set, bit 1 set if Z is clear,
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 24796e5d9e..e63b9883a9 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -25,6 +25,10 @@
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
 
+#define HELPER_H "tcg/helper-sve.h.inc"
+#include "exec/helper-gen.h.inc"
+#undef  HELPER_H
+
 /*
  * Include the generated decoder.
  */
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 605cce0979..87f92b4d1d 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -26,6 +26,12 @@
 #include "exec/helper-gen.h.inc"
 #undef  HELPER_H
 
+#define HELPER_H "tcg/helper-sve.h.inc"
+#include "exec/helper-proto.h.inc"
+#include "exec/helper-gen.h.inc"
+#include "exec/helper-info.c.inc"
+#undef  HELPER_H
+
 typedef void GVecGen2sFn(unsigned, uint32_t, uint32_t,
                          TCGv_i64, uint32_t, uint32_t);
 
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index b0aaca38e7..99f81df9e1 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -37,6 +37,10 @@
 #include "exec/helper-proto.h.inc"
 #undef  HELPER_H
 
+#define HELPER_H "tcg/helper-sve.h.inc"
+#include "exec/helper-proto.h.inc"
+#undef  HELPER_H
+
 /*
  * Data for expanding active predicate bits to bytes, for byte elements.
  *
-- 
2.38.1

