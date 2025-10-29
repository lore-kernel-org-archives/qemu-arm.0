Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05010CCF9EE
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 07:53:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vE0zr-0007TG-2F; Wed, 29 Oct 2025 03:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vE0zf-0007SD-GF
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 03:53:21 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vE0zU-0002ED-Au
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 03:53:18 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-421851bca51so6285317f8f.1
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 00:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761724380; x=1762329180; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=duTawkNLhSCi7dSXdZEntP93fnqjFedpkaqu1jGpzBU=;
 b=JDUMVEWzxS0gSRUU4D6zFGNCqXoR2qFfQyVomYYvm+rQ3RItXQR57E2KgO7EhhHruU
 D6tu8Dggsz9UM9PlCPvoO39a9MWRdDHGN90IO1GwEdUGpfzalExR48H7Cn0F1Nmdi5kl
 SU/0ifgyWM/7BCL3D4m9vHVXLhfvyCyHlRjxKI1xXqUTH+i5RDDUyR66jsfDkniR/MK6
 mWjxP5JuFvY1pY7Y2F07HB24xI+yqAyK5YdzFsctgBGtYfjxguKu7NC3NcSZ5w+hZah7
 l6vwnFzO76yTNZMnWDiJUJtvM9RdPLjbaVSt6/9KyJV0ya4HHgQo0Ke5t0P+wprvJIww
 dpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761724380; x=1762329180;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=duTawkNLhSCi7dSXdZEntP93fnqjFedpkaqu1jGpzBU=;
 b=QlEKrggK9EiTOmiKtD1QFwrdcAUrnyjajZ1lIOEQ/cEBXkbvGFdQVVWjRUkb6kI7SJ
 rDDz4MWyLqdX8ssS9laDVqla/eKS/P/kBh8wD11kYRUtqTdoaUGMBBWOChjJlr/nWpu8
 yW+MPL6aKOJ0Gxs4VtUMJbneg+dHhe6fYEYT3wLeF2X2XE+2PafOjD/JkKqLbj+XlGku
 3AIcPWONUV7Iy04vYqDbZZotwyUhbCjYT3wyagnv7xYvDQ4h/b7v/Q/JkSaeQ9gyEb05
 SDUzMNa6A7efdF3Pq9waLDHCi04gSXdYYI7VaEoUFqV9Pi0kX945RjlWVWYC5BI38SQH
 MEYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJQqoT8KNtz0NDzujuOcNTI4U0oMiNCBe6zFP22eeZAXORBM55rRE2/vKHJxldVBtOzApgrtdKkg==@nongnu.org
X-Gm-Message-State: AOJu0YwiQkLk6DzjL+2XXetHIzryrSc4SW0OMU6JNZuwCuRSmZESiIph
 EleE9Wwu7DvPVN0s62dJ7Q/fcO7hfA17t7N/VNSzZsZs53+GT70zPtvkNxgsVpKx68g=
X-Gm-Gg: ASbGncvb259X/HF+GedX8Gn8FKkRobvS+JTke71oqvLqyhra1KEivy8+kdDK37aitEU
 vCieIWAI4HEj7cAqslLcT6EVhxQtLdqdx0ikMtR1sz8ZL7hXmEOryXA+9Rv3ecThbLI61HSTitr
 tGHenYuGB1CCTkEdkDF/LOiMg4uh1aqu7AMs5KGeiLkWs69yYaguLoFxLiYORr8umW2Dw+L9q4G
 20fZRfcsF/aVje/lxXejudJJtBxkATYDTS7VLHJ2shb1emfmo7sSg04dEammGFoGU/XIV0z4Fgk
 xaF5SXJLrruozKrs1IIFuCSdA8uo4NHMc3x8u5L4RFvfD9m80zI+huDSJ30gJsWIABJXhz8+TUI
 CYERjP4v4qkwpJDkpHkHPj20gI6UoRXMrMs1/h3bDwBpsiWjPSQUmNbxPXmKQuIU3ctXenf896g
 zMGqZjkXeISixQwoqSrLkS7BcY8P5Yzo7/f30hWQUpLFXLUt6Nhg==
X-Google-Smtp-Source: AGHT+IH+IktifKZlubR2xL4E+wR6kjCUh3KodxPC3hEvan7d14PErOWP0GrxamcXptrX0QjzOoqmdg==
X-Received: by 2002:a05:6000:2089:b0:427:546:4378 with SMTP id
 ffacd0b85a97d-429aef82859mr1619920f8f.20.1761724379784; 
 Wed, 29 Oct 2025 00:52:59 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b7b43sm25142154f8f.6.2025.10.29.00.52.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 29 Oct 2025 00:52:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH] hw/arm/bcm283x: Initialize CPU objects in SoC common
 DeviceRealize()
Date: Wed, 29 Oct 2025 08:52:57 +0100
Message-ID: <20251029075257.63635-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

QOM .instance_init() handler can not fail. QDev DeviceRealize
can.

The device-introspect QTest enumerates all QDev types and
instantiate each one, without realizing it, then introspects
the instance properties.

When switching to a single QEMU binary, all QDev types are
available in the binary, but only a filtered subset might be
available, depending on which previous target the binary is
trying to mimic.

In particular with the Raspi machines, the TYPE_RASPI4B_MACHINE
and ARM_CPU_TYPE_NAME("cortex-a72") will be built in the
qemu-system-arm binary, while not available (because filtered
as being 64-bit, for the qemu-system-aarch64 binary).

However the TYPE_BCM2838 SoC is not filtered out, and will
abort when being initialized, because the "cortex-a72" CPU type
is filtered out, leading to device-introspect failure:

  1/1 qemu:qtest+qtest-arm / qtest-arm/device-introspect-test        ERROR            2.46s   killed by signal 6 SIGABRT
  stderr:
  unknown type 'cortex-a72-arm-cpu'
  Broken pipe
  ../../tests/qtest/libqtest.c:199: kill_qemu() tried to terminate QEMU process but encountered exit status 1 (expected 0)
  (test program exited with status code -6)
  TAP parsing error: Too few tests run (expected 167, got 5)

In order to avoid that, move the CPU *initialization* in the
SoC DeviceRealize handler, so the SoC initialization won't
fail, while realization still will.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/bcm2836.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index cd61ba15054..6e4066f137d 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -25,12 +25,7 @@ static void bcm283x_base_init(Object *obj)
 {
     BCM283XBaseState *s = BCM283X_BASE(obj);
     BCM283XBaseClass *bc = BCM283X_BASE_GET_CLASS(obj);
-    int n;
 
-    for (n = 0; n < bc->core_count; n++) {
-        object_initialize_child(obj, "cpu[*]", &s->cpu[n].core,
-                                bc->cpu_type);
-    }
     if (bc->core_count > 1) {
         qdev_property_add_static(DEVICE(obj), &bcm2836_enabled_cores_property);
         qdev_prop_set_uint32(DEVICE(obj), "enabled-cpus", bc->core_count);
@@ -65,6 +60,11 @@ bool bcm283x_common_realize(DeviceState *dev, BCMSocPeripheralBaseState *ps,
     BCM283XBaseClass *bc = BCM283X_BASE_GET_CLASS(dev);
     Object *obj;
 
+    for (int n = 0; n < bc->core_count; n++) {
+        object_initialize_child(OBJECT(dev), "cpu[*]", &s->cpu[n].core,
+                                bc->cpu_type);
+    }
+
     /* common peripherals from bcm2835 */
 
     obj = object_property_get_link(OBJECT(dev), "ram", &error_abort);
-- 
2.51.0


