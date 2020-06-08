Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp5222106lfc;
        Mon, 8 Jun 2020 09:24:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsgbbUBJI8EyMJzBd6P8GgxdEOvHsA3V8uj1yz3U9HUdcCJF2giqeeeSxAUeW+vZq/UsxO
X-Received: by 2002:a25:d088:: with SMTP id h130mr15628119ybg.451.1591633475171;
        Mon, 08 Jun 2020 09:24:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591633475; cv=none;
        d=google.com; s=arc-20160816;
        b=BbivxQsjp/3zvEtHrzzXyBukIPuLzz3BgNy0ICPCoSwPNCkW9k4rRVwij2JMch416m
         Yo8xi8z4pmX3DMIk7ycvCIa19PFPUjNpwOXeTNfo6G+Zx5E12u/H3W9CzHqOMwQ9P2qp
         fdbOjiczuFKvwKP0UIku/dJuTi1x+b4/nwciyxiiiPYxuqnytP/CtqU9wZCMpAA9hFKW
         aOuBSwsUJSke9WBfml2DbDgl5GfoADYepUoaSyABUWlc4QbnngIOIfWW4KXNYpXQFH/i
         QnEnhbvRr11yYH87kAwz+yhBiMEngi58TyOnyB3Eur+xHbZCkIChH14HWZyu0dOwsEQU
         BUag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=RKgZ6rumXDcRDPMbmvtvFrKHcFm+r1xyGKVfqjvJc6Q=;
        b=czFbgIy55jLi/EC6HZATd9iQamiUiSQIGSun5Tmyu/rpDHJrzX/zrk++CfPZl3BEKi
         lTXOHiE9GyJ0IdnvMoj4rTXRBvKItKKwS/6jzAFZv1dBLNljuCc4J1GIS03/0DPC/KRA
         RACSwQs+4qqvRzJZRC+DWQP9WsafP4TKU5iQO4LeUFSdKDNhGYUWUwC5jhpt+jOSvpf8
         yY7iS+PIKzCUCj+VakxnzFOXGH0N0S3FeEm8oQZjFwisZNS/J87tn4BHxEijI9uBr4og
         B5jm/N/huNpWD/38UViuZHwEUX5Oz65KRdoWtiRDslBF5upjbXzGdpXumd9hkU8lx2Fs
         7mqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OhDtzQRz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e127si64960ybf.458.2020.06.08.09.24.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 09:24:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OhDtzQRz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiKZe-0003XC-Ft
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 12:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKF0-0007Kz-Lb
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:03:14 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:50648
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKEz-00088K-To
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:03:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RKgZ6rumXDcRDPMbmvtvFrKHcFm+r1xyGKVfqjvJc6Q=;
 b=OhDtzQRzBI4Jp7yTGyCoPjegWJ/GaA8s7jGFT4yvl5cyvXWJbt06f2QIJCuG4upHRSrw51
 B1Vn3UTKKkD1mYS8iiAVwhXhvr2+yC6VOS4sRhUflP8u1pbP4y99oeHu6huceThSBNyA6/
 hUOZ5CCNs6Ns5XBhmQ1BvKJ/Tf2qcjk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-p5Hiqf42Ml6DqBPZym1DIw-1; Mon, 08 Jun 2020 12:03:08 -0400
X-MC-Unique: p5Hiqf42Ml6DqBPZym1DIw-1
Received: by mail-wr1-f72.google.com with SMTP id p9so7363305wrx.10
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2020 09:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RKgZ6rumXDcRDPMbmvtvFrKHcFm+r1xyGKVfqjvJc6Q=;
 b=TIuo7VKeYgFR0NRVk9/HweH1n9Q9bMzL6wDxiqqGvBJG8+AdhavRXmRboXU9Wbp2Uk
 0klQBs/KZlxuOu64pOIorBTuy9vrSSKhBZ+hPVHbrDUbAnXjY/4od5wnkl+o611TxvoF
 hw1wlKWubVWSJ05Ea6bYS5kJBo3oYUlxe5v/8kR9M3W5woGF0z7STgSKyHOI9KOH460o
 M6ZS8sBdDTut18+H7Ps2aPzv4EhtNm2OMzn2XW1P+bU3yrEj9y7BjGj1SKfbkClZRLcz
 Bo43X3Yhq2fTyWxV+UtvwoR+P4oxZXnLv43JL+JB4FVH9LqksdrZpJRJpJ6DzGGIm6Uq
 imHg==
X-Gm-Message-State: AOAM531vGbW+47JEQlgtTwu4IbR3oArwd7B56LpZB7muEJWd+0dYBxBl
 9irxeMt2OwSBybBxaImjgj0t0BD+nu6fZIbOoaUkyDlWU/wwf1u4+UXRMHExbl8YY4oCsRwm9al
 aIgtV3I7ZSDOn
X-Received: by 2002:a1c:a906:: with SMTP id s6mr21532wme.171.1591632185579;
 Mon, 08 Jun 2020 09:03:05 -0700 (PDT)
X-Received: by 2002:a1c:a906:: with SMTP id s6mr21489wme.171.1591632185399;
 Mon, 08 Jun 2020 09:03:05 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id g25sm30434wmh.18.2020.06.08.09.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:03:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 24/35] hw/misc/cbus: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:33 +0200
Message-Id: <20200608160044.15531-25-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 11:58:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: y0zWfahbuZF3

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/misc/cbus.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/misc/cbus.c b/hw/misc/cbus.c
index 3c3721ad2d..24e197684f 100644
--- a/hw/misc/cbus.c
+++ b/hw/misc/cbus.c
@@ -25,6 +25,7 @@
 #include "hw/irq.h"
 #include "hw/misc/cbus.h"
 #include "sysemu/runstate.h"
+#include "hw/qdev-deprecated.h"
 
 //#define DEBUG
 
@@ -135,6 +136,8 @@ CBus *cbus_init(qemu_irq dat)
 {
     CBusPriv *s = (CBusPriv *) g_malloc0(sizeof(*s));
 
+    qdev_warn_deprecated_function_used();
+
     s->dat_out = dat;
     s->cbus.clk = qemu_allocate_irq(cbus_clk, s, 0);
     s->cbus.dat = qemu_allocate_irq(cbus_dat, s, 0);
-- 
2.21.3

