Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2540313ejb;
        Tue, 24 Oct 2023 23:54:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoQzcs9m8pDfhQN3i8x5HZ9s1+4nAaJ4UbJEDNP63vANcMVQ080i2+yJ+yG0kbdH6V/i0/
X-Received: by 2002:a05:600c:3583:b0:401:eb0:a974 with SMTP id p3-20020a05600c358300b004010eb0a974mr11045679wmq.3.1698216855412;
        Tue, 24 Oct 2023 23:54:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698216855; cv=none;
        d=google.com; s=arc-20160816;
        b=coqGY73Om4r1gY4MbbQ25qiaB15PgQ97rye/zz0rOlNyzWarf6MmNTU/ReE4cDd3Un
         c1kEc3fJQnNdAtF7KcMdsS2JQxkhhagHI7O2/IOCBMJpvS0FQMAQax9N0JgE5vYwyIDM
         xATSDNVoG5c6kZBqEDDMBXv7ohYtDZgrH2SROuobtfJa2bFkGST71gDV8O3CSv7jnj+T
         v3JHW0mAHNgMmFI1C0Oqmqx+mH6LtCA50klDN+S1zRfp8A6qXarOjdGirDPoXF1Uj+HO
         Td9ugy4oNQ+wG8qg41WgU/xWMu0NDkhiZ65gY8mCYNgkG669IDwO2zSk7O0wFZCIKrrI
         uvBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=g7g4xwrGmMffd4ojpgJjQSUiCtKxOCpSH88MmHURSx0=;
        fh=rzGSgA9/lstoNPm20kqpDnCgbj8fpPu90VlCPATC1wI=;
        b=t7xLn4/93ZRQjMiiNTb5gWG6asBIyD4IHAAp00TOfEKjBajwmNDPSLr14qhw0x6MOL
         kIaYYXJoWkvOKG3PPzJuD4SkewekKrMP3Cf/k0wwEgV6jXKD1TU7lf8t/lpZ24Y1xbiN
         AL+w94NDFon0OvJGGknXOjkwOtyj83II//lsB67Est6kzdJMZpR31eWK1c/lRXb5Na+c
         sPbTDXzAst6TYK9OVNCB6X7d2iFcII+3FQCQW/+hrT81wkWvjdshUt2z+uMJ9tNnGMnJ
         Jd1mbYcRpkmja5iGUHtgIkIPkAOsnptrBHhkYeg/pKLaUak1jvN05HDWvCVGnOy+FhZy
         bJYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sJIW+7Qs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v23-20020a05600c4d9700b0040472e7a967si10449972wmp.140.2023.10.24.23.54.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 23:54:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sJIW+7Qs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvXmB-0008QH-6H; Wed, 25 Oct 2023 02:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvXm6-0008Of-DF
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 02:53:54 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvXm4-00070B-DB
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 02:53:54 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-32d849cc152so4048513f8f.1
 for <qemu-arm@nongnu.org>; Tue, 24 Oct 2023 23:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698216831; x=1698821631; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g7g4xwrGmMffd4ojpgJjQSUiCtKxOCpSH88MmHURSx0=;
 b=sJIW+7Qs7zBvJRTtib2rwMHcynuIdlsnROYbaqoyG++XjlDrx+LPKRucM54Ksad5FP
 WZ6pX53VHPU6WXKOq0MuusG0sklIqDMqRxZD0ky+thYQ02tjtBQUXZ4W8bbOFjdMRX3W
 TZpcoa1voTOkfOJmiaLFWvcba6PDKmdOYJ/EKwEgd6Cs8GjMGiStpTT58piske/Bn1TK
 /NdPPLGu0jHMXT93QjPK4dxh7efWtWI2BNd0DQY7UzVesbFeSFR+3TP3QXvPXC8taebG
 0DPecFPIBV8ulCi4lOzgytGqTBvZF93d4vbBksvMXCGKwYnUAhg8uacr1kfonpTC+y/3
 gbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698216831; x=1698821631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g7g4xwrGmMffd4ojpgJjQSUiCtKxOCpSH88MmHURSx0=;
 b=ownQNRUUs2svS1Pr+SVue/Rp4dyd75F5KptYK4zuPGH8wAe1JDIqsMvxsrYpnnuJlB
 Q6PMc2ZH1qpRZpYMgHr7WS2IBa+FxMBiKf5BiQPhLwUPfSTkF4V4Er9+9Sbd4QCIe+Ug
 f7H1eCEPztnuUEzfxoWeLRYZhUd6a8zzgVRr5nrXFwazeM6etS0VaYNFJhvtgQNd9ecE
 Or6jU+ZJ0uPd66ELkI8YouydjHdtNQneHdW3NsnAqEaZdCA3/PAv/PskZpalujwd9qJ6
 qcFdeV75+BHIKCV96itxe3I7fn3JGz0x7+fK0wI3UiF8kbYu2EYRUyJ/L2mx8wqmCdWb
 eH+Q==
X-Gm-Message-State: AOJu0YwupycLWxaqNojgWFtNQq7EhbixDWCFwBb1JB1sOLTuGmIbGuh6
 NQmA/Tq9QtfDOATHTVQUvIM3Ig==
X-Received: by 2002:a5d:590c:0:b0:32d:c09d:6ec9 with SMTP id
 v12-20020a5d590c000000b0032dc09d6ec9mr11243337wrd.7.1698216830997; 
 Tue, 24 Oct 2023 23:53:50 -0700 (PDT)
Received: from m1x-phil.lan (ghy59-h01-176-171-219-76.dsl.sta.abo.bbox.fr.
 [176.171.219.76]) by smtp.gmail.com with ESMTPSA id
 l9-20020a5d5609000000b0032da7454ebesm11385591wrv.79.2023.10.24.23.53.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Oct 2023 23:53:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 05/10] hw/arm/fsl-imx31: Remove 'hw/arm/boot.h' from header
Date: Wed, 25 Oct 2023 08:53:11 +0200
Message-ID: <20231025065316.56817-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025065316.56817-1-philmd@linaro.org>
References: <20231025065316.56817-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
X-TUID: n84bDFS3yjyE

"hw/arm/boot.h" is only required on the source file.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/fsl-imx31.h | 1 -
 hw/arm/kzm.c               | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/arm/fsl-imx31.h b/include/hw/arm/fsl-imx31.h
index c116a73e0b..40c593a5cf 100644
--- a/include/hw/arm/fsl-imx31.h
+++ b/include/hw/arm/fsl-imx31.h
@@ -17,7 +17,6 @@
 #ifndef FSL_IMX31_H
 #define FSL_IMX31_H
 
-#include "hw/arm/boot.h"
 #include "hw/intc/imx_avic.h"
 #include "hw/misc/imx31_ccm.h"
 #include "hw/char/imx_serial.h"
diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c
index b1b281c9ac..9be91ebeaa 100644
--- a/hw/arm/kzm.c
+++ b/hw/arm/kzm.c
@@ -16,6 +16,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/arm/fsl-imx31.h"
+#include "hw/arm/boot.h"
 #include "hw/boards.h"
 #include "qemu/error-report.h"
 #include "exec/address-spaces.h"
-- 
2.41.0

