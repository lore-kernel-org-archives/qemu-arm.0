Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2540416ejb;
        Tue, 24 Oct 2023 23:54:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEs6b6BCy3d05eOz8iwnOp5fm0fOfnEPB2bKnS89u4xbAaK/RGFvb+lrEKXnvDbQFqL9Od3
X-Received: by 2002:a05:600c:a4b:b0:3fe:2a98:a24c with SMTP id c11-20020a05600c0a4b00b003fe2a98a24cmr10557423wmq.26.1698216875212;
        Tue, 24 Oct 2023 23:54:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698216875; cv=none;
        d=google.com; s=arc-20160816;
        b=ZXGtatWjPjtJnnJXryGARHYyH/loAVJL95GwSnK0oh2xnOL4XNwn2d+visc97C9kya
         qkhuIywF5ydGQh+hQmp4CT9//n5WeGwmfvUTUOnLwxjHug3weuqxMBd6WPHJoOB4g8xQ
         fttXyMC0yHaPKBHuDYQ9pxrABeiVCGu62vIk+GRVMXqX9i1z7kA0FrxxOLT1t/baVe7b
         BYcf1r1wLHRB9UV53evlZ2o3G+ecETRPy2mZC/9dRgP1R3wtl7p1C4hYtNCJABeIPCb5
         KSnoBbBz9ZCw73vRmbBaKF2ulAnuivaje/VhW4LA67iFPzUzgtpeYmzharZI3Nb02o4M
         RUgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=394oo7+ySel1V6658dOBRpjALvCFA4gyRwTa12oK//k=;
        fh=lRRVOPoYb3+cZ29hqum0HLITbt48LVEaefnM2mDse8w=;
        b=0n+95bXWSKbbe7LqgFf1IVmZVSbqn4imTyw1eQiVgdpOWpz8WTPCPDWSWU5dUSPG+U
         08tVDlWvBJ+YxlUpCJfILUbT0boVoDtBHMy5K+XfKI5IM+OrvFK8pPXsDseZLAzPIEgQ
         b+fSyn6rLTY4LxfTRpEuD6RV1orehZrbyGR1LMBtMxAvU02FGDB3GwOQEKMRkIjAOaaa
         gJBKwjkwWzMlM5q1zsdyOAFSgW3Gfebu3iLlw7RZVCfsw94p4lSrEJsXkb4QthLHSQkF
         5HTEuE05OzuYZamQF+f7dnRXywKo34Pyn3SEyoskyyOcWzESXlJayQQLZDMODFZ2tfjt
         F2jQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FQPahMRK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6-20020adff506000000b00317c7bac5a8si7036623wro.734.2023.10.24.23.54.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 23:54:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FQPahMRK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvXmh-0000Oz-K8; Wed, 25 Oct 2023 02:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvXmb-0000FG-0O
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 02:54:28 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvXmU-000750-Ul
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 02:54:22 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-32d9b507b00so3821449f8f.1
 for <qemu-arm@nongnu.org>; Tue, 24 Oct 2023 23:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698216855; x=1698821655; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=394oo7+ySel1V6658dOBRpjALvCFA4gyRwTa12oK//k=;
 b=FQPahMRKDfc6UfQTaDoBzc4EFoGdi0WZv1vZ9SI5sBaEBaXwbGkOzWACxJ6pCmSdMk
 icDKfhrxfisLO4lhiN+tPtd3Eal+D8iuLI/NJg3l5U0V4DxzbzervYNtpLKJwyX6MNsQ
 knb1gtbcQOaeSJxqniyah3g7DaVhG6dHDNNsJMP8SXS1vI4GeKl566qrIKtl8CIUpQIL
 NWxIarsDILSswv5QHhZ8tyu3oTIXBvAPVfmw2UwAcGy78lrEsugl6ebBlv/+vAbHq26V
 zOPxpQzlaDbTWLLBoc0GBXIMAkJ3c7jsdobQrlkYWXtH14MWrIYx0oZ9aC4LtjImpeB9
 paSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698216855; x=1698821655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=394oo7+ySel1V6658dOBRpjALvCFA4gyRwTa12oK//k=;
 b=AoVfOHUPwrzvABAo3CCNhd/hm/ITsfs4p6Z6ijlqXYjF0c9INfn3D+yPCcfGnF9nL7
 IXBsdLPkqZv0u8Zgu9zfjRXape8I3XfAynmmselFM/XvzVotWATbb5KDV9oqCWqjo7Kx
 wrs0Zp5npXa8bEYKI7tWRxFfV7zzSIIVwC95yzVNkqF0+q8mqruuQKyhyWK3atolrN58
 K8r0+jr1qn1GEyhIHls6kjrJafqvY+6dvtcNqIAq3nT4SAKhSwfi1YTuCriHI8rp+XfN
 3mUCITfbvQgr9oh31aBTqSofWTlqHcK7Wcjo+nji+cTtid7wm73ktKUsQ5EnIHMMFgiT
 1Vyw==
X-Gm-Message-State: AOJu0YyPo/X/H8E4kMyRyNLHF1bp5McgPh/Z5bL8xNIW4/hnICSR5YXP
 R4nzDEFcI4F8M3Ii3QD76k2WYw==
X-Received: by 2002:a5d:5232:0:b0:32d:7f70:74eb with SMTP id
 i18-20020a5d5232000000b0032d7f7074ebmr11469238wra.52.1698216855428; 
 Tue, 24 Oct 2023 23:54:15 -0700 (PDT)
Received: from m1x-phil.lan (ghy59-h01-176-171-219-76.dsl.sta.abo.bbox.fr.
 [176.171.219.76]) by smtp.gmail.com with ESMTPSA id
 f10-20020adff98a000000b0031aef72a021sm11415464wrr.86.2023.10.24.23.54.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Oct 2023 23:54:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 09/10] hw/arm/xlnx-versal: Remove 'hw/arm/boot.h' from header
Date: Wed, 25 Oct 2023 08:53:15 +0200
Message-ID: <20231025065316.56817-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025065316.56817-1-philmd@linaro.org>
References: <20231025065316.56817-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: DzwklbHrOoiB

"hw/arm/boot.h" is only required on the source file.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/xlnx-versal.h | 1 -
 hw/arm/xlnx-versal-virt.c    | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 7b419f88c2..b710d71fb0 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -13,7 +13,6 @@
 #define XLNX_VERSAL_H
 
 #include "hw/sysbus.h"
-#include "hw/arm/boot.h"
 #include "hw/cpu/cluster.h"
 #include "hw/or-irq.h"
 #include "hw/sd/sdhci.h"
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 88c561ff63..537118224f 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -19,6 +19,7 @@
 #include "cpu.h"
 #include "hw/qdev-properties.h"
 #include "hw/arm/xlnx-versal.h"
+#include "hw/arm/boot.h"
 #include "qom/object.h"
 
 #define TYPE_XLNX_VERSAL_VIRT_MACHINE MACHINE_TYPE_NAME("xlnx-versal-virt")
-- 
2.41.0

