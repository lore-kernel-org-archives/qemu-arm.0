Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp281375njc;
        Thu, 5 Jun 2025 07:19:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXfiOexf57YI1HEmedCw3MFOWenQaLH5hpamxwCxwheRANdq9ESWw4Ky6Hryk7MjC2IqIgWYaBJP9YBsA==@linaro.org
X-Google-Smtp-Source: AGHT+IG1XUA7gy6XR/ATidMvj0vZDNuQ+al0rZPCQr71b1NbcEy4D0EJwZ/5ShFehGXCXK6JAshk
X-Received: by 2002:a05:6122:2505:b0:52a:9178:d281 with SMTP id 71dfb90a1353d-530c72bf537mr6759418e0c.2.1749133143697;
        Thu, 05 Jun 2025 07:19:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749133143; cv=none;
        d=google.com; s=arc-20240605;
        b=kN8/btV/e0vkP9ty9bOaS9+JWf7y8+R0z3xF73YJNXODPsKefQl4b3/YtRBNSSDlyA
         PsUi0gW2XApdkCpvKN2WeZp7vLx5WsIIvsi5+pm4YUAcJbTlVCKO0VqWOREqMermMpWf
         fFgphfIK74pZCFgdJ42uweFyV/CwVmWiS5kCr1gCBFmadSjzuqbNQBgR7O6Jc1KuNnAW
         Q6UP6pHhIV5JaMREFZJ6NRoYwXb7nd2OhdoCU8xfZuefN+6rbNwAhZxH6S26Pj9KcK6u
         AQlyK+tnpICkGYLBunOx+ZC3NfJ2AoEn1O1uFzhkuUSXL+53tli8+6ePQdCXUWI9vWFL
         gCZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=UzSqdQKz9aJ2vSPHh9ioBp0u/bmrqqTbXn12Ae53pTU=;
        fh=2ljJL1lgX8cYiuiOSYusr4vj8d7SYztKp8wCaawyIAQ=;
        b=WXHIMeuy1EsyWL/CIqV8KGIO8Zxhaww5zeR1uUJTLILti8wPqlWir3Dmj/ZO/bPeZh
         /g7jEj88bXwlVqkHsG2Vd6Obxc2R7Wre2f//o8/XfnyAtdhszMxEjF0xnv8+Xdz+3y0O
         Y9di0Stdbzdd/lHB6ZmPO03+CH5zKo9RBzyBUDD2rnRGBSX1voYw0dskNgh1bSNyZra4
         AA27Vt388sedzodsngFPZZDJPdJvkXKPwxbQmnfkJk2FeFq1D4GOUfe/QxQ4WhpFU7mM
         kq21lie+AmUjzBofJYn7HfYDNULzpHgVsbwCLXqDue9/rIptC1L47iGUKmM7cNNlm9M+
         oZjg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YiAioirb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-53074ba68b3si5597358e0c.159.2025.06.05.07.19.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 07:19:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YiAioirb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uNBQ6-0005Gw-6X; Thu, 05 Jun 2025 10:18:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uNBQ2-0005GL-3f
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 10:18:10 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uNBPy-000186-BK
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 10:18:09 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-442f9043f56so5581425e9.0
 for <qemu-arm@nongnu.org>; Thu, 05 Jun 2025 07:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749133084; x=1749737884; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UzSqdQKz9aJ2vSPHh9ioBp0u/bmrqqTbXn12Ae53pTU=;
 b=YiAioirbqDV+UauyiB+5521GHs+QBPL0jFNLJ1gcaFl6/uerwd7u9ORyw55lhzaVNI
 npywytcgJy2zYe0g4sP9OPHpqV+Du1uMH041Twgb0xs+m9znzu8vCHjkx37ZzzNgQhg7
 CmgvVIFGYoDj016Eb7/oLxobtRpkVxaK92TKYQD5tJHDSR0N8pjccEDtn8MFj1gIplRW
 HajYaSI6Q5zSFPxJHSfp3b1hhnESGWeQ+yUOC5sKM/nbQ1EeXrP00w3tF+6NQ9mIuwZ8
 YOQRjC9MNAvjdAD0joHRxeEJir1CE445aNZf30kHXcuSNwvVW2iGqUeiXPZKDhWh1MaJ
 eoxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749133084; x=1749737884;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UzSqdQKz9aJ2vSPHh9ioBp0u/bmrqqTbXn12Ae53pTU=;
 b=MEaTD4vFyTDFyBPOigEh/1apL7ZtluwLEWGY7pTmxhATsHHGP9xe2TpUH0M9tfgnEp
 j46XLVojWrSz7ps0izxovoUgniHCrCwyt5J6kZYXOEs6cozYaz0iG2lyrtTTTEpMQjBB
 fBx38C9ii49alg19DtTQn6YerTTHrv83K9XKQU37R+dcYrx+F7rwyhdhUpHOnVeX4lgn
 xlpXc4s2eiRp4Fmy+zkMnXDKznTIRe4fDHm4NQJdX8TEOebNUVSVLTb6q8HJ4PX14Bc4
 hpYoC1kyFxg5ssW4RfhNOGZ4RGZOf99fa8akUKAE4lC0y5UUSFVTG+bNRFkHsoqmsQje
 jMzA==
X-Gm-Message-State: AOJu0YxXi5teLpa7vIIn175Nd8P+JVNxq8GE2UkWrotwh9O+xuX3+7Of
 wruKkvNydedx9PUIAXsj0k0pwoE90PUh4+VbPAuSwHxzUxn0K8YddST6cJ/fmElJnsK3Vuv6Ub7
 6mNSp
X-Gm-Gg: ASbGncsJqcYeq+bPNE29jK73yT4XxLj8f1/jsxjsMegouoHmNn7bEkZ8DclQ97TpWwK
 tyVQ+ItnXYIuqQ5pg/tfRaUAR7zACfeue33tLZQqr9pWAr8GWhoU+aSYl3vY3aSUkIAH/mJBee1
 luiuqvDNgGJXAnQvADI8M4J86/97La7dS1NK5O/lS9dBQOSZ6q/NxBAsg/LXNYdPeFxFukBiH2R
 pbAQh0iWOBFYS6nhmd15Ywo2qk2TcBSv4ypuQyktB0EPV2M2fQR5Dq5gekqg15SQ7IWAeB0iZf/
 edb/V8NvhGkP9unLjMi02epk5Rylm8uhmrbatQe7qYfLotYRXrIHl/GH/g==
X-Received: by 2002:a05:600c:1548:b0:43c:f8fc:f697 with SMTP id
 5b1f17b1804b1-451f0a72bf1mr74933005e9.9.1749133083780; 
 Thu, 05 Jun 2025 07:18:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-451fb2213c1sm19756095e9.34.2025.06.05.07.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 07:18:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	Corentin GENDRE <cocotroupe20@gmail.com>
Subject: [PATCH] hw/arm/mps2: Configure the AN500 CPU with 16 MPU regions
Date: Thu,  5 Jun 2025 15:18:01 +0100
Message-ID: <20250605141801.1083266-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: gtUDnpzWi3Uj

The AN500 application note documents that it configures the Cortex-M7
CPU to have 16 MPU regions. We weren't doing this in our emulation,
so the CPU had only the default 8 MPU regions. Set the mpu-ns-regions
property to 16 for this board.

This bug doesn't affect any of the other board types we model in
this source file, because they all use either the Cortex-M3 or
Cortex-M4. Those CPUs do not have an RTL configurable number of
MPU regions, and always provide 8 regions if the MPU is built in.

Cc: qemu-stable@nongnu.org
Reported-by: Corentin GENDRE <cocotroupe20@gmail.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 58efb41e6db..50e1a1c1c80 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -224,7 +224,11 @@ static void mps2_common_init(MachineState *machine)
     switch (mmc->fpga_type) {
     case FPGA_AN385:
     case FPGA_AN386:
+        qdev_prop_set_uint32(armv7m, "num-irq", 32);
+        break;
     case FPGA_AN500:
+        /* The AN500 configures its Cortex-M7 with 16 MPU regions */
+        qdev_prop_set_uint32(armv7m, "mpu-ns-dregions", 16);
         qdev_prop_set_uint32(armv7m, "num-irq", 32);
         break;
     case FPGA_AN511:
-- 
2.43.0

