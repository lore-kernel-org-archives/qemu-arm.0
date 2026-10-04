Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808EACA5FCE
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 10:31:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDJRB-00051p-2P; Sun, 04 Oct 2026 06:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1xDJR5-0004vu-60
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 06:27:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1xDJR3-0003VG-P8
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 06:27:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1791109633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uzf007Am0iew3g/kMyYf6SBSCtuMdzO1BgnQqYIj7r0=;
 b=TmnrriX1nxkOc3VdDkPyP7ikuOfTX5+bj2dPymbIao0WNk/f/YxgRgTglXq8MR/SRKto3q
 Nnf95eUVrNqy9xqeDbWqOvN+y/beYygeP7cOboMTYws5ukLTaHlfKLnvOYMuQeh0HsbZMA
 S7O/MClDDxA2I0fM73SLwxCxOgpjdLo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-624-6-wRe1uNOpu847cKi8umJA-1; Sun,
 04 Oct 2026 06:27:12 -0400
X-MC-Unique: 6-wRe1uNOpu847cKi8umJA-1
X-Mimecast-MFC-AGG-ID: 6-wRe1uNOpu847cKi8umJA_1791109631
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D700A1800633; Sun,  4 Oct 2026 10:27:10 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 180FE40E; Sun,  4 Oct 2026 10:27:09 +0000 (UTC)
From: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Date: Sun, 04 Oct 2026 14:24:14 +0400
Subject: [PATCH 60/63] hw/input/pl050: remove duplicate class_init assignment
MIME-Version: 1.0
Message-Id: <20261004-issue-4560-v1-60-ccbef537cbeb@redhat.com>
References: <20261004-issue-4560-v1-0-ccbef537cbeb@redhat.com>
In-Reply-To: <20261004-issue-4560-v1-0-ccbef537cbeb@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 Pavee Hui <phui@google.com>, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-arm@nongnu.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=681;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=yriWcmCeTEzYbU/e0HiivHx1Y0LC0UDIsIS0lU8rTl8=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqwiklLRw43+HX6oZ6xNY0rnyyH+2i/H55DDAfE
 83Qk2cG1iiJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCasIpJQAKCRDa6OEJdZac
 5W7DD/98Gf3zsV/pg3/kvGwoCX7i0Th/xRueZwS8He6sLyf4DRTdhuiQupThHAZvoVt7RJqtixR
 g581Moqjqitdg0xa0wP5SBCcGX5ljpdK61BC6X3i/s82mflY7EA4c7T5aExGsm8M+vR1J+PZPmV
 HOfeqQ1QQQyqFnxe1rLQwX4ohTEdLmYu6BWdVJxFlmpnZHfj5K6CLPjIuOLHgWD2wuMvWOIUvjy
 VQDK0HFHpdSjPHEnPw51DVSp9xaHqhJjdzKg+laB0M3pk8Mgx98BheDG0MNnU7L2kHyPfTCdwtS
 14YI6CrFFaJ5pqj0oliP5acBdHZJfUsZCn9D9kSnRTkr+L5ag7KUl60YzI70F0mt4f/jy2H8IBD
 JRwvSdX0UD803imTigyS2VfyhKj/PXzgW0HPMA5qB9FO0LL4z3Dm8mjWTrQVZhTo2A7RJYryfUm
 jqRo+pFqy7Eis1voKVcqCS0jnrd3I8z6QS03oC+bgrMWTYW6BijHxqI+RkPoXHb+FC7eoAUFTUY
 QcVP0nnyt6MdaRxWLzPxhjX2rdlzK/EpsEbqGF0+YxyAWxd81gnu1pIwCoZDj+jr2OWFm8Gb5by
 dI2S+/ie6WKY++0mC2r48P1ubCCzFEZw9zS1ycrDvVZMj5uBtFoa9NPq/1KXZC/1lytanlIz4sL
 7GbNDj9FpUlxLFQ==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: 5gXaYuPHkL4XTL-Pkih7sP8APXUYZBtQ80-CgWviPEM_1791109631
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.337,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The .class_init field was set twice in the TypeInfo struct.

Reported-by: Pavee Hui <phui@google.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/input/pl050.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index 48df2734e269..3731e6969850 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -265,7 +265,6 @@ static const TypeInfo pl050_type_info = {
     .class_init    = pl050_class_init,
     .class_size    = sizeof(PL050DeviceClass),
     .abstract      = true,
-    .class_init    = pl050_class_init,
 };
 
 static void pl050_register_types(void)

-- 
2.56.0.rc0.29.g47ce80527c56


