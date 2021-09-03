Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1174965lfb;
        Fri, 3 Sep 2021 04:08:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCQ5B9y4hhLCcLQQX0gzW0YxTQGyYOFHLFz2rWKabjHv0V7Oc+N+/o6KUupEpCVetOkvl8
X-Received: by 2002:a17:906:1615:: with SMTP id m21mr3631959ejd.279.1630667338648;
        Fri, 03 Sep 2021 04:08:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667338; cv=none;
        d=google.com; s=arc-20160816;
        b=ShA34Cy8WygSNZCGqZfLA0YiABfraKwhNzGNsPF1JSsPYgFi+dECxDnbOV6vpTZVht
         //L7UdsEBEAPyvsklar3OFiWJzaL0Ii18uzQ9lRXr/K7426VgmmNGIF5IgPEVdADka1J
         +VxqW8Z5obYsdNzP4SrSHMx90UAPDJTimylZwJaQVGCQbVbDKbiof9kr67TFphmdKGNB
         hpRYXEGwxCQAEwGQg+yrKiogG4CzwAbUn/ku1FpZgwWiT88wYfNnnALlEIW1CFzd7W31
         NK22HxHa3V+DRHQXQ6yNkbwWDx3WsgvZ+7UymSkfPv/JPs/aslG1/JcOhVTbKZOVmvIs
         yT8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=e+/T5ni6234ihtWfiY6ChgUlClrUNMBebZZu1LShGeE=;
        b=BUCAft1G7ChN+hxxDs9hJn45o4Gv37FVpcWcnQ+n8+tDg2W6U81ixlYDJJUwZNGSV1
         dc3Ew3tLI4rVB7hIUh+lYGEqxv/1dtb/Xgw3S48MdR1tAgnst9UiKkuCzmY25OoVbGTV
         6oqhRnsXxCmcHgHTcJ+/gbePP1QRCII193PuV1xdvdJUnEzIDHxU0HbdUrQRJ8OseXz0
         UI4aE3i7nvcVHrHioV9yWk13M+lYP5zAMDg9bXs4ftE4f+4fVLSEb/bu0cVx8G4+pnCh
         2AofAkwN6+ZR72sZ3gJHPFg/nz76zUWSpTSqA1+OV866BC9z0mA4dfGtRZwxPIbSitwa
         OcnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I9czOIEx;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id qb2si5459723ejc.134.2021.09.03.04.08.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:08:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I9czOIEx;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e+/T5ni6234ihtWfiY6ChgUlClrUNMBebZZu1LShGeE=;
	b=I9czOIExIrB9X0nSaDFSM4J2Z1Pbu2cK1FcV8/tBjpiyiLjwwlnHXPmQ4ToEljB7Mq+djt
	KF/ABxajLCyupQ7i51Az3SHTL0WEtk3101pyBHYjIJ2NsRtd2hIjeiOurI9r1jfqHgrGKk
	3Kzt2r5o4IAXFUKKLPqj5l2WuCcaUD4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-l7k5ux9WMJmsM7GSycXkjA-1; Fri, 03 Sep 2021 07:08:54 -0400
X-MC-Unique: l7k5ux9WMJmsM7GSycXkjA-1
Received: by mail-wr1-f71.google.com with SMTP id h6-20020a5d4fc6000000b00157503046afso1451670wrw.3
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 04:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e+/T5ni6234ihtWfiY6ChgUlClrUNMBebZZu1LShGeE=;
        b=S27usvVF71TMd+S2vPVznrGT7jnd6BrhHZlOJDnCaF9OvK2lYDapAtAPzsaf7muxeW
         QXFjjqCUZX6zx0FiAK8+ClEuI/BkLs7eedu0S7v/X8B7+sksyc1vFHk4Qn0wEff0voOl
         Cwd3ijz8X9RMDtgxTLYUIWhGmO6CgCgFgnDBrGj+g7FDnlE1NYKZ2ViUa2j/baFLmoVe
         +nfcopgMFkHXCHBLi0HufSVziNpkkIdwFzfOkTVEDXenavUMqkGjt3ZSYCZ7nXackVt6
         51Jq3KE6Wuk4UmJjJQm1VoVIdX2NY5uz9oN8jdUv7qycAuLaKcT6TkOeEZXqNhnpQI0o
         Ox2Q==
X-Gm-Message-State: AOAM530yKk2qIdPiiyBNLXFW0cJmwXSI6CTbKsDauo32Ax6a5D3eljPI
	PZZyiT1bNI+k4n8lhMihJ9knXTRGPmz9uPPUKpsXD4vByXRsgPFfl001FFlF96y3n8Zx+2FpHdN
	fOfxw6hHmdz916lW2
X-Received: by 2002:adf:816f:: with SMTP id 102mr3412375wrm.368.1630667333528;
        Fri, 03 Sep 2021 04:08:53 -0700 (PDT)
X-Received: by 2002:adf:816f:: with SMTP id 102mr3412332wrm.368.1630667333320;
        Fri, 03 Sep 2021 04:08:53 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id h16sm4386547wre.52.2021.09.03.04.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:08:52 -0700 (PDT)
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
Subject: [RFC PATCH 19/28] hw/virtio: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:53 +0200
Message-Id: <20210903110702.588291-20-philmd@redhat.com>
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
X-TUID: anc19Td/EtcF

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
Should we check in_num/out_num in range?
---
 hw/net/virtio-net.c       | 3 ++-
 hw/virtio/virtio-crypto.c | 7 ++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 16d20cdee52..8fa23d5f941 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1449,7 +1449,8 @@ static void virtio_net_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
         }
 
         iov_cnt = elem->out_num;
-        iov2 = iov = g_memdup(elem->out_sg, sizeof(struct iovec) * elem->out_num);
+        iov2 = iov = g_memdup2_qemu(elem->out_sg,
+                                    sizeof(struct iovec) * elem->out_num);
         s = iov_to_buf(iov, iov_cnt, 0, &ctrl, sizeof(ctrl));
         iov_discard_front(&iov, &iov_cnt, sizeof(ctrl));
         if (s != sizeof(ctrl)) {
diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
index 54f9bbb789c..43c1a39e469 100644
--- a/hw/virtio/virtio-crypto.c
+++ b/hw/virtio/virtio-crypto.c
@@ -242,7 +242,8 @@ static void virtio_crypto_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
         }
 
         out_num = elem->out_num;
-        out_iov_copy = g_memdup(elem->out_sg, sizeof(out_iov[0]) * out_num);
+        out_iov_copy = g_memdup2_qemu(elem->out_sg,
+                                      sizeof(out_iov[0]) * out_num);
         out_iov = out_iov_copy;
 
         in_num = elem->in_num;
@@ -605,11 +606,11 @@ virtio_crypto_handle_request(VirtIOCryptoReq *request)
     }
 
     out_num = elem->out_num;
-    out_iov_copy = g_memdup(elem->out_sg, sizeof(out_iov[0]) * out_num);
+    out_iov_copy = g_memdup2_qemu(elem->out_sg, sizeof(out_iov[0]) * out_num);
     out_iov = out_iov_copy;
 
     in_num = elem->in_num;
-    in_iov_copy = g_memdup(elem->in_sg, sizeof(in_iov[0]) * in_num);
+    in_iov_copy = g_memdup2_qemu(elem->in_sg, sizeof(in_iov[0]) * in_num);
     in_iov = in_iov_copy;
 
     if (unlikely(iov_to_buf(out_iov, out_num, 0, &req, sizeof(req))
-- 
2.31.1
