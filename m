Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2173226ejb;
        Wed, 21 Feb 2024 13:17:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWPzcAUYk05Q/8ukSE+bV3qTJS+ExrSBZKOS6wtDLJMDSEQUCMTbK6zK3wo1xQRx7WdVCHjUlqOtQTwByUPiE8Xy1Y0pXST
X-Google-Smtp-Source: AGHT+IERkAkG8RVOaZaik7x2AgAzErqGMuIpEN1oIlV6RiTJeLUkRdjpnKKcV9pEpDQrGv4m8w2a
X-Received: by 2002:a05:622a:4f:b0:42c:7bfc:8068 with SMTP id y15-20020a05622a004f00b0042c7bfc8068mr27856870qtw.11.1708550272250;
        Wed, 21 Feb 2024 13:17:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708550272; cv=none;
        d=google.com; s=arc-20160816;
        b=DSc5yg7lkbh8yuxBnDY2Ym7pP/RsC289BwhA3xt0gaQPV85mPXq+H9Ymo52utleCuw
         aei2WNfpokDxJOFNwDtS6wkdqiEtvxNM4EmYdf2pW6M8vaAB7KvgN273yXiac1jBNUlH
         LfqS0OAayrQM3FRPj7Af36lJDpl4COGYKLyqwZ/BTg1VbKveyNwcCgVLgVdIgfnzOQuK
         bQerU8BzW5dQwg/3D9c2hubHFtZ01raOk8UmN1kfHKDkcHcp8DN5dxcpkKuag/Faer5K
         aJ9DISEUqkx1N+55bv8o3OIp5wqpt0pxu12jZgRSORFvP1IA/MDsm27m1OEySdShq5cw
         bfEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4TRvCQivHf+BGM6I7nL2pwFghFnMYw5aVlLSb0J/9JI=;
        fh=Tm1JBeIpbRgXIQbzR7Pxs7dfN0JWk+aR4tRoAkqiPTU=;
        b=H1ye7DLZAu5qCkYz73iJm5QisxW6LPDXsKoeJxcwN0OXHgdknoqwtXYrACtcTDHqhk
         uWgtyJqZikfZTUo8eesV/H2DmSAjOzD9HIKNpCte1Vw6mlnWl6qjRCgc/Js0R/eb0O0J
         z1XXAXSalG/N+M73AAIK7iDUcW9yE7JK6ah+APuC1jf2tcjLyXIFX/YMCPUWugFfGOoQ
         wuOv1gwjqUZqs+bpk07+4W9YBUOovkc5vxbsNAvCJb6pvlxzybcu+SAh3kIToztBdwO2
         2rfUztJZ0KOH4gqN/kUmW2rtqWrQl464OAdpcrLg7sFKgKcUhm48c+eTfKwxCZA/t0jl
         ka4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qsM2Tz+l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h6-20020a05622a170600b0042dc7d3ccd8si9230128qtk.619.2024.02.21.13.17.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 13:17:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qsM2Tz+l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rctxX-0002Qc-Rh; Wed, 21 Feb 2024 16:16:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rctxU-0002Jc-A3
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 16:16:53 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rctxS-0000nk-2J
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 16:16:51 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3392b045e0aso4652045f8f.2
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 13:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708550208; x=1709155008; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4TRvCQivHf+BGM6I7nL2pwFghFnMYw5aVlLSb0J/9JI=;
 b=qsM2Tz+ldd3LESpb8XP0unrIoiDe02oSiS82cEthbN3bIOm2BDEdguOyOG5NGF/Uoj
 ewL2t/sU8008nHPzSPb951RnpGsGqR/HCQ+1dIXsDn3NLat/0X9XCphhUkj5mcM3VIqe
 CBvkllWdlxVcNufvPBAfjOtenFYy81ESfie9jTSIX5u9k3aV3/MU+eKof5PhyNlBtmC8
 DDqwqTBC4/6bLSsdHURy50y/Df1HfepHYPtgjpOr04chg3hfF2QS2Jn7A2RQLVwe3obs
 NYAaIa/gnx/p2astKirRsbREcmmmlv9A4e3PhTSefmDDqzu93JrObr22V8MP0Wg8RAAZ
 NZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708550208; x=1709155008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4TRvCQivHf+BGM6I7nL2pwFghFnMYw5aVlLSb0J/9JI=;
 b=XtHA76AWI2xxHT0/j8oKTVff7K0traSWTv2PT16DyK1rIURq7/jKAYj9qvK65E2d81
 lxiO6Eq+jIp2pHuNXWUxwn3Q5338RH429hWQZC4wb6ote176xhUbdvWTiHHfyduEpub8
 969tapHQKYHuJ7wySU6lmbkAmGH1g1xuBCr1chhUOb16WjLVsIxPefrNRHn5Gas0gOLn
 wp6V3Kul/R7xvyBj46FLNCZgMWw6CfAR0yebRWkRXC7a8zkILT11C768JgCCOR2UqLGM
 RaHZIa1NldccfEMm3W3wUqVFpRIZ0quTCz5ALPihcm/S8XmMj5m+3VXPjdEXSECfLibZ
 GMvw==
X-Gm-Message-State: AOJu0YzoaGN5vDsBkaBXeTF+qGk6xnek1Yf0wjkSHa5FthP8WStphKQj
 LwX7VoktCdIZsYukLc5virsx8tUr9DV72XmbjeNlhauGSzZbxOqQIaGZBSaYyAY=
X-Received: by 2002:a5d:64c8:0:b0:33d:545b:a74 with SMTP id
 f8-20020a5d64c8000000b0033d545b0a74mr10313634wri.33.1708550208078; 
 Wed, 21 Feb 2024 13:16:48 -0800 (PST)
Received: from m1x-phil.lan ([176.187.211.34])
 by smtp.gmail.com with ESMTPSA id
 ba20-20020a0560001c1400b0033d640c8942sm7735486wrb.10.2024.02.21.13.16.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 21 Feb 2024 13:16:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Thomas Huth <thuth@redhat.com>
Subject: [PULL 03/25] hw/ppc/ppc4xx_pci: Remove unused "hw/ppc/ppc.h" header
Date: Wed, 21 Feb 2024 22:16:03 +0100
Message-ID: <20240221211626.48190-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240221211626.48190-1-philmd@linaro.org>
References: <20240221211626.48190-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
X-TUID: 3drPM4DcEaUX

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20240215105017.57748-2-philmd@linaro.org>
---
 hw/ppc/ppc440_pcix.c | 1 -
 hw/ppc/ppc4xx_pci.c  | 1 -
 2 files changed, 2 deletions(-)

diff --git a/hw/ppc/ppc440_pcix.c b/hw/ppc/ppc440_pcix.c
index df4ee374d0..d84418cb7b 100644
--- a/hw/ppc/ppc440_pcix.c
+++ b/hw/ppc/ppc440_pcix.c
@@ -25,7 +25,6 @@
 #include "qemu/module.h"
 #include "qemu/units.h"
 #include "hw/irq.h"
-#include "hw/ppc/ppc.h"
 #include "hw/ppc/ppc4xx.h"
 #include "hw/pci/pci_device.h"
 #include "hw/pci/pci_host.h"
diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
index 0a07aab5d1..e4101398c9 100644
--- a/hw/ppc/ppc4xx_pci.c
+++ b/hw/ppc/ppc4xx_pci.c
@@ -24,7 +24,6 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "hw/irq.h"
-#include "hw/ppc/ppc.h"
 #include "hw/ppc/ppc4xx.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
-- 
2.41.0

