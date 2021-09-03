Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1516258lfb;
        Fri, 3 Sep 2021 10:47:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygOsumKflyp1GmBJTdCdh50a7IZnQrWrrwZSvdAgA4pqU00j/9mO7XJtD92GOfLcVzjmwp
X-Received: by 2002:a17:906:150c:: with SMTP id b12mr19662ejd.275.1630691228990;
        Fri, 03 Sep 2021 10:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630691228; cv=none;
        d=google.com; s=arc-20160816;
        b=xcpoTQE9NQTX/iPcemK21ScoLbF0qOjE9lCgrKvtsGsSlJYcGMNPZs/ypgaBjdQX4f
         rEYIv+g+a81uJP9/cTgvcge69xaos/BLpFVbdxK05OquMviEih+4fXP5k8W5E27yMMik
         y2tEBtql4KufHxem0yd0NF1n39Cu6okPWWit5FOwgQWvuT9DBrXdJqfmIoTL4xsJ1YVK
         3GXLBqXate3ljdgxuUEOdDJ3F6dNQKQbvuIlMp15Zsl84uh5YCuuyqusG0l00x1FYwec
         pcF2RgqNw/bymX7Qc/xZCI6hsP/FUQ1DMUfPXkDiTB/9C6P3Zu7ArRsTZyPWujdCHev/
         ScGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vC6PIuQnjMImB1rzjEb7/fuKsW0b+ne9BdxKzdZmtOI=;
        b=GSrGxqFXgABmMSEIs1/7vd46jKbe3ug76cEGpONThoJEY6uSKwxGB0jE7/BuLwpYeA
         rOmbtMpsK4iFTGFn2QALfi7dTniCaIzQCwLX+or0ov45rfqo4cCDq41/ufen+B2Ynb4Y
         yiQWMbKKn7uNJG4p2Pc9AZsSpO2T4S2zqPmuQKU2uXF8zDUhk7sbrdyMQiM7uB3Io1Z+
         BbqmqtLcauKEbfq+Ikwx5WK+1Mk7fjoZyyDhDiTxrBUfqMw7ONnd7aWXwrSBVsisLxg3
         MfJNOPA16dq0gScMALP00K606jL4KIW3tr/iBHdQlJxVSD0MnNo+JUN7I9rhPGrF3IZZ
         JV1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jLFHXbL5;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id u18si977889ejf.758.2021.09.03.10.47.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:47:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jLFHXbL5;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630691227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vC6PIuQnjMImB1rzjEb7/fuKsW0b+ne9BdxKzdZmtOI=;
	b=jLFHXbL54J2aCjygtL0Lua6mNlqnFRGuPQS25JzCP17x99P3sgWNaXwNFoaqaQS3tvtO1x
	MqSb5Ljxxx75uWosMgRwpaINaj+6uixMxObh4yKhUH0dicoFrG/v2qbUfMfVtcVnjW6x+M
	LHcBBGGl6UMVmidztM9pWYkl731FL1Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-r_BMHVSRNZ27hT3PwOoQ-w-1; Fri, 03 Sep 2021 13:47:06 -0400
X-MC-Unique: r_BMHVSRNZ27hT3PwOoQ-w-1
Received: by mail-wm1-f71.google.com with SMTP id u1-20020a05600c210100b002e74fc5af71so2150001wml.1
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vC6PIuQnjMImB1rzjEb7/fuKsW0b+ne9BdxKzdZmtOI=;
        b=bqsxzLNZJx3nMfHuHFkOKsS1jOrYB/ffidqqgUiP6SZBH9L4CYxLENyASgSzrZYxx1
         irKq2hmTOkhNhfJFZaBw6BtP3SpDSxPIoC5gkdYTsCsSNyeZhq3kzQxEbU10pUgWDv7J
         3WISiocO0SK43ZiabZ5kNcDwAtFQUsqZ9Wde7unGjEWUvcAzHUHeTT3BAN3zeZO3LdbB
         qFU5n5rP6B3dcky/BH5Wu88M8wVOGusrZhFfQS6D/YjNeBdiCOXiiNFbRejMSI2TfTBx
         nRaiijolq0CJ0xNcdpIpY8Veh44jxNjVY9w0mbNrJYioGz6yv38FjhNfz2OvpCNGO0r/
         Ez2A==
X-Gm-Message-State: AOAM5302jKGHQvJW3MmSHrcwfW7BmeIU0TeYt4dw6v/7qvtnwSqmxbwr
	1tXiUUoPyl4gjRCN2DQQ/t60TGGi7SRnhMhvSU9wEhK2FedkyuyI3luBpN3WXm6lb7kfLVT9PVw
	yGVfkFUMxeoUf3/ha
X-Received: by 2002:a1c:7304:: with SMTP id d4mr17213wmb.119.1630691225549;
        Fri, 03 Sep 2021 10:47:05 -0700 (PDT)
X-Received: by 2002:a1c:7304:: with SMTP id d4mr17190wmb.119.1630691225406;
        Fri, 03 Sep 2021 10:47:05 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id f3sm30821wmj.28.2021.09.03.10.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:47:05 -0700 (PDT)
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
Subject: [RFC PATCH v3 21/28] ui/clipboard: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:45:03 +0200
Message-Id: <20210903174510.751630-22-philmd@redhat.com>
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
X-TUID: 3iU6qJeFv5a5

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
TODO: audit qemu_clipboard_set_data() calls
---
 ui/clipboard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/clipboard.c b/ui/clipboard.c
index d7b008d62a0..d8e11bb6596 100644
--- a/ui/clipboard.c
+++ b/ui/clipboard.c
@@ -123,7 +123,7 @@ void qemu_clipboard_set_data(QemuClipboardPeer *peer,
     }
 
     g_free(info->types[type].data);
-    info->types[type].data = g_memdup(data, size);
+    info->types[type].data = g_memdup2(data, size);
     info->types[type].size = size;
     info->types[type].available = true;
 
-- 
2.31.1
