Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp5225397lfc;
        Mon, 8 Jun 2020 09:28:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIDPr5VxpMGUbYDDwsr1StWZGcP0hgLZVvPwiTVXZuwApLbFi7JRq0YcJwyOcQNQErxWSN
X-Received: by 2002:a25:e685:: with SMTP id d127mr21688087ybh.265.1591633738047;
        Mon, 08 Jun 2020 09:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591633738; cv=none;
        d=google.com; s=arc-20160816;
        b=0PKHGSYOVLlIcF4pA0p/oCFaWYjRtLVD4P78U7niEcW99e6DRnR4rdQszu6Ju7XwTY
         WCDgU5kSXJdbWOP4H0mURR/hp1B1E0aO/jm6aYsCFFEREHW2fNNXiJcJcVng7a7zcdbb
         RaFyYzfHXhWqCBstjFhzBO68RkGxRuTvjHjEzfVU27k7RjQwvlriTNBPEbMcF+5JuRdA
         a5uWsV8ugAa/mCxruBg0NKVpAMkacaU3jPoSorWhX32G8GqzwWw2GLjIMWIC2/79OD/w
         0Y28/gTnpawn7qVIt2EXR2NYt5niTFmvN/uQ9Wc4/qaLsdHNj6Ef088rWU2/T1pI2jPc
         LGVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6eEd/TZ2fHyvBWvIJ4C8+kCwxjhDxL4elOTIEe035mA=;
        b=e1tnZTynkJ+janz0xpIDBPehiDR5UtcNd15l9/CFLmPXKKytX2cg8OmZSzsk3xQgOz
         sxtp1LLrZ4+Nwji/hcU1kUntLIlSw/8i+K3+rP5qtTmct5V5im8X8WlaP48Kd+C8fdSm
         kioeQzXZft2r0PDrsvbAvwxnq6WENXrp5btflPRuYrBtRb3jHzodyCnRRMzGeDSZtpyr
         y8I1+VE2hYtyCnqGerCphVNFqVt3NXl1Zsmkf0kvKU1kzqF9bfNyj0nxzRkIhCbA+h0g
         Ie/yOY6yOQ/S8qRRr+7EZgQ/EdqUQ0WTFRKhOpn692MjSgsWIw4n/ImxUMIlDWUCSN0B
         mZGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hHuCqph2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i16si113808ybm.105.2020.06.08.09.28.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 09:28:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hHuCqph2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiKdt-00032k-Ch
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 12:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFz-0008AL-7f
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:04:15 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:42799
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFx-0008Hw-IZ
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:04:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6eEd/TZ2fHyvBWvIJ4C8+kCwxjhDxL4elOTIEe035mA=;
 b=hHuCqph27roUMrw8KtTy81Vhjqjimm2gQFdWrtk41rDRuw/AAQL/FGDN+E/vILI+7D7M9l
 Cf6aI1OpL2Myp5c83nUbd8VUPB9/U+RLB+YwkHjMkYWYG1e2/Ir/E7225JnSAgqNU3nr+Q
 OzbpBlhXHBMN4jbDT6y74tv+0IPLcZc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-nyR1RKdMN5WlBHRmI8XMjQ-1; Mon, 08 Jun 2020 12:04:11 -0400
X-MC-Unique: nyR1RKdMN5WlBHRmI8XMjQ-1
Received: by mail-wr1-f71.google.com with SMTP id w4so7367147wrl.13
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2020 09:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6eEd/TZ2fHyvBWvIJ4C8+kCwxjhDxL4elOTIEe035mA=;
 b=e0yALt7zVbZB0PYKqcqlBO5CtoDlRlSpz+vkGAOTN81qt8Se5A63maUEi4R6+iAQcc
 nbB/fs48pLQ2mbhgZwgLi5nkob9Esk/rGZ9sv8xQA/bLX6jdEJonw9k4l//8B5wU+bAO
 gTySlrToD9A4K5Z4f4csXL3jQ+IOJ6yk4d6+GVWrpYk2/8i9z1wI8XohdMGlDbz4f4fc
 ciQf245l6ziP6UBht6ldh+aYYZaRptB8D7BliAbzwNwRufkPMplwc+RMW2gJ3NEVL2MH
 L8hB1OsdXXJEZnrVllVtDYGsi5IZ9CalOEaQtmNmCOGhCkvKoMZZMYeHSmmE8UKNRvEh
 lvxg==
X-Gm-Message-State: AOAM533opzWxOKaenpgabciMjwZ5OMQRphPLpuEN2cbrAUyoGyESfqW6
 45KxxrV5nBGeT64z7ZcqTRUyl3n5XQAveUaojPb795Q/Wek6NNE753A/YunDjDom91D2Ouop4Pe
 EvMvKW+emGiU6
X-Received: by 2002:a1c:bb05:: with SMTP id l5mr28996wmf.141.1591632250053;
 Mon, 08 Jun 2020 09:04:10 -0700 (PDT)
X-Received: by 2002:a1c:bb05:: with SMTP id l5mr28952wmf.141.1591632249790;
 Mon, 08 Jun 2020 09:04:09 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id j16sm243025wre.21.2020.06.08.09.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:04:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 35/35] hw/xtensa/xtfpga: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:44 +0200
Message-Id: <20200608160044.15531-36-philmd@redhat.com>
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
X-TUID: fwF/5cZv4Bw4

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/xtensa/xtfpga.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index 60ccc74f5f..a3c82dc81a 100644
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

