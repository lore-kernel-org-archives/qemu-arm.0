Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2176934ejb;
        Wed, 21 Feb 2024 13:26:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXA0M3oEF5UhIXy93bTPtzKPIjeqKXumkZcUfaykKtF07LeiCkS4dxIj5smP+pY4riTZHviWOW05fASZr42MEUy/EodGYPI
X-Google-Smtp-Source: AGHT+IEeYGZJ0KxCZcMPwpwzl8nnxD9BUyqn/QJkZBFXl68Qx7tMruWAlrN6/Su9KVEH0Uu4dbnS
X-Received: by 2002:a05:622a:54e:b0:42e:390c:97ec with SMTP id m14-20020a05622a054e00b0042e390c97ecmr1150459qtx.6.1708550780309;
        Wed, 21 Feb 2024 13:26:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708550780; cv=none;
        d=google.com; s=arc-20160816;
        b=KFmO0G2XBhZuvNqWK/QIg0yE8AdWlXafdMoWBOiJnNb+tjJDrSu/2RTYghlb0n35yG
         HeMY5XUrU68g2W2BxGXx5TKRvyk8PReN0aqrLMFJy/tcOoN5Ov1/gWy+58lalAlDqyJd
         +EvsX07S8967q2XSnOVDVrG3uRoRtNaMMkLBr1GeEN6XC/8mwN6fEr7KoIB9dytILcA7
         bPeKr2RSZ+9c8HJAvjFjr4Pmba/txKKl5fXJYeQKNVC0LVmPnNMZ7w4lC3raLLNQk8Xv
         qRi6hx5sKzyUE6nI63+U2lhCp4LW2/hYYVLa4wR46UDzyzhHkhOD0Rc+By2/AA7bm7jZ
         PY2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bSyJnKQkd93ud2FmPgc+3hwMsxOVnxzVCD11CZAAcfk=;
        fh=+X8R+e3mbgU3IshgdSHlFTALwQAZEUfmYK2Jo0JZy3M=;
        b=0JzjLYtt+UaHI11M2kjoE1Oi7jQhlmCHnHBIkpVaNlDjVslPYUWe7zFYlxgp5XPh86
         qgJaE4hMoDHfL1dR3sKcXoaCWNFPmDitXD+Sqh57sWoDT813VoQ9zydRlG46rH2z5Wsy
         ZwqYWU/mTwLHmCySIMG13HSaGXMF9PqLH/Mk0t2e231wBhzGvDjPNxqo1AmUVPFAFJ7U
         RfyyD6Mbvk2m3LUCGoRjHjE76y5A3MhITe3+7u6+cLNDNih3cAfRwl/BKSkY+Nqu9Uhy
         /QCEgUkH9YpkS7vtU+bnLpTJlwXXYESBRA/dYXQaO5bJ5fGKaqqpm5mcZRyGI9pmVLmb
         +Gjg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dHP54ZK/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h21-20020ac87455000000b0042dd32cd47csi11215009qtr.375.2024.02.21.13.26.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 13:26:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dHP54ZK/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcu0U-00067i-Cw; Wed, 21 Feb 2024 16:19:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rctzx-0004a2-4Y
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 16:19:26 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rctzt-0001NS-41
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 16:19:23 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33d7afd1ee0so764802f8f.2
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 13:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708550359; x=1709155159; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bSyJnKQkd93ud2FmPgc+3hwMsxOVnxzVCD11CZAAcfk=;
 b=dHP54ZK/SlQkPy6n53VV6BW/1UlH9FWQ60TCS3VMtPP+u/C8oTFzu0a9U/yOQi9s2W
 p79JQeFoWa2fD2A38Bvzxvc+fQASyrF0hOJs1ZbODUFoOpCoZiLWXyktXhPSaR0Vpqq7
 vu3P3K0ipKmR/oS1faGh/ReXUVlv5LZeZ/jjVzENn986KKME0zOA3tR6fORxMi7E0uNb
 L5FFE2YCTLFOWspEZW70Fe8in7tfBv6vCY+m+Nh4bvk6EMg6NMoMg5L6CQfLfviuVJh6
 VA8OqKhtxGlj5VR156Ec67IWaxU5NbXfFMkacvkCgHi0JtJ85RznwHQmeHz/U0rvKc4O
 9MgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708550359; x=1709155159;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bSyJnKQkd93ud2FmPgc+3hwMsxOVnxzVCD11CZAAcfk=;
 b=wdpFV8D3JkPcd2+O9sqvxk9miVQOZtKd1gbfxKF+N9FpXV2dA0CzbbQ2AVlOSgLcac
 Ylcg8apJWUrhBkxlKG1a4XAhrDuGrHZtbYvkerglN2Lp0l4Q924Qk6yI3WNAZpox8bNA
 YR4ui/g5fOR6K0B2yamGCTiJF8dnekGpKsm14zPsMsIr9aO+84IdJqZ62C2m5YXoha4w
 /gpd8cttHNk8gzCSuTctor4w6hLcwlQ3WtGisDnwt47UADNl7fZ/E/Ban6B6YWT6leLr
 OBVNjQcHpXRdzzHIWToWUN2DcMN7cWoEUjmK9bSj/4wfXDoL2JvQ/SsTWhac+2V+k3Cf
 GPrw==
X-Gm-Message-State: AOJu0YxcdPBd/2CFt3wooCDkLcX30kbJkOMtEO6Y9Mz10NTjMr/JbQNl
 FsiuD1d6nZtCjpFdr806NRrMwCPNG1r+oej5L82CKFulXA+2qDsYyDUHgVxUEFA=
X-Received: by 2002:adf:fc90:0:b0:33d:3566:b5d1 with SMTP id
 g16-20020adffc90000000b0033d3566b5d1mr9489249wrr.57.1708550358803; 
 Wed, 21 Feb 2024 13:19:18 -0800 (PST)
Received: from m1x-phil.lan ([176.187.211.34])
 by smtp.gmail.com with ESMTPSA id
 p6-20020adfe606000000b0033cdbe335bcsm18113801wrm.71.2024.02.21.13.19.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 21 Feb 2024 13:19:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PULL 24/25] hw/ide: Stop exposing internal.h to non-IDE files
Date: Wed, 21 Feb 2024 22:16:24 +0100
Message-ID: <20240221211626.48190-25-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240221211626.48190-1-philmd@linaro.org>
References: <20240221211626.48190-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: hhiJfuQVd+5C

From: Thomas Huth <thuth@redhat.com>

include/hw/ide/internal.h is currently included by include/hw/ide/pci.h
and thus exposed to a lot of files that are not part of the IDE subsystem.
Stop including internal.h there and use the appropriate new headers
ide-bus.h and ide-dma.h instead.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <20240220085505.30255-8-thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/ide/pci.h | 2 +-
 hw/i386/pc.c         | 2 +-
 hw/ide/cmd646.c      | 1 +
 hw/ide/pci.c         | 1 +
 hw/ide/piix.c        | 1 +
 hw/ide/sii3112.c     | 1 +
 hw/ide/via.c         | 1 +
 7 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index a814a0a7c3..ef03764caa 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -1,7 +1,7 @@
 #ifndef HW_IDE_PCI_H
 #define HW_IDE_PCI_H
 
-#include "hw/ide/internal.h"
+#include "hw/ide/ide-bus.h"
 #include "hw/pci/pci_device.h"
 #include "qom/object.h"
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 1ee41a5e56..f8eb684a49 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -31,7 +31,7 @@
 #include "hw/i386/fw_cfg.h"
 #include "hw/i386/vmport.h"
 #include "sysemu/cpus.h"
-#include "hw/ide/internal.h"
+#include "hw/ide/ide-bus.h"
 #include "hw/timer/hpet.h"
 #include "hw/loader.h"
 #include "hw/rtc/mc146818rtc.h"
diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
index c0bcfa4414..23d213ff01 100644
--- a/hw/ide/cmd646.c
+++ b/hw/ide/cmd646.c
@@ -33,6 +33,7 @@
 #include "sysemu/reset.h"
 
 #include "hw/ide/pci.h"
+#include "hw/ide/internal.h"
 #include "trace.h"
 
 /* CMD646 specific */
diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index ca85d8474c..73efeec7f4 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -30,6 +30,7 @@
 #include "sysemu/dma.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "hw/ide/internal.h"
 #include "hw/ide/pci.h"
 #include "trace.h"
 
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 4e5e12935f..1773a068c3 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -30,6 +30,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/pci/pci.h"
+#include "hw/ide/internal.h"
 #include "hw/ide/piix.h"
 #include "hw/ide/pci.h"
 #include "trace.h"
diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
index 63dc4a0494..321b9e46a1 100644
--- a/hw/ide/sii3112.c
+++ b/hw/ide/sii3112.c
@@ -13,6 +13,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/ide/internal.h"
 #include "hw/ide/pci.h"
 #include "qemu/module.h"
 #include "trace.h"
diff --git a/hw/ide/via.c b/hw/ide/via.c
index 3f3c484253..cf151e70ec 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -25,6 +25,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/ide/internal.h"
 #include "hw/pci/pci.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
-- 
2.41.0

