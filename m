Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3379600ejx;
        Mon, 5 Dec 2022 01:57:13 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7qPwlCTkvosiTjYwgMw+rKy/CHNBT2yloH7Ng4REXFnkvoUy56r3P2Stc9mA5A0Ka/7TyS
X-Received: by 2002:a05:622a:488f:b0:3a6:328e:e7d1 with SMTP id fc15-20020a05622a488f00b003a6328ee7d1mr39964228qtb.272.1670234233063;
        Mon, 05 Dec 2022 01:57:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234233; cv=none;
        d=google.com; s=arc-20160816;
        b=h16FpS5o+RUgTi3T6sfO4IixDFOsCfm/STEcHzDiMcghyaYPFSvMAjrkYPU/uwSU7m
         P50CYQUPFekXY6YuX5foOKC3+92+/OiKwCP9FPL+qjsHhJieVKeHtm4XZA/aP/o9vzoa
         L02jqNMxP8MECRUyw03ei59AF0tvhhHqmJPqDoUGH52O/5trt5fIMDay/USwwNfxqElo
         K1x+haQQb/jWY4N0O2Xj8U7+m8Csit/GBs8C/TGeF5uWEHsbuamRmYLLeksYGs3JkQr0
         uRvU75l0klG+2ar5+61sptt8NM9Webct6JJ8ra9NJ8u3miRdaF4U2YnuHTh5g2PiltXP
         TlJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8T5xObxYus8mUaDCig1/nmq01TyjcG4leYqxs3OOcvM=;
        b=iI7oaAIVktn8VIn0uQCcpq3actZNPY4iviyGTJud88oNgnXJykm7lPm/uSGB37cR8P
         5dWq7NgCn+Fux0DLSRddFPuNwoUdfT3ZTx1ivmmIr5gF/mIAATp529jG3txtvrtEfCH8
         cBfgrXAvOpvNr96JXOCmM71cudz+CWk1fLo7v0qvUiwre7oCGheQcWgyMIByrCkJwrS8
         otdl4brJ5QVHU4wcW9zC2EbvO5MaV1bmGHZmuMLFITlCrinW1Yu9mKhlflyVZ1AVVIUs
         YU6Ssc09hcmWszv2Z9ggh5KgIW+Oq0QBNpYLrDHZeBctWdcpEXgf8/585r9jWZJlPKRH
         /RCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QvO+cxUd;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id c18-20020ac81112000000b003a6881f5221si7167313qtj.379.2022.12.05.01.57.12
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:57:13 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QvO+cxUd;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8T5xObxYus8mUaDCig1/nmq01TyjcG4leYqxs3OOcvM=;
	b=QvO+cxUdfUfmLst5TxTEOaq252d6kZH+9vwSPMXFJ4MqrK+l4GRf/+/fZDnqkQmKOTPwNp
	hzc9UzqN6ptqkCo7whkmDhgZx0UTxAc1WqUAEmut6kYVZgNYvg2pRCy2z1kTeR51KNYM/c
	r08SqQXd8hzZaPe7mgyGurfLbAoxgxU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-6RQIp25AOr-MD9trX-mdGQ-1; Mon, 05 Dec 2022 04:57:07 -0500
X-MC-Unique: 6RQIp25AOr-MD9trX-mdGQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71DE43814946;
	Mon,  5 Dec 2022 09:57:06 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E28662166B29;
	Mon,  5 Dec 2022 09:56:58 +0000 (UTC)
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
Subject: [PATCH v2 34/51] migration: Cleanup xbzrle zero page cache update logic
Date: Mon,  5 Dec 2022 10:52:11 +0100
Message-Id: <20221205095228.1314-35-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: ZnV7fy1rMduf

From: Peter Xu <peterx@redhat.com>

The major change is to replace "!save_page_use_compression()" with
"xbzrle_enabled" to make it clear.

Reasonings:

(1) When compression enabled, "!save_page_use_compression()" is exactly the
    same as checking "xbzrle_enabled".

(2) When compression disabled, "!save_page_use_compression()" always return
    true.  We used to try calling the xbzrle code, but after this change we
    won't, and we shouldn't need to.

Since at it, drop the xbzrle_enabled check in xbzrle_cache_zero_page()
because with this change it's not needed anymore.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 00a2e30322..7124ff531c 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -741,10 +741,6 @@ void mig_throttle_counter_reset(void)
  */
 static void xbzrle_cache_zero_page(RAMState *rs, ram_addr_t current_addr)
 {
-    if (!rs->xbzrle_enabled) {
-        return;
-    }
-
     /* We don't care if this fails to allocate a new cache page
      * as long as it updated an old one */
     cache_insert(XBZRLE.cache, current_addr, XBZRLE.zero_target_page,
@@ -2301,7 +2297,7 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
         /* Must let xbzrle know, otherwise a previous (now 0'd) cached
          * page would be stale
          */
-        if (!save_page_use_compression(rs)) {
+        if (rs->xbzrle_enabled) {
             XBZRLE_cache_lock();
             xbzrle_cache_zero_page(rs, block->offset + offset);
             XBZRLE_cache_unlock();
-- 
2.38.1
