Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1516430lfb;
        Fri, 3 Sep 2021 10:47:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyb2KeOHxeBQctOnufRt6SHMV9hfIiQAiQ+XtApzYXbLsIj2vY1CXdKsE3+riWz9AqBi2yR
X-Received: by 2002:a17:907:3f91:: with SMTP id hr17mr49293ejc.496.1630691244286;
        Fri, 03 Sep 2021 10:47:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630691244; cv=none;
        d=google.com; s=arc-20160816;
        b=wB+6R+8MVd5rBpd9I5wGhGMGM0p/LJGnIf/pm1eHEt/P1nf4ezw32xS3NitzbNC1eg
         LuvpsaZEdqh2B45CyONuOS87SwlH5tbcVtauG6iKlsnLiDUwSG6DOu/xnv7nVKTUkXYp
         5HOLPDxq36Vp1ICMgJd/lRJldCeU1747fbrZ6EGRsfDWDnokByOgD6a/CKXDxCYcwYSR
         OOcQPe92vI44oiAHTGpQ2ciBruRjfcsAUYMuOwlP41ALh9JjvFdD9oGo45M2V5lQ2Y8I
         oTGOGENdR4IMkDjHrioCwhNczqLUFMraseKHBkbq3t34mMMu35spd5xJ7nJZfdhaFkre
         zsRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=HfBgU8tXBhRtj+0DsLha9N1gD6ohGgwq/9K/iXISLUs=;
        b=OFwb2aQYt3iICiyO9ysJLnEWWq7zfi6MgpYx9qQ8Alwa/ZScL9EWjwPN1nfF0L8gZj
         TwotamhzUK4u3pMMqx6FW++nCTeQu8+ZVZQrXEzxJJu/1E0EXVcm6vegDB7/C2XGKMZU
         3vpOQjr5h6PLk+4AN4rA3ibgNsI8uoD+iusFEp+Mvt31wdWVbXrvC66XZgyvSg4j+QoX
         0zG8sAr1gIN0Yv+FEkR7oDO5D82R/WYgHAPCx1V+daN5SbNsIK4mOPn1K/I3QFL2P4do
         waF+gTTytKj98M9LrirY1AXEfgGVEKr/ExGrmptbjrtCDQl5pMv0stZmtQK1Z/c0Nqk4
         ZAzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NkOypPdd;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id h26si176297eds.384.2021.09.03.10.47.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:47:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NkOypPdd;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630691243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HfBgU8tXBhRtj+0DsLha9N1gD6ohGgwq/9K/iXISLUs=;
	b=NkOypPddGVL624tO6W65wIrMl/rmTmUViikmVCHHPvWXdbbohm0Sp9+w3uos3V1z+QRcMq
	ZgPqZqFEuQL2+FKuBPe2qXCoyphQ9+pSEHQVioRasvPqQJPipd/mSkzf9GqUi29BJvHdrm
	qKja2RikYKl146ajP/QwF5kU8yF+HrY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-NYlDZjgUN-Gw5nBLQp5DiQ-1; Fri, 03 Sep 2021 13:47:22 -0400
X-MC-Unique: NYlDZjgUN-Gw5nBLQp5DiQ-1
Received: by mail-wm1-f71.google.com with SMTP id w25-20020a1cf6190000b0290252505ddd56so2144384wmc.3
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HfBgU8tXBhRtj+0DsLha9N1gD6ohGgwq/9K/iXISLUs=;
        b=bLScwjHXXf9HFnO5n8IhuP3b2yXCd0CihXVnuzYg7uOJYkJvyTNz2MPCLb4ylzeq0T
         okS4AlsIU84z+8xhUgn34u3G3aa3fTLcfzsrKWurYwR3wU126mP6vqEmV5eJuJ7MPSgT
         upLohmpgFVWTaiKF3SXoJhSAPErMgzTcsYTIITOoVz/s7P3BcojJWAmHxjsRTxOTBeUe
         OZOBemmtr0jaEG88Pu6FdByxMVYzg0TVTKZ6nmq8PgfklHkTyWzupy10syRHgdpjGfpT
         si3xYphBl4JYs6IFWql3k0F5nw+OE10zr6okMyND1XinT2ATMfx9Uktc2QTVzXsierBj
         HjQg==
X-Gm-Message-State: AOAM532HPgw42eawDlCm5Onu4gNVpqdMYez/WFjv8c1yaiSWh5Hhnm30
	HeStn9jOAMrLYQK5BRaLIjEkNOKFzStV2RSrlALgJouyUiO5E0HpOHpIUQbWvQolPxQV6qPaB08
	1OrVYmoW88ghTuqth
X-Received: by 2002:a1c:202:: with SMTP id 2mr40984wmc.122.1630691240958;
        Fri, 03 Sep 2021 10:47:20 -0700 (PDT)
X-Received: by 2002:a1c:202:: with SMTP id 2mr40964wmc.122.1630691240736;
        Fri, 03 Sep 2021 10:47:20 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id b4sm5373991wrp.33.2021.09.03.10.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:47:20 -0700 (PDT)
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
Subject: [PATCH v3 24/28] tests/qtest: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:45:06 +0200
Message-Id: <20210903174510.751630-25-philmd@redhat.com>
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
X-TUID: eGsi1AfYfnM0

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
 tests/qtest/libqos/ahci.c   | 6 +++---
 tests/qtest/libqos/qgraph.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/libqos/ahci.c b/tests/qtest/libqos/ahci.c
index fba3e7a954e..eaa2096512e 100644
--- a/tests/qtest/libqos/ahci.c
+++ b/tests/qtest/libqos/ahci.c
@@ -639,8 +639,8 @@ void ahci_exec(AHCIQState *ahci, uint8_t port,
     AHCIOpts *opts;
     uint64_t buffer_in;
 
-    opts = g_memdup((opts_in == NULL ? &default_opts : opts_in),
-                    sizeof(AHCIOpts));
+    opts = g_memdup2((opts_in == NULL ? &default_opts : opts_in),
+                     sizeof(AHCIOpts));
 
     buffer_in = opts->buffer;
 
@@ -860,7 +860,7 @@ AHCICommand *ahci_command_create(uint8_t command_name)
     g_assert(!props->ncq || props->lba48);
 
     /* Defaults and book-keeping */
-    cmd->props = g_memdup(props, sizeof(AHCICommandProp));
+    cmd->props = g_memdup2(props, sizeof(AHCICommandProp));
     cmd->name = command_name;
     cmd->xbytes = props->size;
     cmd->prd_size = 4096;
diff --git a/tests/qtest/libqos/qgraph.c b/tests/qtest/libqos/qgraph.c
index d1dc4919305..109ff04e1e8 100644
--- a/tests/qtest/libqos/qgraph.c
+++ b/tests/qtest/libqos/qgraph.c
@@ -93,7 +93,7 @@ static void add_edge(const char *source, const char *dest,
     edge->type = type;
     edge->dest = g_strdup(dest);
     edge->edge_name = g_strdup(opts->edge_name ?: dest);
-    edge->arg = g_memdup(opts->arg, opts->size_arg);
+    edge->arg = g_memdup2(opts->arg, opts->size_arg);
 
     edge->before_cmd_line =
         opts->before_cmd_line ? g_strconcat(" ", opts->before_cmd_line, NULL) : NULL;
-- 
2.31.1
