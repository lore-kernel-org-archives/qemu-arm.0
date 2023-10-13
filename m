Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1534625ejc;
        Fri, 13 Oct 2023 07:07:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaDU4JSR9w3wDZlPvn7LKBr/VVeVhaeMzrhrINRQsYkX/w/80030WBn83hwd+uv2/Fw2iL
X-Received: by 2002:a25:f90c:0:b0:d9a:fc8e:7c05 with SMTP id q12-20020a25f90c000000b00d9afc8e7c05mr2690229ybe.45.1697206046482;
        Fri, 13 Oct 2023 07:07:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697206046; cv=none;
        d=google.com; s=arc-20160816;
        b=EweVp0l8Gr5eN1ebDO2ximBS74U/ZnXSyMUZCS2i9y75GIwcm+T/gN2j3Y85YQasJ9
         NLpVtwLTBknbpUszL9qNCp6NxvTikoP9pWtqoI0f0MU4hxLcvt1KUZCDJjnRzkb/o8D1
         Oa8HfFjoviRzsu0lVPhOxf2bn487Kyn7RpReeUQT6u6o3EnOYBJqKk4gg3ftRrDck8mx
         RUE/56VX0arKW/KaKbq4nnBdUgReiCGB7iWYy/kBrgtxVnSoPrvDiOkUF3rZE+TA2XQy
         Ode/QT0MoXh0wrm0I/alnhZFkuXtcCp8E5zLaFe1EHsEkNoAsVIxX24nh98vn5lyhQl/
         hNew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/qQPmY7CjfjcpTejSUl9tIgNfX8ASpiti+kcpc3Y4dk=;
        fh=yvC9ZPM7MgJn7Xb0eJwxiCf2t+VfzDAYAfYYKFMFkpQ=;
        b=yBg3zUJsh1HtUuq6bbE3UrLR7HuvotvGiL70pGHMdff9c+i+y5bVSxnt6rfhz0SpvR
         aQ+xQwaU6ExjzcfFdgQWHUzznin9jZRwyTwAf8vUTJtCyvVcHj0tWEbjuSvcdySBHn66
         X7InNPfKxXY4wOOS2+UjJRX4ciDQxkGFadGUZd+AQa8nz5Qy1JodrQvLFHGUebwKReyy
         OzsKMinhhjED3rY5yMkwvory0G1xett5E0wDEkSOS/54JgqmILDXrLs8iXPEcX1xNhG0
         4yV9ua5MbIoqVrROIRRYdpB/HP0LzzfQ/q19d7ULMUztMK9g8seXUIIBqH2aVcZItpDx
         FkYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fPkzqseg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d14-20020a05621421ce00b0066d32666a23si147970qvh.422.2023.10.13.07.07.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 07:07:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fPkzqseg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qrImS-0004R4-AC; Fri, 13 Oct 2023 10:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIku-00089k-9T
 for qemu-devel@nongnu.org; Fri, 13 Oct 2023 10:03:13 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qrIkm-0002QX-Md
 for qemu-devel@nongnu.org; Fri, 13 Oct 2023 10:03:06 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5333fb34be3so3628332a12.1
 for <qemu-devel@nongnu.org>; Fri, 13 Oct 2023 07:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697205776; x=1697810576; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/qQPmY7CjfjcpTejSUl9tIgNfX8ASpiti+kcpc3Y4dk=;
 b=fPkzqsegTNyOgC2xdfbVFCkf3zrkJ9P2Lg9OWwL5eKOu4OzG4H4mgohVvUGRhXTRDt
 v8C7dEJgoUZ6LPEZ/d2dbiuDvJtrvUP4L/W0ot6WHjUbmv56fYfwoURR00tdzuGwKtoD
 HedGI91dnc5oTME1M8RTrSP9KiUCNuCZ2WCN/cJmiNt/E/jcY3CTx1fRcbMe1jiyldDd
 IMU0N4a9ZE/RNubMfUbnHKHv7TeK64BKDZ8MG5X5wa4feMoqX34iX9OSKBJesBDADHzj
 ZEDvryhd9wA4cwjpFdhD+vvIvjyPuCBG7AcVAZpB4P0oqrcTSpqAnC19Am9zBXAYxq6M
 SeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697205776; x=1697810576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/qQPmY7CjfjcpTejSUl9tIgNfX8ASpiti+kcpc3Y4dk=;
 b=RivFTuViBXVpYGb2HKgZ9Zr9zH7EIorrIpPjwtXWE8prqyxFklkXL9OTlyorvgvDhg
 rMUTnLSen74i1CQfqm7S7jMrksP8pLOWHIf3bd2iBShATOD5z3mKF3S4+Vwa0g9neiJF
 m38bqSSS4jax14KmPwEc2Wf/Sxn0kS+Ig36oNpW8TvAYdrtedfbnFI+PHxLPkPOafd8u
 eURh9wdV+ThxYzxGAdWyqWFvW5FP4exdbPV6n8z3MCcB21c05/2p5rFsBzJhqMmeFw2p
 wagTOxNY6xtHZXh47lZ3nI4oNqyM9n8kw5AfYbfdtCOaS8j/SwV2TJcztqHyv+i/e2rw
 Y0wg==
X-Gm-Message-State: AOJu0YwbURdUhgSwITcyqh0m1tPnsTqK7QzyvpED70Bwe32ko2sqlrEN
 BFch2m06eBIjahwOA2AnjabaiRmP/x1szj7WM6w=
X-Received: by 2002:a05:6402:3213:b0:53d:eb53:4d0c with SMTP id
 g19-20020a056402321300b0053deb534d0cmr7396964eda.37.1697205776496; 
 Fri, 13 Oct 2023 07:02:56 -0700 (PDT)
Received: from m1x-phil.lan ([176.172.118.168])
 by smtp.gmail.com with ESMTPSA id
 v18-20020aa7d652000000b00533dad8a9c5sm11514331edr.38.2023.10.13.07.02.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Oct 2023 07:02:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yanan Wang <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Marek Vasut <marex@denx.de>,
 Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH v2 10/16] target/openrisc: Declare QOM definitions in
 'cpu-qom.h'
Date: Fri, 13 Oct 2023 16:01:09 +0200
Message-ID: <20231013140116.255-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013140116.255-1-philmd@linaro.org>
References: <20231013140116.255-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KYHR67YM7CyU

"target/foo/cpu.h" contains the target specific declarations.

A heterogeneous setup need to access target agnostic declarations
(at least the QOM ones, to instantiate the objects).

Our convention is to add such target agnostic QOM declarations in
the "target/foo/cpu-qom.h" header.

Extract QOM definitions from "cpu.h" to "cpu-qom.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/openrisc/cpu-qom.h | 22 ++++++++++++++++++++++
 target/openrisc/cpu.h     | 10 +---------
 2 files changed, 23 insertions(+), 9 deletions(-)
 create mode 100644 target/openrisc/cpu-qom.h

diff --git a/target/openrisc/cpu-qom.h b/target/openrisc/cpu-qom.h
new file mode 100644
index 0000000000..1ba9fb0a4c
--- /dev/null
+++ b/target/openrisc/cpu-qom.h
@@ -0,0 +1,22 @@
+/*
+ * QEMU OpenRISC CPU QOM header (target agnostic)
+ *
+ * Copyright (c) 2011-2012 Jia Liu <proljc@gmail.com>
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+#ifndef QEMU_OPENRISC_CPU_QOM_H
+#define QEMU_OPENRISC_CPU_QOM_H
+
+#include "hw/core/cpu.h"
+#include "qom/object.h"
+
+#define TYPE_OPENRISC_CPU "or1k-cpu"
+
+OBJECT_DECLARE_CPU_TYPE(OpenRISCCPU, OpenRISCCPUClass, OPENRISC_CPU)
+
+#define OPENRISC_CPU_TYPE_SUFFIX "-" TYPE_OPENRISC_CPU
+#define OPENRISC_CPU_TYPE_NAME(model) model OPENRISC_CPU_TYPE_SUFFIX
+
+#endif
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index 29cda7279c..dedeb89f8e 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -20,17 +20,12 @@
 #ifndef OPENRISC_CPU_H
 #define OPENRISC_CPU_H
 
+#include "cpu-qom.h"
 #include "exec/cpu-defs.h"
 #include "fpu/softfloat-types.h"
-#include "hw/core/cpu.h"
-#include "qom/object.h"
 
 #define TCG_GUEST_DEFAULT_MO (0)
 
-#define TYPE_OPENRISC_CPU "or1k-cpu"
-
-OBJECT_DECLARE_CPU_TYPE(OpenRISCCPU, OpenRISCCPUClass, OPENRISC_CPU)
-
 /**
  * OpenRISCCPUClass:
  * @parent_realize: The parent class' realize handler.
@@ -304,7 +299,6 @@ struct ArchCPU {
     CPUOpenRISCState env;
 };
 
-
 void cpu_openrisc_list(void);
 void openrisc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 int openrisc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
@@ -339,8 +333,6 @@ void cpu_openrisc_count_start(OpenRISCCPU *cpu);
 void cpu_openrisc_count_stop(OpenRISCCPU *cpu);
 #endif
 
-#define OPENRISC_CPU_TYPE_SUFFIX "-" TYPE_OPENRISC_CPU
-#define OPENRISC_CPU_TYPE_NAME(model) model OPENRISC_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_OPENRISC_CPU
 
 #include "exec/cpu-all.h"
-- 
2.41.0

