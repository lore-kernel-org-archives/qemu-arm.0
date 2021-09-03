Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1174565lfb;
        Fri, 3 Sep 2021 04:08:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTiUyotnRN79ykSnzsLCw/juV6JMPb84ScH+pChe6Ix3xnwN78Hcwjpx3BPTqLeFvLXN6O
X-Received: by 2002:a17:906:2887:: with SMTP id o7mr3486503ejd.425.1630667310645;
        Fri, 03 Sep 2021 04:08:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667310; cv=none;
        d=google.com; s=arc-20160816;
        b=SMVIMPkti7dpAc9FD4o7olM9aSqvLUCcQi51LaA929bmwIMe1m5GCD8gcx3/MTdTsL
         DdxAGjaxdgnOXLR9gI3CE6gGbH3Vbr4DQPebKY5vCQRSdbrBgaHX2Km9kgPC3vUVS5kL
         5jvPAY19r5S5uYdrLoaFWISy6sK9gGCS1OlAbs4jr+1poluVVIjfKUygNXG12ctEBkq/
         jTF4LP7jqvRmf8LLQZmijxtx39pcjdkSLx8WrSGB9FalSp3W2MvCP6SOn57Ynvnw9skN
         nXTLoiGyMuWt+FcMOhUzMJglc39rHBxDE9wlHqrSuvB/PdhELRasZZDeSR+ofHeXJInE
         ww5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=eD1qqZlm+MV+YIIGwjAnZcGqFrpvQZPW91qRyOYFT9E=;
        b=dJDsS8N2WffN3F9rH/NZ4iB/2l7LamHvlzkI0p4njG1pZOojTncvdo6b4WfWRVql8l
         zzB83RrXcGPxXagz78rmkBkKBEwzLtTXqaqfvA77HCUitYLqfnI8E1i1YKPuevLb3qZ0
         lCVaiJAEhHDv4JNcYJZZaYA21y3FP+w5EvJViEapDgqNlPNhpMiGEPXqur4viEja/Mnt
         Fiw9pcv88zpJ7D0Qalwfo4NJpnJHI03Xgj4HYkWfhbpn4b7wERNMKGeUZxaQqm5G3y90
         V8EaLM4pD+6ov/XG5NVsjMh0oiWjN7seX5/GV2MzJR8A2fxOPcxCnHe+4eeJjcgh9xYs
         /xgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="T/9c5yqQ";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id 13si5079121ejh.534.2021.09.03.04.08.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:08:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="T/9c5yqQ";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eD1qqZlm+MV+YIIGwjAnZcGqFrpvQZPW91qRyOYFT9E=;
	b=T/9c5yqQ6eP5swLQnCvQXLsMvuPlNJiDBFrduqraM/v+WtbMxpy1J1YldzV1dDEdR/Avw8
	/KAoXmQzVZYY6DL75J69COB2YNmCQBaCP+T0ZMBpKEq6T7+JysmED+CpRMxbAi3NMbHyHA
	b02uaqlQjGMdltXG8wSdH/kqdQaOCz4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-BCe3T9hJO-aiXBUYNIvQHA-1; Fri, 03 Sep 2021 07:08:26 -0400
X-MC-Unique: BCe3T9hJO-aiXBUYNIvQHA-1
Received: by mail-wm1-f71.google.com with SMTP id v2-20020a7bcb420000b02902e6b108fcf1so2512581wmj.8
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 04:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eD1qqZlm+MV+YIIGwjAnZcGqFrpvQZPW91qRyOYFT9E=;
        b=EHy1FShFRgSl7p+GlBj2a/+NZB59DHgMED7NDolbEthkMZym6sSwhnrTkj/5OKpPoo
         d+Ys9blywtaq6bb3Sis5W5HM2qTUxlUVh0L8KiuXpro30B2GdHXMVOhaPYhGTgJAy3Cg
         TRuuKr+3u7UhrdxWSF58+veXeAGpun17sGDQ2x4mtW8qHYTWszlZ2oAd61MRNtw3FQny
         N8+oFQjTt/yz97YZ6qJijFUxkGWhd09/yrgTfw4W7WsHoDLsdeJWyyVFU5KX/1vQCFsB
         BO2DuvXTshh3eYS0eBfr05UL+gVjUe1nqvwiU0Ae2qNdXLNtde49ts76muWqfcrbwRY2
         nFDA==
X-Gm-Message-State: AOAM531rtBCl9zqiQmB6qODvnV0vjP+LPN3hLBifhVJ74H+74VD0e4u8
	k/OcSy6vQs05C336bSo70VyF3son4xnu2XFQhHIGbRTz4mr8TaVcTYbRzMPzUKYvGPOGugbQaaS
	jIaE/YecLY1xIRpSy
X-Received: by 2002:a1c:c903:: with SMTP id f3mr7737101wmb.101.1630667305420;
        Fri, 03 Sep 2021 04:08:25 -0700 (PDT)
X-Received: by 2002:a1c:c903:: with SMTP id f3mr7737046wmb.101.1630667305212;
        Fri, 03 Sep 2021 04:08:25 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id t64sm3914121wma.48.2021.09.03.04.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:08:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Roth <michael.roth@amd.com>,
	Zhang Chen <chen.zhang@intel.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Stefan Weil <sw@weilnetz.de>,
	John Snow <jsnow@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-block@nongnu.org,
	Helge Deller <deller@gmx.de>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Peter Xu <peterx@redhat.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Jason Wang <jasowang@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Yuval Shaia <yuval.shaia.ml@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-ppc@nongnu.org,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH 14/28] hw/nvram/fw_cfg: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:48 +0200
Message-Id: <20210903110702.588291-15-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903110702.588291-1-philmd@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: h5DO2cRkOK2F

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2_qemu() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/nvram/fw_cfg.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 9b8dcca4ead..fefcdeb8241 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -205,7 +205,8 @@ static void fw_cfg_bootsplash(FWCfgState *s)
         /* use little endian format */
         bst_le16 = cpu_to_le16(bst_val);
         fw_cfg_add_file(s, "etc/boot-menu-wait",
-                        g_memdup(&bst_le16, sizeof bst_le16), sizeof bst_le16);
+                        g_memdup2_qemu(&bst_le16, sizeof bst_le16),
+                        sizeof bst_le16);
     }
 
     /* insert splash file if user configurated */
@@ -260,7 +261,7 @@ static void fw_cfg_reboot(FWCfgState *s)
     }
 
     rt_le32 = cpu_to_le32(rt_val);
-    fw_cfg_add_file(s, "etc/boot-fail-wait", g_memdup(&rt_le32, 4), 4);
+    fw_cfg_add_file(s, "etc/boot-fail-wait", g_memdup2_qemu(&rt_le32, 4), 4);
 }
 
 static void fw_cfg_write(FWCfgState *s, uint8_t value)
@@ -755,7 +756,7 @@ void fw_cfg_add_string(FWCfgState *s, uint16_t key, const char *value)
     size_t sz = strlen(value) + 1;
 
     trace_fw_cfg_add_string(key, trace_key_name(key), value);
-    fw_cfg_add_bytes(s, key, g_memdup(value, sz), sz);
+    fw_cfg_add_bytes(s, key, g_memdup2_qemu(value, sz), sz);
 }
 
 void fw_cfg_modify_string(FWCfgState *s, uint16_t key, const char *value)
@@ -763,7 +764,7 @@ void fw_cfg_modify_string(FWCfgState *s, uint16_t key, const char *value)
     size_t sz = strlen(value) + 1;
     char *old;
 
-    old = fw_cfg_modify_bytes_read(s, key, g_memdup(value, sz), sz);
+    old = fw_cfg_modify_bytes_read(s, key, g_memdup2_qemu(value, sz), sz);
     g_free(old);
 }
 
-- 
2.31.1
