Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1490225ejc;
        Fri, 13 Oct 2023 06:02:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9xLEFIqo5dfHbQCcrIXTiQcnfSwmOPwuaMMG2gxeHaCgiNluQz/G604hEb9KxGn5g8Il/
X-Received: by 2002:a67:e0c9:0:b0:450:cebb:4f15 with SMTP id m9-20020a67e0c9000000b00450cebb4f15mr32295vsl.1.1697202154334;
        Fri, 13 Oct 2023 06:02:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697202154; cv=none;
        d=google.com; s=arc-20160816;
        b=bRrAfmKcjss+Y1g+FGp+Ri6CsJeFTatMm1SV/fDHVPD33t4kJvi2AcdK9/57GkEhOV
         cF4avvA5UgsG/qUD+Lb+VvjjV/T/ZhI07OMroUqp9Qf1P2UtIN4Wo4XAmiXitf+FCRNI
         BYoE72OPJ/o/Huwp0+vBOPThzO9gzfPrl+nxYz1VIbTtSoUEY4RB1pC7vf8fW57fdQff
         VjJlPrmT1LP5O1AdamLVSEfny3abTw3ot5X9RpHo9VjiioZerV04DGFocE25IrhcwaEX
         QuVXgmY65hzSAoxwNgBhUsljQnJMojGvk3/5P9dh2fkwsrwHKCj1TKJoPs8yyXUNGruA
         VVqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=NXt4GRVCqNqLdB3FCLiLzM01NS8NIOi7cr1FVPF/4e0=;
        fh=fFs7UGnVOueAi6qGPTBS6qj6WzX6NsjPEv+QV7hIp5I=;
        b=rcc7Yt4AenFo7oPeyI9N0T81NqWZZBdW7J3MVUHetV+vYrMfsiRfd92xzW6iYM4Fsb
         cNaKNdOGwPJhGfTEXIlkna98EhA9nPHppWnCdnS+R4albXRA7IcnyAhKsYl+rdYjpEP6
         QHRy4MycYifRzS79Fi7W2ZyzK3g6aVqjH9gl3EQxLmeXBPSM2TJqTSmqfLVZKsdvbScK
         fpIKidxDo8n33Tqp7NLIZ/4k26r+BM/D95BCkDzBxOUbOEPt9Rbemc3UPzvFULsGJZ8H
         0Lepx350ptbZq9pwGvRR5/a99MMKAgymtP4AxtZ68eB/vNpDc9KHUEKS06vcNQJ/ofDl
         Y7cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zfgfhLCW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e8-20020a056102224800b00452720c5371si120174vsb.417.2023.10.13.06.02.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 06:02:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zfgfhLCW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrHo6-0002nx-IG; Fri, 13 Oct 2023 09:02:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrHo5-0002nQ-Gq
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 09:02:21 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrHo3-0003mp-Rd
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 09:02:21 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-53dd752685fso3698644a12.3
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 06:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697202137; x=1697806937; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NXt4GRVCqNqLdB3FCLiLzM01NS8NIOi7cr1FVPF/4e0=;
 b=zfgfhLCWfyNaIeKfjHyOjGMz4vE2lUvtYb6zCcWGVjGGK40bPo+sVVTyECU1H26VfT
 VnbjtonZgqEPJdFBM94XgOFdq32j2DQ1bGbiO3Y8bDGunmu1xHNYJo/lndlrUku9XI4Q
 Gml3FgBbgqaKgo34gTCyRjIIycJlQWXTnUw6i6HSQMSkWzDmCy3DBbmzMWn2GUJl/gKH
 EULDWlykYwV0bJi8ndok1c7K8h3twbdtvm/pz9MePqUv7/72EMHfHRlrn+hrcKjRx5o+
 LFGxC+9SmSFJ3AQAyv8Vc0mf3hmiifZLLX+AINrNAMX+m6b26BQ419qY2+6ZJREtMCuP
 c0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697202137; x=1697806937;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NXt4GRVCqNqLdB3FCLiLzM01NS8NIOi7cr1FVPF/4e0=;
 b=IwTbL9oE7KLtzX9XnAJK9nwK6nsUTjh95xQ1+tzuYmpZk0/Nl9Ttutsjs0EeufNULq
 lxtjXjUrei5Ofvar7ZEPkitdGqAIGa8uBrnkvXcWJ0v7yML4ttu3Dpqw79VLt4vsUuIg
 Li1liqHVtLX4QiujseywPVzQz8RjPNmdeo7D2dgNzMhavSOjDa97TFsJNnm46d0c20J2
 V5/tDIHRE3JqCRkr/Sd1XTXSniKe9sn5CkSMZtpsJFIQcCg0Q9Z805umtoubUtCXl3/G
 Q05LIZ09LMmlqwxmJUsbLj3P5JItatS3PycoxGJQeqOyAd5B+U9EMa1lCtlvTzyr2cA1
 Pq/A==
X-Gm-Message-State: AOJu0YwEm8SyQ5GFmf+EV1Mwoxtd8Ao/gLJxbwiNxaCpBxQ4/4oPyiC8
 xY7Ft965SdNtCFaWNHbIm/Bo9w==
X-Received: by 2002:aa7:d588:0:b0:525:6c9f:e1a3 with SMTP id
 r8-20020aa7d588000000b005256c9fe1a3mr23006574edq.20.1697202137472; 
 Fri, 13 Oct 2023 06:02:17 -0700 (PDT)
Received: from m1x-phil.lan ([176.172.118.168])
 by smtp.gmail.com with ESMTPSA id
 bx21-20020a0564020b5500b0053e163a1ca0sm1932929edb.1.2023.10.13.06.02.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Oct 2023 06:02:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/arm/exynos4210: Get arm_boot_info declaration from
 'hw/arm/boot.h'
Date: Fri, 13 Oct 2023 15:02:14 +0200
Message-ID: <20231013130214.95742-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: p3Xu97Zuj1A1

struct arm_boot_info is declared in "hw/arm/boot.h".
By including the correct header we don't need to declare
it again in "target/arm/cpu-qom.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/exynos4210.h | 2 +-
 target/arm/cpu-qom.h        | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index 68db19f0cb..d33fe38586 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -30,7 +30,7 @@
 #include "hw/intc/exynos4210_gic.h"
 #include "hw/intc/exynos4210_combiner.h"
 #include "hw/core/split-irq.h"
-#include "target/arm/cpu-qom.h"
+#include "hw/arm/boot.h"
 #include "qom/object.h"
 
 #define EXYNOS4210_NCPUS                    2
diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index 514c22ced9..d06c08a734 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -23,8 +23,6 @@
 #include "hw/core/cpu.h"
 #include "qom/object.h"
 
-struct arm_boot_info;
-
 #define TYPE_ARM_CPU "arm-cpu"
 
 OBJECT_DECLARE_CPU_TYPE(ARMCPU, ARMCPUClass, ARM_CPU)
-- 
2.41.0

