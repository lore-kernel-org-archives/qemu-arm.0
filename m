Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1515864lfb;
        Fri, 3 Sep 2021 10:46:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDCy3X2ef4SZFGmfd+GtCM97OguxJCo5x4e9hodBNEhATBteLndo5P9UYy8DBo0RYwR72k
X-Received: by 2002:a17:906:3e16:: with SMTP id k22mr63919eji.280.1630691197264;
        Fri, 03 Sep 2021 10:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630691197; cv=none;
        d=google.com; s=arc-20160816;
        b=00rSv0yYxmV+P1BqO0kMnjH3doJQdr+6Idf4CLywZc8riDXUZ91O5WVVxaC+nrLmEf
         WpBVlbqk1iP9QzYD175rzHYXEq9qx9o2/Rt8HT5cudxaAZLwl5ODK71rSD9XO7mOrC55
         8nCVMhX5f+YC3M9nLaGd5ggIAFQJ67ZS0tBayNpxW1XyerhiWzd33T3JOwlFPxY2jSk8
         k0kuLHXKipS6/6DfNs8CGN8dMaFhcBIZ7FDba143h7Pc5Q5sT5XBM2V4djjHt4vOG739
         /8F90xiZPqOoI62t8RGRroX2Kf173mrwS2eiFPICB86Vcq7ae4TbfrC2v5brwnGEsb98
         thBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0QJ+ZJ2wYbkbh5C53mqGRb04DGQVHna3HImowkBrJ1s=;
        b=Frb7xI0BthyL8f61MCnOWItmsJboWfSDyZiBdH44g4jV10QlnUl/98ga1ZazGWHrhB
         uiDJ8IOQjfAMpdhg4aao1Ty6PJSCE9VJy0peZH8neJDAz6W7kpqNErH+iTmPggx4JOCZ
         T0lym43zLzsSaGZVCF7Sw6nJy5eWSTTOJZaEILrLe7UpdrxWWtKrNniYliqO2jRaUi/6
         xrqZX18aifabK2xWUGCFWTkOOg6BmCXW7a25gpIFQF0qXUcrQYslKGKLsdrvdYG3LOB3
         289bNy/RUpyumQazXbDwmtrkrYtYVD+xq6bkNhcMoBP4qHwoWeUxq4jXe2Zl/VbDKl0+
         mf6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZyM7rnV5;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id yc5si1054189ejb.771.2021.09.03.10.46.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:46:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZyM7rnV5;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630691196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0QJ+ZJ2wYbkbh5C53mqGRb04DGQVHna3HImowkBrJ1s=;
	b=ZyM7rnV5ICHIFh5Chkn066jmLPNp5OPd3kknbPdyePncsyMl/uOhOOCUOHox7BVHU92Wdw
	Ckj/YtGdeLFMz4awL5wk1tGYxvyOT758ZzmQNpSyjy98QWXFos5oAKK61bCOLAh1sZ1NgF
	UlQLqB0nuMc2DD3end/4LpTuR5b7UXM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-l9Dc3_nmMsOaL0B9AIkPvQ-1; Fri, 03 Sep 2021 13:46:35 -0400
X-MC-Unique: l9Dc3_nmMsOaL0B9AIkPvQ-1
Received: by mail-wr1-f71.google.com with SMTP id p10-20020a5d68ca000000b001552bf8b9daso1809119wrw.22
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0QJ+ZJ2wYbkbh5C53mqGRb04DGQVHna3HImowkBrJ1s=;
        b=QyETuBuKByrxudj9jW3YMk9H5ceZsxh3RFiGS6OANoXnvbuozeyc69+fUx2fKJUVvx
         mXWycEt7bbhsLytIKIYrHk+oCuAx1lITHgL1iAsZmWIunjrbIURUxeVCBwlDkaEObpjt
         KOIcPneY7LqpG9aCQfcrhBtImo4udjDX4RJWzSaB0g1vkhsD6Iil5ipDRxBu94vNstIQ
         86h5Fm3U12y5JLDCu8mGHls/AN1sDzGNFKPjaw9uwao9bnz7xETiNCuvIYFlB+XD2Qf4
         q9XN4dD0JCcTYQ5rLAGIZLnz6V4UkLfUsUK6CJ9O7ksveRA901LbyGS7hf3j/5bVjPnZ
         M7Gg==
X-Gm-Message-State: AOAM5336QEMMuztAthosAw6q/eOdG+gO9srs4PDwAKac37i2UzPtnILN
	1av/PO0cP/PMPLrjTP6jyn5riOWw3nGX9XdXTjrvWmZj45KtUgnluOaejQHDqwWQo23jpWVoVDS
	0hUQjKBzC7fIugPnn
X-Received: by 2002:a7b:c94f:: with SMTP id i15mr52314wml.58.1630691194083;
        Fri, 03 Sep 2021 10:46:34 -0700 (PDT)
X-Received: by 2002:a7b:c94f:: with SMTP id i15mr52292wml.58.1630691193942;
        Fri, 03 Sep 2021 10:46:33 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id l10sm5820044wrg.50.2021.09.03.10.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:46:33 -0700 (PDT)
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
Subject: [PATCH v3 15/28] hw/scsi/mptsas: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:44:57 +0200
Message-Id: <20210903174510.751630-16-philmd@redhat.com>
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
X-TUID: Ka/NcsGLy13w

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
 hw/scsi/mptsas.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index db3219e7d20..f53ea358161 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -449,7 +449,8 @@ static void mptsas_process_scsi_task_mgmt(MPTSASState *s, MPIMsgSCSITaskMgmt *re
             } else {
                 MPTSASCancelNotifier *notifier;
 
-                reply_async = g_memdup(&reply, sizeof(MPIMsgSCSITaskMgmtReply));
+                reply_async = g_memdup2(&reply,
+                                        sizeof(MPIMsgSCSITaskMgmtReply));
                 reply_async->IOCLogInfo = INT_MAX;
 
                 count = 1;
@@ -476,7 +477,7 @@ static void mptsas_process_scsi_task_mgmt(MPTSASState *s, MPIMsgSCSITaskMgmt *re
             goto out;
         }
 
-        reply_async = g_memdup(&reply, sizeof(MPIMsgSCSITaskMgmtReply));
+        reply_async = g_memdup2(&reply, sizeof(MPIMsgSCSITaskMgmtReply));
         reply_async->IOCLogInfo = INT_MAX;
 
         count = 0;
-- 
2.31.1
