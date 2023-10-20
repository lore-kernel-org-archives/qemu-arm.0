Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1080504ejb;
        Fri, 20 Oct 2023 02:09:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGWbO8AINdKHcQKNFdXpP0+Kmw1eepw2FFsGfPDfUoihvhNxjf8BatFxcOt8kZd33A9jKv
X-Received: by 2002:a05:620a:40d0:b0:775:7870:4a8f with SMTP id g16-20020a05620a40d000b0077578704a8fmr1211120qko.47.1697792984349;
        Fri, 20 Oct 2023 02:09:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697792984; cv=none;
        d=google.com; s=arc-20160816;
        b=nRKTOq9e0QikBqMCxGGKEVWyFBfqjorHcXcSxysGzKZJuSM8B2Cs5R+ujpnwDZS01K
         hAewL3zcsTv/PgTOP2NZJa2a2GJqFb9nOyaflxqbbB7EZNPIrYzwG2RwCOrAnMU4QOmm
         BKHvbfSq40E+hVeHk3BYg8Lrth6u3EeqDw3nrMedN+o94J/IiZrtzFKnXplrfDfzu015
         M/TEEneCrY6k2ukXBKnYyI/kmBAllU/Dc78Bk0arxGzEsBCxqaZBK+QQqO250BspJui4
         sksLNvo0ThzS80drkb0VVz26MvJWf48VzMh9XkkzRrvvEMegyBtTPLpzV6Kp7Hh3QF6K
         saeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3xBo/mKNO9gsqJTQsAlkJDwZHHQKx0WUD9WZ+VD3gI4=;
        fh=rTkH9/wDYQMZLVlaH0neZTzbhrqu7oCVHTTGZPWdq9o=;
        b=TfRe4mu5P0455cb76rbiyIkF1apJ51Zp7HCRh5o0Vpj3JA5zIgkSUKPc2npj61BKOS
         Vvi0B459Ju3wWc9A5QLFdoCpEmnmzeHNTdQ7KG4eOG1pPX4vM7cyGUPFnOLrbN5gz92a
         imXdy7lx1yAm8YrhGkodogVbxWjjqJRr4nx52d0xMlLRG5lUiyL9xiTiGpXKfJc1ikgF
         OqUclUJ7lmX//NfaOShoE3UiP7eY8HlZMAAPqQ0h1VpShDwABbtGA7dplrF4YfrmPm8Q
         4QngwBkz1YaPWM17W7f9Jq0qQ3M87Ct3Qr1QinstnvySD/lyt+KXn6rl+64ArLbjZB99
         om+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iTcOkvQh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ts12-20020a05620a3d8c00b007742abceac8si897326qkn.665.2023.10.20.02.09.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 02:09:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iTcOkvQh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtlUl-0004Cz-P7; Fri, 20 Oct 2023 05:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtlUV-0003U9-CI
 for qemu-devel@nongnu.org; Fri, 20 Oct 2023 05:08:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtlUQ-0005G9-KP
 for qemu-devel@nongnu.org; Fri, 20 Oct 2023 05:08:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697792890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3xBo/mKNO9gsqJTQsAlkJDwZHHQKx0WUD9WZ+VD3gI4=;
 b=iTcOkvQhTNwoioqtyLkUX0jhx2WiEojOMWjBz/WzSDo6lcEUqcDaoUou/8QuRYIUOmrgzn
 gFUA6FvPPNQQaf0J8O1CwmShhKm9PM3fNMbqLye//wfyUFMAAWZ02zNMo1YuhrBGt9VoPP
 QCVTMsecrIu0vh8PYT3k5l2IQdja948=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-mleJ7PrONoqy3ZRNbJYDdw-1; Fri, 20 Oct 2023 05:07:55 -0400
X-MC-Unique: mleJ7PrONoqy3ZRNbJYDdw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 144A2185A790;
 Fri, 20 Oct 2023 09:07:54 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBDCD2166B26;
 Fri, 20 Oct 2023 09:07:48 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Eric Farman <farman@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Xu <peterx@redhat.com>, Corey Minyard <minyard@acm.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Juan Quintela <quintela@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Leonardo Bras <leobras@redhat.com>,
 John Snow <jsnow@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Jason Wang <jasowang@redhat.com>,
 qemu-block@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Stefan Weil <sw@weilnetz.de>, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH v2 03/13] migration: Use vmstate_register_any() for isa-ide
Date: Fri, 20 Oct 2023 11:07:21 +0200
Message-ID: <20231020090731.28701-4-quintela@redhat.com>
In-Reply-To: <20231020090731.28701-1-quintela@redhat.com>
References: <20231020090731.28701-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TetGAg3wn63E

Otherwise qom-test fails.

ok 4 /i386/qom/x-remote
qemu-system-i386: savevm_state_handler_insert: Detected duplicate SaveStateEntry: id=isa-ide, instance_id=0x0
Broken pipe
../../../../../mnt/code/qemu/full/tests/qtest/libqtest.c:195: kill_qemu() tried to terminate QEMU process but encountered exit status 1 (expected 0)
Aborted (core dumped)
$

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 hw/ide/isa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index 95053e026f..ea60c08116 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -73,7 +73,7 @@ static void isa_ide_realizefn(DeviceState *dev, Error **errp)
     ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
     ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
     ide_bus_init_output_irq(&s->bus, isa_get_irq(isadev, s->irqnum));
-    vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
+    vmstate_register_any(VMSTATE_IF(dev), &vmstate_ide_isa, s);
     ide_bus_register_restart_cb(&s->bus);
 }
 
-- 
2.41.0

