Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp206726ejc;
        Fri, 27 Oct 2023 06:42:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBQdqyUEp5G/AiV8zUhG51CqtN6qY4Q4k2jZURhYLMe0jn6harwIQ7DONTKNj0fZeRARm5
X-Received: by 2002:a81:9f09:0:b0:577:51cd:1b4a with SMTP id s9-20020a819f09000000b0057751cd1b4amr2730959ywn.41.1698414136278;
        Fri, 27 Oct 2023 06:42:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698414136; cv=none;
        d=google.com; s=arc-20160816;
        b=iRJptMHVG405UBtrV5YZ8UpjhKzsHrmR2HDPDxujmCbunzj2d/RfsdWvYcRl7xFbu2
         zbk9DVYGC/rjKeBUFTfsfLDcLwWLESSTGRaCKiPqw3IfF6FQenD1LfTiL7qVczSd0HtX
         +xpqC6b3+KYwtF1ECD1eXRJ+ihHX2vabQeXoCDE3YHuQCTpKqyw3ln89JBMc2ukIX4lt
         jH2swxKXJQAVhTtM1l2j6nWaOjwRydo+0BNoj0o92FewQ+Z7oIbcvDBh4oSJffVp6VGk
         D0beT6oKxapBoI44c+3X1mMcKDwsVBugYRJ5sEHn1gNyPPTlaNHydKUDmSMV4eC/r5wj
         mtsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=pJwLySfUF35zlxa5YOPsnj4pWWz4vwyKayb5dbl6BxU=;
        fh=r4SZQsHVB8BvFwW6yrUrylztZ7Xkgix3BFFiUCFJBfM=;
        b=brQjkV6MjfegQ44IfCDt/69O+onUdmUxyW22DsJ7IPcDY0qkklvBM8lXrCUXFzfmZ1
         1MGQUoThwHTuGwMzao9baWy+DGzUJ131jmDF5VtG0w4sNhKCwceW/lAUi7NlNemi4O9K
         lFbfjtPX3FhDwDgwE1qjY0lLhgaHmy3M1E1+Dp2i7C2FcJBZWGqyZHdFNcpAHTHYN9Wz
         3iURvuQsZSJNbjFsCs5z50+/bB+qTUo1mNddK1EVtxjk+qTYaLhcjCsAqa4Lxq2aaw/8
         CNGC8z4K58vk6M53UDhewIj+s8apvDbR7FrUJNHJUKLg33/cxjHc/TujsZS131rgB4GO
         e9BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CkxAnJ+j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z84-20020a816557000000b005a7c00be5dcsi2365178ywb.137.2023.10.27.06.42.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Oct 2023 06:42:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CkxAnJ+j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qwN6H-0003Qi-QA; Fri, 27 Oct 2023 09:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qwN6E-0003Pr-Ru
 for qemu-arm@nongnu.org; Fri, 27 Oct 2023 09:42:06 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qwN6D-0000I1-Aw
 for qemu-arm@nongnu.org; Fri, 27 Oct 2023 09:42:06 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9ba1eb73c27so331539366b.3
 for <qemu-arm@nongnu.org>; Fri, 27 Oct 2023 06:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698414123; x=1699018923; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pJwLySfUF35zlxa5YOPsnj4pWWz4vwyKayb5dbl6BxU=;
 b=CkxAnJ+jndz9+lFtKAyo6cPzz4naivMtJ8SL1YlVEL+bbIyd/rtnP4DuhKjtUER2Cs
 sP5UzeJw/GXO5uYUWVd2Wn7KdYOT34u3kdSMnWHeA/iqwyOzVYYyellPatWCGsMNwN0Q
 S8d3TRi5MNrouuJthAlWEv6G+I05gQy9ruV4/l2bjjGvko0NqwnACZLr8VnYTQWdyPZW
 SGnpEdyGmp6W/ma8HveC9EmLtxbD03v/Gvp0Wtn39/5EIsGxaKKm25bKWnvSazofYm8S
 uxpUV0u9uYxQaYmXRPq9whE9f90gQMdqxLwB00BKR56a/7TLu9xLWDbUI06C/50gHd+t
 8VWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698414123; x=1699018923;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pJwLySfUF35zlxa5YOPsnj4pWWz4vwyKayb5dbl6BxU=;
 b=FEiVH25B6KlhHE6Aqt8ErRCQM7413efGLwSPJsa1WR1fs5Cc7OQ9qShCTv5bYtrDzS
 L+AReqE+y5kKLbtQs4nMG2GUnleDeMc5AViqKAsQ+Qn3pn3Kg1zMzGyhHxpfs0C511RY
 cmAKtGdR7jdLD7PsRRvS3P0Ylbh0Y02APB0IS9DDNXZloqoec+3amV9gzHMhVkwEDiu+
 5OyQiLpok1OrLPZwWR85SoK9yN72/aGg8g/ToNZ+DQ+ym6XDgzrGGBMqI4OIx4E2vehm
 E8lRgvNcWyZLHAfOsfaUCFprmw08vJtmPXDRqxddVjJU0Kd3CgcRdXvqqF7pGrLT2qz3
 7cEg==
X-Gm-Message-State: AOJu0YwZHBMXCFROpu1jnIbY6oxPGBoYYQsSD2bXF3R5KNr5e/e6ydx7
 P588gYQ3H3Us8kRoDna/QtZLjg==
X-Received: by 2002:a17:907:360a:b0:9c7:dc4e:1a22 with SMTP id
 bk10-20020a170907360a00b009c7dc4e1a22mr2305798ejc.48.1698414123642; 
 Fri, 27 Oct 2023 06:42:03 -0700 (PDT)
Received: from m1x-phil.lan ([176.171.220.131])
 by smtp.gmail.com with ESMTPSA id
 mf19-20020a170906cb9300b0099ddc81903asm1222768ejb.221.2023.10.27.06.42.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 27 Oct 2023 06:42:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, qemu-trivial@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/watchdog/wdt_aspeed: Remove unused 'hw/misc/aspeed_scu.h'
 header
Date: Fri, 27 Oct 2023 15:42:00 +0200
Message-ID: <20231027134200.29906-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: TSnIyTo1IZGr

Aspeed watchdog doesn't use anything from the System Control Unit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/watchdog/wdt_aspeed.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index d267aa185c..273a49d360 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -14,7 +14,6 @@
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include "sysemu/watchdog.h"
-#include "hw/misc/aspeed_scu.h"
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "hw/watchdog/wdt_aspeed.h"
-- 
2.41.0

