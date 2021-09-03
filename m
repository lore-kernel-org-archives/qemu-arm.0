Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1516126lfb;
        Fri, 3 Sep 2021 10:46:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPVPkRbD8Eri5dzwOtUqDGQbuoWhNIrtzdwFytg21Hf5zvvB8KLuMygL/YJHjimILQyKL9
X-Received: by 2002:aa7:c1ca:: with SMTP id d10mr183010edp.294.1630691218335;
        Fri, 03 Sep 2021 10:46:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630691218; cv=none;
        d=google.com; s=arc-20160816;
        b=FKErdqIxAlVtV25a1uoKQXl05hd/hJpndGf2k2udokgR/TceUHyByZ9NpgCW2Rccev
         w6aDk73I0cvFSx5+Ux82yxOpvu8T+ElnCRx5WV4tXZ9XnmweergeGAhjtAWclj0qi425
         /itUk/G8MUg4QUBl1SYrL7Zqx7Y9CG2F5Gagj34ihFxdxe3fZdCRgFWy9fdHnmInugoR
         DGri1UMDxl0NNTGZkvrXDFXeYVnaozitnnAduOTHY/Wn+LXsF/B67ZNC/+RMw1iTdW2k
         Jrx8JgCMTD2eBtHjkfrMw1Lma3mmBKIaJZzC+djVfFUoznOPuDWWr+SMCdPtQDIbMJ3X
         qIcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=o2TJ5bgBbqJh6moqyxGQ53K360Y/vHE7RhxA+Q/Y7Gk=;
        b=lIAJW8ATVlC41Y4C3f2MlOzzYA50Ud2FCVIy1RBnX0jyD8CzZiNtoFWOtYvslgm7Bl
         Wrk3LlN7v5xtBKSb+KX9iCQ02oN5o1RdTlnY9gNosLqgScJ68nfl1oSY6X70MYkV9kc8
         JS91wk1apAKczzfKGiKTzYEVos8hSiF+3+yrZmgtVEMhGqnXmRZmQxWIcF+s13plRTqI
         lgs29O4915AH/1SFJhAXhtsgrDrokJQStVeWp8SFFwo0p0N2vBXawBxQdNfcMMS/3zg3
         Ti6+QTmn2r5yBvhiQCcRl17s4AqqygIdA84Y4uhiUhmW/h8WBJpuGvnze55ScdoCWDxy
         DfJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OdLizQln;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id dp16si1230142ejc.760.2021.09.03.10.46.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:46:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OdLizQln;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630691217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o2TJ5bgBbqJh6moqyxGQ53K360Y/vHE7RhxA+Q/Y7Gk=;
	b=OdLizQlnKCZvb1BHzj0lHC7wZqQ2cKPrwciy4IBWfFDhuzW4+lyy+Va8MRSq/BvF/yBsyG
	1BD9q5m2N3o10TdUN4l0xlpYI4yh5zqhGlOjrUfXgTIJFBwEEGegct5R7UHCXEVDNWlchs
	73Oc1jTTC92k/Cu9N16tOFsJh3DaLQ8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-CD15mYz0M32zrsEKLNpWHA-1; Fri, 03 Sep 2021 13:46:56 -0400
X-MC-Unique: CD15mYz0M32zrsEKLNpWHA-1
Received: by mail-wm1-f71.google.com with SMTP id x125-20020a1c3183000000b002e73f079eefso74372wmx.0
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o2TJ5bgBbqJh6moqyxGQ53K360Y/vHE7RhxA+Q/Y7Gk=;
        b=ECkYUIfozBBOluT91lY0RJ/UhxG0McwNe8fqMD5imbFbi+E5xDLvoRx35o3mGrBrPy
         I0AhHVmAE52itZtY7Y2efQ68xQAckipnXdUMnoeaOOSgtFkV3NXQ7hPXaerq9LUzXr92
         9jsriU4BM07d0YjWqraaM6isT0MqlUp1jjT8tNOcDVBHsd6AjxbhZHxhq3Uu+bqwsqD5
         APYPyMFB/Rn6dCOLs0ys1BiqxHrDowewgOXzo1pSsa9dSPUyRW0ItA+CeuwKxOxBNgQW
         2bwvmN9YSRYwozOGEjsyFG2DFhGaGYxpHq5JM3jy+BgPbiROCjnLZRWv/c/E+FDIayH5
         QmQw==
X-Gm-Message-State: AOAM530EwsBnTkOgOaESq7YVIVAOIc0/QJU2AXCMCeOwbJkAMkrl2r+l
	iPFjBj9QK87jwRCuP/SvfRAXwaqo+nZ+HKXY++KwQFmY0TIKw7SdbQRXNRRAu5mnQTn/i9b6eXt
	imtt3CoR5qrAsoiFS
X-Received: by 2002:a05:600c:3b0e:: with SMTP id m14mr43400wms.118.1630691215088;
        Fri, 03 Sep 2021 10:46:55 -0700 (PDT)
X-Received: by 2002:a05:600c:3b0e:: with SMTP id m14mr43368wms.118.1630691214854;
        Fri, 03 Sep 2021 10:46:54 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id y15sm94518wmi.18.2021.09.03.10.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:46:54 -0700 (PDT)
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
Subject: [RFC PATCH v3 19/28] hw/virtio: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:45:01 +0200
Message-Id: <20210903174510.751630-20-philmd@redhat.com>
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
X-TUID: A19c8XZjsE2+

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
Should we check in_num/out_num in range?
---
 hw/net/virtio-net.c       | 3 ++-
 hw/virtio/virtio-crypto.c | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 16d20cdee52..338fbeb8c57 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1449,7 +1449,8 @@ static void virtio_net_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
         }
 
         iov_cnt = elem->out_num;
-        iov2 = iov = g_memdup(elem->out_sg, sizeof(struct iovec) * elem->out_num);
+        iov2 = iov = g_memdup2(elem->out_sg,
+                               sizeof(struct iovec) * elem->out_num);
         s = iov_to_buf(iov, iov_cnt, 0, &ctrl, sizeof(ctrl));
         iov_discard_front(&iov, &iov_cnt, sizeof(ctrl));
         if (s != sizeof(ctrl)) {
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 54f9bbb789c..59886c1790d 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -242,7 +242,7 @@ static void virtio_crypto_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
         }
 
         out_num = elem->out_num;
-        out_iov_copy = g_memdup(elem->out_sg, sizeof(out_iov[0]) * out_num);
+        out_iov_copy = g_memdup2(elem->out_sg, sizeof(out_iov[0]) * out_num);
         out_iov = out_iov_copy;
 
         in_num = elem->in_num;
@@ -605,11 +605,11 @@ virtio_crypto_handle_request(VirtIOCryptoReq *request)
     }
 
     out_num = elem->out_num;
-    out_iov_copy = g_memdup(elem->out_sg, sizeof(out_iov[0]) * out_num);
+    out_iov_copy = g_memdup2(elem->out_sg, sizeof(out_iov[0]) * out_num);
     out_iov = out_iov_copy;
 
     in_num = elem->in_num;
-    in_iov_copy = g_memdup(elem->in_sg, sizeof(in_iov[0]) * in_num);
+    in_iov_copy = g_memdup2(elem->in_sg, sizeof(in_iov[0]) * in_num);
     in_iov = in_iov_copy;
 
     if (unlikely(iov_to_buf(out_iov, out_num, 0, &req, sizeof(req))
-- 
2.31.1
