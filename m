Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3428237lfm;
        Sat, 4 Jul 2020 08:48:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNl3weq7tdzES+BnYTn/UxVWeKb4pDbtlDJprqSb/K6dlgxd6tuGG2EWiwOFNuWrXIyOBK
X-Received: by 2002:a25:606:: with SMTP id 6mr71379152ybg.308.1593877688465;
        Sat, 04 Jul 2020 08:48:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593877688; cv=none;
        d=google.com; s=arc-20160816;
        b=cRLI77GVGEtQlDCOJtVkEwertdFZxoS3JREtlsapghQb+8jgwjtwPBhCstaX5V1znO
         VjUODytOf16uH30OotmqmL5O89WR0DTY1XZwjKPQjCSC353QWRvxvVcUjyv8K7mkcnKY
         eR3+um+6IIB4jcUouHodOBCDFTPXKhV7feW8JeWzY+Mc+QxrfUXnccXV5BhFWrzc55Ld
         gjvl/AUVWx/RCkJ9BceTnDmNs/+iNqsc6Eo/Vvq0gau2YSrQtDyq7kiEVx828sMV13f2
         aVekECbujw5vc7K+auQYjwnb3qRZsuofSNY2cSNMnwQQ9FxX6CyWIsUzeyLwfqoy+J1u
         8p3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3WzkinKDRWpQmIIO97X+MugaJnDZKw0ffp1ti6/ctwc=;
        b=SlhqLyVbaTi4RmIx43KWFo/jwpth0DEsKugsYGKS9Pgf451DAkGyf7MQQVB7eHWHr4
         X8HdGxs415lOfp1OofOT/vZlxv6AWUJuOE4aP+amjc0NxfOmU1q484U/n/Ti6EuELhKh
         qX5nrw9AuwEJA/0lvXQvJhxNiUCg8nKN0HdXCpvr/pDtG/5oAOaH62qoWzlLSRaM4o/c
         quYafCZZb/fI+FIH56RSk+DN6RheD7WgBn9bHyg7Eke0ekLMBV9zePGigl08/R4vzQ0A
         GtOkOVPYQpxtPgy36ZUCZNuQPBpj/Hmgs9Ls3xn1MFW+K4xLS96O+uGikTT3MZ9DYgMS
         ZrsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=avIMi6Pq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5si957938ybh.163.2020.07.04.08.48.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 08:48:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=avIMi6Pq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrkOd-00089v-OR
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 11:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHM-0002Yu-WF
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:40:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45428
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHG-0007yi-PI
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:40:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3WzkinKDRWpQmIIO97X+MugaJnDZKw0ffp1ti6/ctwc=;
 b=avIMi6Pq8r0LZwQbB+qMcB37grQ5bYVvr+Wb/bOp8j6W8vywSNEYt9P2B0lzBCG2a6sSum
 Qh8IyYiBpA0PAdDaUJfDW2xzg9CUts4CYX4lRFgTIjxCmAr9Lege1KEYwhpcZiOxpibRmm
 WXqPZvdvNL4cx7s365jpnQvnIo/cvA0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-5I16AVVNOTKKpHhpgV0Uyw-1; Sat, 04 Jul 2020 11:40:28 -0400
X-MC-Unique: 5I16AVVNOTKKpHhpgV0Uyw-1
Received: by mail-wr1-f70.google.com with SMTP id b8so21934813wro.19
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2020 08:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3WzkinKDRWpQmIIO97X+MugaJnDZKw0ffp1ti6/ctwc=;
 b=IfAO7JfvADjHWqL+33wHqBxbaQrPCWci+Y+p3uPwD3rzVb72rsF1RH9xJ1YmOWYNE7
 oflXVH4Ss3OZg2/Grco7mY7INasVg9GBJYXx24s+iWVEM1zIiai6tPLVN9QocXDfe88+
 fXjB/K11iUcHMLZLKt27/KTs4B14sKCRRV/u6gcYN8vQ+yiL0tmXSbKb5xlqR/lHF5ML
 bpd3PqV5WTsUYgvyjVj3O7rTfeVUcBaZ4BBv4/Ntkm56mrJVTAfaeV1P+ZHajmtcO5jD
 PIowsRfWjrujFcYoqFGGyLSk2mWZNV40oY2ay4prZ3nOnvQWMxF8cNZz4hb8qNHwEAHA
 +VBQ==
X-Gm-Message-State: AOAM533FnleccrNbQGl/VysFwzDWtQeJzDpom7QQiAuHFJb+G4+d2bW3
 oMULNVG/aorvsOMai+SKzlIXtAklkRXHf6lY/miIDVPg8Ohs7B0LyibafMh0ZddmruhOd8nIjae
 6J8Di/kRVZiOI
X-Received: by 2002:a05:600c:2187:: with SMTP id
 e7mr40903239wme.171.1593877227431; 
 Sat, 04 Jul 2020 08:40:27 -0700 (PDT)
X-Received: by 2002:a05:600c:2187:: with SMTP id
 e7mr40903210wme.171.1593877227296; 
 Sat, 04 Jul 2020 08:40:27 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id j6sm17362141wma.25.2020.07.04.08.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:40:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 14/23] hw/input/tsc2005: Emit warning when old code is
 used
Date: Sat,  4 Jul 2020 17:38:59 +0200
Message-Id: <20200704153908.12118-15-philmd@redhat.com>
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
X-TUID: rLOus16Ld5qD

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/input/tsc2005.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/input/tsc2005.c b/hw/input/tsc2005.c
index 55d61cc843..1f97b82379 100644
--- a/hw/input/tsc2005.c
+++ b/hw/input/tsc2005.c
@@ -27,6 +27,7 @@
 #include "hw/irq.h"
 #include "migration/vmstate.h"
 #include "trace.h"
+#include "hw/qdev-deprecated.h"
 
 #define TSC_CUT_RESOLUTION(value, p)	((value) >> (16 - (p ? 12 : 10)))
 
@@ -489,6 +490,8 @@ void *tsc2005_init(qemu_irq pintdav)
 {
     TSC2005State *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = (TSC2005State *)
             g_malloc0(sizeof(TSC2005State));
     s->x = 400;
-- 
2.21.3

