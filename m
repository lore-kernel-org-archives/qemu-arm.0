Received: by 10.28.71.27 with SMTP id u27csp3767055wma;
        Tue, 23 Jan 2018 00:11:00 -0800 (PST)
X-Google-Smtp-Source: AH8x226tI1RIpIN+n8JZvdzJwpxA8fFyrn5IzlhY/n6aCO4qObr+5SvzGyBORW12SjL5mPq17gJe
X-Received: by 10.157.52.144 with SMTP id g16mr6863352otc.294.1516695060438;
        Tue, 23 Jan 2018 00:11:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516695060; cv=none;
        d=google.com; s=arc-20160816;
        b=fYSOroV9VSGq/Y8Y/5sC8e+uZYb9fJaOAz+6WvZODsmaqvjqEUwDcFjJCCtedMX38O
         +v5rh6wgNvIeT0rkgVpPiB5GS08fZlDXv27P4Rd2O003stwBKBDToH5ZVa7G3NNJ3x91
         q3nJJFHGkniOWDGwPYr4Q8IwCwVOpODQ0dm75veCWIMjCgYvJLOgSopzhF0xIrTfPry8
         3Zoz+hJWGoJKUyiz4T2qeXwac0z9mTVDe0cvPrH792rBZPF9K+aS7McmzuHnOh3ix2Tv
         GBj/FIDGxU/If4W86ODHXuDxSK+Vxm/AqOzp7XjXCfe7mRpRC13uFnleGr7Y9tIt9MJT
         M0kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=uxH0QsR5pjne6nQFSzA0VefTovIDIN9R/5m2eBO/IwI=;
        b=Bx7JRp3YgJ8gk+Y3AeoeuO8uRiJO27sb1IsMcnJ2WLCrKg7XrZcnUvYL7rlREB4X/w
         MtMXign2xxdRpdi9ACGaqu8rAth29M9pYFLPCn3x8MMgVZ56Oam+6Qq/8PyNLYjv+XfI
         d+ztR2Gv5B2dwzbCHwxC9urTuc8X6eTMaZJ9ahimJKHVI+xSWgx8Umsqy9AFphOVKIzZ
         QmtyV8FPTo04EQb2S2N9ziTwvINvSEx5n4qP8rYQdJEPnhzp8F9XnUX7TJM5r9KssoAn
         TJIdNhva1Cikt0gkjEyWXGVvaiIqV+4RBCjsFlKgnWLzr5Io7TFc7vco2N9FWe8838QF
         3Mbw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of imammedo@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id r48si7157412otr.354.2018.01.23.00.10.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jan 2018 00:11:00 -0800 (PST)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of imammedo@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5D8FC13AAB;
	Tue, 23 Jan 2018 08:10:59 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E5FD5D1E7;
	Tue, 23 Jan 2018 08:10:56 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-s390x@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	"Emilio G. Cota" <cota@braap.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 25/25] cpu: get rid of cpu_generic_init()
Date: Tue, 23 Jan 2018 09:08:24 +0100
Message-Id: <1516694904-64879-26-git-send-email-imammedo@redhat.com>
In-Reply-To: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Tue, 23 Jan 2018 08:10:59 +0000 (UTC)
X-TUID: NHOs6HBiXzih

There aren't any users of the helper left, remove it.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: Richard Henderson <richard.henderson@linaro.org>
CC: "Emilio G. Cota" <cota@braap.org>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Eduardo Habkost <ehabkost@redhat.com>
CC: "Alex Bennée" <alex.bennee@linaro.org>
CC: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
---
 qom/cpu.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/qom/cpu.c b/qom/cpu.c
index aab8437..cf6880d 100644
--- a/qom/cpu.c
+++ b/qom/cpu.c
@@ -304,22 +304,9 @@ static ObjectClass *cpu_common_class_by_name(const char *cpu_model)
 static void cpu_common_parse_features(const char *typename, char *features,
                                       Error **errp)
 {
-    char *featurestr; /* Single "key=value" string being parsed */
     char *val;
-    static bool cpu_globals_initialized;
-
-    /* TODO: all callers of ->parse_features() need to be changed to
-     * call it only once, so we can remove this check (or change it
-     * to assert(!cpu_globals_initialized).
-     * Current callers of ->parse_features() are:
-     * - cpu_generic_init()
-     */
-    if (cpu_globals_initialized) {
-        return;
-    }
-    cpu_globals_initialized = true;
-
-    featurestr = features ? strtok(features, ",") : NULL;
+    /* Single "key=value" string being parsed */
+    char *featurestr = features ? strtok(features, ",") : NULL;
 
     while (featurestr) {
         val = strchr(featurestr, '=');
-- 
2.7.4
