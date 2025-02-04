Received: by 2002:a05:7023:b15:b0:92:a90b:6588 with SMTP id qd21csp436824dlb;
        Tue, 4 Feb 2025 10:11:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUmdsqOFjqoNZ4FGmm5yWaE1SGibuxsn3kwdnS3u/eJB79XUnWGK0oT7+EWkAa6IER2ZX4UD4OCAd+29g==@linaro.org
X-Google-Smtp-Source: AGHT+IGtE/PHrOgSrq3jlWUmC5jigIelLhM9Xg4U+rmKPYaOgFoP1oUnPqljkIOMV0YatsTygpQV
X-Received: by 2002:a05:620a:3944:b0:7b6:eba3:2e08 with SMTP id af79cd13be357-7c02ec1ce8amr683492385a.7.1738692688141;
        Tue, 04 Feb 2025 10:11:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738692688; cv=none;
        d=google.com; s=arc-20240605;
        b=HHN4ZhUKVyZ7q19bVT+cMwRyU7cPGTnoJZXBUxeaJu3OISif5NPuCiKHRnS2xtGNwB
         0JCwHRtKGQyxuh1UfVyWGS58uXdU9CTX/PdtFO75/LgNgy1ey6Dkb+s75f1CiGNIJRJs
         +aG5TiRpZCiFRPYSut5q1vHVCkZUZ0LhpPeoPU5R8jWur/GQ1rPfATjlP3oerSiT0bbH
         ZSvWmH/0OZZpWj/lV79vku/izH8M77xgTgRDNB4JAGfzPvhKamoHo3MsE4EKeUSm6C+a
         KWZo3rvjMS4JMxa7wgdPdE42IwUHM1jblKi9VZ2soS3nnltU4lHFBjP1yJ1J6gxyt4fh
         P+4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4aC2ap/lG5aepYBxnBeqfmcNSow0ZaEbYXj6+8sjwn0=;
        fh=Fr7KWdSB8csBog1HqFACDLHw5Bqh7nNqSJhjdxBBjk4=;
        b=GCQKttS3l04Y+8NUF4RQ69RFuC3j9IcYwuAt7DUooqyF2YTMGqhcxrN2t7yeoFJ8OY
         W78DDQhFg/FD5S+vHXxUfb4OUi+p7adp8244jurnt1L2DDZrk+XM6Xa5vG63BpXTfi6i
         smlJV8SLIdch3bHFq+Z93wErEgBGL7MgCzG9a78vopiHC1QF3Dg2+TjHly0PsggS2+P3
         lGYylM6w5WHSd+ZFh83nxQDDIwWXMn8n2JHSlv74YVrRJFAi34+y+kOezJzl3p/Qj694
         kn0bGsLdYvCAyhK8ilmE1piZCrp6EP0TPYJIdS6MjRc3RvzXWd86R3YpZD8YrOb7i3W9
         hAoA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YalsiWaz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c02db4de10si314850985a.61.2025.02.04.10.11.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 10:11:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YalsiWaz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tfNNN-00079m-Pr; Tue, 04 Feb 2025 13:10:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNLc-0004ah-Bp
 for qemu-devel@nongnu.org; Tue, 04 Feb 2025 13:08:34 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNLa-0007Fa-18
 for qemu-devel@nongnu.org; Tue, 04 Feb 2025 13:08:31 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-436ce2ab251so41041895e9.1
 for <qemu-devel@nongnu.org>; Tue, 04 Feb 2025 10:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738692508; x=1739297308; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4aC2ap/lG5aepYBxnBeqfmcNSow0ZaEbYXj6+8sjwn0=;
 b=YalsiWazPzHaJEKQguDuYf+1VU37Cqk8DEWkV0HFpnriQhZOAKRtQoUHZ5NWAEYgik
 KRtM7eISdhLrTdaruUSBTOp/biNcZFvLw4iT/BTC1PRr59esYo7L2l9PTaA56P42JA4n
 6VJLi2BzJVq/NAmdkZrEFhu415+uhVDkGjOv9NemOM6wP8b+r4Td4N41Xp8Fxkq/LA84
 5VGR+4J4RP+IagpserA+Ov+Hji4c9ziIq1SJ4R1B1A5fg6Nne52N8oqYwUCgvrFmh1t2
 JrbIYTMiLPWiFWKaHh/CHBIKdB7Wph21FXEiJzzBl54z5CJ9viK2c1Yl2t8x6cqXu147
 ddgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738692508; x=1739297308;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4aC2ap/lG5aepYBxnBeqfmcNSow0ZaEbYXj6+8sjwn0=;
 b=kgWAomB4SmoL2i56fzn40QEYn2Cd5lKLS954VhJBY1ynHr+9N78WM2xISDQ4vgQUuW
 /nbMhsiA3Dr5ixNxXUOk2LPXFuoY4AlhB/KF7xxIRI7CV/iSekghCsfM+6amLm+HO7kJ
 q46gfJGod/WhmcCS5VXo1YZXfe4wmSck6oUGO/UWWO/yKdNNhWHRPGi08JDDE5a0K89e
 8gUwzJAiEbQueEgfDhC+zEmRvnetzttG6/H3OP6u5utwYF8bE3aHH2Egv01EjLlZ1iwc
 bmfAYWpHXg8XcSimPxt0LNXj/6eRlNEJ1L95rSF26WZQvihyHQ82WZMkmxluP/8/vxDP
 tIyQ==
X-Gm-Message-State: AOJu0YyuwZxOJTDlnBSP9FAliuPPQf+CxCFtQ18cLmf/nh5sS1pwzHYr
 DU0pL9o+roya3KlIpj8nFiUlhC7hfEJMQ9s7L7AlKrkRVkrbxpIoQKg0E11FeeCiEgG3Owy/R2R
 dh4o=
X-Gm-Gg: ASbGncuZtES643qEwFemWvVQ4rt4dBfZF0FcbSh9S/Wi9wOB67FcuWfpctOFwaEz5UA
 I8P7txuUqJCFU6SIPe5nyTi7STMbS4tq67AwoB0Pw4s4RVTzz0IltvInnwkQ3uvIwWdcv1KefZV
 NBLfs0cTrYekv6G41Eaz8fA734sYxByK2zitxpN0MdR9YoV10DsYbCKGYOw1QISNiufiyTtLn2t
 8//gOKtrguRldV95mki6KgKrqBTN7FQmC9RMkkOKw798b56+NpFUM4SA4AfLcLr9dU+a8fAwh8E
 BV8y8Bexs1QX3nMlNXR/oxqRe+v/YmlRKHms4aqoxyfc4VW74grX/+U3VmkTi9Yxdg==
X-Received: by 2002:a05:600c:3d05:b0:434:a802:e99a with SMTP id
 5b1f17b1804b1-438dc3ab389mr215605415e9.4.1738692507800; 
 Tue, 04 Feb 2025 10:08:27 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23d42d4sm203332745e9.6.2025.02.04.10.08.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 04 Feb 2025 10:08:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 8/8] hw/boards: Ensure machine setting auto_create_sdcard
 expose a SD Bus
Date: Tue,  4 Feb 2025 19:07:46 +0100
Message-ID: <20250204180746.58357-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204180746.58357-1-philmd@linaro.org>
References: <20250204180746.58357-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: eNXSmfRx4dvO

Using the auto_create_sdcard feature without SD Bus is irrelevant.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 system/vl.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/system/vl.c b/system/vl.c
index 5ff461ea4ca..dd8053e1e79 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -53,6 +53,7 @@
 #include "hw/usb.h"
 #include "hw/isa/isa.h"
 #include "hw/scsi/scsi.h"
+#include "hw/sd/sd.h"
 #include "hw/display/vga.h"
 #include "hw/firmware/smbios.h"
 #include "hw/acpi/acpi.h"
@@ -2661,12 +2662,19 @@ static void qemu_init_displays(void)
 
 static void qemu_init_board(void)
 {
+    MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
+
     /* process plugin before CPUs are created, but once -smp has been parsed */
     qemu_plugin_load_list(&plugin_list, &error_fatal);
 
     /* From here on we enter MACHINE_PHASE_INITIALIZED.  */
     machine_run_board_init(current_machine, mem_path, &error_fatal);
 
+    if (machine_class->auto_create_sdcard) {
+        /* Ensure there is a SD bus available to create SD card on */
+        assert(object_resolve_path_type("", TYPE_SD_BUS, NULL));
+    }
+
     drive_check_orphaned();
 
     realtime_init();
-- 
2.47.1

