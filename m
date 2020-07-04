Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3429124lfm;
        Sat, 4 Jul 2020 08:49:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtlsYAIf6sWrLOB/OFhPlstQ+oqbz/wv5UVl60Fap7v9LtgRwnmc86kKY2jM0I0/wrvE5w
X-Received: by 2002:a25:1941:: with SMTP id 62mr73826186ybz.16.1593877776229;
        Sat, 04 Jul 2020 08:49:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593877776; cv=none;
        d=google.com; s=arc-20160816;
        b=X/3/VefSAp+UQO9jCVKd/qFSomCSz3ar8h6UlgW/hcoqBFQnyRClMOLsBWbMAgleSf
         vFRN4XnxOprMTRn20HapYYmWN4ArXIjDMdZjE6GdWvY7gzmr4/yHjfNKcSlxEKCmFIIy
         lVLY84JidvGMsU+Paz1JWEAzcljEE/3/xU3xCqYV4lBBCnSvbKNG/8mnvs5tpJSZCIB6
         tBQ50qIy1Epog1QMpsnIDP8Mqtp6kN5cZdsR4VYCZoyeKIvtkA21MOTeODp4xMhqdMbp
         vfbkwOC63/zbwyZIeYQCpZsp+yHV54/9eGrP8TDORVla/iWx2TzwFikKOiSjNX6tiV8w
         f18Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=T05aSWsXj6XqlyyRKFN7AiT8E00rxZAH7ivGzBAXguo=;
        b=vxLINhB/Y3EkBD8ufgnFyPOKflo50zYbqd57O5lY8tUA9u7sRdJciefPOlBiM1br9m
         sT7/cx39QfmLq29VoR37pad+vHkrxdpSbmENb+3nG+AGKQ/xGhoNtp2cjy0b1AKeYOdp
         +B0t1+RmkG3+n31mLnBVExe1R3Ts8pY15JMp7twG90yoknEoC1V0Y/CwUlvJjxMnpnq0
         PoNiXOIodPJDkzEiCH0LRdN7Q1IedzmnZ3p6Nok5eC+Z+84XCAAGaVFmuuVu4jw3Xvmt
         LrWF9+h0OMHqyfKfpegiOQVbUtVFMwWLtdAr5102V3Wdp+BRVbqBqKqWLXkFvW7DfxFt
         B6VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="fqFPwnI/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x7si16929993ybt.212.2020.07.04.08.49.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 08:49:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="fqFPwnI/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrkQ3-0002nn-H0
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 11:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHz-0003Zj-BS
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:41:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20647
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHx-0008PA-Qe
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:41:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T05aSWsXj6XqlyyRKFN7AiT8E00rxZAH7ivGzBAXguo=;
 b=fqFPwnI/niaIUFNl6cM1EH1O1EbAL0c0TEvzZDpkXQlwOm1h0pQPRSi/WHVADh6Tpb7PD5
 elV8EQyej2KALpvPXr/LlhtBJOEZG2JiEv050fUb5uJz7UaX7sdYwBSeXcOy3glq2ch0iV
 NX0Y9+mSpPpiMgEGc7daYhE7tMSAxo4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-KW_eunmAMuWuPEOOEVqhtA-1; Sat, 04 Jul 2020 11:41:11 -0400
X-MC-Unique: KW_eunmAMuWuPEOOEVqhtA-1
Received: by mail-wm1-f70.google.com with SMTP id s134so39753977wme.6
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2020 08:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T05aSWsXj6XqlyyRKFN7AiT8E00rxZAH7ivGzBAXguo=;
 b=EdtkP6wFX0TJn5LTGiCPdC7UiTlIpO+i89ESSnNCDaqkG5Na6MvWJJiQG5cQRO6O0a
 11LnkZIOfI4GAFVievFZMvi9x5iJ+f8v70MVia33GlyVejqLC2sGHKRRSVcutBvZM9yZ
 lHgLUxFo9iQtvRPh4wrg2LJpZAZWhDm1GaGIRpxmheMwqtA6YOceWvZ9KrZgwW8dNGoN
 PD9+mAkYt4DJgv4b4wmSTGaU/6KOfcROJZJhgbG28Xj+HYPymIxc9V797VNFigwTPojy
 3/xN7hIxSiwdL41xHyRA2LsJcz2XqkjfU1nXcgSM3bs2CBJQSq8AWtaQJl1uAGk4nw+N
 JhGg==
X-Gm-Message-State: AOAM530BmUeo0EQ31SQAyUKX29WReuDO/gKeU25mgxrZu1TYelrdRprS
 3DtVPkA7UoqUmskGP2AIofuaXacNOYEgIBtOUpjxBSFuR0qrlUMy4tRvyFwkdCZ1Dj1OGXXsd5d
 ulM4MMwOVsCR2
X-Received: by 2002:a1c:398b:: with SMTP id g133mr40165706wma.76.1593877270491; 
 Sat, 04 Jul 2020 08:41:10 -0700 (PDT)
X-Received: by 2002:a1c:398b:: with SMTP id g133mr40165682wma.76.1593877270343; 
 Sat, 04 Jul 2020 08:41:10 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id h2sm17134778wrw.62.2020.07.04.08.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:41:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 22/23] hw/usb/hcd-musb: Emit warning when old code is
 used
Date: Sat,  4 Jul 2020 17:39:07 +0200
Message-Id: <20200704153908.12118-23-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200704153908.12118-1-philmd@redhat.com>
References: <20200704153908.12118-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 "Michael S. Tsirkin" <mst@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F+Qq8LPv+TUW

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/usb/hcd-musb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/usb/hcd-musb.c b/hw/usb/hcd-musb.c
index 85f5ff5bd4..f09464ed5e 100644
--- a/hw/usb/hcd-musb.c
+++ b/hw/usb/hcd-musb.c
@@ -26,6 +26,7 @@
 #include "hw/usb/hcd-musb.h"
 #include "hw/irq.h"
 #include "hw/hw.h"
+#include "hw/qdev-deprecated.h"
 
 /* Common USB registers */
 #define MUSB_HDRC_FADDR		0x00	/* 8-bit */
@@ -378,6 +379,8 @@ struct MUSBState *musb_init(DeviceState *parent_device, int gpio_base)
     MUSBState *s = g_malloc0(sizeof(*s));
     int i;
 
+    qdev_warn_deprecated_function_used();
+
     for (i = 0; i < musb_irq_max; i++) {
         s->irqs[i] = qdev_get_gpio_in(parent_device, gpio_base + i);
     }
-- 
2.21.3

