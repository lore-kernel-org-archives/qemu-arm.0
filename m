Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3378321ejx;
        Mon, 5 Dec 2022 01:54:22 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4vhyw+gYrI40gUHo4xcCo2tIr3ZBgEVf23hp/Xt9tb/Bfnfohcyoj6+9+d2/NQmXbLgtrJ
X-Received: by 2002:ae9:c217:0:b0:6fc:9203:83fd with SMTP id j23-20020ae9c217000000b006fc920383fdmr23499851qkg.167.1670234061867;
        Mon, 05 Dec 2022 01:54:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234061; cv=none;
        d=google.com; s=arc-20160816;
        b=olkMisDBJdKI2Z4d29JydwA8uWxSW38FwBfXhsPbHvPvxL6pLgRTY84q+D2IGQNIAo
         vy+LsRDYPhnojzTr7jOfgnMxZka/iATQ3IAiwItCqD79q4SppQmieicFPs3aqLL5exTF
         +KhIkaObD2T23Tccg/7T4mrkRg15AlByJcYWLIQqYwHVlDg0u0r2CDG09Tz+E5ZK2oV3
         /53WHxcYOIddXoVajpB9T95Xz5Fi2WKGqkwU/g3p6DOI9t4P/xA/dYFTOpBiDjSX2MJU
         h7RtW9iV2KQ344nh/BKw87qu74T/M6JNkSPnEic2EPTQn8tU8U3c0+qByMzD4VxoiZ5w
         llPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JzR6LoP80zahpbmKbQVOVIoUoQ6EpDTG7DyoVVDdz14=;
        b=lT0QP8KNLLWlB8Gucba933q1PyjlnreSn99VXQipYQ6JCMMdFQXXoqngOgo3MHrNG3
         P4izm+nn+ECPIpoQnXc/l19lMsMIA8nOovqkboOqAB7ZCC3M+qQDb5O3jTBk0RZZAQJK
         mDHSQUWlslPYYVNW4zy3kJXr3hXSiqW3/0/XbtKshQ18wyK8MN04CHihPw7hwA6cenOe
         UXg8WZHO6nNJMHtAfmZRMm2BcQfFMDHJYMbdU2P4xTt4dSUfBqQC3yj1gaHKs1WrgiR3
         GHuYhjwy5gm0Ttre39XaIrN+FAQbE8xDVFnPhEh82PoTbUcM5wtj+gODxqGbhQxHofeG
         R25Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bEjnPzKf;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id s33-20020a05622a1aa100b0039cce8665dcsi7563139qtc.718.2022.12.05.01.54.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:54:21 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bEjnPzKf;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JzR6LoP80zahpbmKbQVOVIoUoQ6EpDTG7DyoVVDdz14=;
	b=bEjnPzKfJlIs3/gwzjcfRzawCwEirnI2v6v8hxfj6ge9EVNXY9gqlwlMjJgGy/C8hjU9nG
	UItlqBwNdmMHu45oMINSq2EaUZ8tIqT3uLE7Ijjvf84Hl+lPbkijpmnSD2A4C/d1X6QL2Q
	fHn6n2xCSrvqXaiZ+x2Od86PAFPRVqU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-V-jSwxfUPjSLf24igefaqw-1; Mon, 05 Dec 2022 04:54:15 -0500
X-MC-Unique: V-jSwxfUPjSLf24igefaqw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBA01101A54E;
	Mon,  5 Dec 2022 09:54:14 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A245F2166B29;
	Mon,  5 Dec 2022 09:54:07 +0000 (UTC)
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
	Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 12/51] tests/qtests: override "force-legacy" for gpio virtio-mmio tests
Date: Mon,  5 Dec 2022 10:51:49 +0100
Message-Id: <20221205095228.1314-13-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: 62dpfCpOOzM6

From: Alex Bennée <alex.bennee@linaro.org>

The GPIO device is a VIRTIO_F_VERSION_1 devices but running with a
legacy MMIO interface we miss out that feature bit causing confusion.
For the GPIO test force the mmio bus to support non-legacy so we can
properly test it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1333
Message-Id: <20221130112439.2527228-2-alex.bennee@linaro.org>
Acked-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/libqos/virtio-gpio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/libqos/virtio-gpio.c b/tests/qtest/libqos/virtio-gpio.c
index 762aa6695b..f22d7b5eb5 100644
--- a/tests/qtest/libqos/virtio-gpio.c
+++ b/tests/qtest/libqos/virtio-gpio.c
@@ -154,7 +154,8 @@ static void virtio_gpio_register_nodes(void)
     QOSGraphEdgeOptions edge_opts = { };
 
     /* vhost-user-gpio-device */
-    edge_opts.extra_device_opts = "id=gpio0,chardev=chr-vhost-user-test";
+    edge_opts.extra_device_opts = "id=gpio0,chardev=chr-vhost-user-test "
+        "-global virtio-mmio.force-legacy=false";
     qos_node_create_driver("vhost-user-gpio-device",
                             virtio_gpio_device_create);
     qos_node_consumes("vhost-user-gpio-device", "virtio-bus", &edge_opts);
-- 
2.38.1
