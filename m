Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2907985lfy;
        Mon, 24 Aug 2020 15:02:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcLbn2puUSHrSm0Y076TJ3plogsVH3TjhNv50A/zmtvG3pVlhh7IDV4Y19vTfU1D3YDogX
X-Received: by 2002:a5b:508:: with SMTP id o8mr11462343ybp.43.1598306550350;
        Mon, 24 Aug 2020 15:02:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598306550; cv=none;
        d=google.com; s=arc-20160816;
        b=YbTzoHEEYMtFHnaVJOsv+5NckZMkyS6xAIvFoFfPpAcSERjArW9rVjjlF+P9JsKtzj
         YJEavKf+v/66UHELWFfB6/7two7KahDLq4ewD+9WS243BkA4A9uNt/clvJcPwUM8AHla
         T8FJtrK097phJcoGzcI7xZI2RJPqg1iwRziWfw1d6tK20pGOkJ9BYi621uSJp48CAqSw
         c+3GefzFAHnqxaZ6yFEK6+xyLuMGQM2jMaz5GRMoIbAAWKO2YjnHdjcjTgyHK1FZJS79
         0Hrft2Fb5p6xby1NXX4sWNJVP4t/Kiahd6tsJi3UKQ6d0PRFUAFXSIaeiWFdg3yntEAe
         ruKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=x35caCXuOckWr0t/0QSl7Z1oGqEi1qLutXHP06QSpTE=;
        b=NH9mUel9ZtwuqF7VZIOhwHTIVNw56tHptHB6aJJM3zoDPsEjWXNuc2o9N/yI9QkqVr
         I5F/533GsX5leRjF+HqJqRaMYyte5vCgUzgjj2HW4qhObA66IIVTEHEhEvMOEPouJ+Cs
         1W5FFvCuYxeJYNvtqZOF/TYLLuprmiCw4iOwFzHYYIBThru9wToYc0dENT8ugpEy4XGX
         0FsceqAFOdv+mi5CjlRDjuqCmjMPWtbvE5VTdztwUMROPiTiJPEpo4fbATDKVzHiD0Wc
         ft1FYaZ/KAyaLz7oxE3DaFW0Ba/IEnNx1iWlxX+zat/iZjJr3+SpjK+DUi8sa/0w/T4B
         Txlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WbS+GoCd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1si12099656ybs.48.2020.08.24.15.02.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 15:02:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WbS+GoCd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAKXt-00084D-DC
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 18:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAKWR-0007Dw-AT
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 18:01:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29398
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAKWO-00006N-Mb
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 18:00:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598306455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x35caCXuOckWr0t/0QSl7Z1oGqEi1qLutXHP06QSpTE=;
 b=WbS+GoCdplRMSWuIjHM6H1VMYdbSu4e1ixUweyoHhOuKZFwUgjvyxTd1kjgR8kVkrwGe6k
 yXRV+/6YLWdSQNuqwtMZre7oEAQpvWDzTmOPzjj5/HWkGNFEWQipSlUvbqxwqPFCri9Wi5
 jSaziu4KAVKmJytX36zpCf41avTfOBQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-RqXHqp1-PZu48tR_cdJ9Ww-1; Mon, 24 Aug 2020 18:00:53 -0400
X-MC-Unique: RqXHqp1-PZu48tR_cdJ9Ww-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 754EF81F018;
 Mon, 24 Aug 2020 22:00:52 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85CD562A13;
 Mon, 24 Aug 2020 22:00:18 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] virtio-vga: Use typedef name for instance_size
Date: Mon, 24 Aug 2020 17:59:36 -0400
Message-Id: <20200824215936.2961951-7-ehabkost@redhat.com>
In-Reply-To: <20200824215936.2961951-1-ehabkost@redhat.com>
References: <20200824215936.2961951-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: wt6clAaZRbvY

This makes the code consistent with the rest of QOM code in QEMU,
and will make automated conversion to type declaration macros
simpler.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
---
 hw/display/virtio-vga.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index f533d7d1b4..7c995ddc81 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -194,8 +194,8 @@ static void virtio_vga_base_class_init(ObjectClass *klass, void *data)
 static TypeInfo virtio_vga_base_info = {
     .name          = TYPE_VIRTIO_VGA_BASE,
     .parent        = TYPE_VIRTIO_PCI,
-    .instance_size = sizeof(struct VirtIOVGABase),
-    .class_size    = sizeof(struct VirtIOVGABaseClass),
+    .instance_size = sizeof(VirtIOVGABase),
+    .class_size    = sizeof(VirtIOVGABaseClass),
     .class_init    = virtio_vga_base_class_init,
     .abstract      = true,
 };
@@ -224,7 +224,7 @@ static void virtio_vga_inst_initfn(Object *obj)
 static VirtioPCIDeviceTypeInfo virtio_vga_info = {
     .generic_name  = TYPE_VIRTIO_VGA,
     .parent        = TYPE_VIRTIO_VGA_BASE,
-    .instance_size = sizeof(struct VirtIOVGA),
+    .instance_size = sizeof(VirtIOVGA),
     .instance_init = virtio_vga_inst_initfn,
 };
 
-- 
2.26.2

