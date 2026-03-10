Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFFDEB107E
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Mar 2026 21:29:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w04ch-0002Ov-Kd; Tue, 10 Mar 2026 17:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <1774596582@qq.com>) id 1w00Cd-0002O3-DV
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 12:45:03 -0400
Received: from xmbghk7.mail.qq.com ([43.163.128.47])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <1774596582@qq.com>) id 1w00CY-0006o1-75
 for qemu-arm@nongnu.org; Tue, 10 Mar 2026 12:45:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1773161091; bh=bhYWjbESGv/4DDIYvz7RH9wyRqoJb+xGspW5tAxbKeY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=HfQ4p4+LQEVBwOaXq1zojUdaZxokG1wo+LkgYwPelpHH6Wnd6qUGZrZqsF05HkZhr
 uqjEKzZBcIj3ont21jSUCiF9tk7733JdD1btHCmYFfMTXyLI4fwcWbFR/6gHAjs2Ox
 x7F8oiBZNNfqbw1+vUu774vB4TMROEOI1GbsFqpU=
Received: from dt-VM.localdomain ([175.152.130.74])
 by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
 id B30B5C9F; Wed, 11 Mar 2026 00:44:48 +0800
X-QQ-mid: xmsmtpt1773161090tk4qhjqew
Message-ID: <tencent_A60F5E8CDFA01275080C16D510212203DA07@qq.com>
X-QQ-XMAILINFO: OZebYClYfzV+oHTdAt6NIqGZ0w/XHRYlG///CaMzGuLa0zMbjYCKGHlFEFwjID
 2RNKMMppG/TCx/9vN5pc5799Fj7LwfKhxO83c/BqkULKmADy3c07h0vx7BuW1bgVkX3gIMle122L
 3hGKyzgb6PXj7LDi+6CNHAvLN3ikvD920IGX6ZFIDfegsUJhaafsCcEw+St6rrdfZnD5lfKVDDMv
 Gywj4rkqLizSiT74N0xLn8k6IQVNPUwWAuLi94RUdkR4FMA0PohAgoEhXM4Y14rmZu5dHSUWNv0X
 DGICaLnDy2r0dJGy8t/rnND3vOTKMlEoujg+9B4fZ9HidLYrvqTwtCcsJCovHbUMpSB9OOVKGZVA
 1XbDcd2/JraMvvLeWZhG2WafQud3/xQNt7JyiDedgtQWALSMhcVG9ZFlbevyMk9Aezikz+NUPbPE
 eQOAPytP0e/LogybmdlbTnmjNkXUSh1iceQ/Zj9VH1aTHvp0gzKr+fLeHD2XU7zUacKehez3OJ/P
 KCGPiQtaCdeq5iMB6Hx5TvvOi99qfBX1+T4++g0AG6CRhHjZH5fWPtcved+cSmmCDlJ47vvTDIzZ
 qGo8IHTqEq6gbsTd3Mbypspswa5wXdbVVjXZS8cN/5SvoP0AIKQnvbct3UxCIEx10uGvdXPoN4a5
 HTx1cfcg5Vx5O0a5Eq8LkwWQhPAjrHFOdUFPmbE9Q1kTjtW/F+6gemqL078I8qK5/W3awtlsnZXl
 jY680G31K5rdlgo5Tk6WVabsVdKyNKaiOzqwHPQkRr4BQQMKzAiEEBknZ2R3TG6HzCjv60HO+cBP
 3AQ2+UwuVcZ81ktXymi4F4rurI9WXIpaVRHlYtIlFCefu0K5OnQfqiNYXpaxFmt2aD1JaKIvhz8K
 7jPffaI/sDFsuJe9KpBtLlQH1FHW8URVlNLOXrT46EtuLGLca/iSJnZHqquYppN2+I5fOQHPERSk
 VEhWR17uvo2C+OJ5uEIhroLVa40ri/CyCXGVv7xzVaAmoXHRWQRs1anYR2SHosl05QpbeRE/K+z1
 O7vbtZmOd1C5uBA/h21A6TUobvwQ0UbAHIzRhIHUyC4r6hViJWGkiQ09ACx54=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: 1774596582@qq.com
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,
	TaoDing <1774596582@qq.com>
Subject: [PATCH v1 1/1] Fix the bug where the PL080 transfer complete
 interrupt is not generated. Fix the bug where the PL080 LLI is not 32-bit
 aligned. Fix the bug when PL080's source and destination widths
 (swidth/dwidth) are inconsistent.
Date: Wed, 11 Mar 2026 00:41:07 +0800
X-OQ-MSGID: <f60050ed84d7b7972f8adbb0ff923f6adea7294c.1773159339.git.1774596582@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1773159339.git.1774596582@qq.com>
References: <cover.1773159339.git.1774596582@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=43.163.128.47; envelope-from=1774596582@qq.com;
 helo=xmbghk7.mail.qq.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


