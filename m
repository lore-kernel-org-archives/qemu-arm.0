Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp1412293lfg;
        Fri, 25 Jun 2021 04:19:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbVdD1L6BIoPpRWDDwQwMrHTUXafq7Gxfa+1j0leAkWwIKTMnxoB4eWJspJCdmhv3rpNim
X-Received: by 2002:ab0:3396:: with SMTP id y22mr10828466uap.101.1624619962191;
        Fri, 25 Jun 2021 04:19:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624619962; cv=none;
        d=google.com; s=arc-20160816;
        b=kNkA3GE1opvkZizhUHzuiIIsdBIIttvf7um1MnMW8GLve6Ysjo7pO2rYgHH3/iSj0j
         4vwh0Z3FS/X/lqOZ/pkitNThuhwCkN5lPgg4tXNGcEuGXCfAekDhffF8kXT/EFuGEuSx
         D3ULAIVaPIQ0suSDMaTBhD2XdP+PQgwdtshtMfWthN0ubLoZyp1V5hrk5ZcoAl0+eWjO
         M52PBLENM8Do2430DBc8nC4+N/j6KQtKwq9cq5gIX1b1Dcr1h23jXW4WmanuRilLjVEH
         +t6D7F+bkoyer4A6URec2Sejn95DibvyRwFf3+xl1qnu6/pIRKgaJXsT/abT+eiHGIL7
         KPhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=U8+L0pfEA+Z4ZeIBlM5nqpsz15izDVESlVEK+IwSfIk=;
        b=GMb/Pv2X03lchR7XZZ+x/JJTESdQNODcd70znHtALncZNmobwD6lYYl24z88xepcrV
         F1AHFl8FA2iR33kf632ES1dsjtGW/iEhHx7bN9MdhyL0BnF9IwZX4mmH7WTbzn6PThzZ
         2vKX5qes/6iN/QBBrtNaYdtuAYIxEFylRoNKOEueplkYyZKFvQoLZBbfSpPA6bknhTgG
         ADr4fodtLtaSUZ+PPtRTuTbtb86kdN/g9X4mLx+M8wZw1AFJBXSGs1LxxSFV7w7fQol0
         fbHt44a3xV5y11DnvghfuFPH8i6gv7XzhxytPYtgEeo9eoNTEohbGlvgWdDZCB23Wlm0
         mkjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OnyXBT2U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d21si3440200vsp.272.2021.06.25.04.19.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Jun 2021 04:19:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OnyXBT2U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lwjrl-0008EV-FY
	for alex.bennee@linaro.org; Fri, 25 Jun 2021 07:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1lwjrQ-0007dw-OP
 for qemu-arm@nongnu.org; Fri, 25 Jun 2021 07:19:00 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:34520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1lwjrP-0004WX-2T
 for qemu-arm@nongnu.org; Fri, 25 Jun 2021 07:19:00 -0400
Received: by mail-lj1-x232.google.com with SMTP id u2so6743220ljo.1
 for <qemu-arm@nongnu.org>; Fri, 25 Jun 2021 04:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=U8+L0pfEA+Z4ZeIBlM5nqpsz15izDVESlVEK+IwSfIk=;
 b=OnyXBT2U0+l9H+w23kt6XivRAnbG60JM0jhY/RvlDiaksGrDcQv+wYaRMqNvGJkoL3
 hg7RGQV/VU+KBCQF+ypgEgvl63TkAta9iWNA5rg+cH4LbAF2R0hl2lqpfrW0Os8ZbvAF
 teYgeG1+5jkhPNLSLQ8QZuV7R6gAYRtBD9fAkxuS47j9c7KOR9fLCzfuIRBKqr8RgFei
 3zyLxrTF8ocUugS0R4wpv8TfA5NqmXI/BnSLfEwuY7/hCJVuyDo5dlNP8SxUhsPFmQLn
 zUgc84OUZc6WBLgoLOlV3Y/d2r2BBDq/tnrIJFLUVly82Pr5nJKep53t5SuH4IFzQ0Dz
 YK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=U8+L0pfEA+Z4ZeIBlM5nqpsz15izDVESlVEK+IwSfIk=;
 b=bDWUHf2LgQp8KE4TGe/XmbTVaGay5Ha+dlKmkVyFQ8uiF3jD1W1MGAiYAiSlXpAjUn
 nHBH601fOAj98hl5u9RK0ML0/kfJfFga/UQAYSMC8vR0wx464Fb19Vk0U7MKYarQ3AMv
 aAqLpxtNw92+2rymW3UJFIEkyOa+SDT4SZdTlvt0AbOBTIigO4UMDWsPaH1wrSg3fKwe
 RYGXUVkpH/WQkQG3gxeKL4+12GwGmY00fLAtUfcDM+8BuUzgfSrDrUGGYUspbOPb4b+Q
 r809gqtuRuipC6gE4kcY2i+pHWZrQHhdI1pUicKYVyymUBPP3wKCYBVIYRwhWsrP7ZVL
 yqHA==
X-Gm-Message-State: AOAM5339FwNuWCWyYaSUKaBGx38g2pYmL8l/+1POHzzTzzIcOEmYIvLt
 6BVVaZ7nylIEAvO6enmxB9xMKQ==
X-Received: by 2002:a2e:22c6:: with SMTP id i189mr8075185lji.97.1624619937523; 
 Fri, 25 Jun 2021 04:18:57 -0700 (PDT)
Received: from localhost.localdomain ([91.193.178.173])
 by smtp.gmail.com with ESMTPSA id p19sm536354lfd.70.2021.06.25.04.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 04:18:56 -0700 (PDT)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] gpio_pwr: use shutdown function for reboot
Date: Fri, 25 Jun 2021 14:18:42 +0300
Message-Id: <20210625111842.3790-3-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210625111842.3790-1-maxim.uvarov@linaro.org>
References: <20210625111842.3790-1-maxim.uvarov@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lj1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JPTzmb/kyf6V

qemu has 2 type of functions: shutdown and reboot. Shutdown
function has to be used for machine shutdown.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 hw/gpio/gpio_pwr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/gpio/gpio_pwr.c b/hw/gpio/gpio_pwr.c
index 7714fa0dc4..dbaf1c70c8 100644
--- a/hw/gpio/gpio_pwr.c
+++ b/hw/gpio/gpio_pwr.c
@@ -43,7 +43,7 @@ static void gpio_pwr_reset(void *opaque, int n, int level)
 static void gpio_pwr_shutdown(void *opaque, int n, int level)
 {
     if (level) {
-        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
     }
 }
 
-- 
2.17.1

