Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp556394wru;
        Wed, 3 Jul 2019 02:19:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwze/VluT7CF2VSvOjgRTjHH7S56w+MqikbOdAmbvW9SJ6hNUtZ04WaAYqJQE7/DbhFWqmB
X-Received: by 2002:a17:906:ce21:: with SMTP id sd1mr33976087ejb.189.1562145560744;
        Wed, 03 Jul 2019 02:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562145560; cv=none;
        d=google.com; s=arc-20160816;
        b=DVZmJdhh714+DzqSQrKPVo12NQQ/fwJ8Oqmv9Qtnux5zSWK6Hxy2irUeKT0EIGwdA2
         1hPKXP329JfxbGn6yCgTQsHiIWY64h9PcE8Y8AeDSqqwrvMVu7dQhEkPGTjkwLL6FZlM
         oJLnmqmrweN7bj/tHRLs4C85Sun1C3/O8cR7By801Bu9Kj3G7q5wn1DqjhVgxTXW/rMn
         lVEyzFJf/+In9W8MVOvGS4bN+Ypa37fhXU/BuRkvAOpzhY8lRPV0bGC4M0FsHwTWIb0b
         TxYHIyFF+dchxtNRvRMFHIjdnQvmmGlmZxZRaYWiqOf591ciA+nd0WrZF+bzMyWHBwHk
         UeGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=Vt57MzAgEBZbFMh5C1JRAdJtFs47qFruCIEqxv0k+3c=;
        b=KgyIHKRYJlM1CXmxDcTaFQ3DPSqSuyVkhGBT6Na3sv08OiWmj2/k67PIqD+EhEaTX8
         PM4rY/ipmjOT5tqzbJ6fii4s2dF3vaiG7GXQfLubHBfNhFNzPsnIfbUrP5cG16Z28jo/
         qXw+7WhIw5kDjPv4o4zpztJekSHDKksFGinQIWXPFgREHRiQW8nJgtHyXfJ6rlXBDIPX
         Ro6dGZEyo0hVzBcgzwaF6e6NpkGFbZu7rRWpqURhc+Fye7vL7j6V/ge0DDswG7hBc9q9
         JjC/1zZp/C600qjC6eSL6nd1nbTJjKkC2v7KsvFtyckBT0tk0WpEtXHZvpolcKJhPK0z
         VXnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x14si1304461eju.249.2019.07.03.02.19.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2019 02:19:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hibQ7-00037z-N0
	for alex.bennee@linaro.org; Wed, 03 Jul 2019 05:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55216)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hib2V-0004Hp-BO
 for qemu-arm@nongnu.org; Wed, 03 Jul 2019 04:54:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hib2U-00043R-6N
 for qemu-arm@nongnu.org; Wed, 03 Jul 2019 04:54:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40538)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>)
 id 1hib2U-0002wm-0w; Wed, 03 Jul 2019 04:54:54 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ADD273086203;
 Wed,  3 Jul 2019 08:54:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC29D7D94A;
 Wed,  3 Jul 2019 08:54:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 661C417474; Wed,  3 Jul 2019 10:54:16 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jul 2019 10:54:13 +0200
Message-Id: <20190703085416.21837-2-kraxel@redhat.com>
In-Reply-To: <20190703085416.21837-1-kraxel@redhat.com>
References: <20190703085416.21837-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 03 Jul 2019 08:54:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 1/4] virtio-gpu: fix unmap in error path
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5yIWsKFYEPo+

We land here in case not everything we've asked for could be mapped.
So unmap only the bytes which have actually been mapped.

Also we didn't access anything, so acces_len can be 0.

Reported-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Message-id: 20190628072357.31782-1-kraxel@redhat.com
---
 hw/display/virtio-gpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 2b0f66b1d68d..475a018c027c 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1048,9 +1048,9 @@ static int virtio_gpu_load(QEMUFile *f, void *opaque, size_t size,
                 if (res->iov[i].iov_base) {
                     dma_memory_unmap(VIRTIO_DEVICE(g)->dma_as,
                                      res->iov[i].iov_base,
-                                     res->iov[i].iov_len,
+                                     len,
                                      DMA_DIRECTION_TO_DEVICE,
-                                     res->iov[i].iov_len);
+                                     0);
                 }
                 /* ...and the mappings for previous loop iterations */
                 res->iov_cnt = i;
-- 
2.18.1

