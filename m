Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp734179ejb;
        Thu, 19 Oct 2023 12:09:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlBWdtBHuHpYV3g0PVhnaiHMlhE8DsaUnQAvJ6G5YcEM5kQb79NF9EUv3Z5FrcnccthJxa
X-Received: by 2002:a05:622a:1893:b0:418:1c96:8ae9 with SMTP id v19-20020a05622a189300b004181c968ae9mr3607183qtc.11.1697742577156;
        Thu, 19 Oct 2023 12:09:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697742577; cv=none;
        d=google.com; s=arc-20160816;
        b=0Tt/FKRI/QVd9b0AcqrZD6X7fMdTqgOPie5EmG53yfoUMeq5x9LoyEHuWqtPFnT4mi
         ekqArVIj8j4ECKgrmC595pRaMyi3WtXdqZgCRivOzVW6ut0DCSfvUX5pFCBNUvr2zyhu
         rKzHtE5EnZh7Sx1pXexhPFgPrZyyrnkbKWBiiuDN5GYS+npbEMwXz7q4Vtc3OIzc9v/c
         xrlw5jvKfHWr+0QCOP0xyy6pB+d7LDZsvGICZACfD00x7cdMJgS9MxYWcRWyqNyu1EPp
         H5h236LiKkRNvIvIQf0rHKA3y5SYOE33DCyYIlWJf08AWyGm0sYHm0kDPRZRneea/Dm0
         svWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QylXQ3qgB8WaPuccTuoLmC9y3ZlqHihid0J1RsIfjWQ=;
        fh=Xlf3et2nYyn6Dffgqd/l95XMDkc357MJlcbLmxiOqZU=;
        b=CnFOhRsBAd/Lzl63ReHMe4LMbLpG2yew6fVMwVRGf/QTMPHZAJUyU+5DVf7YYAZ33R
         mbI0rQDSj3h3uosnconzJNAYXR7vnnc1CLIcE7G8zDmQGJimXL06QhM9L3TE4Vkxok8x
         J6f0SX2Yp/rh+O3SKwEq+IwNQIslEPBs63d3FpsRPfPVrWHC1eLTxCKXrXLCmuGloUUc
         FgYfvm9arNpFcHVrAeboNvWby7FvUWKG1MsvnJYm0ol4fc4SeubhelmbnwO+0vDRIKJ9
         XJsnd0xauBRw/Q1jdqVYncYSEnq1xOq3v9QS1K/wMKajyOQxRXyYGCjWLeoOmongbgUE
         o26g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="hznS/B86";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o11-20020a05622a008b00b00419629f7784si84637qtw.198.2023.10.19.12.09.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 12:09:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="hznS/B86";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtYOG-0007PY-18; Thu, 19 Oct 2023 15:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtYOE-0007Nd-U4
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 15:09:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtYOD-0003aV-Fr
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 15:09:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697742540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QylXQ3qgB8WaPuccTuoLmC9y3ZlqHihid0J1RsIfjWQ=;
 b=hznS/B86A/fbhrqayXs658MvU4hgapNEuAoy+Nh1uarLaatPwm9hH50ADs6FtqhsTCyT8D
 AYjbU8cRbXXmvNxNPMOr928sWoSe/VdgjcfzgKhHDbg8o04NaPXueY2ioo4VT1OZmhHEPb
 9G2+jVVyMNJ2tfKGc4PGZfCVLSz+/Ok=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-EZnmzHVaMb-olAznT45nag-1; Thu, 19 Oct 2023 15:08:56 -0400
X-MC-Unique: EZnmzHVaMb-olAznT45nag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E88CB10201E5;
 Thu, 19 Oct 2023 19:08:54 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D87CF1121314;
 Thu, 19 Oct 2023 19:08:49 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Fabiano Rosas <farosas@suse.de>, Eric Farman <farman@linux.ibm.com>,
 Peter Xu <peterx@redhat.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-arm@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Corey Minyard <minyard@acm.org>, Leonardo Bras <leobras@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Halil Pasic <pasic@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 03/13] migration: Use vmstate_register_any() for isa-ide
Date: Thu, 19 Oct 2023 21:08:21 +0200
Message-ID: <20231019190831.20363-4-quintela@redhat.com>
In-Reply-To: <20231019190831.20363-1-quintela@redhat.com>
References: <20231019190831.20363-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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
X-TUID: W0Ykfn6FcWDu

Otherwise qom-test fails.

ok 4 /i386/qom/x-remote
qemu-system-i386: savevm_state_handler_insert: Detected duplicate SaveStateEntry: id=isa-ide, instance_id=0x0
Broken pipe
../../../../../mnt/code/qemu/full/tests/qtest/libqtest.c:195: kill_qemu() tried to terminate QEMU process but encountered exit status 1 (expected 0)
Aborted (core dumped)
$

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

