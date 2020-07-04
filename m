Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3427329lfm;
        Sat, 4 Jul 2020 08:46:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTGevorTS3b1M26/rsMwXneFa19C0ihYDbY3B03L4iHhyfH6eUQOho81rNI813qeMURXOP
X-Received: by 2002:a25:b94f:: with SMTP id s15mr62776906ybm.326.1593877617242;
        Sat, 04 Jul 2020 08:46:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593877617; cv=none;
        d=google.com; s=arc-20160816;
        b=E80sl0KeDJFqJDQmgvQ111q8pq2P+DC5B9L012OgZca7X73q9P7VOBBOX1sYhCpAiY
         JNe9cB23UACVVGKWD2mTYotYs2myhzb6w/iedK4sTTeS12f9AXhRtk+cFpyDZgrPhIsQ
         2AhpU+aAfyeT0a5xkgKY6tXWZNav/aSuWD1YXvS++3nKDpGB7ZCGL0+7gmM/WoV2fiYG
         tdS2UtTZ6b8Lju6/40wa94f+8m+w4TkwSZg23Ft2fk95kSJG0ioPHDpQ8qG+fLV2m8vo
         jXzA5rs6VBNxEPTbS7bWeOAa2VazwnpcDYF1/Ar0mizncT8yIutlLVrvSTYBlCVsoQ6Z
         rCWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ApDhe32brtQ+Y5RdcPhQgtj2PJElzW6fZw0WZlKaDdE=;
        b=Ey7IevjboMqaucyYPW8kFVbQE8IFnteklkF1Eav4nzAk19KaVWFzVnvEND0ncplUaS
         A1xHhfias6o1NgqymskXVH+nKCA3IzXbBGA3+Ho/Y4CW5yzenXyFBp7pEuLNcDqaWTIG
         jS2dTwiEbi0DDryJ3A5n+Wt3Icepv6U+s6HWXtZtsrYj99dQPdBgfuNOt61Ez/zQn2LL
         2YZfysdSFZDREgh7Lqnk5//BJ8EHuURjlM+m9OQ7iC6vEVfw4gFWwHMwNmYAJ5BLcBZO
         O79pChainY1uazr+BUthdYp3xbWtY9BqXunRMgonyJ2LJRH47aRvR+kxE8r9qtllzol7
         VoSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=as7CJOD2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y12si14315728ybr.282.2020.07.04.08.46.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 08:46:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=as7CJOD2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrkNU-0005ON-GU
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 11:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHP-0002ef-K4
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:40:39 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59681
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHM-00082o-QJ
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:40:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ApDhe32brtQ+Y5RdcPhQgtj2PJElzW6fZw0WZlKaDdE=;
 b=as7CJOD20YxTc+nDPRBn/YnLnAfzGa/ErN08t4H7js1TqfDwrJW9dnh9HPtWX+MTf9QMvG
 krP2k0eNVyLn4wJIedVVnIZUEZy38x+2QOovieZUfcuHWbI5ICzQtwqroVE4gf2NfFUiIB
 K4c+DXpsgl0jseYEMOxBtz5HPu32k18=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-yf-xsyZ6Nx-Gil92-oL26w-1; Sat, 04 Jul 2020 11:40:33 -0400
X-MC-Unique: yf-xsyZ6Nx-Gil92-oL26w-1
Received: by mail-wr1-f70.google.com with SMTP id i14so35798766wru.17
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2020 08:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ApDhe32brtQ+Y5RdcPhQgtj2PJElzW6fZw0WZlKaDdE=;
 b=bGYW2nmEbR39VBwjxX2CtpBIhCbTB4hzDnCAXV/VEKOoS9/DfYXF2L9AMns1gKcz5Z
 jbfc9JhFqdMhW2/c2EUGFnDaL2ix3MebmbSHMTNGtyJFuuXZTDuABEzOK3uLIjmdfcUF
 Eus54Xq7JhE8ynqLqNj27y5QXf4XlzEjppUVezFblJuLhdpBb2CoEaIqWc4Ejb53WxPx
 xFKiXOKvuTX85NnhrWeLF4BZJMOK80mdlTejQxj2elFn0bEj8P9My/apAM/CqKNU/fMx
 U/RfNwFHgzX2qBq8Gxy4y9cAmGrLT451OrVovLg0gzPJPLtEyI5TMpZ6S/A27W043Vie
 nN6A==
X-Gm-Message-State: AOAM530eGjZ2RLyl7SEgd7xsgXnvii8zfcrQRS72uAde5GUaaQCd0GC0
 WqTDWRgwf36WZjNwtg5UkMPhgUG0y/yH+AMbyipOP17Y+GzTERnQc+0KCc6Hw+NMzu8lt6mJk19
 LwFislCguXeKs
X-Received: by 2002:a5d:65cd:: with SMTP id e13mr45174007wrw.213.1593877232724; 
 Sat, 04 Jul 2020 08:40:32 -0700 (PDT)
X-Received: by 2002:a5d:65cd:: with SMTP id e13mr45173991wrw.213.1593877232580; 
 Sat, 04 Jul 2020 08:40:32 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id m16sm12754853wro.0.2020.07.04.08.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:40:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 15/23] hw/m68k/mcf520x: Emit warning when old code is
 used
Date: Sat,  4 Jul 2020 17:39:00 +0200
Message-Id: <20200704153908.12118-16-philmd@redhat.com>
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
X-TUID: BbLtnPXLWP7T

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v2: Add comment (thuth)
---
 hw/m68k/mcf5206.c | 5 +++++
 hw/m68k/mcf5208.c | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/hw/m68k/mcf5206.c b/hw/m68k/mcf5206.c
index a2fef04f8e..ec0d176674 100644
--- a/hw/m68k/mcf5206.c
+++ b/hw/m68k/mcf5206.c
@@ -16,6 +16,7 @@
 #include "qemu/timer.h"
 #include "hw/ptimer.h"
 #include "sysemu/sysemu.h"
+#include "hw/qdev-deprecated.h"
 
 /* General purpose timer module.  */
 typedef struct {
@@ -144,6 +145,8 @@ static m5206_timer_state *m5206_timer_init(qemu_irq irq)
 {
     m5206_timer_state *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = g_new0(m5206_timer_state, 1);
     s->timer = ptimer_init(m5206_timer_trigger, s, PTIMER_POLICY_DEFAULT);
     s->irq = irq;
@@ -566,6 +569,8 @@ qemu_irq *mcf5206_init(MemoryRegion *sysmem, uint32_t base, M68kCPU *cpu)
     m5206_mbar_state *s;
     qemu_irq *pic;
 
+    qdev_warn_deprecated_function_used();
+
     s = g_new0(m5206_mbar_state, 1);
 
     memory_region_init_io(&s->iomem, NULL, &m5206_mbar_ops, s,
diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
index d310a98e7b..0bfcbb6332 100644
--- a/hw/m68k/mcf5208.c
+++ b/hw/m68k/mcf5208.c
@@ -26,6 +26,7 @@
 #include "hw/sysbus.h"
 #include "elf.h"
 #include "exec/address-spaces.h"
+#include "hw/qdev-deprecated.h"
 
 #define SYS_FREQ 166666666
 
@@ -194,7 +195,9 @@ static void mcf5208_sys_init(MemoryRegion *address_space, qemu_irq *pic)
     /* SDRAMC.  */
     memory_region_init_io(iomem, NULL, &m5208_sys_ops, NULL, "m5208-sys", 0x00004000);
     memory_region_add_subregion(address_space, 0xfc0a8000, iomem);
+
     /* Timers.  */
+    qdev_warn_deprecated_function_used(); /* m5208_timer_state is not QOM */
     for (i = 0; i < 2; i++) {
         s = g_new0(m5208_timer_state, 1);
         s->timer = ptimer_init(m5208_timer_trigger, s, PTIMER_POLICY_DEFAULT);
-- 
2.21.3

