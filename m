Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp881423wro;
        Fri, 26 Oct 2018 08:32:22 -0700 (PDT)
X-Google-Smtp-Source: AJdET5flpTATLR2shIgt2oQ1MvGvO4IUxylD9bN2bIEra549ZaSEnKo5zE/ndIF34D5iXQlMFTTN
X-Received: by 2002:adf:eb48:: with SMTP id u8-v6mr5674322wrn.22.1540567942340;
        Fri, 26 Oct 2018 08:32:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540567942; cv=none;
        d=google.com; s=arc-20160816;
        b=Zm9x3D2/gpgBCqaJYiqFzSek7ZapwrOQZ0C2Sp91IJQi9cfPfIH6xUP+nZeNK2HSmT
         yOUm271UwBN5fts40uMu5oLvuqydmNGhUcLg2zaOlaDv1cKAWTH7EK3hdW7rJ9KXmH1D
         Uwgosgeb1n1vTQMSWNHQH7AesUAW6RQy7xYriirDfoaRkEcLOpf2CW7uXJrWl+WPNexI
         5vBFYGkIXEuY5p6HP5cQKZqeVkQTR+bZfu+dPbkwyJT44APP8KDUbH1amhrzJuLOAC5o
         weyO6PrT/G5du7IZiXX1WwOugyMExpScoZY43GKnlKW0Na5ScIMU92DsU1UcoBJFfiSB
         6TGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=AajCLcaVT0d/AebLZ5R4ZcbJsB4p2btqHuY6dlENIbM=;
        b=jB4P3y8DbRcnyEi/ghsZ1w1GVJNV5AP97aw+9MwoRKBRuUSOzRmFTxLlOaJHYQIKiL
         wUA7Ng5rHK/GgMqJrGH3kgbWA3omO/ER1gcSuXfKq+UVxM7HtGI6/DlxfiHLd4CS2BEs
         g7kMiQg4+ctaeMGTBmwpzxNngVwJ+fPgylQIfjomf6/bjmMZf2ypj78Qpo8tntmPIPtI
         f586AqXLTL7gdyukmk7g49BQJ4GFYUhYOxsVJ+ylI8jGCPJz/mXQ3BXVPB5h3aakAiJ2
         VmHHJfXT/JLAe7tuVcCaydPEHxAdygKZsf6Bpek6mlKnhYBzihqnaXiX28fHGukPtVeQ
         FJPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.133 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.133])
        by mx.google.com with ESMTPS id i5si3627464wrx.100.2018.10.26.08.32.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 08:32:22 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.133 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.133;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.133 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N62mG-1fW2030jY8-016T6J; Fri, 26 Oct 2018 17:32:19 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N62mG-1fW2030jY8-016T6J; Fri, 26 Oct 2018 17:32:19 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>,
	Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org,
	Michael Walle <michael@walle.cc>,
	Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	xen-devel@lists.xenproject.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Markus Armbruster <armbru@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Kevin Wolf <kwolf@redhat.com>,
	qemu-block@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PULL 19/20] milkymist-minimac2: Use qemu_log_mask(GUEST_ERROR) instead of error_report
Date: Fri, 26 Oct 2018 17:31:24 +0200
Message-Id: <20181026153125.24738-20-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:peG9vs6GsMt7FvJ9IOcJtpr6YQ/f1NgGwuxCXLS10Tzwh7VvfDj
 bumB+gWdPNWZw6tKFratVmDSwhx5bzldZ0O4v00tNLyAm8FG+3+ljvGTfditOJ2aGYQXi78
 xo9z6fuF8lhjoTnQ/BEZx0tGvwNDs/NqAMEfI/RdnZUzbAAT/Nm79xVwnJ/7sSDYSPJGHb9
 LOIUKPcwnf0R6LBzrrJww==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:Wmacvs2eZ1k=:3W4TmCzU9ZcT1LHL9taMaS
 AMPowxQE21LLEE0iygB5vtvM+3A8KTVZkIXddciNyIC5AGDSuKT3D99st/Z0ALRGkuTHSTdiY
 1gIpMQbcmuKCPcm38Hbph+QG+miYgVBbYezydmHajI+vSMW00D+t4v+FJ0ZIbkG8lV7hixG5V
 dWtboDiLCgRT9tw8NH9oQVOqOuw3cOPmxG1XK7etdJ1/oOaCeGrayEMIkzkii6zuFxEpChQK9
 lQhcllu29uiOER8BnjLxRGM/wwfqA7VVk+n4TEntn+KzAA2ZaqZAtonUwusfw7PfsfjVawNMJ
 npC6rYxYSZPL8PyAxXlolSC1uKW345ma6WhoWTaPqPBbUAG+oW95l/5tKpWSwBHHVGfS4EHlw
 dbYNr7zsv0iGiV+CICcE47Yebc/UjUNpcCkTFCKQPC/l/OJr58NdQs0kbX5gQsk/Pr7hyKRkD
 896fLW/uApf7+6YL+wz/nt28ZHKEj0w6u00Zgy1dZ0cgFeL+sv0shGL6+JXJzg4MESR1zAodL
 +1gqMXBGelfL/T4FYpypaMa6bhOQfu0V2WfR5oyJV1BYhr4s5tCO8HdkwZRDuzS0B9dnMYiU8
 zOOB1he6vkqTXeHJGMx/XT1aVOHqTRRHpYSzam+kqGdDV6wfCUwC8xtIefiH4hmzVwtPrrR6o
 X+D0sH95Ge56tgvFjKJwhr40j79u7gRsyxaUjL+1Y1DgRQdtiSOw+thGiOELiRdRHM7YC+jkc
 n4IZuoP+NmpIK5b8
X-TUID: 8q3S6168DOCK

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

qemu_log_mask(GUEST_ERROR) is more appropriate:

  $ qemu -d help
  Log items (comma separated):
  guest_errors    log when the guest OS does something invalid (eg accessing a non-existent register)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Michael Walle <michael@walle.cc>
Message-Id: <20180702014022.12395-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/net/milkymist-minimac2.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/net/milkymist-minimac2.c b/hw/net/milkymist-minimac2.c
index 3eaa19dfde..322fb77e46 100644
--- a/hw/net/milkymist-minimac2.c
+++ b/hw/net/milkymist-minimac2.c
@@ -30,6 +30,7 @@
 #include "hw/sysbus.h"
 #include "trace.h"
 #include "net/net.h"
+#include "qemu/log.h"
 #include "qemu/error-report.h"
 
 #include <zlib.h>
@@ -214,7 +215,8 @@ static size_t assemble_frame(uint8_t *buf, size_t size,
     uint32_t crc;
 
     if (size < payload_size + 12) {
-        error_report("milkymist_minimac2: received too big ethernet frame");
+        qemu_log_mask(LOG_GUEST_ERROR, "milkymist_minimac2: frame too big "
+                      "(%zd bytes)\n", payload_size);
         return 0;
     }
 
@@ -347,8 +349,9 @@ minimac2_read(void *opaque, hwaddr addr, unsigned size)
         break;
 
     default:
-        error_report("milkymist_minimac2: read access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "milkymist_minimac2_rd%d: 0x%" HWADDR_PRIx "\n",
+                      size, addr << 2);
         break;
     }
 
@@ -413,8 +416,9 @@ minimac2_write(void *opaque, hwaddr addr, uint64_t value,
         break;
 
     default:
-        error_report("milkymist_minimac2: write access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "milkymist_minimac2_wr%d: 0x%" HWADDR_PRIx " = 0x%lx\n",
+                      size, addr << 2, value);
         break;
     }
 }
-- 
2.17.2
