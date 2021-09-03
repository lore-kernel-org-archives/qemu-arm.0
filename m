Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1515802lfb;
        Fri, 3 Sep 2021 10:46:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYKV0fUeW5gKPuUSuR9lsSzly5slJoFIHexH0/bTXYdL9YN1JvRvVbOdcH1d6WnFQweMp/
X-Received: by 2002:aa7:d3d1:: with SMTP id o17mr175488edr.272.1630691192145;
        Fri, 03 Sep 2021 10:46:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630691192; cv=none;
        d=google.com; s=arc-20160816;
        b=GBt8US5D78s6RdD4MZ8/8jirstbxULp72CW/TTrrETRncQ4wfqZ2kCm0q/9NOXK5NB
         hsDUsRBNaJ3ODKFMhiqB6PLS5KBYxqLXcMLx6939PM7zaS6Xe8hhAsMFZruP1QKfeKUm
         9IaqBGPHHmdmD6mK04Jpz1LYmB60M1vB3NDJH1JoAHvgwRpLabw714gG2hlO6/t5JKXB
         t9qa/EFUux0tqfGZe3vTIU+N1VDxX+7uZ8h8ijj8F6LGyEnGC5zInl53NAxif7/mDOvl
         ToX7GUiVrh6DJ6fDx15N4VsR6msuo2dVIkeyr6WrcWFnYkMxZxrNKo8qJjT7euXgICat
         58QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZGrkYkWYoLzH5iMc48eZuN5QzKFZuweWVF3z5URSivI=;
        b=fI/HycyLf+5BJ6Y8xU4F/IybwYjXr3DCUkAUuAhrrjGk/sh3DQ8VvAvOMvXG60iDka
         kZunp8UtoQxb/n1K1dB4lkj4uIN0H/QVFYhhIuzwtpyoB2T63WJg1F+5TsYs0LtzZIlu
         x0ZU271iv3DmO7g/XFz+ApjcnjhfFBV/iRNyI565dU0WQijyIAEbEVd/uqkivXbpe1x0
         HSsLrYw/qQXXzQn1rpfiteuGRXxCdze1d+jT0xZuKKM3mp+JisBra03iBUgCr8HIIkgB
         md1+PKAvKiVnufXyndnz9gwomOmQYnvrBJLwh+AitzbNw/F4QVACCZjj5SgZhrBbxsdG
         YsOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H4awcQLf;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id gb1si1662002ejc.89.2021.09.03.10.46.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:46:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=H4awcQLf;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630691191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZGrkYkWYoLzH5iMc48eZuN5QzKFZuweWVF3z5URSivI=;
	b=H4awcQLfaDuBGcrO8nZyKq/jb9ddDrdpx1aVfAWb9rWYQa8hIG+4j4HbqF3Ef5kR/emK8C
	W21fKMzpXB/P47A9hU9XC//JwfXYAIfAboBJ1a+vZqt3ynGV+aE2SbZt5JPGPXzrcCKZCj
	Ju/d5R9MdikYHHozmhXnSJPO6ZHRsbs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-i-SGVzj4PL6ht9YvUsGmjQ-1; Fri, 03 Sep 2021 13:46:30 -0400
X-MC-Unique: i-SGVzj4PL6ht9YvUsGmjQ-1
Received: by mail-wm1-f71.google.com with SMTP id m16-20020a7bca50000000b002ee5287d4bfso38734wml.7
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZGrkYkWYoLzH5iMc48eZuN5QzKFZuweWVF3z5URSivI=;
        b=VtyojMjbsIPyuairooN7vylS3hBLtldY361LDCw7wj9LJzj389CC6yCgRzYbeEsOnt
         gOswedL3tIBopWXoCztK4kM0A+tj6lQR6l8lmJvBBAkIO+uD4aVXoVzMPTEeY6mU+EAQ
         X8egS0VdxNm3+gfxxvhre8VcZZ5WovvLpA9dBqGOUcVgy1imnk4rKDWpsXAdtGHW+122
         TGiMtIqH0rB0OeCzAjirQa/FpSAdv3Zaf5pwwXU/K1F77ZN/DANRasDck1uGETtr/VIQ
         Jha9LUhUBWJ5T01I7ddqIyTbQK4AXfvOSjSdQ7NjJbEbBYGSJUlHQlv6/45NS95pICxA
         jMiA==
X-Gm-Message-State: AOAM530PRW+Qu+/Kw2xyyfsGGgveB7zZgLAATX6C1q/DG7Vv0hQ3cwgZ
	syNIgWqBuvaSi70uj1oSwd+6G/NVcPzfiAOmAeTlZet5VAc+aZ3w6w8dtIFX9AFu7W2qz39W2Xe
	4oFHv1qyYBllXHAmk
X-Received: by 2002:a5d:548e:: with SMTP id h14mr272637wrv.7.1630691189070;
        Fri, 03 Sep 2021 10:46:29 -0700 (PDT)
X-Received: by 2002:a5d:548e:: with SMTP id h14mr272621wrv.7.1630691188926;
        Fri, 03 Sep 2021 10:46:28 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id w9sm5295828wrs.7.2021.09.03.10.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:46:28 -0700 (PDT)
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
Subject: [PATCH v3 14/28] hw/nvram/fw_cfg: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:44:56 +0200
Message-Id: <20210903174510.751630-15-philmd@redhat.com>
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
X-TUID: /nHfwSUUgH/u

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
 hw/nvram/fw_cfg.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 9b8dcca4ead..0c3cfa8a41e 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -205,7 +205,8 @@ static void fw_cfg_bootsplash(FWCfgState *s)
         /* use little endian format */
         bst_le16 = cpu_to_le16(bst_val);
         fw_cfg_add_file(s, "etc/boot-menu-wait",
-                        g_memdup(&bst_le16, sizeof bst_le16), sizeof bst_le16);
+                        g_memdup2(&bst_le16, sizeof bst_le16),
+                        sizeof bst_le16);
     }
 
     /* insert splash file if user configurated */
@@ -260,7 +261,7 @@ static void fw_cfg_reboot(FWCfgState *s)
     }
 
     rt_le32 = cpu_to_le32(rt_val);
-    fw_cfg_add_file(s, "etc/boot-fail-wait", g_memdup(&rt_le32, 4), 4);
+    fw_cfg_add_file(s, "etc/boot-fail-wait", g_memdup2(&rt_le32, 4), 4);
 }
 
 static void fw_cfg_write(FWCfgState *s, uint8_t value)
@@ -755,7 +756,7 @@ void fw_cfg_add_string(FWCfgState *s, uint16_t key, const char *value)
     size_t sz = strlen(value) + 1;
 
     trace_fw_cfg_add_string(key, trace_key_name(key), value);
-    fw_cfg_add_bytes(s, key, g_memdup(value, sz), sz);
+    fw_cfg_add_bytes(s, key, g_memdup2(value, sz), sz);
 }
 
 void fw_cfg_modify_string(FWCfgState *s, uint16_t key, const char *value)
@@ -763,7 +764,7 @@ void fw_cfg_modify_string(FWCfgState *s, uint16_t key, const char *value)
     size_t sz = strlen(value) + 1;
     char *old;
 
-    old = fw_cfg_modify_bytes_read(s, key, g_memdup(value, sz), sz);
+    old = fw_cfg_modify_bytes_read(s, key, g_memdup2(value, sz), sz);
     g_free(old);
 }
 
-- 
2.31.1
