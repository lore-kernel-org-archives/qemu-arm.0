Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3429750lfm;
        Sat, 4 Jul 2020 08:50:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/5JYa0EM8FTW6dpJDBCSON8hXQSyT7kbAZDmamCFOC8+8KfDV4XWr8e3uORk9c0e+EhPt
X-Received: by 2002:a25:d6cb:: with SMTP id n194mr66912743ybg.278.1593877846452;
        Sat, 04 Jul 2020 08:50:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593877846; cv=none;
        d=google.com; s=arc-20160816;
        b=FJMzW8YSGotPWFnSfoBbQGaaDAV5+GdPq9az0SKXDL3NX9c/fazXRj/12gBA2AHPRy
         d/JIk1AlLLdxEpZiWdHOorEXk1j3o8rTdLaRyhdzlvs7uebbktB4lJhC1MwTLkxMOyD1
         LEHyReM37M4aLeZxog+tLC8/M4TtVt0nbqL/7WS/i0dooWgFtuLsGyZ5IrX0AKpubO82
         k3zBRezoyd7/vDMD63jFgSKhrhjzZyIBDha0d2XGD7EXfeQfNaFk0N2N+jo2BPjrHugw
         ROgc32aRIHTq2oisaY98JUXLCH28GIAwLv+YYzIcTHzXlYJfH226Wi2Wc9Kza8xyFFW8
         5jPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zGhDjSAMTvyc0GtSLCXSdOThvesECzDKYGUhUFBvKxM=;
        b=PZMagAnqkH2fvBluquy3i/uMxI2pfewzAwAiMJY5YgJXdolXv/7BkInCg8WYe6M/7Q
         xFKLG0j3uXjwqJEUfNwV6RMA3lpKJcuvGf8iEVZXmskj2HNzzbX5hgPDivdShXI6S37G
         0jiBjVJ0Ommydt2kfQexfM0jPk/wkcVfzxKvS4CPpOTCDIED1Rs2EcPwrWpkEEHaA2yW
         bApoPXhgBwcT1ymWu7YezyQZoklKhFM5o0v0HPoninZw0XxoT9enxM7tpgqt/WZ+F0ib
         2HxUirjNemuM7SgxAZoE2EpfrZcB6SAeOfIm2BY9RTzKzd78D7MheWFEwKrrenVXel9b
         4jKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Yg0cCT3j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q72si14844031ybg.133.2020.07.04.08.50.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 08:50:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Yg0cCT3j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrkRB-0006Nq-Qb
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 11:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkI6-0003nI-F3
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:41:22 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:39595
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkI4-0008QW-TM
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zGhDjSAMTvyc0GtSLCXSdOThvesECzDKYGUhUFBvKxM=;
 b=Yg0cCT3juR5DsaZFHXZtne2PZME530Q+M5RHpu/k8mqhrun6M85UM7ltsKimL3RRvZ+WzP
 KKXFC7z+uNptX8TTDl1REKqSnAt4S2kI7seYrn3+PWDI4LBK+a3HgGKhcxWlZFSlWt5Hjo
 Xvl0c+fq6g/UVaVh1W2dxXfF3zMxu/0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-qRMynaFhP1WwzzqlzNV7Mg-1; Sat, 04 Jul 2020 11:41:16 -0400
X-MC-Unique: qRMynaFhP1WwzzqlzNV7Mg-1
Received: by mail-wm1-f72.google.com with SMTP id e15so39659243wme.8
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2020 08:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zGhDjSAMTvyc0GtSLCXSdOThvesECzDKYGUhUFBvKxM=;
 b=LCGjoQxFQdWJZGqOcRstoGVTombG304e62PtlHy6CNKdSGpzZo9g/wlrJrc5wy/I7+
 BRHsanJ2npV5IjEkhaoJruullV3OZycZNHHRzFITCAJJa4pmvIh2X2VwNkqp9EsNr2gE
 piuJIOfyPQ5vO/fs2uhncyj8JE2Q/ZcDXHz3khP05tJZ0DhV/GFQjjrLZskOxifi8IOA
 XmSh3cyBLGrZESN2Vbu1V8O4oLMLD2mlEH4MFTYy98mKUBgMwo5aYpUwhusJexieZgvR
 /D3Z1hRvdxu38WDJCpXEaT1wJqBBMiOEEXlslNrSKvxMtQRZV7HAYzbR+heKk6WtKngN
 wOdA==
X-Gm-Message-State: AOAM533EEnGX+E7viT6nfAyVKEl8ku9xPLktCqoic5e67vWQnJ5vnCaa
 iJDg77o+kuEh/KN0/P22qbfpHmNo4uoQaGvSYKUjhjiHdIkwPzy4BiwkHgBJMbR1CZ9bQFDIjHq
 aYKPv6l5YD9cf
X-Received: by 2002:adf:db42:: with SMTP id f2mr40958756wrj.298.1593877275711; 
 Sat, 04 Jul 2020 08:41:15 -0700 (PDT)
X-Received: by 2002:adf:db42:: with SMTP id f2mr40958741wrj.298.1593877275481; 
 Sat, 04 Jul 2020 08:41:15 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id j6sm17363975wma.25.2020.07.04.08.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:41:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 23/23] hw/xtensa/xtfpga: Emit warning when old code is
 used
Date: Sat,  4 Jul 2020 17:39:08 +0200
Message-Id: <20200704153908.12118-24-philmd@redhat.com>
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
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:20
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
X-TUID: xgeexb5/A99N

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/xtensa/xtfpga.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index 10de15855a..ddb843e6e8 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -50,6 +50,7 @@
 #include "xtensa_memory.h"
 #include "hw/xtensa/mx_pic.h"
 #include "migration/vmstate.h"
+#include "hw/qdev-deprecated.h"
 
 typedef struct XtfpgaFlashDesc {
     hwaddr base;
@@ -129,6 +130,8 @@ static XtfpgaFpgaState *xtfpga_fpga_init(MemoryRegion *address_space,
 {
     XtfpgaFpgaState *s = g_malloc(sizeof(XtfpgaFpgaState));
 
+    qdev_warn_deprecated_function_used();
+
     memory_region_init_io(&s->iomem, NULL, &xtfpga_fpga_ops, s,
                           "xtfpga.fpga", 0x10000);
     memory_region_add_subregion(address_space, base, &s->iomem);
-- 
2.21.3

