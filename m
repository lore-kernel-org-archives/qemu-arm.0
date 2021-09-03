Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1515996lfb;
        Fri, 3 Sep 2021 10:46:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1sM9j3pacEcq2fqjl/LbLcwpyI0eTk75N7KLidPElRqnj2NY3huTk+1cDsdlmutHde2Ki
X-Received: by 2002:a05:6402:c05:: with SMTP id co5mr165463edb.41.1630691207771;
        Fri, 03 Sep 2021 10:46:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630691207; cv=none;
        d=google.com; s=arc-20160816;
        b=CLbLJhQhXff+k1iwPD8NykgYJSrGIQUhPJ8FqwoGHKU/Ve4a4UT6Ube7WFkk9YnoF9
         NJXqNGJxMHMPcwo+Sd2QPk9UbKpSVJSQpzBwscBdNDPZFVbxupdp72Aqm/Ram0P9Dk+P
         nEwXH0Rf8iMd617RS0f9qwQlo6iPS2Bh+U1WGPjNEfjumRSSLNB2i/pMk3CEESi/twPf
         cMl87VEl3kbd//14j1B58Hpq7TGacvuaAbq8W8WzXsxoxhtIaxcfOI4bg60eEUssXEAu
         GXlC50fY72MFrO2iNdynJfYkXY1mKCFXf3eVR+HKZxmjVzj95qXqvvKjSWBOP9XSjmrg
         o4kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RC7jHm0YE2K1GdbYZ8il6kV9I4tGJG8Mj2QiHey69tU=;
        b=WZrQ9SLjCtl1mFTTRxUpTJ5ZWBA3pI2u7rhQIg9BlheCEk2EOtgUe8FaT8LViIP3Pa
         fWIhZv5x4Db4PUUbnxWzjqlHkH01+FhOiN4FISFa2267OwKoUKGPhuyhLz0SkyzZBAC2
         SyLUiXjFvTqWod3suK/CkFrAT3Ykr5PjrH3s/kmH7ZOzWWic3cXRZ8USzdW6eDzjPsXg
         JtdGXhv/rAydTuPB8eDA3GeDC22ZT6QFmzMvggbTzvZthgunXyqwPbs8hQJucovj6SmC
         NVADYa/iQdF5sGqeWczCrQE81xVqBJ+T/CJRdMjLIRlrG14oktjtuNxlq/bu/99SaqpC
         fITg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i+6TBRbD;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ne17si5655443ejc.518.2021.09.03.10.46.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:46:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i+6TBRbD;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630691206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RC7jHm0YE2K1GdbYZ8il6kV9I4tGJG8Mj2QiHey69tU=;
	b=i+6TBRbD14xMm7dON+bG+rDxWNCS821QWcGO0P8a8UhiSvaurK1fvihrtt4TJWLJaqAywT
	VwTwzhw5JVHwwg0G2gsOoCsuycnvTPNKqUfVJwtlGlR9uk3TSYGcU6ha/1GWkBTDW2VLcj
	diEM++ndYdSRj6ZmykUCApBlZvGwqQs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-LYT5JinlNsCTsRqam4Q2Zg-1; Fri, 03 Sep 2021 13:46:45 -0400
X-MC-Unique: LYT5JinlNsCTsRqam4Q2Zg-1
Received: by mail-wm1-f71.google.com with SMTP id h1-20020a05600c350100b002e751bf6733so36389wmq.8
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RC7jHm0YE2K1GdbYZ8il6kV9I4tGJG8Mj2QiHey69tU=;
        b=N46FO1ytdqog5tCSR51S7YxzN3+Z1fYigxo+hxXepC20FAqTLnpXOhx/8VUzMs1iGC
         biwveEXXF1pdopxxln3p4BEr7VEjpFLUeSt9sFDh08ESihX/kWpnV0J0O2LfmjmofcLt
         WLNDklXUnICbmcyR4lwMXtBVlF6lxa8NdclLqfPR6SO2HnPlj6KaX9y0Z2h3YrJSTbI4
         dTVtzrqGVWCEB4iktH8iVpX1t0TOMYamWIo3wQfeMFhjfqTX2RuajbWzUMQ4h5Cwwann
         2xBzrFdhG6O2DngVeAM8FSNVkSpsD+I2t4zF6GE/CADg6DUQZ4hlcl3/MYSyLTFcM4y3
         btvg==
X-Gm-Message-State: AOAM532prk2t9gvuWUosy54baExmLyEmIzc2ayY08ebhDNDTQ4n0MKN8
	RITBpIdh+cj6bcw6iJV1yg7MaqmT6ax+CB35jffUxuX++gObeoCa+XHG8ze+8vzq+qylJ+Z7xRZ
	Vs3TSdT00oDgyeBq+
X-Received: by 2002:adf:df08:: with SMTP id y8mr295558wrl.124.1630691204600;
        Fri, 03 Sep 2021 10:46:44 -0700 (PDT)
X-Received: by 2002:adf:df08:: with SMTP id y8mr295545wrl.124.1630691204405;
        Fri, 03 Sep 2021 10:46:44 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id z2sm18833wma.45.2021.09.03.10.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:46:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	David Hildenbrand <david@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Hanna Reitz <hreitz@redhat.com>,
	qemu-block@nongnu.org,
	qemu-ppc@nongnu.org,
	"Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v3 17/28] hw/rdma: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:44:59 +0200
Message-Id: <20210903174510.751630-18-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903174510.751630-1-philmd@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: M8aznfpubMf+

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/rdma/rdma_utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/rdma/rdma_utils.c b/hw/rdma/rdma_utils.c
index 98df58f6897..6d6b8286b69 100644
--- a/hw/rdma/rdma_utils.c
+++ b/hw/rdma/rdma_utils.c
@@ -71,7 +71,7 @@ void rdma_protected_gqueue_append_int64(RdmaProtectedGQueue *list,
                                         int64_t value)
 {
     qemu_mutex_lock(&list->lock);
-    g_queue_push_tail(list->list, g_memdup(&value, sizeof(value)));
+    g_queue_push_tail(list->list, g_memdup2(&value, sizeof(value)));
     qemu_mutex_unlock(&list->lock);
 }
 
-- 
2.31.1
