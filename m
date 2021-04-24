Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp2323948lfb;
        Sat, 24 Apr 2021 09:27:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtVgU9qQPUX+hDho+/iejuKHck4ex+LkzViygNIdSgLNjvb8zCOAeHUcW7fCxexPQd9PCi
X-Received: by 2002:a5d:8f88:: with SMTP id l8mr7511674iol.94.1619281651049;
        Sat, 24 Apr 2021 09:27:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619281651; cv=none;
        d=google.com; s=arc-20160816;
        b=u6a63BayW6zDM+1BvfVElz8OIV7deqjBt0ATrY5VJAn3Me+zk21e/xmcLeSvpGjRsc
         VqGxQDwAWWTAUlHJjOrMG6b9fhMoKZL0g4cd3Kx1bCkUsz0V/nCcR2mX5oSbRiiY2KXt
         GvhQhzYVOIcDwscejtiv8ixe9STMkqEJrEgEeuTSI6QBC2Tjn74PC4CJqK6tU745Eh0K
         Tkvr1jE8cab/yO+LdIMHNeHNiwRJgUR2SLD+KgZzRnLlVhqi2yfMmOpeAt3m0nimzPFA
         FZU6kX6V+dxyFjZwaoNnI7IAnd1vJTbye9D9761AgrwAj4NILzX9RGuz/XKlwSjmQknm
         sugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=X33eNVwJacVSZY7X58ULYQouokNiQ8LTYhRpjXCE4zs=;
        b=OT6Wc5nN5E8db2rPacW5SVqnE9pKAKKQOc+EXTGx0/T4LsjeoYt5VsVltCq+VOvEnR
         hLX3QBJaGtePBITvzNKGB6h8xmHXjQ85JQRJ066uAgCTpcbZ9YPzUSLUeki6mOeoAo6y
         WFK+NDtPb0Gw1y2PKa2QoHQ1r9pgO+Q7RXIJx4KqBKpsy23s3ucxPMdU2maHSvgsE5qx
         bDKbfbF3xaqYsBmbvb3E0pxlivpp0MxEo1jbvz1s1W3WRIbx6htzehHK3a+kEB8Q7H0v
         9TFzM4f4O4Kh0QyeZX4pKawn2s1MoPSne3bx7XJuS7jS9BVETqOdL1anDM78d8htO1qH
         v/Rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KQIHaAm0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o11si9852854ilg.117.2021.04.24.09.27.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 Apr 2021 09:27:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KQIHaAm0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:34622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1laL7y-0006qc-Dt
	for alex.bennee@linaro.org; Sat, 24 Apr 2021 12:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laL3Q-0008SQ-36; Sat, 24 Apr 2021 12:22:48 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laL3O-0004KR-7F; Sat, 24 Apr 2021 12:22:47 -0400
Received: by mail-wr1-x42c.google.com with SMTP id c4so12511834wrt.8;
 Sat, 24 Apr 2021 09:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X33eNVwJacVSZY7X58ULYQouokNiQ8LTYhRpjXCE4zs=;
 b=KQIHaAm0XuFS9zg81Q1fYWeBBO2+qqFtwKyAz6+Fo1F25o0EAy1yUVuiVupOXodBDn
 bit5Ib1242pWiDdqYF2kqG0EcFdDDz5zRwKlcwIyFVdgsmZbVLNOcNibX4j0xgXVfJJn
 R7mnjtLGKcS8woNmVJ8pYuZyYfxAWNrfd5DxWb56XPUKlr/5Sm9bs+QYe+1TwT+nFQjb
 iOddIZwmY/KGtOpzNlRk+LAI2P1IqcIVdyS7NI1l5XdTacN4PHHzJ1YNw/WsrAynTMOt
 RHsBM5HXw8wL4Py6bRm24JpaWKoHMRninzowmFEldqCOTnzPKMrcviq9KGHJRGDiDZlx
 BkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=X33eNVwJacVSZY7X58ULYQouokNiQ8LTYhRpjXCE4zs=;
 b=csOdmsq85fiAmHLAHb5xDmDAt6M0a5tIxy55qTod05rl9vWSCswYVNTiY/tWmv2umT
 aVwzfmNYYkLpUzr5rBnvlG3Wfq2CavPuGgGe22H5YMMSg5IHZWJ5cDEfWWgraF1xLI7x
 mqAW9hyuxEDylwuYMAWYBrs45REgYpwkqVGFRk5nkmkhxWx6tM9H5bRcFm3BJ7Gxgwd2
 0cBxK6hdpAB5ZJtNpbHIBiixuPnHqVVkRAnha54sZ1IuED5jvK41hOgtqbhHWWByFwVt
 PyponaEhrnmLCcY0MZrD428bJzjQs+aB5YthuId/QBRl8EXg6yEuWJ40EKkMGspe9wm+
 7/lg==
X-Gm-Message-State: AOAM533H+inNCE9/hY6gCLzRcE95h0/D2k+9dZPpOMtp4tOUmSfZmVoo
 ZJmw5VdRyJMVAzPBPFQpFtZs8sF4lZ+Bag==
X-Received: by 2002:adf:f88f:: with SMTP id u15mr11724031wrp.368.1619281363227; 
 Sat, 24 Apr 2021 09:22:43 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id p18sm12586171wrs.68.2021.04.24.09.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Apr 2021 09:22:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] hw/pcmcia/microdrive: Register machine reset handler
Date: Sat, 24 Apr 2021 18:22:26 +0200
Message-Id: <20210424162229.3312116-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210424162229.3312116-1-f4bug@amsat.org>
References: <20210424162229.3312116-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Max Reitz <mreitz@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eszqoxYwuIhl

The abstract PCMCIA_CARD is a bus-less TYPE_DEVICE, so devices
implementing it are not reset automatically.
Register a reset handler so children get reset on machine reset.

Note, the DSCM-1XXXX device (TYPE_DSCM1XXXX) which inherits
TYPE_MICRODRIVE and PCMCIA_CARD reset itself when a disk is
attached or detached, but was not resetting itself on machine
reset.

It doesn't seem to be an issue because it is that way since the
device QDev'ifycation 8 years ago, in commit d1f2c96a81a
("pcmcia: QOM'ify PCMCIACardState and MicroDriveState").
Still, correct to have a proper API usage.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pcmcia/pcmcia.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/hw/pcmcia/pcmcia.c b/hw/pcmcia/pcmcia.c
index 03d13e7d670..73656257227 100644
--- a/hw/pcmcia/pcmcia.c
+++ b/hw/pcmcia/pcmcia.c
@@ -6,14 +6,39 @@
 
 #include "qemu/osdep.h"
 #include "qemu/module.h"
+#include "sysemu/reset.h"
 #include "hw/pcmcia.h"
 
+static void pcmcia_card_reset_handler(void *dev)
+{
+    device_legacy_reset(DEVICE(dev));
+}
+
+static void pcmcia_card_realize(DeviceState *dev, Error **errp)
+{
+    qemu_register_reset(pcmcia_card_reset_handler, dev);
+}
+
+static void pcmcia_card_unrealize(DeviceState *dev)
+{
+    qemu_unregister_reset(pcmcia_card_reset_handler, dev);
+}
+
+static void pcmcia_card_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = pcmcia_card_realize;
+    dc->unrealize = pcmcia_card_unrealize;
+}
+
 static const TypeInfo pcmcia_card_type_info = {
     .name = TYPE_PCMCIA_CARD,
     .parent = TYPE_DEVICE,
     .instance_size = sizeof(PCMCIACardState),
     .abstract = true,
     .class_size = sizeof(PCMCIACardClass),
+    .class_init = pcmcia_card_class_init,
 };
 
 static void pcmcia_register_types(void)
-- 
2.26.3

