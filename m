Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp5222225lfc;
        Mon, 8 Jun 2020 09:24:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRn4A8Ey9raFBnmPSVZRdgZ69f7rQIOjB3CY5vKEdmc+iyeFW2ibB2Qm4M94DWvKjEMGiO
X-Received: by 2002:a5b:44d:: with SMTP id s13mr38156885ybp.414.1591633482428;
        Mon, 08 Jun 2020 09:24:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591633482; cv=none;
        d=google.com; s=arc-20160816;
        b=CB1mUAbFn2eOKZ5KJX/6NpjQbySqi6tguwFxRNUSlluDyIg6/GTDMOzRWDDLZV26Pf
         OxgOHvrUPbK2QKF3+rL2VH3fltm3xsh1pxFYJ3TTcsczaVSNEiFNbuznHw2/dtdUInhO
         lrvupnXY06TWn8vQbQeuoTkuNQjQnDzPazrL8tMX/PDLF6stMxiJTfBDRaeKmNl661SV
         HY5pZUA0xd+bmHQQ9KufDwCvq7GaaEG5rUHdxs81BJmZhdCgHYPjYJaFNBIya8M3HinO
         TTDA2bi+4vdJflsFTtHEeptxf64TAa+0dYnWctdpODIfAZcVUNHAy9fCe4y4PKjrs+DZ
         JiAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=J738BQqBvhpMt3eJFPP/lmrii93ELO7mMMfmrV28FMw=;
        b=m89JRQR9Nu8xLzCsl7owqt4MbPFURLh/GLqWEyJpFkBeCfjvXD3mh9MivSxpB2pnBn
         4IZQ6CJTGJro0dHiFQc1m7MwL6b80xBp4QkWIwti/EizhU0IJQdR/edw500TlTpa6Z1e
         LsQMVv7KsP/IW8kZkx0FTICynZIg2mA2C5A/KcfTGBd0wPfG7jcKUyvg1uHCFuVl9eUB
         KNzrW6NdwkLplC26LcWVTkg+MoOw0fqhp0bBvju2oXivh+O+i8wl3rtxywtvHEBSS3Wf
         +49qvfWFaajwDRSnteh4HeA6gOo/hTnyxXY2DVjK6jSmefOyPanlVV5AqTHdGONE2wx6
         82dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Cwe65+c8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u185si178246ybb.15.2020.06.08.09.24.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 09:24:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Cwe65+c8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiKZl-0003pu-MW
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 12:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKFG-0007Px-0l
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:03:30 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51575
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKF6-0008AA-WB
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:03:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J738BQqBvhpMt3eJFPP/lmrii93ELO7mMMfmrV28FMw=;
 b=Cwe65+c822mcT3HQhdZd+M8696mqqahwJGGt61Ap0rKhv6sXVTYuKjlcH4UA+wnsdcR4cD
 yYUAqtN/vh7LIIUOmGdX3u246GSh1/W7+TiaWcW/Ya3mXLiWahkTvoS+NHiEztIO9/xreS
 qlPmToM2FCwCU9+2PiHIaGPLD0vGJUM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-BqLDKnfDN1eoKBW9hzLBxQ-1; Mon, 08 Jun 2020 12:03:18 -0400
X-MC-Unique: BqLDKnfDN1eoKBW9hzLBxQ-1
Received: by mail-wm1-f71.google.com with SMTP id r1so6835wmh.7
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2020 09:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J738BQqBvhpMt3eJFPP/lmrii93ELO7mMMfmrV28FMw=;
 b=KcclTZ0h6i1onYdyoevzXVTkxPzsxKhtpOFVA3XyZi+iDcJXzYXuUSqarysLdmU7GV
 uJhSOc7WOZbEFdkGqhgUTKOrEJZz5k8ieBNNdq3Yt+sk8xlrPd5mjm2b2ItYQbneBWGb
 l83ck1FknYTgB+YB9lQv7bvL44YGWO+r5pD6gVROUDde/79R4Fl8jj0UcV6l5u6Roter
 fYaxMeOOIgML5I/fglWOYVc9a7KDLrOpNeoJoYANm7BGx3MjpMSmNwysBzKrT8z2Puvv
 41fpCeugn+/NMKKl2q2fn38xJW+PsRSEEDhUuszK4fxbcfvwRcePczSwKMZ0+G7HSMQ+
 QL9w==
X-Gm-Message-State: AOAM531wflYh0x3axaGe3wz00C7FYGmNsVIVT+KCaSHjYNi864ffA6H7
 dy9vOXycwsfYi3vIXc/9ngAG9f5wj5qeeU7kZa820YtFq9bCK8M+TfeN7W5UKuQW/Dvu5zgiUaB
 yVB4qkpKSpSH/
X-Received: by 2002:a05:600c:4410:: with SMTP id
 u16mr73263wmn.88.1591632196835; 
 Mon, 08 Jun 2020 09:03:16 -0700 (PDT)
X-Received: by 2002:a05:600c:4410:: with SMTP id
 u16mr73234wmn.88.1591632196640; 
 Mon, 08 Jun 2020 09:03:16 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id l17sm32396wmi.16.2020.06.08.09.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:03:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 26/35] hw/openrisc/cputimer: Emit warning when old code is
 used
Date: Mon,  8 Jun 2020 18:00:35 +0200
Message-Id: <20200608160044.15531-27-philmd@redhat.com>
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
X-TUID: 65SqP2awz74X

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/openrisc/cputimer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/openrisc/cputimer.c b/hw/openrisc/cputimer.c
index 93268815d8..60f2c9667f 100644
--- a/hw/openrisc/cputimer.c
+++ b/hw/openrisc/cputimer.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "migration/vmstate.h"
 #include "qemu/timer.h"
+#include "hw/qdev-deprecated.h"
 
 #define TIMER_PERIOD 50 /* 50 ns period for 20 MHz timer */
 
@@ -135,6 +136,8 @@ static const VMStateDescription vmstate_or1k_timer = {
 
 void cpu_openrisc_clock_init(OpenRISCCPU *cpu)
 {
+    qdev_warn_deprecated_function_used();
+
     cpu->env.timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &openrisc_timer_cb, cpu);
     cpu->env.ttmr = 0x00000000;
 
-- 
2.21.3

