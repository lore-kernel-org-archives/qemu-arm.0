Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2245061ejx;
        Tue, 12 Sep 2023 11:41:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+ZWRuZNDQ9eYUtC/lRU4toKak6GOcN6S7wDHLIsqaQZxmrzgHn1eFbikmVKxb8q4HEXC/
X-Received: by 2002:a05:6214:4a90:b0:64f:92dc:3de2 with SMTP id pi16-20020a0562144a9000b0064f92dc3de2mr260228qvb.53.1694544099609;
        Tue, 12 Sep 2023 11:41:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694544099; cv=none;
        d=google.com; s=arc-20160816;
        b=Ub8LM18nEkUOTJ5epdN82xb9USzU+bZb4W4c7sESOiOQPOHDkRgFD/HvDZC87hQe4c
         mxQuJOnWIdRt/oNnlvlJDqEP9/Xz258fuVVfRIGGFwyU/Sue4/EjHEWXEgwsZ7ItB001
         Jdc4y3WjZUwRVSi0pOAnqKRqxDUfvt1oP18ijtmhUMXipZ5JYd6taZL7KJGcsqLDkQko
         7epju+/k5y8OrAoPdBk8m5mz76AmdYfzTFnQ9aNnPXu0Mcaw5zyqqlr7u9VqLsk05f1E
         X12guKPWMWtEdcahUpO6uLYoJwMl78WoRw1j9Xkslwd3r2k+TA+/74WgtKME2tz7nxKV
         1Nmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jmz3fnUyyNHeeq0yChyHiqQDJDibl5/ScPj+H4Udnqs=;
        fh=7i2B42VHusWKsnJOPWSYnjvVgBurff/6q9zEPTejEek=;
        b=amdVbHYbxqf0I41nsy5lx0+xSmcJuuLOj4fM8HtKLa/hrf1my9jYBIhwkgRWBwcCSM
         PsUpgTycSQXjwqEgZvl3zUv4tC5yqlmkuKFfdBQkc/u9+ZSBX2Rjo1Z1vaUOwVGfTHl7
         QH1yWCOxOj16b+mKuudh8cLq7z98nuJWohcTEC5zsLRcYiqgM0+ON6YlAzL4V3lWRXgB
         aT+lAYxVvEZMxrZnMe0EchK/UOKHim9GAwYqFi0STKJAnAUgWUvvcy6eaiCfSkZaKWQ7
         QjhcrW8bw3+LBXaNefpu/+Ivi7l+a9Um8uj8dm0tDCZWZ2d2G5qHauChKr52bUeXl6mC
         5S4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DsbB8CFp;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id e20-20020a0caa54000000b00626102d23d4si6663806qvb.565.2023.09.12.11.41.39
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 11:41:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DsbB8CFp;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694544099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jmz3fnUyyNHeeq0yChyHiqQDJDibl5/ScPj+H4Udnqs=;
	b=DsbB8CFpDKT5QKfvDCl6lxn6+5qX3vTm+9amG8zoK8wcVOl3ocLhSoePZTqIY9vd58f56l
	Gazp1YOnrpiWW+DoTYuIkGEH10rT9ogOmlOBYU+CPTvisyTSGdcFI87E0t6QteDAXwauYj
	wru3OYj5Q/iFLniuD7YyFsdmHH62+Vs=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-681-yQX6Wp6JMdGc5unjBWGJDA-1; Tue, 12 Sep 2023 14:41:37 -0400
X-MC-Unique: yQX6Wp6JMdGc5unjBWGJDA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 297003C0EAA0;
	Tue, 12 Sep 2023 18:41:37 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.42.28.38])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9823B7B62;
	Tue, 12 Sep 2023 18:41:35 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Stefan Hajnoczi <stefanha@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 2/4] qtest: kill orphaned qtest QEMU processes on FreeBSD
Date: Tue, 12 Sep 2023 19:41:28 +0100
Message-ID: <20230912184130.3056054-3-berrange@redhat.com>
In-Reply-To: <20230912184130.3056054-1-berrange@redhat.com>
References: <20230912184130.3056054-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-TUID: kAbAFuWxB3ql

On Linux we use PR_SET_PDEATHSIG to kill orphaned QEMU processes
if we fail to call qtest_quit(), or the test program aborts/segvs.
This prevents meson from hanging forever due to the orphaned
process keeping stdout open.

On FreeBSD we can achieve the same using PROC_PDEATHSIG_CTL, which
gives us the equivalent protection against hangs.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/libqtest.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 34b9c14b75..b1eba71ffe 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -24,6 +24,9 @@
 #ifdef __linux__
 #include <sys/prctl.h>
 #endif /* __linux__ */
+#ifdef __FreeBSD__
+#include <sys/procctl.h>
+#endif /* __FreeBSD__ */
 
 #include "libqtest.h"
 #include "libqmp.h"
@@ -414,6 +417,10 @@ static QTestState *G_GNUC_PRINTF(1, 2) qtest_spawn_qemu(const char *fmt, ...)
          */
         prctl(PR_SET_PDEATHSIG, SIGKILL, 0, 0, 0);
 #endif /* __linux__ */
+#ifdef __FreeBSD__
+        int sig = SIGKILL;
+        procctl(P_PID, getpid(), PROC_PDEATHSIG_CTL, &sig);
+#endif /* __FreeBSD__ */
         if (!g_setenv("QEMU_AUDIO_DRV", "none", true)) {
             exit(1);
         }
-- 
2.41.0
