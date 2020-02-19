Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp318581lfp;
        Wed, 19 Feb 2020 02:19:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqxhCqnfjyOHLtSYlJUbc8KA9T01JrzEgUcFaAq4Ex+YwXcuaXcfbQyG+FAQhfTELqtmon86
X-Received: by 2002:a0c:c542:: with SMTP id y2mr19975499qvi.225.1582107580195;
        Wed, 19 Feb 2020 02:19:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582107580; cv=none;
        d=google.com; s=arc-20160816;
        b=Q+5Ql4cf1a0VD/SLbkhjg0QJ5hEQ7ybZloPGxANAFYgfZSoo3RJG40qfygQxbrKie4
         48IQ/LCzu3e6zX+eS17VIzqLHYrNDJba5diSZAKKkoFUiHQFdNhzBJ+jNN4QDxowlU31
         1l8WniF29a1DbMxET5SDJ/v2oLLOEYbfLdlSiuGe+8mfRs+EgEa2q+5XkacA8tcMThT4
         Sw51jBIrrfltbJcsQci/YJjZChzR/W7RTME1RwSGWFewx9Tu0SeuRywGTq0O9dOVGtm8
         ENvEvrBoHzKhSjhfJU+Ct+u4ga3SBMc4ThqCppCPDW3nRdyf+p1bgv7Ud0WBI7hJAK8+
         aohQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=PFsqoNtMwwMhOdu5Gaiec5bTn2ZkXh+vTZ3AMn9hD3o=;
        b=XBVMJIp4fgrVje0iCcMCoJL7ry36wdY6kSz3YQhwr834IsVwNp0Xm4htvRJvDWwa8L
         bCV8kcezzGysY+aNo8Ww3cEM8KViV891H+atqdDsiCN6nffBqp0ssVzWQuDAvoutTb43
         YPuzhmK41S+qc074InOc5AYEruE3kYy/RcEKlH3v964Jltnf+Vsa/fL1a81QPBBumzVd
         iXhrk24uIidfaEdCpyFp34OmJe67D25jDuMN3im/QnXTEKxnN3AD4zNvXsuGkbP20dI+
         QOZBQK7n8kfiyFToX66G3i6M6FD652ChmEaxiPWlqJf9tsIlVEP1UOXe00qKuXZNBbRd
         9/Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dk19si723913qvb.106.2020.02.19.02.19.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2020 02:19:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4MSB-0006Sj-IU
	for alex.bennee@linaro.org; Wed, 19 Feb 2020 05:19:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53075)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j4MPS-0003Gz-R4
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 05:16:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j4MPR-0004nv-IJ
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 05:16:50 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:39483)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j4MPM-0004fm-Be; Wed, 19 Feb 2020 05:16:44 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mlvr3-1jmnp73uK3-00izXo; Wed, 19 Feb 2020 11:16:23 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 02/17] Report stringified errno in VFIO related errors
Date: Wed, 19 Feb 2020 11:15:57 +0100
Message-Id: <20200219101612.1033925-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219101612.1033925-1-laurent@vivier.eu>
References: <20200219101612.1033925-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:miPo9U9LAl1Ujii2RdLcxD7t6u0nbFV+zUNhKL3bUOy6NDQLW6M
 WgSi9GpEHUhpHY6FReWRSUkroA0zSIIdSyc0iQP/1jVpYr5ApvmA5s+KGhmQe+4zifk7Bor
 1o1ylaglGus+mK9pJI/hcE6ir80i9DXC6UN4xmVtW+UaRJHY1e60w7CJrzXrZQPh8NIUx8W
 zV8BdzIxTnZJUFC6FwCug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PXnS0Dt/Mp4=:dkbX1XKRpRMA+9rNWq+fep
 jEma+G0M+/EowwBHs/FqfrLGthF55WVBUlKbN5KnI7hnqp5GLWbbwXPG48OaEjSUBFKfFmo+E
 gWrtkpSz41yd66SQ7h0JSrIurSnYmQWdiga/UBJEKRoJEl4SVlK378Jn1gLxkEwBUNqINXSqx
 lrS5BKwEyLwzVYbS54uG8paf9w0385e7CdyAA1JQE6EdpX07+Y/bYPs4lsa9uoK2xLpEH1gqn
 hYG4bGo1XH7IaOmlAt8Z5FPNceSuo252ZlEe+9bqJRgS0GLufm/vU4mF/aGLScR8wM7OUXlc0
 fAXy1nC2e7ID74YhEi9aj07NFPtvtx2y7519o/4LvKniAfmatsZajwZDV51LTYtz/4CXpWj6K
 X1Ifppz9rhBoQEKUEbbL7swbevK/Zt3zajGjeJ+AQOArVOkbScndKoaY5eVlwZLxGNIDaOBtt
 KL1GKTFx/1IEsvAa2FhgEj1V9FdAe8Y8U2+sOlNQjEVmZztj3dtlYP4KDH8edMdZk4W2nAZ3h
 G4ahhtqZyZOBDd/pqQaGza7FPWmhtfGvhAvbsP53+hHJQVywnun/uzXRMG+nT/roXm18BYR0Z
 vo8ftv4bR84REP69K2kVfv88ifphKm9GM+fcp09kniIikfN9ig1Iegblh6mvueH6UvqHm3j8L
 PKHUjgdOn6ugn9ZWWzDvscX6Tn3gQqBQWN3oH9V5kWMMMQvzsCE6ss5W6GFFbUXsbXouJKsj4
 Vlr8YOhE5Dw/WZDpF3Hwd5x/wafBUESzYQCx1bbeXuknvlHxNMmlJ9SttHRwvdACNElHVwIHg
 FJr0iAOF69FLMmfgItrMYTTLpk/6Ycqt09ME+3yBDs7ERNDxEUG5KP8NS2N8ORECAX593F8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Michal Privoznik <mprivozn@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?J=C3=A1n=20Tomko?= <jtomko@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Chris Wulff <crwulff@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0a5UAM5wlO2j

From: Michal Privoznik <mprivozn@redhat.com>

In a few places we report errno formatted as a negative integer.
This is not as user friendly as it can be. Use strerror() and/or
error_setg_errno() instead.

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
Reviewed-by: Ján Tomko <jtomko@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Williamson <alex.williamson@redhat.com>
Message-Id: <4949c3ecf1a32189b8a4b5eb4b0fd04c1122501d.1581674006.git.mprivozn@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/vfio/common.c    | 4 ++--
 util/vfio-helpers.c | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 5ca11488d676..0b3593b3c0c4 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -319,7 +319,7 @@ static int vfio_dma_unmap(VFIOContainer *container,
             unmap.size -= 1ULL << ctz64(container->pgsizes);
             continue;
         }
-        error_report("VFIO_UNMAP_DMA: %d", -errno);
+        error_report("VFIO_UNMAP_DMA failed: %s", strerror(errno));
         return -errno;
     }
 
@@ -352,7 +352,7 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
         return 0;
     }
 
-    error_report("VFIO_MAP_DMA: %d", -errno);
+    error_report("VFIO_MAP_DMA failed: %s", strerror(errno));
     return -errno;
 }
 
diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 813f7ec56427..ddd9a96e7672 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -545,7 +545,7 @@ static int qemu_vfio_do_mapping(QEMUVFIOState *s, void *host, size_t size,
     trace_qemu_vfio_do_mapping(s, host, size, iova);
 
     if (ioctl(s->container, VFIO_IOMMU_MAP_DMA, &dma_map)) {
-        error_report("VFIO_MAP_DMA: %d", -errno);
+        error_report("VFIO_MAP_DMA failed: %s", strerror(errno));
         return -errno;
     }
     return 0;
@@ -570,7 +570,7 @@ static void qemu_vfio_undo_mapping(QEMUVFIOState *s, IOVAMapping *mapping,
     assert(QEMU_IS_ALIGNED(mapping->size, qemu_real_host_page_size));
     assert(index >= 0 && index < s->nr_mappings);
     if (ioctl(s->container, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
-        error_setg(errp, "VFIO_UNMAP_DMA failed: %d", -errno);
+        error_setg_errno(errp, errno, "VFIO_UNMAP_DMA failed");
     }
     memmove(mapping, &s->mappings[index + 1],
             sizeof(s->mappings[0]) * (s->nr_mappings - index - 1));
@@ -669,7 +669,7 @@ int qemu_vfio_dma_reset_temporary(QEMUVFIOState *s)
     trace_qemu_vfio_dma_reset_temporary(s);
     qemu_mutex_lock(&s->lock);
     if (ioctl(s->container, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
-        error_report("VFIO_UNMAP_DMA: %d", -errno);
+        error_report("VFIO_UNMAP_DMA failed: %s", strerror(errno));
         qemu_mutex_unlock(&s->lock);
         return -errno;
     }
-- 
2.24.1

