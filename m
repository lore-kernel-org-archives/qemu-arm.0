Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1926036lfp;
        Sat, 8 Feb 2020 09:05:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqxcX3abpdubbZnw7SRzwvzRMUeI+7LwPqchB6KaRKUrP+g2Vhp/EjABmHqtGO4Y3ftMj8Q0
X-Received: by 2002:ae9:ec0a:: with SMTP id h10mr3804833qkg.303.1581181547582;
        Sat, 08 Feb 2020 09:05:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581181547; cv=none;
        d=google.com; s=arc-20160816;
        b=nBdNbgFBEzTIuV3cjIM/nAq+hiJI2JWfZZcOAR/dgDXvexPDvkjBbpfu+DNPVlE9fr
         dVYbN5rMwkWdzSg3BBUf/pC6MhO+lcdGbE1V7X+aXGYc7M0EO//md2fO9+6ymUsxTkZc
         RVJ8TdULYE3I/JCuOy1A8AC+wF62kc04/SsrWZBZvj0eShoTqQ7eF89EEzvA2V0Gd7bx
         Q4bkZGyE/wpYlJsQAlVEYiLMjeEVHj4CEHr/My5km66FMaKvhc/foV2mueLUhY0n9jdv
         RDWS9x+7m5ATyUb1IC/GVCr+fGE4LFpkyeNGVJQ978C1oQ+t5mLv8dK4A5pWW89VMhlk
         jV7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jNoPpCE7rRcR0rvodwnfplyWOCiHGlW6dGRYxmxzFcY=;
        b=Usng1BlAM6sR6+gfgjixN4HTJMzEW41iCzF8NAgM50OK8ZYF3vq4r8IElmllMO5s0n
         /ir9WOQpa7VNnHiZRgok2DA2UA1JrHuYKc9iRQsuoZuWswolQSO28SbVinKJvx6B/D8u
         h508xONXLTRNkCU7NFO9JyTAGa8evkUSINJuRvBolH5zRyEWN92fis35rfHtPa2eIBW6
         w47PzEDmjNtqBlN2DSieobzxH1rzSBhDY3b1+SnB5mK5v14VsI655b6AG/PLaZFyT/p+
         kiXfZz5I5US2sZT+nNDHI28jbYeFJD5Bz9FqnPXTZJIl0pj7YjihvwqsQ2SOoLcxx/vR
         Wkxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HsFHKVCJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v6si1489865qvy.118.2020.02.08.09.05.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Feb 2020 09:05:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HsFHKVCJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j0TYA-0002gf-L4
	for alex.bennee@linaro.org; Sat, 08 Feb 2020 12:05:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53821)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TPr-0005iK-LY
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 11:57:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TPq-0001in-LR
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 11:57:11 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:45762)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TPq-0001iD-FC; Sat, 08 Feb 2020 11:57:10 -0500
Received: by mail-wr1-x442.google.com with SMTP id g3so1410632wrs.12;
 Sat, 08 Feb 2020 08:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jNoPpCE7rRcR0rvodwnfplyWOCiHGlW6dGRYxmxzFcY=;
 b=HsFHKVCJtW45wUmDbfZF7mdfRVwDZ18BXahh9dkXEnOZZYK3VtYEoxpgKz6qLM0qDq
 6ojj/dZFn8yxq6gVDVARWe3m36nJXoJx3s436yBHMv0NhbsykPuUma09oM2Gu/wJazjR
 EecfibknY8R00Id4/SvXC6YKWwro4Due+736UAXcwTAQnjYhy5lKi/qlL7H56mXxJDPL
 1F29Q6+XQMDOsXmvcjVvWvEUgw+W44k0nxowWal7PDlCvjlTv0VplBcTyUUKVIJYN+Cg
 nD7aULU38RJPw/Dib/3N3wvGdMRVdAgj51gHdzAUfPyHlI87o/nlGWF8A6MpGj2eGyF/
 3szA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jNoPpCE7rRcR0rvodwnfplyWOCiHGlW6dGRYxmxzFcY=;
 b=mYAlTH/J27VwAKM08iYPYt/WkAKeu5HldvBhufClDo6+lGdSLRAt74VAbqndoaUIl3
 BNqp87KotvU5TEj0kZzS962MIkypknwHrnYQDHiLhfwCsddXDWOpYWaXE9tGiLWnp55H
 ON7fzz9fIXzgvYoMC3EOHazglKe2mLhY02g5M9QifwWcZWHDYkSllBwE85+oY7lDwap4
 GxLrJMFieeUNS2hHMXAE8Uwvc1RIdbUGNfMy7Y9TIrkt40Tr6R8AC/fP22usllq6pQxe
 AVjLRqDYj/NKoyweoYZU5O/0RoCA0cHIq1IKpwWffgy2MW2jFH7n8mlmNx3y3skD0KlR
 kg6Q==
X-Gm-Message-State: APjAAAWZiLHMhxpSKFpqJbSwORVVOKv7tF1kWJZCJ6RY51f51mNWK870
 SX6z4qmJyddZwCHfQX9qoQLZWbn2
X-Received: by 2002:adf:a285:: with SMTP id s5mr6467894wra.118.1581181029389; 
 Sat, 08 Feb 2020 08:57:09 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id a5sm7872763wmb.37.2020.02.08.08.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2020 08:57:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/13] hw/arm/raspi: Extract the processor type from the
 board revision
Date: Sat,  8 Feb 2020 17:56:37 +0100
Message-Id: <20200208165645.15657-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200208165645.15657-1-f4bug@amsat.org>
References: <20200208165645.15657-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
 Joaquin de Andres <me@xcancerberox.com.ar>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jLhBKAXv8NQc

The board revision encode the processor type. Add a helper
to extract the type, and use it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index dcd8d2d6d3..7a2ca97347 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -67,6 +67,21 @@ static int board_version(uint32_t board_rev)
     return board_processor_id(board_rev) + 1;
 }
 
+static const char *board_soc_type(uint32_t board_rev)
+{
+    static const char *soc_types[] = {
+        NULL, TYPE_BCM2836, TYPE_BCM2837,
+    };
+    int proc_id = board_processor_id(board_rev);
+
+    if (proc_id >= ARRAY_SIZE(soc_types) || !soc_types[proc_id]) {
+        error_report("Unsupported processor id '%d' (board revision: 0x%x)",
+                     proc_id, board_rev);
+        exit(1);
+    }
+    return soc_types[proc_id];
+}
+
 static void write_smpboot(ARMCPU *cpu, const struct arm_boot_info *info)
 {
     static const uint32_t smpboot[] = {
@@ -213,8 +228,7 @@ static void raspi_init(MachineState *machine, uint32_t board_rev)
     }
 
     object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
-                            version == 3 ? TYPE_BCM2837 : TYPE_BCM2836,
-                            &error_abort, NULL);
+                            board_soc_type(board_rev), &error_abort, NULL);
 
     /* Allocate and map RAM */
     memory_region_allocate_system_memory(&s->ram, OBJECT(machine), "ram",
-- 
2.21.1

