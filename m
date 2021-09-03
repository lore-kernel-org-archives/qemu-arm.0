Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1515749lfb;
        Fri, 3 Sep 2021 10:46:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx651F5KN9cpDcnp6LJkvjgirSSdP6sqxQMQ9PW3VJZ0YZaNK1HUNCAcc6VDtMTesr6UHxl
X-Received: by 2002:a17:907:76e5:: with SMTP id kg5mr47307ejc.474.1630691187138;
        Fri, 03 Sep 2021 10:46:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630691187; cv=none;
        d=google.com; s=arc-20160816;
        b=MCGSmE5OQkvazREOurX0OQBtGi3vNOFOyOoeqfdRpd0Brg7t2DCa0R+mYdvi0AUlg0
         NQ1v6KOp6ItpcNTgiYoo+hUUk/20feolHG6deByWJjMqUufFIBgGWMy8rUp5wPbyIBLF
         5FSGveTjHDyq4jxDs8a0aH5FWV3Qx+L5siONUSEjo6eGTC8eAU5ZlNwH5vf1yWSqHV9D
         3F2fQkAOthVNwrYAyAmVhqP0McBPxYE2Kj8MJtvq9Tp9P1TU1BmaYxxZ8WPs4H+wQ4jq
         mKbCsAGcnVixCySrvGVXA8oJjuIuNbigPMX8m34wZ3AtraCK5F3ZSAWUhfXsGJN1ejRG
         g1Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2lubK1L7hm9+FJXOL2oDyFlScplW+khcKViFJMmufcU=;
        b=s1tdYAkoUI5TruEhItazf7qW682Ug8o0s1ptfkfZFIqQhjX3wj9crKPa7BuU+guMI8
         Eaq9uHdkClIdMANUu3VeF+ny52F0W+u/0ZvUjEgPp+l7IHJ3UNIKs239UNUTYcXi+tsc
         77DeLyJNrMXSKtbui4iKWbERMgZLaDKYgfH4EVHrHnMytVlJP2yCUmzjlmM7o6Y+N8gR
         5FDBIpFAAg5mszuN+qzqwwjTstJtXUiUsAMrepkMfs6mAGV2puOcxmYDHwjpsJE0pqv8
         WSPUlQ3Wou6H5AhePtqtzWTy2PLvasW8aN7PnHAz4vJrKtv2/0Lolx6IsoQ1I+omVwx3
         vYXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZL+6px4G;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id l17si6095494ejo.585.2021.09.03.10.46.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:46:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZL+6px4G;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630691186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2lubK1L7hm9+FJXOL2oDyFlScplW+khcKViFJMmufcU=;
	b=ZL+6px4G8lKzIc6a54g09cKBpPuNFTp4Ez7FxEeOGPiQMx5kdbXzHUfHT5UcMY4TGTdNEa
	sOqJogTMbm8OFAVPNxrqYCVx6YoqjEzkDGJHjuyc9Oy8dENrTAAU/RurBqhUlWQ2k7EtEn
	ubMv9iu34TX6gDZgkifFhAb7WEz6jlk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-2Ikr8j9-M9qqqEDTK8DBQA-1; Fri, 03 Sep 2021 13:46:25 -0400
X-MC-Unique: 2Ikr8j9-M9qqqEDTK8DBQA-1
Received: by mail-wm1-f70.google.com with SMTP id r4-20020a1c4404000000b002e728beb9fbso41753wma.9
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:46:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2lubK1L7hm9+FJXOL2oDyFlScplW+khcKViFJMmufcU=;
        b=mBDw6ijFonXh6XeFsH2NtXltG3akkLZkD/mrhVH/Y19SRY/mtbtCD47Q7NznyQ/KJp
         XE1rGGi6UWtVb/epMDuGdzW2Y7yYfYZpPdV0SEr4iwmJWoTkT0o/89VHioWB1xMiuH1T
         l1D5GAsetuHeKPZ6qiUn+Zof5oHni6oRzXNnStMiwhY5rroaOLm5ojlejH8MBXM1qVnG
         bQZa4v0ZpqeCLrVRfMAbJQFBU1yXUNgpu+j/kUEUfmjCsPvwfTH7lQ5ZZYW0kQZeYwut
         xxs0eA93GSv3YFZwUqRseKN3EtUe/8AHWDLFoDtlttqhQ9BJyazziUj/f0ZqCJbPCeZ9
         S6Gw==
X-Gm-Message-State: AOAM532G5zLFJ+A2VOVnlxy1pgn5W5ThHcJofDI+WbzEvOgGSRdX0lvN
	uq/f/uI63D6vFXE2JJGig4N1Uz5dpZ5SAI/OGI4L3mtryWsnXRx5v+TF2MNaU0NB37AiquvZhNR
	r+s/eE9lOI+1jsEe6
X-Received: by 2002:a05:600c:1c91:: with SMTP id k17mr44523wms.84.1630691183808;
        Fri, 03 Sep 2021 10:46:23 -0700 (PDT)
X-Received: by 2002:a05:600c:1c91:: with SMTP id k17mr44498wms.84.1630691183579;
        Fri, 03 Sep 2021 10:46:23 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id v21sm5588100wra.92.2021.09.03.10.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:46:23 -0700 (PDT)
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
Subject: [PATCH v3 13/28] hw/net/eepro100: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:44:55 +0200
Message-Id: <20210903174510.751630-14-philmd@redhat.com>
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
X-TUID: P8r8eNPOnmFZ

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
 hw/net/eepro100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index 16e95ef9cc9..a4e67f69752 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -1872,7 +1872,7 @@ static void e100_nic_realize(PCIDevice *pci_dev, Error **errp)
 
     qemu_register_reset(nic_reset, s);
 
-    s->vmstate = g_memdup(&vmstate_eepro100, sizeof(vmstate_eepro100));
+    s->vmstate = g_memdup2(&vmstate_eepro100, sizeof(vmstate_eepro100));
     s->vmstate->name = qemu_get_queue(s->nic)->model;
     vmstate_register(VMSTATE_IF(&pci_dev->qdev), VMSTATE_INSTANCE_ID_ANY,
                      s->vmstate, s);
-- 
2.31.1
