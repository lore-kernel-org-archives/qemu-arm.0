Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp311833lfc;
        Wed, 10 Jun 2020 01:58:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFFJAkd1ny2f86lEuswjt+veCe6EVfWbNphUzMIDEGh522EC4XlSZGw5j+6j5R5yXyAp9n
X-Received: by 2002:a25:3784:: with SMTP id e126mr3961695yba.267.1591779484599;
        Wed, 10 Jun 2020 01:58:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591779484; cv=none;
        d=google.com; s=arc-20160816;
        b=cva3qnStblNNygSGt/mZMFI3ovMVGp0bDdgNm6s/XTdpKsvol+yeeMX6qzszCTEJtk
         C2/E//VjU4ObID+IAN+5Cm/gqEp7HvfR60Hf9m+MoRN4G/8tqrJZLR4Bm56mYIU1OPdl
         OnvoROnE4KaE7UEUfEMUAv3fddc8ODJsSTotdwd/SRB4CeZfMTJgGHR9DQUQU3SvNzg5
         E4SY/G+fzfBuEfvwVCVBqZwF0rfSCdMqA65s5dBTNhGJU3mQ20eGUnhmvecosHdGLT6W
         pFFmxsJG2CaaA5x0DlM5Ewm4P9N8xnfT0EDJ4r86lmdJZ9eH7O67LRmd2YrVpvcZXaKJ
         dogA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=+RlEiEBdFhsmyMDkaNY6bto0uDM5bKD0jNbLIi/ZHRA=;
        b=aauF9jDEJ9KCpeRaYkUEv9A4gGZBY1r/rZj7JOoquIKJHId4EEBoDLP0GMq+f6OznH
         J7oj0lkLSfCQY7/oHBWYDXoX4Wbc8Gz0MdWgJyt4xADmZv5//DLcGEF08QAb16tyzTy1
         NDUVb+gvfFR7yWXYgYb2AFaO9AkRYQcfg6zWy1Dl3wCCr6DZE2zC2Ja3EYUd9ycg4zok
         TZW4eL9Dv6kky8IzP82ARJdZ5i/Nw3yqRVStx1hEsoM288pOk4GrhHskRgJMeL1UAcpL
         V+XajLUnNStgGD1pk8ut6mV296QPSxO73ivRJnroIVvxuEY/+3p29/KXUu8zLqm/BXj/
         Vk5w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g15si6460860ybe.188.2020.06.10.01.58.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jun 2020 01:58:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiwYd-0007K3-U1
	for alex.bennee@linaro.org; Wed, 10 Jun 2020 04:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vav@vav-lap.sysgo.cz>)
 id 1jiwXe-0006Rm-3M; Wed, 10 Jun 2020 04:57:03 -0400
Received: from mail.sysgo.com ([176.9.12.79]:38124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vav@vav-lap.sysgo.cz>)
 id 1jiwXd-0000Tr-4P; Wed, 10 Jun 2020 04:57:01 -0400
Received: from vav by vav-lap with local (Exim 4.92)
 (envelope-from <vav@vav-lap.sysgo.cz>)
 id 1jiwNa-0007Mi-5a; Wed, 10 Jun 2020 10:46:38 +0200
From: Vaclav Vanc <vav@sysgo.com>
To: 
Subject: [PATCH] hw/timer/a9gtimer: Clear pending interrupt,
 after the clear of Event flag
Date: Wed, 10 Jun 2020 10:45:51 +0200
Message-Id: <20200610084551.28222-1-vav@sysgo.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=176.9.12.79; envelope-from=vav@vav-lap.sysgo.cz;
 helo=mail.sysgo.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/10 04:46:39
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM cores" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Vaclav Vanc <vav@sysgo.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8FiXomQo4z9Z

A9 Global Timer is used with Edge triggered interrupts (This is true
at least for Zynq and i.MX6 processors).
When Event Flag is cleared in Interrupt Status Register and new interrupt
was supposed to be scheduled, interrupt request is never cleared.
Since interrupt in GIC is configured as Edge triggered, new interrupts
are not registered (because interrupt is stuck at pending and GIC thinks
it was already serviced). As a result interrupts from timer does not work
anymore.

Note: This happens only when interrupt was not serviced before the next
interrupt is suppose to be scheduled. This happens for example during
the increased load of the host system.

Interrupt is now always cleared when Event Flag is cleared.
This is in accordance to A9 Global Timer documentation.

Signed-off-by: Vaclav Vanc <vav@sysgo.com>
---
 hw/timer/a9gtimer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
index 7233068a37..732889105e 100644
--- a/hw/timer/a9gtimer.c
+++ b/hw/timer/a9gtimer.c
@@ -206,6 +206,9 @@ static void a9_gtimer_write(void *opaque, hwaddr addr, uint64_t value,
     case R_INTERRUPT_STATUS:
         a9_gtimer_update(s, false);
         gtb->status &= ~value;
+        if (gtb->status == 0) {
+            qemu_set_irq(gtb->irq, 0);
+        }
         break;
     case R_COMPARATOR_HI:
         shift = 32;
-- 
2.20.1

