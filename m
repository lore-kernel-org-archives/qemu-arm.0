Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1516238lfb;
        Fri, 3 Sep 2021 10:47:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2tyVcZRm1C6P/Ns7z9UruejNVuhlSIN/dmlzPfhquvmTAT5czu1TF7HeKh/ggepgKCONc
X-Received: by 2002:a17:906:d541:: with SMTP id cr1mr35509ejc.81.1630691227463;
        Fri, 03 Sep 2021 10:47:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630691227; cv=none;
        d=google.com; s=arc-20160816;
        b=uVmFtGkBPh4ozmgHH7UNdPEMXXYEQQRSAzIrckrnwZzRZZajtLmp/KELD/rfXqtLN3
         adiQ3HzpYW/0Mo7Q530k56lb/MZhIMcEh92dDVfMhSqGuokoRtfXWqj+HA3tAHa/9dBn
         eVoj3jJjCXQSpGkH3s6RCCQoJ4h/7+EIXa+QaoVdq8gEyFbNWI52V3BM3UZLBT0BwbtB
         6IwHsoFyDnyEeLNnt1HMErYyJK0bOkA4KVBYLJHg0WsGmOmbErleDSGHkIt0/7FtJ/PE
         o/8x/yBFURtY1Kc9wojV6I+0wB/C/eSbfEL+puEXSH/Yve3aJAUUk3TG/hUPIK3UgNOI
         Ad6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5jTTyRIRdKRcyyksDhIQtsIfP0HdMwBPVkpA2Kky8G4=;
        b=DiI8vcUgrS2LXQGG4EZHh1fCFQDSn4p9YDFUicS7FEgq7kTm6BH6EDQ5efjCO+XN6k
         yVOWMpTGvzXX9aZOzElpLs43EoTAoPFQ13eN6w3kJTBv+JURb/cZXeczgDIuK9+ELrlR
         aSKRqG29lOkXWO1S/N9A7SlJYdWR0J7icxmKfQP1CEPL8RS1kKR7ch8CZ2/MHslikxC1
         NO7uUipU5sN/tufAffxuXyx9DAaD6ydBLK8RppPfw1DZK81NNg98NbMrvifsbLMPdfIA
         xOrJlvY8nHv1qs+d0NAJNnFNuLAi996C/cKV1lbhbeeht+umC5Bxb9jqTQVPuCwiXDBS
         Ithw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GxsIH6JH;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id 5si5829359eji.628.2021.09.03.10.47.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:47:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GxsIH6JH;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630691226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5jTTyRIRdKRcyyksDhIQtsIfP0HdMwBPVkpA2Kky8G4=;
	b=GxsIH6JH6nOXF9N8bLwN654/Q7X9Us4dZuKNtT/NMU4rjHiCRKzLjCfwKl7BbXisHGOWp5
	K3mCjvRrthmndzOhJPXNQOnzmyFZp+GUEV+BCZheum0K7MsFl6h4APMC/KM7hKAYOv4EV0
	/Ht5RSWeCPhcAMydHxYdn3vIBvc1NL0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-dcssUwXKM0m4E6oWL-BALA-1; Fri, 03 Sep 2021 13:47:01 -0400
X-MC-Unique: dcssUwXKM0m4E6oWL-BALA-1
Received: by mail-wm1-f69.google.com with SMTP id m22-20020a7bcb96000000b002f7b840d9dcso53345wmi.1
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5jTTyRIRdKRcyyksDhIQtsIfP0HdMwBPVkpA2Kky8G4=;
        b=AEzfEFl7sr2sI038MhsrzFbhDB1TOBZ8d4XYR7/MUUq8g1zwnpl1w6IGJhuG94vk65
         6X8HslhQe4NLDoD4+2UEfOWKwhFdzT13W8BUkhVQYsK/sDmaxXGkl5LzyK3pwmCLPZu9
         ixAqbLTbJWeZJ71aGmIo3owyZZcAuPQfBDdlB0JAndEKSxaoUOn/4U+34hPOGYIvW+w+
         p5i77vjpHCSls7VmRi6zmFKAKwqxp060VbvXD+svv70qr20C8/AXvCz0KP56XNitcWPe
         FzIR+d+mVqcUQ0qKe+161TcNwo6dz57IGWctm0imrATUZZYKU3Ee3gpR2O0ynszXQgY3
         xtdw==
X-Gm-Message-State: AOAM532JHqEX/M6IdiCskySs+OqMq1VJggWSl23WZBrG24Pttsq2N6St
	IfDBdPcajgvbRKUgHkpuovPVsQ1GmUuHINt2K01wDt0NooaNMHBJCVRy0buMIixEX7AFIDWYn2G
	t4rVVMPriYqUjh1tZ
X-Received: by 2002:a5d:61c1:: with SMTP id q1mr274619wrv.87.1630691220284;
        Fri, 03 Sep 2021 10:47:00 -0700 (PDT)
X-Received: by 2002:a5d:61c1:: with SMTP id q1mr274603wrv.87.1630691220144;
        Fri, 03 Sep 2021 10:47:00 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id d145sm85215wmd.3.2021.09.03.10.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:46:59 -0700 (PDT)
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
Subject: [PATCH v3 20/28] net/colo: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:45:02 +0200
Message-Id: <20210903174510.751630-21-philmd@redhat.com>
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
X-TUID: Xc+nMkhH1u4e

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

Replace g_memdup() by the safer g_memdup2() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 net/colo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/colo.c b/net/colo.c
index 3a3e6e89a0c..c04a7fe6dbb 100644
--- a/net/colo.c
+++ b/net/colo.c
@@ -159,7 +159,7 @@ Packet *packet_new(const void *data, int size, int vnet_hdr_len)
 {
     Packet *pkt = g_slice_new0(Packet);
 
-    pkt->data = g_memdup(data, size);
+    pkt->data = g_memdup2(data, size);
     pkt->size = size;
     pkt->creation_ms = qemu_clock_get_ms(QEMU_CLOCK_HOST);
     pkt->vnet_hdr_len = vnet_hdr_len;
@@ -214,7 +214,7 @@ Connection *connection_get(GHashTable *connection_track_table,
     Connection *conn = g_hash_table_lookup(connection_track_table, key);
 
     if (conn == NULL) {
-        ConnectionKey *new_key = g_memdup(key, sizeof(*key));
+        ConnectionKey *new_key = g_memdup2(key, sizeof(*key));
 
         conn = connection_new(key);
 
-- 
2.31.1
