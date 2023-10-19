Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp325806ejb;
        Thu, 19 Oct 2023 00:18:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8wkI9WVLhyr3+E+XeEBP2YbJu79DDvli/uFGx17+jSLyE914GBpOjJBNjaADhVOYyrsoC
X-Received: by 2002:a05:6122:8d6:b0:495:cace:d59c with SMTP id 22-20020a05612208d600b00495caced59cmr1646467vkg.0.1697699939571;
        Thu, 19 Oct 2023 00:18:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697699939; cv=none;
        d=google.com; s=arc-20160816;
        b=PkUEnPyssOPXoNeDChujLimnIC0Uyh8KZOMaiWQNhIGknEGsk42sP2Rh+9qYcs2MU3
         Ix0Qb9/s1ZXNBo1mWKJXn0bIzjTUiVTPeEntZK8gBC4D0sSyDWgaC3PAettwHlwLiARU
         IZBcpL8YYx5fhcNkeCadawnOmwwFiKcw5EfGxWvywoHI39RklUGmbCpeYf19R+VfdQpE
         93YGsGUslo8GEa8AwSoJUGPMCw7/lK8GS2mbv8hJ9S0zduVMlBbQlby9zzbFjKNrYHby
         I3huibzEotrhLlzxWMxIQprK+TK8BM4S0bCL9KV5F+yJGkAaGByreSmMaOUj5ULswvG3
         +oUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FOncUjOO3yMCwvbdhDakCobkCJgYZJVQZiN+TzHHG2s=;
        fh=6jYKO1R8PvzdW4tN+W/XYlQifBf+lht0eG+bQc5OUAg=;
        b=iUZ7FuX9OBqiAPGRLI7CPwOQY2e1GpNQGnWXXMLQiT/duQpwV8Qta35FJiO7kOHdat
         1vePkqx9qoqqTZ7T9+d2uh+UNGi/AWNHZhW+OqQ2AGMW62cuJFrPz1BQKYv6GiH0lBp3
         1MIp9ECV63OMUiD5/mpRDV08nmkQyC9keJxZoPAVnZWvxi0ar3A8qN0+esa3XFAXO4Ed
         jdkIEhikRTGfqN2kkb8fOgr9QOBHtVsryRuOG1r2OPcYTmLN/cdtu8dlp1/FmPxF6nwd
         9Jg9vGTO2IOwLaRjtxax9bacyuJgh/3x3qzI6tIwWcE08zI+R4+UMHFS/DrB47sSgfbE
         vnlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hbaqSxf7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f16-20020ac859d0000000b004197ddb7c07si1176720qtf.288.2023.10.19.00.18.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 00:18:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hbaqSxf7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtNIu-0007ch-Qk; Thu, 19 Oct 2023 03:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtNIM-0006aE-BH
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 03:18:19 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtNIK-0003bN-Ny
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 03:18:14 -0400
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-507a29c7eefso6972326e87.1
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 00:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697699891; x=1698304691; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FOncUjOO3yMCwvbdhDakCobkCJgYZJVQZiN+TzHHG2s=;
 b=hbaqSxf7DxiBTz8M0isdUZq2zoH4UJ4v2ufU/jB/idSIidRMSVez5eFDQX9CZ87EIR
 wiGQs1QYoxRYt6CN6gno+SsmBAolfmnW9Xm6gOhu9pvLj6tKsxk1H/ZUQO0UJaxXwN1y
 WL40oyLBJhFI2DLlSuJT0uDcXV1OrMG2NH44FgjUKlHmlj1kB+WWWCficl0AQmtZwd9R
 3jj94LFrygDDBdulRwf65xAorfHU/N/kgugCBxGSooVz+AyGhHR6UhLgrKh+768CR8pL
 0VmaHBRurVEG/51gf2yxZWxF2aeokl65M21jUNWlMz2j1M2y5FCnXamxV7dUqlTMca5T
 suow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697699891; x=1698304691;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FOncUjOO3yMCwvbdhDakCobkCJgYZJVQZiN+TzHHG2s=;
 b=UTWJJseQX2V8BGGQqP+OEs9JBJPsYaZPaV1qJwaW+hZNx4viZVL1OcbGhsTnZ8wkBF
 RATXWXumxVZ32EmYNWdhZEgKPZ7XKglX3Ai/E5DuHMgGbBxASH7ZDX4T8fd+OyyghAsr
 0RIfk+DRL0CCj8hotBe9Zms7i8sBWfmBwZaFtz+5ky0QR3LNpxDwdmJKiLwuYJ9N9ZAP
 7tLuW7NjMWNhnU2KEGirPRRT/M2UFYyFnbgLYbhYXrxaPyKzVY2PJMJL4nWKovqcjLfs
 FiDxS4hFCS+4mLwKqss0GmFOF/qeAQhM1p0zcjpoPqjn/8Us7xJ8dRN0t4WBjxcGUN3W
 m5Cg==
X-Gm-Message-State: AOJu0YznIwxDEjZ2FhKXiTg3pPKgcXBl9wrYeum6lo48DVB0EmugfHtu
 8Fq1HAMcDue74j46qOrMajDiDw==
X-Received: by 2002:a19:f013:0:b0:4ff:7046:984a with SMTP id
 p19-20020a19f013000000b004ff7046984amr730479lfc.7.1697699891125; 
 Thu, 19 Oct 2023 00:18:11 -0700 (PDT)
Received: from localhost.localdomain (92.red-88-28-12.dynamicip.rima-tde.net.
 [88.28.12.92]) by smtp.gmail.com with ESMTPSA id
 y18-20020a5d4712000000b0031984b370f2sm3765991wrq.47.2023.10.19.00.18.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 00:18:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-s390x@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH v2 11/12] hw/sysbus: Ensure device is not realized before
 adding MMIO region
Date: Thu, 19 Oct 2023 09:16:09 +0200
Message-ID: <20231019071611.98885-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019071611.98885-1-philmd@linaro.org>
References: <20231019071611.98885-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x133.google.com
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
X-TUID: EtlgvNGzjkxe

sysbus_init_mmio() should not be called on realized device.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/sysbus.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 35f902b582..8f53cb926b 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qemu/error-report.h"
 #include "hw/sysbus.h"
 #include "monitor/monitor.h"
 #include "exec/address-spaces.h"
@@ -192,6 +193,11 @@ void sysbus_init_mmio(SysBusDevice *dev, MemoryRegion *memory)
     int n;
 
     assert(dev->num_mmio < QDEV_MAX_MMIO);
+    if (DEVICE(dev)->realized) {
+        error_report("sysbus_init_mmio(type:%s) but object is realized",
+                     object_get_typename(OBJECT(dev)));
+        abort();
+    }
     n = dev->num_mmio++;
     dev->mmio[n].addr = -1;
     dev->mmio[n].memory = memory;
-- 
2.41.0

