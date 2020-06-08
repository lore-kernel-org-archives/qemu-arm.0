Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp5213182lfc;
        Mon, 8 Jun 2020 09:13:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwsvdiTxIxLS2NDzfeHnMWUv/YWUKPKSPMZpBxa0Stx2yHHOUUXBqxND61I9LV23c95Cu7
X-Received: by 2002:a5b:346:: with SMTP id q6mr12302599ybp.472.1591632807329;
        Mon, 08 Jun 2020 09:13:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591632807; cv=none;
        d=google.com; s=arc-20160816;
        b=qxSF9PkS9NqMwax69kLzKouZtCGzCTujp3CbDThmDQmX8rF1fhHcZ9MZmd0dfbtGBe
         7JNsfDTbJAEInG7apO4vSN28LTBn8wZv26w198iwBjmsfHv+mPJFIPD2aP8fOXWTc2mz
         iw9CCv5Zbok6Jfrn+Bd1vDG+o1WbxBHMWMtyn1uDDVK5jqh9sTBqP7dfkkZF8ywnYzfZ
         eIPpfqd6Xma3TFlRm6ZRkBh5UZvCcwiUU620etqW/FBbG7d1hwaB9EeHErqPNDWpW+7s
         WWL0ZrlHK9ZLRjlZyyb+4JIjMeXK7ldbHna1FXa90IvpOuiRPx4Vabt8whNP9Jfk7H5G
         A57g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wevOFGWECaRJOmLpbzON6N0ynWLO2tBiVdtI/WyaADw=;
        b=zuiDpDwh/M5Q/eGR3AtEWt+UucpsnuIo2/qNWwIZ16ZXxK/BsDqcx/EfqXyI5/QBy+
         GdYeVocqD1vnfNDluFEC5Ln3R6tDouDpFieTTQp/q4CRmVqSj9mEkrpQWm116m2a58IV
         pidOPDo2emabeCU+4Cr5pHn2kXBJhQjhT3FBrCf+6REyJEBcXXutv5FG9DI8ru8+UjwN
         UM7SXP+b535IF2KbpyH0/FnDKPtlll8+Oaav46D7YW2hf1GnB/KFAzQookG6QwRGjcHg
         dT3OXOcsw/W7xnYrHIB+itWgOzMkFoycOwz8V2AXHA360XIOi5BT/gHIX/xXIndfDhvS
         OiNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NkW3UnwT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8si42325ybf.393.2020.06.08.09.13.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 09:13:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NkW3UnwT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiKOs-0004kb-LP
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 12:13:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKDd-0006Qx-BI
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:01:49 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51669
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKDb-0007ji-8a
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:01:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wevOFGWECaRJOmLpbzON6N0ynWLO2tBiVdtI/WyaADw=;
 b=NkW3UnwTbxxaLsuKfjS3EBcBjcDhv1go6laBXYOB+rFptyXhwpJ6FoPbvRNNbtIsgYMXwH
 TwzJxY/H5i3I16+12dNHPkTrk5JxeJrafH6n5rjvaa5YE56oGnF1R97P/MNFJQZ20kw8sX
 ivtKzD9hc7IWlS6v81sMyb5TvHRDiCs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-TB_2lOigOhOrMTQLHxxc9w-1; Mon, 08 Jun 2020 12:01:44 -0400
X-MC-Unique: TB_2lOigOhOrMTQLHxxc9w-1
Received: by mail-wr1-f72.google.com with SMTP id a4so7338561wrp.5
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2020 09:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wevOFGWECaRJOmLpbzON6N0ynWLO2tBiVdtI/WyaADw=;
 b=cjO4OHhBPESzd6oRKf6Jg/bu3FF+GAowZ+ZfoJIfSloWMW5FzuenTBbZCueOevdW3J
 Vz9n85WYSju8KFSt1wBLvTvtiYYV7tg9nC+l+b97DcJoOMsiEExRvV2OTtwTkon+iFF7
 MS51ti2SmcFT+IYgVacmCpsijKocvzB6kOiQp4Ok0+W9BBfdLJ7UYUtA7Ru99kg3J1FI
 pQ77FaBXE5qHZyCzcsCUEfXF+5jqe/jiO0MlXz2qaTklo5qFkobBrmgIsrI12j3/asvo
 KZQdEqLvc8JJtp89MUu7C7JL+pfb5rb1RcnoqPLtnEt/o8HfniuQgzGSWxHcy7SoaRHh
 T2/w==
X-Gm-Message-State: AOAM531xt8cpQEAILdsnYNg+4x7xz+mrRMTxvMoqdZPy18dnMNvjpxJf
 +HX9nzxgWloYBHaKAPwhecJ+6fns0pdYOaR2O5++Wva1nqZ7QbDbY2YMc5WKFNPP17judBbiC7y
 7L09jPieFAnE4
X-Received: by 2002:adf:fd81:: with SMTP id d1mr24815728wrr.96.1591632103560; 
 Mon, 08 Jun 2020 09:01:43 -0700 (PDT)
X-Received: by 2002:adf:fd81:: with SMTP id d1mr24815694wrr.96.1591632103352; 
 Mon, 08 Jun 2020 09:01:43 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id b185sm342940wmd.3.2020.06.08.09.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:01:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 10/35] hw/display/tc6393xb: Emit warning when old code is
 used
Date: Mon,  8 Jun 2020 18:00:19 +0200
Message-Id: <20200608160044.15531-11-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 01:05:50
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
X-TUID: GGbYmfKPLEK5

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/display/tc6393xb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c
index 49a676d1b0..e4900e9502 100644
--- a/hw/display/tc6393xb.c
+++ b/hw/display/tc6393xb.c
@@ -21,6 +21,7 @@
 #include "ui/console.h"
 #include "ui/pixel_ops.h"
 #include "sysemu/blockdev.h"
+#include "hw/qdev-deprecated.h"
 
 #define IRQ_TC6393_NAND		0
 #define IRQ_TC6393_MMC		1
@@ -556,6 +557,8 @@ TC6393xbState *tc6393xb_init(MemoryRegion *sysmem, uint32_t base, qemu_irq irq)
         },
     };
 
+    qdev_warn_deprecated_function_used();
+
     s = (TC6393xbState *) g_malloc0(sizeof(TC6393xbState));
     s->irq = irq;
     s->gpio_in = qemu_allocate_irqs(tc6393xb_gpio_set, s, TC6393XB_GPIOS);
-- 
2.21.3

