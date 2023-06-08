Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp340201ejb;
        Thu, 8 Jun 2023 06:32:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ53BUi87cncKQsG7co9snjI7wWUeL1vKaXgD2j3Q4zmmaIgQWeZ2XLYcIXDwkYsd+ldbRJV
X-Received: by 2002:a1f:cb44:0:b0:43f:c8ee:62e9 with SMTP id b65-20020a1fcb44000000b0043fc8ee62e9mr2385991vkg.15.1686231122089;
        Thu, 08 Jun 2023 06:32:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686231122; cv=none;
        d=google.com; s=arc-20160816;
        b=JTsbaRPo2PhgGNL+l2d2TmoWRDDeYEIVuXBqQ4WZHP86au+hxmIRxNudmvhUk+Loy1
         +ND9S+07I/f+rrNTU2B1CyE0N5ZLF8OSPY/BYFjDqtRaxppDGLaUkxaGsJlGIDdWRW1x
         IMi7jB40m+DyBTWGFEJHjb8FImGQNmEYfUSoMYYaP8vuioKJVKDP/I3FCnHc4kFSKlog
         CpEGvYT74L4ZgD8LpnWAT22PhZafJi+flbCkH9cyTXFr2SAPC2b9WRJlFBoRnGH6LyST
         atfRy4WYbFC4lxaawI5kKLytBcJCNM5neccE+XotMrwXGKxLGIMm8PIqVWrSHXoz+4OQ
         9lDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QX7oEag8EHw5/rO2IwkanQ9xp1UV8fgADH4pyLkBN/8=;
        b=xVBp1xEq7DfZhj462HPNEMIXsvVMzPPrzt6IQmG9pJnCiaHXgeYb+z7NmeQ+EY+Yoz
         bt3gwMm2Um93Ig06gsknpH09bI8IUvcjH58HHRKVF+AN6qKnNMYY7HPrnymMDad7wiX1
         4wWAgpKr/atOg9NGaK25KQ1xRCSiNg1r8TkyF5iNXGy2PJ1bZnRn8XWj09JiYEROYyLo
         eTkihA1on24J4Kyg8xsHudw6BuEcJSAi/3mwZpnvHc4qzZxY7i76rsPheQjyMlyewKey
         LjQnzJ1Sirf9DKJUAg45wsiTsTs/ykuy6abSkpH5l/tPM31WqmgB6lp/hsu9Dh3OiQaZ
         z3pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yty491Tz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cz42-20020a056102292a00b0043b2890c6f1si72824vsb.389.2023.06.08.06.32.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 06:32:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yty491Tz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7FjX-0001DT-JS; Thu, 08 Jun 2023 09:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7FjV-0001BD-Sn
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 09:31:21 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7FjT-0005ie-5O
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 09:31:21 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f6d7abe9a4so4025245e9.2
 for <qemu-arm@nongnu.org>; Thu, 08 Jun 2023 06:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686231077; x=1688823077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QX7oEag8EHw5/rO2IwkanQ9xp1UV8fgADH4pyLkBN/8=;
 b=Yty491Tz/CLkQDSwq+5sZgxbDG7fw7qXKqg0I2+qqFNlYiT0oe+BLvr1I9fRtno99Y
 3wm+0fYUFbVJNzXFKo6oW+bpOF2rTcqGWoL2W9HqvNeeLIyDQy8LmSb2wCUSvpJFPxl9
 m0JFSV7phvOItASvAbXPHx+PrnsLtMkKiHbbLs0du3kluYxjMYsdIImMf89tg6QCtlV6
 TCoKwMQpYqT9s3iCVMvKQ6XtLoO0jNlqKWhSA1Ai5Q4JIgoiEImHDYM+F14RpKAjgH+u
 wiBvGPy/6F/Jds5Jwkr+gGCy1YuJi44biORmwvI/BzEAdLRatA59FiZST2qsTno6FOdW
 Ze4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686231077; x=1688823077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QX7oEag8EHw5/rO2IwkanQ9xp1UV8fgADH4pyLkBN/8=;
 b=LgeiztZjPhiNaPK2mfSU4/cfdmL9HYg09lvD6DDSASJD1FtDGcFnJC1lTajQ8ZYqym
 75lgxVIp/opoJybRCrGPQOLvFH1q6yVNM21Z+7oVBOCde/YFhljQteLFQpQRA01cu5wI
 OtKmWPbR4I6+U7T9bhAknd0H3n+dKTtSebxA4+YQ24MGh6y9ZBljgiQN8ONBGDl31JEJ
 aGrUo0M8SYDtCH8Q9M3ZSqYZDG88BdmhsljC+dNUlsWRXUQGcPgXJCwIs2U5IcKrlIB5
 aNxLvo3uEakJjG9hVE4X09ffNA4RKlUfwI52nXKextkfsRRSm2nKjzdJCQNJJqpeDPsv
 ljDg==
X-Gm-Message-State: AC+VfDxfdySoDO74tJDcMyhI2WG7bRKrug3tmbMIiQR/bNpEUp8P06tl
 fmYvF1bZkkqqyYAUKYtYo4rB6A==
X-Received: by 2002:adf:dd46:0:b0:30a:e9cb:1a2e with SMTP id
 u6-20020adfdd46000000b0030ae9cb1a2emr6312547wrm.65.1686231077545; 
 Thu, 08 Jun 2023 06:31:17 -0700 (PDT)
Received: from localhost.localdomain ([176.176.169.168])
 by smtp.gmail.com with ESMTPSA id
 cr5-20020a05600004e500b0030c6751a49dsm1596961wrb.115.2023.06.08.06.31.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 Jun 2023 06:31:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 1/5] hw/remote/proxy: Remove dubious
 'event_notifier-posix.c' include
Date: Thu,  8 Jun 2023 15:31:04 +0200
Message-Id: <20230608133108.72655-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230608133108.72655-1-philmd@linaro.org>
References: <20230608133108.72655-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: hmQN1k0MqKTf

event_notifier-posix.c is registered in meson's util_ss[] source
set, which is built as libqemuutil.a.p library. Both tools and
system emulation binaries are linked with qemuutil, so there is
no point in including this source file.

Introduced in commit bd36adb8df ("multi-process: create IOHUB
object to handle irq").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Note, --enable-multiprocess doesn't seem to be covered in CI.
---
 hw/remote/proxy.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
index 1c7786b52c..2052d721e5 100644
--- a/hw/remote/proxy.c
+++ b/hw/remote/proxy.c
@@ -22,7 +22,6 @@
 #include "qom/object.h"
 #include "qemu/event_notifier.h"
 #include "sysemu/kvm.h"
-#include "util/event_notifier-posix.c"
 
 static void probe_pci_info(PCIDevice *dev, Error **errp);
 static void proxy_device_reset(DeviceState *dev);
-- 
2.38.1

