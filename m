Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1515218lfb;
        Fri, 3 Sep 2021 10:45:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZ71212OKQ4jmZj79pwWkwF4vAVUGUbdZFz08ZhZ9zU+cNTiMAtU1grb3IwsGcOsyBTHsG
X-Received: by 2002:aa7:cc02:: with SMTP id q2mr186427edt.154.1630691142009;
        Fri, 03 Sep 2021 10:45:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630691142; cv=none;
        d=google.com; s=arc-20160816;
        b=wC9EHE5fe0ZtsBzU0ZHM8jSF3mLtvmkxdjRZPc7RaPH5SO4W90wD8oVGdDYTtjfSxO
         QMkO6h1xt4KSHgA5o9BRuYuLukJ9CFaN8Bsp7i8X1tCRhUHTzWX1N+uLTNJnaBB6id4C
         fIasOpIY2d49BjDRwuSBUswKFtGCsZswPf17d6t/AVL/A613qWK2eugJepDYH3BXwYAp
         UfFTz/jTntzSSHys8F9QPesLvsNWdIUhc7vE5eRII84VzjDzqYw7kU3yVFrI91L370eU
         RsAv//X/80I1OoaO4s9vwVNBrTd57LRsfqfEGSy3UFMfTamCrpL0UsTnz2huZmiLsyaz
         7MFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rgz4N5sK9eNw2u+qkgd75rHPsNPlAqGemaTOb2TEMto=;
        b=zXtpqvr/ozHoeAsOxuQ10jV6PXxOAbqgGH/EpaQBZ6y10l+pTPv7N7rZD5cr34QjR5
         NCxGdn3UCph7felrJ4TvHheQBAuJMkfcKCISj/Ik7e771qf/I8iOu8SPznWq6wo7jQ5p
         IGV9dh3roFkHc8r2GMgrIJPkMnl7aHgWm7mHOkrhZTCaRHTFt6FYHo2mpzdYn8/rBCXT
         5dnjxGi+odRtTlDsZP1wJwdIXcDffQSXXJ3SIGe9yxrHv9KoDys2ueFFH2P7ACfpJ6qm
         7ppO3Wu9coywfb4KOOEaj44PU/8RgbST+zbhsdpaPYPGZXKE8BoLcZ+NQLCZuvXJWaoP
         EPFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="cJERTV2/";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id a10si5530632ejf.122.2021.09.03.10.45.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:45:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="cJERTV2/";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630691141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rgz4N5sK9eNw2u+qkgd75rHPsNPlAqGemaTOb2TEMto=;
	b=cJERTV2/4zRXVgv4Ix3Aw16xrEdZe0LYqEmbtHtLqnZ9RzRzA0h0WQLlLZ+clEQrTMQa4c
	VW0mi83qV8rq5evqvio+HyDy7LgKTSZPGG4jT68VqlOyJ0gDrag3MERQj66oDaMA8TX5OY
	7iYAaGqBtOMeVJrMUCAk11jn2xPcr9E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-XOb07h1rMaqr7d9FdwPfLQ-1; Fri, 03 Sep 2021 13:45:40 -0400
X-MC-Unique: XOb07h1rMaqr7d9FdwPfLQ-1
Received: by mail-wm1-f71.google.com with SMTP id a201-20020a1c7fd2000000b002e748bf0544so58474wmd.2
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rgz4N5sK9eNw2u+qkgd75rHPsNPlAqGemaTOb2TEMto=;
        b=fVGHI9at1fl6u2yQHPUUhqtI7p7UxvwskwZkslqX/XKWKeGzvx+kdfLbyktal0IfUG
         juP+ER6Wu2pF5CpyM2cLIlL3TZauqDiwcs4bqMS/1XQdJqayuCCgWNxhdM71wjXLTGwt
         WfeC+8TEDw2gdD2suRxryDLfN976uxuNuQ7IyEVh1h2IP/bpicihigqMLhdyeLxamHqg
         x++2uNCzmLGtjakKg1CpfVoPa/ldq8dcnVnDjFRYtVbXvJkJhWe8FH0sZtJ/Sh7iA9eg
         7+HRkiGgFX8QOMYrdMoQN2KnviqHxCbNTZbiXtSX2gVYl+fzBq7TZcRAVq6C3k4CiCTp
         z24g==
X-Gm-Message-State: AOAM531JbDbEcTSz7anu5FYPpYHlocSggTxwwNAnqwfmC5X+0J+/9P0q
	L+osiRBgGb/zOgIsLrEybUss4NVQdBdyC59FHZIhE9Li6HPu/gmGAMVpe8CRxpgNAYxSv1bqTV5
	yhclnlOFlUVB/5uIN
X-Received: by 2002:adf:8b03:: with SMTP id n3mr230463wra.439.1630691139037;
        Fri, 03 Sep 2021 10:45:39 -0700 (PDT)
X-Received: by 2002:adf:8b03:: with SMTP id n3mr230452wra.439.1630691138896;
        Fri, 03 Sep 2021 10:45:38 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id d24sm23436wmb.35.2021.09.03.10.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:45:38 -0700 (PDT)
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
Subject: [PATCH v3 05/28] block/qcow2-bitmap: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:44:47 +0200
Message-Id: <20210903174510.751630-6-philmd@redhat.com>
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
X-TUID: oax9z/EkpYgR

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
 block/qcow2-bitmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index 8fb47315515..218a0dc712a 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -1599,7 +1599,7 @@ bool qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
                            name);
                 goto fail;
             }
-            tb = g_memdup(&bm->table, sizeof(bm->table));
+            tb = g_memdup2(&bm->table, sizeof(bm->table));
             bm->table.offset = 0;
             bm->table.size = 0;
             QSIMPLEQ_INSERT_TAIL(&drop_tables, tb, entry);
-- 
2.31.1
