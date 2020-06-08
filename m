Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp5211012lfc;
        Mon, 8 Jun 2020 09:11:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhCtElurbGagCoklM4v40kyy1OpHz60f35407XVmMxOWGnhzszkVQyAZEcZckzFnNlBdr6
X-Received: by 2002:a25:2582:: with SMTP id l124mr39379143ybl.59.1591632663656;
        Mon, 08 Jun 2020 09:11:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591632663; cv=none;
        d=google.com; s=arc-20160816;
        b=iIHudF/eOno9K2Sk+/5gFxJcFLjEYEs/CIhjCRjS5toL4C9PKkXITjwUPSdSye2BHO
         WJ/Yn6vBMpVh/bR5m35/wCqZPOmFBABagytfwKfoeUZRfCxCuc32VL4Lguz26vjiIhil
         HK1tQFX1wpnb1T/et2lI3cjhC7Ym7uCb+oUgI5UmbO4t1tJUKgEhHruzKEy2qVoBYUvM
         8D9p11lXzq/RCxXlj/RNU/odhp51KjuVMcRCmVOZKKgj9LizoUQK8D7PhilS8zyjzkQj
         DCfl9vfUY3Zu/zgfL7WkS/fvWmA4FU4c+/l4eXrVxh4XpwN3o1OpEfCM7C+iO1QAr0cc
         KmEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gxT4B45O1zWyFYki8IWzx+7CIdrw2K/5FRLdU4/GP/s=;
        b=cuvO6B+e99t/iN4IuYT7x+CZKyNNaekL+z0jUNqHMNL1ouZSSjKio/P58ow4yF/jRq
         dkOhWZyevhoB6t5VCU10Q/oSlxQ4i9MLS64JZsM02XwgbSqoE5c3ahMciM4omo3JqbOS
         9BPmXazzlMYJGagTyqvgGRUU3LX6oOEY378V+RXZDz0dwJbYfHCM+J0TQNxvJPcnjp47
         mx+qSHm0bC3qDPV9ZvG2+q30VO781f6gsyl5RoAFik6cKkEJGtwVjL+6EVNHVp4dZdLR
         ee2uHIuC/D7IbDw/B5PnLjn/TK+jx7tAR4JnuDkPgWnU3IprkZWGfYw0ktfG78fbghxM
         Y9DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=N2DdErRq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q66si71051ybg.144.2020.06.08.09.11.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 09:11:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=N2DdErRq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiKMY-0001an-QK
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 12:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKDX-0006Lc-EI
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:01:43 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:41109
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKDW-0007iV-9O
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:01:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gxT4B45O1zWyFYki8IWzx+7CIdrw2K/5FRLdU4/GP/s=;
 b=N2DdErRqsyskEuGnIL6IIOra+szxgFTHezrH3k0nylRDWuV5ophAD6etCKcTawrsz+1NAp
 GZg3tyFIeLDnBXR5q6xZgD9JXWkA9kASGqE/FAzhtm4i5fxoyVhuZABTJwOglFafAz6Z97
 +HVomMRl/DPlD9V7hNYGcjleYUuGI7g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-362PPhyeN7i7mJs0M_H-QA-1; Mon, 08 Jun 2020 12:01:39 -0400
X-MC-Unique: 362PPhyeN7i7mJs0M_H-QA-1
Received: by mail-wr1-f70.google.com with SMTP id n6so7361920wrv.6
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2020 09:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gxT4B45O1zWyFYki8IWzx+7CIdrw2K/5FRLdU4/GP/s=;
 b=Yu7jpQ/sijFtjkLp3uIQrv0bp9fIAqBtX4irTILIxbfHAhv+VnZ5e4zwN1HVLe6jp+
 ZJiITqROqGl1Ukmr/ljMP4h489ixaTdaV0PqprgW1GHT3oyrLSE7PBhQBUu5d7e5W6R5
 RzG/nO1Yz6uwVjOBHggZRi8DdQzBBNAlIOEsoMxnSjodrnsn/DluBZemCdi2tNxUZRYF
 pTTaW1TJEnpBg6jCULB98Z4Eqe6e5bbaA6UVtQa34JXNhGDbq/yuE7bwqj8u+Q93M6Zw
 +IAkFCqHUfjdvHqSrgsGxhStzCQtB1uq6l4RbnlHOac3DvPVh5SmNUTh1huQ5TT9YYC2
 95jQ==
X-Gm-Message-State: AOAM530DXGqBYVriiPNwxR/+iwNFggHZH5v9KZX3WINK3ohwshnas6nL
 WO1BizR79wubiiOaTlFmBgDfGHSuQwEGlSnYjfr2PUmFln7Hlo7S7GdgeMRGT4BDJ02nKIMny8X
 CFN+vGMqBwjDg
X-Received: by 2002:a05:600c:2215:: with SMTP id
 z21mr76249wml.48.1591632098181; 
 Mon, 08 Jun 2020 09:01:38 -0700 (PDT)
X-Received: by 2002:a05:600c:2215:: with SMTP id
 z21mr76223wml.48.1591632098001; 
 Mon, 08 Jun 2020 09:01:38 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id g3sm188327wrb.46.2020.06.08.09.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:01:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 09/35] hw/display/ramfb: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:18 +0200
Message-Id: <20200608160044.15531-10-philmd@redhat.com>
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
X-TUID: LpgQnAt+lUhV

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/display/ramfb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/display/ramfb.c b/hw/display/ramfb.c
index 79b9754a58..a4a427e5c7 100644
--- a/hw/display/ramfb.c
+++ b/hw/display/ramfb.c
@@ -18,6 +18,7 @@
 #include "hw/display/bochs-vbe.h" /* for limits */
 #include "ui/console.h"
 #include "sysemu/reset.h"
+#include "hw/qdev-deprecated.h"
 
 struct QEMU_PACKED RAMFBCfg {
     uint64_t addr;
@@ -120,6 +121,8 @@ RAMFBState *ramfb_setup(Error **errp)
     FWCfgState *fw_cfg = fw_cfg_find();
     RAMFBState *s;
 
+    qdev_warn_deprecated_function_used();
+
     if (!fw_cfg || !fw_cfg->dma_enabled) {
         error_setg(errp, "ramfb device requires fw_cfg with DMA");
         return NULL;
-- 
2.21.3

