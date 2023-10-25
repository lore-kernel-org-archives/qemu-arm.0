Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2540628ejb;
        Tue, 24 Oct 2023 23:55:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYrAJVflwgc2RgahDLm/5nSQzdymQCeNRnvURFWYQToDt4TOGb1GfIItwkW0zWwHv4YGIQ
X-Received: by 2002:a05:6214:2b0d:b0:66d:aaa7:c77 with SMTP id jx13-20020a0562142b0d00b0066daaa70c77mr16994815qvb.0.1698216912565;
        Tue, 24 Oct 2023 23:55:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698216912; cv=none;
        d=google.com; s=arc-20160816;
        b=o1V6nDBhSgerjlRxO3qzbdmtTY+0mjIW+F37vVv/lp+pO6ij/LWD+oGBJaURwip+Yj
         9RUgLDGNOgeldWVVqMvEdoDH/4iYIeLRQ+/QbRcetTAnLQDs9zoUFTypjqSa1vsrYywS
         eSJ8hLyfewkq2cG+vAyoDSX8YkwDDkBBMIDslpfO+TDnEpHWpOodw5pm7RDUDYL3Qkoq
         jWjiK9f3I39M0+2PSyB+C8GB3BLdQy7f5PMBsMeg9G1nFnywPa00eXyLRrzVim/dKEJ0
         6cQttETFAXWrmGx+2Lg0Sld8w/oSq83vyfqva5Nf/Ew2ANwPAZBxdyfV3nYTyKE/QsEq
         x6Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iag5xExHVGQuFMGcLhmFmnPUkDT4Uig/AV7ZGJNpQIE=;
        fh=+bLmdKe3Fhl9U6xibEHRey+DFvf72PMfEak8Gtw7A/o=;
        b=xVbvdcl6vX4X9VyH1GC1UIHd4nqfafwM7m37ntIrMsRpjmXY6oyqhwuVPEn77JL02Z
         JkZOH33p9XZuq7AA7iN3PJNqdOhRfU+5TaMV9dS23jFq3+ob5e5w2rgjTSTT82gLKyQH
         WeqBOuB5BHD6Exc/0HGI81cc3uyImmBflgXWINyEAreB0REYgbxJ7qZft12kAQWriCsu
         Pzb5ryXkL+KU74gfSGO6JxdrXVbkCmTaqovdKlb5teXGeh8gnF40KM24EBerXtVMsEvc
         vJFeL9q6xq+k8ItCpjVbeAAqpoLlSPXiyKPJmV3k5/Y0lAkPyFgr+nfZV2dTL6w/uGgh
         V+8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BA3yWVn0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cz6-20020a056214088600b0064f72cc4bdasi8335028qvb.575.2023.10.24.23.55.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 23:55:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BA3yWVn0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvXly-0008IF-Ig; Wed, 25 Oct 2023 02:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvXln-0008Fr-VT
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 02:53:36 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvXlm-0006sW-8G
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 02:53:35 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40842752c6eso41822745e9.1
 for <qemu-arm@nongnu.org>; Tue, 24 Oct 2023 23:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698216812; x=1698821612; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iag5xExHVGQuFMGcLhmFmnPUkDT4Uig/AV7ZGJNpQIE=;
 b=BA3yWVn0dXHCOU+167OnnN3CSy0i/l77YLNk4MrvZa3w8QTzSqKJU2pJ+tisoeHRdG
 06XeZz/w5zY/lqLIMWG7VZKZCkvldMHz9chHEfUNYyk137rxfndNcqTAfLKV4w4bN2ih
 gY3OKM4qU4KVNOs21Q2JnkXyfoVqqmxkeJVNo760a9/mgaut65wkIhK3yTtWDFEKgaGT
 L7Yh5bb0nY5O/k6NKNdwc8rysEWn8uRudMnEsIPZ2B1MHWwRZpf65gxLacXNDo0K+BnB
 cEWTWE1/Tr0TgpPYjsxidjCtlmsNUubAsrAtcmfX5Cnn0kQa470wV6svQCmictoRi2HT
 Tqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698216812; x=1698821612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iag5xExHVGQuFMGcLhmFmnPUkDT4Uig/AV7ZGJNpQIE=;
 b=facRkhBWcHrU0uF2r5fmPMUNfx6BcAKinGwpBGJDyRHMIPByqBBZy/SK7cyo1/crgd
 ATkaCyh4uVF7v5MSLK0nqi1gQvLaBcSPabeL1/TkqobIDoq5aLPEw+b4VtNRXu+Z9cti
 Qbx2BkywK/e2NE1Dyf+rhadXGIXBjMQ58erpHO8i3rCZ1bFwUOVR+cPuWpGOEFVRLlsx
 rOw0+DWoWRqA3o4UpKZdAmzH7txSxgEgNzcSoMMT7OZjHBeVwVw7pCshY3PrpOiKWDiG
 2J+DWAplfb6RvhmD4IZxJd3XC19o5VetNzJJz/1xtXPkzbyODGGsgiKvfFusRY3KuKzV
 VwdQ==
X-Gm-Message-State: AOJu0Yz1TFKUwBJ2w4TVxbJTBUCqRXnGly1TaKnM9f07kTdukhaqSqcU
 hoNju5zP0o3F8Hg8jthL3xQRJg==
X-Received: by 2002:a5d:6705:0:b0:32d:d2ef:b0c1 with SMTP id
 o5-20020a5d6705000000b0032dd2efb0c1mr9119519wru.33.1698216812658; 
 Tue, 24 Oct 2023 23:53:32 -0700 (PDT)
Received: from m1x-phil.lan (ghy59-h01-176-171-219-76.dsl.sta.abo.bbox.fr.
 [176.171.219.76]) by smtp.gmail.com with ESMTPSA id
 w10-20020adfec4a000000b0032d2f09d991sm11343022wrn.33.2023.10.24.23.53.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Oct 2023 23:53:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH 02/10] hw/arm/allwinner-h3: Remove 'hw/arm/boot.h' from header
Date: Wed, 25 Oct 2023 08:53:08 +0200
Message-ID: <20231025065316.56817-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025065316.56817-1-philmd@linaro.org>
References: <20231025065316.56817-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: 7soquAm13sOz

"hw/arm/boot.h" is only required on the source file.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/allwinner-h3.h | 1 -
 hw/arm/orangepi.c             | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
index f15d6d7cc7..24ba4e1bf4 100644
--- a/include/hw/arm/allwinner-h3.h
+++ b/include/hw/arm/allwinner-h3.h
@@ -36,7 +36,6 @@
 #define HW_ARM_ALLWINNER_H3_H
 
 #include "qom/object.h"
-#include "hw/arm/boot.h"
 #include "hw/timer/allwinner-a10-pit.h"
 #include "hw/intc/arm_gic.h"
 #include "hw/misc/allwinner-h3-ccu.h"
diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
index 10653361ed..d0eca54cd9 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -25,6 +25,7 @@
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "hw/arm/allwinner-h3.h"
+#include "hw/arm/boot.h"
 
 static struct arm_boot_info orangepi_binfo;
 
-- 
2.41.0

