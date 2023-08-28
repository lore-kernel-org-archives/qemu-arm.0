Received: by 2002:a05:7022:658f:b0:69:9a19:fb41 with SMTP id bd15csp1748050dlb;
        Mon, 28 Aug 2023 15:14:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJoCl+jlJ96lhKstm6CLbB2e7F/KjIex6FmTe5k0mQuPmRYIg889AAR+dvuh1wHYeWjn8A
X-Received: by 2002:a05:620a:2a16:b0:76f:135d:ce08 with SMTP id o22-20020a05620a2a1600b0076f135dce08mr4908794qkp.57.1693260857816;
        Mon, 28 Aug 2023 15:14:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693260857; cv=none;
        d=google.com; s=arc-20160816;
        b=ArrDD9DSAwCm1XbVXRr18ghTgDmhc8TrcAsIdmzUrMZW0UsdjrKmKcZaeUqlh0JcXc
         e3bZtvMwU7tSek8P4HbLgjB3bYpbifxS9gRtrsnf2ypD3vkvP1akJWWQuEa66QICFov4
         bKxAKzoSnyLdrh7Fa1e4Ge5UqmDkdyVe3M5HcLtKl2zBTEayCTouFv8dHWxMBz36MZcp
         JY046rA1rzkPS+LJC0YcsVaIY085yDpw+WOyMyWFRQmJ30ZPzuFXjV8mUj7wjQVYKBkX
         xhWodBBv1RdHN1qeBDm5UYykn97dMaEEue+IXaYg9x0iF8DdxwQDMx7YvJbcFyKA3YLV
         PUOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=STcIHwCIBIKUCaEpCEknsa0AU+E9EbnqQ4Grrl8BIeU=;
        fh=dbvxcF+wv/s0W/vbgiEajIQqQ0tE/CJz29MvQ77T3zI=;
        b=BjwJ0u43Ao6wYXC2Airue+2Qz/t8Z6B+8ix6DZYEK1fj0Qtf+/9dxtJ0updWjrrjiP
         vlbrYGETCEXDZtsjXqtYi5wqphlWHN9yQ2oLRHsHmiFqniJcBQHaX2W8EA+Z/qoSWvmz
         7Aco/RfFkCRcsoCKLbbS0ZMtHNG7f65fy+79n1VbvXBS0bkuroeJBHN0esLXX0hV6E48
         Cl+52epp5f4KR4pwuMFOtOHh3pvILTkSrJ/rmo2w7uIWaIFUVx5luDYYPQPPExg/letf
         Hg0tp6pOlP+JtJ5Ln5GjvJiv8NNgxgh+OQgLRffVkrR73JOs9xu07bkW0cXL1g2Ukuen
         oYuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sx/Ti0Mz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ud4-20020a05620a6a8400b0076f117f54e2si1980324qkn.668.2023.08.28.15.14.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Aug 2023 15:14:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sx/Ti0Mz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qakUb-00060r-Gx; Mon, 28 Aug 2023 18:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakUa-0005zr-73
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 18:13:52 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qakUY-0004DU-2g
 for qemu-arm@nongnu.org; Mon, 28 Aug 2023 18:13:51 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-401b3ea0656so33721745e9.0
 for <qemu-arm@nongnu.org>; Mon, 28 Aug 2023 15:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693260828; x=1693865628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=STcIHwCIBIKUCaEpCEknsa0AU+E9EbnqQ4Grrl8BIeU=;
 b=sx/Ti0MzB4D+mnn4vcd1ju1B/lQqGn8iyX9DEPQlsXmjszhY64zs96kVSsZcyC8fn6
 NDU4Jgj/ZFceaAB7D8VQjXf/8+lZfjxWj/CmaN/dwUYLATGx87WYoO88S6kcdjSWpesu
 Yn/bUCrFJdJ3GXaDZdkxlyoNZYGQa4MUZHQTxGw5h236QH4iqrjhZXrnGZGgxiYqeV2Z
 5V94rtejl6DY4ItCtOkT+YR2iz1pubOm5UjkSYSY35JsfX4O87ziYVM7iKd7a3MjlVT7
 5r8kwkLEgIsrxsvstfiA2EHVfPdra0J6enS0CFqXCOEUVbsLN3Qdv8iY+zmIx/VgmJl2
 5aCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693260828; x=1693865628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=STcIHwCIBIKUCaEpCEknsa0AU+E9EbnqQ4Grrl8BIeU=;
 b=eOI6JFyuE3ZMt9fmoPBqfWwWPZfNO9PzRslczBNgX6W1ff01bftm9Yi1+eKQcylSD7
 mlNXM7LwdwvtXEYIB2MziqBE94e88uoGHJFvX3mj5r0Fuevh/YL0N5Sa0dvQFnTEqiAC
 PlTZXjB/bUKTh8cKGGWpbt5kC39CAhD4i7evaER77MLZgkkjvIcgvFA2/N1AE3wjC48l
 Op8nCLrCmS4c5dmKBvm1W5NFbMNjVquI+wjcBfLuogHKx+FgW7LCG/DIBQnWijOEX9vE
 um0Dg3EBxCP44qwTV8Oi1SCfFl0VB+Q1xSj+mYPy+VT0qd8xLXGBZ45Q/UR+2ie9jJ2C
 P4EA==
X-Gm-Message-State: AOJu0YyI5IIwnNEYC0IwD92EpJzyq30GcFluVJBcdxazU0wcfhdz7M6D
 19nF+52NyH/6lzvSzutXnBSoTg==
X-Received: by 2002:a7b:c4d3:0:b0:3fb:feb0:6f40 with SMTP id
 g19-20020a7bc4d3000000b003fbfeb06f40mr21915514wmk.11.1693260828802; 
 Mon, 28 Aug 2023 15:13:48 -0700 (PDT)
Received: from m1x-phil.lan ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a7bc7ca000000b003fe1fe56202sm12031404wmk.33.2023.08.28.15.13.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Aug 2023 15:13:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 05/11] target/translate: Restrict 'exec/cpu_ldst.h' to user
 emulation
Date: Tue, 29 Aug 2023 00:13:08 +0200
Message-ID: <20230828221314.18435-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828221314.18435-1-philmd@linaro.org>
References: <20230828221314.18435-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LQwxN8FBLiQe

Only handle_sigsegv_accerr_write(), declared with user
emulation, requires "exec/cpu_ldst.h" (for the abi_ptr
typedef).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index d02517e95f..b2f5cd4c2a 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -21,7 +21,7 @@
 #define EXEC_ALL_H
 
 #include "cpu.h"
-#ifdef CONFIG_TCG
+#if defined(CONFIG_USER_ONLY)
 #include "exec/cpu_ldst.h"
 #endif
 #include "exec/translation-block.h"
-- 
2.41.0

