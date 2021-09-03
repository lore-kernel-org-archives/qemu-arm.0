Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1175066lfb;
        Fri, 3 Sep 2021 04:09:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDqkGHUbUvowhJZS+5W8H9bCXDdmH6D5ftsHUCjUmjQtEbR4e/vawMCYMlqAvxytNnUKSh
X-Received: by 2002:a50:cc04:: with SMTP id m4mr3377460edi.358.1630667344305;
        Fri, 03 Sep 2021 04:09:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667344; cv=none;
        d=google.com; s=arc-20160816;
        b=p69E+ZQV58kbRcZ2hsGyYlfpUS8M/o2sF6Qm3VLOoJ8HwWoMUSXSSpiLpQQmI7kyvb
         rN8TZWVSq5ueGeUyoBh5mcdOLNJY8hgeu98mhkexBmKQx7K+or9+lTrnuq81bWi2o0Ed
         lWPb1iJQvR623Xn9XJVK7Bukquu0MD0NB5lH8fsaqjmkgldlbjpPTpk78ZYa1ezShM98
         CHyRJklPi+o7FaWw9nj7VlqNifFL1K/NNC75hevZFddYXDY69Cvw4txRFa2yP84vtm5L
         O5djhdAj2ndYXJ+A37Ipl/AADoM2Mxr7vU1Xt92CSBJ7Yapv9hZ5Rx/Hc/+O31Ng3dwv
         IBVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6LOA6vxWsxNeyRV6PCApiN2cj9fcdeFYW29H3LS1FGk=;
        b=gGnCM0uUIbybkEY9hjSI/Jt0HR648wvAqyCCMbGB0VQLpXvrnJ/WmE4y31f10A80yC
         XLxSP0Su8aTPgtwSVGgGVZERej+7wMv4CAuKG3CO4IvIupevPZ63UgUc+bjChmJ3/KFs
         dwtJURmz+LqiElD+7MyEgVGLmTeJGgEZLVfpBp5v8IeUG66bpWQv98lIgOnlUtM8SWm8
         7OpJrcVHoMpNH5EAxBZ/iKrDiS+O2FhHolcvkAa6QX3kNzpP2cItk+WNVY/o8DYONBvf
         ugfjNY+tBmp1fCmBm4FQLgbLLJUJabjMcSkZNeDXL8va+Jm7xdoWLgQp8+sCT3XouhO0
         gGaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=db3IG+Fj;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id mp29si5294029ejc.290.2021.09.03.04.09.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:09:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=db3IG+Fj;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6LOA6vxWsxNeyRV6PCApiN2cj9fcdeFYW29H3LS1FGk=;
	b=db3IG+FjfcQHSJPnHeWKcnwexTtVA2U3uMonys5q62hgfLSOQ5/nb6oVoaReNobap5zcXl
	yHoyhXK6vAGIqU0pnU7xdA4isPAAXpoNwqDQKiO6W8CwJg3v1rCZdl3Jb/QklrcYHssP7y
	k2h5b3GEjteslainNlOUsnAX9xEcoOs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-_nU3qCUfOO2wm4nkPwHCcA-1; Fri, 03 Sep 2021 07:09:00 -0400
X-MC-Unique: _nU3qCUfOO2wm4nkPwHCcA-1
Received: by mail-wr1-f71.google.com with SMTP id h15-20020adff18f000000b001574654fbc2so1460628wro.10
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 04:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6LOA6vxWsxNeyRV6PCApiN2cj9fcdeFYW29H3LS1FGk=;
        b=p8XErPzFambNwwQtHHaPIElD748wKnDVX1XnpYhktFbvvN7SmrD8gT7BJ6Xzh2+yg5
         eJnGsYnP0BwzCPemvD35ehUQ4i1CRIpVs6+lgaLnGbtvMyMbq4vFXmPmO5NpKjDjjEz+
         3h0af3Byw6ePooRPKNpPrXzLahktly7+L4LEyuKsvB04Ww9oxFAwtNqnAAugVysU3E66
         vLVDj0EapRGZqaKQQTDcD+MmbK8BnUfO1ng1QEsxqpMoJoLLaaGNJYQ1e0mku4ZiJijO
         7EDje9nM2Aa3jeL0E2Gjdb2PSpFRNIaVXETloy70Dv2s9V6zfSjXZ7rgr4Uv2YbuQVEt
         rd5Q==
X-Gm-Message-State: AOAM533WPHAGKkJpNSx01DJOdydza5Sordu9SBlSnjkiTVBoFnJTf4+9
	YXV7MfO4Dds/QD2ac4H7OBocHM9L9K7BKDRwvyD6FetqjKiVzQXjlEY/z47f8fHivcBa2VLPnky
	5+PdwZ9ixw9Adiyie
X-Received: by 2002:adf:c54a:: with SMTP id s10mr3382744wrf.405.1630667339109;
        Fri, 03 Sep 2021 04:08:59 -0700 (PDT)
X-Received: by 2002:adf:c54a:: with SMTP id s10mr3382702wrf.405.1630667338948;
        Fri, 03 Sep 2021 04:08:58 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id e2sm4370145wra.40.2021.09.03.04.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:08:58 -0700 (PDT)
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
Subject: [PATCH 20/28] net/colo: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:54 +0200
Message-Id: <20210903110702.588291-21-philmd@redhat.com>
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
X-TUID: 5uE+uYpIo1t3

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

packet_new() is called from packet_enqueue() with size being 32-bit
(of type SocketReadState::packet_len).

Replace g_memdup() by the safer g_memdup2_qemu() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 net/colo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/colo.c b/net/colo.c
index 3a3e6e89a0c..cfe37b19eac 100644
--- a/net/colo.c
+++ b/net/colo.c
@@ -159,7 +159,7 @@ Packet *packet_new(const void *data, int size, int vnet_hdr_len)
 {
     Packet *pkt = g_slice_new0(Packet);
 
-    pkt->data = g_memdup(data, size);
+    pkt->data = g_memdup2_qemu(data, size);
     pkt->size = size;
     pkt->creation_ms = qemu_clock_get_ms(QEMU_CLOCK_HOST);
     pkt->vnet_hdr_len = vnet_hdr_len;
@@ -214,7 +214,7 @@ Connection *connection_get(GHashTable *connection_track_table,
     Connection *conn = g_hash_table_lookup(connection_track_table, key);
 
     if (conn == NULL) {
-        ConnectionKey *new_key = g_memdup(key, sizeof(*key));
+        ConnectionKey *new_key = g_memdup2_qemu(key, sizeof(*key));
 
         conn = connection_new(key);
 
-- 
2.31.1
