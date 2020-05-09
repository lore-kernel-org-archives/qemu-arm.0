Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1026649lfb;
        Sat, 9 May 2020 06:09:44 -0700 (PDT)
X-Received: by 2002:a05:6000:189:: with SMTP id p9mr6707136wrx.187.1589029784497;
        Sat, 09 May 2020 06:09:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589029784; cv=none;
        d=google.com; s=arc-20160816;
        b=E7n9MMtrcAtGO4itRZuWG9Fdsz5DwUMtJiIT0Sk4ElSdXJrDXUFB73qFFC6bT1zoLm
         g96T4L/hq6jtlli+Vfb1Jo82WgDjurBXi84v70s7l5Gw0JQE6chT8cVAtxk9Q2S/wnEy
         E32N3AJErIJiDozontK9bhFmbE561FFDo2NVBAMMN+lXgbzL/A16ExKPk1XZRn4rOZUa
         lm/LZBRCa9Xtb1QXEL8kZ/nBzJUNp/QWyJm1zfZR/u6X10oC4Tm0O5vYQob4bx4rgJBg
         hCHi+bR3tCEfxtpz/4yS1sFChAlVIHtbildgzFtgq+AzRQaGg6IlR/KFMWnXFM/OBeuj
         119w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=kJ9dbndR3EJ3N94DuL32xKff0HO4BFM4yLLW9t9p4DU=;
        b=XrJogzsyvyOAHXskxvSbYB6Qv2tiwKqczUBP6IIEjtdMbd5zzgknU6fGnUcbjqx0fA
         CxdcwTYZv1cVYImcJ032Nv9CR2IQUjxfjwdxg4BNPiHeP9a93QlGJVRAT/sEpNbFq2MQ
         d3PJgVXsH7QXcxTyfIXxiYtRhGHnONw1vl8zXQQmbbMj5qL2QU5VtZ6VJ9BTjNZEK8hk
         IzA3Q9J6Pg4GGH5R/K0HGiyRB7k6nAwbnnwUeYzAT+4aJeAw5Eyv62GLiJAC0/TtrGQD
         bLu9sYa00/tdw20n8kRQd6JTJtOVwJs7bL69y9a8XJk2XfpkFu2svo9nULsJDcomSedP
         4Pag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=flf4veSg;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x16sor2958096wrv.47.2020.05.09.06.09.44
        (Google Transport Security);
        Sat, 09 May 2020 06:09:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=flf4veSg;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kJ9dbndR3EJ3N94DuL32xKff0HO4BFM4yLLW9t9p4DU=;
        b=flf4veSgSNp7WVQXiv7V7NrX4UAefRYgFkBmINorTlpVmyHhE7veSTufxoQW+l6Dot
         wR4o/pIkezvKsQqfk7pi/vw7fH8RkeyXgbJuREtSTbXGDFEouDylssuXi6SMi8W1jC5F
         5aED8Ld4faiQC7wAF1M2ntUooqoguTRu/E29eqc9poBI//e0zx/vU6BrIVDw5CAtIRJQ
         U1HvgPNfo1scPphSCiVyayMiZg9brfMjvP3CZScx0xnjDbgj7SjIjb3Aon3WxpxEpyNk
         8Tgzh6WxdSkr+gT7kxZVlRfnD7P4SSu4HY+r7qtPXUW500nMnbMXQG11g89ahQXrW1ih
         IqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=kJ9dbndR3EJ3N94DuL32xKff0HO4BFM4yLLW9t9p4DU=;
        b=AL31GG+HQ4vPqyzFFNkIIatw3M957997dX3QBPAgfZRP7dnaYzXTCSP/Iqkr72zF89
         3fQGl8r7SrzwDQEYp86juzIorOq4SkAc5lwOpLsEaeck8H18qeHjNZ5rFWLGsJ6/sUWE
         +XLAl9Bv4K0aiB/Nn91xPUc3oeYqXQRssrN9H+P7q1pnYpoak9U++e4h820y06oPxR6y
         /D4XReuAkDb9GVhKujKjOkb0/bEQhPe+zJJKZoeAFt2rk+lM5Tg3NkXDZP3lIoxBlGzt
         MdyHvoi186g1WeySD8O+6SRWKg3g0LVulFs3UTBOxUjilsvsk+T5uIWO+Zwtf5MBvDWQ
         VbKA==
X-Gm-Message-State: AGi0PuZiaAXeGdn+/osQxsApI7FKVLyY/9sP/VVCTq+AfaBisHFQbOqZ
	wyKemJQS22t4cIqDk35Y4eU=
X-Google-Smtp-Source: APiQypLurdSmGrp9B56qX9CNWGd9AI2ip7cdRiw9zhMpmGh5F+d4uyBrY7d4KNVvcCiBokEwwDx36g==
X-Received: by 2002:a05:6000:11cd:: with SMTP id i13mr8894961wrx.95.1589029784233;
        Sat, 09 May 2020 06:09:44 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id m65sm1411410wmm.17.2020.05.09.06.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 06:09:43 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-s390x@nongnu.org,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
	Marek Vasut <marex@denx.de>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-riscv@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 10/11] exec: Use 'cpu-common.h' instead of system-mode specific 'hwaddr.h'
Date: Sat,  9 May 2020 15:09:09 +0200
Message-Id: <20200509130910.26335-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200509130910.26335-1-f4bug@amsat.org>
References: <20200509130910.26335-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: uVflFAJZAAb9

The "exec/hwaddr.h" header is restricted to system-mode emulation.
Instead, use "exec/cpu-common.h", which is meant for all modes.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/disas/disas.h  | 2 +-
 include/hw/core/cpu.h  | 2 +-
 include/sysemu/accel.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/disas/disas.h b/include/disas/disas.h
index 36c33f6f19..531b42e002 100644
--- a/include/disas/disas.h
+++ b/include/disas/disas.h
@@ -1,7 +1,7 @@
 #ifndef QEMU_DISAS_H
 #define QEMU_DISAS_H
 
-#include "exec/hwaddr.h"
+#include "exec/cpu-common.h"
 
 #ifdef NEED_CPU_H
 #include "cpu.h"
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index ed09d056d1..a215ae451d 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -22,7 +22,7 @@
 
 #include "hw/qdev-core.h"
 #include "disas/dis-asm.h"
-#include "exec/hwaddr.h"
+#include "exec/cpu-common.h"
 #include "exec/memattrs.h"
 #include "qapi/qapi-types-run-state.h"
 #include "qemu/bitmap.h"
diff --git a/include/sysemu/accel.h b/include/sysemu/accel.h
index e08b8ab8fa..e223a1d87b 100644
--- a/include/sysemu/accel.h
+++ b/include/sysemu/accel.h
@@ -24,7 +24,7 @@
 #define HW_ACCEL_H
 
 #include "qom/object.h"
-#include "exec/hwaddr.h"
+#include "exec/cpu-common.h"
 
 typedef struct AccelState {
     /*< private >*/
-- 
2.21.3
