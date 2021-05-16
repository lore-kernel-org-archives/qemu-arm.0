Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp673521lfm;
        Sun, 16 May 2021 13:51:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnW+oq0LURbfi4m1oHmO4e81IWA3csR/8gfvEme4kwLyiPaWrDWLzyGPqEtIMQnd8JTWCN
X-Received: by 2002:a5d:8b85:: with SMTP id p5mr15370684iol.43.1621198284536;
        Sun, 16 May 2021 13:51:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621198284; cv=none;
        d=google.com; s=arc-20160816;
        b=PY4jjATfxjlPcW7mHq9HUFdQ8pyjc7AjO11fMQFv4xmzXtypkC/XMqUtpQ7OO82UxK
         Q4qqtWAJgdKMPagW2KOnOePLdMkgalqeQD9p82vZvEUdsKrdqbvphwfYwvnDkrdX90vI
         LxkTVp7acFLcy9iMwlleqkUXxTRAJyR9QCznS/wX3DIRLCnmy86s75WBT8FMBq4y1mcd
         kWE2Kgrn5gv1z4ZWc1YfSpW68LbIEUSnEQRsLRkveDNl3cFMk5Jpw7nGJAhhFAsglwRw
         wVzclHdBYrzrX9mnSe7e24SReV9pU5nCX0xhVo5RJwEmt6jTnUpBFh1RAryDIb+m/RvI
         zYYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=jjzGDYsCt9G58r+D/CLt4yD0Z7T5oyNjPS/+wxQ6rIQ=;
        b=ZKPnO02vnL3vrNU0fW6vr0osnJp5FFbacbGBXTiuFwZ6juSk56BnJ/9j2W252AIm+I
         nICV1//yocbHOBlWc23e0upxrj5R55V91SfqJu+Da3UBaW4d7sZrxALfS7JfC2ZeDJeJ
         24GRBenIwMDyN/713um4fk9elkPPdzr5XW+tI3qswWlKXYIV2ZLz14NFxVxVYjfNcB5c
         9KRWThZ+RQMAjIATfpZS15KB/Qc64DvOjECDh7/Zg8oiamfhNh3aPtq35RrV+vwENdT/
         7WlRiZzwHFJW9nvKKRITT1WFRewrtbrxVYT+p5WLMwF1DBdg5ktuhlFRkT6xn6EErIj4
         ZLzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lRB2p+3L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x20si15184013iov.56.2021.05.16.13.51.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 13:51:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lRB2p+3L;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:40118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liNjP-0002Th-UH
	for alex.bennee@linaro.org; Sun, 16 May 2021 16:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liNii-0001dB-R2; Sun, 16 May 2021 16:50:40 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liNih-0000Uh-4d; Sun, 16 May 2021 16:50:40 -0400
Received: by mail-wr1-x432.google.com with SMTP id y14so2242257wrm.13;
 Sun, 16 May 2021 13:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jjzGDYsCt9G58r+D/CLt4yD0Z7T5oyNjPS/+wxQ6rIQ=;
 b=lRB2p+3LsED7KX5+TiYP8FiEjXnfuQfrkXZ6GNTzDo7YNUP7VY7aeNa5dMjp56H3L4
 U5tBWm8AUswLy48StgTR5mjND4bBpX172OIQZhEk+kq43ViJG5R1BcePHZeFzX7LrCPr
 V7/wakOHpc952C9omoexn8hd3YrLMF1zj4s9qKzkY+jsA2+1QJ5N6R4MNhpSB5EpCah8
 SpqQyEzmw19dYBzeIC2b0A7D/gOa9A1KTXxkYTtYxBYFWr+gq8p7ZqWIrq4hgbQ1rhln
 OYvUGDEwoFKqCp8YPIDs6WijWWkhrSuvi9l4B5d+kPsxS5AJjgZeNFgLlTWdqDDjdZGB
 4oyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=jjzGDYsCt9G58r+D/CLt4yD0Z7T5oyNjPS/+wxQ6rIQ=;
 b=YaJDVOYXxr0SxytMIpXQ/t2AvQislOsg9j7gIE460JO5r2FKFIznk4mYun4dPkz78N
 sjXrJRSfnmDMqlVsRgLLRwBV1PnEpU9xUnvBlIMCqxXsQqjjt9RD3oMT5vtEWkOwSSf7
 OlQO/kT1tiqZuZl77HLXSRi0ehrEiL/McnnJEKUZ9RZp1Wr93y26JQwr3Qs8ZyI+4ev6
 f1/Ld/kZJaAjL4l/i4hksAwRgQuLVu5w2pU3SsJd8leH3zSRNf+ejsLgGdoGf/hONy1p
 FNnl6sVIt2r03nkPFyQi6278LiXTjT1tG5BNQxFGSRh7svIbDW6UbRH+l+aL5raHF7WY
 pHKA==
X-Gm-Message-State: AOAM531Ga16sWvGku3AJPJqfN8s4TLkkZ6tgqeKyiwpSRwZAJKxeiEMo
 Hfzlm+gl84edYXfJCcSUzS9d6b+EwMawSw==
X-Received: by 2002:a05:6000:551:: with SMTP id
 b17mr69824234wrf.32.1621198236496; 
 Sun, 16 May 2021 13:50:36 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id r7sm11233920wmq.18.2021.05.16.13.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 13:50:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] misc: Correct relative include path
Date: Sun, 16 May 2021 22:50:34 +0200
Message-Id: <20210516205034.694788-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +4+LrQCsYObL

Headers should be included from the 'include/' directory,
not from the root directory.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/acpi-common.h     | 6 +++---
 include/monitor/monitor.h | 2 +-
 hw/gpio/aspeed_gpio.c     | 2 +-
 hw/intc/ppc-uic.c         | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/i386/acpi-common.h b/hw/i386/acpi-common.h
index b12cd73ea5d..a68825acf50 100644
--- a/hw/i386/acpi-common.h
+++ b/hw/i386/acpi-common.h
@@ -1,9 +1,9 @@
 #ifndef HW_I386_ACPI_COMMON_H
 #define HW_I386_ACPI_COMMON_H
-#include "include/hw/acpi/acpi_dev_interface.h"
 
-#include "include/hw/acpi/bios-linker-loader.h"
-#include "include/hw/i386/x86.h"
+#include "hw/acpi/acpi_dev_interface.h"
+#include "hw/acpi/bios-linker-loader.h"
+#include "hw/i386/x86.h"
 
 /* Default IOAPIC ID */
 #define ACPI_BUILD_IOAPIC_ID 0x0
diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
index af3887bb71d..1211d6e6d69 100644
--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -4,7 +4,7 @@
 #include "block/block.h"
 #include "qapi/qapi-types-misc.h"
 #include "qemu/readline.h"
-#include "include/exec/hwaddr.h"
+#include "exec/hwaddr.h"
 
 typedef struct MonitorHMP MonitorHMP;
 typedef struct MonitorOptions MonitorOptions;
diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 985a259e05b..db7ef88ee56 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -10,7 +10,7 @@
 #include "qemu/host-utils.h"
 #include "qemu/log.h"
 #include "hw/gpio/aspeed_gpio.h"
-#include "include/hw/misc/aspeed_scu.h"
+#include "hw/misc/aspeed_scu.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "hw/irq.h"
diff --git a/hw/intc/ppc-uic.c b/hw/intc/ppc-uic.c
index 7171de7b355..60013f2dde3 100644
--- a/hw/intc/ppc-uic.c
+++ b/hw/intc/ppc-uic.c
@@ -23,7 +23,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "include/hw/intc/ppc-uic.h"
+#include "hw/intc/ppc-uic.h"
 #include "hw/irq.h"
 #include "cpu.h"
 #include "hw/ppc/ppc.h"
-- 
2.26.3

