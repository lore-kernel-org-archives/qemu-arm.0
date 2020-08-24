Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2906839lfy;
        Mon, 24 Aug 2020 15:00:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjPHSoz978qVh6HlhrEmbled2NZHL06oT7nbhUDlW2lJCvC6SHqimofTk/gL8VNNRWie9Y
X-Received: by 2002:a25:d44c:: with SMTP id m73mr10056600ybf.486.1598306454812;
        Mon, 24 Aug 2020 15:00:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598306454; cv=none;
        d=google.com; s=arc-20160816;
        b=Vk3XulicS/fPfoBVAFFVaNP6v7hOO4U77Q7CgZ1RhCXDErYRhFcVXiSrrgt6LowiLE
         r5koHCC361evvP7INotsH7e0F2Z7cZHSk6ED0TjKQ8nWCsCohiCFopeOrLoVZk1gs5XD
         mv+UF35KrqgAjgJ6pv1qXVxL/rESfF0rlUbFZD6Dkr8c9/kGdr0oC+FFs0a0YRCgzSoC
         E9p+6JCL8BEu47VOfa8ZfYQp3E0ZLQbwa0LBUKPb3Tar1leCo4waF37C27xt5sdL5N1k
         bdylUjmEVAY0s/xEXaQfFvuFpGgD7Dx/xNtVvlF0je5d7CJxbrZHfNUnqwPovlSJe4lB
         J6ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uPNiuBnt4wE9oxvow8OKBlKXFlUQDNOzZCom1TY8BjQ=;
        b=KvBk+M69MinTgUMSMx+TRYyPRDNk9cl2s8jASeytTn0IUbgEE8JXq2O3eoyUnFr6Bf
         5rbBdvzTeY+zpPTznSvbCuhd80TCWWpNsf/FzRuYoLIuLXMFxzfrRwqid0eMd9solWZE
         QhTTinLrcivU0kWZVGhEIXG6hROT1hELSofXrG/KlK8Sz4yUcG9GvmVBgKvl0imRw3oV
         HSh40swvatvGIG6SOxs866yjnbfFIor41VYFggnG3tjSV3kYPNGGYVZetWRQfJYG9QPc
         vo0jyJrxrymKvireeTb3Wgyj4ZnpLGJfB1TY9mnxBCKmfTCbAuPlmfufDFyGC4AzWAan
         VkZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UqWxTjgi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d38si13954304ybi.51.2020.08.24.15.00.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 15:00:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UqWxTjgi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAKWL-0006iE-SZ
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 18:00:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAKVY-0006Re-UT
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 18:00:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24191
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAKVW-0008HW-QR
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 18:00:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598306401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uPNiuBnt4wE9oxvow8OKBlKXFlUQDNOzZCom1TY8BjQ=;
 b=UqWxTjgijD40zf7rLfo4mREhY+kGeTBaeKSSocixArdoiZfWkr6SUSA3zWUT+8JkuZWZDk
 Ebc3JLwXcKOhwO9X2nhmXaRcx/ncER/nsBeVt98T9FFm/cEP0LZv3BN+hS5b/buiqSDdm4
 eMg03tO3ih5zu66WtDPtrSwbB0bv6Vg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-g0Hp_cWzPYehIyxQlJ0Rog-1; Mon, 24 Aug 2020 17:59:58 -0400
X-MC-Unique: g0Hp_cWzPYehIyxQlJ0Rog-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8118801AC9;
 Mon, 24 Aug 2020 21:59:56 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED104600E4;
 Mon, 24 Aug 2020 21:59:48 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] omap_intc: Use typedef name for instance_size
Date: Mon, 24 Aug 2020 17:59:32 -0400
Message-Id: <20200824215936.2961951-3-ehabkost@redhat.com>
In-Reply-To: <20200824215936.2961951-1-ehabkost@redhat.com>
References: <20200824215936.2961951-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 16:48:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.956,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J2Otifl3uk0Z

This makes the code consistent with the rest of QOM code in QEMU,
and will make automated conversion to type declaration macros
simpler.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/intc/omap_intc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/omap_intc.c b/hw/intc/omap_intc.c
index b8a1d1fd7d..d7183d035e 100644
--- a/hw/intc/omap_intc.c
+++ b/hw/intc/omap_intc.c
@@ -676,7 +676,7 @@ static const TypeInfo omap2_intc_info = {
 static const TypeInfo omap_intc_type_info = {
     .name          = TYPE_OMAP_INTC,
     .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(struct omap_intr_handler_s),
+    .instance_size = sizeof(omap_intr_handler),
     .abstract      = true,
 };
 
-- 
2.26.2

