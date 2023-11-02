Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp320968eja;
        Thu, 2 Nov 2023 04:43:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwfrVEYYjY2JXYJ8gOy0lpO3gySaKL5R3OkJHML815Y3ERz+4HuWa+FqLzAFYaOXe++Aos
X-Received: by 2002:a05:6214:21e4:b0:671:2fb5:cb28 with SMTP id p4-20020a05621421e400b006712fb5cb28mr16050698qvj.17.1698925383963;
        Thu, 02 Nov 2023 04:43:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698925383; cv=none;
        d=google.com; s=arc-20160816;
        b=lDsMmMmrPzgUYBx2hNjz4eKtEkMwZg9YvtRDQBPcQqGLQGlAVZGrA/iWzB+tbFAtwF
         13RvUTkpUI7osQ0+zfGRuuDP67aFFm2TcB+9rfl7isZ3TUDfklAXZp52Ls6A/iODslGC
         4hBAK5NuXlFzpznqAx/hAOjmIzhh02L9ndWL+aE8zUFkcJvEXN7RqFdPgGTsRGowFyfK
         MGRY3swVsStH13thCvPl7Jdb9bQT8hv/Yfh2t+nm87n5SsosGPMw+TcwMUwlWs92NP9B
         e8Cd6JyaQj5bkUkV/NRNXE/xAJuJ7GddwMrJ9qJVdRFkDra6Eo3yCY7egbGcfNPU1vNm
         NIpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9MY/gsRm1RZx08/e600OIoABAjxlU7+i0MBY5yfrU2A=;
        fh=9XEyySFYRp6Olqe53+AU8I52EufRgt7BknvnnkPQpGA=;
        b=MBUYfO02zfeladtZUub2E+6DqsSDxw4OLvP8GIa23BLpVNhPQd8rWEt2/Qjz7ohcWS
         Ss7SpYyPZXzV+zi8E9uvCgBDlZLEGvceyIRmDxc90DHY7ib8KBEBqL50Glxb5+Jak/pz
         +KeENADEJgusZxPi/PuEzgYqUUBjShDC9ShNZSUlGuWSjm09l/NzAa6HeKetbghVFD2b
         Mchr8XFvGpM4AeiCaujBkpYE11Gzj/7x8l1WFOjzME8dmIKEycMpudCX/NCW/pjyLWDV
         wQBQBlEUeNmRz5nw/VQxsCoF4H+z7U+6xFw7oO02setdLOJrSZeMYZ/wIuM35/tfLQrS
         ALRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W4ZBbfVF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id px3-20020a056214050300b0065d067f07d6si4187370qvb.318.2023.11.02.04.43.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 04:43:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W4ZBbfVF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyW5k-0003Cj-Iq; Thu, 02 Nov 2023 07:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW5M-0002cg-Q1
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 07:42:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW5K-0004Nl-Jm
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 07:42:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698925321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9MY/gsRm1RZx08/e600OIoABAjxlU7+i0MBY5yfrU2A=;
 b=W4ZBbfVFTTCrLS+d9/ha4Zf33HqYTic5mbuHHU5WIK6zHMKHc3hKxlxCVU/HWyvZJg+pH8
 1cPy2dc+iqzCiTSbdxQVHSCSdran0CmgTaf/kCX+ZpkhErxUz55UupP6Vd9gIP6+MAsGal
 60gzVMg2BwmdnJevUPsB9PAcx/at5EE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-dryEjIBfMSmnNyotco3YdA-1; Thu, 02 Nov 2023 07:41:58 -0400
X-MC-Unique: dryEjIBfMSmnNyotco3YdA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E77382BA83;
 Thu,  2 Nov 2023 11:41:57 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EAED92026D4C;
 Thu,  2 Nov 2023 11:41:49 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Farman <farman@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, David Hildenbrand <david@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Leonardo Bras <leobras@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Li Zhijian <lizhijian@fujitsu.com>, Eric Blake <eblake@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Hanna Reitz <hreitz@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Corey Minyard <minyard@acm.org>,
 John Snow <jsnow@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Juan Quintela <quintela@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fam Zheng <fam@euphon.net>, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PULL 07/40] migration: Use vmstate_register_any() for isa-ide
Date: Thu,  2 Nov 2023 12:40:21 +0100
Message-ID: <20231102114054.44360-8-quintela@redhat.com>
In-Reply-To: <20231102114054.44360-1-quintela@redhat.com>
References: <20231102114054.44360-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mmMIG5WgmmcN

Otherwise qom-test fails.

ok 4 /i386/qom/x-remote
qemu-system-i386: savevm_state_handler_insert: Detected duplicate SaveStateEntry: id=isa-ide, instance_id=0x0
Broken pipe
../../../../../mnt/code/qemu/full/tests/qtest/libqtest.c:195: kill_qemu() tried to terminate QEMU process but encountered exit status 1 (expected 0)
Aborted (core dumped)
$

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <20231020090731.28701-4-quintela@redhat.com>
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

