Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp5216876lfc;
        Mon, 8 Jun 2020 09:17:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwN30QvKNP/PdjADnoJh1WTGZD3lG61dKR+sI4M+QgGinq/FyqctYaHc9MILtfhNnwNmkVn
X-Received: by 2002:a25:e8b:: with SMTP id 133mr31631356ybo.102.1591633065201;
        Mon, 08 Jun 2020 09:17:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591633065; cv=none;
        d=google.com; s=arc-20160816;
        b=ayjHaH+YvDxQca34x/WQdHE/hUNe0isIS4zkgfWjiolxUmJuYZR8dHsuem8w4cDG9+
         1x6VVFY211TIu2kPDUiR5uA8CsEhQUPJiNE8tKixcdZQFoukaVAF0OWdCvG8qYBW65bA
         rgtqG+CiR8VHN7na3GyU++n/kgGcZU0WsiSOysLwIikVzTmqzgg/2R8E5FSMaHb/44O8
         T5XniNOS5XCp3ucKrUk6WNNnEOwUOtbV4ToiMxDX948qsE8nmK4lg1Teepnv1f7EXFHT
         AnHWN+hnouTRBNj+MFrtgbkTB6PZECEsSTbkVtDGF1EljlkFaVS1Y/lrwNKTdvME/kyV
         hLMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3WzkinKDRWpQmIIO97X+MugaJnDZKw0ffp1ti6/ctwc=;
        b=hgLVA/nAhlNsRd1ENikq425Ee2slsoQtIgONKD0OClOJ/ORB/UxbiYTqR3YMukQ8Ch
         dnSrxvBoZhqVYYqGxz1B5mQ36GeO7NFiKY8/wNxgvvSfgJXNbFnVuZh+w2U4SI7bRp/e
         GFfJlEPq4eo0U8CLi8shg7jceK3InxtEXpUWtwcPv76E5pIgidN2KIVf8CixCGJ7D/o0
         Zo6XdbVBWiqkrj80VQdjOmpcrAaZi4xSdH5m6aJD3fxRoAzQ+vqxoeWELWTirOiS9TP1
         iivftcSbVHxW2iJnbdOXVHNgOsE+3IGj5rvsWY28qBq/QELQWxSOqixZv8TmgJSDXf6g
         GvgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CrRTHL0h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2si97327ybk.76.2020.06.08.09.17.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 09:17:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CrRTHL0h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiKT2-00037Y-G1
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 12:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKEV-0006zi-I8
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:02:43 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:56625
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKEU-0007ti-Bj
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:02:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3WzkinKDRWpQmIIO97X+MugaJnDZKw0ffp1ti6/ctwc=;
 b=CrRTHL0hePKrja1z58nrQod7xs6orUWRgcZEnKZtBMxzAQEMW6Kl7gpegnrCC0CGtbQDsM
 AkrxFhMHx0PuTEdWGDpmMIXzRbXdsOhp+uUQr4gbNV2gyKYw+2Q0ONBAZSW7aYrciogm80
 GrPSVBsrRN/EJOV/6VI7BfLHm14NGRY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-PNLLVO2WOXKfs04ZIKDAoQ-1; Mon, 08 Jun 2020 12:02:36 -0400
X-MC-Unique: PNLLVO2WOXKfs04ZIKDAoQ-1
Received: by mail-wm1-f70.google.com with SMTP id v24so11175wmh.3
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2020 09:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3WzkinKDRWpQmIIO97X+MugaJnDZKw0ffp1ti6/ctwc=;
 b=Uld9Ax+kZLkhe/C+kWvqEy6EXJfTSxI0j78CER5Kk2/1I2k4DEucgw6a1YGLeIlDlk
 UOkpk9qEAdBd1gEMPgDTW4od/caOdpSk95sjU/4271VYqHd+pE/+pPICSphphv+gJm6J
 ocAihT+gRMsWQS1PlcViP8Pq7hW16DXq+y/ZmrvY+WIAU12CD8rsbGwrPWg09+AF8zV5
 xWjoyAsx6KVErJRWDxztSVpawmxwtpSOsRooV7y6t+KFfHiA8Ya3Qm/w4F5RulKx1Gwh
 8Q2IKouaINz5SYjPk1GuHRDUcZcn9XRD3orFknlUzF/lUXqI6uH3tv2uZu68B3au4ZJN
 bsQA==
X-Gm-Message-State: AOAM530nR9b2b0iMdkuQUPetda3Zm8QVwkY/1m/bo8RqHcIJyKSpBSg2
 Fv0nL+dvvuBDwP92TzD0j3HnnUg52KBm6LIACcxX8E1kK8l0dLzDm/If8+t4hYBoVDFI04Yz6N5
 7sJAXOpdxguXB
X-Received: by 2002:a5d:6391:: with SMTP id p17mr25853402wru.118.1591632155835; 
 Mon, 08 Jun 2020 09:02:35 -0700 (PDT)
X-Received: by 2002:a5d:6391:: with SMTP id p17mr25853379wru.118.1591632155624; 
 Mon, 08 Jun 2020 09:02:35 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id o10sm183753wrj.37.2020.06.08.09.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:02:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 19/35] hw/input/tsc2005: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:28 +0200
Message-Id: <20200608160044.15531-20-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 05:40:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CZGULP7iXcUo

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/input/tsc2005.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/input/tsc2005.c b/hw/input/tsc2005.c
index 55d61cc843..1f97b82379 100644
--- a/hw/input/tsc2005.c
+++ b/hw/input/tsc2005.c
@@ -27,6 +27,7 @@
 #include "hw/irq.h"
 #include "migration/vmstate.h"
 #include "trace.h"
+#include "hw/qdev-deprecated.h"
 
 #define TSC_CUT_RESOLUTION(value, p)	((value) >> (16 - (p ? 12 : 10)))
 
@@ -489,6 +490,8 @@ void *tsc2005_init(qemu_irq pintdav)
 {
     TSC2005State *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = (TSC2005State *)
             g_malloc0(sizeof(TSC2005State));
     s->x = 400;
-- 
2.21.3

