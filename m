Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1516566lfb;
        Fri, 3 Sep 2021 10:47:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxteyVUWv9FpnEkOHvJtn5w9M5sPPR5kykUGJkmNOJq/CKTVukHH+NWMj5BAnKZs/p9SI53
X-Received: by 2002:a05:6402:270a:: with SMTP id y10mr183908edd.252.1630691255988;
        Fri, 03 Sep 2021 10:47:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630691255; cv=none;
        d=google.com; s=arc-20160816;
        b=A0gbtiqFPjPcfpGgLXX81wCPmYEKHNw7ty93pvP0bYeNkcc5umUZyweF3n8UDekHaR
         aLmMoKk86GKBp6gZvRuoFhX+Hn5FQHjXbaHmvIL1I0D3qqMyv1rT5980oy3Dby8pUbLY
         IOw65HCtEik5RPDFBApw+t6NHxJJ/Z3RawX26bqkqNlkC+EnrwJ1tG1x7TH5GXBYuv1y
         5v66fPPqnbp/r4Z+Z452tDnmpasEG1WSdeV4W56c7mxOr5XVByvLFAFrqG0SljTFBb2J
         mAYyKG8uLQD+mrqe1QG1AfVEebCt/NmCDKCPCypbF3Wn+jXwUpTX4iRplOu+jOWyY4BB
         N/wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=it+7i8x5aVGP9xuuZWqfll4PZf3Q881QXfej9qMTW/k=;
        b=VtGfY1mY4JQ/lYubGpuzigKRZ1UZOzLPJDW1NfNkVz/OJ3IW6CP9y4POefumorFLGr
         ovubvkR59ZJrvpd+G+LAnrVLo2sJKV7UKho8dtSwUJvuE94PZ/DuH5HmVWEgeZJ656HC
         0aNwqTTLzDqWTmBXgI83fcDzcMW6BDl9RUJKTG+txnsLLIu7hmE7qCY+ckz+41c4GAtE
         yJSz5gG0z+vZLC+Bw33aefT/hIajcJtj1PayodWhqIW3a7fwyfTCIwoC863aaYvAHrhu
         IJy8LKxOQvfKLjjg/PIGgoyWHpRQTxGmFqW+D8eq97UA4/40GE6abC/jtIv/NLimEIkU
         c5VA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H1Y7cu2i;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id kx11si6851175ejc.554.2021.09.03.10.47.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:47:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H1Y7cu2i;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630691255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=it+7i8x5aVGP9xuuZWqfll4PZf3Q881QXfej9qMTW/k=;
	b=H1Y7cu2i3X7H1QFPKqOBwpzFwwf3csiohYzxE34cY7sDoioVo+WRNe5U1lKAbVY7V3Gznv
	bIUvkXiASM5xnVJKAbyXBOcTWxz4RoRdl/Gzgrf8EYvctniTsWIlMqOeBLIzCKJZ5fYzRO
	DSTAPtl8FWmOXgMxIzd+OR42FYDp200=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-x0Inf27IOauB9TJ5LuYt0w-1; Fri, 03 Sep 2021 13:47:32 -0400
X-MC-Unique: x0Inf27IOauB9TJ5LuYt0w-1
Received: by mail-wr1-f71.google.com with SMTP id z16-20020adfdf90000000b00159083b5966so1812909wrl.23
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=it+7i8x5aVGP9xuuZWqfll4PZf3Q881QXfej9qMTW/k=;
        b=CySbS7Z3TtvVngtMUurSV998PQo2i6Xh0d95IblRjtzPaqZmCzDJpIPjva+e1EtR3T
         IVuEVycCmrbrvU7pZhAJNVYevajiESZ7O4zPziqWWQWSwVD3kZyXXxfh8OgAFuaxuegf
         L43pLW1aWJGRt8iV1fOKb7WxQLfA/nmljlSgTKJUOeyNJfrTLCA4Od5YaHmEUVGbyYQr
         clSf80xQUqJT3O7jno1NfCN8NVuypuywEw9wD4qAboEuqSZqLuE1bh69GrYt0Es9Hpi7
         Pec9KosAtzkM2RhBHDzD2qpeRqWCnDj8j1HCJMhet7uUNRsWrihQq4+7+KMRFQjcG7YP
         vhIw==
X-Gm-Message-State: AOAM533YXfKEla0QZdOJWLZegISMGHRIYL0XLgmrv6n+XU1ZXfcGIV8G
	rYc851pd5xzhYhYgDhQPOglJUuQLHm1vsmkZPvfbzdGTUenoSnY9bhAmG4pM5j7Co148mLcvrFP
	HoBrDmUtJRGHSLl3d
X-Received: by 2002:adf:f450:: with SMTP id f16mr269915wrp.35.1630691250882;
        Fri, 03 Sep 2021 10:47:30 -0700 (PDT)
X-Received: by 2002:adf:f450:: with SMTP id f16mr269892wrp.35.1630691250692;
        Fri, 03 Sep 2021 10:47:30 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id b12sm6141814wrx.72.2021.09.03.10.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:47:30 -0700 (PDT)
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
Subject: [PATCH v3 26/28] target/ppc: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:45:08 +0200
Message-Id: <20210903174510.751630-27-philmd@redhat.com>
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
X-TUID: 32YU/mho0/1R

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
 target/ppc/mmu-hash64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 19832c4b46f..bc6f8748acb 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -1122,7 +1122,7 @@ void ppc_hash64_init(PowerPCCPU *cpu)
         return;
     }
 
-    cpu->hash64_opts = g_memdup(pcc->hash64_opts, sizeof(*cpu->hash64_opts));
+    cpu->hash64_opts = g_memdup2(pcc->hash64_opts, sizeof(*cpu->hash64_opts));
 }
 
 void ppc_hash64_finalize(PowerPCCPU *cpu)
-- 
2.31.1
