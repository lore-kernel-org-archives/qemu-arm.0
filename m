Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp474946lfa;
        Sun, 11 Oct 2020 12:53:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFuMmT/MeYJI+vWGuwQf51T7aGxEJit2YujUSjiy9BXZstUaQYOvNantEQUmcN9X60chb5
X-Received: by 2002:a25:3417:: with SMTP id b23mr5351030yba.97.1602445985216;
        Sun, 11 Oct 2020 12:53:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602445985; cv=none;
        d=google.com; s=arc-20160816;
        b=ZTfW32dNGtCNwuOo5uPQzn/MzCfj341uTEtZxXG+j7ds9Xu5bxRlDTVUp+aCDeLrjo
         8LGC5EBY7R8cJNEKYWwpYBtTKOsY3Uks79x1uZwYihmC97jBPOc2LNsJlQGBBwhfW161
         /gF0wOwiw1j36qzvU+bYQ7ECy8bOHFHDj+/j0s8xBx0mLQnh0dcNTgs/3V7UxdMON3zL
         iXUog+fc1OtdYymTMcaYhqRs8kQR8RVrbdPE3zbb4jTx3KrNYC2qaKfg3jAQZhVaJKsP
         Mb+kVKdTVypzVfp74VYJdD3/s0c+7bLyvzdMYRRokm9cAElKiaFx5H8YiQXfudTFklOm
         RMBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JY3Ndr1SwLa4aQQZxdcgHQ230u1S4q1Vxx6foe4GpMc=;
        b=Xqh8+NEQXVxHDLyDlFrsgkvZd9N5CRW23Sr1VE1iohLUTSAvSnnp6xjzjxkrnPdPYy
         Q6dfuJl4p7rNTaTIgOuSgR0Dj3oBUDljIddnWnq8+Pmis3attnEnKC6x0RuiVJacXkfz
         y5O2UcTpg6dW+NTfzk9qipbeBKmh+DSy0I2uh2cXAkC4xKgOK6n0uib3pNrDlm/E5+E9
         ZMtLxUcmQ432exXI+VJj9WmEiIvcOdDqX/TU7bwV6vp5JruOt93FPolqPPt34IkrbwJB
         Ww5M5HqHuPMY5AsWHAhh8ePrXHjCMQHNCILSTUZRb8C7mRD7D8xwJMsnzmfgxHu5qjLn
         RYNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=b5U728+2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j127si3073216ybb.418.2020.10.11.12.53.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Oct 2020 12:53:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=b5U728+2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRhOy-0006o9-Km
	for alex.bennee@linaro.org; Sun, 11 Oct 2020 15:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRhLc-0002z9-Rg; Sun, 11 Oct 2020 15:49:38 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:45115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRhLZ-0000Hz-Em; Sun, 11 Oct 2020 15:49:35 -0400
Received: by mail-wr1-x441.google.com with SMTP id e17so16582133wru.12;
 Sun, 11 Oct 2020 12:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JY3Ndr1SwLa4aQQZxdcgHQ230u1S4q1Vxx6foe4GpMc=;
 b=b5U728+2oqLyxZLK4gVj4hJFF5c7HoW2X5d0QI2a87MHPnJgyvbKCwWg8T53YDnYO7
 KjIgq/5JFyG0MP5wq7hPVoPsYn4moSSjhsha7EpKdldGOrhmmhvL2uzFc8buzf9qGKRI
 GjDSJCoiqrYM/+ChzcaJeyQ5965bSm8S0KR2iOM+1FbiKTntdQoOd4CrBxdzo/wuuSFs
 Qvx1VW69GKaxcgxgM1RmZNd6E51sagjsNXFhE+vLpEyn6VnPSZwmjClikToWDlsnR5Rj
 kIIuk65udgF1FRQzqHUR4nEJ0lgbU/ANVyeLdDkYfKv/xKdeSiY1zHgNeilymXP25Kt1
 lWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JY3Ndr1SwLa4aQQZxdcgHQ230u1S4q1Vxx6foe4GpMc=;
 b=kwqtw+tBcBT+ygASApoUBPyoU+R/G3CvPpxXHWyN7xicpQyCYMf/vZlMnhwnaNLcZN
 /DzMqoZayQutH70CttUKzRW4OnC/v0MWnhdvSlRuTv8OAkxj+EWW2lkGtjbuI9chWF3P
 aaKrtz1X0fv15n2ysWCz496COzU1TG62rImqHm4iPrc+/RwRSCT0qCo2/DKM8H2ITvxY
 j/Iei4PVcFtKci5K7s7OOMq+jEw68fiaOWXMuojvSEwm+yNyvP1f8aoq46WECiPXmGxF
 tjZGpZW2POHMao+qzWKmR0Rrs6RyfaMa20NE7w+BbnCR1NTMCavpTHOm0HR61i7qcqXt
 QsRA==
X-Gm-Message-State: AOAM5309QbNYX8niMqNE1d9Rwca1qupmQ24rUc1wvKrV9XbX9+fEhFe+
 PO40fhdhwf2XQnnWhMbWEXL7xYFivDY=
X-Received: by 2002:a5d:4282:: with SMTP id k2mr24940583wrq.270.1602445770381; 
 Sun, 11 Oct 2020 12:49:30 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id i33sm23103929wri.79.2020.10.11.12.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 12:49:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] hw/pci-host/pam: Use ARRAY_SIZE() instead of magic value
Date: Sun, 11 Oct 2020 21:49:16 +0200
Message-Id: <20201011194918.3219195-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201011194918.3219195-1-f4bug@amsat.org>
References: <20201011194918.3219195-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /qPyNbv0Pm5V

Replace the magic '4' by ARRAY_SIZE(mem->alias) which is more explicit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/pam.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/pam.c b/hw/pci-host/pam.c
index a4962057833..4712260025a 100644
--- a/hw/pci-host/pam.c
+++ b/hw/pci-host/pam.c
@@ -51,7 +51,7 @@ void init_pam(DeviceState *dev, MemoryRegion *ram_memory,
                              start, size);
 
     memory_region_transaction_begin();
-    for (i = 0; i < 4; ++i) {
+    for (i = 0; i < ARRAY_SIZE(mem->alias); ++i) {
         memory_region_set_enabled(&mem->alias[i], false);
         memory_region_add_subregion_overlap(system_memory, start,
                                             &mem->alias[i], 1);
-- 
2.26.2

