Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2041421ejb;
        Tue, 24 Oct 2023 06:19:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWD15U2+oqXqHFlku+I8Avl9+FfpEqy7BpvoGBaZvWBpB5zalv0VEoqRXvt+6AVMq/1vWK
X-Received: by 2002:a05:620a:1913:b0:777:3bd:9774 with SMTP id bj19-20020a05620a191300b0077703bd9774mr14780257qkb.27.1698153550728;
        Tue, 24 Oct 2023 06:19:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698153550; cv=none;
        d=google.com; s=arc-20160816;
        b=KqEUsQFVV3w4BWXeXcOViwBm/joYMeqm75QdaFTB4kJg8Rmw7Ew5bbcQYq8NvQStTP
         gxjzvDCIab/KUU6Z0tCcCkyK5hPejlKi7nCn5Hu6Z+eF2EGvLXkAW0se/nNt4/VSrJUx
         22gvunMqlhaxSg/OwM64Gkot6YdKyCkDU/rYgTVd7EvL4riOhEqdNzu/nbY3L39g9RB+
         y8mouI6pX7GtDayDC2c1z9rp41gX3qTsiZB6yFbxVkewiRBIxqrv/4yHneRrRS/MHiHj
         TX+1Wp06WXuDyMvt344mrdwRKAS7zV4fuRcMsT3IM2jIbPdOM9Mk1YG747WITBjltzo6
         Prng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MAvCgT0ohAvu13qO9O2qXDeVppbBAyGNHtVWe+19H/o=;
        fh=0DRGwfQymzNSinv+CnmU35FvXClR1k5Tnpw/bIUVe6k=;
        b=NgjQpPY1ayYNubVrFkI0Cf/oXY5/nSkTLrF9dHmVXAhFmmtL4Dy6OpA+hZyRgcpmRC
         j9/Yu/Pg6hupHXUwaPM0gmpGpb6zUawOQuvlSmtLQQgLeSejts32lC7bTnxLTonVkSlP
         qQuA7neaLZx17Z25tD6HPOVqy+XAxOGJnfq4APUtNf/RWesf4b5EmeymKFUxPHnCSN3B
         hgPnrowBR/N/qldG+8s8irmRVf5NG7zCgSEGn0PoB90rRCn18Pm6lItDWtc4hjiIzxPL
         wyjl5CF/E1fYfY5hzuA6//V5rlNNJyEI8DMzPbIQbOIaeptA1lhi2iS184ggDXr8i0hN
         dQGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="bPC/BJai";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13-20020a05620a040d00b00772638f486fsi6964880qkp.305.2023.10.24.06.19.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 06:19:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="bPC/BJai";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qvHFm-000887-8j; Tue, 24 Oct 2023 09:15:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qvHF6-0005IH-PW
 for qemu-devel@nongnu.org; Tue, 24 Oct 2023 09:14:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qvHF4-0001HR-1E
 for qemu-devel@nongnu.org; Tue, 24 Oct 2023 09:14:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698153281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MAvCgT0ohAvu13qO9O2qXDeVppbBAyGNHtVWe+19H/o=;
 b=bPC/BJaiv9TnWiSKqazULGpPjGRJ5zMzJ6lrkY4uPyL5pNMH4BuFM5R1nAp8kE6nUlntkx
 9NlLaGKf/0DBwm1Dkt2/5I+1q6lMJhD8qWKvuAbtWNa0nsOw61dvhPqPdcHg7Br7fFfeWr
 WuEiHM1eb5VTdIt/g1gmvClZgYfTfCA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-LK7K9INCObKsJh8txW0J3w-1; Tue, 24 Oct 2023 09:14:37 -0400
X-MC-Unique: LK7K9INCObKsJh8txW0J3w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B48793C1E9DF;
 Tue, 24 Oct 2023 13:14:34 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F21D01C060AE;
 Tue, 24 Oct 2023 13:14:27 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Corey Minyard <minyard@acm.org>, Li Zhijian <lizhijian@fujitsu.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Kevin Wolf <kwolf@redhat.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 libvir-list@redhat.com, Stefan Weil <sw@weilnetz.de>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Fam Zheng <fam@euphon.net>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Eric Farman <farman@linux.ibm.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Lukas Straub <lukasstraub2@web.de>
Subject: [PULL 12/39] migration: Move busy++ to migrate_with_multithread
Date: Tue, 24 Oct 2023 15:12:38 +0200
Message-ID: <20231024131305.87468-13-quintela@redhat.com>
In-Reply-To: <20231024131305.87468-1-quintela@redhat.com>
References: <20231024131305.87468-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Z183/4RWh3ue

And now we can simplify save_compress_page().

Reviewed-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <20231019110724.15324-7-quintela@redhat.com>
---
 migration/ram-compress.c | 1 +
 migration/ram.c          | 8 ++------
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/migration/ram-compress.c b/migration/ram-compress.c
index a991b15b7a..f56e1f8e69 100644
--- a/migration/ram-compress.c
+++ b/migration/ram-compress.c
@@ -291,6 +291,7 @@ bool compress_page_with_multi_thread(RAMBlock *block, ram_addr_t offset,
         }
         if (!wait) {
             qemu_mutex_unlock(&comp_done_lock);
+            compression_counters.busy++;
             return false;
         }
         /*
diff --git a/migration/ram.c b/migration/ram.c
index 63a575ae90..46209388ec 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2067,12 +2067,8 @@ static bool save_compress_page(RAMState *rs, PageSearchStatus *pss,
         return false;
     }
 
-    if (compress_page_with_multi_thread(pss->block, offset, send_queued_data)) {
-        return true;
-    }
-
-    compression_counters.busy++;
-    return false;
+    return compress_page_with_multi_thread(pss->block, offset,
+                                           send_queued_data);
 }
 
 /**
-- 
2.41.0

