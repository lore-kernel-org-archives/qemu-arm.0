Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3428504lfm;
        Sat, 4 Jul 2020 08:48:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOdf5NByT7BoYrhYU7DBzxkzVyx5tsUMP0eTQDUZ2/hZFPNA1EFIoJQdFkwa5zBva940Lx
X-Received: by 2002:a25:d0c8:: with SMTP id h191mr68898671ybg.457.1593877713665;
        Sat, 04 Jul 2020 08:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593877713; cv=none;
        d=google.com; s=arc-20160816;
        b=ykxPH2dyhoT3i+HiNlqEczkmZc5THz+0OYmpRJDKUfXb7VrOoX3w3RrtUxXUUVbCIY
         68Eygvkvu+JegkYlCtEaPQjhGue1XlxFEwl+1nUdUBxG/W/R9AZ4vHRx6Nu016eOLUQ9
         U/ZD0exqSrrnmieTt/I3nYqUR/9kiWMgkWYx9iPBKhq2qnSzy3cLQF96GvWA8WxI+UKy
         MZRJtoPZEA+NBNI53lx/48ib+O2JMG+AHhs4Relw29i+SRJwJ+VowckNFMbPlIeCzsXH
         FNmfumkwqZnXhFOHGAHeuDvAjaGWXGkVuCsUcw3zyQsYqDFSnpCmXa3LUO0k8uI0tPSE
         kJZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=RKgZ6rumXDcRDPMbmvtvFrKHcFm+r1xyGKVfqjvJc6Q=;
        b=WHtUGIwNjp8WXOF/bGP9V0BUz16s7gfklR3bZPsePCKybPNHNq30fFpS/GSoENETqg
         8IRP+G8XVUyXzaIBkq6X9+huIPlgcdQ/sqe5/ePPk472kZmQ97loIv3rAEmpPEbaIg5y
         yedpGmmT7IbZdABdMNKa8lXuMKJ/IvNrHTjStEP2i++BW3OvrTyJvEJ6XDnGHSyil6vQ
         1tnTRy65QMeGwokJk8EZEjPDXO3pnatSsy7tLfE8n31i+4s9Yxcxwxj4iHTQDU/J/WhH
         JLQ7FOJpUucsgDkpzeqOW0krW6pzs4/7NvM0vQr9BQ6tDRKNE00f/qV21xhcUPwMi5vf
         a/RQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RmOItFHq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j9si15292131ybp.406.2020.07.04.08.48.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 08:48:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RmOItFHq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrkP3-00005g-1s
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 11:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHU-0002pS-Mp
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 11:40:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33346
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHR-00089r-IS
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 11:40:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RKgZ6rumXDcRDPMbmvtvFrKHcFm+r1xyGKVfqjvJc6Q=;
 b=RmOItFHqrv2r/rVDol+3dwM1pZ8hlwTTXliSnX2CvdGocBMqvB8xPgQaDVsD/Fu78LwnjN
 U6AdubpsIbaIUoBJD/kw3AEPsGX5AivaMxrjL5/chXdnqE5bjm6m2zE/xH191zqLylOugv
 5uey4rMB9STQDK3Cna6D3Ctwa+kD8c8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-BJ5NFu-SPg2CouDFWUTSbg-1; Sat, 04 Jul 2020 11:40:39 -0400
X-MC-Unique: BJ5NFu-SPg2CouDFWUTSbg-1
Received: by mail-wm1-f69.google.com with SMTP id s134so39752022wme.6
 for <qemu-devel@nongnu.org>; Sat, 04 Jul 2020 08:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RKgZ6rumXDcRDPMbmvtvFrKHcFm+r1xyGKVfqjvJc6Q=;
 b=Xe4WH2QLIGPWzMLA5RyVQda8LacLuWcUc8hWAcyZewOEOyILHLdcDSiYwzyG6YDnPc
 Q5b1JVGQARCrKJykeKjYk04WOhRM/sBbg1Sj5BNXOHbQLQPl4+jKIJkH/6VpKh5Tydn/
 uRf81h47VGGCTBfzZCxv1WaDPU0VmcTk8X0su62CeEGNgQI32az1kgrBETc2Ze+Ho/im
 CyPhMjCOmsV1oI15+N5o/gclCmbUvrOKHeyUpXyPZKjQzgSLFioAXyRfVWc6VtHhzyaB
 cJ7HCuBk8hURWNSh6Y3DSOrtt/l0dvkbEn23KmWER1jTUNzjLelXT31MogL7orVwrnis
 etew==
X-Gm-Message-State: AOAM532BXsJf9LDL0XbVdh/agboGZ5jhMnmWXKLo4BVTcmNDacWqb6G8
 fPnaGQW/sD9hCzH+PnGfQrU3bcr7YTzKB1tbNrQZD3ND5FVwJUY1QtWJzGPichzdswHAOgQ9pv4
 Q1cy/lDdYGSBkpRU=
X-Received: by 2002:adf:fa81:: with SMTP id h1mr43381488wrr.288.1593877238234; 
 Sat, 04 Jul 2020 08:40:38 -0700 (PDT)
X-Received: by 2002:adf:fa81:: with SMTP id h1mr43381457wrr.288.1593877238087; 
 Sat, 04 Jul 2020 08:40:38 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id k11sm18662570wrd.23.2020.07.04.08.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:40:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 16/23] hw/misc/cbus: Emit warning when old code is used
Date: Sat,  4 Jul 2020 17:39:01 +0200
Message-Id: <20200704153908.12118-17-philmd@redhat.com>
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
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Nw4ssxAJV0ef

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

