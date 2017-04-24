Received: by 10.25.0.144 with SMTP id 138csp1379495lfa;
        Mon, 24 Apr 2017 05:20:12 -0700 (PDT)
X-Received: by 10.55.51.1 with SMTP id z1mr23675009qkz.66.1493036412446;
        Mon, 24 Apr 2017 05:20:12 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o16si17290025qki.132.2017.04.24.05.20.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Apr 2017 05:20:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43851 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d2cyR-0000HP-RA
	for alex.bennee@linaro.org; Mon, 24 Apr 2017 08:20:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42187)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1d2cvl-0006ax-Et
	for qemu-arm@nongnu.org; Mon, 24 Apr 2017 08:17:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1d2cvg-0007P6-Nt
	for qemu-arm@nongnu.org; Mon, 24 Apr 2017 08:17:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48895)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1d2cvg-0007MN-Hu; Mon, 24 Apr 2017 08:17:20 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D4E570727;
	Mon, 24 Apr 2017 12:17:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3D4E570727
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=kraxel@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 3D4E570727
Received: from nilsson.home.kraxel.org (ovpn-116-121.ams2.redhat.com
	[10.36.116.121])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E240FB19D2;
	Mon, 24 Apr 2017 12:17:15 +0000 (UTC)
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id 6888180D72; Mon, 24 Apr 2017 14:17:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 24 Apr 2017 14:17:04 +0200
Message-Id: <20170424121708.31953-10-kraxel@redhat.com>
In-Reply-To: <20170424121708.31953-1-kraxel@redhat.com>
References: <20170424121708.31953-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 24 Apr 2017 12:17:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 09/13] exynos: make display updates thread safe
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	"open list:Exynos" <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5IeLV01AMq/B

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20170421091632.30900-7-kraxel@redhat.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/exynos4210_fimd.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
index e5be713406..fd0b2bec65 100644
--- a/hw/display/exynos4210_fimd.c
+++ b/hw/display/exynos4210_fimd.c
@@ -1263,6 +1263,7 @@ static void exynos4210_fimd_update(void *opaque)
     Exynos4210fimdState *s = (Exynos4210fimdState *)opaque;
     DisplaySurface *surface;
     Exynos4210fimdWindow *w;
+    DirtyBitmapSnapshot *snap;
     int i, line;
     hwaddr fb_line_addr, inc_size;
     int scrn_height;
@@ -1291,10 +1292,12 @@ static void exynos4210_fimd_update(void *opaque)
             memory_region_sync_dirty_bitmap(w->mem_section.mr);
             host_fb_addr = w->host_fb_addr;
             fb_line_addr = w->mem_section.offset_within_region;
+            snap = memory_region_snapshot_and_clear_dirty(w->mem_section.mr,
+                    fb_line_addr, inc_size * scrn_height, DIRTY_MEMORY_VGA);
 
             for (line = 0; line < scrn_height; line++) {
-                is_dirty = memory_region_get_dirty(w->mem_section.mr,
-                            fb_line_addr, scrn_width, DIRTY_MEMORY_VGA);
+                is_dirty = memory_region_snapshot_get_dirty(w->mem_section.mr,
+                            snap, fb_line_addr, scrn_width);
 
                 if (s->invalidate || is_dirty) {
                     if (first_line == -1) {
@@ -1309,9 +1312,7 @@ static void exynos4210_fimd_update(void *opaque)
                 fb_line_addr += inc_size;
                 is_dirty = false;
             }
-            memory_region_reset_dirty(w->mem_section.mr,
-                w->mem_section.offset_within_region,
-                w->fb_len, DIRTY_MEMORY_VGA);
+            g_free(snap);
             blend = true;
         }
     }
-- 
2.9.3

