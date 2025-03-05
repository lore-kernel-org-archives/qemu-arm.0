Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp911976njm;
        Wed, 5 Mar 2025 08:13:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV1m8ZCU/WanJHjknt1a6AraT075SkbuqYuCfQrOFCxevZvJN8nAOeTMWcZlXg2eIb5bI53Ot0kOrdQVQ==@linaro.org
X-Received: by 2002:a05:600c:3b13:b0:439:8e3d:fb58 with SMTP id 5b1f17b1804b1-43bd29843c9mr34994475e9.11.1741191184673;
        Wed, 05 Mar 2025 08:13:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741191184; cv=none;
        d=google.com; s=arc-20240605;
        b=YgCAyq1dawt8fR2Q67aaF1DbOu9/1wDiNC1OmP+osg/JqOadiSUrs4/ZR8/Irp2CpL
         4DaYabsZ5C+e/2CL2qKeUWN6YpzvcGTxBmDLuSUe7VA+4Om8dYckv6oKrCR2DgcEjx1O
         3mKICpbPdTNB+/P8K6gGmGeGgcTyT1JhOXAheJ376JaOvkGN48wmUBZsNNcmcvCrVcQ6
         WY7S5mGnYHzC6yVpEVYFopeA0UjVzyPULBJrlYqkV9uqbWnSiijosz2gD7HGwu67bZQJ
         IR1p094lUjM1aDJetO6huPpKNZBrxpk8+Kvq0ff6pXSAmzVXAlAjzoW8Lj0guQHC+gGA
         owiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Qg/30+ydc7IJRGhxhQY+axZZcsxzMfsJFGVXHCMQm/4=;
        fh=EQcmDryWrifuer3YkLiNv+uyLuD9Ei2un8J9fRPWsL4=;
        b=Yqnt41bKaZ1XtReUtSzLYcnllYXdtFdmELuyaqG67L2whYz94QZSpjACGiZ36B7sot
         J4Gj5QrBd67zkqyqPP+hds1Reb5O0LpVj+uBgl7BCsLFxhkbR3lQ8yDaBUGLDsouG+so
         LS4KIxbhJtIC1WAyNyOuaE7804eSe2D5hMHv94RTK4TU1sATCg+faY280d4fbVHctt48
         uGqaPR4y9LymsRm+mOl5grlj/8CX8Wx4u08y3fGGYR8EZH5Tt5LxBEH7q2JnLuzCHT9a
         U7pOZLHveITm+dILpuvcsiyY8v0ppQ6uxeqaeavZWJjhXSlHCdXw335iSa5AJCMu03op
         VB+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xJaWjT8G;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43bcbb455f2sor17812505e9.7.2025.03.05.08.13.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Mar 2025 08:13:04 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xJaWjT8G;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741191184; x=1741795984; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qg/30+ydc7IJRGhxhQY+axZZcsxzMfsJFGVXHCMQm/4=;
        b=xJaWjT8GrAKQ3+MP3vvpopGApUEy7eD0SL+rAvTLfXD0QrYqV/yHDdbrczdAIhOCbZ
         VC5N8LM9DrdCc20zKQDarjxGfTXrH4+kHDfKdSfYRSJz+2yUrkyfqnE0VFCObDhk0peH
         tB5GCLhEFC8Ya/2swRDeE9p7vEUfQK3xqUk/qysbRZbzD2Aa0sy3VAnFl3dqyVcJuZcm
         fdp8k77qPCbc8iYtR36i7N20xTvoUynFD1w30bWpxiqxNzHBrN9EzbZZH8Y2i7e5NfOG
         zeyilIp6Rr+doHhpN4WWJ9AgYt7xQLDT/eH1N0kg8hGYv8oDBwM7QJCv9NLq9Coy5ezY
         mJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741191184; x=1741795984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qg/30+ydc7IJRGhxhQY+axZZcsxzMfsJFGVXHCMQm/4=;
        b=AVcAWvaC937OHZd5Fdkq1Gk8+Cfk/8xGia39+OOpZmggPdAVg90iV/pAcjsOVkz7M1
         fb4h4CGm8jhEnQdvAryl8TZjCkYzz/wwzxPYT5wWGo2rzJEZwdxykzsLhA+89Km9MjY2
         ehqWCS8oDn2z387+CfvLN28XqdVfFWaKVEt6HI40Qr8yoEPYI7cLxZbJap5DiGk0akAl
         KT8KIwtCWsi6uvz2cAaxcZXTftn0Xe9SsvmnKVQSEHX6OpQEzYNs3gwmENJ0nTM4QDRC
         lNvWSIW31NAmQVnvhIpw8UbQQlgZOpgOuK/BhJ3cpI51PC4fG2wiZxkgksnsUPqDew9O
         9Dsg==
X-Forwarded-Encrypted: i=1; AJvYcCVAWdYjrnlY8bNfOF7/BfAAgmCitPIGi0cc8gmN4R51RsDNgaahbJlC4+3dJz1CoiGOGz4jU/O+gemNCQ==@linaro.org
X-Gm-Message-State: AOJu0YwGyb2Sff3DKdXjgWPpmVHhYT3lrJeQSowxdNoFdCUS+bb8tQz5
	hXFkRLet5Z8xUEhIPnH1ii/02HQuy81MVOoXpTgOUxeZC0lT10UmH6weZ8dm7UU7pXdZ44XgC91
	/YpYyZA==
X-Gm-Gg: ASbGnctPHAKnBmgU6HyCgMqBt09vW8tnbUSw6W9QaKL8swB1YwfJGes5gR7jv1oN85v
	wOPqWOakntDCnU8qhJltHMRQJ7cpXQ91Dfyi5F1BcuC9PfNhS3MPPmV2Vua7JwK+EUr3co2IS+n
	K4W7NekrmuBjQvVQw4r8ERLiMNP0399wYi7fJ+ulsLxGuydJcouCgPsjYK7yqv2kmW4o98INowM
	uGPlm6/HSLl1bG4A2RBqhi40otENsWXboF9tLL9/o67gB0MN4ypOl1FO28wX8HBS5UW6E9AbbLC
	EgOJ7o41Tfzhmtq9D9m3fFMt4tL4L836Noz3sgd5wm162DiK8w6jxuA5hWYZSGlmXUia+tOCuK+
	IlswXfusPRSknptRMoog=
X-Google-Smtp-Source: AGHT+IFxDeN876InatIsSjSDZ80/TUSkTjwZpHJWITAgNTNUaTC/7w/dc/lOxL2VwxyFs/KwQhqeEA==
X-Received: by 2002:a05:600c:35cf:b0:43b:ca8c:fc76 with SMTP id 5b1f17b1804b1-43bd29a84f1mr29527715e9.18.1741191184087;
        Wed, 05 Mar 2025 08:13:04 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd42c6203sm21718385e9.24.2025.03.05.08.13.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 05 Mar 2025 08:13:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 3/4] hw/arm/aspeed: Replace TARGET_AARCH64 by legacy_binary_is_64bit()
Date: Wed,  5 Mar 2025 17:12:47 +0100
Message-ID: <20250305161248.54901-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250305161248.54901-1-philmd@linaro.org>
References: <20250305161248.54901-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FqvTbUkHx4OL

For legacy ARM binaries, legacy_binary_is_64bit() is
equivalent of the compile time TARGET_AARCH64 definition.

Use it as TypeInfo::registerable() callback to dynamically
add Aarch64 specific types in qemu-system-aarch64 binary,
removing the need of TARGET_AARCH64 #ifdef'ry.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/aspeed.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 98bf071139b..3f18a4501e0 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -28,6 +28,7 @@
 #include "hw/loader.h"
 #include "qemu/error-report.h"
 #include "qemu/units.h"
+#include "qemu/legacy_binary_info.h"
 #include "hw/qdev-clock.h"
 #include "system/system.h"
 
@@ -179,11 +180,9 @@ struct AspeedMachineState {
 #define AST2600_EVB_HW_STRAP1 0x000000C0
 #define AST2600_EVB_HW_STRAP2 0x00000003
 
-#ifdef TARGET_AARCH64
 /* AST2700 evb hardware value */
 #define AST2700_EVB_HW_STRAP1 0x000000C0
 #define AST2700_EVB_HW_STRAP2 0x00000003
-#endif
 
 /* Rainier hardware value: (QEMU prototype) */
 #define RAINIER_BMC_HW_STRAP1 (0x00422016 | SCU_AST2600_HW_STRAP_BOOT_SRC_EMMC)
@@ -1661,7 +1660,6 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
     aspeed_machine_class_init_cpus_defaults(mc);
 }
 
-#ifdef TARGET_AARCH64
 static void ast2700_evb_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = bmc->soc;
@@ -1690,7 +1688,6 @@ static void aspeed_machine_ast2700_evb_class_init(ObjectClass *oc, void *data)
     mc->default_ram_size = 1 * GiB;
     aspeed_machine_class_init_cpus_defaults(mc);
 }
-#endif
 
 static void aspeed_machine_qcom_dc_scm_v1_class_init(ObjectClass *oc,
                                                      void *data)
@@ -1813,12 +1810,11 @@ static const TypeInfo aspeed_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("ast1030-evb"),
         .parent         = TYPE_ASPEED_MACHINE,
         .class_init     = aspeed_minibmc_machine_ast1030_evb_class_init,
-#ifdef TARGET_AARCH64
     }, {
         .name          = MACHINE_TYPE_NAME("ast2700-evb"),
         .parent        = TYPE_ASPEED_MACHINE,
+        .registerable   = legacy_binary_is_64bit,
         .class_init    = aspeed_machine_ast2700_evb_class_init,
-#endif
     }, {
         .name          = TYPE_ASPEED_MACHINE,
         .parent        = TYPE_MACHINE,
-- 
2.47.1
