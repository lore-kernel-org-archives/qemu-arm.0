Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1515327lfb;
        Fri, 3 Sep 2021 10:45:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9v8y2P07opXCq7A631f0sU8lsVWiZ8MsGhN/xWmaSS0LeCn8CUa3AQw0fZw6v91VlTtgh
X-Received: by 2002:a17:906:184e:: with SMTP id w14mr39983eje.526.1630691149660;
        Fri, 03 Sep 2021 10:45:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630691149; cv=none;
        d=google.com; s=arc-20160816;
        b=g+iawF9ZIJuWdO8ZtpSF9Bn88YKpE3oFLJJEITuMyH2teizMA/XOVE0nBDz4r1CF0s
         6r/SNC65Pk2cYwoXE8/O7FsxAthaF+QEto37+PH0g+FLdJbqYwSEy+ryoYk+Bhmsh4PE
         /2xg3XKudVkc9t+ICGB3nlcAX7S1GZFYk0qLQez4r9Gp77+45HJDngaD6ut5a36mTG0A
         z5a7UxfavOR1RlFP7omrKo5DiY9N4tO2/wFfjP8hbyE4toubKSvNNLTAEKO00F+ZgqyT
         i9dLxVonj/RGzx7NEKlvS6mNAeVRb66/uf7QIKhJA2OS39UELvG4NT8rb6oZ/D4csFax
         5X0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=UOJQhlETtOueKegWcvS/QPbLXEVYKjhJkC5dBOYp7Ak=;
        b=rpD+ZzSet7OvLmpzQy9mRFPy4o6FqVYRN4pd05aRbOO6hakYE/fjqBNwZClqKo79pC
         GgYL1+Uc/2BBsrlwbD8gdFgiTjl0T9eN+Y8+qWKR9FqCYFviRXCWw1fNWu7DsB99f/vn
         EP3NHP3AFsqhKXr0aiYbSer/7vHLDIIL/yaVtwOoVA2as5gvZpLXJy5syNUNJQdu06Up
         scSZZCWXcO6QOw16cyYgw9Wv0pLXEEtacb0MBPHPNZ8H8NR75cjbEegBI6FCZ1+Mtcf7
         Rg9K4yqfwVOIT4gjcI6rgSIeHffhCk9bGU2sZpzh848FTfdBndAjmuEB3YMj8ItfKw7W
         Suyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NmIrhZWF;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id p15si229743edj.83.2021.09.03.10.45.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:45:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NmIrhZWF;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630691148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UOJQhlETtOueKegWcvS/QPbLXEVYKjhJkC5dBOYp7Ak=;
	b=NmIrhZWFCg1UF/oZDyFztPd3BQ40RFw2ipLXoHlzcgUi35eUFXZISAQ1Q1uBjbeBpgEb1r
	j/LGprAT1UjfswZL1vqy5Zf0UerWHORvwcYCz0Hc0Y7Q26I1uCKQ4BLdY8a43Oq0jhRgji
	knZSnvqBbfc0T/BGkOm2N3rajNZk5mY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-tDn3iVFYNqitnx4v6mIjBg-1; Fri, 03 Sep 2021 13:45:45 -0400
X-MC-Unique: tDn3iVFYNqitnx4v6mIjBg-1
Received: by mail-wm1-f69.google.com with SMTP id j135-20020a1c238d000000b002e87aa95b5aso49671wmj.4
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UOJQhlETtOueKegWcvS/QPbLXEVYKjhJkC5dBOYp7Ak=;
        b=ryYoDSIKciBLhjDoxI9yr8ZnIxCMBMcbP478FOyYSW2VGYCAskxdIXxdcAnp2cj8Oe
         cfPb+GAkFh9cy2U+m122W9/JVmLx9oUxIcNdgxErZd4+4bYahPv++P/ChGvppQzQdWTh
         gtOw3St1/fT0rmmYmH98pi7nzAorIqIyIpunDau90DzLbtZu5wRw306ZoLP/dbCWQK1O
         Acv/eN2OogpvywRAq7i9gnMNAk3oNml+4driiA03QUbNDiTLeN0MZxlukIMlAgzK9iC9
         SMMnUUz1Mu4sGyOv+OJ8m8cuhf4F+Mbf6XLNpZSiDNheYSZpHWWutM4Ni3pv57NEHQFH
         PSsQ==
X-Gm-Message-State: AOAM531UIRjD01FT0wXeY2B/NdUruKy8f5IXa8RdwgpIsJJ/O9GVGVV4
	agKJEziTbJgHuL+7AB6kVHgyj/rthCB2RuKXaoDdQXqk2aQIaxHV1LyCbhNO9sFXNe4zsyeIzxP
	rTVZaaDxwOxKQMAHm
X-Received: by 2002:a7b:cb09:: with SMTP id u9mr18597wmj.63.1630691144423;
        Fri, 03 Sep 2021 10:45:44 -0700 (PDT)
X-Received: by 2002:a7b:cb09:: with SMTP id u9mr18578wmj.63.1630691144215;
        Fri, 03 Sep 2021 10:45:44 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id q195sm23691wme.37.2021.09.03.10.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:45:43 -0700 (PDT)
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
Subject: [PATCH v3 06/28] softmmu: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:44:48 +0200
Message-Id: <20210903174510.751630-7-philmd@redhat.com>
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
X-TUID: d7pinwCUxTgd

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
 softmmu/memory.c | 2 +-
 softmmu/vl.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index bfedaf9c4df..1db019393b6 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1140,7 +1140,7 @@ static char *memory_region_escape_name(const char *name)
         bytes += memory_region_need_escape(*p) ? 4 : 1;
     }
     if (bytes == p - name) {
-       return g_memdup(name, bytes + 1);
+        return g_memdup2(name, bytes + 1);
     }
 
     escaped = g_malloc(bytes + 1);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index ea05bb39c50..7a44c63a6ad 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1154,7 +1154,7 @@ static int parse_fw_cfg(void *opaque, QemuOpts *opts, Error **errp)
     }
     if (nonempty_str(str)) {
         size = strlen(str); /* NUL terminator NOT included in fw_cfg blob */
-        buf = g_memdup(str, size);
+        buf = g_memdup2(str, size);
     } else if (nonempty_str(gen_id)) {
         if (!fw_cfg_add_from_generator(fw_cfg, name, gen_id, errp)) {
             return -1;
-- 
2.31.1
