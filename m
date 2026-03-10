Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451A5EB1076
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Mar 2026 21:29:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w04cg-0002Od-6p; Tue, 10 Mar 2026 17:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <1774596582@qq.com>) id 1w008P-0001Nd-MX
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 12:40:41 -0400
Received: from out162-62-57-210.mail.qq.com ([162.62.57.210])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <1774596582@qq.com>) id 1w008M-00054g-82
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 12:40:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1773160824; bh=bhYWjbESGv/4DDIYvz7RH9wyRqoJb+xGspW5tAxbKeY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=NjY6ItYuV5RTyhkyPK4EJptnAb1Aw8zhBhy+rmEaiTRmqYKx6XVIU1+xzF9t67jfQ
 E+kABF0LBxd5Bn2K4jXlV+tb207i/wUauYzcUpmXz0umUachwLgE1Vjrpp3GR/2niO
 JqDhaw5a/5aLQxmOWjChLJG6AGq9+8jyASzWmsh4=
Received: from dt-VM.localdomain ([175.152.130.74])
 by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
 id A151D2EF; Wed, 11 Mar 2026 00:40:21 +0800
X-QQ-mid: xmsmtpt1773160822ti83h7y50
Message-ID: <tencent_2D20DA592A43C688A4698978137E934A3A09@qq.com>
X-QQ-XMAILINFO: Mi+38GKm5OhVeMkpMh09eg0SaWRTLAguo1ia/4dKW6+vT9tUS71mNqHwA+1lf2
 T++5rCkQdoMCPur4UkAn4qUM1rsDd5iPlvYs2+acDXowoVtBHbD9YGru4oyxxZxTSDFL0oNVEdAB
 loP7xavESE0E5TkCIvKu0efeh+oww0uWWkhYSO7ZnERdK5oUAX91iO27CIgIHvOaf5I5y70d5cZ/
 sJ+bFzV+cQynnM8vsdQopf04fw5AXREQW+yyXs3MJfdgYtPZqPsYK/OMtxayGHD38qrGr1qsT3YP
 z9cEYbK4LJU3khNXTTg641z2YNQQ0XM2lbWL5kB1g7wmAhxviLYS+pxEdBAylZiLVs3sGqhY1F4h
 BOQS0e0KSyM8MgUElGaXPwAyu5Wo8sXow0+qUf8QprHXWJ/rORPH13no1yO55MgVrrk2m64BDAaQ
 ioigqXg/T8OWvwn+BiQ5PaR0up6i9xxCJTFARvNGqPsbJfnFM5vI7x3Y1jU/x1S7JvwsIpECkHFN
 Ms/aFWCVYx8FpcQ6nQ+XbozFigSA1CCuzL8POUk0GTG5v2qbUezMgGvEI8rPvwIfNJSmDOQ1UGAT
 ejilEkaLiFVknKd0c7cKi0NU7b2fCfGJ4bYnF023sCdPS4hSI944YzZ3syEW0KCKHzE1bmlXeykG
 sYhoNS5MWDh6Nu9rIPN6MxvptKTJfsMVMKXNCH/Iw7SzvE/SWlGPab7Z+a70Vx+kAgMsQXxdW1tF
 slZen4E12bRKdZY0ihBt1A9ENgs5qLhztPhA96wiCtUL6ms+B6hXrOeyFICuVK1884rTQ2X+iDac
 neAeEIwdliRlzUDLRxT3+VLyhpzipvvhr8BSttoRDPEANWXcqmziianSXF+DNnQUCvddkMuQ+W9R
 JRzq19pyhQCeMv86dv9Rt2q7KimcSvHpTCdMI9OawMP7XIGYOFhrqW2etwW94VuuAjOy9QXRZ89f
 HTl7dzKJCmUwZ4Ad8q9BbMXQ+6kVj1Ub1Pgdqfq0k=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: 1774596582@qq.com
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,
	TaoDing <1774596582@qq.com>
Subject: [PATCH v1 1/1] Fix the bug where the PL080 transfer complete
 interrupt is not generated. Fix the bug where the PL080 LLI is not 32-bit
 aligned. Fix the bug when PL080's source and destination widths
 (swidth/dwidth) are inconsistent.
Date: Wed, 11 Mar 2026 00:37:26 +0800
X-OQ-MSGID: <f60050ed84d7b7972f8adbb0ff923f6adea7294c.1773159339.git.1774596582@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1773159339.git.1774596582@qq.com>
References: <cover.1773159339.git.1774596582@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=162.62.57.210; envelope-from=1774596582@qq.com;
 helo=out162-62-57-210.mail.qq.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HELO_STATIC_HOST=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 10 Mar 2026 17:28:04 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: TaoDing <1774596582@qq.com>

---
 hw/dma/pl080.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c
index 3f8acb03de..d68a31dced 100644
--- a/hw/dma/pl080.c
+++ b/hw/dma/pl080.c
@@ -102,6 +102,7 @@ static void pl080_run(PL080State *s)
     int size;
     uint8_t buff[4];
     uint32_t req;
+    uint32_t next_lli;
 
     s->tc_mask = 0;
     for (c = 0; c < s->nchannels; c++) {
@@ -164,40 +165,49 @@ again:
                destination widths are different.  */
             swidth = 1 << ((ch->ctrl >> 18) & 7);
             dwidth = 1 << ((ch->ctrl >> 21) & 7);
-            for (n = 0; n < dwidth; n+= swidth) {
+            xsize = (dwidth < swidth) ? swidth : dwidth;
+            xsize = (xsize < size * swidth) ? xsize : (size * swidth);
+            for (n = 0; n < xsize; n+= swidth) {
                 address_space_read(&s->downstream_as, ch->src,
                                    MEMTXATTRS_UNSPECIFIED, buff + n, swidth);
                 if (ch->ctrl & PL080_CCTRL_SI)
                     ch->src += swidth;
             }
-            xsize = (dwidth < swidth) ? swidth : dwidth;
             /* ??? This may pad the value incorrectly for dwidth < 32.  */
-            for (n = 0; n < xsize; n += dwidth) {
-                address_space_write(&s->downstream_as, ch->dest + n,
-                                    MEMTXATTRS_UNSPECIFIED, buff + n, dwidth);
+            if(xsize < dwidth){
+                address_space_write(&s->downstream_as, ch->dest,
+                                        MEMTXATTRS_UNSPECIFIED, buff, xsize);
                 if (ch->ctrl & PL080_CCTRL_DI)
-                    ch->dest += swidth;
+                        ch->dest += xsize;
             }
-
-            size--;
+            else{
+                for (n = 0; n < xsize; n += dwidth) {
+                    address_space_write(&s->downstream_as, ch->dest,
+                                        MEMTXATTRS_UNSPECIFIED, buff + n, dwidth);
+                    if (ch->ctrl & PL080_CCTRL_DI)
+                        ch->dest += dwidth;
+                }
+            }
+            size -= xsize / swidth;
             ch->ctrl = (ch->ctrl & 0xfffff000) | size;
             if (size == 0) {
                 /* Transfer complete.  */
-                if (ch->lli) {
+                next_lli = (ch->lli & ~3);
+                if (next_lli) {
                     ch->src = address_space_ldl_le(&s->downstream_as,
-                                                   ch->lli,
+                                                   next_lli,
                                                    MEMTXATTRS_UNSPECIFIED,
                                                    NULL);
                     ch->dest = address_space_ldl_le(&s->downstream_as,
-                                                    ch->lli + 4,
+                                                    next_lli + 4,
                                                     MEMTXATTRS_UNSPECIFIED,
                                                     NULL);
                     ch->ctrl = address_space_ldl_le(&s->downstream_as,
-                                                    ch->lli + 12,
+                                                    next_lli + 12,
                                                     MEMTXATTRS_UNSPECIFIED,
                                                     NULL);
                     ch->lli = address_space_ldl_le(&s->downstream_as,
-                                                   ch->lli + 8,
+                                                   next_lli + 8,
                                                    MEMTXATTRS_UNSPECIFIED,
                                                    NULL);
                 } else {
@@ -309,6 +319,7 @@ static void pl080_write(void *opaque, hwaddr offset,
         case 4: /* Configuration */
             s->chan[i].conf = value;
             pl080_run(s);
+            pl080_update(s);
             break;
         }
         return;
-- 
2.43.0


