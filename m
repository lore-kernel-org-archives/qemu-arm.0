Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1516314lfb;
        Fri, 3 Sep 2021 10:47:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6nQCnoo00TLjTOOPNVjKTBxbeL6uDc1Fz81Gp2H9oAF61J0Z4xg1vodM4nE2tCn6L4CnV
X-Received: by 2002:a17:907:7601:: with SMTP id jx1mr36819ejc.69.1630691233794;
        Fri, 03 Sep 2021 10:47:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630691233; cv=none;
        d=google.com; s=arc-20160816;
        b=NeDYQCuNQRCMrq9RRbkzhBgDkC3oONfBjm6uNrA8h4RMPs/C7pJbrj+vwXDMr48xVR
         KHVKC8xnSOrCHHMATRwa7P7QkePp1NBJ4WVmPfM5v8eVehwE+WdQ8NTAWN5cLoa/Vsx5
         2I8lOIANSttHoa1qch7LVOizshrcjdDcFu48+tytHvvldxG37CbVN8sTvT9Yut9nwvlv
         GiiYuStPgYPN4XQ5DVWu57dEfIfgGiE+QSF2QJTtWvMmLaMijwjKV+UB/r6RAjki4+cv
         /enjPiV+aqbiGBo7g+3kJyQl2tIUzqRgzAPOLzyrsYS5fm2kxqb49oTSgpyqD5jMFyWa
         /9+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1D5rERJEHNGMGGp+1t4xLb9P3Gyvmnka2+4rie4dvUA=;
        b=m+7mpMACurOAdgstPqIjy5IUEIlwFS+dAxOk5VZsVlzRou81VX7Rm6KNRwaPcdTGx7
         UjAY+5X+LbPQi9Ym4q/aMYCJYcbAyXRxktO0pVQGA1B2nYKMOnXAJXCrvQ3jSx5VvbK0
         nNvtS8RbdJ0jBHuo0U8LlyrTGXjagE2Yh+6IP36VjiHsoc26bOI9sn2uG/WvTLVRNQIp
         8R75GfP9P8l2AryA7mZbAyIAhn60WYN6C8R4k7XjQT0lbtSNw1no/rk1cQ3Px21afw+3
         vUkPPyPBdpcmHJV/8iSR59p9wF+7f0Pxk+W1XD5KliZlBe4fd9tyK/gm0KloqU7qTZ4T
         cYfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F8e5Y4v0;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id b13si231509ede.91.2021.09.03.10.47.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:47:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F8e5Y4v0;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630691232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1D5rERJEHNGMGGp+1t4xLb9P3Gyvmnka2+4rie4dvUA=;
	b=F8e5Y4v0O/4vGo3Gg+vjCHieMmcLsY5dBAYjv/PYdpnEivwBizTH5R+LNyUxhrpMfqdoU0
	wDNIRmcIS6BUX521fZqy793IBe5YgiHkRjKssCM1B4bmLp/MZ30GsodGOTBx0pT0tdm7xW
	VAVDsdjwle/JgKgpYkXqPySveOcNAp0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-rMszuJSiMaqL-Yqw3gvZ4w-1; Fri, 03 Sep 2021 13:47:11 -0400
X-MC-Unique: rMszuJSiMaqL-Yqw3gvZ4w-1
Received: by mail-wr1-f70.google.com with SMTP id h1-20020adffd41000000b0015931e17ccfso1813315wrs.18
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1D5rERJEHNGMGGp+1t4xLb9P3Gyvmnka2+4rie4dvUA=;
        b=JaPAILQBGjaGzvlHmge3VRT1kJKJZBKM9ttAqvhj7aAEkaqUiOih8Kl32w0gHmUf9n
         lXjujLRFN7gS3HvLsRouU1JNt2AAGDIU/0Qtx1avSbqOtrlx8JyUtdthhhAOW8vvEekl
         4Gpg2w10INnAzcClpOd38uVa2JMfr5wrAhk8mwNZbGPLBH1cRCpB6eCu+UNLuZFMByPa
         EKg/vUoAQB4hNmDm8ejVz1E8GMiCNRS8yLX1Gkqju5XyJ3JXGClRUorbZaRq2Cpsact+
         H3rMQTNGXkPTXOHz2Fa1o3PLu1erBRHNgwhEE342rXlcc+vowIXlcQgC+y+wsxWfNIT1
         6xLA==
X-Gm-Message-State: AOAM5322TiOWPUjEWXfX8pEZb7ZMc5ZWCnIGesfPYV4vfzc3mrIop0Ai
	IvlHbE/j2N3xFw1ozog0hgMjnCc5foJYjlx2LW980vkxlrz1gQZRDN6HOIXhUF9g25dI00mZx35
	NBNrbZKBnl8Zew8kn
X-Received: by 2002:a1c:91:: with SMTP id 139mr42795wma.116.1630691230545;
        Fri, 03 Sep 2021 10:47:10 -0700 (PDT)
X-Received: by 2002:a1c:91:: with SMTP id 139mr42779wma.116.1630691230386;
        Fri, 03 Sep 2021 10:47:10 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id d24sm25941wmb.35.2021.09.03.10.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:47:10 -0700 (PDT)
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
Subject: [RFC PATCH v3 22/28] linux-user: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:45:04 +0200
Message-Id: <20210903174510.751630-23-philmd@redhat.com>
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
X-TUID: lV5uLNnaSkPh

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
do_open_by_handle_at() doesn't check:

    size + sizeof(struct file_handle) < 4GiB
---
 linux-user/syscall.c | 2 +-
 linux-user/uaccess.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ccd3892b2df..d3701007cb3 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7665,7 +7665,7 @@ static abi_long do_open_by_handle_at(abi_long mount_fd, abi_long handle,
         return -TARGET_EFAULT;
     }
 
-    fh = g_memdup(target_fh, total_size);
+    fh = g_memdup2(target_fh, total_size);
     fh->handle_bytes = size;
     fh->handle_type = tswap32(target_fh->handle_type);
 
diff --git a/linux-user/uaccess.c b/linux-user/uaccess.c
index 6a5b029607c..49eddbf4a4d 100644
--- a/linux-user/uaccess.c
+++ b/linux-user/uaccess.c
@@ -15,7 +15,7 @@ void *lock_user(int type, abi_ulong guest_addr, ssize_t len, bool copy)
     host_addr = g2h_untagged(guest_addr);
 #ifdef DEBUG_REMAP
     if (copy) {
-        host_addr = g_memdup(host_addr, len);
+        host_addr = g_memdup2(host_addr, len);
     } else {
         host_addr = g_malloc0(len);
     }
-- 
2.31.1
