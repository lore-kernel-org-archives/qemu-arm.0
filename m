Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3380249ejx;
        Mon, 5 Dec 2022 01:58:47 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5XnbWQoPBWatgjkjAYmXaTPov05Wzf0erE3v4qbRxoAjVA+kbWgpH38kW7ovMyhpJQd+vm
X-Received: by 2002:a05:6402:24a0:b0:458:ad54:20d5 with SMTP id q32-20020a05640224a000b00458ad5420d5mr71361777eda.86.1670234327806;
        Mon, 05 Dec 2022 01:58:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234327; cv=none;
        d=google.com; s=arc-20160816;
        b=y2xz3ZeAdnPb0oofzdAyWu35R3JYsQz/BOGgmfZPGMRkMlMtuxwf6Da1SZQIjy2i3s
         ysYjUuLguBme0q5ihqzzSZ/sZOoCHIxVLdc+VXCsU/URf0rpi0CTB/+ZMeNfjgU5AGdP
         zj3wf88JoriFq1p7+qiPGCO98p8PXXfwsgVUfTzRRGb4oDo42oUhCRuwr+WuhM8U8ocS
         E4HLiCE4TejsaScfyt50pO9keDJ0s5/NaOQLU++WFfSsjj6oXwrKTLhPDQpTRtkCd0or
         W+NP5FCEb/kVABcvrpOMB8iDfHDchgoIeZcfLXbqOziu1Q4UGWSiG1EuDquJvDFiunG9
         R2GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=W+GlhHy1Aw+J2S/PdKkSiWceIYryK6JZft0nwXoxTSo=;
        b=KQuWhQM0llgS1kCmyBnOr+epD53XXiF6oAr8HintCv2i+DFc7qYPj0yjMfXFRGe7tH
         ZkutyncoIbaRzSPT4yLMUxarstBfpnlz1fOdP8TdZ97n68oaHN3Ezn08tN4wcHdRxvbC
         33kh0CSIyMBMy9nsJnp8MY3j7cmnLf1IP59j96o7swC7QJUpwEGOT4uyjuMs1R+7Mdft
         WAzIxqvj6qGyzGfV59bkwGJz8A3rCfmsIF2Jm13uNM0RsAfDzQrBSywB8uJaNZnUTeZj
         XhHzWu49H3thjqMcOYyM97VnqvaVolyVkmVapYVWgfBs5zQpSvn4r7mXdej50Y5fikLa
         6Mbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E+0cCrxk;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id v11-20020a056402348b00b0046cba96d27asi2263312edc.620.2022.12.05.01.58.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:58:47 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E+0cCrxk;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W+GlhHy1Aw+J2S/PdKkSiWceIYryK6JZft0nwXoxTSo=;
	b=E+0cCrxkzVSPqA/nNqk7ZIKIbrD9SM1LrP2YqQoIdiNp/NPR8XUYv8xS/wHy+Hr00HpaK/
	VEseVrOT6gnlwph2PhjTNoeSsRkLl0N+7hYO5vbAg+LUONdtdnM3lhJUiuPbp/aababTjs
	UnbWCox6P5sphchQpFUo678bQtlShH8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-LGkLmgsSPPuNhex4gBBa8g-1; Mon, 05 Dec 2022 04:58:41 -0500
X-MC-Unique: LGkLmgsSPPuNhex4gBBa8g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D39F811E67;
	Mon,  5 Dec 2022 09:58:40 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A9C242166B29;
	Mon,  5 Dec 2022 09:58:32 +0000 (UTC)
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
Subject: [PATCH v2 46/51] migration: Drop rs->f
Date: Mon,  5 Dec 2022 10:52:23 +0100
Message-Id: <20221205095228.1314-47-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: 05gJ0lqqgm2O

From: Peter Xu <peterx@redhat.com>

Now with rs->pss we can already cache channels in pss->pss_channels.  That
pss_channel contains more infromation than rs->f because it's per-channel.
So rs->f could be replaced by rss->pss[RAM_CHANNEL_PRECOPY].pss_channel,
while rs->f itself is a bit vague now.

Note that vanilla postcopy still send pages via pss[RAM_CHANNEL_PRECOPY],
that's slightly confusing but it reflects the reality.

Then, after the replacement we can safely drop rs->f.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 1ae093fb61..334309f1c6 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -323,8 +323,6 @@ struct RAMSrcPageRequest {
 
 /* State of RAM for migration */
 struct RAMState {
-    /* QEMUFile used for this migration */
-    QEMUFile *f;
     /*
      * PageSearchStatus structures for the channels when send pages.
      * Protected by the bitmap_mutex.
@@ -2532,8 +2530,6 @@ static int ram_find_and_save_block(RAMState *rs)
         }
 
         if (found) {
-            /* Cache rs->f in pss_channel (TODO: remove rs->f) */
-            pss->pss_channel = rs->f;
             pages = ram_save_host_page(rs, pss);
         }
     } while (!pages && again);
@@ -3089,7 +3085,7 @@ static void ram_state_resume_prepare(RAMState *rs, QEMUFile *out)
     ram_state_reset(rs);
 
     /* Update RAMState cache of output QEMUFile */
-    rs->f = out;
+    rs->pss[RAM_CHANNEL_PRECOPY].pss_channel = out;
 
     trace_ram_state_resume_prepare(pages);
 }
@@ -3180,7 +3176,7 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
             return -1;
         }
     }
-    (*rsp)->f = f;
+    (*rsp)->pss[RAM_CHANNEL_PRECOPY].pss_channel = f;
 
     WITH_RCU_READ_LOCK_GUARD() {
         qemu_put_be64(f, ram_bytes_total_common(true) | RAM_SAVE_FLAG_MEM_SIZE);
@@ -3315,7 +3311,7 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
 out:
     if (ret >= 0
         && migration_is_setup_or_active(migrate_get_current()->state)) {
-        ret = multifd_send_sync_main(rs->f);
+        ret = multifd_send_sync_main(rs->pss[RAM_CHANNEL_PRECOPY].pss_channel);
         if (ret < 0) {
             return ret;
         }
@@ -3385,7 +3381,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
         return ret;
     }
 
-    ret = multifd_send_sync_main(rs->f);
+    ret = multifd_send_sync_main(rs->pss[RAM_CHANNEL_PRECOPY].pss_channel);
     if (ret < 0) {
         return ret;
     }
-- 
2.38.1
