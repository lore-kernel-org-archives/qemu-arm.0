Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4080726lfk;
        Mon, 29 Nov 2021 12:07:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4zQjF4y+R4Gvk8DaNt1QN6DhEIgwnIqZI7V/U7j+T60AtOa5FOuPi8qt93b0ggwQm1oH1
X-Received: by 2002:adf:a193:: with SMTP id u19mr36215294wru.563.1638216423692;
        Mon, 29 Nov 2021 12:07:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638216423; cv=none;
        d=google.com; s=arc-20160816;
        b=JKTNQvbqu7XgUQFwbIc8ASeM4TQ2BzZtn+ZbgoOLwYK6dfSKbYErwnLrNRONuRokHf
         2IfyhrSaKOC23PnwxFeg1LORM1w49UyC8Wm7YR3slsedCA9DsdtXMljhIWv8me8GdG1o
         5FQAV+QxhfM7KxdjTyshZF9LGYNAYy4thaaTS8UFrRVIYeqQ1JY7K8KS4F40aprcpFQr
         ScsBLI0X8gntbDU7wxGenZU9AHisjL2ckxYcMsgFlIQc0wUE5NGivIZ32BCnQBrlvj3a
         isC2UG3e8cuzJdvqOoT72KThx4SJV4Fy4hnAlVJOhKDbkGyhStIBkxq8ElaIdTZ4Ww1+
         JfHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=sKPrq0WiNhFQC4eMSOOuu5+qd4ajSFj6dKcca8DNV3s=;
        b=CnGfoQa2oOnSHhZReXAPqgWvlL2pzmhC+xb5jsp2FcKBG1pU3559iXceVtV5IX0xl0
         LsQyjth3HHvnLiN56LFd2cq1qxb00a4ZXZANN6LjoMduhvBAWhvnmd3wEGmBjMuk+DKI
         9QVKwvfWxYhB9sO8wt1QDG1AxosGHI9XteP9b275aw0ZYceMO8vLLDqeoL6+iv0M9vka
         fNA5G8hj66J9U4+cTDbZvbiziCtjK+8hV27GedQ6kQScSO3MhJjlhA7O4qZBYp6KgXge
         qMFDojtloM6V8Vgr0FcO9hWQNLABxTyq1fsXuorebCNp5FaU5/4Y0qhPX2W0Zh3w91MC
         Xh/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mP3wWHLl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3si19345454wry.726.2021.11.29.12.07.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Nov 2021 12:07:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mP3wWHLl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mrmvW-0005CJ-SC
	for alex.bennee@linaro.org; Mon, 29 Nov 2021 15:07:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrmu2-0003Qj-P9
 for qemu-arm@nongnu.org; Mon, 29 Nov 2021 15:05:32 -0500
Received: from [2a00:1450:4864:20::335] (port=36442
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrmtq-0008D5-C4
 for qemu-arm@nongnu.org; Mon, 29 Nov 2021 15:05:30 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso17772734wml.1
 for <qemu-arm@nongnu.org>; Mon, 29 Nov 2021 12:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sKPrq0WiNhFQC4eMSOOuu5+qd4ajSFj6dKcca8DNV3s=;
 b=mP3wWHLlNPW5o+JxKlMf0nd0DI4W5wCSPd8Jjble7DHmCXOdcqLeXRrOJJ8KLxIiPj
 WTP9fxwcVRnVUhU3ctdpJXeLPCE30D+qeStaK/TrZZNhoNl86KhDDm4nPdSbbLS2lVnn
 PeSq5gbWSebm82p0anPmJ87jF1PkCAQ2AR8pn42MA0TzRkllj4vQeLK7kIiEXovyjhRz
 Jbmc7jXf4hMxL6fMAemZB6Hd0aDlVOGmisVt37X0+Kc75J7vjhJjAsGv9Kx8LB6LeQ8o
 wvj7y2yfbdOl21yxHVgS7LhBK1SYi+qgUoo4uHIbKRe8hgN+o7PEm0DTbypPk+o4fUgf
 phzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sKPrq0WiNhFQC4eMSOOuu5+qd4ajSFj6dKcca8DNV3s=;
 b=qyCc0kNlZAJZp8rdE871yP1IdRc9AAszu2RQ7yMgSUA2bsHFS0g3KZC1LkLUcZXHDT
 75ZQotxUOK9BNtJmLUhYGaz9nZC2J1Wdf88LCPJTf5NkvZ2nhuTRv8x8wmNxvT6OVkZi
 OfhnoXUnnJpeEYabQN1fB7LpkBWF7boBUlYf0QmL0CZ4wneGt7gy3QPNIS9LxW+k5drZ
 6euo/yW7oQFJJKwD6uyqvzgbKQmc9GsPLL8FhUfte/SmI3Wivnn2yQacRPCbRJs7Tj86
 WJuzbS6SN9M8F0YFa7tORX628hSHzIQXaoQwSFp44YeUxq5MMTpjKRtf4OQAX+js8HmW
 sJ9g==
X-Gm-Message-State: AOAM532/mzrOOa21gpmUatQAd3UIe03+aV1dzZmkEXjEw6/wr3xVyjZw
 +efC9WsX5/Ektqi3VnZPZX3Jr6Lt5eFZLg==
X-Received: by 2002:a05:600c:34d6:: with SMTP id
 d22mr177431wmq.111.1638216316640; 
 Mon, 29 Nov 2021 12:05:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id v15sm14678863wro.35.2021.11.29.12.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 12:05:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.0 4/4] hw/arm: Don't include qemu-common.h unnecessarily
Date: Mon, 29 Nov 2021 20:05:10 +0000
Message-Id: <20211129200510.1233037-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129200510.1233037-1-peter.maydell@linaro.org>
References: <20211129200510.1233037-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Sergio Lopez <slp@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: by0i2RgU4c2c

A lot of C files in hw/arm include qemu-common.h when they don't
need anything from it. Drop the include lines.

omap1.c, pxa2xx.c and strongarm.c retain the include because they
use it for the prototype of qemu_get_timedate().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c           | 1 -
 hw/arm/digic_boards.c   | 1 -
 hw/arm/highbank.c       | 1 -
 hw/arm/npcm7xx_boards.c | 1 -
 hw/arm/sbsa-ref.c       | 1 -
 hw/arm/stm32f405_soc.c  | 1 -
 hw/arm/vexpress.c       | 1 -
 hw/arm/virt.c           | 1 -
 8 files changed, 8 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 74ad397b1ff..399f8e837ce 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index b771a3d8b74..4093af09cb2 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -25,7 +25,6 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "hw/boards.h"
 #include "qemu/error-report.h"
diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index c3cb315dbc6..4210894d814 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qapi/error.h"
 #include "hw/sysbus.h"
diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index dec7d16ae51..aff8c870420 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -24,7 +24,6 @@
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "sysemu/blockdev.h"
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 358714bd3e8..dd944553f78 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
index 0019b7f4785..c07947d9f8b 100644
--- a/hw/arm/stm32f405_soc.c
+++ b/hw/arm/stm32f405_soc.c
@@ -24,7 +24,6 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
 #include "exec/address-spaces.h"
 #include "sysemu/sysemu.h"
 #include "hw/arm/stm32f405_soc.h"
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 58481c07629..3e6d63c7f96 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -23,7 +23,6 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 30da05dfe04..3e2144e31af 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -29,7 +29,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu-common.h"
 #include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "qemu/option.h"
-- 
2.25.1

