Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp5216723lfc;
        Mon, 8 Jun 2020 09:17:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUBHUtL5FH1Uho3FFtczWzJNPNXfvP76N0vjQ9RCraH3xY3sYigBDfeMSCW7ZKzLBcoLZv
X-Received: by 2002:a25:c3c1:: with SMTP id t184mr39939144ybf.354.1591633053226;
        Mon, 08 Jun 2020 09:17:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591633053; cv=none;
        d=google.com; s=arc-20160816;
        b=Csglj45FvnERQkpPEyshAGvhCEeO9olE+QEUq7RaYqBS53SmDFhA/+cj3dsUf5fBGR
         LqCRTJjVKH2U3bMLoxd6ZtS5okvC9oWr45mSKJ3Q70YjL6pE17+BQyHLfbQThs3QmI2t
         zVu+6Rx/qevE8o1pqfKX8uxfxc0E/hSdf67EvJFGWGKsjRkgJW/hO+dKFlent74n3y9D
         srakI7mb/GXaHJQWgmbTbXuKCu5wnUU03ptDz2F99eMXjNfv76qdf7oArt6M7BNUTB8U
         XD7qav+6q5oX14pCZGvlXsH1iYnvEW5X9ll5gHDXHx0U/wNQhJSEbuqYJq+19L2L0ZH7
         ggLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7Lcxf8cj+CxLJSf8aQEjLTWyUhOWt7SwLOi9PO4gCM4=;
        b=hUTT6ZRtTSRe90tBnU7y+vQYLfDHc/UNZoxhCOC2nXAVHyMsVuflYf4RPti6s8KCEp
         3puw/rAYe9qAjWgR2kaemDuo2xk1EDTNh5GL4LUa4lmfFWp96vS4GTQJh8H0DqEm6Eip
         oCQljgMIPxZ+Dv9ezSUpMlqqgY2EIGVu8V+2bPibrQQB64W/D6K5f1aJESSTiy9ivodO
         fBvlhXY+chxS7AeQKV0K/sG2Xf9gYSiDN3P37zROWB7gkoR0VrZLuJamszrzvbz685PY
         9DcgLVqRZIT1XDig9s5JgT9Wsfry7eX6iCYPe+ZWK4MhN0V3A9wnSs591n48vdrz4BC/
         rS2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ws7dibcH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l15si81466ybl.118.2020.06.08.09.17.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 09:17:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ws7dibcH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiKSq-0002hT-9N
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 12:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKEY-00072j-0P
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:02:46 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40593
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKEW-0007ud-Ub
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:02:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Lcxf8cj+CxLJSf8aQEjLTWyUhOWt7SwLOi9PO4gCM4=;
 b=Ws7dibcH76dLE0IMqS9G+8PrYyLzxFdL2Mzcp1ynzfIPrCCD17/vI0ZiXSlye+Fu7X5+s/
 vHIAfOR4oZQttPgKRoU5jrIaHrUT5x2AsTSubzvkPxcWvv57+AeOE7/wcx3Aql78BIuH0a
 G9Rkc28mHLaJIqQ/9FqHVs4eFodQM0o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-ENT51n1dPWyUyS7QXAPFVw-1; Mon, 08 Jun 2020 12:02:42 -0400
X-MC-Unique: ENT51n1dPWyUyS7QXAPFVw-1
Received: by mail-wr1-f70.google.com with SMTP id c14so7328456wrm.15
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2020 09:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7Lcxf8cj+CxLJSf8aQEjLTWyUhOWt7SwLOi9PO4gCM4=;
 b=QCmEgZcEidckTZkZM9tEhj3k+J0y8rx2IVDu8ng56Q7ZiMa4pZhOy1qLOsWhrVHbWA
 DI5oE+cTdDvmtK3RlCo1D5j6urUT5AcaAKMPdIYd8a4WH4Ly+kNuLOVlD3/85puALxeM
 XAZp+2GxjtI5Op3QI6pXZHHDqzuwEKYdzBzGqqBgY92v8NQwUCPN6dJL+t6mn19ItGM6
 VY8+32B5TlL/csqf81wXkIrxlzqUBfKhoB981KcSnEQIu23h6pgnGu0NPXhIbtx3damw
 kuh0QfYfKNHs6A0eNvm3tBqj9b2BX3noWX0my4u/q3M7b/3323cuIh4TL3EZD5KxT7en
 jzkA==
X-Gm-Message-State: AOAM533/cNf6ZY4+gBTp3H5NYgzIXGzfWa1TodhIX524UAFNv1eXxHeK
 KFDUuwrPni7Bc2PHwHmEX88gxqy3yJ5Z+KvJl1NqVkQ3Z7MTVkl71ACNAYlkupw+DJx3VnNkC+b
 J1M7/o6Zu8fFO
X-Received: by 2002:a1c:6056:: with SMTP id u83mr60179wmb.138.1591632161698;
 Mon, 08 Jun 2020 09:02:41 -0700 (PDT)
X-Received: by 2002:a1c:6056:: with SMTP id u83mr60154wmb.138.1591632161497;
 Mon, 08 Jun 2020 09:02:41 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id a81sm19165wmd.25.2020.06.08.09.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:02:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 20/35] hw/intc/i8259: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:29 +0200
Message-Id: <20200608160044.15531-21-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 05:40:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: fSli48Jzh+EL

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/intc/i8259.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
index 51b27f6a34..9d9609cdab 100644
--- a/hw/intc/i8259.c
+++ b/hw/intc/i8259.c
@@ -30,6 +30,7 @@
 #include "qemu/log.h"
 #include "hw/isa/i8259_internal.h"
 #include "trace.h"
+#include "hw/qdev-deprecated.h"
 
 /* debug PIC */
 //#define DEBUG_PIC
@@ -414,6 +415,8 @@ qemu_irq *i8259_init(ISABus *bus, qemu_irq parent_irq)
     ISADevice *isadev;
     int i;
 
+    qdev_warn_deprecated_function_used();
+
     irq_set = g_new0(qemu_irq, ISA_NUM_IRQS);
 
     isadev = i8259_init_chip(TYPE_I8259, bus, true);
-- 
2.21.3

