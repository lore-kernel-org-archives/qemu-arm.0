Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5332178wrv;
        Wed, 31 Jul 2019 00:58:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyoJCpLMtLS6HjKwCvk5X5It1Y+cx2cwij5INaJLzbW8+sC/BC4WLMZS0JCz2VnFG3vQcfT
X-Received: by 2002:aa7:ca54:: with SMTP id j20mr106071909edt.50.1564559920575;
        Wed, 31 Jul 2019 00:58:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564559920; cv=none;
        d=google.com; s=arc-20160816;
        b=M4uJPn49mMEMwOpeVdjdt0vCa/dM3N1YKLaYiUT0WbeZogcO0VJC72xFIUtflNGv3g
         ua5tOytmIuuCDr6mkdTwvCPw1a6NZHTzmrW10ToKEHN4hlxUcRGjnIvLxeOY3iSWEMCC
         TudkhV40Use9MyN0J+RqEyB6McrwuX0HqYH00CrL85/M22LGR+9A03YHJTAcgMGKDJlo
         7Nsp8jehWNih1xh6gtEYGKo7SRMyCHKXXh++lcRXV2ymPxd8mSOYmWukNkqOMa7exkut
         Nu1h8A/F0myzOEFN0pTQQgAyc0UnbetanpZUpq08pPLUqvWGspI/EH3GOGN93QtBzvUc
         es3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=6gYwpAXcvp2k2dOGCOftcHsv8E5BBZ2tvCYzZdfbF0M=;
        b=KfceZSE3XfG7BTFTCh6mSkQO/6MdenPs96s4BzJWlaq2aQWw2Z2+XwQ0yArHP2i3FJ
         XOaMrpxLjF0ux+DYOqQbb/2WTrgLwEqiTXuPWAPlBgp1hnDGWYRrun19I7pSPkQhE1gJ
         B014wJNntQAComMiSoQCxs475rJ1wRe6ZqwSPIY3UmzNK0NCJCNpdZdHTAZTQXclfIe+
         bde/G8AbPpF/M7Y18NqS2tP6vDFmdi7tVoHlYjwaKM8T1AQCymWid/Ktb1GMocI4ixZe
         uLvPeNfHhde88hoKajh9e4Zws2xTYseps73ewZuBE4jov/Fbxwbv/Q7CewnlQRSgxID7
         4GAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q44si19574497eda.375.2019.07.31.00.58.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2019 00:58:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsjVP-0005F8-M4
	for alex.bennee@linaro.org; Wed, 31 Jul 2019 03:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58727)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <thuth@redhat.com>) id 1hsjU9-0002RU-ET
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 03:57:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1hsjU8-00088u-Cs
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 03:57:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36702)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1hsjU8-00086m-7c; Wed, 31 Jul 2019 03:57:20 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 811CDC007359;
 Wed, 31 Jul 2019 07:57:19 +0000 (UTC)
Received: from thuth.com (dhcp-200-228.str.redhat.com [10.33.200.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FF7A5C1B5;
 Wed, 31 Jul 2019 07:57:15 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Date: Wed, 31 Jul 2019 09:56:50 +0200
Message-Id: <20190731075652.17053-7-thuth@redhat.com>
In-Reply-To: <20190731075652.17053-1-thuth@redhat.com>
References: <20190731075652.17053-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Wed, 31 Jul 2019 07:57:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 6/8] hw/core: Add a config switch for the
 "split-irq" device
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
X-TUID: HjKP85lQWcvC

The "split-irq" device is currently only used by machines that use
CONFIG_ARMSSE. Let's add a proper CONFIG_SPLIT_IRQ switch for this
so that it only gets compiled when we really need it.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/Kconfig        | 3 +++
 hw/core/Kconfig       | 3 +++
 hw/core/Makefile.objs | 2 +-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 849195c3f6..6e24c73b54 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -81,6 +81,7 @@ config MUSCA
     select ARMSSE
     select PL011
     select PL031
+    select SPLIT_IRQ
=20
 config MUSICPAL
     bool
@@ -364,6 +365,7 @@ config MPS2
     select OR_IRQ
     select PL022    # Serial port
     select PL080    # DMA controller
+    select SPLIT_IRQ
=20
 config FSL_IMX7
     bool
@@ -442,6 +444,7 @@ config ARMSSE
     select IOTKIT_SYSCTL
     select IOTKIT_SYSINFO
     select OR_IRQ
+    select SPLIT_IRQ
     select TZ_MPC
     select TZ_MSC
     select TZ_PPC
diff --git a/hw/core/Kconfig b/hw/core/Kconfig
index 984143456a..fffb3d62b2 100644
--- a/hw/core/Kconfig
+++ b/hw/core/Kconfig
@@ -15,3 +15,6 @@ config PLATFORM_BUS
=20
 config REGISTER
     bool
+
+config SPLIT_IRQ
+    bool
diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index ce337bd7c9..bb1afe422a 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -19,7 +19,7 @@ common-obj-$(CONFIG_FITLOADER) +=3D loader-fit.o
 common-obj-$(CONFIG_SOFTMMU) +=3D qdev-properties-system.o
 common-obj-$(CONFIG_REGISTER) +=3D register.o
 common-obj-$(CONFIG_OR_IRQ) +=3D or-irq.o
-common-obj-$(CONFIG_SOFTMMU) +=3D split-irq.o
+common-obj-$(CONFIG_SPLIT_IRQ) +=3D split-irq.o
 common-obj-$(CONFIG_PLATFORM_BUS) +=3D platform-bus.o
 common-obj-$(CONFIG_SOFTMMU) +=3D generic-loader.o
 common-obj-$(CONFIG_SOFTMMU) +=3D null-machine.o
--=20
2.21.0

