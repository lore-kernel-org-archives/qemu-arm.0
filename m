Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49ECDCD8CB9
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 11:01:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXGev-0006X6-LW; Wed, 10 Jun 2026 06:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1wXGeX-0005oo-RF
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 06:59:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1wXGeU-0000cL-8T
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 06:59:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781089157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FjXNi19ZJmavNuiphzSk5VdGv3UJju9zSxL7sC1u9eQ=;
 b=ALqNFfRoGQJKQr1QFVGaeSXFXI2JOBbjUlbaIRXA9kXZziFASTAdzBR6474ZVkcrEaTqcG
 o6hwyaaKgHSSGbJOKMsgLImffgxwvVUBSHXOLSIkd6BPrIseKJVIl86C8JKbExcymlQEtj
 bciyyEvnhq3cIYxzLdEFXPE/fzqyQLs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-144-0EyDtP-nNRqu0S7ECQg69g-1; Wed,
 10 Jun 2026 06:59:15 -0400
X-MC-Unique: 0EyDtP-nNRqu0S7ECQg69g-1
X-Mimecast-MFC-AGG-ID: 0EyDtP-nNRqu0S7ECQg69g_1781089153
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A22281955DE8; Wed, 10 Jun 2026 10:59:13 +0000 (UTC)
Received: from localhost (unknown [10.44.24.21])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 23EC1180057F; Wed, 10 Jun 2026 10:59:11 +0000 (UTC)
From: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Date: Wed, 10 Jun 2026 14:57:02 +0400
Subject: [PATCH v2 20/22] ui/spice: switch LED handling to Notifier-based
 input API
MIME-Version: 1.0
Message-Id: <20260610-ui-input-v2-20-f68452dd6a22@redhat.com>
References: <20260610-ui-input-v2-0-f68452dd6a22@redhat.com>
In-Reply-To: <20260610-ui-input-v2-0-f68452dd6a22@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Jan Kiszka <jan.kiszka@web.de>, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 qemu-ppc@nongnu.org, Thomas Huth <th.huth+qemu@posteo.eu>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1471;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=mhLxwyrNkZYzaYRF+D3AbBaHWTrkuxc49OGXzxkMtOY=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqKUMCnb4Bo3gNGOQn1irC+xQi0mPyyFRTo8Pm9
 +iQbrN/TIiJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCailDAgAKCRDa6OEJdZac
 5XUyD/0SCIjpEBWkO8xBU0TVxP1bu+/fXDYq6UYA9nkPrccpCacusiYp4aQNDpv+RDzKAK4NDzN
 9+fOHGngmJGJQwkm2egvOoX6d3f1Ob1geSONl+qA82eLjm03VubZf2K1s+nb8ZDl7ebjHXeizpR
 PeXDt6kmF0fo9tmUybuIur3Bf+yH7uhIDHl/uAFLLcc+A0wLZQDTASUuY9QH95/uoi7s0hWkh++
 kclqKfJcVctlHnB++GhTyHKxZ3fzTUevlJtlbbLh1kfvzaf/RiEEY0nTJYXl+gAROiCF9GrHee1
 EhyGTD/IDRbEqoI/BqHST9esPcK2BvfgZvq+mQ/vsEjGofjl1aMjmWMZs7t/nw90NICe4QFXs3p
 hRlGXIdsauTXhtGrYNhB5KNqyisvbK8LlnWmJGKx2qpU97MT9qhq1Y5+SkuSkYYnnI7hbmCKXaL
 RfAZzgw3JfjRC9+joNwahQgls1x66ZXCyyfiXuKhmVOHq9eqHWfLE+nbQsCrzu8MCQ6sjDWEt3I
 RaAgEBS8LuEenqIHRFtGftKB3LCNcmbJgDPAS5brIIDgIL8Vi413dBpsVGZH+EfxCkM2a94Dj15
 Tb36HZqjz6hJPTmT9i0POA35YWbRaFjq8OyZ1TDDFC+8bOqUG0UaM0Gz8qk0JS9cDu3NetFiiFG
 ktUMy2rdZiphlWA==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: awMdw_ovutIOh_sgX3KGwoTdQYt1xDDKvsymun_InfA_1781089153
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/spice-input.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/ui/spice-input.c b/ui/spice-input.c
index f0bb915fd77..f5329b8aed9 100644
--- a/ui/spice-input.c
+++ b/ui/spice-input.c
@@ -33,6 +33,7 @@ typedef struct QemuSpiceKbd {
     int ledstate;
     bool emul0;
     size_t pauseseq;
+    Notifier led_notifier;
 } QemuSpiceKbd;
 
 static void kbd_push_key(SpiceKbdInstance *sin, uint8_t frag);
@@ -86,9 +87,11 @@ static uint8_t kbd_get_leds(SpiceKbdInstance *sin)
     return kbd->ledstate;
 }
 
-static void kbd_leds(void *opaque, int ledstate)
+static void kbd_leds(Notifier *notifier, void *data)
 {
-    QemuSpiceKbd *kbd = opaque;
+    QemuSpiceKbd *kbd = container_of(notifier, QemuSpiceKbd, led_notifier);
+    /* spice has no associated console support */
+    int ledstate = qemu_input_get_led(NULL);
 
     kbd->ledstate = 0;
     if (ledstate & QEMU_SCROLL_LOCK_LED) {
@@ -247,7 +250,8 @@ void qemu_spice_input_init(void)
     kbd = g_malloc0(sizeof(*kbd));
     kbd->sin.base.sif = &kbd_interface.base;
     qemu_spice.add_interface(&kbd->sin.base);
-    qemu_add_led_event_handler(kbd_leds, kbd);
+    kbd->led_notifier.notify = kbd_leds;
+    qemu_input_led_notifier_add(&kbd->led_notifier);
 
     pointer = g_malloc0(sizeof(*pointer));
     pointer->mouse.base.sif  = &mouse_interface.base;

-- 
2.54.0


