Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2173758ejb;
        Wed, 21 Feb 2024 13:18:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVGVaIeJmh0Q0CdZm3Jw6GhwgmIc+1f9uud2QH3JJkDL+H8Qw7qbIBn/XdkktGQgMp1d/H4g/S2OaLxDkfYYPv6+6SSNzrI
X-Google-Smtp-Source: AGHT+IGeuNvDSAHKyrgkYWTI23vVqDFQqttvztu/MoewC7tNwgzo5f7FMdgwBNg/JZrqB6hNsxOa
X-Received: by 2002:a0c:971a:0:b0:68f:4d2d:3f34 with SMTP id k26-20020a0c971a000000b0068f4d2d3f34mr14049681qvd.39.1708550338989;
        Wed, 21 Feb 2024 13:18:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708550338; cv=none;
        d=google.com; s=arc-20160816;
        b=SCzftAAiPRVwq7QgcsOIMQXdd8LTM4XEZDcUtLxMgLRaGgYjwP+r+D6t58U9GMWf+x
         bRAcay/WDxBYbGyNMqWzItaVIF+CYcAh+fxsp3VmdL3Y1sCUiV3Q9LUP8a2s3CP7UkUb
         Pgebu09pHFP46z6Ica90QHjBIq/y+aGquuUWh6bfmHEuZ2mMC6d4BGfSAjJljYa1YZ08
         aEI4bBd9y5jGhatenJuqgHhAH6SZOWz+Dc06SlnWY4/lMjnthEYVNTDOuyQhfXYZdPqO
         vXuSbXuiuyN0JIA+L5AVxbvXTnWE8qvQ/TA3qCAck4y4oolOEf+C9orl6MSrAOHsOqHP
         hxxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=a97LH+/zHlwhK38ayT8uR+FI5InpUgImRxlOHohl8Qc=;
        fh=TBkf8G+Ez4Eaw6VUUzH52/Tgi6ZRMzC+7d8Wa9UKRjk=;
        b=09lesvFZQJPT9sAR0FrpPbSi3ej662M15E09DYzBk0xuOj8EyX9XBE2j+aRVGobCLw
         /z8aJdPfrdxsOWylxJOxEniUruWeCBWkyj12rFDMUYJDcBvTvSDX525lT9V8CGGhbu46
         A+pcME7s/DKopjNFd8LX1TeomM4NxMoWk3DuQGet2XH7b8gcKkzEGiyP967sOshTOaz6
         apOmEyN+J5iW8pr3JA3tPjEi3Aola3GjyHOJe4/h4QkGbtyuOngnNbkEDbLrC5Fu7CiV
         6BZhRJVeh35stZuAtvVciOcUCboXNA1kKzk6lkq+977ZJ6+yHd4/AFm3xIOeZCi/z6pj
         HnpQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pg5yT5Cy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id if6-20020a0562141c4600b0068cd948194bsi11418548qvb.36.2024.02.21.13.18.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 13:18:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pg5yT5Cy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rctzI-0000YH-6Z; Wed, 21 Feb 2024 16:18:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rctzC-0008W9-Lp
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 16:18:40 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rctz8-0001B4-0P
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 16:18:38 -0500
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d244b28b95so33504741fa.0
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 13:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708550312; x=1709155112; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a97LH+/zHlwhK38ayT8uR+FI5InpUgImRxlOHohl8Qc=;
 b=Pg5yT5Cye0H1JIo91afFQqfD3as4YMI0YbA+r3u1A178bjxhJewLqvI+4uoZrwyyKa
 sWs1qGpiu1YGPj/yr/+XmSk+togHsVAxYoW2/8r4clI4Ch/TBn9a3c2942hav7aGm5dK
 3bfPfwBTBcyQDt5iB5T7Cf/eymJ5J2dqdlZ6GzUKjyzJPN5igA95Ns8EDRim4MzB3d3b
 2d0vQuVaWVYBmSbkdHs14n15Gmc0xN27aTZwvrtcJBgQq36gFNjf7AiYN5dG0BkDD9SI
 4kXerLNUBzh3McRSmcdviGPLFWu18BS/CsKNqT5vEDWpOqUm0Nvuca6+hM5eknpaNxmf
 ogFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708550312; x=1709155112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a97LH+/zHlwhK38ayT8uR+FI5InpUgImRxlOHohl8Qc=;
 b=IjuKudHeqvn2Mzh+Ee8Z2NXFMVqnzoxa82nfFvbY8CEQXDFAoguvX5TNGNN5eIxidw
 ISE/Gw6yyG1FsKZP/dpFamC4YO4ChWu3qZZ+5I183HloNB0LkO0ffZ9HL4KaaYcakUCb
 +nsQKlAEDMknXPjcCLiwj8X3NRgoNXf1nkyctBYELHnFPsUbN8AgxGgQYvQ04Tsi5C4g
 maE945wROAMKXodCjclyGoXpdpjuHrj0CNI5Au7OIyFkSjSKH9UEA/YNGVZ0X451MMoJ
 LwgMH6MX22m+YACvEJSZWtI0zV/fHw/FAvFJ1oCZz0W0gVAXJt9ooBA6NOIDfFZCsere
 kz9Q==
X-Gm-Message-State: AOJu0YyObogT1XIzYVHMgwtJPyoleauCtHrfuZhD5Y3yOT2eZH8O6IKw
 uBJfAAlEt9bB3MxbCyNuPfrGU6GlXyRj/3k5tLHlmEruakLuaaL2UxASXDp3gWs=
X-Received: by 2002:a05:651c:206:b0:2d2:4def:a7bd with SMTP id
 y6-20020a05651c020600b002d24defa7bdmr3459148ljn.24.1708550312324; 
 Wed, 21 Feb 2024 13:18:32 -0800 (PST)
Received: from m1x-phil.lan ([176.187.211.34])
 by smtp.gmail.com with ESMTPSA id
 bw2-20020a0560001f8200b003392206c808sm12383532wrb.105.2024.02.21.13.18.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 21 Feb 2024 13:18:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 16/25] hw/i386/pc_q35: Populate interrupt handlers before
 realizing LPC PCI function
Date: Wed, 21 Feb 2024 22:16:16 +0100
Message-ID: <20240221211626.48190-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240221211626.48190-1-philmd@linaro.org>
References: <20240221211626.48190-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x234.google.com
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
X-TUID: M4hMeYOaowGT

From: Bernhard Beschow <shentey@gmail.com>

The interrupt handlers need to be populated before the device is realized since
internal devices such as the RTC are wired during realize(). If the interrupt
handlers aren't populated, devices such as the RTC will be wired with a NULL
interrupt handler, i.e. MC146818RtcState::irq is NULL.

Fixes: fc11ca08bc29 "hw/i386/q35: Realize LPC PCI function before accessing it"

Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-ID: <20240217104644.19755-1-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc_q35.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index ab7750c346..53fb3db26d 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -228,10 +228,10 @@ static void pc_q35_init(MachineState *machine)
     lpc_dev = DEVICE(lpc);
     qdev_prop_set_bit(lpc_dev, "smm-enabled",
                       x86_machine_is_smm_enabled(x86ms));
-    pci_realize_and_unref(lpc, host_bus, &error_fatal);
     for (i = 0; i < IOAPIC_NUM_PINS; i++) {
         qdev_connect_gpio_out_named(lpc_dev, ICH9_GPIO_GSI, i, x86ms->gsi[i]);
     }
+    pci_realize_and_unref(lpc, host_bus, &error_fatal);
 
     rtc_state = ISA_DEVICE(object_resolve_path_component(OBJECT(lpc), "rtc"));
 
-- 
2.41.0

