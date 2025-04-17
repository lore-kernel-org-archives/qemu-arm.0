Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp1114134njk;
        Thu, 17 Apr 2025 16:59:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWc5c0dHyS+Ye25U440eYJS/r6/1MfE3Ixdq/MDAZORTpbTrbLb42mj7fkb3EnRI8XvHQdddXiVCXFTQQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEIlqxoi1/NA2/LPsfQ/oJuJWUm9SBDD1DHS2oU8ap3txUlXLEu6PibcrcKIE9pF7m2nAsy
X-Received: by 2002:a05:622a:24f:b0:476:a713:f783 with SMTP id d75a77b69052e-47aec4dc956mr13446021cf.47.1744934358002;
        Thu, 17 Apr 2025 16:59:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744934357; cv=none;
        d=google.com; s=arc-20240605;
        b=RAXdRvllJTgCiouc0BdCWhLl7bSa5STyR2Rcl22/igSoTXZajAm69zyFP+f+DdTXsu
         Ep8Y52hqQRHcQCINoMsSjlKZwdOi34us8lLoeLq9a0XXYyflXnKfkxIKKDYH9+mp5DIU
         k7W7NHDFkw34qYn6dCwZdPPziZrw4mBqRSWviDqe4LKdQ8zk3bAHZPx8E5iiIQlQEHkE
         5t1EAXpMxcKrTZ8mDXgeWqu1teZyEqTnZ2+M6qaEUKCtTqm2yR1PFAkaL+7Lj4Ic7tEX
         K2f09d1uDR5h0QAHobck9oX8B1OCELVywqhDOCjmOG5QnK0ZUgD8mr1CRiLyjlKvp5Jj
         A9Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IV76PRrNanbqrM8g0qKEhby3o8+8x24HZf+5mnfPp+c=;
        fh=1jAiOz9ZOZiJ8WVr3Keh04mib7D2a5yD5t71WWarq2Q=;
        b=X04Uv2TqEo+chzXPfLa0Eea42Cz4+71owrkMgMmIGRUftq0AYUBMZWtYSZnpSIPD9S
         gKFMnRau4Wf/6l+HgxbNV0gwpWXRKqjEGNpiOx7lHsKmeRYRso3jb8z2Jn2M7fccly6c
         n+tB0fyHFgd8H1TjKzFnrbd7BGul8VABNX4tb9cnM54PTaw3Lbi2sk5Fal0zrIEn6O02
         ZbQzLHl+6pPXDCebTyuoTfS+qYi4h3QE7/XZcEnMb0VjfOum0qC/EcBi0FB1qhNvpop6
         K0E7rI1IWG7oHrAwV85fIgMPMRvIlVXzrTweVJwc9+tcpnsF/qWkIziX+jLvGKPzBQo+
         p/tw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K4WzrWpe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47ae9c0e219si9241651cf.108.2025.04.17.16.59.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Apr 2025 16:59:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K4WzrWpe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u5Z8A-00076m-32; Thu, 17 Apr 2025 19:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u5Z88-00075G-9M
 for qemu-arm@nongnu.org; Thu, 17 Apr 2025 19:58:52 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u5Z86-0003vI-OV
 for qemu-arm@nongnu.org; Thu, 17 Apr 2025 19:58:52 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39bf44be22fso954834f8f.0
 for <qemu-arm@nongnu.org>; Thu, 17 Apr 2025 16:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744934329; x=1745539129; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IV76PRrNanbqrM8g0qKEhby3o8+8x24HZf+5mnfPp+c=;
 b=K4WzrWpe4zvJ3y8lGd1kHUw24Kczgpd7Ceq2ybWVporvbZsAE1AnSOaOLx5bhHPxgH
 k7Nh+Gyru9PSwA4lOQUurAdfgT+Uo6gVkLvWiyDJ2ydHlnp8Xck5bHFQRsjHrj7y1gYI
 t+VmgHZpbUToiY7FZBaewNh0YUwza/EBa6/qGF9p8DeDjvincOt4B5DH4jO8yd6ERS0L
 WTQesLAHJq63xf3XfIIgUoac4kfIbMlAkM3ze3Q0wf+JUtS/I2tz0nqTuGl2VrKbaj2D
 16QKVocK3AnmJqznCPTxbcsQ3pmv1TjolPPBdhho4aVv6g90AqIgq8f3IydtxsZZzZR+
 0mjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744934329; x=1745539129;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IV76PRrNanbqrM8g0qKEhby3o8+8x24HZf+5mnfPp+c=;
 b=TJklZLkQrGxxXadPqctNMBAti8h4mg6l+0aSEhZVjCBNpuYDFZy8YIGDnN34Ro0jgj
 +6rLmSdvuLL5LwZ4cmRGx/ZL7Xo4Y1gM25oiKaFZxJUeY4U1ZOxC9LAu+CdZZIQJ+Co8
 Js5yeXvgWtxd7r+9Jj2YvtYD0OX3isn2BRCDY164q3AaY5X1vSAu915dV3a+tar0e4AF
 SZuQ7wySuMdS9Lq6Cl5B4vReloQTrWAgO4mzIWM51hEfAgOiC+T2SyYYZ/IrVrUE2wDt
 tbnLDwWFjVZQOH+n4QptJUKqjYMdawZKpbkeDDXf9n4eQ3c/oCaDM3x0h99g6XaEtHry
 RtwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkkQxfmqSp8mvDSpk2VN7dLd0bMjch0Xno4sefoiZW31WB91xkXltdchQ+BUSM8GcoU+IWP0z9tA==@nongnu.org
X-Gm-Message-State: AOJu0Yx+8VwAKmw43nL9fxh3eoV3sjUh2SzCrlOOsorhDkV3W7cFu5Kf
 i3WgfeE4VqI3sxh0lShSd5josPWb94TvuHcsm6YPhCvYDmzgGxvjXY5Lh/bjbH4=
X-Gm-Gg: ASbGnctGxe9VmgiFkkymNfDmjzsk174Mx6HygxzeG5DyGsypKl9KEOQdLf6hihYcEtI
 oXDaz7iU49tErVrPlsBQ59JPJpPVSSxxCQalJBdQuwux61IP4WraUL31orCSFDHizrzeEzIDLWN
 G0kRTDGqzuKGyIkFaLwwKhkS5DePayjwUEOUMmrSTi0DstZglpXb5tAbeAlgFbtxR24AUo382ZV
 jYVz7T3h2nYpVCCQ/ck5hyJTJaLMLcFgXXAgw48D+FtE3BdRm/JAkz5pT4oM2YTjblQu5fJqsgn
 GOMs7FGNjrnUpOvOeCrrk9XJzW66EcKKl4xIn8e8aZ2+She3LKrZ7pDPZvxlPBqRuOkkLCIIiJq
 +uXzb+h4AROfge37BuT/v
X-Received: by 2002:a05:6000:1888:b0:391:4743:6dc2 with SMTP id
 ffacd0b85a97d-39efba5a416mr531019f8f.25.1744934329322; 
 Thu, 17 Apr 2025 16:58:49 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d6db230sm836565e9.31.2025.04.17.16.58.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 17 Apr 2025 16:58:48 -0700 (PDT)
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
Subject: [PATCH 06/11] hw/arm/integratorcp: Define machine as generic QOM type
Date: Fri, 18 Apr 2025 01:58:09 +0200
Message-ID: <20250417235814.98677-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250417235814.98677-1-philmd@linaro.org>
References: <20250417235814.98677-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
X-TUID: 2k+4+wO0Fl4k

While DEFINE_MACHINE() is a succinct macro, it doesn't
allow registering QOM interfaces to the defined machine.
Convert to the generic DEFINE_TYPES() in preparation to
register interfaces.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/integratorcp.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index ac0c6c60961..f95916b517d 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -681,8 +681,10 @@ static void integratorcp_init(MachineState *machine)
     arm_load_kernel(cpu, machine, &integrator_binfo);
 }
 
-static void integratorcp_machine_init(MachineClass *mc)
+static void integratorcp_machine_class_init(ObjectClass *oc, void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "ARM Integrator/CP (ARM926EJ-S)";
     mc->init = integratorcp_init;
     mc->ignore_memory_transaction_failures = true;
@@ -693,8 +695,6 @@ static void integratorcp_machine_init(MachineClass *mc)
     machine_add_audiodev_property(mc);
 }
 
-DEFINE_MACHINE("integratorcp", integratorcp_machine_init)
-
 static const Property core_properties[] = {
     DEFINE_PROP_UINT32("memsz", IntegratorCMState, memsz, 0),
 };
@@ -754,3 +754,13 @@ static void integratorcp_register_types(void)
 }
 
 type_init(integratorcp_register_types)
+
+static const TypeInfo integratorcp_machine_types[] = {
+    {
+        .name           = MACHINE_TYPE_NAME("integratorcp"),
+        .parent         = TYPE_MACHINE,
+        .class_init     = integratorcp_machine_class_init,
+    },
+};
+
+DEFINE_TYPES(integratorcp_machine_types)
-- 
2.47.1

