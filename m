Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3379417ejx;
        Mon, 5 Dec 2022 01:56:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4SQVnZNCj+Dypj4rXA27aCAMIsXb70IWSiZQhoXULOiQEQY6P3C+n80vOJch/13YkjV/iB
X-Received: by 2002:a17:906:f843:b0:78d:b819:e0e7 with SMTP id ks3-20020a170906f84300b0078db819e0e7mr52562117ejb.83.1670234206467;
        Mon, 05 Dec 2022 01:56:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234206; cv=none;
        d=google.com; s=arc-20160816;
        b=w5kz4kTHh26aJBR5j6AZEO8jU/ozh9o+P0tZQztT4/MXaM4C5nrMPi82AA67dA5YXf
         J7eb+zz4iw288s1oFzqFZXAHebvnK6EzSbFbi2s6H9h6z8IjS4y5TXlst81nsDqd/QCC
         q3c92ur9zIzFDFQEf+9G2ukUzu1mGJHJnyhkWSd3AqClIp6cTicOwPTxp+xgg8qtB9Vr
         /qeuJk8JdohgHuLbkpNO+XxwZiUl2QYJQ9xlGWNamcqu3ZRwtxFHy3JbPJTtywABOccf
         RJpZqww5AWvoQ9a1WXoRzjZg4BP8M0E3FwWnMt4fgblM/DBiT7IAUW7R+vj+mjfugZxT
         faIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=82n06ypGY49Plz4M2tcMx6flFk5mja5S3ptKNYMoHNk=;
        b=kHpBw4nMGDnpabn1wwfjjHBNX1k5Tm1GXvFyMEGl8tib/5jAnOggJuHOOfvB3Zvz9Q
         TW9nlVHUDabEEO26hgAjZcaF5dh72uURdDGjsokK+Xmc3ps/CPS8QpIsjpBXQwSAvkLY
         FfwvwVU/gq1LprElukUDVS/4TG+m/Dc8JdmE8ZyHFAC0zueAcNi4vrc8ea19JQIgf2Wf
         XWVGKW4lI5hm4ywqKf80B6oL8NZ1MOBRq2LoZ/hS+dVtui59aIHXkfqMBb93jc4N0jrv
         X5W1dlQ17/cmUMoT8o3AnaTUnH9JVBiiWwys/rkw4IC5vLRJKLvLIPoxeybpsGHlFxQ+
         V9lA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="NU/cpA0N";
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id y68-20020a50bb4a000000b00461a32e0e38si11539072ede.306.2022.12.05.01.56.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:56:46 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="NU/cpA0N";
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=82n06ypGY49Plz4M2tcMx6flFk5mja5S3ptKNYMoHNk=;
	b=NU/cpA0N7NXg/XUZd2PfThUgE8bzkPFCHOb8JwIiuJ3janitCRZZD2jfRAcuK3QfCyB+li
	Ik0rxWz+6N4a+QoxVp6B7WjSuR40EFMAVLsI8mWBQysqGZb7Un7jDqHmgMzgSYF4A2QKsr
	brfD7Keo8JXnZn8nVS/FDXRc81WZPMQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-DYXS60Q6PNi4_cp8T_BTcA-1; Mon, 05 Dec 2022 04:56:44 -0500
X-MC-Unique: DYXS60Q6PNi4_cp8T_BTcA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0674085A59D;
	Mon,  5 Dec 2022 09:56:43 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9201A2166B29;
	Mon,  5 Dec 2022 09:56:35 +0000 (UTC)
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
	Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v2 31/51] migration: Export ram_release_page()
Date: Mon,  5 Dec 2022 10:52:08 +0100
Message-Id: <20221205095228.1314-32-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: X0LBhaml8S6a

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Leonardo Bras <leobras@redhat.com>
---
 migration/ram.h | 1 +
 migration/ram.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/migration/ram.h b/migration/ram.h
index e844966f69..038d52f49f 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -66,6 +66,7 @@ int ram_load_postcopy(QEMUFile *f, int channel);
 void ram_handle_compressed(void *host, uint8_t ch, uint64_t size);
 
 void ram_transferred_add(uint64_t bytes);
+void ram_release_page(const char *rbname, uint64_t offset);
 
 int ramblock_recv_bitmap_test(RAMBlock *rb, void *host_addr);
 bool ramblock_recv_bitmap_test_byte_offset(RAMBlock *rb, uint64_t byte_offset);
diff --git a/migration/ram.c b/migration/ram.c
index 2cbe707bfc..8aad17c429 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1234,7 +1234,7 @@ static void migration_bitmap_sync_precopy(RAMState *rs)
     }
 }
 
-static void ram_release_page(const char *rbname, uint64_t offset)
+void ram_release_page(const char *rbname, uint64_t offset)
 {
     if (!migrate_release_ram() || !migration_in_postcopy()) {
         return;
-- 
2.38.1
