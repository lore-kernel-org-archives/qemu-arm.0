Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3379399ejx;
        Mon, 5 Dec 2022 01:56:43 -0800 (PST)
X-Google-Smtp-Source: AA0mqf53zjc5zmfJ0R06DuxTyazeCyzzJUEwIWY+jQSG0wHUxwY5JYcLo8NC5fcmbJIyJvsqRILh
X-Received: by 2002:ad4:4686:0:b0:4c7:79c4:91c8 with SMTP id pl6-20020ad44686000000b004c779c491c8mr533532qvb.92.1670234203722;
        Mon, 05 Dec 2022 01:56:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234203; cv=none;
        d=google.com; s=arc-20160816;
        b=iko8WiqemhaWqWYZclLdKDFfknNXDcHaaApNrIayZuviavSzAxt397tVoheqV4uFu5
         Vk0LXCMHbAdRh0HHNPS6NRqI2YWQ6LScd+uzHkkceU8Ew8Yiyrf/Iqux+7+n5ZwUHmFC
         tF4kh8pgkuYx5U7KMxt6Bc0LzeCv8sK/QLNf/YPEiNwnHoPtbGPLdHWhDMANciMX08qb
         xsBNY2aSBFlGPA/Wch/xogfYivfnqp/q0Wns1izXOuVc8S142hiWUl1T5Z4X7wEBYZZa
         hAp4amL+wSzc9+7GMIo20hpty7jDPJfNvPvA0AfVJConQIOv597HrVNxayNgvoYDDgVy
         0fag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wht3cZbEag0AF4cSKduIqGDfC02z0cnt1HmfpmfZWO0=;
        b=Lvtom0LrUWVt/8LSNezNlwnpOzRZI/Z5BvCZC8jx34bzu0U3yUpdUL7cR2UirEzahV
         ucT8xkjvu4yUZJKJe+LeBtoopdPGxsEEfCbGYNPe+s7ozj8BChMmYq1flSkv00mXC80X
         cCJ96PPOh62JkplGb8jmliYBYPD3VO83sxdVLfl/yvYWZZMfwQtZBLp7rk/vgpCMRooi
         gxTSkvxUIhi0a/0of/R/Nk7ou9Xde2Bl6Db06DtbzsqpCpaiXHPqbCvzV1ITPAo5vKcf
         zBMzGFkfSZ5/S698cu5igKfeyZWMduJEVBO5b9d2yRExTOwbPERQCklUJsnEPw4/tKw7
         Q0Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hDth05pf;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id r22-20020ac867d6000000b003a51b82f290si7161946qtp.495.2022.12.05.01.56.43
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:56:43 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hDth05pf;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wht3cZbEag0AF4cSKduIqGDfC02z0cnt1HmfpmfZWO0=;
	b=hDth05pfjVQ8ds6aHj0eBd/q/0hQ2TRoO+VTraCfPywbtVwoQuKwOqxA7S8ZmGEcGbuRqq
	1IOrWarzwz1x+1b33hdX9hX2SE1RQJFX3ec/Eyal/J75kI285AiMsXTVhd6r9n85s4r7O8
	idEdOKPlL+jIB128e5Ikv+NItze2V3k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-nHYc-QPBO9eadOh-sy8XhA-1; Mon, 05 Dec 2022 04:56:38 -0500
X-MC-Unique: nHYc-QPBO9eadOh-sy8XhA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43A3D1C07824;
	Mon,  5 Dec 2022 09:56:35 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 910B22166B2A;
	Mon,  5 Dec 2022 09:56:27 +0000 (UTC)
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
	David Edmondson <david.edmondson@oracle.com>,
	Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v2 30/51] migration: Export ram_transferred_ram()
Date: Mon,  5 Dec 2022 10:52:07 +0100
Message-Id: <20221205095228.1314-31-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: mf2dNaH+tO35

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Reviewed-by: Leonardo Bras <leobras@redhat.com>
---
 migration/ram.h | 2 ++
 migration/ram.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/migration/ram.h b/migration/ram.h
index c7af65ac74..e844966f69 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -65,6 +65,8 @@ int ram_load_postcopy(QEMUFile *f, int channel);
 
 void ram_handle_compressed(void *host, uint8_t ch, uint64_t size);
 
+void ram_transferred_add(uint64_t bytes);
+
 int ramblock_recv_bitmap_test(RAMBlock *rb, void *host_addr);
 bool ramblock_recv_bitmap_test_byte_offset(RAMBlock *rb, uint64_t byte_offset);
 void ramblock_recv_bitmap_set(RAMBlock *rb, void *host_addr);
diff --git a/migration/ram.c b/migration/ram.c
index 1338e47665..2cbe707bfc 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -422,7 +422,7 @@ uint64_t ram_bytes_remaining(void)
 
 MigrationStats ram_counters;
 
-static void ram_transferred_add(uint64_t bytes)
+void ram_transferred_add(uint64_t bytes)
 {
     if (runstate_is_running()) {
         ram_counters.precopy_bytes += bytes;
-- 
2.38.1
