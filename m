Received: by 2002:a0c:f485:0:0:0:0:0 with SMTP id i5csp1082234qvm;
        Tue, 14 Apr 2020 09:55:54 -0700 (PDT)
X-Google-Smtp-Source: APiQypKpuGCSadt1ayFHVdYub5pIS9PG4RnHk2PuthuO6SiGv7G1RqlwSpuUtlocchspbRz7mq+/
X-Received: by 2002:ac8:6902:: with SMTP id e2mr16168842qtr.214.1586883354392;
        Tue, 14 Apr 2020 09:55:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586883354; cv=none;
        d=google.com; s=arc-20160816;
        b=dc0A0xheLc8eqPRIhv0dLHp4w8+lCp59vXeigHCwAbEpraiuvdhThqqWyrl7dekEzl
         Zs/4Bl6kKQW5zSyCKCIj5XTsf7IEqY68dVUB3ISxlfgDbGM2MK8TTgujRt/0kLmKEXjp
         7CH1EoICcHG3hJESVrtNQ4M4pbqoCsW8eq8Wi9AoiRQ1obyloqheMddHIlnk7Z0mFV9Q
         l+KggaJ8n8eUysy5UpckvxgKdvIcm3ucxC8bz1Dciuec1P6aCsXs0JIXIzWcvMNze8js
         Gg4g57yXGyaqC/2G5XC9mE9iX9RlDjAajqqMBR9ndKHRtLvjb+hBf99jn0IBjXdgK0wk
         sI3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PwwyvF6CHPHLQYK0ni4C07URn8wv+xD7OizfGx3R5og=;
        b=WWfi+3erPA8d12zURqCW+frO75bZtFO24drrSJhXksNJlNJqS+58DCA8+pbmV+H014
         rI0OM7Ob2+Xs/6IkvsROIkkB82VPnIEdzaaS9yekRNay2L6DJ22Tkq4VrtwTcF2yi/yz
         4NgAjfaHMwaHLHkQd6samlzQ1gKtAGWl0QykcarUJQN2ARt98uZjcfc/TzTgyZnAkq/U
         GnUlRirvLStI5Pz0ZafhS+BqUqpc8rZh5waVNKTldo88JNGgmwE55vBL/CWwju6c3jBU
         T8AsZ6r/uaTFBPGOIOCWtmIiiPuK99/4E+DKEo81+r4JsXfUPrX86KFnknBTWifLuG8m
         EReQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fGwdIH97;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c131si2851201qkg.59.2020.04.14.09.55.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 09:55:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fGwdIH97;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOOqn-0005zU-UV
	for alex.bennee@linaro.org; Tue, 14 Apr 2020 12:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35065)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jOOnt-0000lq-2o
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 12:52:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jOOns-0004cE-3Y
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 12:52:53 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:41523
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jOLet-0008GZ-VW
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 09:31:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586871083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PwwyvF6CHPHLQYK0ni4C07URn8wv+xD7OizfGx3R5og=;
 b=fGwdIH97qx4S/8MoDdptGB/WaxMutybLUzEZJ/5DhPbXeDEiOQr55WFUPeBUrHleu2VDBy
 ONfZvnB6IsD219XUSNPaVX4RKupaFeGolCdk1hX7VDVk0rUeZmjjX0ubx/1zo+x5aELtxe
 hsguH5IPUCiARWROkAnKxGsy1bfQkQU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-SwfqFmrgPE-m0oxU0g0hvg-1; Tue, 14 Apr 2020 09:31:22 -0400
X-MC-Unique: SwfqFmrgPE-m0oxU0g0hvg-1
Received: by mail-wm1-f71.google.com with SMTP id l21so2406810wmh.2
 for <qemu-arm@nongnu.org>; Tue, 14 Apr 2020 06:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+J7WGWS9eBH3j6xbXcrU1P0OHfkg4KZSoUk6HMMZuss=;
 b=PpHRXXIfVCEk5nfg4jcGJhqxtLr/aGghD/fOFwTz+hyOevkI+QW+qGNYK4ap5Z/V6s
 Z/URzgoGJdmFwXxWKmUl4FsODjdk79UrgI4Sso2ARJyi39WDLG7oadBgGDHyfV6q7jP9
 WK2HUYhch0sHK9BhakMSQTn6laxn/6wGWaEFwYCgisRBz+DMiWdKCYQyR5oAPMeIPNfJ
 ynozx3gewUko02LECS1UucfSZkDopbDL4rvYbo+5N3Z+PLn+fqf3xQtdEDQk9cUnt2L9
 VHTSrcIyu7keFr9WuaspGNatzEAor/cQwq3X7lxnClb3hdmlW/pgGFEZv/yMh7l4DYRh
 GGLQ==
X-Gm-Message-State: AGi0PuYU0vmN8TYVUGSSPuKLHqz5hvyI5rhMPtoXoO4ovsbcAN1jIiwc
 lwiPxo/6xEGLsA/8Vfnvs4/M0aXOU3T0qUj/SMEkiQ10MEKD8MPTEwRg0RsI4UKwDB45McM0fFn
 SfyQ+Yy2Bd+uH
X-Received: by 2002:a5d:43c6:: with SMTP id v6mr23929045wrr.395.1586871080977; 
 Tue, 14 Apr 2020 06:31:20 -0700 (PDT)
X-Received: by 2002:a5d:43c6:: with SMTP id v6mr23929027wrr.395.1586871080810; 
 Tue, 14 Apr 2020 06:31:20 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id a1sm9922751wrn.80.2020.04.14.06.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 06:31:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 05/12] vhost-user-gpu: Release memory returned by
 vu_queue_pop() with free()
Date: Tue, 14 Apr 2020 15:30:45 +0200
Message-Id: <20200414133052.13712-6-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200414133052.13712-1-philmd@redhat.com>
References: <20200414133052.13712-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-stable@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Fabien Chouteau <chouteau@adacore.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Max Filippov <jcmvbkbc@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rK9iapc2dJDO

vu_queue_pop() returns memory that must be freed with free().

Cc: qemu-stable@nongnu.org
Reported-by: Coverity (CID 1421887 ALLOC_FREE_MISMATCH)
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 contrib/vhost-user-gpu/vhost-user-gpu.c | 4 ++--
 contrib/vhost-user-gpu/virgl.c          | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-g=
pu/vhost-user-gpu.c
index b45d2019b4..a019d0a9ac 100644
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
@@ -848,7 +848,7 @@ vg_handle_ctrl(VuDev *dev, int qidx)
             QTAILQ_INSERT_TAIL(&vg->fenceq, cmd, next);
             vg->inflight++;
         } else {
-            g_free(cmd);
+            free(cmd);
         }
     }
 }
@@ -939,7 +939,7 @@ vg_handle_cursor(VuDev *dev, int qidx)
         }
         vu_queue_push(dev, vq, elem, 0);
         vu_queue_notify(dev, vq);
-        g_free(elem);
+        free(elem);
     }
 }
=20
diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/virgl.=
c
index 43413e29df..b0bc22c3c1 100644
--- a/contrib/vhost-user-gpu/virgl.c
+++ b/contrib/vhost-user-gpu/virgl.c
@@ -519,7 +519,7 @@ virgl_write_fence(void *opaque, uint32_t fence)
         g_debug("FENCE %" PRIu64, cmd->cmd_hdr.fence_id);
         vg_ctrl_response_nodata(g, cmd, VIRTIO_GPU_RESP_OK_NODATA);
         QTAILQ_REMOVE(&g->fenceq, cmd, next);
-        g_free(cmd);
+        free(cmd);
         g->inflight--;
     }
 }
--=20
2.21.1

