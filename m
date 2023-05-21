Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp648494ejb;
        Sun, 21 May 2023 05:31:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7XoqTiQmyytRsOpCkAElNVUFU3CopXd6dGLak8i1XpTyHQaTebxCifGkeNJXqJXKpp/k/5
X-Received: by 2002:a05:6214:1306:b0:5af:9276:b59d with SMTP id pn6-20020a056214130600b005af9276b59dmr17574563qvb.18.1684672291627;
        Sun, 21 May 2023 05:31:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684672291; cv=none;
        d=google.com; s=arc-20160816;
        b=0U8vfq2gg3ziilTl3M77Zx6jgSrSUUOt9oK6Uqq2fE7PX1T0tJULkw+ojThKAnSYE9
         xZri0PHcy0fjcbAhg9ZWfgNunV6uhDPPSb7hjl/uCqLsh9mCnp3CbyIUzkIxcuxmBies
         vIBKC05sEtc1su4t7d5Ds6BqLUjkiXHJMjt+abfHuilUVG75YXLrLZV1EHtWllwC/fip
         6obcgz8P067+aN0pTmZSYgIsLuzkHm7CB04DYhZBH5hOyZ2D5rY8tKnhLANfIZ/kmWxD
         mA1jnsmOSA8x+/mf/8Snwf6TPhYStIuUFLlijQLFSWMmg4TkJnSpy/5wECRGmX9xSvuc
         oE2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SUZ2glAUhNrsdqC0BDr9HkWvGwgP+iq+/9JOBD9npq4=;
        b=IYHby9v1h4QwFn9b96yYiLhjh4ASaRjKKMZOQtNx6j/LFwJNhqrKGHAmleiNtzGGfv
         M3MVoV32FSu+8sSF87435v4dVKjx1a9QlDsDCTVsEXMDfMyl3HXjrQFQRpOrnbKusR+x
         yz51kAC1eRSa/rFyow8IpT0vqYCqtp7w1fKQdyGbD70j2jnYg3A7IENr9ZxHVTkTcTFt
         SFXT97HFoFVCYFge4MGuyKO4fiKgy8mlXeFH/zrKMoWdu+7+AZlDd/HbRCo4AhOd/lx8
         Mw8FYF6pMM9wNub2CITuK8IFKsIbgPGJvNYRomsc4f1KRbw69XkgyXtnMyKnuzSXnGsE
         BfFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b="e/+N6ohf";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ke28-20020a056214301c00b006211b82daffsi2155985qvb.566.2023.05.21.05.31.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 May 2023 05:31:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b="e/+N6ohf";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q0iDU-00024j-VQ; Sun, 21 May 2023 08:31:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1q0iDP-0001wn-0r; Sun, 21 May 2023 08:31:11 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1q0iDK-0001lN-H2; Sun, 21 May 2023 08:31:10 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-510b6a249a8so9003800a12.0; 
 Sun, 21 May 2023 05:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684672264; x=1687264264;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SUZ2glAUhNrsdqC0BDr9HkWvGwgP+iq+/9JOBD9npq4=;
 b=e/+N6ohfben7N2MeIMuJlv90SFaxcx3bIyizp7vEEVvSw+i4e2bw+T242SsnRG4Uwx
 Di6zMuSaO4IVkWl7Jl5vdEIHQNZhRXcO30anZciG3bhlYTIzWppdzUdvARdP+uVYD6bc
 MmrJ4TPHi3Xt6toTnJZDX6Wt2aIcx4I9h698z1PBs8LeTeWg6kGITfnuPZFE+/8ELDsS
 82AuHALjBbpnPoY63bspidq2FQ6dwKPbu9Hk9Kf2TV4VA3U/aGHZJsPtp47plPJPjBdk
 04gnCH+pbNEJW/dBWuEbE+uPzmZ+wsvnFn9WTL5ZTfISxFcd4tMMiOjPGWUau9+8OmCj
 ECxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684672264; x=1687264264;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SUZ2glAUhNrsdqC0BDr9HkWvGwgP+iq+/9JOBD9npq4=;
 b=BNhLLsxQflrRCO4MOqap56RgjApt8jNFU+N+7J/RZKri2IEPQb8lcqZL2Uo1+bVETq
 Q49CoK6RHpwGT1xepwVqwBM/IM1/Z7Ac/rkubHjx91XjAIUpPS2prRnaOStPCbu1DRVn
 dd2INvSaMrQGOghj0meG7HGq2gVrovihuRUeV9V8Qf7n1ztCkCaCpBJEW1yCwn0wN6gt
 YjQcsYwDHCmJdbQPwtcjhkSdhIEL3c8nFuvsgRzDtrAt31iaeF2zXAIitPfdtOdQxZzR
 Psx5KmVtvtSczBk9JpRU2VqOrIYF9JGHQZlwOsTKqfvN+Zb0YB/AbZHVJ2zk1Vk020cO
 RL+g==
X-Gm-Message-State: AC+VfDxpVr+PHGFtYls0TlQgsFpKmX0kFrF9uiRL1uvwJFtZz0g1slyG
 D8r27kza9x88/tnIpNIYX6zt982N7ZA=
X-Received: by 2002:a17:907:720e:b0:94f:5847:8ac with SMTP id
 dr14-20020a170907720e00b0094f584708acmr8416632ejc.51.1684672263698; 
 Sun, 21 May 2023 05:31:03 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-191-145-122.77.191.pool.telefonica.de. [77.191.145.122])
 by smtp.gmail.com with ESMTPSA id
 b19-20020a170906729300b00965ec1faf27sm1882678ejl.74.2023.05.21.05.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 05:31:03 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v2 5/6] hw/char/parallel-isa: Export ISAParallelState
Date: Sun, 21 May 2023 14:30:48 +0200
Message-Id: <20230521123049.312349-6-shentey@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230521123049.312349-1-shentey@gmail.com>
References: <20230521123049.312349-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SefDTIYw7M0C

In order to replace string literals with the TYPE_ISA_PARALLEL macro we need to
export the whole structure as well.

Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 include/hw/char/parallel-isa.h | 46 ++++++++++++++++++++++++++++++++++
 hw/char/parallel.c             | 13 +---------
 2 files changed, 47 insertions(+), 12 deletions(-)
 create mode 100644 include/hw/char/parallel-isa.h

diff --git a/include/hw/char/parallel-isa.h b/include/hw/char/parallel-isa.h
new file mode 100644
index 0000000000..27bdacf1a3
--- /dev/null
+++ b/include/hw/char/parallel-isa.h
@@ -0,0 +1,46 @@
+/*
+ * QEMU ISA Parallel PORT emulation
+ *
+ * Copyright (c) 2003-2005 Fabrice Bellard
+ * Copyright (c) 2007 Marko Kohtala
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef HW_PARALLEL_ISA_H
+#define HW_PARALLEL_ISA_H
+
+#include "parallel.h"
+
+#include "hw/isa/isa.h"
+#include "qom/object.h"
+
+#define TYPE_ISA_PARALLEL "isa-parallel"
+OBJECT_DECLARE_SIMPLE_TYPE(ISAParallelState, ISA_PARALLEL)
+
+struct ISAParallelState {
+    ISADevice parent_obj;
+
+    uint32_t index;
+    uint32_t iobase;
+    uint32_t isairq;
+    ParallelState state;
+};
+
+#endif /* HW_PARALLEL_ISA_H */
diff --git a/hw/char/parallel.c b/hw/char/parallel.c
index 522301f43a..d89f750cc1 100644
--- a/hw/char/parallel.c
+++ b/hw/char/parallel.c
@@ -31,6 +31,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "migration/vmstate.h"
+#include "hw/char/parallel-isa.h"
 #include "hw/char/parallel.h"
 #include "sysemu/reset.h"
 #include "sysemu/sysemu.h"
@@ -51,18 +52,6 @@
 #define PARA_REG_EPP_ADDR 3
 #define PARA_REG_EPP_DATA 4
 
-#define TYPE_ISA_PARALLEL "isa-parallel"
-OBJECT_DECLARE_SIMPLE_TYPE(ISAParallelState, ISA_PARALLEL)
-
-struct ISAParallelState {
-    ISADevice parent_obj;
-
-    uint32_t index;
-    uint32_t iobase;
-    uint32_t isairq;
-    ParallelState state;
-};
-
 static void parallel_update_irq(ParallelState *s)
 {
     if (s->irq_pending)
-- 
2.40.1

