Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp1674785ejc;
        Tue, 12 Mar 2024 01:24:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU2TuHR130YWTSPNnStgofCFpirJk6awaLt9UMfYdIWyTAUuCG7J4NN6eVIFqcYU7GUGoUh/ViDGWY48gSJNmOHieN+Ndq2
X-Google-Smtp-Source: AGHT+IHDUYEzi6CEKVcnZOAnDXaKQJultMwexIVHhgUCJLIQCbOvrTCZ0hpUKxfHDNz6/RoU6bi1
X-Received: by 2002:ac8:7fd4:0:b0:42e:b163:ecf1 with SMTP id b20-20020ac87fd4000000b0042eb163ecf1mr12151491qtk.2.1710231873420;
        Tue, 12 Mar 2024 01:24:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710231873; cv=none;
        d=google.com; s=arc-20160816;
        b=mFd1vz13X2WQag9jGncw4JFIut8TRmy1a7IdUFc93TyonfBCyFeqNLamgurnQyih2p
         5zAXdiq3U7qkMWgA0fozFznL/mgGV2W2LQDP38E2wAfb+Hm65gLAydgOCchTKgW3CgpS
         Vk2ExcUmPeNMTCzBQoCXFW8JYI4gXWYinote3eUkLzP95KSwcwOHeR19uI4P5jWhgWeu
         YNA8jKwD2vsKyNCX2SjwXu+GlxTh6mOuCNk+0rVZIpCeelV1vl32ghIdQfqx80mLM2X8
         MBDoHFRLNIoGty1Zaj7jhYbIVdeGHB9xVBYyS12mIappN6WBlBDkOeo9UcTr2kc795rQ
         v5TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Y7t8ToQvoKJ38Eour/5JL7+zSxhmxaS/0ISJ7lI4Kdc=;
        fh=DLi/QYKMTJ8XvYp5n+NUZAcwV4dC1oxA4JTZ1we7eR0=;
        b=Kx64ikyv5vLCY9lVzogeAm68UxoB4hjMiSuRHfpYYaQeKNWzDTvsz0rj9iWiRmHisk
         VC4Kocmmwg/qxbWwY3Nsy5femIdmuw9/+8TK9GuXrB4x/aJ4rbZTlPIfyRl6RUGUJ2kK
         ReosPD4vci/3gjla/sRKM10t4PoJ7f94IKvE84USo6d2jGvOKj+TE47vHrAvEwCTx3L2
         kMUNLd091siPecJUx5v56vSDYTDvoGgc5dgUCi1kwpgCSb7avVAdsxZg6tfeFHzrOuVx
         fsQXwzMev+MdiUPQp1RydsaTFsfqYC0UhlU6hTEEIJxEuIAqujXVhmG0CUJH/jvGkgHr
         NgkQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QL0r5xmq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f16-20020ac859d0000000b0042e7b41aeb4si7137880qtf.74.2024.03.12.01.24.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Mar 2024 01:24:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QL0r5xmq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rjxPU-0005UC-ED; Tue, 12 Mar 2024 04:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rjxPR-0005Sp-L1
 for qemu-arm@nongnu.org; Tue, 12 Mar 2024 04:22:53 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rjxPO-00016s-Fu
 for qemu-arm@nongnu.org; Tue, 12 Mar 2024 04:22:53 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4132f37e170so7810245e9.2
 for <qemu-arm@nongnu.org>; Tue, 12 Mar 2024 01:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710231769; x=1710836569; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y7t8ToQvoKJ38Eour/5JL7+zSxhmxaS/0ISJ7lI4Kdc=;
 b=QL0r5xmqh3146A1Ybqwsgpaz0Z/RI85sU7uuwNECqQlwCNcw7GXaIx7dpeipi3FznM
 ir/oGuKq6k7M20nowBjqHTg7XbawV5jXbj73/hTJMHvSaEOdLsUbo0bOGq4QsYLnMkhj
 BSOHEdy9k+pfNhDXsqf4+M7jJmHhONxtza1wFuS/nHeE0cpOSx8tzKFbO2KGZXbDH1zL
 iipvTPOBkgF5jv93E/Z+Sd7StUG7rlCPO16OfE/9ruDfft4I+15nrp1EQuhAZEGdBkw9
 sIkgWLOq8qEMHGx6TTJRNveHFr5Zp+9uS8mMsbs3TnaqblHaV9m9zgXSgvKGMXXG4NzM
 h4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710231769; x=1710836569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y7t8ToQvoKJ38Eour/5JL7+zSxhmxaS/0ISJ7lI4Kdc=;
 b=dx+ILI+HREV23a5tAlen5+rZmdyma9JikLfF29rSU6SsHpLqPJ0FQrO1LIrV8GLXRD
 sRKjp19S0M54GBSaxhNQ4m9Btt0Wj8y12kxOgTfv4wqDYVuaZzh2gQ8HtZBxxzZhHwWY
 JP3bw+nii0lVHm7l4FGVS8IlRSzqW152svAHWBG/aFOpbCbHFdg4YXbRPQMaQwyyuN4u
 QWmrbOazfMB3HlxPb2HN0Nh/qHM5FoOHHYzSYZoQQmCZz7WI5puTauGteryg9MlG/zx/
 u9eLBYET3m7PiEMn2LHw6W8axac4y3+1QIUcSHmEhj9RXmMOq6VJsuQdCoyWR7j/PqkC
 d7Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy3FKXpJefpaN701PemOwsdcAYwFZJ/p4H5cuIwbDEYq4X+WjJPR7Dni9GkuwbMOkwOJ4WeBdTiPMNe+RvwNyG6YQt
X-Gm-Message-State: AOJu0YzZLaZljIgDe6Tc3jBI9cTCu00T2AL9GpB071HiKJ+sIMS0DiMQ
 gZb2+QcDl9LH1molUDJ9ABNEw9p1NLe/zxQfBUDLI1SRDnyBgq5IRNCEa6gR7og=
X-Received: by 2002:adf:f48c:0:b0:33d:ca56:a61f with SMTP id
 l12-20020adff48c000000b0033dca56a61fmr6912288wro.49.1710231769187; 
 Tue, 12 Mar 2024 01:22:49 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.206.139])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a5d4002000000b0033de2f2a88dsm8320603wrp.103.2024.03.12.01.22.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Mar 2024 01:22:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>
Subject: [PULL 01/13] hw/ide/ahci: Rename ahci_internal.h to ahci-internal.h
Date: Tue, 12 Mar 2024 09:22:26 +0100
Message-ID: <20240312082239.69696-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240312082239.69696-1-philmd@linaro.org>
References: <20240312082239.69696-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: PPC6FtsAyZ3B

From: BALATON Zoltan <balaton@eik.bme.hu>

Other headers now use dash instead of underscore. Rename
ahci_internal.h accordingly for consistency.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240227131310.C24EB4E6005@zero.eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/{ahci_internal.h => ahci-internal.h} | 0
 hw/ide/ahci.c                               | 2 +-
 hw/ide/ich.c                                | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename hw/ide/{ahci_internal.h => ahci-internal.h} (100%)

diff --git a/hw/ide/ahci_internal.h b/hw/ide/ahci-internal.h
similarity index 100%
rename from hw/ide/ahci_internal.h
rename to hw/ide/ahci-internal.h
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index b8123bc73d..bfefad2965 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -37,7 +37,7 @@
 #include "hw/ide/pci.h"
 #include "hw/ide/ahci-pci.h"
 #include "hw/ide/ahci-sysbus.h"
-#include "ahci_internal.h"
+#include "ahci-internal.h"
 #include "ide-internal.h"
 
 #include "trace.h"
diff --git a/hw/ide/ich.c b/hw/ide/ich.c
index 3ea793d790..9b909c87f3 100644
--- a/hw/ide/ich.c
+++ b/hw/ide/ich.c
@@ -70,7 +70,7 @@
 #include "sysemu/dma.h"
 #include "hw/ide/pci.h"
 #include "hw/ide/ahci-pci.h"
-#include "ahci_internal.h"
+#include "ahci-internal.h"
 
 #define ICH9_MSI_CAP_OFFSET     0x80
 #define ICH9_SATA_CAP_OFFSET    0xA8
-- 
2.41.0

