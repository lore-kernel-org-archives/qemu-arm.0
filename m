Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2349809lfm;
        Mon, 15 Jun 2020 23:36:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2ndXFrsgyhzINWR9wMz0+8OTMVoEsrBTvxanFBnJ3gyx/rM6+iW4H/Zsnb3K652v8j97O
X-Received: by 2002:a25:c5cf:: with SMTP id v198mr1828663ybe.6.1592289411609;
        Mon, 15 Jun 2020 23:36:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592289411; cv=none;
        d=google.com; s=arc-20160816;
        b=ZCjEStjeyoh3x+z1IaVnyC7JkVrcZhtX8YN4KNklfK2JMwTevVyEGjsJdRRAznRjLk
         gdppqaCSmrxMBvhFbTd8RdUqtWCjLBc1T3XyrLaxwpmr3Lwggn1qGcpj4YtbgEerJyVL
         WXGkb9xJC8kJEb8ODW+QDr2Tb88dghER6Sio8WF9h3QI0/ZFfM32jCOolWvbhPfBFDXN
         FOhHbmhuhBt0BFl5e5vP3x7aoR3gXg1RfXeDEvNYGtK70yCB/NYASKPe1MkqXhEqX7lo
         MkJQ5pHOkgtJcTMWGdbR3oHtL3br8DbfGaj5wfKdnjC0OjkLb4qAyHNZ6iP9tQ9QDrF9
         xCKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0C754Z2styJVcWZeah0XfpUldg+E2WED/NhKiLJuUwM=;
        b=aWbu8LQtbL7Zxx0OXs89UwV910rld5C+iC29G3J8gOK0PYga1yriKdKtxXWWP/gCws
         d1tnPH44KyEo4EYYwG3BaMPOppBrC1P8n0ITHRBPTMihi8b1Kmv5bBAt0+19hyQDH4rU
         aqtZlLkw6x3d+mIIu/d82SyqkC1aLLfey90nqiOb35WFU3+pI24KRloAlv1MPAGLdgnz
         tt6X2/3tUVRDA6+j3wpkLoCEous/CNx4ykHA0hzx2LBbFLWmC+4D7XYbMNyK96WCxnY8
         Sb6RWM6fbeYL6h8r5Dus6fBydUQ9IGTvHHfVDp6CT/RCdQiQEpbmGjGwXTPD4ZCroiEA
         PXug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mX7AeBCm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e4si13463105ybp.143.2020.06.15.23.36.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jun 2020 23:36:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mX7AeBCm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:57088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jl5DH-00058q-0p
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 02:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jl58i-00080U-Hn; Tue, 16 Jun 2020 02:32:08 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:33660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jl58h-0003MH-1t; Tue, 16 Jun 2020 02:32:08 -0400
Received: by mail-wm1-x341.google.com with SMTP id j198so1519972wmj.0;
 Mon, 15 Jun 2020 23:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0C754Z2styJVcWZeah0XfpUldg+E2WED/NhKiLJuUwM=;
 b=mX7AeBCmISmFvf1ccvUqkR0mMy1JR8NNO98AQPSOzV4WYlL6sf5STJzzK7oDXR+E03
 R0CXPdpfts55K3YTMA2Acz9YHFrtm/JbUCXC+3GrbEQGIEV1Vv4dPshC4U5TpXB8oqPy
 oJpCC6kKvHaCiqyvgHuz5u3ollxjm8f/Jgk0ECRbo8FBjoZz62TatXlRU/fHuSbO2QI6
 PipW+aLCNLmcKyW7o8XqXdjwn2Xyz6WmGPrqvR7fc8H3eSJAjOomBcqzj1S01mOSBEV9
 /ssPOyLMADJqFH1u/eU5Ty0rFPtcFs6hJLaJAVXrVFUcFR9o85QUYv/vC+GiMRdCmwiy
 9IHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0C754Z2styJVcWZeah0XfpUldg+E2WED/NhKiLJuUwM=;
 b=rrlve4pCZNqXzK7IBdoapoOHiEEzED0oVzapBEVBA891QmUMlQGJnC7f57+KXJZWEy
 md6j1u4qB6jemmXYFLWiE/8q8r/EVSjKSrO/OhEoI1kwi4aGahUQmodcE0gxOOg2wB50
 gkHRcpPansWfSUPs0JAx12XVg563FFH2mB9bZtbzSg5fhV9TQBklMNeAyNvnvm68EDBj
 JkI0aStD3BnvJwg15k5yYShh3gCk+SQw2UbFvWhJuhbkptRKTTAUWBl1FSLXXsYUg3MP
 ybSqMheLcczXqcLhM4ToyndrPfLlZs3XLV+K9PK82e3/4MdT106/HJhqw8MQnT7SdqWS
 hBaA==
X-Gm-Message-State: AOAM533npcPKP98VB5eNdL7Be2l9Uu8L525Mc7Iu81kOi19xU2cG3hAX
 sHiRmbR3CE7hRwCO/St/jCyUKBo2
X-Received: by 2002:a1c:9613:: with SMTP id y19mr1475307wmd.135.1592289125102; 
 Mon, 15 Jun 2020 23:32:05 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id t188sm2483250wmt.27.2020.06.15.23.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 23:32:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/7] hw/arm/mps2: Add I2C busses on FPGA APB
Date: Tue, 16 Jun 2020 08:31:55 +0200
Message-Id: <20200616063157.16389-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200616063157.16389-1-f4bug@amsat.org>
References: <20200616063157.16389-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
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
 Joaquin de Andres <me@xcancerberox.com.ar>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Esteban Bosse <estebanbosse@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aMx16FMFzfKj

There are 4 different I2C peripherals on the FPGA APB.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/mps2.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 4a49bfa9b9..6224d7a63c 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -321,6 +321,7 @@ static void mps2_common_init(MachineState *machine)
         create_unimplemented_device("cmsdk-ahb-gpio", gpiobase[i], 0x1000);
     }
 
+    /* FPGA APB */
     sysbus_init_child_obj(OBJECT(mms), "scc", &mms->scc,
                           sizeof(mms->scc), TYPE_MPS2_SCC);
     sccdev = DEVICE(&mms->scc);
@@ -330,6 +331,12 @@ static void mps2_common_init(MachineState *machine)
     object_property_set_bool(OBJECT(&mms->scc), true, "realized",
                              &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(sccdev), 0, 0x4002f000);
+    for (i = 0; i < 4; i++) {
+        static const hwaddr i2cbase[] = {0x40022000, 0x40023000,
+                                         0x40029000, 0x4002a000};
+
+        sysbus_create_simple("versatile_i2c", i2cbase[i], NULL);
+    }
 
     /* In hardware this is a LAN9220; the LAN9118 is software compatible
      * except that it doesn't support the checksum-offload feature.
-- 
2.21.3

