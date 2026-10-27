Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88798606A31B
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Oct 2026 11:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Lou9VysK
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLf7m-0004HG-Bx; Tue, 27 Oct 2026 07:13:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf7j-00048K-Sy
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 07:13:47 -0400
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf7h-0002zd-Gz
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 07:13:47 -0400
Received: by mail-dl1-x122b.google.com with SMTP id
 a92af1059eb24-185fd3a4ca3so3467436c88.0
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 04:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793099624; x=1793704424; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=zFuPJ4Lh2s2UUaRsaZOIoszYRr4vBXVOwxsipYqgcZQ=;
 b=Lou9VysKcYLIYaWn55Hi1PFX8F8Oysq9j5mHb9rzPI3a0S/ubK6WqxXaDJiq0kR1Z1
 KXTcOFJBjwnDc/6Q7uHAWiPliBFFBpXQ9EXNTXQF1/KCOYhv791/TF8opU3FCbyXUt1E
 p+OwxULJV5c37Vs9VzLZwugfjgY5b2URyymy9lo+tiRQPCVflT0NIy5XUarZX6tIFKUg
 1yPNcYjssZP2jg94IziJn6t1zEFx/lB3dH/rTQSTuXljUNizOWS/0vVCd+C5vnRTqPRc
 xr5j72qApDVsGnwdc+XWZz4RrUaU6XL9DBnX+ICaRNj7Yq9K1VtCiB98V011AVjonHWQ
 fmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793099624; x=1793704424;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=zFuPJ4Lh2s2UUaRsaZOIoszYRr4vBXVOwxsipYqgcZQ=;
 b=xsx+HJTOoR+sDa0iluwndRxtqQNqGwt04ajuxWS3Bs4aZmsaF5nxa39o+23TSg5wbH
 0BlQTn54IAUb5a+ZnOJfWSRWICS5ZAUJHrs62j/tL5gu5V6QyPhrb2y/dDbG+MbP2oTd
 jrUgzyEYRvfjciBTwrd5jokqwI6BaAoNpYMA0CEg//aDcI0K9jZBpzENGiuqwYV1rcHN
 dB/KDqF7HzY+b1tPmFS8hjCPC2o83BDVpY/Ir4cSp1butynZM0MqHJXyiIer+XE5286R
 FymtK9qZaxZ6hN012Mw9epl0MlsJWYDiuHdd86LMsjWqqUkyC+gyrausuQ+f0GWYX7Ke
 7C+Q==
X-Forwarded-Encrypted: i=1;
 AKwUvByVRiT0Z3b0Q2nKaEqokt0rgKtuW1VIdsKIHJVJAzKVQ93/1sbyo5IqHGgVlnaNB2ZAUpiTjrhthw==@nongnu.org
X-Gm-Message-State: AFq9FYIJeGTVxI08sYHy8jwmcA+8VDGNUM2ctW4axcnMuQcZXo1ypm1d
 9qIHsUFHQbPp/bp4JbtRRsa88GyLtfoFVbE7RUO+xAf23AmtQ4F+EeSP
X-Gm-Gg: AYBFou0w9atkhuSCDH3FJzsRpIUVFcV8Ztbe4f33lTtIajpU2X1L9ItxGpr0OdW1N66
 l8XBBQ06C19eM2oOofl9gOCTYr49Sq/0FBSOGCzcJVBNU0JgcqsSMEuxyLDjsURaZT6eB5Vx1R6
 zLXrsLfwm4YJY66jdqIAwruMGU6rv1vCdIKk7luwh0qGHpCmA34KSGIRN6WrhkpnTvYvMroGHGc
 /Tq1oTNelEsWKxcXNAPbfiJmH4eRjukCiF1vZ67/XIDYgFdf21LIXmE3jcW5WsJFrgcI/D9YtaC
 XrxxQXidsX+x7vlH4oSkI4suXq4KqABPzRLnYUB0G7ajHz1zdY6zD+sk0XD+k3GA7z1Bg+H9PwZ
 8BegYYfFTwcLyDKynwLc5hVm5vr/r1qOGZHjTBgHIGlVGu+XrvglAoljwhMZlEa3CgtJt1EBhVj
 pepSmu4+wjJ4m8Dm2Y2Dga1u4QC3spbkKIxbR5BaThGnv6/Yj147/P7Cmmwj6a9BcZvZ/I+4KQ5
 eX3tJ80USVqKx4dCPmUUc6MGrJlJMQndFmPN2zKoZVUAKEfNmroIfZwcZ1DUD4yJxQ7dg2SsCij
 XNiMLVs0hunA
X-Received: by 2002:a05:701b:451c:20b0:1a1:8bac:c1c1 with SMTP id
 a92af1059eb24-1a18bacc218mr6054813c88.15.1793099623592; 
 Tue, 27 Oct 2026 04:13:43 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-198a0f83cedsm40453042c88.13.2026.10.27.04.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 04:13:42 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Song Gao <17746591750@163.com>, Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, Philippe Mathieu-Daude <philmd@mailo.com>,
 Chao Liu <chao.liu@processmission.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stafford Horne <shorne@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Eric Blake <eblake@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v4 12/17] hw/hexagon/virt: use unique QOM name
Date: Tue, 27 Oct 2026 19:12:10 +0800
Message-ID: <20261027111216.392-13-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261027111216.392-1-luoyonggang@gmail.com>
References: <20261027111216.392-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122b;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x122b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Set TYPE_HEXAGON_VIRT_MACHINE to hexagon-virt when
target_heterogeneous() is true, and to virt otherwise. Keep the
-M / help / migration name as virt via machine_class_set_name().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Brian Cain <brian.cain@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/hexagon/virt.c         | 1 +
 include/hw/hexagon/virt.h | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/hexagon/virt.c b/hw/hexagon/virt.c
index 4823b1d8ac4..7c2fd9cb61a 100644
--- a/hw/hexagon/virt.c
+++ b/hw/hexagon/virt.c
@@ -360,6 +360,7 @@ static void virt_class_init(ObjectClass *oc, const void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "Hexagon Virtual Machine";
+    machine_class_set_name(mc, "virt");
     mc->init = virt_init;
     mc->default_cpu_type = HEXAGON_CPU_TYPE_NAME("v68");
     mc->default_ram_size = 4 * GiB;
diff --git a/include/hw/hexagon/virt.h b/include/hw/hexagon/virt.h
index 4ca2f1ef859..2383b54ae56 100644
--- a/include/hw/hexagon/virt.h
+++ b/include/hw/hexagon/virt.h
@@ -9,6 +9,7 @@
 #define HW_HEXAGONVIRT_H
 
 #include "hw/hexagon/hexagon.h"
+#include "qemu/target-info.h"
 #include "target/hexagon/cpu.h"
 
 #define VIRTIO_DEV_COUNT 8
@@ -26,7 +27,9 @@ struct HexagonVirtMachineState {
 
 void hexagon_load_fdt(const struct HexagonVirtMachineState *vms);
 
-#define TYPE_HEXAGON_VIRT_MACHINE MACHINE_TYPE_NAME("virt")
+#define TYPE_HEXAGON_VIRT_MACHINE \
+    (target_heterogeneous() ? MACHINE_TYPE_NAME("hexagon-virt") : \
+                              MACHINE_TYPE_NAME("virt"))
 OBJECT_DECLARE_SIMPLE_TYPE(HexagonVirtMachineState, HEXAGON_VIRT_MACHINE)
 
 #endif /* HW_HEXAGONVIRT_H */
-- 
2.52.0.windows.1


