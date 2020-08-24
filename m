Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2905216lfy;
        Mon, 24 Aug 2020 14:58:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+chbhq0POHhX4P1i6iQ3Vu/JEPeCSLVSzZjxjEqNSuHpyPhA6UOWxRlESUnbkzsOJzapj
X-Received: by 2002:a25:3b0d:: with SMTP id i13mr10216431yba.314.1598306297432;
        Mon, 24 Aug 2020 14:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598306297; cv=none;
        d=google.com; s=arc-20160816;
        b=CyDfWNOWjgaK63RGGaULysE/3W4NpopzMOgsYNgOdUCFU2J9/Z81iaNYMzC50E37uL
         KNhOpxxw0rEOedA0LNxs8gygWIXaBN5XAS0zu1UEWSsJ1hjO3LM5CVYagur+STIehXzY
         6MDQfBM0ZEQJCUmqWl2dwd85+dWeAQQ78Q2MMjBJ6RN3cIjaPXqeNCYY8nuE7933ZznL
         uGfQdvmckal9nUbKFiv2mgunOfRGC/xud7ThIheJkVHuNn7suECJcQiqXlPYRvLWVVMZ
         6b+0qAvkxL+zR2nQ1341NJWuQgF+GXHt4MKFYsXb1V1iTOKAMxtd8ngV5zq/19dkmgqG
         2kcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=XsuS4RWhkmHJmOqgg1gzMNuS2tjgVfSq3SfuWytoBDM=;
        b=cV5tg8lXQA73N1KSgkAOwo8EBMcbk3WANWYs/EKOARQ8IhmhQTrXOK9YrdbQxeCsqq
         fkeCrzJOxyu2wqThr4FONMeOBX2MpWXZfByDIyA18aKOQ3sGEnWll5eeYC6Y8DIfyplY
         HLOeHpo3VjIbWaxNRJVZu4bbmU6L73jJ5Lh5ALUMp4gQQv2syMEgzn0PA5BiA9RxIzb5
         uSqRpnZIdSfGLOIhnIfjKUcxkbR90yGY7scemS/1KTYu4BzsnHbA6wdbxRVgY5Ja5apV
         RoCnkqZR1STvQzjwBadKxMz5p7iP66yvlWtAqu72ELDkrJukzSEX9MtAchbMqqeHlPeh
         +3sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TvjQWLKN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x31si13181414ybd.297.2020.08.24.14.58.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 14:58:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TvjQWLKN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAKTo-0004CR-PK
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 17:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAKTC-0004Ba-Gn
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 17:57:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21004
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAKT8-00087R-C9
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 17:57:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598306253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XsuS4RWhkmHJmOqgg1gzMNuS2tjgVfSq3SfuWytoBDM=;
 b=TvjQWLKNFRpRj/101TRdUjRRrh26vqda4MeB6uCqc8pEjbxiTaxXCFC7WsvC1KulwYHPWD
 Syb7mJtuLKvzXse2zZsshIbBuwdJO3Pc9BbpJIM1s/YJAlRVQbQD151rpn1KmI/ExJOM6f
 Mnz9r7Bb+5ETVJV//FBaLO49nh5WtH4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-u7qmLFJOMY294Cdmv79v6g-1; Mon, 24 Aug 2020 17:57:31 -0400
X-MC-Unique: u7qmLFJOMY294Cdmv79v6g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43B2B81F010;
 Mon, 24 Aug 2020 21:57:30 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9013B60C0F;
 Mon, 24 Aug 2020 21:57:22 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] qom: Use typedefs instead of struct names on
 instance_size/class_size
Date: Mon, 24 Aug 2020 17:57:15 -0400
Message-Id: <20200824215721.2960162-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 16:36:16
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
X-TUID: kpbq+HEf1NiA

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

