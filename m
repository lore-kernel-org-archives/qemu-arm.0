Received: by 2002:a17:906:fa85:b0:9b6:5cec:e61e with SMTP id lt5csp13747ejb;
        Tue, 10 Oct 2023 02:31:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzNOGa2L2KYjW5uYrSfdhz1aj1xKmtp2Xa6AmBKJFozTbwohLiuEe87AG+wOItYMgGttzP
X-Received: by 2002:a0c:f787:0:b0:658:95e9:111d with SMTP id s7-20020a0cf787000000b0065895e9111dmr18875927qvn.12.1696930282526;
        Tue, 10 Oct 2023 02:31:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696930282; cv=none;
        d=google.com; s=arc-20160816;
        b=T5fRQLUtEaUDZ/tVeZ/iQ6p48QtLHnHf/FYH4YGpNUrST4/F++R6yrqaynpKJzjniP
         JbqhzcqLtQt14STsgLNfp3tq/vSKw1yt7gOGdIPF8cEhiv7nvQlUxjk79aoYdZQ+U6zQ
         EjTNdcuVIz4k7g+lfS2LKEG4Mu2wRlRdL5qy0f/BkKjKwwO/gTjPIb4HK5tz0AGgLswk
         nhM3Zwe3UHt7L1/TvWGaeUixpA20tWoMdqxP7TdxV75A3KyMMaZCpYjzVIVWdBslcoDa
         U3fkc+FWQwYgcfTEXuVqp69tFF3clTZ1putLHSFev8a8mjdXBYwVxd0Mt4tl0pVR2LUh
         zlUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=z/h9w6SijQxndRm+za3Ly8qK6pPEviCCn5/tSqn0iYo=;
        fh=iupQBrmerAoZOw8v6swRnyYBx+6KhbF7AbBF1Jawaz4=;
        b=ENBAk/ipGg0RWQAAYsJd+2pAzKlTYHz9YxtUPhTkAyVvXjwRdNmbXrseXeppiA+ZbL
         vY1rmFzE/k8xNPF83S/zmwNECVBVrcSoFFIq3Gnf7go7WkJ3bGiIpo3r5hvhxB4QUf/v
         Fyx2Go+vKyvd6NDUIkP8mXmWlbEf7JUesN79f12VJg4d6wKCIxTaNm9CmbqTWE6IQDtr
         aaaebWkuKWbWEZdzo/FmzF5o/KGz9IExJDoKXsA6KQ7g2H5yNCFfz8g55hP9mnKnUzJY
         uZb5fMvRzRQXZTk8woHq4Bn2s7Vl5uswH1vuJOelWsaTqJz0w+Xk1cBdoUJrPUW7sucx
         HKPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tJz8Q6I0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x8-20020a0c8e88000000b00668f05f8788si7286176qvb.446.2023.10.10.02.31.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 02:31:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tJz8Q6I0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qq93U-00088r-I9; Tue, 10 Oct 2023 05:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq93P-000863-O5
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 05:29:28 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qq93M-0007fE-Ce
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 05:29:27 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5230a22cfd1so9514631a12.1
 for <qemu-arm@nongnu.org>; Tue, 10 Oct 2023 02:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696930162; x=1697534962; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z/h9w6SijQxndRm+za3Ly8qK6pPEviCCn5/tSqn0iYo=;
 b=tJz8Q6I0K8tDuHIQBbH0FB1OKuWSKyxIhcF+OAbynC/K/5uVKMCW1974zvY0MIbNAz
 yaUljvuTYRd+oAqE1wYqVy72Cv9P4dbrNpSQOHU3oxFNI9zKZ61UEZMTnkl87zw1wsA4
 gZ8sBqNhn8JMzezqIMttXBMRmMX+P2FYdLFoZkMBbtG/Lncy9ulMUjyE0IsGRoUUzLCi
 CsjgjMTA4JZIyA3DJsQgsiiqloxPHRX1PKjTiDl4uSC+F+wY96p44eunN4JBYW+WZgII
 jSJe+3d5uV6YeaB3nBIuRbWg+W32n2Mo6KW4gkXP7r5q8gcz0MaZr4Y6cbqlU4osWkwM
 m7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696930162; x=1697534962;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z/h9w6SijQxndRm+za3Ly8qK6pPEviCCn5/tSqn0iYo=;
 b=VtDk2NuYLl4dIxmpizP2YYH9TKv3cq8LGKrRN7JqaQ5rC8jQlaFNsb3+0bzuS38yEI
 OSGW9DuOwHT/p4ce59xemgktJMORVmffH+41bAhf2FCzWFvrdaohH8NBNFypHLihsLv8
 dP2by0EvLdYv8GPsLkfeuuwjNDlf7buETn5MvDccDPQftW3CKzC4c7lAheVDpFmEBV3X
 Jh3pRhiLCK2XKjYJPiKicfHtcpPr0K87SMcKkREqA4NMaDAYRE/0ddGxOGM9a6bjRF1U
 Z1Bf4etWPMPH4Zfb5mdCI2DF69ZZIetg9FNKboCI2BQX5kEkUpZ1yuJ7mlueiIqTdQBO
 K1FQ==
X-Gm-Message-State: AOJu0Yx9/yzNgF1d9yIj6fhVU24TZbCQtEfwIeKrXsa4GhsfiUJ75/TM
 Ty3CtFDAO1iG7LfG7g8loiH4sw==
X-Received: by 2002:a05:6402:20c:b0:532:bc4d:9076 with SMTP id
 t12-20020a056402020c00b00532bc4d9076mr14272749edv.19.1696930162369; 
 Tue, 10 Oct 2023 02:29:22 -0700 (PDT)
Received: from m1x-phil.lan (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr.
 [176.172.113.148]) by smtp.gmail.com with ESMTPSA id
 n19-20020a056402515300b0053495596f42sm7389833edd.30.2023.10.10.02.29.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Oct 2023 02:29:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Yanan Wang <wangyanan55@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Stafford Horne <shorne@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Eduardo Habkost <eduardo@habkost.net>, Brian Cain <bcain@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-s390x@nongnu.org
Subject: [PATCH 02/18] target/ppc: Remove CPU_RESOLVING_TYPE from 'cpu-qom.h'
Date: Tue, 10 Oct 2023 11:28:44 +0200
Message-ID: <20231010092901.99189-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010092901.99189-1-philmd@linaro.org>
References: <20231010092901.99189-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: H+WMOqOWvUC4

CPU_RESOLVING_TYPE is a per-target definition, and is
irrelevant for other targets. Move it to "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/cpu-qom.h | 3 +--
 target/ppc/cpu.h     | 2 ++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index be33786bd8..41df51269b 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -1,5 +1,5 @@
 /*
- * QEMU PowerPC CPU
+ * QEMU PowerPC CPU QOM header (target agnostic)
  *
  * Copyright (c) 2012 SUSE LINUX Products GmbH
  *
@@ -33,7 +33,6 @@ OBJECT_DECLARE_CPU_TYPE(PowerPCCPU, PowerPCCPUClass, POWERPC_CPU)
 
 #define POWERPC_CPU_TYPE_SUFFIX "-" TYPE_POWERPC_CPU
 #define POWERPC_CPU_TYPE_NAME(model) model POWERPC_CPU_TYPE_SUFFIX
-#define CPU_RESOLVING_TYPE TYPE_POWERPC_CPU
 
 #define TYPE_HOST_POWERPC_CPU POWERPC_CPU_TYPE_NAME("host")
 
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 30392ebeee..492fdecaf3 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -27,6 +27,8 @@
 #include "qom/object.h"
 #include "hw/registerfields.h"
 
+#define CPU_RESOLVING_TYPE TYPE_POWERPC_CPU
+
 #define TCG_GUEST_DEFAULT_MO 0
 
 #define TARGET_PAGE_BITS_64K 16
-- 
2.41.0

