Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2906328lfy;
        Mon, 24 Aug 2020 15:00:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbqxIZSu3HwjHkG8Pv13WxQ7Z9iMVP5SdDwOvFPm4jOZ8u6rRaXn4QRJkTSjUcanfVvTMP
X-Received: by 2002:a5b:411:: with SMTP id m17mr10586165ybp.176.1598306411628;
        Mon, 24 Aug 2020 15:00:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598306411; cv=none;
        d=google.com; s=arc-20160816;
        b=HPYs0AtGnZIVVX2ZpC1BvmDuSQHbMqZHDlm6FBMzKoirWlPa226qGy7Z4g8y95Bz3g
         7uWa47coUMxQmqIbK59WHoEgxQZ/JcVKDSf8EvQflOYvZ5i5o25//mrPoERZRJakvEHb
         T4RWYsnpL+gsJKbiPdQ0aGz0o6glA/h/Ymf2M8fg8UdUIVhtRvAjTINWwdkV4FAlnpuU
         aAAck7xpBYgZzy2NI7ob948BhTmcnmCnm1sDhT7bIN1hzfZvPbUc42P4zYZqmllHMPYh
         GHabtoT5erzHPVzqywgxpkEjX9FiUJlZ+0NRPN0SI4ciM3JwtufqAKPHRykQVCKgrdfb
         7w9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=XsuS4RWhkmHJmOqgg1gzMNuS2tjgVfSq3SfuWytoBDM=;
        b=v6CvM+CLjeKTOQ01M0dXPedUDcDXRcY7sHf5gaQGqKScOVBNexzL6fZF8zBhSzVx0x
         N/157xIYhKqmbkH9mVh+ajmXs1kURo10T2eao8RwtldVYh0XZQeynXSEtKndPI9PpogO
         QVk4KkehU7m8St485/xzrvNHSEGcycnD2QbfkH1vME54pBtivPMxoyk3KU2O4ckBB/TB
         YISYAwobheIY7NmvDWHea5EYVBZnF0ZzhkOurs/fU7O+vHMWqIX+8H4MervtPQAf5l0v
         N/h+qEOxt8WxqHTODeZBQt61c7WKh2NMrOdrSyhCNhWRf5iXL/1SKBCkUDSy/VlEvslp
         wJjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fNsqUzkz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k132si12182499ybk.281.2020.08.24.15.00.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 15:00:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fNsqUzkz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAKVe-0006H5-SG
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 18:00:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAKVR-0006Dx-Dv
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 17:59:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAKVL-0008FH-Ah
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 17:59:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598306389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XsuS4RWhkmHJmOqgg1gzMNuS2tjgVfSq3SfuWytoBDM=;
 b=fNsqUzkzDEwejVRDI7SJ7nSjeXNFDt72q5YMoUQzZDK5qq0+JMn5VfgVtJuGdrf/KBjbBY
 FAM7bkGNDrPvB8M6cJoy/BTJcjEcYzdy2zvpiQ6vlFL8SK2GIf0bsQRfS8ba8hGP91D90a
 4DEL0cNaBY/IVNN9vnWVSYCFbAAAWFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-0UPd6I7dN-ShNPbKJVmCQQ-1; Mon, 24 Aug 2020 17:59:48 -0400
X-MC-Unique: 0UPd6I7dN-ShNPbKJVmCQQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2382918A224F;
 Mon, 24 Aug 2020 21:59:47 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F36785B680;
 Mon, 24 Aug 2020 21:59:36 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] qom: Use typedefs instead of struct names on
 instance_size/class_size
Date: Mon, 24 Aug 2020 17:59:30 -0400
Message-Id: <20200824215936.2961951-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 17:59:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.956,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: YBsw5yBHTSb2

This changes existing QOM boilerplate to use existing typedef=0D
names when setting instance_size and class_size on TypeInfo=0D
variables.  This makes the code more consistent and will make=0D
future conversion to QOM type declaration macros easier.=0D
=0D
Cc: "Michael S. Tsirkin" <mst@redhat.com>=0D
Cc: "Marc-Andr=C3=A9 Lureau" <marcandre.lureau@redhat.com>=0D
Cc: Gerd Hoffmann <kraxel@redhat.com>=0D
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>=0D
Cc: Alistair Francis <alistair@alistair23.me>=0D
Cc: Peter Maydell <peter.maydell@linaro.org>=0D
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>=0D
Cc: Jason Wang <jasowang@redhat.com>=0D
Cc: qemu-devel@nongnu.org=0D
Cc: qemu-arm@nongnu.org=0D
=0D
Eduardo Habkost (6):=0D
  xilinx_axidma: Use typedef name for instance_size=0D
  omap_intc: Use typedef name for instance_size=0D
  lpc_ich9: Use typedef name for instance_size=0D
  xilinx_axienet: Use typedef name for instance_size=0D
  vhost-user-vga: Use typedef name for instance_size=0D
  virtio-vga: Use typedef name for instance_size=0D
=0D
 hw/display/vhost-user-vga.c | 2 +-=0D
 hw/display/virtio-vga.c     | 6 +++---=0D
 hw/dma/xilinx_axidma.c      | 4 ++--=0D
 hw/intc/omap_intc.c         | 2 +-=0D
 hw/isa/lpc_ich9.c           | 2 +-=0D
 hw/net/xilinx_axienet.c     | 4 ++--=0D
 6 files changed, 10 insertions(+), 10 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D

