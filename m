Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1389922lfg;
        Mon, 16 Aug 2021 06:59:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSolGzazaq7vnZrPcIAi7O0diBJX/swQuz9UB3FodTHLKXVxx5xz70+9GY60cvltk54+1i
X-Received: by 2002:a05:6122:c42:: with SMTP id i2mr8847475vkr.22.1629122347784;
        Mon, 16 Aug 2021 06:59:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629122347; cv=none;
        d=google.com; s=arc-20160816;
        b=w/RQOU0fGSgORh/MVhNipSgfJYwBNP4MPyFHlxMvwUFm74RG5oJMaJ6qoNlCuo7uKu
         x6Ql9xE3bu5/1G5NSfTFZQuBspp+fKWx4M9DqtsdeMeyPBpiu3pC9yqtWzinJH/bH8Gg
         Zy6ypLM2IU/o83qHf+LwxXObyYJ4i5QXry8860eEoBjbT//WDhA0etcGLpbp0OBGSNP1
         QhOOHJo8X0a3bsG80ARATb/Mi7f6j3rnqWN+HqlCaBCzRDvydWgwtuRSsgFMaHM1Uzmf
         qjYdUzKUUZ8hZdgjrMiRGoqw+H4NGlhJuR3mblETvgAogHCO4CG06iyoQxGj1UcjTMyo
         9/Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=G+5WdnIF0AlNWQxsS14WT6o6igP3aa3eGxkIM5Nj9A8=;
        b=i9LN+F6c9tcD9EwhBSDUpplTdd/20Ka3gtbsVMQ77fjAP2YuXG7cQrFwklgE6liEYV
         dlvBBhNlZ+1wdqjFDsK7zXTiuACt1nweBLEAdkNvUld+HL+hqI0qw6KLMq06mAvQo5q6
         pRtCOYMArnpde+90Sap9gEuUF+dnQGc1ianUAQPglSiipwktm1zB2aQYwmrXZfYUnzlu
         1o4Pr2nhAn2TyrJ5QX1aqe9fAgnN97dc8K3bmpSLa35qlcaEAJhFdF1fKWvhsqNVd2o+
         87EV9hejwvHBFbT4jFflv/CIVoD0mSRA8WAg3SFUaLiTTSq259LKd20X4/hOpsa98WPo
         yZPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Tdb0r/wb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y4si3710561vsk.57.2021.08.16.06.59.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Aug 2021 06:59:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Tdb0r/wb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFd8t-0003IS-01
	for alex.bennee@linaro.org; Mon, 16 Aug 2021 09:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFd8c-0003EQ-7p
 for qemu-arm@nongnu.org; Mon, 16 Aug 2021 09:58:50 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFd8Z-000623-DP
 for qemu-arm@nongnu.org; Mon, 16 Aug 2021 09:58:49 -0400
Received: by mail-wr1-x430.google.com with SMTP id z9so23708832wrh.10
 for <qemu-arm@nongnu.org>; Mon, 16 Aug 2021 06:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G+5WdnIF0AlNWQxsS14WT6o6igP3aa3eGxkIM5Nj9A8=;
 b=Tdb0r/wbvlfqvUqBK0PBEoSenzXO6sJW7i8ZDQRMW3whbaAuc1trHIRsjCVzvRwiO+
 3E6sqyWPyV8UetGa51lLZ4fqhFZDOBjQCi8PmlLcQlgbG8hBv4N8JHncj6FxVo8PtTFW
 zaeJ1fQocSc4QVEF+dawpNEPX0miOiaLHWqW6pty0Bfsban+0FRkvWT1mftYcwzLExk7
 rk/5ndVRZCP/l/ubHoUTSBkTFTss56edbWgNml1lSZu1kc2ufKm9XNJmcf15Y9aaWvmY
 NO4UbtYua333uvplrARxd5bs30xcOqGsPsKTZTrzpNSPi6lYYH/mqqmAFpYghTcaGya0
 ulXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G+5WdnIF0AlNWQxsS14WT6o6igP3aa3eGxkIM5Nj9A8=;
 b=dKM1nbjnjIHlrGC93fdnR2kFtG7v8qi2EUb/+a7wm/Gc5H3Lgx65ZUaPZZpf6/+hZ3
 Jbi0qr7igbzgioloirxnzlacjJYp5oFSSl7uF8b1dDXNmzKZn2zyeKPX/aAOrcqF0b2H
 lETySq36QUAphC//belrZtMQZA0m70tUiyMoEaV6H7gq9b2e4DsA0h+pLYG7d32+G7JA
 JcQOyfNFWtIXVXEH8D6g/E/+Zj9SF7S7kKAiYq0vm/H5yNwc8MaEkdI7CYZ1AUq5fRls
 6fc4/TIymKv8liJZYLAb/CbMVd3E317uQRQRgeKjx8bmZgWdnEFasWEwj/p5CaFdbBt5
 uvsA==
X-Gm-Message-State: AOAM531nh/BiB3LgNnVLlVZ/GBe2fqBa5PtsRy6DRnbhdb9UjW2sBA07
 aCwG0Iyq2CLWQGEYDIKRg6ttOizFJHr4pw==
X-Received: by 2002:a5d:4447:: with SMTP id x7mr19872425wrr.198.1629122325300; 
 Mon, 16 Aug 2021 06:58:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y14sm11855631wrs.29.2021.08.16.06.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 06:58:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/3] raspi: Use error_fatal for SoC realize errors,
 not error_abort
Date: Mon, 16 Aug 2021 14:58:40 +0100
Message-Id: <20210816135842.25302-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210816135842.25302-1-peter.maydell@linaro.org>
References: <20210816135842.25302-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8gsdkSv+qU3/

The SoC realize can fail for legitimate reasons, because it propagates
errors up from CPU realize, which in turn can be provoked by user
error in setting commandline options. Use error_fatal so we report
the error message to the user and exit, rather than asserting
via error_abort.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/raspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index b30a17871f7..0ada91c05e9 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -281,7 +281,7 @@ static void raspi_machine_init(MachineState *machine)
     object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(machine->ram));
     object_property_set_int(OBJECT(&s->soc), "board-rev", board_rev,
                             &error_abort);
-    qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
+    qdev_realize(DEVICE(&s->soc), NULL, &error_fatal);
 
     /* Create and plug in the SD cards */
     di = drive_get_next(IF_SD);
-- 
2.20.1

