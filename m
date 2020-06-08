Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp5211810lfc;
        Mon, 8 Jun 2020 09:11:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxe6CtJfbvgydReA2A8nfJGis3f+N573RNQ5J58Vx+Jw9KakhurTd8UAE+/tqmacHS6kbU7
X-Received: by 2002:a5b:10:: with SMTP id a16mr39976189ybp.262.1591632717444;
        Mon, 08 Jun 2020 09:11:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591632717; cv=none;
        d=google.com; s=arc-20160816;
        b=nVKWeURsOL6odRQICKC1I19re6Yom2QNL/QXiGdepFHnpt+5FRZ9aZlfzRx1JL3mpU
         81Y1pnNIRCJjz87+D5T5eBG6lxm6xu9/axVikl6MVARDPmYK0ATvqhznGyk6IN1kPtyM
         hXyj4FBEADD7yV77zgU64Xl6pSHdwjlyGXhvF/HLAXSc3rrD5VtPc//PMG36XyS/knbA
         A6fKb26ALG3dCcNhQSfbLSmH4fY8hLrMJILkqc1Lu5mbdD5vF0mDtkRZEoCZIVGo9XG7
         4vM3xZGvxUVK18RJKrMlPkyx+L8wQdjkeVlS5550pWPFOheTtLTZh/Y5a7Be9fnlR1ig
         V6og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=g5ly0fcUXOf9qpye/9fR2nyQtN4aqsUxjucs8EhlOCo=;
        b=kZPWq1brZsnmP28rD8U3yA+e24cRdLz+ncpmIKhE5LVyMactvNUJWKK86YaYy3hptM
         mvcvb5bbviAxIkv6AY3Z/yasiGMaPZY/ZH+3ZRo5ZO3/NVC7oy/QyXdzuINJmF0+zm8e
         fYdxsuSO5joA+G3gr61/xByyxbmsDPpaiUQ32wMoAg+KA6TMf+f+sjUXRgcSVjkGrd8D
         TUHinlwDv/2NYiflD/J+XM1S5r+Vg1d6Y5jYDIKfi/cGYF+VHl1dItW037GVyKWCfV9t
         2wIT+BusnD4XnGfJvTuMxT51aDN0SOTUTP96WgZgLphWY18KVMqsDCqKhwU0OvYtlLx9
         EkVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Hzzu0cCg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s46si61468ybi.263.2020.06.08.09.11.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 09:11:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Hzzu0cCg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiKNQ-00030P-OH
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 12:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKEA-0006mZ-MT
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:02:22 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:36917
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKE9-0007rT-Nt
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:02:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g5ly0fcUXOf9qpye/9fR2nyQtN4aqsUxjucs8EhlOCo=;
 b=Hzzu0cCgoF/w4uG0tXT374zYmOj8VqoISaXtRQx6han4YxS3p5IVqB02JsKJtYLp3PV6Eh
 jCzJdSMXMHSViecaKcjWiuv0J0IzHdo4lJTsRRcVFCPavSI9p0988T4rwwNxmtqe4hx2YM
 hgSTKgVzRJe+HJpW7rQWQwmt16Z36/M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-egTRBVliNr6fYRsUP2ETDA-1; Mon, 08 Jun 2020 12:02:19 -0400
X-MC-Unique: egTRBVliNr6fYRsUP2ETDA-1
Received: by mail-wm1-f70.google.com with SMTP id b65so8096wmb.5
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2020 09:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g5ly0fcUXOf9qpye/9fR2nyQtN4aqsUxjucs8EhlOCo=;
 b=F76dA8TVa0ylUGxDM+ubGuJv0pDf9VjMkvYaN0tghrogk3mQOrNXRTi4S+ODKYKLQW
 sheiOW4tT3Xe+6YmquXfAruNXEW7NtnPCsN0gQGjRrqfxSHP5k5ju5fif06cRvcB3LVr
 YHFp1Cjl5rF7H1yYlM9tQq7rz80Cp7h+BMZJjLTTzBvoozErqEz/jHEzLlwn3RY6bcnl
 v3gWwYD3NBGVKNzxXFuPE1U0J6mLE3ZkDrn9XCvX8PS1/vTpXGw3GBAbxiZsgKfRLYIq
 hbbEjkJz7bAQmjUTy8ICsbgNyv/4yzqS9+FeUoxgC+yT3iIX7Oy81F9zZ7XZ/OZVB9tg
 2Fvg==
X-Gm-Message-State: AOAM531aM0mq9DEZqfk+E7RYXTdWkyQJWAwV2Lx08jvj5oljazYbJDJF
 dnehiQUKtZQswJkoy4tRFkdFZl56bd0iv2VrTJqvWF503s3rTs9Ewirv1N8Pgeh2P1ESLpC1/TU
 B4Xk7qmeoVmfc
X-Received: by 2002:a5d:6944:: with SMTP id r4mr23775363wrw.169.1591632138155; 
 Mon, 08 Jun 2020 09:02:18 -0700 (PDT)
X-Received: by 2002:a5d:6944:: with SMTP id r4mr23775315wrw.169.1591632137954; 
 Mon, 08 Jun 2020 09:02:17 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id u130sm12527wmg.32.2020.06.08.09.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:02:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 16/35] hw/input/lasips2: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:25 +0200
Message-Id: <20200608160044.15531-17-philmd@redhat.com>
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
X-TUID: wrvxsVZSmsq7

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/input/lasips2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 0786e57338..452244f037 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -34,7 +34,7 @@
 #include "exec/address-spaces.h"
 #include "migration/vmstate.h"
 #include "hw/irq.h"
-
+#include "hw/qdev-deprecated.h"
 
 struct LASIPS2State;
 typedef struct LASIPS2Port {
@@ -269,6 +269,8 @@ void lasips2_init(MemoryRegion *address_space,
 {
     LASIPS2State *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = g_malloc0(sizeof(LASIPS2State));
 
     s->irq = irq;
-- 
2.21.3

