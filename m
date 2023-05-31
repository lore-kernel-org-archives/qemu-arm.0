Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp229680ejb;
        Wed, 31 May 2023 13:37:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5PvhQnQRmOY2pyL19dNsU1MxJXU8udlvVpGobx2j8xDvKSDOuRfczDDFbS+2aks0CVJbnF
X-Received: by 2002:a05:620a:470d:b0:75b:23a1:427 with SMTP id bs13-20020a05620a470d00b0075b23a10427mr7723932qkb.61.1685565437273;
        Wed, 31 May 2023 13:37:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685565437; cv=none;
        d=google.com; s=arc-20160816;
        b=fu8HC5Y642LWPGdsuH8Wsjhu0qAwHI+uzIAbBXdBeTsXMH6/2nZo0wOSyu6oS04Xk7
         WrSHhgehitr0Ia4qjFUxfmgFMt0JW/D9RNp3gOxTHWrLQ1zGNQkDbZ9PZRQ4hsSKSU9Y
         UoX2IuGCGItR9krr4hcd7+ni1rJTkoJ77W7ioJpqslNtYKWpJIdH62uJJtvR15JE3BpI
         DfTnZmJcpaKvdH25QUxG/5GvZTqREifMh8c9cqjs7g2t1XsXq74hsvC+Sa0Uywdg8IYg
         sSVBjAkYt7urztnTHD3FlBkFNk9FuM2si9D63mKdSeGrkvppwOU0eZ+W2KZhDiautVam
         PfgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8GbaCgAoqo6igmmE7O0gpO7G+XBPsTJBXDJ3HWvHR/E=;
        b=WfqfgbUAs96n2JywhlEfAEzMqRvaWTxybpEQSkWerDI4OGzwoqpvsmr4AQMX7UxnYg
         OU60olqPFjJZFHh+q9PKkcll0oVxw47Mu03K3Zq9b7tm4pcv2CdMRnZ7kKJ7o96+0qyk
         bEazTrGaPrE4lndXAnec0ZBtGfzeI6LRa5BHNkvjIQQK0gCiBHUK1wsD+MVy9srakWmg
         59TNUcxtGan6pbLgdVcEGP++NRFEWNF2XXJJAQcDXS9KCTHYrLlZ6cKWeBGUo5BjsODR
         WYXRw69bhWY8swHmxwPL5ZTSTSDVwYMAaaMntSWvLlmE44RuJQmMT8c7lTcv3N5oivyZ
         jiBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j+uiPxba;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pe25-20020a05620a851900b0074e61ba2abfsi8209059qkn.782.2023.05.31.13.37.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 13:37:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j+uiPxba;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q4SZ5-0000CD-Sx; Wed, 31 May 2023 16:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4SYz-0008Lk-Ga
 for qemu-devel@nongnu.org; Wed, 31 May 2023 16:36:58 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4SYy-0003MX-34
 for qemu-devel@nongnu.org; Wed, 31 May 2023 16:36:57 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f606a80d34so1020725e9.0
 for <qemu-devel@nongnu.org>; Wed, 31 May 2023 13:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685565413; x=1688157413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8GbaCgAoqo6igmmE7O0gpO7G+XBPsTJBXDJ3HWvHR/E=;
 b=j+uiPxbaHMRXEEl+XSeqL63psaPa38DVR7H+BHKQc3i0Khj8InCAh5jzo98rL3d7yk
 KiaSX/TamkQeIL970sWjnjKQuZbzuFJXZ2k8ANybEHmNfWeJn0Svo2LwXduujGUAO8PX
 YD9oXBXXBUoELiMmEDGOO1THoXHSlX8W0xerp9NAGj5dceYAAeCS/P030Cl+9PUDY4mA
 LRn6j2N0bpQ+q1qb+5uHzAhQwtOkMZ5fvkNG4CyC5XIzcBpLCanCWIJVFtsy7MuBrtsq
 9p9jebF1n8h/oWanA8q5jKBMxOuex7Y5Y8a4dr9Xp5En7aS89e3UipvAC9LIFR2WyABU
 V23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685565413; x=1688157413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8GbaCgAoqo6igmmE7O0gpO7G+XBPsTJBXDJ3HWvHR/E=;
 b=d6fOuLK3AXC91eS1WsGaEFxFpAQWQnQdmZtLsygw9K2YAJ3tKmFIQSVXjIOhCyoBek
 S6pTZRV/9h8M/qm3u7Vn6LY559IjUWrNqFm6uEn9P/qkDRqt47rcwfbVxMWpSR2PW66x
 Xizrb/o806X6xMlcjsotFCFFLfKynNP9JkKvtfXYLo6jZKHOeUMGgfOk5IhAIp9IOWTf
 lQmfGOqAq2g5Mos22vNaMYl7XmXUMWt+AZ1T0p1YQfYca+FwfLTshWontYi9q06awhSB
 D2owIT1ZZeWHrkSs+pTlhwhNONcSzd3F/opcQhNzEaoRERhXuBsY/308QDm2waozmYqF
 OKSg==
X-Gm-Message-State: AC+VfDza+TbvV9M6lg5rGyNteZ8FPDt3ON0CpW3olRFu8EjdpMK2Xd5v
 zN0xYBA07y6NbiIm5USillU4yltE0hHxswsXLiI=
X-Received: by 2002:a7b:ce06:0:b0:3f6:be1:b8d9 with SMTP id
 m6-20020a7bce06000000b003f60be1b8d9mr345871wmc.6.1685565413088; 
 Wed, 31 May 2023 13:36:53 -0700 (PDT)
Received: from localhost.localdomain ([176.176.146.12])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a05600c0ac300b003f50e88ffc1sm25717863wmr.0.2023.05.31.13.36.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 31 May 2023 13:36:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Sergey Kambalin <serg.oker@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 09/15] hw/timer/arm_timer: Convert ArmTimerState::freq to
 uint32_t type
Date: Wed, 31 May 2023 22:35:53 +0200
Message-Id: <20230531203559.29140-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230531203559.29140-1-philmd@linaro.org>
References: <20230531203559.29140-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: whCnatxM3U3L

In preparation of accessing ArmTimerState::freq as a QOM property,
convert it to uint32_t (so we'll be able to use DEFINE_PROP_UINT32).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/arm_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 1f4d66291a..510ec74a51 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -33,7 +33,7 @@ typedef struct {
     ptimer_state *timer;
     uint32_t control;
     uint32_t limit;
-    int freq;
+    uint32_t freq;
     int int_level;
     qemu_irq irq;
 } ArmTimerState;
-- 
2.38.1

