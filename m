Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3379229ejx;
        Mon, 5 Dec 2022 01:56:18 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6f+InrSL4vNXplhroAklTsZhLDlIqbjwicYMcH7FKXHgJ67by2GEPgxs6s7q0fWQjpkOoY
X-Received: by 2002:a05:6214:5587:b0:4c7:50d9:ec0b with SMTP id mi7-20020a056214558700b004c750d9ec0bmr9187750qvb.59.1670234178596;
        Mon, 05 Dec 2022 01:56:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234178; cv=none;
        d=google.com; s=arc-20160816;
        b=YF+aYpvZ/culfy6mfiLXqf/8YjvARThRt9e+R9w/XYMYy1xh6qilsR6qEclnn6C9ND
         hU0eIz65iXxWbQIZfMPcQL2SN3xrCsQ2iJbzabJfOnW9czeCPwWXzaig0qGT8Am4SnE0
         GFv/YEnAzk44lQycAR8mO4Jgb+AIHEoQ9uOUMyWotPFf3kGe2llcJiTG8oFxV6xeNkgN
         YGzuWiOcqLxlzye6wg1BxwWggedgtniovp2uRAmiIC6mRBcQdY+aqw5DVCzIpv2SjmOG
         lIgTNBPu1tmRVMR+Pwt9xFEQIUugS6c7v4nMZ4px1CArLNz+axKIbGNI3w4bO5Dn8AP7
         EPBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XBQnhZpZ71SlO6xn4rjOE8oPXgCnfntRGbd+BOiogGQ=;
        b=O9rVFK8JejPneznJy3ltpdUaEHnB8/nT4wU49kYR2L85yD9JXgOy/CHRyWJpLzWzt7
         a894pFEAggWHsUXHCHMl8yfcm6WnDOOJnG3dX67uU4eB6/RQy19TFWPm/r9DCOSNv49U
         4fGwt3WBL2TUwhIyjDGv1w2DeeOb+QBnzN9TRY4TnAnSNXwS/LGU8RPmJWaBf17ylxDR
         0FPmxixKIN3OJ7ln/vn+Z35BBq8mL+FEaaOTFVId1eUOcgz+fbo3XHA3UKCJ+lQMljhN
         4lawI/gJ0NLixQ7G0oA8WhznBfsqIxblnGgDaRZFn4vUkUNQLDGx5rUdPMhIhCcSKT11
         myNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IFk5JUXY;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id w4-20020ac87184000000b003a68a381655si3832579qto.639.2022.12.05.01.56.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:56:18 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IFk5JUXY;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XBQnhZpZ71SlO6xn4rjOE8oPXgCnfntRGbd+BOiogGQ=;
	b=IFk5JUXYwAkltsUC0IrnfGEg2pclU96ZNlNDdD0fisg93NQpogBpIL/rP0aHAN+DSE5OgJ
	wv62L9s/MNo1OJ3XuUh88hiC31QG0eruCAnxvVU3BHa3wuneDb41aARIT/X/ueYNJVs+Jw
	aPhRsR61WLjmhDig4yrQ+TDrmp4tP9A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-BSMwrv3aN9mwK21WovcvUg-1; Mon, 05 Dec 2022 04:56:12 -0500
X-MC-Unique: BSMwrv3aN9mwK21WovcvUg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38893101A528;
	Mon,  5 Dec 2022 09:56:11 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C38D2166B29;
	Mon,  5 Dec 2022 09:56:03 +0000 (UTC)
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
	Evgeny Ermakov <evgeny.v.ermakov@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 27/51] hw/display/next-fb: Fix comment typo
Date: Mon,  5 Dec 2022 10:52:04 +0100
Message-Id: <20221205095228.1314-28-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: e7e7A9oUBc2f

From: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>

Signed-off-by: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
Message-Id: <20221125160849.23711-1-evgeny.v.ermakov@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/display/next-fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/next-fb.c b/hw/display/next-fb.c
index dd6a1aa8ae..8446ff3c00 100644
--- a/hw/display/next-fb.c
+++ b/hw/display/next-fb.c
@@ -126,7 +126,7 @@ static void nextfb_class_init(ObjectClass *oc, void *data)
     set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
     dc->realize = nextfb_realize;
 
-    /* Note: This device does not any state that we have to reset or migrate */
+    /* Note: This device does not have any state that we have to reset or migrate */
 }
 
 static const TypeInfo nextfb_info = {
-- 
2.38.1
