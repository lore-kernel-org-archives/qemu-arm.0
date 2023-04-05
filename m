Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp480208ejb;
        Wed, 5 Apr 2023 09:05:33 -0700 (PDT)
X-Received: by 2002:adf:efcc:0:b0:2e4:aa42:7881 with SMTP id i12-20020adfefcc000000b002e4aa427881mr4416687wrp.49.1680710733054;
        Wed, 05 Apr 2023 09:05:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680710733; cv=none;
        d=google.com; s=arc-20160816;
        b=Xz0+RHBK7T9YGdv0HJ11JailVcwEjnquWwdhYmgQPSSAEV5FNP5380wCGBKt54hCEl
         l9xd6oAF9oGP/qpKxXFi9AMc4xeWy3BhHdncxE5m7gSl5j9U5WQYGCDE64UJQ3bPz6Ul
         b1E09kYdTg1rvne8e4X4+M12BGmIl3dFC30JyNDopDYrnrhiPOv9ZhGK4xlTeLDjH5PM
         IPcnRxsEQVmaDWnjSbX/S5ViMZ1o+rZQTVCKWE+lQjVdaEKYiG+7aIISPZcJikoOGWBJ
         DLjfTypauuMJQ/Oseurl0e8sxKrzs0UM2SY93WR9BTuNHK/dgE9+42Fk/b8CRrIraLfL
         Q/dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TXAiv5gPJGzakn6yAF3UQ469jIKkZR4r/iuFrCC5frw=;
        b=THCM2GA4RbrE2hMrImX7SE6X2ACE2t96iKIhqz4u//fdhn8rk9GuMtsP8Qh/CbvB5m
         UQFV6b9Ic4cvcOgKZXeoCo0T5tC2I0tQNDS4p7XBa1suwKMDGHm/+z5OpZOwWAFrSFmN
         Mjzuu9wq0PHZYg2pEf8FudlqgJukM9y37L5wUr/aRDmGTOJHO11DRw4jALcSMs8BZAfJ
         e8AVdmL1hHzkPpTuw6vaG8nH/sAG4ETLSDrXa/JajksZ2bomrnCgTikCXYD7Yjir4NxP
         WYyKDS90sJR7rMy4kXhpUTFsmKsgcK0tE1VpogvqTzyhsXWEHtuUr1mWmByLZfZDMGA2
         zuqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MK0k+l7i;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n11-20020a5d51cb000000b002d87a775b52sor5600065wrv.41.2023.04.05.09.05.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Apr 2023 09:05:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MK0k+l7i;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680710733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXAiv5gPJGzakn6yAF3UQ469jIKkZR4r/iuFrCC5frw=;
        b=MK0k+l7i0JL0N5tdLRQup0z/tS+z9fsal4eicREogGdlwNf9QVbabnZfiviIAYfHBf
         JA3Z4LTUT/MZ/596XiLixMfrIvzM7ysklzUO4TTvJDt47/2W4D9/CzYhb/QcW2qM2DGh
         lV8PnFchupvt62JB8kdIM3YEQBVwi8Y5uTliYYgPdnvE4XiaGrBARmupflOVkRocZ/k8
         F0CNMkRh//wn/9/AGrldf70UiFQf2BIvuEBy7QwNDJ6vwKQhDdHoszOmXwaWZsR7hKME
         u0GX0l3gc0dvqJ6SgJT7MSeNx+4HHimdvMSdJ5XvGckOBpinv7ZG0pcUGyBpL8WdzMFG
         KJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680710733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXAiv5gPJGzakn6yAF3UQ469jIKkZR4r/iuFrCC5frw=;
        b=ha0QP1a7oIBVYFe5RqZpmgo8UmLmIeAHruCfMcnrJdS1Qyj5H6ay1qr7Ks6x/povMo
         rbx/P5GaGsvZqQfo2BjbKcpBIQo52zG9EbAd7ZX7RrcFgZUhuuQx+yiGNDvaNNSK5lqq
         8dlU7KZbYuy0GC/rVagHTtD7j3hzLKOKfxVmfyGwAQWhlukqDhuausiFvTDrkGd1qyRR
         ya79um9DFZo+cYZT5Tf8+ePM5YgT+72B4YyuKiudNYbAc/DbeZrNIVTkbnW5gfaDbC2k
         qu4SP5E+ICtitP+bFCGhTfOpuG74iXPvivgQ4dSdj7z1u4G1lx1++cXmWVZbwfYmbXc+
         5nrQ==
X-Gm-Message-State: AAQBX9e5QoXzAuoMSHj7sAOtIQCox4iX0XQTBIww2JPLzjymaSd1WZR1
	M3wn4YXCgWouAXiLU8fI2jnjt2Mm
X-Google-Smtp-Source: AKy350aJfFZROd28tOYQVpVfLU5O7PA/1sFGTeMRr0g366fxZBdFDsolmijBgmnNZ+HUOQGRU0ODxQ==
X-Received: by 2002:a5d:52c7:0:b0:2ce:a9e9:4905 with SMTP id r7-20020a5d52c7000000b002cea9e94905mr4246512wrv.34.1680710732675;
        Wed, 05 Apr 2023 09:05:32 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
        by smtp.gmail.com with ESMTPSA id m19-20020a7bce13000000b003ee1acdb036sm2606127wmc.17.2023.04.05.09.05.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 05 Apr 2023 09:05:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	qemu-riscv@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 06/10] target/arm: Reduce QMP header pressure by not including 'kvm_arm.h'
Date: Wed,  5 Apr 2023 18:04:50 +0200
Message-Id: <20230405160454.97436-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405160454.97436-1-philmd@linaro.org>
References: <20230405160454.97436-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FD7OVpvtbnKg

We only need "sysemu/kvm.h" for kvm_enabled() and "cpu.h"
for the QOM type definitions (TYPE_ARM_CPU). Avoid including
the heavy "kvm_arm.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/arm-qmp-cmds.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
index c8fa524002..91eb450565 100644
--- a/target/arm/arm-qmp-cmds.c
+++ b/target/arm/arm-qmp-cmds.c
@@ -22,7 +22,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/boards.h"
-#include "kvm_arm.h"
+#include "sysemu/kvm.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "qapi/qobject-input-visitor.h"
@@ -31,6 +31,7 @@
 #include "qapi/qmp/qerror.h"
 #include "qapi/qmp/qdict.h"
 #include "qom/qom-qobject.h"
+#include "target/arm/cpu.h"
 
 static GICCapability *gic_cap_new(int version)
 {
-- 
2.38.1
