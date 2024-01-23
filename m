Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp135980ejc;
        Mon, 22 Jan 2024 22:39:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnK2jrF9QxunuvgQ4L80wZRUbteygA1hH3b2OORUD/mKhw2gj3WAD7Er24r+ksdruKq9l0
X-Received: by 2002:ad4:5ec5:0:b0:686:1cff:676e with SMTP id jm5-20020ad45ec5000000b006861cff676emr480596qvb.28.1705991976402;
        Mon, 22 Jan 2024 22:39:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705991976; cv=none;
        d=google.com; s=arc-20160816;
        b=zYSiCTxpQTSerZvYbSZxqPYiCJ/pDMHonT0WLuLLyL12IkJkOapPXA4xzZ6Wq4PFsw
         6HlNvSM1WsyNXnd/oSqNBJiM6rGFQmlWXONLzbJ4SmIPOLMsWQcx8OtXvpi59W8spz2I
         I2NFYw9sXLEJXI1U4B7+VaNcuPeiYSMFK/j7RiU7MtiiAHn8BUgYUhidDOJvcWrJzgRU
         kWZgoFHRPqKABb+iXEVMgrOUThb4B8j4RoVX8u14Q2UCAIibA04AEX0/WnDkBWA61j85
         vrRByDXOZqsYXIeT3JYX44Y6rEsrOnFu6blHyQyRWtt3KHvvLv+YyU/9en3th/Ggs6AF
         KzKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yTFI6OnsG8Ecm0s/RbMlXPNe90MeYhDYsKxltFeRfZI=;
        fh=HVoLZTw5hlqqes9L9DSbvdhxOE62q72aEHLq82QYnRw=;
        b=AVpKBWxUgCiZOoZW1QLe6vizzgDPHJxWvLf83CbwIMaUCoW8AMk7bY7q+6zdRZVsiF
         19blJsxKBLaXQUVGktyuaDVJhkApdY9KGXkGpsGIQcUsKOokgipEyye7Zwpid2m4YQ0P
         VA4+68wncffQC1VjnSgYihZ1uED8TjkG2EOjIE0YZY8S3g9WXuwV6qqtc6YHxqcfdT06
         39HL+c4Qg15zcT1fPTYjdYkr/xPyDzd8IpRdaJohPQ1tzvRpA8UdxZGzxWv8ulkSE9zM
         ovF3gTIKsWv8LtE2E8eUBnnGoxbAnPqZUxwtUT3GfgtmEgQ2U9QRkQwlpNoEJb//EWj1
         5Geg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oJwAg8EU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w2-20020a0cdf82000000b0068176c14516si7343693qvl.188.2024.01.22.22.39.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jan 2024 22:39:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oJwAg8EU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rSARF-0003Xk-2A; Tue, 23 Jan 2024 01:39:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSAQx-0003Vu-C6
 for qemu-devel@nongnu.org; Tue, 23 Jan 2024 01:38:55 -0500
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSAQv-000846-Mg
 for qemu-devel@nongnu.org; Tue, 23 Jan 2024 01:38:55 -0500
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2cf050ea05fso8822271fa.3
 for <qemu-devel@nongnu.org>; Mon, 22 Jan 2024 22:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705991932; x=1706596732; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yTFI6OnsG8Ecm0s/RbMlXPNe90MeYhDYsKxltFeRfZI=;
 b=oJwAg8EU+ZjxEEPGkaiHSj7GScmTA7JqL9TBS/puFHXLyrU6JFSBA+rCBx3N/HnMfb
 IDiyVtkA3vM0LtUcBEANJVK6q00oFxXw9icv0LA4NhxVDrn3baC5gtia+mms/iZ+V5cm
 GLagQyEqpfXlZl+lxwvNfizfSVOHo8IGCpJ/LLSJvwMikL3+zhiZRoIusjyt2vEVcsjz
 TVOZQ2SESw8AQYqF6ENdM9Cq/AMt+khuoXjLAZI+CFE2TUIv/O8ZwMgR6GE803AnQ6uK
 xRieGOOjBd+WHBSc4LBBcgScU5Rb6UwB3AJeYTimu0sC4VCIQWoxJ0VKEnHrc+UhOlcP
 oFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705991932; x=1706596732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yTFI6OnsG8Ecm0s/RbMlXPNe90MeYhDYsKxltFeRfZI=;
 b=E5XKdcTYamq6nmh9ZewQxOzge1Sne7J5+aQs25SqDcNBigVmKdVShO0gWJJTRVQHmm
 RAsP6A5kxWuqQux36wwKpixCOdpYV/c/8USyDXIwetEcKRuMylDagGylNd2eaEKMcJ2H
 YcQZXQJicb7UedpMcSf9G/x8PHSmV6vTF/wnKSrT1b2VP2PbT+F8z6fC+TtEGjrzgwFw
 2RlBSW2DWz198loRLi/SiSHE1jQYHxGW9gJTArBFKJ8pLO6FtxJhFIMzKfW3REFqPFzs
 jHeX2iN7ME8Q8iA9vkt+JOHwLFOccdCennysThGw9H7U+5Yj/S69KRNCb6pfsT4ibVU2
 ei4Q==
X-Gm-Message-State: AOJu0YyDATWDg+mWUq/KE/yK8aTpqZadDN1y35YSQvE+P8zjCElOj/yw
 QkHNCtbGlzmtk5w5IMVU/a+PnxtmumUhffxXKZvyXrPK0LOVqIZ5ZCjoMeTnijCj57zb89o69rA
 HR1M=
X-Received: by 2002:ac2:538f:0:b0:50e:ac2a:6b6d with SMTP id
 g15-20020ac2538f000000b0050eac2a6b6dmr1784891lfh.119.1705991931669; 
 Mon, 22 Jan 2024 22:38:51 -0800 (PST)
Received: from m1x-phil.lan ([176.187.194.78])
 by smtp.gmail.com with ESMTPSA id
 vq7-20020a170907a4c700b00a2cf537042asm12380825ejc.192.2024.01.22.22.38.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 22 Jan 2024 22:38:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Gavin Shan <gshan@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Joel Stanley <joel@jms.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/8] hw/arm/exynos: Check for CPU types in
 machine_run_board_init()
Date: Tue, 23 Jan 2024 07:38:35 +0100
Message-ID: <20240123063842.35255-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240123063842.35255-1-philmd@linaro.org>
References: <20240123063842.35255-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: efVLlKmv5Xtb

Restrict MachineClass::valid_cpu_types[] to the single
valid CPU type.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/exynos4_boards.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
index b0e13eb4f0..01c7618a67 100644
--- a/hw/arm/exynos4_boards.c
+++ b/hw/arm/exynos4_boards.c
@@ -34,6 +34,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/boards.h"
 #include "hw/irq.h"
+#include "target/arm/cpu-qom.h"
 
 #define SMDK_LAN9118_BASE_ADDR      0x05000000
 
@@ -150,12 +151,18 @@ static void smdkc210_init(MachineState *machine)
     arm_load_kernel(s->soc.cpu[0], machine, &exynos4_board_binfo);
 }
 
+static const char * const valid_cpu_types[] = {
+    ARM_CPU_TYPE_NAME("cortex-a9"),
+    NULL
+};
+
 static void nuri_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "Samsung NURI board (Exynos4210)";
     mc->init = nuri_init;
+    mc->valid_cpu_types = valid_cpu_types;
     mc->max_cpus = EXYNOS4210_NCPUS;
     mc->min_cpus = EXYNOS4210_NCPUS;
     mc->default_cpus = EXYNOS4210_NCPUS;
@@ -174,6 +181,7 @@ static void smdkc210_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "Samsung SMDKC210 board (Exynos4210)";
     mc->init = smdkc210_init;
+    mc->valid_cpu_types = valid_cpu_types;
     mc->max_cpus = EXYNOS4210_NCPUS;
     mc->min_cpus = EXYNOS4210_NCPUS;
     mc->default_cpus = EXYNOS4210_NCPUS;
-- 
2.41.0

