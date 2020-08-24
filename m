Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2907773lfy;
        Mon, 24 Aug 2020 15:02:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzA7uRo0CPrRWPFgG1k+B4jKZHDOScBIJq78VhrCPa/D4MPNuWBcd1MtnxHq9zEbs9aYiby
X-Received: by 2002:a5b:f07:: with SMTP id x7mr11228314ybr.234.1598306530356;
        Mon, 24 Aug 2020 15:02:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598306530; cv=none;
        d=google.com; s=arc-20160816;
        b=kmUvQA9rSCdfBPwDxIEaOKr8DFOPhQckI9LaHytg6xARiLWBg15FtUpkT75RK2DQR4
         GQlueuitp3qMf6o0IjJmfuItD+yyafTdxq+YqH1ZJgh/Q/eNOPIS7Sw/zfk0s/gbOQfX
         wsuqFnPOWdLGrHFUcso3GyCz3++pon/FL/1kaZKXe5snciNnNXFtKjVNcXda3Je6mHya
         ttQtZSg7cst0FsL2U2dIQr6cpAIf75gfXcmzoLVhmPvG+pY1re6uluFtcuLvowzFVapM
         QfrjPxbM+IpzNNEKmU/ENHncu0A3XHdF97BQ6L1xRr8IBDKg1ywujbSNEgqgRa+4Z8QE
         G6bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1U+dClw/h0ApCnAUxAlsTHny3irD95tCjrN2Z9jbHL8=;
        b=EX8ovtpyCMxgLu+o14hEwcx4iterTLsdmpgon9JWwQcEQqX5nrafwSw8NlHitm/rmh
         Mr9EvjYWb6bkMw6EzoIrf6zbuc8J/hCKhNbKKOgPevRLMJoqxvvXqpWINCkoWVsF4g0g
         ulE8xI8d+z5PAfWwbvy+UtXeE3JRLYVtYXsjteq3qbffhbgNTEWOuz0qicv271dVNDnt
         /KS2qAyDTe1NkI8rtxvlw4VO5PZnccctBsZCBjSb/f3QFCoAGNdAlRmYy4zmO4kasRPs
         Oxl0dSjthVgvtnWb3j0s6e3COc5+VXThhqWXlLXFu/1qmGLpvIeVmhoLrzpvAyct/41j
         EZQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eDAqXFJw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r32si13031806ybd.365.2020.08.24.15.02.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 15:02:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eDAqXFJw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAKXZ-0007cQ-El
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 18:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAKW0-000732-Lb
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 18:00:36 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:29787
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAKVt-0008Q6-NV
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 18:00:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598306423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1U+dClw/h0ApCnAUxAlsTHny3irD95tCjrN2Z9jbHL8=;
 b=eDAqXFJwtelPm1wOnsNxBVlsjtf8cPaL4TNbt/nM3gCuy599pmgpHW0PZ8sKIg3bTn7PCT
 KU3NNraVo9HoCibfKDwXpMXV16GNVNpadSzGzbh1r1rskfJRdRk0VrUBaVCSje6B1RK2BB
 jeMLUlI5ukbVU5P0rZLqGGJPPMTLANs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-X30bcuwkOaGSbtQ6eB2S-g-1; Mon, 24 Aug 2020 18:00:19 -0400
X-MC-Unique: X30bcuwkOaGSbtQ6eB2S-g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1F8B1DDFE;
 Mon, 24 Aug 2020 22:00:17 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CFA319D6C;
 Mon, 24 Aug 2020 22:00:17 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] vhost-user-vga: Use typedef name for instance_size
Date: Mon, 24 Aug 2020 17:59:35 -0400
Message-Id: <20200824215936.2961951-6-ehabkost@redhat.com>
In-Reply-To: <20200824215936.2961951-1-ehabkost@redhat.com>
References: <20200824215936.2961951-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 17:57:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.956,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 1ETBozCYukgw

This makes the code consistent with the rest of QOM code in QEMU,
and will make automated conversion to type declaration macros
simpler.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
---
 hw/display/vhost-user-vga.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/vhost-user-vga.c b/hw/display/vhost-user-vga.c
index 1690f6b610..78f58bd340 100644
--- a/hw/display/vhost-user-vga.c
+++ b/hw/display/vhost-user-vga.c
@@ -39,7 +39,7 @@ static void vhost_user_vga_inst_initfn(Object *obj)
 static const VirtioPCIDeviceTypeInfo vhost_user_vga_info = {
     .generic_name  = TYPE_VHOST_USER_VGA,
     .parent        = TYPE_VIRTIO_VGA_BASE,
-    .instance_size = sizeof(struct VhostUserVGA),
+    .instance_size = sizeof(VhostUserVGA),
     .instance_init = vhost_user_vga_inst_initfn,
 };
 
-- 
2.26.2

