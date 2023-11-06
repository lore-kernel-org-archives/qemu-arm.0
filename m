Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2678206eja;
        Mon, 6 Nov 2023 03:07:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFH5V7+WRcXPfZiXY4I608Y25guxeAFpdo101uyZO8Jl9tcGFTKIsLg2OiddUl5vbpc+cn
X-Received: by 2002:a05:620a:4305:b0:77a:75f7:d147 with SMTP id u5-20020a05620a430500b0077a75f7d147mr8253765qko.18.1699268867205;
        Mon, 06 Nov 2023 03:07:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699268867; cv=none;
        d=google.com; s=arc-20160816;
        b=v4THuVrp+1rxGy/bBpxvg+QNx2rllBOKztgeF8aUNI2t71BKktFWyMvJNNMBweUOfC
         Iki8GV3Ojmw8LS8fHyMA9RIX4d4d0ClENqqFZgEsImNAUMgI1ad2017Edx+wdFrRk5+m
         R6Dj2B7+o4snt/a3H2TaVq5d0x6CA51Uls6GTee6RFBmwa8LqvMP4daxqK7NCd02O7oz
         m9LQiNkTSdjyR5wFUGUp9dDsa41TPR55LBXKEaoNDKDa8u4ESXF6FLl688kG/wtka1GZ
         jTZAeBDeUAvlTvL6ZtLyk3MRbem5iUWCDbefMflSJg6V6EB4Q8WloxbdqWUGqSM5qgUE
         WBOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=2OUN8qI3wvvK+6EjwaYybG9IZ1pKduK7zbEAWLMDuTw=;
        fh=kxtIBrwY7v58V0MwHpEoArvHEW6OKvCH9QYtBCkoxeY=;
        b=UyDDt+JLqmSZ/xxtJmHnSMBk1Dv70r/sg4rpBKPQFhcAiMggsS8tjV51HyvQTXD10b
         gn4d7GuFtkxC+tOUALuYCOer969103RrHzN777F3TIj2gx8vRCcLbhDKW8U/Ou58oCuu
         YqpbcEW/75MyqsuGgJXCI+qyGM/op3SzIMFa5TGCeuIZyXTU4XqZSMap5JNO7tsjM9HN
         YNAh8lFohWNbI7Ozb2QYVRSGP8nULKv967bew6sqeGkrQk9GIG7S8xPaISH/sEPft0zQ
         6HrARsh0PctUshCqRMGfayuLcFyjTLAoj2JzzHJl8qCvs5Nc5ue6RFs+umklDne4cwk5
         UESw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="OuV1/Wk3";
       spf=pass (google.com: domain of kvm+bounces-702-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-702-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-702-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id v2-20020a05620a0f0200b00765aafce58csi5441587qkl.120.2023.11.06.03.07.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 03:07:47 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-702-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="OuV1/Wk3";
       spf=pass (google.com: domain of kvm+bounces-702-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-702-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6CE01C20BE1
	for <alex.bennee@linaro.org>; Mon,  6 Nov 2023 11:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3FC1B271;
	Mon,  6 Nov 2023 11:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OuV1/Wk3"
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4991A72A
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 11:07:35 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FCCABD
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 03:07:27 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c509d5ab43so62477151fa.0
        for <kvm@vger.kernel.org>; Mon, 06 Nov 2023 03:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699268845; x=1699873645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OUN8qI3wvvK+6EjwaYybG9IZ1pKduK7zbEAWLMDuTw=;
        b=OuV1/Wk3p2CYejNS+Gmt2fBvHPaXuFEdMy3ENvZKuseLm9SyNXLphqn+KAOww7EgB3
         kQrUyMLV7PixhbhbbOliMsTqMYLHOcH9FOIkZ5M4uissYodFsVdFoD8Mkcnu8wf+in+G
         pV85dQii9abuJ+x9BCNGFfEyJvxtN+5KVl8Q3Etp87oXyE1I3EuoqLNMm6FB6+OacD1l
         177JvWzSBdJqiM8JaWGnge1WvxedXGLDyWf4KvLifPTWCNShDnhxF7+vqbHEgogpgL5R
         6wGqljJ2rF3AvWZj9zFTfqm1b/XV40CFh4cghPgE3foVYY7RnNRs/o57lrI2YxaEozrL
         BdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268845; x=1699873645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2OUN8qI3wvvK+6EjwaYybG9IZ1pKduK7zbEAWLMDuTw=;
        b=VKsQJ9XdvYK5b4r+OicjoaBf8GNGeUWp3AVkHS+3RBklJ04SZYzi5TiyQTXjJ+QPzq
         Z7TZWsfISZQUWbNuzzNcSbabSq8eG9Ny4YexbgZNRBzp0/Sh5A7+le1hSMl5GaV+1G0J
         LYZKu0e1eRufbmNK5BEOgFqMHwHlvDX8MEo9LaOjOhy82ZHwzjj6kpoW7T6yhR9CiGnU
         R4lHavtHPvK0tiiviDY5Yab+SpgAfbC9jhWuUTpRSk95oK4Jygy37ZnEb5UxTmc1+2Om
         TeV2plCaEPfJas/+eRyoJxMQ8w+KpzhYebia696jHAI0oOJYypdNIem9GwPeBs2Yln5U
         x0zA==
X-Gm-Message-State: AOJu0Yx8BlejoIU2ON6Kr0iG2Fu3q76fPmgQY/DQo7l6pLcBN54Y/rNP
	rOw0tiBz5rdGoLbYCwolQtnicA==
X-Received: by 2002:a2e:3816:0:b0:2c5:8a0:b502 with SMTP id f22-20020a2e3816000000b002c508a0b502mr21890109lja.48.1699268845464;
        Mon, 06 Nov 2023 03:07:25 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
        by smtp.gmail.com with ESMTPSA id j8-20020a05600c1c0800b004063977eccesm11981849wms.42.2023.11.06.03.07.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Nov 2023 03:07:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-s390x@nongnu.org,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 33/60] hw/ppc/e500: Restrict ppce500_init_mpic_kvm() to KVM
Date: Mon,  6 Nov 2023 12:03:05 +0100
Message-ID: <20231106110336.358-34-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xcDJt/7y2Y2+

Inline and guard the single call to kvm_openpic_connect_vcpu()
allows to remove kvm-stub.c.

Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20231003070427.69621-3-philmd@linaro.org>
---
 hw/ppc/e500.c          |  4 ++++
 target/ppc/kvm-stub.c  | 19 -------------------
 target/ppc/meson.build |  2 +-
 3 files changed, 5 insertions(+), 20 deletions(-)
 delete mode 100644 target/ppc/kvm-stub.c

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index e04114fb3c..384226296b 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -834,6 +834,7 @@ static DeviceState *ppce500_init_mpic_qemu(PPCE500MachineState *pms,
 static DeviceState *ppce500_init_mpic_kvm(const PPCE500MachineClass *pmc,
                                           IrqLines *irqs, Error **errp)
 {
+#ifdef CONFIG_KVM
     DeviceState *dev;
     CPUState *cs;
 
@@ -854,6 +855,9 @@ static DeviceState *ppce500_init_mpic_kvm(const PPCE500MachineClass *pmc,
     }
 
     return dev;
+#else
+    g_assert_not_reached();
+#endif
 }
 
 static DeviceState *ppce500_init_mpic(PPCE500MachineState *pms,
diff --git a/target/ppc/kvm-stub.c b/target/ppc/kvm-stub.c
deleted file mode 100644
index b98e1d404f..0000000000
--- a/target/ppc/kvm-stub.c
+++ /dev/null
@@ -1,19 +0,0 @@
-/*
- * QEMU KVM PPC specific function stubs
- *
- * Copyright Freescale Inc. 2013
- *
- * Author: Alexander Graf <agraf@suse.de>
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- *
- */
-#include "qemu/osdep.h"
-#include "cpu.h"
-#include "hw/ppc/openpic_kvm.h"
-
-int kvm_openpic_connect_vcpu(DeviceState *d, CPUState *cs)
-{
-    return -EINVAL;
-}
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index 97ceb6e7c0..eab4e3e1b3 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -30,7 +30,7 @@ gen = [
 ]
 ppc_ss.add(when: 'CONFIG_TCG', if_true: gen)
 
-ppc_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files('kvm-stub.c'))
+ppc_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
 ppc_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user_only_helper.c'))
 
 ppc_system_ss = ss.source_set()
-- 
2.41.0

