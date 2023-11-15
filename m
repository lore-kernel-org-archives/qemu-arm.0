Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3125036ejc;
        Wed, 15 Nov 2023 15:24:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGtCfo+cSJbipOpNxO7gKBt/S9hUSZ7pfie2/ah3/gYnTNbvP5dC32LjxH/4Mj23ROtNi2
X-Received: by 2002:a05:6358:c39b:b0:16b:fae9:2ad5 with SMTP id fl27-20020a056358c39b00b0016bfae92ad5mr5748040rwb.27.1700090640604;
        Wed, 15 Nov 2023 15:24:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700090640; cv=none;
        d=google.com; s=arc-20160816;
        b=uNgV99s4CFsnUAvpjzWehWEbxBxk90CmA58yWnl2Y06RCPVuY8YCslW7R+Zvq7dfVt
         6IcQEjklnQuepu7l+k192aRtJbk3EjeUBiGcYYKFG6xcYedal5w/QGsabR7huyCfEWEc
         18oA6MyPCEyuHDvAIpAxpnlH12n0SGvr7w7ItSOXf+fridUSsxF7CHKl8IpSQCdcacdt
         kS01EivTNWC+buDaGcLXsLuK1DmykeELms00VTi4BbVvlJk7lCGRUf20NoAn9+zPOoN0
         z+CH1xfN9pRIZil8MtEnCtNyRS7mrcNEh/jfwczdF3Vrh9hUe7afRBwlea4iMjihjtIH
         AjiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XdaILDX0UTZX18ZacnU/N5Y1jh+ZT87BDkgwEDab2Z8=;
        fh=uMNkG2qG0zUfNX9Dd8yIHy0nhEp+iUPJbdGoU1GKRvc=;
        b=AT07O2/8FSKw0/inWvt+dJgehWGNpYTRMm7IhP1JD2P0ty5SnHAizyimJDishjKRi/
         kRuRLme5zHkLf0G5dDv4Onehummbb7llqgsxhS1XLYWqHs0xpOAz8R0JkxyLRBGbuzfi
         ZvmssPwkdFLTxJv4gtywTq46cmS9AftigWPR/MnZr+klyklsNFNxDk4LAwJ3SFMwMLg3
         h+AUJEV7kmPYf1nhdS/Utli3ZBSapzDRTeE/01hPc91twl8HwPEssSM1S0D195Ck5sEk
         aYH9iw8N5PQQAPpL4BpE8F0EM9w28hq66m6oT8aG9Mr9tNz0fkMOBJduLCnpuKZ4J5RY
         sYpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZBGSnvPT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7-20020a05622a174700b004122e2178desi9797327qtk.695.2023.11.15.15.24.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 15:24:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZBGSnvPT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3PDW-0007do-T0; Wed, 15 Nov 2023 18:22:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3PDV-0007dU-SY
 for qemu-arm@nongnu.org; Wed, 15 Nov 2023 18:22:41 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3PDR-0003U2-V1
 for qemu-arm@nongnu.org; Wed, 15 Nov 2023 18:22:40 -0500
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9f27af23443so33276066b.0
 for <qemu-arm@nongnu.org>; Wed, 15 Nov 2023 15:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700090555; x=1700695355; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XdaILDX0UTZX18ZacnU/N5Y1jh+ZT87BDkgwEDab2Z8=;
 b=ZBGSnvPTjQN5h8fVPyZcQQicvqm24OPrOaxk6gSQ8aXzXknpZ1vHpwONBCgRr5k8qo
 8b/tdOctbpFsiRs+N8tePfK4EuoiYLt/oyDCjm7VVY5hsBpI3tmzsWJEbPCrwF1NKc6Y
 smYZUk4KaVq63TP3V7WswqSAYz9EjfGui+ueTl8YSPNrdwHf8rpB505D0rxkEnQ1ZzYB
 X3gsVTB2EnegCr8TfTtE27FmNz2djtJ/oUq+mrhl3et3eu4/cD6qo8Iq6wpza2jafjCM
 Cfu4+hRbr2/UJSXUSaj7tRp10AQV8Ob1HUrI0Pqo0h3LSJ6F/9SGDAlsVCUU7YMlZGr+
 hJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700090555; x=1700695355;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XdaILDX0UTZX18ZacnU/N5Y1jh+ZT87BDkgwEDab2Z8=;
 b=Dxr3MdfaxY5mkibItSa2DkVr1FOFtairzPGY7hgdNy8jWrIfPeyOSdnQji6ho2hLlG
 N7FWjEsJvqrNH1XINe098u9TJQIBbDMBcY6sFtxWcd7miLu7ZuciEHLu03CYy7a+FHzE
 y65hupaYZRcsM2tVRcK/+Zp+vom3TQ9NbhvYWRl7KR66rdNdAx+ajBVBGwGtlXYOa+A0
 2a6yLQ+GNzzD7fzLeU+bl6O1e1744rKUt42Hd/nb/J0SzRpxZc2wlyoKg+Oj4XTclO5m
 pHJvnkyhtjibQqxXpMm43ldlDqELpAfOp6TkFlCfTYWQLZgTPso4DUOOC2aIWjKGL4Nn
 T22Q==
X-Gm-Message-State: AOJu0Yy9+QALGD4qbW2ratvD/VeaW/ALHlHsHfvuwvSCX/ljzoZV3urK
 FEs5NoQrGu9yYO6mUB8HL7jnuQ==
X-Received: by 2002:a17:906:6c4:b0:9e4:121c:c292 with SMTP id
 v4-20020a17090606c400b009e4121cc292mr7264894ejb.77.1700090555672; 
 Wed, 15 Nov 2023 15:22:35 -0800 (PST)
Received: from m1x-phil.lan ([176.176.130.62])
 by smtp.gmail.com with ESMTPSA id
 bh2-20020a170906a0c200b009e6b055fa88sm7750745ejb.148.2023.11.15.15.22.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Nov 2023 15:22:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Tyrone Ting <kfting@nuvoton.com>, Subbaraya Sundeep <sbhatta@marvell.com>,
 Hao Wu <wuhaotsh@google.com>, Felipe Balbi <balbi@kernel.org>,
 Gavin Shan <gshan@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair@alistair23.me>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 6/6] hw/arm/musca: Simplify setting
 MachineClass::valid_cpu_types[]
Date: Thu, 16 Nov 2023 00:21:53 +0100
Message-ID: <20231115232154.4515-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231115232154.4515-1-philmd@linaro.org>
References: <20231115232154.4515-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x631.google.com
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
X-TUID: rZipJ3h5iL6d

Musca boards use the embedded subsystems (SSE) tied to a specific
Cortex core. Our models only use the Cortex-M33.

Use the common code introduced in commit c9cf636d48 ("machine: Add
a valid_cpu_types property") to check for valid CPU type at the
board level.

Remove the now unused MachineClass::default_cpu_type field.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/musca.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/arm/musca.c b/hw/arm/musca.c
index 6eeee57c9d..d3658354ba 100644
--- a/hw/arm/musca.c
+++ b/hw/arm/musca.c
@@ -355,7 +355,6 @@ static void musca_init(MachineState *machine)
 {
     MuscaMachineState *mms = MUSCA_MACHINE(machine);
     MuscaMachineClass *mmc = MUSCA_MACHINE_GET_CLASS(mms);
-    MachineClass *mc = MACHINE_GET_CLASS(machine);
     MemoryRegion *system_memory = get_system_memory();
     DeviceState *ssedev;
     DeviceState *dev_splitter;
@@ -366,12 +365,6 @@ static void musca_init(MachineState *machine)
     assert(mmc->num_irqs <= MUSCA_NUMIRQ_MAX);
     assert(mmc->num_mpcs <= MUSCA_MPC_MAX);
 
-    if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
-        error_report("This board can only be used with CPU %s",
-                     mc->default_cpu_type);
-        exit(1);
-    }
-
     mms->sysclk = clock_new(OBJECT(machine), "SYSCLK");
     clock_set_hz(mms->sysclk, SYSCLK_FRQ);
     mms->s32kclk = clock_new(OBJECT(machine), "S32KCLK");
@@ -603,12 +596,16 @@ static void musca_init(MachineState *machine)
 
 static void musca_class_init(ObjectClass *oc, void *data)
 {
+    static const char *machine_valid_cpu_types[] = {
+        ARM_CPU_TYPE_NAME("cortex-m33"),
+        NULL
+    };
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->default_cpus = 2;
     mc->min_cpus = mc->default_cpus;
     mc->max_cpus = mc->default_cpus;
-    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
+    mc->valid_cpu_types = machine_valid_cpu_types;
     mc->init = musca_init;
 }
 
-- 
2.41.0

