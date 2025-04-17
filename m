Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp1114570njk;
        Thu, 17 Apr 2025 17:00:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXXHMcIOCzBqldHpfBrxAL/eqAAsXhPhBSKxOES2LWGD/IwTzsfOtvqrzKLIdj3jJdWmermfwnjfmRgdA==@linaro.org
X-Google-Smtp-Source: AGHT+IGonlLeI6BSiRCBWxOqi3B+BrFIgspiic1X3dnTzhfdWbyQZ2SwcrirVs24VDStPM74INhC
X-Received: by 2002:a67:f08c:0:b0:4c2:20d3:a125 with SMTP id ada2fe7eead31-4cb8011a1admr985108137.8.1744934424246;
        Thu, 17 Apr 2025 17:00:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744934424; cv=none;
        d=google.com; s=arc-20240605;
        b=Uz3RIbsE2hJNUtSEdNED/Q7wkGbH/YXRgrkHvq0g+azdqqvjCifawzoDdbD/32XlYW
         3KnekEgFBt6LdkT/u2zDZxE1zo1VI304nxYcCBPvkXcGiIG/1bcAwkmeV44maT5VQ47C
         iuxcTckLwRKgSyvRvCDeBzOcec9p92UOR1CboSPoDkpdH/j4LYq8BEa9jBZxBF6U93Hi
         IpQWoQcV49HbFDcZdsLNIo7f+fSH1bObyKNQV5kElWoxfgJ21X1MW5szyrwnsoMLs88c
         6X5HIaKKqfQK7RLMUqwZHufKlriteXHQbpvxOjYpfXYlhgSJnqqRX+w6mUjht3DruMT1
         p0PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Q1BCsGCYDAReQc5VOE8gGZJI4mqG04gHq5Y6jpZDaC4=;
        fh=uVblXQaEuNtftIgBajKu78gzkViY/HglnmMVID/tfB4=;
        b=jKvrmUq5PHcvYjBYmjNw2PQX5Kb4fbyBWfMbTrgEuad28mjvxWW8d2jUoIkkaQ7+vB
         1jJv9pvqxXuFpKQiDxvIJ2dm8IUk1KoWUkK5kV+C1Sf2AItChZ6DR+6ZmYd7TPkHKYir
         CgzjgquwCB/RRFu2gN5QE7oD+h5Id6YzN67MBHtevoLQsWyzD4b8hPV1nGFKD4tuTM5R
         sDIDvT7dRwnaimlO+FJPjaALl9pwAZqjO5/1iqewF8pmY+v2+5gRwrWKmrbaIMq6OQmG
         aHSZOXaoryAmik0on+MDbTjge1ze5i3Im4+4Y9iyDd4M/aG3S7azzm5mtoj2U7qnq2tC
         YzLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="uRC+/DsV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4cb7dec063csi426442137.218.2025.04.17.17.00.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Apr 2025 17:00:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="uRC+/DsV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u5Z8L-0007CK-84; Thu, 17 Apr 2025 19:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u5Z8J-0007BK-HN
 for qemu-arm@nongnu.org; Thu, 17 Apr 2025 19:59:03 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u5Z8H-0003yr-Pv
 for qemu-arm@nongnu.org; Thu, 17 Apr 2025 19:59:03 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-38f2f391864so783412f8f.3
 for <qemu-arm@nongnu.org>; Thu, 17 Apr 2025 16:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744934340; x=1745539140; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q1BCsGCYDAReQc5VOE8gGZJI4mqG04gHq5Y6jpZDaC4=;
 b=uRC+/DsV7tbpXnAKDE2x41GqefzqPl4ARvYG4g/7xzZDWQij1hV90ryYOlOnnrQEAD
 j398wwUwcVMtjEkhsHSFZBj7sfAl6uqr2/3+TreWxjnlYzCn/+pOjzRzwjSkg8KWjdML
 8RgcSj3IvnmgcjQ+Xh4wXTVvspykrIpl1Pob1LEPPmnjBU2+6K7j/Ci74+PPM0ETP/XP
 SqDCDyvpNWVfQPJj9tDIRYejHoxyHzLuMkbrdV8EI5zvAHP7QWeAj0xp42Yn0APEJW9T
 d875Qi5CSq8RDjRb78o6BYn354d94F/RBN8ACF3jbPAl74FQWo78iM/oBkSGHnTTuBGr
 hdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744934340; x=1745539140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q1BCsGCYDAReQc5VOE8gGZJI4mqG04gHq5Y6jpZDaC4=;
 b=BaiURqthw0Wifr4UBvw5mt4/n8S2Uck873bbt+Fdf7/aT/QWejNJjEVq770nCUAJVq
 jVB0z/SEEPQxtGlcq+x/PsbQGU54dgWOoPag9JzR7z2f243BmwtCrCWQ/c5dudkNtTyw
 CvzvYzWmKrVJiDBLj82fWxPNNjUZzvqtGL2jfn9SKoi6veBQ/7/MiWziHpivfJKLzQ+/
 1aqZRF2bp7lnmcbOv0oJwnLe4xoSXjPIoVe70f12BHHJXlsbgIAGwYu+mYOjciWVCcgK
 YqQjjMYyFl9//Re+QeFMotRIM7GlcQAbB3YAKTgMCJC9P65Wo+hHaVpHBh1ccb6njKKy
 ex4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx+8FCk4sNwqbv07rwchD8kmowTkBsQFmkLwSHW/8xrwdy2RYdxprXZ0jAmCb4zUTluLojbfgzBw==@nongnu.org
X-Gm-Message-State: AOJu0YzWdDcU/8Qr0yRSDE3ijo5mw7WYoVEaUkeZcurmj80HMullMeSO
 ximjzazgZBceiQNjh776yS7fKZ9Y1DZOZsjdvttAgbD27uDXGypvkxcZTjHDpLk=
X-Gm-Gg: ASbGncsvz5EJUhZTMkrXn+xvNWtBhtRtTErdn5lbU3PPBztDLmnobteC30cdYqYEg6x
 cKyhI7RbCttvDZfnXXah0Karqngo/nBN8uA4cJOuriepWGgTDYbSPU+lTrbh9DFeHCjmYnHfeTu
 i+dIbUz4FPfLGcCowXsbuLT6DFC1Vh2DLi7XasekCptd10XvnZcWRSrF+KJ6aY/xlH0G7HGsJ0p
 YZwJctzqKLRu03+Bt7Vysp3ODhj1E2DwoZ/o6B+VRyWqvqsQSbXq+l9uqvEK6tKJpnXuuSLMjTe
 dtWbEAXZMTOrHxQFZH29GjyHR0suRgJtyAWPBjVwbBJ53IHuM078E0GqTQooegBGhBw9I52ljMA
 osOUHY0YsKPJ2lB1gFb1eWUI95TpMhbw=
X-Received: by 2002:a05:6000:1ac9:b0:391:253b:405d with SMTP id
 ffacd0b85a97d-39efbac60femr501344f8f.41.1744934340449; 
 Thu, 17 Apr 2025 16:59:00 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa49312fsm1045843f8f.70.2025.04.17.16.58.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 17 Apr 2025 16:58:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Felipe Balbi <balbi@kernel.org>, Bernhard Beschow <shentey@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Alistair Francis <alistair@alistair23.me>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH 08/11] hw/arm/msf2: Define machine as generic QOM type
Date: Fri, 18 Apr 2025 01:58:11 +0200
Message-ID: <20250417235814.98677-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250417235814.98677-1-philmd@linaro.org>
References: <20250417235814.98677-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_XBL=0.375, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: Ty8NYbO5Hn5C

While DEFINE_MACHINE() is a succinct macro, it doesn't
allow registering QOM interfaces to the defined machine.
Convert to the generic DEFINE_TYPES() in preparation to
register interfaces.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/msf2-som.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
index 29c76c68605..6ce47eaa27a 100644
--- a/hw/arm/msf2-som.c
+++ b/hw/arm/msf2-som.c
@@ -96,16 +96,25 @@ static void emcraft_sf2_s2s010_init(MachineState *machine)
                        0, soc->envm_size);
 }
 
-static void emcraft_sf2_machine_init(MachineClass *mc)
+static void emcraft_sf2_machine_class_init(ObjectClass *oc, void *data)
 {
     static const char * const valid_cpu_types[] = {
         ARM_CPU_TYPE_NAME("cortex-m3"),
         NULL
     };
+    MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "SmartFusion2 SOM kit from Emcraft (M2S010)";
     mc->init = emcraft_sf2_s2s010_init;
     mc->valid_cpu_types = valid_cpu_types;
 }
 
-DEFINE_MACHINE("emcraft-sf2", emcraft_sf2_machine_init)
+static const TypeInfo msf2_machine_types[] = {
+    {
+        .name           = MACHINE_TYPE_NAME("emcraft-sf2"),
+        .parent         = TYPE_MACHINE,
+        .class_init     = emcraft_sf2_machine_class_init,
+    },
+};
+
+DEFINE_TYPES(msf2_machine_types)
-- 
2.47.1

