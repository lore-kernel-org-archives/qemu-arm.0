Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2044355ejb;
        Tue, 24 Oct 2023 06:23:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5rQvS9wIaxRByUS/QGBa+DtrGgyFhYjg4j46stTZXs3utrQg+jCM72bX+yNBUoHaBYSV2
X-Received: by 2002:ad4:5966:0:b0:66d:1927:4e6b with SMTP id eq6-20020ad45966000000b0066d19274e6bmr14076818qvb.56.1698153831913;
        Tue, 24 Oct 2023 06:23:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698153831; cv=none;
        d=google.com; s=arc-20160816;
        b=VJAecw4tz46gSM2JAvPIljeTvGHtsVTquqUfz1FHPQuLEiTV4LLEiuwr3KrR+FhXjw
         0IBA/qisyCjdIK3G84dKrUEVpcYihID52zwGtTssELjDFIvsIRSIyFOFkncepfhIuhsJ
         OEc5EEc6t8zs+Z1VZ3IQzwdCb8tE0WEgiyNpEt2a26BW1tFenx1Q0ZTGWkR1rkC86dJX
         pRAf76fnviGEzSBcjHGW3YtKwQvv/qz1WL1nsjTZD1XL1eUi7DtQ2OCi5vY+JC9tnypU
         I4h1rPKlcJs8PAxbAXSQl8tIm4FK7/tQPCOSk5xm65x1+IoztZhLiNpsjwFArHKwu2BD
         MgiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9MY/gsRm1RZx08/e600OIoABAjxlU7+i0MBY5yfrU2A=;
        fh=opDjDdl13S8XzsjQawtiYU7uNvQllAuUSK4RvD1fxCk=;
        b=UVr03/XbvD7pzKL5HxhROpn38vw76evsp/49QrBPF2j61pmsOzltrUD5hToeJAkep5
         AO9XcHZQK9ixi+/rbgjPnHHtRK7oWiv3Hqdzhzb4hcrGlfikyhZU/jyo00Y7RSe15tiv
         xw+fsyw8rqdUPErEtvqp8yXLBnxET09IX8gUms0lWiyMkzcoQkXuTEgB61DCq3PEZ095
         XYykqmgZw/T9wzlAV7fE9Nvb1wlMGVj9DJiYUHG+AF44aq8WCAsmShSlD3LUxmuGUTch
         Qs9UGSB0k2YoV4HFM8Pv+RDrfzwxWk6djWvv2xjq8+9bUo3JatQvnlmwxxh72EYeAe/k
         EAkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CJnLJhor;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a5-20020a0ce385000000b0066d04594584si7161649qvl.434.2023.10.24.06.23.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 06:23:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CJnLJhor;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qvHJR-0007ev-BN; Tue, 24 Oct 2023 09:19:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qvHGv-00041p-4o
 for qemu-devel@nongnu.org; Tue, 24 Oct 2023 09:16:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qvHGr-00020E-2f
 for qemu-devel@nongnu.org; Tue, 24 Oct 2023 09:16:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698153391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9MY/gsRm1RZx08/e600OIoABAjxlU7+i0MBY5yfrU2A=;
 b=CJnLJhorMAFaRIUDMzSmNgbcfsGm4YfRw4FwHLOB5RYbyqWJCtIFqkHl5+Pi/HwxrTQkWb
 a3yRvJgHyUx1uW2QkxPNVkTDYoPVCPsK8iXRXE2DSFuID3NQjhn8d3H7KKYO0FduagEkDL
 ydXM/9MoMn3EScEg6GU4O3HFDiGaE80=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-297-JB_HmMG9MAmMUMpFq1RtyQ-1; Tue,
 24 Oct 2023 09:16:16 -0400
X-MC-Unique: JB_HmMG9MAmMUMpFq1RtyQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCA342808FE5;
 Tue, 24 Oct 2023 13:16:14 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39E2B1C060AE;
 Tue, 24 Oct 2023 13:16:08 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Corey Minyard <minyard@acm.org>, Li Zhijian <lizhijian@fujitsu.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Kevin Wolf <kwolf@redhat.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 libvir-list@redhat.com, Stefan Weil <sw@weilnetz.de>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Fam Zheng <fam@euphon.net>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Eric Farman <farman@linux.ibm.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Stefan Berger <stefanb@linux.ibm.com>
Subject: [PULL 27/39] migration: Use vmstate_register_any() for isa-ide
Date: Tue, 24 Oct 2023 15:12:53 +0200
Message-ID: <20231024131305.87468-28-quintela@redhat.com>
In-Reply-To: <20231024131305.87468-1-quintela@redhat.com>
References: <20231024131305.87468-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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
X-TUID: ZF/jKierSenC

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

