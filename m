Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1175223lfb;
        Fri, 3 Sep 2021 04:09:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxI+L3EjmIpgEWgl6zgOqclCk917J9OawJYdS+JS/7BTjXueMzQY/IQuAQtsbkM/sKEhm9S
X-Received: by 2002:a17:906:7208:: with SMTP id m8mr3684245ejk.82.1630667353898;
        Fri, 03 Sep 2021 04:09:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667353; cv=none;
        d=google.com; s=arc-20160816;
        b=y4Ka5BMeXPsbFxupAZFJ/lGYm7MPiNkYNkuI8/sHlxEWCZMdwUKz5coqYsyzukzSMi
         5AjaWmg2gdSO+oe34y+kH6dtZRnIsueq5gIvaPZ4GT1NEByJiaCFaxRhqs+ULFe+P3qp
         HvyQWbnk5s3hLIo3WsagBsnCXQcMtIX/kqStUkASg+viRrt49Ve65pv91K//exduYCh1
         uZm+6K6KbotyYu4Y7CeuHim7CrnC1KOoJwyfywKiG2ZJ7Ou2KkmVDr5n9convRQv1suU
         zJk/Vn31esegvXj/FCo45GqD2d8u8+6OzBJnMierhqk6pX8RPiX2+JRgfVIvwr41gMPF
         YEDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oWlYVXKgef7rt8tFGoGOU02/9c4fFsb6XOBLj2EPez0=;
        b=rAOIdWS/tX1W6vDnzoMPmjCxZl9KZYpkRjf1b6hK4Fh4rPG1pA4X7mnLNdmO6Pxyul
         R4l4Zlq/MnvgGltlFAvnC3t93l8PlD9NJUS53VOY2+1r+66QLcNqEVahkPtAh3XVvycL
         4bmx6w9eqvOFxEbqvTdDpihekubfCTQYAJbBibbJ1sjyUe13LBNQrniFzsrBGZNAs00T
         CqS2JZFBPTlwMsTRhcIk9tHCWVQ7CNMKBN6uqIEte5qdkAud4C1JcQ0iL83IWFPSXyot
         Rn+bgw9kzF/4KAkS+SsBjASRBuAPZYpBaMxhInSD2qPHoxNmFNInBNPZsHguMPgcGx99
         IWeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S9iy7IFm;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id v20si5105944ejv.515.2021.09.03.04.09.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:09:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S9iy7IFm;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oWlYVXKgef7rt8tFGoGOU02/9c4fFsb6XOBLj2EPez0=;
	b=S9iy7IFmkrDOr2aQH+yXD8EUGJo7AkU78rqyKiliCq2Un5E7rxrZFd7AHhLFsIeTCT1O68
	KuCXPthuyD4p9pCcs4Kzvn+GHkeDi3T7JXwfyCwyCy7GyWPMF3w2ePnG1Ut0TgapNxsefq
	/t2QlVWxL9ygl+uDbStZGtPONw5e5EA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-swmjJmSbMu2KysiRDHsHSw-1; Fri, 03 Sep 2021 07:09:11 -0400
X-MC-Unique: swmjJmSbMu2KysiRDHsHSw-1
Received: by mail-wr1-f72.google.com with SMTP id h15-20020adff18f000000b001574654fbc2so1460822wro.10
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 04:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oWlYVXKgef7rt8tFGoGOU02/9c4fFsb6XOBLj2EPez0=;
        b=DIxR8v5BnpdKwW34ovpsE7TuuRdZ9aqiqBKC85YeXq+HR7hq5qc9Myl210R1w+FYis
         Q80I+k36pa4iwiLhWC1U4yqsZ74Vulp9KmzRIt7kWYAJ1hA/aUlDQsfGgsxFZGzce3CN
         jN6PfQ9BQ+8gh+2JaVRaLXHmpjRNQehUs4GvPc06MwRidx9QkXkhi/iN68i2f2T0Jz4k
         IiK0HrrpVW8p6L6Eb8RedjjLMF29k7kGyAkdZwyEWXa2oGmEEet/qRlA4wxbvzqYN/Dd
         opRkb0O1Hnfc5PwMp4qVCZg5RXapBefsE9fz8lGfgLsocMuuNcSmWAR9Cz4POHnJ5XmG
         vZnQ==
X-Gm-Message-State: AOAM5322zayp192KfPWqDPlFl5aJPBNmF82mZiZ8pIoQ2xAekcL9OjNe
	7MKKKlGyY9ZOWk86bnsj5oeYu8+B91PJ+EzH0ocxpZETtL2r62WLEz+UEUFiYAgzGc1dBuSrsf0
	cAuJKR1vQGvLgHyQ2
X-Received: by 2002:adf:fb44:: with SMTP id c4mr3357018wrs.179.1630667350186;
        Fri, 03 Sep 2021 04:09:10 -0700 (PDT)
X-Received: by 2002:adf:fb44:: with SMTP id c4mr3356996wrs.179.1630667349988;
        Fri, 03 Sep 2021 04:09:09 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id o21sm4479970wms.32.2021.09.03.04.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:09:09 -0700 (PDT)
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
Subject: [RFC PATCH 22/28] linux-user: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:56 +0200
Message-Id: <20210903110702.588291-23-philmd@redhat.com>
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
X-TUID: TvCJHC07xocM

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
do_open_by_handle_at() doesn't check:

    size + sizeof(struct file_handle) < 4GiB
---
 linux-user/syscall.c | 2 +-
 linux-user/uaccess.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ccd3892b2df..e127927f0b9 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7665,7 +7665,7 @@ static abi_long do_open_by_handle_at(abi_long mount_fd, abi_long handle,
         return -TARGET_EFAULT;
     }
 
-    fh = g_memdup(target_fh, total_size);
+    fh = g_memdup2_qemu(target_fh, total_size);
     fh->handle_bytes = size;
     fh->handle_type = tswap32(target_fh->handle_type);
 
diff --git a/linux-user/uaccess.c b/linux-user/uaccess.c
index 6a5b029607c..80992e2e233 100644
--- a/linux-user/uaccess.c
+++ b/linux-user/uaccess.c
@@ -15,7 +15,7 @@ void *lock_user(int type, abi_ulong guest_addr, ssize_t len, bool copy)
     host_addr = g2h_untagged(guest_addr);
 #ifdef DEBUG_REMAP
     if (copy) {
-        host_addr = g_memdup(host_addr, len);
+        host_addr = g_memdup2_qemu(host_addr, len);
     } else {
         host_addr = g_malloc0(len);
     }
-- 
2.31.1
