Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3379693ejx;
        Mon, 5 Dec 2022 01:57:26 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5lyeKQr6E2BFLhFUw1awyyP3Rih8FSJfgvnenk5Ph9TKzulk/JtHnG87IQBNVUPfdVibqL
X-Received: by 2002:ad4:4108:0:b0:4c7:15ef:6616 with SMTP id i8-20020ad44108000000b004c715ef6616mr23257520qvp.89.1670234246340;
        Mon, 05 Dec 2022 01:57:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234246; cv=none;
        d=google.com; s=arc-20160816;
        b=e9o6mXpR3asShDawfYbHkwUm+EGVHzE7N/sFP+EWQ8sj4z2C6shWK7ZFRncPRczH9J
         BGbrjjHdfTTW0pXGk8RF4lUyZc+UjL5UyaklbKWLTKyLYCYHkFkchl7ArBN1GVV8V88u
         b+mqsPDDVVxCh3RldhT25oshXwHnpYwo/Zy1xkAr6N3hDLfPKLrDNg3zxFug/3q0rg6A
         9f+lkQWM53J16SBigsqBRl1eDOF/cg36qaVvp8/UBlzEat3kVdGtjQDhvzuVyr18ZWNv
         Uh2eN1XtO/SRc5uKV/ITg0YK1Wg3dKkj8kYW4RN/HnyPs6qkC+223SJrnFgUfFtgWzrG
         2oKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=H71cToLy64HTbBPdrL5diYAVzVjBcZDaRr6Ge6ZYDPU=;
        b=xkIOfexz9noQn7pmjg1Mr0yAKZOD/qdF+FFw0oWbB/TbQSL6hqThnYydnLPadq0Hzv
         jr29vVoK4EV8jeMWHUts4auMDcTTza5cX5saWgDfDqIotKPC6VlTHHdLNOKo9C1L73yR
         DkazMUnzUoyQc5Ug0o4hyyaKF9dscHIzvdJPTKebrz+oJxp1zuaUcGf7nT0gTSMmFKm9
         NqL8XbQRwZJG322ig/fEKGGDcqPJGeOuhpaanJRJL0UsjTZmz88eM7K/Te4P81CIj6+s
         TS0GTWj/jFZKa4ClFK54GYelofDSDD8SdG9b8jM4ubcukzuGGt0gUzatHEI6IwgIqrqI
         ytjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gdX+hUgl;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id t6-20020a05622a180600b0039dd5cc5fe3si2085619qtc.571.2022.12.05.01.57.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:57:26 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gdX+hUgl;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H71cToLy64HTbBPdrL5diYAVzVjBcZDaRr6Ge6ZYDPU=;
	b=gdX+hUglomZDGUXjftWVPon70AN/rPmlQihzoJHf7jKAk+7jVAlbAhArRGIRlwgf2BtBBX
	XPx7Ojt7+vQVD48JlWpUPBuGd6KAcn5EIAAlucywwHt7+lfRw2zkv+pjRdkwYLldI2rwFf
	mWaq/0Pd5FP4A7ti2g2LElDNf/wDtIk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-d2NlJdFvOkaYSLTVrpInFQ-1; Mon, 05 Dec 2022 04:57:15 -0500
X-MC-Unique: d2NlJdFvOkaYSLTVrpInFQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4037587B2A7;
	Mon,  5 Dec 2022 09:57:14 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C7D6C2166B29;
	Mon,  5 Dec 2022 09:57:06 +0000 (UTC)
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
Subject: [PATCH v2 35/51] migration: Trivial cleanup save_page_header() on same block check
Date: Mon,  5 Dec 2022 10:52:12 +0100
Message-Id: <20221205095228.1314-36-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: eNbMTAhQmSMk

From: Peter Xu <peterx@redhat.com>

The 2nd check on RAM_SAVE_FLAG_CONTINUE is a bit redundant.  Use a boolean
to be clearer.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 7124ff531c..41475431fc 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -661,14 +661,15 @@ static size_t save_page_header(RAMState *rs, QEMUFile *f,  RAMBlock *block,
                                ram_addr_t offset)
 {
     size_t size, len;
+    bool same_block = (block == rs->last_sent_block);
 
-    if (block == rs->last_sent_block) {
+    if (same_block) {
         offset |= RAM_SAVE_FLAG_CONTINUE;
     }
     qemu_put_be64(f, offset);
     size = 8;
 
-    if (!(offset & RAM_SAVE_FLAG_CONTINUE)) {
+    if (!same_block) {
         len = strlen(block->idstr);
         qemu_put_byte(f, len);
         qemu_put_buffer(f, (uint8_t *)block->idstr, len);
-- 
2.38.1
