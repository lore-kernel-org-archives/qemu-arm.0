Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp4355939ejy;
        Thu, 6 Jul 2023 08:09:58 -0700 (PDT)
X-Google-Smtp-Source: APBJJlETklWpoMTw0rltNlNmZu2bU2Upc5OFG6pGruY+vM4haxOFub8NPEnEIyb4C0ougZMX+620
X-Received: by 2002:a05:620a:4514:b0:767:3799:fa98 with SMTP id t20-20020a05620a451400b007673799fa98mr2690852qkp.25.1688656197696;
        Thu, 06 Jul 2023 08:09:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688656197; cv=none;
        d=google.com; s=arc-20160816;
        b=CtTm35crM5iNgiyPFSZRjYSwLQOv/iuEwEPGwEndryC7vW9SDXI5CLYczaADM44TtY
         lXDn/mU1KQUETTnERQ1C5T8jJ3Rmda++nP6cP8PLTgOEQGNi8tScu9WnyOjONg9DycMV
         lsO5WVfhUzI7vyngXJlzAxAxxto4dHtFR3VBRW+8Ckqm7x2UW9Ymsu6HevD5lxLRT+zZ
         lEBo7CV1VQydQmfuIAcGzJS1LF2Zi0ZO3TwSxebAooq3y2yz50fVlldXubCoh7N+VR6P
         rK4xEJJHtL74KC1Ue3GCt4szSttRLnKK1YHGlIC6f6/KEinLtyFNXLa8phnxzmbMnqcY
         Zq+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Lc+ZtzDQqTYPVEDEPp9TCdNmwWdUxNxiAmSD2f53Jvo=;
        fh=HyfCzISLLSbuQvGLjVSigrJbPN6dEqV6IoEcqgHYkUs=;
        b=bil8AGJ6Sd2ceL3c8LU5nklsiR3XbZ8H3iihxbFLph0Y6x9z87WwSDET54ddbkiocy
         E8B15JUdh3v5tiJ917r0XTVv5J3LO7RBbbBTc7unfr75PposK1YJxKDm5o/we3/qegMH
         JDoSWn/y3uw4KikbdlR5YC7XQtB3dJx/o0WsetJNnIwqDYPv9Pe0DYtabudK81dLrl5Z
         NB40MgeR72GBurvFKLbnvdRjVwEbNHLgRQYgdOE7v+AbjAvndooUAjDSNQH+ES1/nJNK
         0PUo93pc/yCAoZ8n0p5IqYeP9GH0n8a1hPLc2cp41zjNL1Jv4QIP+ffmS9RVl54DjBk+
         8HAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=XVyfg4Vt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9-20020a05620a134900b0076724c5087asi1236747qkl.35.2023.07.06.08.09.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jul 2023 08:09:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=XVyfg4Vt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qHQc1-0005kE-Ir; Thu, 06 Jul 2023 11:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcx4c70@gmail.com>)
 id 1qHQbz-0005hr-Go; Thu, 06 Jul 2023 11:09:39 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcx4c70@gmail.com>)
 id 1qHQbx-0001bG-Uh; Thu, 06 Jul 2023 11:09:39 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-55ae51a45deso479264a12.3; 
 Thu, 06 Jul 2023 08:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688656175; x=1691248175;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Lc+ZtzDQqTYPVEDEPp9TCdNmwWdUxNxiAmSD2f53Jvo=;
 b=XVyfg4VtVB35ZwD3FOPZufZ1oW8o7qzPqfTD+1XoDx74F1D0jmjclKDoKxybiluJu7
 M8IZBAYh5t/3RUIK0Vehw0jCzgNMC1j2/0j+JOzmLLw+ak5/Pp5vo+sX9h4V0wK+UUAe
 R5YYY7f9uhRojySCOwlJmUbxHRoCz08tEZHQ1AvGJzScYj+ZT0JR5lkYh0whldt+F/Jd
 hIypDEkCh2WYW+Atm2nIBU8b/8mC4iD3uIrqr4XQFz0Vue2B5tPgbBvDtIb9+eI9nblP
 a5exETPQqOx687Za1EbqDH65CZkhL4qRNGxpweQYANTkS6vbZiwzL/TzQC/JMREb+nO3
 jEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688656175; x=1691248175;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lc+ZtzDQqTYPVEDEPp9TCdNmwWdUxNxiAmSD2f53Jvo=;
 b=bvDl3KIvHigYIjSff8xuF+2XvV9WIjbqJHJKbNkQdt9z0GC+zRoNP/patAI2kFNvTG
 6h8UfwkzX3s0BHZGND3h2sof7plkg+z0gA39yT0khdHA/VeBmaU4wtPs5+A7/bPyHEpp
 I7dQhICIZ52XfnUNyYubc/pC/viVhUWuub5hK0UeAP/sRPvtAJz4lCmO7oDlZZ6iUHOb
 ewf65RYhaMB04a3PNI5N4AMgcUUcgr/B31EQivtVLyeDqG9zoPtR36iY96shxy0Wh6zn
 6l3+ke7XlGYVG5GjqncXkMf2Dgks9tE6x8Zl2mybsKr0KL6jWagk6MUwbrRdANEoPgiV
 5LAw==
X-Gm-Message-State: ABy/qLZyb2+CvDZsFch8LTmqcdLH6Os1/hLQ1ecJygqsEeQgrFdwgI0n
 Qx90hW2BEL+0DF5GqTFYOLg=
X-Received: by 2002:a05:6a20:6a0f:b0:12e:5fd0:f4af with SMTP id
 p15-20020a056a206a0f00b0012e5fd0f4afmr1814063pzk.28.1688656175097; 
 Thu, 06 Jul 2023 08:09:35 -0700 (PDT)
Received: from localhost.lan ([2a01:111:f100:6000::4134:a26f])
 by smtp.gmail.com with ESMTPSA id
 d13-20020a170902aa8d00b001b51b3e84cesm1555671plr.166.2023.07.06.08.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 08:09:34 -0700 (PDT)
From: Peng Liang <tcx4c70@gmail.com>
To: mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Peng Liang <tcx4c70@gmail.com>
Subject: [PATCH] hw/arm/virt-acpi-build.c: Add missing header
Date: Thu,  6 Jul 2023 23:08:38 +0800
Message-ID: <20230706150839.1180137-1-tcx4c70@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=tcx4c70@gmail.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: P5j5nbc77vdh

virt-acpi-build.c uses warn_report. However, it doesn't include
qemu/error-report.h directly, it include qemu/error-report.h via trace.h
if we enable log trace backend. But if we disable the log trace backend
(e.g., --enable-trace-backends=nop), then virt-acpi-build.c will not
include qemu/error-report.h any more and it will lead to build errors.
Include qemu/error-report.h directly in virt-acpi-build.c to avoid the
errors.

Signed-off-by: Peng Liang <tcx4c70@gmail.com>
---
 hw/arm/virt-acpi-build.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 55f2706bc9..44cf9f3312 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -57,6 +57,7 @@
 #include "migration/vmstate.h"
 #include "hw/acpi/ghes.h"
 #include "hw/acpi/viot.h"
+#include "qemu/error-report.h"
 
 #define ARM_SPI_BASE 32
 
-- 
2.41.0

