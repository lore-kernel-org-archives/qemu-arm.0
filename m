Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp740965ejb;
        Thu, 15 Feb 2024 10:06:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCURkzrTPKvivwAnBqiTFln0LltlXWJHyB20Q+LbjI/GpSfjfXNvIFSOGc3905wD/TspUP4/uQ189dCIguH2Tp8fn5zP1B+O
X-Google-Smtp-Source: AGHT+IFluKnsjR//7b/qQ1qHkXjLNhhs1kEwAYkmSTTzz8D3HJgfvFK48Wh7sTaelOeBediiyqU+
X-Received: by 2002:a05:6808:a0b:b0:3c0:4986:a7a with SMTP id n11-20020a0568080a0b00b003c049860a7amr2629600oij.31.1708020371859;
        Thu, 15 Feb 2024 10:06:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708020371; cv=none;
        d=google.com; s=arc-20160816;
        b=OfxtuK32/Hd6DJZomq463jn0yjPe7u4RGlR8pbEr8QLSKX9BaMKe4rPMI2ECR+FnB+
         kd62zMrLBQD6FahbPO/r/kQJsKtv4VjNEUELAz+4BR+Da1q0IvqF6cr1JABEe+k/7you
         no1S0Hefi58npjpkQW0gPLyiJZ7kvw7QHVsdG1WoZEfQk+/QBZPpGGPqE/cxO+Mtydb7
         hl2oB28X6H12nvfrlJpHaL/RiTjIixB5J/txhAv5kdko6Ce+iwBiexJ74eWVL2u6cKI/
         EuTch91wcm+LAnj69V6njZWe1rMLS3oHsjZqnk6qERTxGGBA1jLm3J/kmG0JTWJMDWq0
         i37w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BcKvmadiGqmKN7g4qDe2Hjh8lZOAnNypphJxj7H8q5A=;
        fh=UpP9cMINxhxDEnUkImnPF5Wm2XGDqhes3MKOE9KhTBk=;
        b=G7WLdUFlP+qoElwm7qelkVkIXgzo6TboeT/AvPo8vc4RsCXy6KSzddnbk6f+30Pvyk
         6jrWp3Sy2En4+8y831NiJjLh5Lqsj7ognb4/6mMDgvOCaT7npN6F9Si8AxQZrv3q7yhR
         EF1bT4snvfJVfQ9DykdCyyCxYFGN+F1D4A8wu+O47drwXuWmI2pDygdqeI/heu8H5fqP
         2yfxeHvjNh633b5MgzxDfH+yDH1PUaNrI1d2JX8YxGAU6v64NPSDu0xk3HdfFvRWfr2E
         2wphDpD91fgD03dFfzlepC7nnLvKsuUN1stN6dWx5MhLoi1a55XDVOO8Nn8K1jozAwvc
         xX1A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f7paDpRx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h1-20020a056102104100b0046b32de2643si328453vsq.738.2024.02.15.10.06.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 10:06:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f7paDpRx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rag4G-0006N2-ER; Thu, 15 Feb 2024 13:02:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag4E-00068R-PL
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:02:38 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag4B-0002sI-CX
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:02:38 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41211acfcfcso8437375e9.1
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 10:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708020152; x=1708624952; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BcKvmadiGqmKN7g4qDe2Hjh8lZOAnNypphJxj7H8q5A=;
 b=f7paDpRxU1W1Jbr75o5aM8O4/n5UDydhEZasjhjNWqtb7lz1chLYUm7K7QI/6ejPpz
 VRmumpTnBw7L2BdwRE9scqyUQYX+J0ukicKE6hjoRrj6LV2sOn2Zj1w72x79X5o9/iBg
 JSUAz+gMVK5nol2asEY/l9DFuSsgJ4plcG5rvCNO69bGeoFI0Bf0RvMzV2xha7tcuP+I
 IswZnVMYWqKcroxeeu3uuTT2Lsr2faz/Kkqcsxp71L7UlQ7ZpbyzChNyPzd2zEKk2dLM
 qXedxhHGdtSXJLMH0jiYgDt6icq3IKgxHoDh+7ISkktT8r7FIFqLX1IT1dUYKxBx+EOY
 zIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708020152; x=1708624952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BcKvmadiGqmKN7g4qDe2Hjh8lZOAnNypphJxj7H8q5A=;
 b=YdsvTkAKN/kX/v9mJCCv/Fixl5a7/NcyXBk/rHJHKZv/FplSNnrBGSbE5O5Drug21Q
 CCewOKjzhHFG9iDkWsVfAFDViiGa2hSTFQzu1TPKLaNVva0MdVWzpkYRxx3RjXHifSPp
 05qI8kWaeDA5pIX+nf0kiCPyCD7S27WkGn5y/H/GdbnVDM5kfZ4UuptVPXKSzeXqNBHH
 nL/vcHd4m8PrhYU1jekcgzagbMfbHTsIix4dFTQD+vUeT30dQmlQ74GwCRl3I50r+Syf
 ILTBNXWCPNyq5GZ4qpkDIylNXtnsPSujelSUksGrSYOPMBw3X3HMUbG7jxKcvOPorMVQ
 oDdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUP2fdPV5DLWHyk+aFMGRYjdQ/xWNNMiOUXgjf8pLy4oq6AaJ/BdtQyqbWDE35snWTZXikAsJIORBljlGW3L8vgyD5c
X-Gm-Message-State: AOJu0YwBg4w5/gR3lWT7UH7/jBAK13/D2fBQCnvDeGAQ21BP4QxxRa28
 Srch+ylla3wLS8K+q9/Q7wbeEOAcnog6WkU/ndYIO9JdYn1wyZrqnGBqleX0HBU=
X-Received: by 2002:adf:fe86:0:b0:33c:f638:ed0b with SMTP id
 l6-20020adffe86000000b0033cf638ed0bmr2208959wrr.8.1708020151951; 
 Thu, 15 Feb 2024 10:02:31 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 n5-20020adffe05000000b0033b47ee01f1sm2432289wrr.49.2024.02.15.10.02.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 10:02:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PULL 41/56] hw/sparc/leon3: Pass DeviceState opaque argument to
 leon3_set_pil_in()
Date: Thu, 15 Feb 2024 18:57:35 +0100
Message-ID: <20240215175752.82828-42-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: s8CrxflqxUvY

By passing a DeviceState context to a QDev IRQ handler,
we can simplify and use qdev_init_gpio_in_named() instead
of qdev_init_gpio_in_named_with_opaque().

Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20240215144623.76233-2-philmd@linaro.org>
---
 hw/sparc/leon3.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index bea84f3ad6..a15f90e142 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -202,9 +202,10 @@ static void leon3_irq_ack(CPUSPARCState *env, int intno)
  */
 static void leon3_set_pil_in(void *opaque, int n, int level)
 {
-    CPUSPARCState *env = opaque;
+    DeviceState *cpu = opaque;
+    CPUState *cs = CPU(cpu);
+    CPUSPARCState *env = cpu_env(cs);
     uint32_t pil_in = level;
-    CPUState *cs;
 
     assert(env != NULL);
 
@@ -220,7 +221,6 @@ static void leon3_set_pil_in(void *opaque, int n, int level)
 
                 env->interrupt_index = TT_EXTINT | i;
                 if (old_interrupt != env->interrupt_index) {
-                    cs = env_cpu(env);
                     trace_leon3_set_irq(i);
                     cpu_interrupt(cs, CPU_INTERRUPT_HARD);
                 }
@@ -228,7 +228,6 @@ static void leon3_set_pil_in(void *opaque, int n, int level)
             }
         }
     } else if (!env->pil_in && (env->interrupt_index & ~15) == TT_EXTINT) {
-        cs = env_cpu(env);
         trace_leon3_reset_irq(env->interrupt_index & 15);
         env->interrupt_index = 0;
         cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
@@ -316,8 +315,7 @@ static void leon3_generic_hw_init(MachineState *machine)
         qdev_connect_gpio_out_named(irqmpdev, "grlib-start-cpu", i,
                                     qdev_get_gpio_in_named(DEVICE(cpu),
                                                            "start_cpu", 0));
-        qdev_init_gpio_in_named_with_opaque(DEVICE(cpu), leon3_set_pil_in,
-                                            env, "pil", 1);
+        qdev_init_gpio_in_named(DEVICE(cpu), leon3_set_pil_in, "pil", 1);
         qdev_connect_gpio_out_named(irqmpdev, "grlib-irq", i,
                                     qdev_get_gpio_in_named(DEVICE(cpu),
                                                            "pil", 0));
-- 
2.41.0

