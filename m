Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp738105ejb;
        Thu, 15 Feb 2024 10:02:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXJzsAqp+Na5QTqTfiQeNu9DB/e9s0nARXZ1bWXZgDw8pzh4c96uF5PdvwVJamqgPMhdPpHtYtFCS7qvvSEYg2MvOpJfEnU
X-Google-Smtp-Source: AGHT+IGpHQfJfVAJIvoso3s8uhwhnx++joYJmmfmZw7q/LEHsinyHaRtjX54MeFYZD0+VJMpAvBU
X-Received: by 2002:a05:6102:909:b0:46e:c79c:83f0 with SMTP id x9-20020a056102090900b0046ec79c83f0mr2750170vsh.21.1708020171786;
        Thu, 15 Feb 2024 10:02:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708020171; cv=none;
        d=google.com; s=arc-20160816;
        b=XyNHHosKDEoyEhtLZsk6wlnTpojpVKhFNqmNBm9JC0DIcO+B8g1gmgsCDxY93W3S4O
         QV2DiL2nKSosuCJd6wQPWvyou6M+plSBt8Lpqh2EV+Nq7Crkf6gu7s9gr01cIszsUcJK
         ypMp8bO4BAtUskgqxF30qbFuCQgIAxRyYVQkqGVdqPOmVjgWn4b7JN6drhhdLJf1QubC
         8eToMwPvqKjqAem1MuD1HKhXfTi7V1TIuZYxsWyHAIHEE++txYDuddAqKNX+48q/LKv9
         5tbKNi+wroYWUSCPZ5DQVEBrkA8kTC/A411fdmFH7ZMrgaF2A8eZziitaZtXm/QK3gXX
         8KKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wCixPc5ejXKwZhVB9bkkxqa2YbnJN4g2k4IE6KKAtos=;
        fh=TVdLGdYMaN9IdU+L/CP+BxRUYWKayB1HwTF4/ZdzNhM=;
        b=V7EDGUbP2PwDVmVSoFSvfTTjRamXb3YYbDY5HuzJGG2eaV+P59+1WJ5yltGlJnBvq+
         xWgGVeVTnFkVNYWZv2eGdV85vQvb+VhcIjP8aCXqLmQGeDkmmgF7bo651fkY029U/P97
         U/P7tYayBt5kgEIuBCwhXRM8TtpXgeYCiS1/Rz+mS2ipw8V69s1TDHIVO9CQMgK/dv/+
         X6dCBVbN/6Q+GOFhsynTsOWjii7SZxmQHDmGK3hDZ28zjRvna69qiiUKEZiT8yias3zP
         M3+mtsPvigPDyAppUNj+1+s4tqHss3Q6CqCWIzUtGoGcCbyjkZyXE+L0B0hxrSG17H5b
         LORw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lLWAjgXK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m21-20020a67ed55000000b0046eddc079d4si334156vsp.581.2024.02.15.10.02.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 10:02:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lLWAjgXK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rag2w-0002Qz-GW; Thu, 15 Feb 2024 13:01:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag2d-0001qK-Hj
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:01:03 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag2a-0002NL-Ks
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:00:58 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-563c2b2bddbso805151a12.1
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 10:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708020055; x=1708624855; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wCixPc5ejXKwZhVB9bkkxqa2YbnJN4g2k4IE6KKAtos=;
 b=lLWAjgXK22LykSCnqz+Y+qSbXQTrmuACIeHqtsiTCmPPjbeufEaNFzBokhVhkXRUnO
 Y34zX95dSc46+VZpEOAi7xQAlEFT71KdXTu7ydNsrIxwOwUBAnYR9Z88T5CCrkL013xa
 09yZgPNfWV1hEwRLjVXTi/PIygdcfUYWi5U6K7OOxLHwD6gc5jgVGZA8SCA2Q9BSG0bc
 /dxA0aQ5+j2V7gl1STx5den4B340pmfoxM4K4s0s/KONWeWL+R0NYrJFceZaIAMnKwMw
 s/5M7Tev8dKnz8bYSMWTIOE/BRcfW/edOjosQ9WQofkB2QI6/jj7qR3UrThJCphUEHSX
 evIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708020055; x=1708624855;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wCixPc5ejXKwZhVB9bkkxqa2YbnJN4g2k4IE6KKAtos=;
 b=XIFIwdqejorS25u1aVQuKk9a2XfTK9ZwtL4UejzyJPsKwC8/pHuGMcxi/23CIvDXZa
 8FcHx7Iq1rQnkKZ5Z4oWSFR7bbQcU+cUney/aPG/+XEfrEepZFB7GHDTwsb3IaDSAxk0
 0CNBXoG/7oxX1ikRmqyT0FgIGl/DBB8CafOs+uXKzGddk3uygQrymPIUG5n5K1Es10V3
 fqQ2TrVcwrBQZ8YCzNQ4Cgm0+39SsrGtWDckcJX6lkXpD2ipKMxYfE3UuHUM+vbK88ty
 zRs5j93fNwC4EIFrQlWjKwmg4v84Xj23O8/hYicBzAABO7QnOJXDK/xMZzyXmEW7fk+u
 v4rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOvoiSNPoiTzNZk9IvJix8siqgBx4ZgUOvlnrHqshMK/7fITz9mzSzQSV03u+MOmnlpT0V4J4zxp3p9Qoq62fottS5
X-Gm-Message-State: AOJu0Yx7lnxq0Tu36bFocURg4wu7f4Qf3hvXD+7sEQa34z4/RlQ6iCfF
 1bhjsZiVPPdjBlD25wTISQwFgAaD3rSvWVqw76nUmKlNYHFBvSR0J52z90pl4Po=
X-Received: by 2002:aa7:cfc7:0:b0:561:51a0:2e07 with SMTP id
 r7-20020aa7cfc7000000b0056151a02e07mr1803461edy.26.1708020055331; 
 Thu, 15 Feb 2024 10:00:55 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 g6-20020aa7c586000000b005619eea3d52sm754712edq.8.2024.02.15.10.00.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 10:00:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PULL 27/56] hw/sparc/sun4m: Realize DMA controller before accessing
 it
Date: Thu, 15 Feb 2024 18:57:21 +0100
Message-ID: <20240215175752.82828-28-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x535.google.com
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
X-TUID: SkqxC+76bf5s

We should not wire IRQs on unrealized device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240213130341.1793-9-philmd@linaro.org>
---
 hw/sparc/sun4m.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index e782c8ec7a..d52e6a7213 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -312,13 +312,11 @@ static void *sparc32_dma_init(hwaddr dma_base,
     dma = qdev_new(TYPE_SPARC32_DMA);
     espdma = SPARC32_ESPDMA_DEVICE(object_resolve_path_component(
                                    OBJECT(dma), "espdma"));
-    sysbus_connect_irq(SYS_BUS_DEVICE(espdma), 0, espdma_irq);
 
     esp = SYSBUS_ESP(object_resolve_path_component(OBJECT(espdma), "esp"));
 
     ledma = SPARC32_LEDMA_DEVICE(object_resolve_path_component(
                                  OBJECT(dma), "ledma"));
-    sysbus_connect_irq(SYS_BUS_DEVICE(ledma), 0, ledma_irq);
 
     lance = SYSBUS_PCNET(object_resolve_path_component(
                          OBJECT(ledma), "lance"));
@@ -332,6 +330,11 @@ static void *sparc32_dma_init(hwaddr dma_base,
     }
 
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dma), &error_fatal);
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(espdma), 0, espdma_irq);
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(ledma), 0, ledma_irq);
+
     sysbus_mmio_map(SYS_BUS_DEVICE(dma), 0, dma_base);
 
     sysbus_mmio_map(SYS_BUS_DEVICE(esp), 0, esp_base);
-- 
2.41.0

