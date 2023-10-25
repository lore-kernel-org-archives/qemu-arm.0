Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2540186ejb;
        Tue, 24 Oct 2023 23:53:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJaTGwzbifFWwPhRyKV/8MU2StjB3l5itiNJwtwgJr3VjN1E9jSH9xIVpz/Y+aezSLdjKb
X-Received: by 2002:adf:fdce:0:b0:31f:f99c:6009 with SMTP id i14-20020adffdce000000b0031ff99c6009mr9824443wrs.22.1698216829164;
        Tue, 24 Oct 2023 23:53:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698216829; cv=none;
        d=google.com; s=arc-20160816;
        b=Y/PoQgUpxRljx6NcZQvdwtftDYur2Ny3rZnrBwrNlCSfYpfO12Qzf3S1cWIjOm+r2a
         jsWvIHi2YHd948MfuEAZdlsSLxvI72ZoZcDQkY2IUuZwuH8lbnIS2IO+wdmTvHv087Qh
         17zp/TbHjISNChx5b5cC1K+7Y4VPT6U9A5ajwladvLDb3PApNmNXZalc+mYpwzE5J/W/
         mrYEeRSvaTRi0vFXSEo5E+aXc7Utbkgd3GztARzhq10jS0EtxCyc5F7ezNxahoGBk+JM
         9KWPEzHF6vhorpyDyemuowD0JzL6XttbNQBRjvFc4tP2syrHaS5kNi0ol5kLPLkwpe6e
         I3tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=liQUfBw2vuT84lDsRH1NnEhHpPgK8Ag3m+jx8pbJ8Jk=;
        fh=6Rdy7jGRbwX86w18d6SvO4MCmOHIkr4zYKnDyxwhf+Y=;
        b=j0RbsRrF3XAOec50l7liQWv5flm9wDhi5lseFi06tiee/bZ/ll2QWNS7Rv+R11OBil
         7F8YrcQnFv3zQEfknn+0UDDtekksbJyz5WqMYEyPSP93gYiR8P+HRIyDdaIbjPGm6ndy
         voGjAy6ntHI6IDYlU0EisK5bIplB4w7T5bZVH8mRt5paOf6T3IUx/pXlK+kl9tjUtdgU
         C0xSfAEo6oXVvc3WuHgzloj1aUOmhQMsdFmLM2bb4fSqcJF7xWqu+dyDAUKPlupVK2Vx
         4bje91XSt8dc3Jtlw26A6NMJx+SUxDbCy2uo4TFSx3BQCjVsuyG8vvntMkHFuI0/0lIt
         09DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h2jCsW7l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2-20020adff042000000b0032ddfd22050si6679451wro.439.2023.10.24.23.53.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 23:53:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h2jCsW7l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvXlq-0008G4-GW; Wed, 25 Oct 2023 02:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvXli-0008EX-1U
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 02:53:31 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvXlg-0006ra-Hv
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 02:53:29 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40842752c6eso41822165e9.1
 for <qemu-arm@nongnu.org>; Tue, 24 Oct 2023 23:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698216806; x=1698821606; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=liQUfBw2vuT84lDsRH1NnEhHpPgK8Ag3m+jx8pbJ8Jk=;
 b=h2jCsW7lEkfzhHS/255OJ4nM/SRPKiYh7pAzjIfmzf47Y05lUX08Bid35oGGcJiohR
 pE1FoSGkMjBWhiHFTx1ffM2gLzbEV8KlDyZly6/VmzojUr04mgUgBKD1Hz97fbIKsP3z
 MdOEJGOUhQ5poITKv68uAX4z88f7pSEawaqlDzS85PxxAeRD9+Wh0QhLMQbazdY5IGSF
 M67mphoFb/KZddzaXpcbN5DvbK8ifLGumgbCGECpJW/vcqROjHU9xIJQHkJD8E42aPg5
 A2jks3dSxTcQL1nEoBi9SvMjydyuRvcbryyfg/85oeHl5wyFePqk+40TXJpMnqqWhBpQ
 Za6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698216806; x=1698821606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=liQUfBw2vuT84lDsRH1NnEhHpPgK8Ag3m+jx8pbJ8Jk=;
 b=MrNnr15JIj84eeYvko470MG1cW30QmSh/V50sKpBG9sNzdp9RVrH54FZHj12Qdpt8t
 kshjUIZoa9t2dFqE9PbiQn8ovb4gIobcaxAm7MPc9McaRurygVLGXRBabI8KGbEpyzMc
 yQhLRda9vzaNpvBBEaB7feeg8HKnYw1SxSBmYbjYTJgY8w0pp+lz7pRyNhHlWjUY/Yvv
 GAO/8Kk1hR0qoTNDtY0vxELAH8c4qkoMLHfB+vU5MxSXEvac+OoNrsOKlmdso/z9TQEm
 HJ8q3+NP9I6pu/7d8KwRIoyFXRPV6KkODHONzYqLv9gK2RmzzTuyD1jfHAJom1KuRaPp
 pOYw==
X-Gm-Message-State: AOJu0YwnYBAfWSHMH4KN1qa68Sqh2zhjOK3fidXyG42c0xRWN7nPLdXu
 2xMI+3lYNiO+S53NACpIe6UK+Q==
X-Received: by 2002:a05:600c:46cc:b0:409:2c5:b2cd with SMTP id
 q12-20020a05600c46cc00b0040902c5b2cdmr5715576wmo.14.1698216806466; 
 Tue, 24 Oct 2023 23:53:26 -0700 (PDT)
Received: from m1x-phil.lan (ghy59-h01-176-171-219-76.dsl.sta.abo.bbox.fr.
 [176.171.219.76]) by smtp.gmail.com with ESMTPSA id
 l23-20020a1c7917000000b004063cced50bsm13579078wme.23.2023.10.24.23.53.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Oct 2023 23:53:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH 01/10] hw/arm/allwinner-a10: Remove 'hw/arm/boot.h' from header
Date: Wed, 25 Oct 2023 08:53:07 +0200
Message-ID: <20231025065316.56817-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025065316.56817-1-philmd@linaro.org>
References: <20231025065316.56817-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: gokEFgTvcThs

"hw/arm/boot.h" is only required on the source file.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/allwinner-a10.h | 1 -
 hw/arm/cubieboard.c            | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
index cd1465c613..2eb83a17ea 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -1,7 +1,6 @@
 #ifndef HW_ARM_ALLWINNER_A10_H
 #define HW_ARM_ALLWINNER_A10_H
 
-#include "hw/arm/boot.h"
 #include "hw/timer/allwinner-a10-pit.h"
 #include "hw/intc/allwinner-a10-pic.h"
 #include "hw/net/allwinner_emac.h"
diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index 8c7fa91529..29146f5018 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -21,6 +21,7 @@
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "hw/arm/allwinner-a10.h"
+#include "hw/arm/boot.h"
 #include "hw/i2c/i2c.h"
 
 static struct arm_boot_info cubieboard_binfo = {
-- 
2.41.0

