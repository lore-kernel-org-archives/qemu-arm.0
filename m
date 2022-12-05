Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3379490ejx;
        Mon, 5 Dec 2022 01:56:57 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4zbOYDQ7XLkSk0wdN6hkU9x0AxYIsH05gcUi1+SH5J5l2zH+QGQ0vke8Yej2UdzH4AAx9a
X-Received: by 2002:ac8:5481:0:b0:3a6:6cd0:5c5c with SMTP id h1-20020ac85481000000b003a66cd05c5cmr42175684qtq.309.1670234217185;
        Mon, 05 Dec 2022 01:56:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234217; cv=none;
        d=google.com; s=arc-20160816;
        b=H0OY5u0MilIyXYO8eVk2TpVcYwXj4kb4SBa/wyCvmFTiJY2qB3F82F2F8n+ECQ4dIR
         lhmXOVAYLT0yA30pT3/5GlQjbLf/DoRRXD0P1r/orVfrYqlR/Fdzqklfcsmn9qrachl8
         RzuEo1myplphTMg8JePw7rTLywFy4/hNJoGhJX83bVlUYAVm5E3cJGEnP3Ty5ME7AaMo
         w75bOz/LSJFq8O6MHQpm9A5q1QeaAWOInJTyGn+o9j/dAb75mpM+kLQruisAph5HN3ht
         029OyZ/Yc0Q+jKZP6ks3nLZX+xDVGwqJJ0smhgKqZKIA3wU9t/fJRuClN7zLx54iSzvl
         pbUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mwG7VmeQ4OSrYdmnU8HIXq4U+zlJC1ZXAM3D1p/Nf8Q=;
        b=UfEtuwixXpBC9YxqMRTELtZGhHqt3F6BLloB1lrAbrQn3U9jFznQcV0PA222UrFThL
         v6oIsFSoxV/+RQvg9Qq8CWjtU9U2HPnENMMhZBYK8UZtkLfvfBsbNoojNkQBO84O9WJh
         p+G6iKRYT20iAKXRqpLU21j2ZpIi86jjWcV9DrAMfCvNVpDOGATzFi3tkiPAH3gygskR
         s5MC8fcFfFnWjTIX2or/gZJ6URw0asDSfswfzR6lys61vYL4g6A4DWzzwDwRB89Kzo2C
         R3RgHDco6cbEkg6E6gX5Si18e9dgedoAYud9Fz56BIKxswOZu909Tcqne2aJSQtTUJm9
         ajzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LatrZop9;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id i23-20020ac860d7000000b003a50e651416si7415126qtm.365.2022.12.05.01.56.56
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:56:57 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LatrZop9;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mwG7VmeQ4OSrYdmnU8HIXq4U+zlJC1ZXAM3D1p/Nf8Q=;
	b=LatrZop9rsj55+b4CwiWOZ/2F2Mfahxwg0z3NmSpMXLsWv9i7mrz2cjS/qGnWqOx93VuN7
	G87A0uGyYIwm8G2JGI+2oPJm1V0IUv8dXKcXvkVqPH05ZcLG//ZqxfxjpZVh74hsJR9Snp
	DpzpIyU3i1Yw1NJyetpp42cW3Xqxo9w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-tzRvit9cMNGxqrix2mSlvA-1; Mon, 05 Dec 2022 04:56:52 -0500
X-MC-Unique: tzRvit9cMNGxqrix2mSlvA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD6F485A588;
	Mon,  5 Dec 2022 09:56:50 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5BDAF2166B2E;
	Mon,  5 Dec 2022 09:56:43 +0000 (UTC)
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
	Peter Xu <peterx@redhat.com>
Subject: [PATCH v2 32/51] migration: Take bitmap mutex when completing ram migration
Date: Mon,  5 Dec 2022 10:52:09 +0100
Message-Id: <20221205095228.1314-33-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: uGPsNjEirpHs

From: Peter Xu <peterx@redhat.com>

Any call to ram_find_and_save_block() needs to take the bitmap mutex.  We
used to not take it for most of ram_save_complete() because we thought
we're the only one left using the bitmap, but it's not true after the
preempt full patchset applied, since the return path can be taking it too.

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index 8aad17c429..cc72c24c18 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3406,6 +3406,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
         /* try transferring iterative blocks of memory */
 
         /* flush all remaining blocks regardless of rate limiting */
+        qemu_mutex_lock(&rs->bitmap_mutex);
         while (true) {
             int pages;
 
@@ -3419,6 +3420,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
                 break;
             }
         }
+        qemu_mutex_unlock(&rs->bitmap_mutex);
 
         flush_compressed_data(rs);
         ram_control_after_iterate(f, RAM_CONTROL_FINISH);
-- 
2.38.1
