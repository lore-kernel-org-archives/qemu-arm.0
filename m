Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1174497lfb;
        Fri, 3 Sep 2021 04:08:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2ajjewcRh9aC9SNBsIFiDGobTEZGgcYCPsqc32826vj6IxlEzYdtXB4z7l1B/tDyNoN7m
X-Received: by 2002:aa7:c64d:: with SMTP id z13mr3347643edr.349.1630667304797;
        Fri, 03 Sep 2021 04:08:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667304; cv=none;
        d=google.com; s=arc-20160816;
        b=itVbV8iEuX7Jk45HVnNXtPjGB1/f1zUhdZKsC0O39s86HvT7W4hpLXzA8AA/jrKi1k
         kiL6dyP3xpYvtD6ga0v5V7bVyAAma0l/0diky4VQgZVBn2bMWXHiQu41JMb2fW3fqTBr
         Hg9Rocx6kutHzxzL7xVlGr4T6eFZTmnipMQ+TO/wIGC/1stNv4Z0y8fdyEDRs+Kyfrud
         OKGM4QuSU/fiCSHI8WOAJoqTsDYkHtxiRBxal+WWezyFcAbDdki8r04xQhQDum+8afKX
         AaQJVCR7nkAZTolNoxQhoYnOfSLsQl7luwpK76U0XzAfGzs4e4LrtI3aowuYpdPeRmzH
         dy+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9Eu7asELFex4yFplfKK/zMZmk6Z93QlAJxAwuUJzsvI=;
        b=K4S82Swh6CvxsSixcln8giJbIILiTPM7CIKaYxM6qoSfmsQuFcmUuKqbnU/fg9S+LP
         CKM+M1Alsw5ls0nghTwA8N8u5MpVbjW3cookA7d6yxt+t3l2AngalYnlQVOi4/i+W2Ee
         iiJf92omhCpr5DmEYLF81AA3tLdEKefq9XheiapQMyDGKlrEOvX6fEpOquj5vQOiTIuq
         kISomisK3dDmsl/Yu7PxZz0oXi+8na7+QJGcOKEKFaIPn9X7JSVQoKvt1SAHW71o6eBD
         dlcWHf9ElueIxStsaL6ZrJ5XJBegqC+sGAVnaWeJre8uH0cXS1fjSO7ut+FczcF5/vA1
         6SUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="hD+/KMZR";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id go17si3887295ejc.354.2021.09.03.04.08.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:08:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="hD+/KMZR";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Eu7asELFex4yFplfKK/zMZmk6Z93QlAJxAwuUJzsvI=;
	b=hD+/KMZRivgT+04kbbBRVUqucBhAqRsA4f+iMSIuiUDSierdGG3Q/mbBfpwlTsJyQEftym
	DSR0yRAW7Pou1JxB6CIs/jRn4ieDYh0+mI/V9gLifyENUzAne57CT2oUC6+eR8XNOaEVR7
	DA14VmeG+Op0qGPMLiFm1GOAKBTAQn8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-6yspAjcYNWSWBygXpSjspg-1; Fri, 03 Sep 2021 07:08:20 -0400
X-MC-Unique: 6yspAjcYNWSWBygXpSjspg-1
Received: by mail-wm1-f71.google.com with SMTP id n16-20020a1c7210000000b002ea2ed60dc6so1719549wmc.0
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 04:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9Eu7asELFex4yFplfKK/zMZmk6Z93QlAJxAwuUJzsvI=;
        b=lLJaO3WxCzJhVwGn/jkzyY9f4Ripo2TtJy9ErU1tzTGbu20oZsZutyo/dkyokvaqyf
         Psch6jxD1K9XwBx2R/M4MMIA2jvJKFiSDRALtpTmtZks2rz9HUnwM4xBrSFe1GvoYxWD
         Diy+dcclIYcahlY+cNK7psLvlBiiaLHJ4JGRpxX5GyBoVBAQW5TIHN0rzM8/U99ahCTt
         Vg78rUphIwiM8zoY8MI9HYP8R8/TOw0nOb0yI0SIzz260rEcxRUJuREtaugM7G7Wj2t2
         LcWvDjUNstJpt7NHp3cwhOKQ7EepjpcC2VAT1ul/RelhJ35SAi1wboWqM8330yv7hXuJ
         X7lw==
X-Gm-Message-State: AOAM531XTIgTNBQ+DisIC65XnMfHokBtdFQxcXHqQprg9DZXsRBQyqZC
	SW/Gv37XfTxJGHw+pRo1PwUXi75FcgSyw8CH+zTa/6uW/qsVw84IbmJTOW9rz3tJOogFQhoVXcU
	iF4o6yzsXmS6FDS8O
X-Received: by 2002:a1c:3102:: with SMTP id x2mr7947454wmx.122.1630667299684;
        Fri, 03 Sep 2021 04:08:19 -0700 (PDT)
X-Received: by 2002:a1c:3102:: with SMTP id x2mr7947440wmx.122.1630667299523;
        Fri, 03 Sep 2021 04:08:19 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id d7sm4401782wrs.39.2021.09.03.04.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:08:19 -0700 (PDT)
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
Subject: [PATCH 13/28] hw/net/eepro100: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:47 +0200
Message-Id: <20210903110702.588291-14-philmd@redhat.com>
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
X-TUID: uPr/IhTr8NsK

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
 hw/net/eepro100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index 16e95ef9cc9..ed2bc54c052 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -1872,7 +1872,7 @@ static void e100_nic_realize(PCIDevice *pci_dev, Error **errp)
 
     qemu_register_reset(nic_reset, s);
 
-    s->vmstate = g_memdup(&vmstate_eepro100, sizeof(vmstate_eepro100));
+    s->vmstate = g_memdup2_qemu(&vmstate_eepro100, sizeof(vmstate_eepro100));
     s->vmstate->name = qemu_get_queue(s->nic)->model;
     vmstate_register(VMSTATE_IF(&pci_dev->qdev), VMSTATE_INSTANCE_ID_ANY,
                      s->vmstate, s);
-- 
2.31.1
