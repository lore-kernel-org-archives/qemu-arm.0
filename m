Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp29216ejb;
        Wed, 31 May 2023 15:34:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6M57ub4g/UC0QZ8YfA5mfbiWYCer8NbsCeZ//LLwRV36GQuWK6683x2Kvm80SwjH1oJdPs
X-Received: by 2002:ad4:5b81:0:b0:628:35b0:e966 with SMTP id 1-20020ad45b81000000b0062835b0e966mr2733896qvp.21.1685572468106;
        Wed, 31 May 2023 15:34:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685572468; cv=none;
        d=google.com; s=arc-20160816;
        b=wRHTgCeh4+ZFu/t3qJZAYM1LLIUSmubE9DGiZTHzdzD56SZA47gp1rwMEIy/CAbNms
         /yJRUzhhZdLeS/20LDUxeaYnRqU8zl0b1iVolW5oEIEOBsMtrBH/qEr316pVfOe9J+nk
         uBaojtMqEznlv9q2EV/FEqHiYc4f/I1mUs6sQxt9euR1V3N06rKTdK9jDZhTX7SLoC1I
         Vnxsj8FP+OKP+d2mKKkCjMwVVSBvwILoKVHnCdkE9ewdQyShqS9QNnDksP4BQDbQXBcN
         RiKYsMB3rlIQpJsHeuIBeB4XUKgl49YikddtUqAbBCOkCPU53gTQ5NKCc8fVay62tohk
         rg3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UhcA2XjpvZA5C8xTPJzpjClC6ek2VDg4k24l/0BltKI=;
        b=nLMCIA2hUAYBnY0W0G9echGeLlk0ANm5W5TFFR8zHyn6c9Lj4K3fVadyArT/suagk5
         o3WTQ7OJE8i92Li0ROtzcQpcq9zM3ITTGaSMG9lt/KO3CLugv5XzU3n/Di1gZGNbwRAt
         KprslvHsIRtJ/r+iF/rtFCbznYmlAVYMB/jSfVW4z2wVd0pHS6bA5jC9Ih3tnD5eZssr
         hP7rK3mUT+X3r9JZjN1GFg3NNTpKMOq8lReJVw7tNY6M5mA6PTjydbsJE/a+U12PpyW3
         JO0BYSVrEr+2dxtcKQ//R/vTWLfWp9rMRRpKy2aD8GbHiWDBN+jCGzj7RaNuB/C+SvB9
         p94Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DBiO+QLd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pn5-20020a056214130500b00621120c51c2si9192007qvb.591.2023.05.31.15.34.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 15:34:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DBiO+QLd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4UOU-0003ew-Jh; Wed, 31 May 2023 18:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4UOS-0003a3-TT
 for qemu-arm@nongnu.org; Wed, 31 May 2023 18:34:12 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4UOR-000541-6s
 for qemu-arm@nongnu.org; Wed, 31 May 2023 18:34:12 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f60e730bf2so1774165e9.1
 for <qemu-arm@nongnu.org>; Wed, 31 May 2023 15:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685572450; x=1688164450;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UhcA2XjpvZA5C8xTPJzpjClC6ek2VDg4k24l/0BltKI=;
 b=DBiO+QLd9/5fMXbT9Nrpdeu58ICh/zBgnjx0gCqNbE33lEgKOdoU+o6xvq3TfSAEer
 86Qtma2vzO/wP1YvO1HW9hK/7WQ0VIibSeS6pCOqpUKpEIXe5Tp9stdKIm5utKmoh3RQ
 6qZk0Bbc7uF9/veu2JMiyDO7UYWSHUel8lvwdNIHM2IQxCDNGJTs0xC1jYn475SRMcgw
 Fv+pkZULlhczon/0n8SCYC5Q5SDZQlho69F970qdvSrDc3hGl03Y88MoIJKYMskg7xua
 Qrfkbn+Tz62shfU/hkuLt2BC/+mwg6UXfKpWHIin6m1lPjHgrdpDlR4E+lzYGGAKG/kQ
 poyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685572450; x=1688164450;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UhcA2XjpvZA5C8xTPJzpjClC6ek2VDg4k24l/0BltKI=;
 b=OkGjcr1xZKVTlcy0SJ2dx5Xbru6KoejgagJbHCegy7sbFKbPqhzr6348noyDZMHgpR
 VJEtRl4d3dN9JGiC3XjIuPsqCIQo8mmkdHqVNnsUE8iNqlFaGabRsf5prU2Xz6LfF2+a
 jv69QvALkiP6fnWyHpcZeZduC9eYA+IegTAq+21KqykJ0zIYmg7F55Woi7i8aB1y2M2b
 LF7gSZ45HbyykXZ3MnNIWsFPGesmlfO/DWJnyKMpGI+afHxHpTF6KPBJA3GTNkl2DLT2
 zwrsweVF+/O6XW5SqAdFuPGsNiabir3wJHlkaA2mLENYGSuEar2kbMzlu9rChUSLa1DE
 EXFg==
X-Gm-Message-State: AC+VfDzjgb2OhxYGoPqHBQ7c90OAtLZRYyxcN4MOMOjzN/QkfRyGsrez
 XMeiO1kdA4LYPWtU0c96XaTctw==
X-Received: by 2002:a7b:ce05:0:b0:3f5:967:bf1b with SMTP id
 m5-20020a7bce05000000b003f50967bf1bmr598013wmc.11.1685572450353; 
 Wed, 31 May 2023 15:34:10 -0700 (PDT)
Received: from localhost.localdomain ([176.176.146.12])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a05600c205100b003f604ca479esm131623wmg.3.2023.05.31.15.34.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 31 May 2023 15:34:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/7] hw/sysbus: Make SYSBUS_DEVICE_GPIO_IRQ API internal
Date: Thu,  1 Jun 2023 00:33:39 +0200
Message-Id: <20230531223341.34827-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230531223341.34827-1-philmd@linaro.org>
References: <20230531223341.34827-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: +fsfiyZjnUNx

Since we don't have any use of the SYSBUS_DEVICE_GPIO_IRQ definition
outside of sysbus.c, we can reduce its scope, making it internal to
the API.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/sysbus.h | 2 --
 hw/core/sysbus.c    | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index bc174b2dc3..cdd83c555e 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -26,8 +26,6 @@ OBJECT_DECLARE_TYPE(SysBusDevice, SysBusDeviceClass,
  * classes overriding it are not required to invoke its implementation.
  */
 
-#define SYSBUS_DEVICE_GPIO_IRQ "sysbus-irq"
-
 struct SysBusDeviceClass {
     /*< private >*/
     DeviceClass parent_class;
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index a1b4c362c9..f0ba57dcbf 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -24,6 +24,8 @@
 #include "monitor/monitor.h"
 #include "exec/address-spaces.h"
 
+#define SYSBUS_DEVICE_GPIO_IRQ "sysbus-irq"
+
 static void sysbus_dev_print(Monitor *mon, DeviceState *dev, int indent);
 static char *sysbus_get_fw_dev_path(DeviceState *dev);
 
-- 
2.38.1

