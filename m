Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3432521lfm;
        Sat, 4 Jul 2020 08:55:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOTXBkfAwrd1ECaKlxM/cIqU/prvg3lRD+sXQ1IZFrqJTK0M6BG/Df0Ra2vIQQ0vRN+yyA
X-Received: by 2002:a05:6902:709:: with SMTP id k9mr39577376ybt.245.1593878144433;
        Sat, 04 Jul 2020 08:55:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593878144; cv=none;
        d=google.com; s=arc-20160816;
        b=bAdfxrS8/UR5dvUuGGjyhxMzw+53wd6YPu7Rla9pFuFhyaw7XF6qv/cckfpNcl2T7u
         r20xPxvdRR+dp7fgyEbS26uPj7xjeZwfoVkUoYI15VslUwx7/Xp7KV1Z4PCoYaL9Qwkp
         lO/lfD6VrKJrukueqQQOQn6dVE4RMN3BTHPtpPR239DTS3Ai3RGAN4njZZ6Q67nxnRvy
         +pU1LPm/CGnULmAeRnN0+1cQvlZ9QevZWAzY8gnS3OICCHyigcQe5ixOWjhB1ClCKCUq
         aKym0Off1sI2MyI0ktEJ1RPlOF0xcQoEZKpeS2Vt+cVxEfyBnt3FPdFQQVsYoAvQCTI6
         Actw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=J738BQqBvhpMt3eJFPP/lmrii93ELO7mMMfmrV28FMw=;
        b=NiUe5N6cOkGORFnruVlemuy2QbhqfF9HavautuqTNf/GrpwnGdvReBJJxMk6KLB57m
         UJhV/3YTmvKIHob9ccR2Ac5GnqRzJft6AIJynvPAsIVPTRL+snLKPq0Jr0Lcy+0rRIxn
         lgk6u1URUcOAQh5zNs0wKYMpwlUqzIVs9PLYgDI8gHYvF94nsYbikYIgZKZgnaRizZXs
         GtAsLbBjLoldsoJuL9qnIRnap0H9iuaBGfte0rLWSaRpZecm5QJ0CDYXQcmywGLg53cf
         WEVoDCQ/6OfRvt2mqaGDEoSdv0XaLYGyl3wiFQlDK28j1iOCKX82QRb82xP/yeWooyRs
         Qr1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FFHbBX1c;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7si15284462ybl.92.2020.07.04.08.55.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 08:55:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FFHbBX1c;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrkVz-0004hv-SE
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 11:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHh-0002zQ-Sm
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 11:40:59 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:29307
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHd-0008Ly-T9
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 11:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J738BQqBvhpMt3eJFPP/lmrii93ELO7mMMfmrV28FMw=;
 b=FFHbBX1c6DXN6HOFZEJ5IPI1/39q61ylORY+wzlWdfoZUS2PtVonuffnpuLbV2GmjFsYAo
 ifd8Dip1bWMMIIJNSJ3R5JRxXHnzcdOiS52v+jTaT5r3bwrhIYkP/rA8TVYovstUiA6fux
 eikVHL3DEHz3UXwRFGf/tWJcnl5Lb7o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-otHDLL7UP6KAEaQEqPEA5w-1; Sat, 04 Jul 2020 11:40:51 -0400
X-MC-Unique: otHDLL7UP6KAEaQEqPEA5w-1
Received: by mail-wr1-f69.google.com with SMTP id e11so36044843wrs.2
 for <qemu-devel@nongnu.org>; Sat, 04 Jul 2020 08:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J738BQqBvhpMt3eJFPP/lmrii93ELO7mMMfmrV28FMw=;
 b=mAt5g48PC90C8QjUMZNhqZVIECerA07zOEvuURac/A67tiBbgIXa/25SwDDY0+ow0R
 kaL0ZrWLNC5vDHcdyDcDHmiJIMHXN5Nn4e+ON6huo0VTLt6hGHo1MfIDQGtz3wGxNXuR
 bSmHg13lE5ICB1SdGpPJa+3uhAhsZIC0PpjDrXSjyOybGuTFMT8RHrseHbtU5fkZ4F+e
 J8SvdPOzNTMsfeQK5qJn2pTeReJkYpfU7YKfIaFh+d9hzb1QxEZoCeqjc8X5ZJg/8USV
 8VoAe1xrBmKG5+20jnyaSBbuLTVhtE1IJ6WKUcMtAfDZfDd1zTSRdAEo0J9UMvxgwcZE
 j3fQ==
X-Gm-Message-State: AOAM530H+mCventtnx5//AVZkw3dniEl9P35GVoPfv6oSADGfWDiv1X8
 6M4R24Dr89U4S60eMoj3Xnky71+ambgUyCxb5sTTV72mviDsnsPrKCyM5XBxOS/aQF+OSql0lNE
 Uq8MBosFPhbe6IHw=
X-Received: by 2002:a1c:9e4c:: with SMTP id h73mr33895142wme.177.1593877248835; 
 Sat, 04 Jul 2020 08:40:48 -0700 (PDT)
X-Received: by 2002:a1c:9e4c:: with SMTP id h73mr33895118wme.177.1593877248705; 
 Sat, 04 Jul 2020 08:40:48 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id v3sm17434678wrq.57.2020.07.04.08.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:40:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 18/23] hw/openrisc/cputimer: Emit warning when old code
 is used
Date: Sat,  4 Jul 2020 17:39:03 +0200
Message-Id: <20200704153908.12118-19-philmd@redhat.com>
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
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 08:57:02
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
X-TUID: JbmbT5bHAosk

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

