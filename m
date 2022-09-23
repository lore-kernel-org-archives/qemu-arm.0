Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp180295ejy;
        Fri, 23 Sep 2022 01:48:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4mvIzhHaCuQ1mcScpFsG0gp0LDxi0+hp2Y2I81nfGY7w7V3sVzWyKuJLKim3uZL5Sb8gLH
X-Received: by 2002:a05:6a00:1892:b0:540:acee:29e8 with SMTP id x18-20020a056a00189200b00540acee29e8mr8024460pfh.1.1663922902878;
        Fri, 23 Sep 2022 01:48:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663922902; cv=none;
        d=google.com; s=arc-20160816;
        b=mAzUXEI8PLZETDRBVORQJ4Kn/ZELLNRn7v8rvrAM1VIqA1gu3ARCbnkcRblRiUNTsg
         u5xcFAFP2ieNwz5yvHlYR6KQlkaUB0JwzAABue5PzTIMdSYXW4swoX9r4NfPyuUh1/2I
         sctgNwMHbNGbwpdegQLJ7b0BXRapHDU7LsOMtJKGgF+4vzs1HHgkiAZfAz/QC0xtpMCw
         T3+mwY3UIM2/quwFphS9U2v2t3UOlveQJa3VRcBDxJZfXFh8ZCgbAD8SImW48mPVZWFt
         DK9Nwk4LxqdDW25VLJSkn9sZpCNmwcxZ7hfZMIdeTQi0AkCUPZVPI3RKOZPaPbIRj/jB
         aqmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=r5tNkPu//c2nqMt3oS3wMQk+F0hTNh/wM2KTW+bR4FM=;
        b=nLlQnSUSaTtFZz06jeTU78YsGJvOLaMMDkZO7eH7/P0v20po5UokMvtbI72V6D95VD
         xEzizV/DHoQeFJPzG+jsdJ6PLATXL3NPxBuVKqlmv7YQkeivfLTBtfv9IsemrQxnslZV
         PqFj2qopIkKfzJY8oEmUU+n+TUBS6QlJqpoxGuhOexo4Txl0Qu6B5mg666UBfRLL3aiS
         MZTz6Drc2R0LXVKBHLmUZ7TpL12wn6vDAR6MWa33KwfXPh64bP11X1+NPknkuQ5L3M97
         /jzmlnZOdoZoA7gYIrFtI01diO+naVQhTEy3VCjmiiE8Gyewo+OzhphA/poDi4C+zmQW
         YPQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=gbdq=z2=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org. [150.107.74.76])
        by mx.google.com with ESMTPS id m6-20020a632606000000b00438b7cb3311si9101054pgm.501.2022.09.23.01.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 01:48:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of srs0=gbdq=z2=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) client-ip=150.107.74.76;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=gbdq=z2=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4MYm5J6vpRz4xGR;
	Fri, 23 Sep 2022 18:48:20 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MYm5G344Dz4x3w;
	Fri, 23 Sep 2022 18:48:18 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 3/6] hw/core/cpu-sysemu: used cached class in cpu_asidx_from_attrs
Date: Fri, 23 Sep 2022 10:48:00 +0200
Message-Id: <20220923084803.498337-4-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923084803.498337-1-clg@kaod.org>
References: <20220923084803.498337-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pBSY55Fh/jAI

From: Alex Bennée <alex.bennee@linaro.org>

This is a heavily used function so lets avoid the cost of
CPU_GET_CLASS. On the romulus-bmc run it has a modest effect:

  Before: 36.812 s ±  0.506 s
  After:  35.912 s ±  0.168 s

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220811151413.3350684-4-alex.bennee@linaro.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/core/cpu-sysemu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index 00253f89293a..5eaf2e79e66c 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -69,11 +69,10 @@ hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
 
 int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
     int ret = 0;
 
-    if (cc->sysemu_ops->asidx_from_attrs) {
-        ret = cc->sysemu_ops->asidx_from_attrs(cpu, attrs);
+    if (cpu->cc->sysemu_ops->asidx_from_attrs) {
+        ret = cpu->cc->sysemu_ops->asidx_from_attrs(cpu, attrs);
         assert(ret < cpu->num_ases && ret >= 0);
     }
     return ret;
-- 
2.37.3
