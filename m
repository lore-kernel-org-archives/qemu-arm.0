Received: by 10.25.0.144 with SMTP id 138csp174416lfa;
        Fri, 21 Apr 2017 02:22:34 -0700 (PDT)
X-Received: by 10.55.108.68 with SMTP id h65mr12831613qkc.302.1492766554742;
        Fri, 21 Apr 2017 02:22:34 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d20si8973627qtg.98.2017.04.21.02.22.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Apr 2017 02:22:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58121 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d1Ult-0005tI-T9
	for alex.bennee@linaro.org; Fri, 21 Apr 2017 05:22:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37170)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1d1UgI-0001yA-KI
	for qemu-devel@nongnu.org; Fri, 21 Apr 2017 05:16:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1d1UgH-0001Ir-AS
	for qemu-devel@nongnu.org; Fri, 21 Apr 2017 05:16:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37516)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1d1UgC-0001EI-RG; Fri, 21 Apr 2017 05:16:40 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D2A928DA2E;
	Fri, 21 Apr 2017 09:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D2A928DA2E
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=kraxel@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com D2A928DA2E
Received: from nilsson.home.kraxel.org (ovpn-116-18.ams2.redhat.com
	[10.36.116.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 866AF5C8BB;
	Fri, 21 Apr 2017 09:16:39 +0000 (UTC)
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id 8318580D46; Fri, 21 Apr 2017 11:16:34 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Apr 2017 11:16:29 +0200
Message-Id: <20170421091632.30900-7-kraxel@redhat.com>
In-Reply-To: <20170421091632.30900-1-kraxel@redhat.com>
References: <20170421091632.30900-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 21 Apr 2017 09:16:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 6/9] exynos: make display updates thread safe
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	"open list:Exynos" <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LL/ee6NQkzNf

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

