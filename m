Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF66CCF9E0
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Oct 2025 19:06:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vCN6s-00029O-Ab; Fri, 24 Oct 2025 15:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCN6p-00027l-LT
 for qemu-arm@nongnu.org; Fri, 24 Oct 2025 15:05:55 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCN6n-0005KP-0i
 for qemu-arm@nongnu.org; Fri, 24 Oct 2025 15:05:55 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-421851bca51so2151972f8f.1
 for <qemu-arm@nongnu.org>; Fri, 24 Oct 2025 12:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761332751; x=1761937551; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FimQXnCYHKm6ncvC3S5Pc9wwaP1Ko27xUZV6rL9UQNE=;
 b=xVksornqzr5W0Q7/tyitYhH8vL5Y19YzqdSTRZI6Hnlxo/WsSh7HjwYXrDFyVuw01b
 l4IIsvmUS0ip1BWAkrExdWcaXxoIJ1zZtcqZpml3UioguFEJw+FTc42NzlpkWqPoHQBd
 9perQJpBF403n6xHmATZuG3aja15Nzk4TyjOOTk7p7twjzAlkARfbhGrUAPK5QZghLaB
 HiToLgHljQ3Twx5AsJKzJopJ8PEl4n9g4d5lscMZLQtn2RN2k1UKILCSACN2xG7x3Lc/
 UJVyIdSvaRJl0V8t93nv63egXYbJJt8RgZP/yoFD7SjrhhRwaZHl1L/vy5xC0fEN22ue
 dmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761332751; x=1761937551;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FimQXnCYHKm6ncvC3S5Pc9wwaP1Ko27xUZV6rL9UQNE=;
 b=rySOgVikEu58x3+SladXWsEkYdRaLrPvZWqeTmF/nrHC7slSnlcwatw+yLGDM9gwJM
 nxkpFM9hQ1ywZROhRnz97tn+8oX2+Q5mkrU1r4JHqnx+LxzMiLbx5LCB5mtr3cmyFNMH
 Q7LS8vHTHqg90GDnEJTqVrvM5GCUPZVDYWbHGZZk7MiPgbA1ETuIvieNINrk7cE0y/f2
 d8OFQfZVA4wgjrXNObAicOad5GItplamiVpUeCLwdrqfSaxx4KaDhWxZp1xHR0AYr2FQ
 Kcd32MfWl03yLkdBa+5baYQHsPcu7512oo1AXRUJgYMcMNoNXXhNdkJe1DRNGp2fP+fl
 dOHQ==
X-Gm-Message-State: AOJu0YzcQ5keRcoWhAmRaqfQPof5QX3taINQYJdklMly13GO1EriQYL2
 lHi/PofDwT2rxUxAznhVBSiocKzqcgMnRG1aN1x+AfsvohFHGSg0TZKQj0jJXi7CU6M=
X-Gm-Gg: ASbGncvQJAAUd/2qEJZORRtx02ReJAFnPYlS99ibo99p2Tqk7LDfcr1n4evbesK4rIA
 2ngyub84v3KwQdZZUuVrDCbb7YHEYeOwCD6o0IStCZ2v+yMS060k28m0B+KUnD4Vr48lEOgZZuv
 PaVh9hnWEWecvvckPyXAyDbc1BYfiJnBRi7cCr6h40Wtm1QIP0dedonpgU06eLpfijFlTLouWld
 UZ+Mzr7Q1guzCxMKttAu0B2lAwWmQDeHzXI1M76lfgLCUaxFxFDRfvq6wHQqX03dXqXM4i3U2lN
 Oj8ECqMmoYa7FycVGM/hbazYpI0rKruKRdsRbDJ4rZGhEM3Q7mJ6m0eQ9cYZySeLWB7M981RvKd
 13jQ6iZeZfwNBQD3rQS8JwCOaqekvwCUp+V1MKSb2O3rKJSRQqZ+MtLr02PDxPYSZz5wiaVUSxv
 BkDl6Ng1v6tjdVKZ0xtpu027g1t0dUtHdXJ3+lIfqwvVcUXyayhjp7OdtyvQ+U
X-Google-Smtp-Source: AGHT+IFKoLkMs5+SowOaBcE+d8/5jPxLp08ETkRhmQ7aRqBnMfobElkOPpHUE3vyYwWq5FBgfpakRQ==
X-Received: by 2002:a05:6000:2dc6:b0:425:86f0:6817 with SMTP id
 ffacd0b85a97d-4299075b4a0mr2530630f8f.57.1761332750813; 
 Fri, 24 Oct 2025 12:05:50 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429897f57cesm11088658f8f.17.2025.10.24.12.05.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Oct 2025 12:05:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH 01/27] hw/qdev: Have qdev_get_gpio_out_connector() take const
 DeviceState arg
Date: Fri, 24 Oct 2025 21:03:48 +0200
Message-ID: <20251024190416.8803-2-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024190416.8803-1-philmd@linaro.org>
References: <20251024190416.8803-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

This getter doesn't update any DeviceState internal fields,
make it const.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/qdev-core.h | 3 ++-
 hw/core/gpio.c         | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index a7bfb10dc70..2caa0cbd26f 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -725,7 +725,8 @@ void qdev_connect_gpio_out_named(DeviceState *dev, const char *name, int n,
  *
  * Return: qemu_irq associated with GPIO or NULL if un-wired.
  */
-qemu_irq qdev_get_gpio_out_connector(DeviceState *dev, const char *name, int n);
+qemu_irq qdev_get_gpio_out_connector(const DeviceState *dev,
+                                     const char *name, int n);
 
 /**
  * qdev_intercept_gpio_out: Intercept an existing GPIO connection
diff --git a/hw/core/gpio.c b/hw/core/gpio.c
index 6e32a8eec61..c7c2936fc55 100644
--- a/hw/core/gpio.c
+++ b/hw/core/gpio.c
@@ -129,7 +129,8 @@ void qdev_connect_gpio_out_named(DeviceState *dev, const char *name, int n,
     g_free(propname);
 }
 
-qemu_irq qdev_get_gpio_out_connector(DeviceState *dev, const char *name, int n)
+qemu_irq qdev_get_gpio_out_connector(const DeviceState *dev,
+                                     const char *name, int n)
 {
     g_autofree char *propname = g_strdup_printf("%s[%d]",
                                      name ? name : "unnamed-gpio-out", n);
-- 
2.51.0


