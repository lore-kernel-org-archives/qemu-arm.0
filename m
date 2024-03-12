Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp1674806ejc;
        Tue, 12 Mar 2024 01:24:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVieLpUt6bOJCInFHrqrfCGfGfj7I2Cq9GYxz7K8EogvxT5VjM/b2GvRxblSZd9GGozqQr80b3yxY1CDrAJxiY7MEHJnZ1y
X-Google-Smtp-Source: AGHT+IG0n2SB7vgB6czXlGiNY5xrSgh8DJQ3z5jr57c0K4mheZRonG7vX7jjuTUkpEUIX4QKEkHC
X-Received: by 2002:a05:620a:2943:b0:788:7219:65d3 with SMTP id n3-20020a05620a294300b00788721965d3mr4583437qkp.55.1710231876406;
        Tue, 12 Mar 2024 01:24:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710231876; cv=none;
        d=google.com; s=arc-20160816;
        b=XuJ74jfd3J3iCzAF7mhvlsXN/VDRzanwM+iN+r9j5FvLBPihcsgmwFry7IK1QhkdOq
         Vk/UvLItRtHutmkkqGqc6oq4pZ2/jy7SD56QkvcEz808G6es8tSh3llAbQq7N9bKD2a7
         ReX1QN9QNDiF+IB9WJduVVO6y7WZRybnVksYY7oEsYKS5qzSg2q8p5+rVCZQQC4AwQf+
         UA1Kf2cmJ/q0tfXbGkpK92uIM4w2xVss7N0AHwSTPAogLJDA14vgMT4SfUd89SLPrkIZ
         oRwPzTxPxC77rDm+M9560wGlJHAwBCSyw0kudC2S680CcSiKt/d8qnlmM+M6DsB5IqAu
         v3PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kBwjgCbKhXeLtpORHnsvbw0J9Mzl7MSsZnlOxv2Y6SQ=;
        fh=/mmaToZRnT+ZKGhaIhDlJUaQWGx1xBQi7OeZFIt7BSM=;
        b=nu+9kkEEH32MoGadIoTzWSDo2MBUjYzmJO6XgPF6ZSFRG5ZxzBZgMKVhnLlSUO1Meq
         gbe3+48tjbQYl9R2cOMDqL7ZgEt3kv9BLO02YqgGAG0KsoK8e4M2K+AgR20GisxdWgX6
         9OnQxKuOdDoG37GcyTGQxyrZNwkAXpmykwM0s77YTwTt3e0vZjxfvyyJXVHvqsTkRI+5
         jK2JnqiK34SZCdWDtXjni0UsLUo7aRsVr+51A9U2DhFwMWp9QZeVcPZg/ICKY+92RJTh
         DPayGCca5f1hsI9yG7b5HG6eQCrM30G6nhlXvCeBb+rAImsJ329v9DwnkzkgernwOUNE
         5P5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fSs6qo0G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h1-20020a05620a244100b007884afd1843si7601358qkn.244.2024.03.12.01.24.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Mar 2024 01:24:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fSs6qo0G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rjxQV-0006pA-Ma; Tue, 12 Mar 2024 04:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rjxQG-0006du-5f
 for qemu-arm@nongnu.org; Tue, 12 Mar 2024 04:23:46 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rjxQE-0001EQ-4C
 for qemu-arm@nongnu.org; Tue, 12 Mar 2024 04:23:43 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-412f1961101so39746045e9.0
 for <qemu-arm@nongnu.org>; Tue, 12 Mar 2024 01:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710231820; x=1710836620; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kBwjgCbKhXeLtpORHnsvbw0J9Mzl7MSsZnlOxv2Y6SQ=;
 b=fSs6qo0GFAkMGB2bmquhsIJCIKlQ/JxQuCNk2gDul700mC6BlkRhybHda4s4OUUpj2
 xCN3jsP7xefOko3NNUcO09csX8dQuGxbUBS5Ih4swfRV+oktVTIygn/2I6KnCwgxJy9P
 Xj/CotK5P2lSMpE17ycZ1NA9K1tB4dqEQbkEHweXuVJWr0rX1Zwvx+mfX/+7ulJ7KJMp
 wG/ZcUhxIrrAG5AaxF4FxHDXODrCyuDYxdMkhKlSxvgDEHHex+4X7z0zAXDmP2me/8sg
 F54CHTPtDwPsazrGG2m4QrVtsDccCrAH7MvTXQJZxlabDZzrmbqfg+IBpwW30hv4A9c5
 vPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710231820; x=1710836620;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kBwjgCbKhXeLtpORHnsvbw0J9Mzl7MSsZnlOxv2Y6SQ=;
 b=WjDG9GJ7yDeL0QxsNNtNlEbNz7ekpvAVMyMsCmYtBueHkM4LyiZ4t3CA0BKiS/I3oA
 C2EmE8a5m+Jsdb8wT10LAop/o3Xnphiwcs3qBHK8hQmfUQt25Z/s+tV1nTRq6lmZ4N8V
 dolUUovWCW2XkPHAxdAI1bmd4YUeth7WwDLK6WXxrCmmxwmK6O7XRyHcOYB50mHB0lgD
 FDYwjfGKoQJgvWV7UP66ginpojWuMInqjv7tTpnVr4Hzs5xmqQ2rmDHwNfmBMYj+KvX4
 sRqTHujbAqEmE9pWclT5Gy9lMe32R0i/taS6FmVsKHTFAVacQkdEzDLl84qn/KJmdRnu
 27Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVY0ty1TEIDc7HsMxDZitBRzZx/Ug3EWcSTOkwU4MuSVRMB2J1WFT2QzNRtiCda+1a2pswST66hYEMF0ZDxHLcwmOQq
X-Gm-Message-State: AOJu0YzEcZci+8KK8l9GMIxBO+Bl97bB3gDpZrTOKNZbstZFyqOCi6c8
 +h+kh9JL0iZw3UneOliSNMW7qwxlyVSM/BS5vKUiFt5ZxCWtCrc7eEUlsk5D5SUtHdkKBC3bN9L
 3
X-Received: by 2002:a05:600c:5253:b0:413:166e:ad51 with SMTP id
 fc19-20020a05600c525300b00413166ead51mr6524890wmb.2.1710231819983; 
 Tue, 12 Mar 2024 01:23:39 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.206.139])
 by smtp.gmail.com with ESMTPSA id
 ea13-20020a05600c674d00b004132ae838absm5185974wmb.43.2024.03.12.01.23.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Mar 2024 01:23:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 09/13] hw/core: Cleanup unused included header in
 machine-qmp-cmds.c
Date: Tue, 12 Mar 2024 09:22:34 +0100
Message-ID: <20240312082239.69696-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240312082239.69696-1-philmd@linaro.org>
References: <20240312082239.69696-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: 29FMSpWLT3e2

From: Zhao Liu <zhao1.liu@intel.com>

Remove unused header (qemu/main-loop.h) in machine-qmp-cmds.c.

Tested by "./configure" and then "make".

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240311075621.3224684-3-zhao1.liu@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/machine-qmp-cmds.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index 3860a50c3b..4b72009cd3 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -19,7 +19,6 @@
 #include "qapi/qmp/qobject.h"
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/type-helpers.h"
-#include "qemu/main-loop.h"
 #include "qemu/uuid.h"
 #include "qom/qom-qobject.h"
 #include "sysemu/hostmem.h"
-- 
2.41.0

