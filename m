Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3379102ejx;
        Mon, 5 Dec 2022 01:56:02 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6vObo2wfj5y/FfeCTo/RfgegUyfX/QncJWa7YS6UtLKLSOTxTkvNxI08H/+KI0xEo43lX4
X-Received: by 2002:a05:622a:4890:b0:3a5:84b9:3292 with SMTP id fc16-20020a05622a489000b003a584b93292mr74235263qtb.119.1670234162704;
        Mon, 05 Dec 2022 01:56:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234162; cv=none;
        d=google.com; s=arc-20160816;
        b=jXbAQAoC3wyPly5llq3sBLYGtgn2cL3e6DRB3CIMCzmYqqebXeiu4cI7Pz81vgA1Rs
         sRhfcJ/vHs8j9pTMYAJo95wzxDVQpua5BZUwPEH4eIl4Qi8sqdJnwPX0QBGY105JznnL
         xh0cgxBz6lX6+OgOBGorPOQuVzDJL1qfKHRG7LSl1B8e/gX1j1YgSizMpI6spa/QZUAk
         SFgUN9bTr7+sr4zBSs0ws2Ke+RoFrndVtcA62FhsKouZBMkB3Gv8HspDf+kM5sQVoLs9
         tYnzaQH4jHKkptsOfzXpOWonvtUMFH1VVd+ExDsRmRhcpgYhwxJlWsBq0+mq1s7/Na+j
         /SgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9oxN9dTnRZHuYgKUJ7HxItN5TO/8EAdFWU0o+By2T4Y=;
        b=FO8wFpWgspPHy7u8jsjc5ofY65joCdDvu4gQWmD6KitI30qtL9eM56UDp0gAVmunjb
         rd2BNHcLTg++KyGz9RjWS1AZG3rXqcixgSndhbAAFldqii5vEY8e5pTFNYXrABueoXwf
         BkS2rG6o438TPLaN5eyqbgt5RPzP7S3E7ZobZ7pEiAQS8mzqLdVWTz04EqUrG/0BsHyz
         2Sw8wr4VDMHVvCBqv0O0KRFKRGEXkV8wY5aT/naVyMC1fbZW+tVv/ryRoo0IO7i1VpsT
         nAugwp/oBhmiZoLKN9J1r5CyMBjTXEIwszY5KPYrFzdYHearWu9GsR3Hc3ZzR6nLnIX+
         z0Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PIdQck6w;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id gf8-20020a056214250800b004c76586484asi1561187qvb.332.2022.12.05.01.56.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:56:02 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PIdQck6w;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9oxN9dTnRZHuYgKUJ7HxItN5TO/8EAdFWU0o+By2T4Y=;
	b=PIdQck6w+HMm0k7+VjELh+Qr4GsyYCRyCeYO0rw2cIDHkKhHaAXPTkZ3LSZuaLgMVpd0xj
	LVdXw77NZ6OVutjjtmHFxq/KbV61JvosCEopzY4famyJ+kRfQl8QwJ/j7j/hyAezOSbHu0
	J2YgNojKF+2uNp/MlVlKrf4qajSO5gE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-lXKRaxyeNXqve1TTpz4ZMw-1; Mon, 05 Dec 2022 04:55:57 -0500
X-MC-Unique: lXKRaxyeNXqve1TTpz4ZMw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D9D8185A7A9;
	Mon,  5 Dec 2022 09:55:55 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A0C2B2166B2A;
	Mon,  5 Dec 2022 09:55:47 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>,
	Thomas Huth <huth@tuxfamily.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Eric Blake <eblake@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Raphael Norwitz <raphael.norwitz@nutanix.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	virtio-fs@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	qemu-block@nongnu.org,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Thomas Huth <thuth@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Jason Wang <jasowang@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	qemu-s390x@nongnu.org,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Klaus Jensen <its@irrelevant.dk>,
	John Snow <jsnow@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Keith Busch <kbusch@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	qemu-trivial@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>,
	Bin Meng <bmeng@tinylab.org>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 25/51] tests/qtest/migration-test: Fix unlink error and memory leaks
Date: Mon,  5 Dec 2022 10:52:02 +0100
Message-Id: <20221205095228.1314-26-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: uxpi4PfDEZLC

From: Thomas Huth <thuth@redhat.com>

When running the migration test compiled with Clang from Fedora 37
and sanitizers enabled, there is an error complaining about unlink():

 ../tests/qtest/migration-test.c:1072:12: runtime error: null pointer
  passed as argument 1, which is declared to never be null
 /usr/include/unistd.h:858:48: note: nonnull attribute specified here
 SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior
  ../tests/qtest/migration-test.c:1072:12 in
 (test program exited with status code 1)
 TAP parsing error: Too few tests run (expected 33, got 20)

The data->clientcert and data->clientkey pointers can indeed be unset
in some tests, so we have to check them before calling unlink() with
those.

While we're at it, I also noticed that the code is only freeing
some but not all of the allocated strings in this function, and
indeed, valgrind is also complaining about memory leaks here.
So let's call g_free() on all allocated strings to avoid leaking
memory here.

Message-Id: <20221125083054.117504-1-thuth@redhat.com>
Tested-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/migration-test.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 442998d9eb..dbde726adf 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1066,15 +1066,27 @@ test_migrate_tls_x509_finish(QTestState *from,
     TestMigrateTLSX509Data *data = opaque;
 
     test_tls_cleanup(data->keyfile);
+    g_free(data->keyfile);
+
     unlink(data->cacert);
+    g_free(data->cacert);
     unlink(data->servercert);
+    g_free(data->servercert);
     unlink(data->serverkey);
-    unlink(data->clientcert);
-    unlink(data->clientkey);
+    g_free(data->serverkey);
+
+    if (data->clientcert) {
+        unlink(data->clientcert);
+        g_free(data->clientcert);
+    }
+    if (data->clientkey) {
+        unlink(data->clientkey);
+        g_free(data->clientkey);
+    }
+
     rmdir(data->workdir);
-
     g_free(data->workdir);
-    g_free(data->keyfile);
+
     g_free(data);
 }
 #endif /* CONFIG_TASN1 */
-- 
2.38.1
