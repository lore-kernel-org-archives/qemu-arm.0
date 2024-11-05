Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2806189njc;
        Tue, 5 Nov 2024 05:05:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUkj/ps5AtjfVLSl4tL6R+968pKFFOrnw+okxyavww1UMHgbTxdp/yglRMWtDpb7F1maNtplAW+s5m46A==@linaro.org
X-Google-Smtp-Source: AGHT+IFbYfEaDLhKlboAlgg2zNsdhPdT+B3JKa0qRZSCpofFx0C+4pMnzZhdLGM3S8sV7RwuTuVK
X-Received: by 2002:ad4:5ae8:0:b0:6d3:6542:848e with SMTP id 6a1803df08f44-6d36542951fmr225329866d6.18.1730811941371;
        Tue, 05 Nov 2024 05:05:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730811941; cv=none;
        d=google.com; s=arc-20240605;
        b=FMf/Mug4AxAq9MVIrMZvYM4vJK/7PWSYpk0S7l7aWrx3zpchNo3Vs8ZKmmzJ2mj286
         dFzPgdeWiz/JyB20ckQGIs2VIJrGdcFFmHg/AhnSVmdyY1/N+T2NoOuI1D9FMvTUExoR
         aWcNxA9X+DXYm6Aj5CgcQ7agZpHzCljIJkJVXM/T6mHJw4nnaOORRwMYlhjS5QBTsgox
         Bxop7Ecv3o5+bytIv6JgLUBcYrpVBiDSwfnEmpJFyU0JrVPq28ov/JDyD5lDBtMVwelf
         xN7djVVEgwM/hA7Z807aZYIbPbEfYxYgdsNhNx1Qwcnu8qqpu2IB16H9ImGTFmoAsy/g
         zGzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FTPJzGm6ARvkieLOl7sA7FxSacHjsJ3U8wjcC2hw8sY=;
        fh=HzMSVNGoEgLbcbU7uQN3GpcPPEmUM0RqPUoSXSnlsD0=;
        b=H9YPhsdmPY6F4jnwu6LpF/fOM5FKkCZUiQwTIJbKJjomwKTPn9Kg6eVvinv+Gt2IQx
         juk6MBMQRNoW08EBHiUbedSQ7mS1I1ush09FccG6K2oF7t6fUxsXXwCRwjqJQZBUXYi1
         y7S8Ly5rLaW+J2V4DcJKkA8ckqYDI++JBmarpnyKBkLI5nSDXZdCQwR0g7kj2j3VIo5s
         bRzntSzO4eeFm0DnY+fHRnJFodxos6Y5oSU9mnuDX6lPwT0ljI+7WkNZrmC8Mg7JYvdP
         8gTb31hlVF3cRvqpkbK4DzhQ281wrBSXfnGsphqllQMhFshv7MCRYeOBuNjJxO55PB83
         fSuQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OI0zRu5W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d35416b834si132597056d6.225.2024.11.05.05.05.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 05:05:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OI0zRu5W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8JFN-0001fi-Vp; Tue, 05 Nov 2024 08:05:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8JFJ-0001Tx-NC
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:05:23 -0500
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8JFG-0002Pq-QQ
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:05:20 -0500
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-53a0c160b94so6031292e87.2
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 05:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730811917; x=1731416717; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FTPJzGm6ARvkieLOl7sA7FxSacHjsJ3U8wjcC2hw8sY=;
 b=OI0zRu5WPJ+u6FeIyijnr+v/CDA4CFJwjh7vSvWlDuK0d/WRj8kko2onvYiigSBlNM
 o7CrbtRKbhg26TWr9G+6o8IMXk8bCpnDWeFiCrNUpDbVsd+vTwVRpdFOveVUmNZS35kY
 5d5/Bddr+G9epkTjJaAimElTSLfL0NkBNOXhuYMMC43QcPk4xQsDPwW/4l7o6upBCQ8r
 uP87a+HvhWRAU3Cp/SPgwLAuem+QJJ5Vl5B/PUi0Nyg/HxG7tdoCNVKbcKGr4aFykP82
 kzLBHtTMPzunjyHEIGdLSJOUWfIxx4/rXFrdLxzOo+WgV5u1rE9DLWucEfYunEnczBHb
 349Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730811917; x=1731416717;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FTPJzGm6ARvkieLOl7sA7FxSacHjsJ3U8wjcC2hw8sY=;
 b=JHzPhPQQoJ0+1UoUOLoU7IQen6k9xqT7V5L3aDTP0AeF0U21+fyn1WD6e4I2jEWYqv
 L2KYb1kwb0EmCQB+zfpepu6GS/jA4i9m7xi0XmOoeNJVujerXFu5DVmn0qVhyUXOfPzz
 9ITdNkjRBVnmHOsw/yK2qIook0nPPexTmaxZQkyygldfXXrOW07lcUDLCuPFl+zIH798
 M1FnEUfCyqroSCF+pOXHjxvQu8hpuADIpVEw0+Z2uHH6l1IjjLyKcCKdYOE79pWLdVUK
 XwDJoXqqI+3fVSFVy9Rn5kOahWWs8uZKoisspBX+5WfpZ9sBnW2BsB0WPp4BQO8Qk299
 y7HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXibDh/VzyLHAgUg+wJWnqvey7bbyd4Vw7XoDctsG75Zzn6IdRV8tExluhPzSG90nS8bSSnokK/Cg==@nongnu.org
X-Gm-Message-State: AOJu0YzyFIzxjmBIiNFRR7OrWV4FqrupF21CuIjh5+xx3B/TaoGpPRTx
 5WFvbwj8cCZz7EmWJ/he/CTbIyU9S0Ho5+8dE8jCgSrLfTxSoZOwtchVsV0z10O67iNMxpKJXgN
 s9c4=
X-Received: by 2002:a05:6512:1288:b0:535:68ab:7fdd with SMTP id
 2adb3069b0e04-53d65df270cmr7648972e87.19.1730811916609; 
 Tue, 05 Nov 2024 05:05:16 -0800 (PST)
Received: from localhost.localdomain (86.red-88-29-160.dynamicip.rima-tde.net.
 [88.29.160.86]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd9a99d3sm219571055e9.38.2024.11.05.05.05.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 05 Nov 2024 05:05:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Anton Johansson <anjo@rev.ng>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 04/19] hw/microblaze/s3adsp1800: Rename unimplemented MMIO
 region as xps_gpio
Date: Tue,  5 Nov 2024 14:04:16 +0100
Message-ID: <20241105130431.22564-5-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241105130431.22564-1-philmd@linaro.org>
References: <20241105130431.22564-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 2qaYMgxUPn9w

The machine datasheet mentions the GPIO device as 'xps_gpio'.
Rename it accordingly to easily find its documentation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/microblaze/petalogix_s3adsp1800_mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index 37e9a05a62a..581b0411e29 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -124,7 +124,7 @@ petalogix_s3adsp1800_init(MachineState *machine)
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, ETHLITE_BASEADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, irq[ETHLITE_IRQ]);
 
-    create_unimplemented_device("gpio", GPIO_BASEADDR, 0x10000);
+    create_unimplemented_device("xps_gpio", GPIO_BASEADDR, 0x10000);
 
     microblaze_load_kernel(cpu, ddr_base, ram_size,
                            machine->initrd_filename,
-- 
2.45.2

