Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp456976wrs;
        Sat, 17 Aug 2019 03:26:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw9HO4tpaKCaNRfNa4Yrr02KRIQAnqvMV6rlAqS+viw5PQ4RWRJZbSiZjrPikwfI+cpNJ6p
X-Received: by 2002:a17:906:d052:: with SMTP id bo18mr12484861ejb.311.1566037578727;
        Sat, 17 Aug 2019 03:26:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566037578; cv=none;
        d=google.com; s=arc-20160816;
        b=u2DvYxAFR/OgsijtUK3OEctMHeAf9UEtGFJjE+VlVsfo/Yo3ZOLisU/tDFlcf1FXw9
         plXqZQrBqtFopNbhiDpSI7WmIf/BobK03S59l6VrcrhrlmWLu+WsdN6QziocqFDPnmoC
         Tk20cledxm8ko9nte2kqesN7gUzXhthpHfjoCdtWYVEGd2ILxUfVumA6gXOhVGxQxjd0
         vqn56JWIABvvQCZVB9n70ylLFDKVyNpAY0jEW/aQRtw1NcKSMaN3Jwe7/pFiJsjLBVEb
         XZWm5x1XNe7c62urLwq4SMEl6r5o27YLVfbC+XbEA8dZZMafIe9/AwuR1kSdMjWtnhT+
         XgUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=v5pFjPvnEtJokkCIEw4SJd+vzJRf3v037RFltUyZd9s=;
        b=xYyAMNvS7RYBG2lNIm0koiyb5pMant8nk0BY0y74qM2I2vFnliqNL93cfhe9Ly2Lhy
         oGvGJUmdZb1mnbgHiPEqEKDOiyf1TCwu9cg09Krz6ktFj42Y9f0crBLcegYNhJvEXmVn
         tGGANHoEX0XePsR+lpFfk1HF/IHiC1glutLl24FKBs6YLDutMsFaQmI6X/SMoDi4fpUu
         ZUVMoKqnyvvMDglH6WY92deswl30GoyqDI3OXNs8lmvJDCQ4qMi56jesFFDf4w144Qj9
         FqePmLhR3x1iHrDdqtdOY2vCqJnhffMuYaFafOkCAB4ChaAcj/88tDcuxNCT3sXgpXKX
         f63w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r10si4096058ejj.196.2019.08.17.03.26.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Aug 2019 03:26:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyvub-0000ii-QL
	for alex.bennee@linaro.org; Sat, 17 Aug 2019 06:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58250)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1hyvoe-00018s-I1
 for qemu-devel@nongnu.org; Sat, 17 Aug 2019 06:20:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1hyvod-0004ln-GT
 for qemu-devel@nongnu.org; Sat, 17 Aug 2019 06:20:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58904)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1hyvob-0004iC-BW; Sat, 17 Aug 2019 06:20:05 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9064C102504A;
 Sat, 17 Aug 2019 10:20:04 +0000 (UTC)
Received: from thuth.com (ovpn-116-52.ams2.redhat.com [10.36.116.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A17A18ABE;
 Sat, 17 Aug 2019 10:20:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Date: Sat, 17 Aug 2019 12:19:31 +0200
Message-Id: <20190817101931.28386-9-thuth@redhat.com>
In-Reply-To: <20190817101931.28386-1-thuth@redhat.com>
References: <20190817101931.28386-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Sat, 17 Aug 2019 10:20:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 8/8] hw/core: Add a config switch for the
 generic loader device
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w6NKVc1eSV5m

The generic loader device is completely optional. Let's add a proper
config switch for it so that people can disable it if they don't need
it and want to create a minimalistic QEMU binary.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
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
2.18.1

