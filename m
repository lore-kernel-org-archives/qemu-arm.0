Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp5209250lfc;
        Mon, 8 Jun 2020 09:08:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWaMy5rqaZVCxOEjGmPWWsOMTqvcHo7k3ejoK3sbtoJW/eGyGHdCXoeG0YhElWkF61uTkQ
X-Received: by 2002:a25:cfd6:: with SMTP id f205mr37381553ybg.363.1591632539014;
        Mon, 08 Jun 2020 09:08:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591632539; cv=none;
        d=google.com; s=arc-20160816;
        b=Z8MiwiSyFW7f4hdz5u1RBldsgoqqQgTf8Nc/N1V+EnLom0PAtvBs+gHkZitWml0mDB
         eDisoiUkc3Mya17rA98I6Ud+bi6HgYkewb92MeY54FMh/YskoYo77wLtuoIb6fzlOufL
         KjuU9CP/ixLbowDJ7qode/Zwbk9Q3ht2xfFTivcbPcUPn7ufxSc6O7haZoTGyjedy3m4
         QpMZY1vXedQs5EPIUazX52BM1NPkpdCi4CgLk91qKYElSdKry/kIDkon/jKHnJEUI7Ai
         vQe2egwDKmCBd5eELgWtACuurCPAuVlNDZ9+DoG2amoARInUlLeqDlzCJ/qq9i1IGLC/
         KSjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uHbfMTMnP0pPoIUOMaNBIF3qcn8JPSW/pdevUa2NjDA=;
        b=jriG/NC0T0CMJO/JL/TU7EG4Ixp7uQ8GnLcQ26I/FXsx4K8bikqk79Ed1Gfo05C3Be
         lGlJW8ySMET9TSc/3WphDYj3z3EtTlNoBVwz4t1+bDZDqqGvgOqnt/peq246/TXxW9iz
         39obZzlekw3FzaLe1G7Gv1Vh6WMznw5mdf+ia/QROo3pnTixWMaAuJJvyh1gMVz8MFka
         9tnda6aVLV7oZvVwNR5bfoueQChGzXvc3/1rmYRNeTXCU484qEdQCVot99+vutmxBBBg
         USp2GcwxEJlhtGoEozYruCIJ5XnWcNFjUsBOqCvHbYJ/WcLJu9T6o9MLa0LprNL6DHZI
         qAEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FpF4eDcf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13si66820ybk.162.2020.06.08.09.08.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 09:08:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FpF4eDcf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiKKY-0006N6-D2
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 12:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKDn-0006WS-Lr
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:01:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40471
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKDm-0007me-CY
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:01:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uHbfMTMnP0pPoIUOMaNBIF3qcn8JPSW/pdevUa2NjDA=;
 b=FpF4eDcfAtrF/PCga4L5v4LJ/fkMSyuZchTlSs/sjRwmrIZHt3KruPO4ic/slfdA7ekyOW
 TM8fg+jamCenJ88JGGsbY4EPbKUd22wgmF1++KUf4LfZjlKIgd65Y9riR2USmHzLPFTDkR
 0WrCCxnwwAnU/vRsqjHkN0o/tf2Mzmk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-U1NG5WxhMKW8Cv7mLs3L2Q-1; Mon, 08 Jun 2020 12:01:56 -0400
X-MC-Unique: U1NG5WxhMKW8Cv7mLs3L2Q-1
Received: by mail-wr1-f72.google.com with SMTP id p9so7361868wrx.10
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2020 09:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uHbfMTMnP0pPoIUOMaNBIF3qcn8JPSW/pdevUa2NjDA=;
 b=UvGfWO4+QRtZowxnjOl9JXgSqQfrJpYFCzUwj0UpGfAjIDynud6+g7WwZLlgIMVEos
 2fxB31TzciIwucuF++e3DGqx1hCHhhAkhxzNs2lHx95tk2eqJ6EOLC/g3++wCAxIX8q3
 OJ9vN6VrQBZOL7uWcqpwYqOFu/La5omu4H1gkf+AhOlZGYm4IxVD26fAAqCdlA+Nbmtn
 seev0WyI018bJdon2zNFLgJoT1dz7zRNeUGzPXDF77eSv8dVDclhzii1i4XIwzdMJRAz
 ofQrM2h9g8BEW+3CcDMf9U4tsZRHbrGvvyc4O8aC69aVkOo7U4BfRw7CK7lwNxt1R0ow
 mZ2g==
X-Gm-Message-State: AOAM5329UAjN0rjbnYhwk4WxkfdLHIVJ+uC/cNcr7xJC96TxcnQDd7WT
 NDDJ/JnMhNrRxDYoxwJgPLVT/bJWWxq8ZoSBc5Mfujemu+YndlGcKvWHKGk/pNz7EgSFoHgK7QR
 o+LRaYhjDn+r6
X-Received: by 2002:a05:6000:4c:: with SMTP id
 k12mr23864558wrx.215.1591632114950; 
 Mon, 08 Jun 2020 09:01:54 -0700 (PDT)
X-Received: by 2002:a05:6000:4c:: with SMTP id
 k12mr23864524wrx.215.1591632114766; 
 Mon, 08 Jun 2020 09:01:54 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id y17sm194731wrn.12.2020.06.08.09.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:01:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 12/35] hw/dma/etraxfs_dma: Emit warning when old code is
 used
Date: Mon,  8 Jun 2020 18:00:21 +0200
Message-Id: <20200608160044.15531-13-philmd@redhat.com>
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
X-TUID: uCTeiHk/oaJn

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/dma/etraxfs_dma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/dma/etraxfs_dma.c b/hw/dma/etraxfs_dma.c
index c4334e87bf..d2f7e7ca9d 100644
--- a/hw/dma/etraxfs_dma.c
+++ b/hw/dma/etraxfs_dma.c
@@ -28,7 +28,7 @@
 #include "qemu/main-loop.h"
 #include "sysemu/runstate.h"
 #include "exec/address-spaces.h"
-
+#include "hw/qdev-deprecated.h"
 #include "hw/cris/etraxfs_dma.h"
 
 #define D(x)
@@ -765,6 +765,8 @@ void *etraxfs_dmac_init(hwaddr base, int nr_channels)
 {
 	struct fs_dma_ctrl *ctrl = NULL;
 
+    qdev_warn_deprecated_function_used();
+
 	ctrl = g_malloc0(sizeof *ctrl);
 
         ctrl->bh = qemu_bh_new(DMA_run, ctrl);
-- 
2.21.3

