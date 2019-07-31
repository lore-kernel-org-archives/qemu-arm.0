Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5332813wrv;
        Wed, 31 Jul 2019 00:59:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzupOOIcPAS+e998qraHocJJWVfKriPQf2R3y0FZfB6ZYZmVOt/AD8/vQ19RLuiopSDjwPe
X-Received: by 2002:a50:9177:: with SMTP id f52mr105960041eda.294.1564559969376;
        Wed, 31 Jul 2019 00:59:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564559969; cv=none;
        d=google.com; s=arc-20160816;
        b=vjaHD6q6+URhWdJcO98vsDAznZhpN7LAF3LvmgvIxkuAxbFDqoYU4FbSK7c8KtadIY
         ZNSVHh1lvGkGg8RrzHxMwKRGKJvNkULm9tATPDOQ1v4hAmd8mFloUE9CwEaTJqrkvuoR
         C3M1oZumE6g7wc2poJ3Ah6+8j3ZGNLckViy4F9jCWJy5ZfwNxOcLTGKDF3kUqsVwY90J
         3O0dFWuyTFBO/bjM+kJo+M/v5bDZbnC9JoNbgHsefLRq1kVRJd+ZZ/f6q+aeLvxu7j8O
         FAnQ41Dw6zqMLEHp4r87YAyOb4NphFQeVhq0Y5lqihQOvIRVJb4DhshVKOMDGeSIA2Ij
         elzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=MdPUa+6+PT3QSs2hdMtY/A9t5hXVQuVlCKIk02Vdovk=;
        b=eJfmaeluOnRELhyNEhjf8YT8X4w8i/ahhMPz8tg3hcsOz3kg/zQyO4wy+mfgCUlqWw
         WbB6tGsgvmM0oKRiKgenpRTizgL1/J4e3A2vvdnsE+1nWowSzRBczXqKCf/IlZ8miApL
         OeHbaftxHvyHp/O7AOz8xqzhIU+iZdqoowyCH4+kHHxwasYEVZAzXf4NI69cwq8u8Hv6
         4lIZbBL7pQ0NocYuzDuLuDEqMyCNK/W7N/FDnCFZAXON3LDk69JKcvDRRl5N04iP8jhf
         2TV74sLY6F4Tafr18kXkXm4SME8Mu3423u+ZE82VdIpVYW6I2ecAfidYkOEekPZyBIUl
         U+IA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h54si20968816edh.205.2019.07.31.00.59.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2019 00:59:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsjWC-00077v-Gv
	for alex.bennee@linaro.org; Wed, 31 Jul 2019 03:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58785)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <thuth@redhat.com>) id 1hsjUD-0002dr-VF
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 03:57:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1hsjUC-0008Ja-WA
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 03:57:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33502)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1hsjUC-0008H1-Qu; Wed, 31 Jul 2019 03:57:24 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2481612BB;
 Wed, 31 Jul 2019 07:57:24 +0000 (UTC)
Received: from thuth.com (dhcp-200-228.str.redhat.com [10.33.200.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7ADBA5C1B5;
 Wed, 31 Jul 2019 07:57:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Date: Wed, 31 Jul 2019 09:56:52 +0200
Message-Id: <20190731075652.17053-9-thuth@redhat.com>
In-Reply-To: <20190731075652.17053-1-thuth@redhat.com>
References: <20190731075652.17053-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Wed, 31 Jul 2019 07:57:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 8/8] hw/core: Add a config switch for the
 generic loader device
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
Cc: qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ejND9CCvAqas

The generic loader device is completely optional. Let's add a proper
config switch for it so that people can disable it if they don't need
it and want to create a minimalistic QEMU binary.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/core/Kconfig       | 4 ++++
 hw/core/Makefile.objs | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/core/Kconfig b/hw/core/Kconfig
index fffb3d62b2..fdf03514d7 100644
--- a/hw/core/Kconfig
+++ b/hw/core/Kconfig
@@ -7,6 +7,10 @@ config PTIMER
 config FITLOADER
     bool
=20
+config GENERIC_LOADER
+    bool
+    default y
+
 config OR_IRQ
     bool
=20
diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index bb1afe422a..b49f880a0c 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -21,7 +21,7 @@ common-obj-$(CONFIG_REGISTER) +=3D register.o
 common-obj-$(CONFIG_OR_IRQ) +=3D or-irq.o
 common-obj-$(CONFIG_SPLIT_IRQ) +=3D split-irq.o
 common-obj-$(CONFIG_PLATFORM_BUS) +=3D platform-bus.o
-common-obj-$(CONFIG_SOFTMMU) +=3D generic-loader.o
+common-obj-$(CONFIG_GENERIC_LOADER) +=3D generic-loader.o
 common-obj-$(CONFIG_SOFTMMU) +=3D null-machine.o
=20
 obj-$(CONFIG_SOFTMMU) +=3D machine-qmp-cmds.o
--=20
2.21.0

