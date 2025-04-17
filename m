Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp1114123njk;
        Thu, 17 Apr 2025 16:59:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVHdfn9r4ZkOGn6F8dUwizZVdVaYfmp8jfOCXvvhrwUCBnCdTAaEW9hFPpfYyqBi5scMmks2H+ScvD8Fg==@linaro.org
X-Google-Smtp-Source: AGHT+IGTrVzhoOg5iTf232JpPskAGsYMCBvtEnOT1TeQxPLJsyuTgEBqi2RSMLY7K3xX9yciKNTd
X-Received: by 2002:a05:622a:306:b0:476:80ce:a61f with SMTP id d75a77b69052e-47aec4a4f03mr12887721cf.39.1744934355526;
        Thu, 17 Apr 2025 16:59:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744934355; cv=none;
        d=google.com; s=arc-20240605;
        b=dX0peqXdEiwuEym5L6FyVO1EYXF0WZfntflalln+3EzfP47kCfqHBYwJaXwxiD1LFd
         Hlr2x61bNy2zGAoC3wDhHRXw6IiD0RvxGo55Ymb5bDTiYfwdB/GpCm6Pea0MPbe73wF3
         Gi6oprpM8QtU7bzbboo89MFIdTuBPEzE6vCpo/qk5un/QgAT9Hk+3r0nbDL76We/2zfi
         C0Lbqcp4t996fFgNtS2jqqf23FrWy7tuXypgLg2qZafVWsnkUQ3N5eoPzmtK7qEZln/C
         7w1n7eG8SDp4T6vyTn9ZIg3IFL2w3FkSAkMUBDZmDjRJuFY450KHxsU+uZLl0kbQbwfX
         wAEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nXmcwYVTU4L9Er4BkpjqN8dz0sYT7bRQoVVZQuGVa5c=;
        fh=YRiizYHLvIOmfc6mcHe+IVuEzDF+ZKLySqQO3V+ykEA=;
        b=feRUkZD5ro9JAhRKkql08hov8+2iSY4STqq4Uy2PsLgxh2pjJydGFlBdrare5EyfRr
         SOwqGXdBTNYhQNWyAbVmRkL0WZJ9lnZEN1zKYqp9T9DJx5sh9BqbYdDekN3gTYDBS8cL
         v1LqhB3FuNAtw57EhLlG/J030C19n3XQXM0yRRBOC48RHFbE3/MiL8MtQYAPPTjnVDmX
         Z5wBEHxzp+h+vkCg6mn+fO7DmV28Pt7ufUy/xJzq3nC7Qb88cLAI4moH8aQvL5Q6+ziM
         Rv4pse7IufucaCNUV5QsbM/XIj4AeGNZpYbD75uOD2ukKDQ3FQGuXCbcjrb66RBAr+j4
         nWhg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eWW/rGz7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47ae9c0e00esi9951491cf.67.2025.04.17.16.59.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Apr 2025 16:59:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eWW/rGz7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u5Z8F-0007AX-4j; Thu, 17 Apr 2025 19:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u5Z8D-00079r-VK
 for qemu-arm@nongnu.org; Thu, 17 Apr 2025 19:58:57 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u5Z8C-0003wG-4u
 for qemu-arm@nongnu.org; Thu, 17 Apr 2025 19:58:57 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39ac9aea656so1623775f8f.3
 for <qemu-arm@nongnu.org>; Thu, 17 Apr 2025 16:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744934334; x=1745539134; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nXmcwYVTU4L9Er4BkpjqN8dz0sYT7bRQoVVZQuGVa5c=;
 b=eWW/rGz7gyAkjB9n4/xM/0D7bALy2i6b0ODl1zy/Z9l9cECg4JsfisZy6igp02nWSv
 InSCfAwmQgLLrrVT/UL4S8MRM2w7Ao3wdIvMs4hTYCIKkt5XcnFi4rza2609Gmh6UwBY
 kKjvHQx3Wvrt62orsxLDXEhscx62iKp5rHD7TlUI81h6Tknt1tRwlUqkvEF7VaKsTl03
 NBSTmBB5dnjTxgdi9RE4tLlgqLXgDBkYB9b+156IOK0UWoPN+Pq+47x4+LyBuqAv5EsI
 hPDX0nnD9VDhf0ziM7B2sNFZYmo8OG4hPINj+PoZMB9mLCbx4jZG3SWshExpmkMUk9TM
 G3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744934334; x=1745539134;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nXmcwYVTU4L9Er4BkpjqN8dz0sYT7bRQoVVZQuGVa5c=;
 b=Ucv3T3swT1R49gYNg5iCwJ7/s5BQ5IvtSDT+1r3stm7Mr+avbQ3S3ObXei/hb6ftU8
 0vVB75Wf819m1jJma99YWT00x4dClIK5nItvBTDgDiYq7qgPffpJteRYy6nCg0h8xapT
 lfyqIPwDcz3EViUDaqF7Fw35oPxfNRE3/tcuRFPERPNd/vt4qIqj6GH8Z9jCAp24IvwF
 pH36vWwTmkXUn6OujvXN286qk7/5yCxRHXtzpOLJn17wCP0xvLbGaQz+uzFVbrQ9hh+b
 EO6pj/xY8KwqGPmHkYR/oKGUuoDHK0lN1CFqq0M0R+I3IzokF28jyHcj6eofdv55012x
 Gmug==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3WxgFykO3xRz560MZNwhYf9fAp1asvIv96LFtpSB9YvygnOeCP023gENDwqyLz946CGgwq/jcMA==@nongnu.org
X-Gm-Message-State: AOJu0YzBEg7XooQEIIT11RTuoC7DVg7MPdFhpJ1j6sH7wIWVBmbZSWW3
 NHhdQY48flxxRCboSvyci34lrhodPRnBYHGHi7As8HIc8Gl1myW5sOBVsoUY/ZI=
X-Gm-Gg: ASbGncsnbDoYUjdpdwUVIeqH4W5eZBuI+Pe6tZPXj/0/0lVBialZxn9pTSDVVB35beR
 JNmC6DJsT83dgRIqlk4enaPm68+Iv4yFo4BTUXl/Br+W0WuNgaepzJGeLPL4JIylMtV+6zQhua2
 EzFqeCcNCexJws0jewTsD5ojZx5ugJCWRjuO8UmmnoQORcUMQfuyZZAxWvIJr/kTSOwMnGkgw6e
 p2DbyVjZ6bsSZWdIaeXvkhjLr7S74QVQwGVb/vPni/BIVBaieeAAJmbjQ5z2h8KTXqmc6D5TD9S
 B5bshqPGJUTQqt7VUjgDUeQSb4bN+Quz5ucRUmcPIOg7coBJ3PXMltWo5yetuqVIrmAqkjdBMF9
 Gs0c21kwiy6ksTVP+QyEQ
X-Received: by 2002:a05:6000:1acb:b0:39c:268e:ae04 with SMTP id
 ffacd0b85a97d-39efb947474mr596531f8f.0.1744934334502; 
 Thu, 17 Apr 2025 16:58:54 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d6e034csm800435e9.39.2025.04.17.16.58.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 17 Apr 2025 16:58:54 -0700 (PDT)
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
Subject: [PATCH 07/11] hw/arm/kzm: Define machine as generic QOM type
Date: Fri, 18 Apr 2025 01:58:10 +0200
Message-ID: <20250417235814.98677-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250417235814.98677-1-philmd@linaro.org>
References: <20250417235814.98677-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: jILBwiBv5HTp

While DEFINE_MACHINE() is a succinct macro, it doesn't
allow registering QOM interfaces to the defined machine.
Convert to the generic DEFINE_TYPES() in preparation to
register interfaces.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/kzm.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c
index 362c1454099..b56cabe9f94 100644
--- a/hw/arm/kzm.c
+++ b/hw/arm/kzm.c
@@ -131,12 +131,22 @@ static void kzm_init(MachineState *machine)
     }
 }
 
-static void kzm_machine_init(MachineClass *mc)
+static void kzm_machine_class_init(ObjectClass *oc, void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "ARM KZM Emulation Baseboard (ARM1136)";
     mc->init = kzm_init;
     mc->ignore_memory_transaction_failures = true;
     mc->default_ram_id = "kzm.ram";
 }
 
-DEFINE_MACHINE("kzm", kzm_machine_init)
+static const TypeInfo kzm_machine_types[] = {
+    {
+        .name           = MACHINE_TYPE_NAME("kzm"),
+        .parent         = TYPE_MACHINE,
+        .class_init     = kzm_machine_class_init,
+    },
+};
+
+DEFINE_TYPES(kzm_machine_types)
-- 
2.47.1

