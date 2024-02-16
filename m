Received: by 2002:a05:7022:fd0c:b0:75:a5e6:4add with SMTP id up12csp192118dlb;
        Fri, 16 Feb 2024 03:03:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV/6kDK/krk6wLqahWCNn4X6H0s0MkVJBdH8s6TZkLWH92M0z2WiD8/g4xC3yxyUN0u+3vY9gjo2Bhn9DQuVtKo04T2Ly+u
X-Google-Smtp-Source: AGHT+IGqDK/ZXM2QG0mvspOq37N1G4EH6r1qdyO9Zg40fjRqirxiu9N2skPnn2WMbm3mI+0Fl1Xs
X-Received: by 2002:a0c:e3cb:0:b0:68c:e521:4af6 with SMTP id e11-20020a0ce3cb000000b0068ce5214af6mr4480692qvl.40.1708081418899;
        Fri, 16 Feb 2024 03:03:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708081418; cv=none;
        d=google.com; s=arc-20160816;
        b=yBSnLh4VbN/bf4ZH3HRszOklrENRyPOmnKEvSHZt6sOMJMLGu04kVu+ybsUum0VjR2
         UWdNLyd2jjDQwbzIhJ8sMrqTUDwPF7YMzvOigJLVE4GdCi89zSToPz4HCGmijwNSkAeA
         KoaRnQ43vb+qnUXmfvm4H23tEOrajmWhSbOoeQ4/wd/Tr7thDemnyAQ9CuRqTlYRjd6a
         o2QDt7r4euL1LIFeapwJRNEf5FW8ZYr7vLgmZBhRu5arAxmJ0B/dd99bMGOdhdocBBnX
         vtaELNshxbCncc0LJPUsNMnQ7JDt56xEPlCO7u2/flp9hdVp0Eg2rWmRlHlXfoZ5o+1h
         0y+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eo0SdoR6qSJ49xsDZEZ0yqz4VDVUEvJcVdzt8nM06Fc=;
        fh=lo699SrpvFYJnxFLZ6omanT1M6xx54FOFadsij93CRk=;
        b=CcALsPbt/8gYYzNbU3+hk7cDbLlKONcOBOFPqwDNVUNiws7GLzMwnWbH/6IhbWz3sC
         MwM79IUp9pisulwgO2Exwf8nEvbb8wiz+H3DwSxVXeVNHQxhhTbFFa8mpjqIAwAeu/F1
         nk7oxBIN2ZsUjp+wGOFHYL4+2nNZosD3jKfjW/qdA7UxPcACPAtlt/0bEMFMQW/0sMMU
         Xf7s2rTPsrEpiB9lWKjaPlY/Kg9jmsTJ5lPONbF5eAKtf/GgyNaRIBVveW+a7pUvL0kg
         PqIogos8+a4rXAt7MTn9EIdPrtMQhUX10BWVJZX7yHAQWUsYysJFtCkJiAl5k8d7OqBe
         Q7QA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oVkk7Hq5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eo11-20020ad4594b000000b0068f03fc5375si3437670qvb.464.2024.02.16.03.03.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Feb 2024 03:03:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oVkk7Hq5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1raw08-0006B0-KG; Fri, 16 Feb 2024 06:03:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1raw06-00069c-Ew
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 06:03:26 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1raw04-0000nE-L3
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 06:03:26 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-411e71d8a2bso13310945e9.1
 for <qemu-arm@nongnu.org>; Fri, 16 Feb 2024 03:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708081403; x=1708686203; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eo0SdoR6qSJ49xsDZEZ0yqz4VDVUEvJcVdzt8nM06Fc=;
 b=oVkk7Hq5kNVZHb9M5Sg0jrWnn6XpqE+Lcq+BnZM/XsAACDTAdO50z4VhjTxf431+NJ
 BSlLLLGOFhgGI08RjkYjIyTgr2QIvBz5EJ12W+5IAURw6Z6rzzh5Ws80m5DeKOoyJkgN
 hj3q5Gm7DWJoPn6xzBtA+8uWzxru6SWCH70aDHhrb2fSxjilV7WojaU14UA2CEUAw+6d
 mGJvwEOxM0BFij11r3GXNiQxwuKMk4Urh4R0EFUrqvjyX39J3PTwuImTWAJO1Jv1j40c
 kie1w2Mtb7nMqeVGTEF9++GWYM2EWc9gwftaLDsJCvy/gFGshNjxzQ1yCL8aT5gqx0Iv
 UlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708081403; x=1708686203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eo0SdoR6qSJ49xsDZEZ0yqz4VDVUEvJcVdzt8nM06Fc=;
 b=lkuytNDJGA5Oh2fcp9AJW6CfldK58msPwGZSkZATIKRe8VVkDDqBP3n1QJJsGsNFQ7
 MN8ofEDat74+yPM8t7nT84kdNuf1Q/72Sr+1lSwvGDkZ/hXGu1MxZu6aCjd4s2R1YzlS
 BHMPegaZ/4hkzKKKfGOkZ3HfPt7nzqHrRb+fGzCRb3WjGobAKiJGgZcxEfQfzrSkjrak
 fb0CK/FyLCennnT14Oxh7wCU9XXtVVdIG5htKLw0C8HbyzE+Xe9qQRgqwXuh+LF48nHs
 tEfA3DIiEAz6CbHbzJhZrnKG0w4nC5oZ3/mUxlWKMtq3dTcKykCW56r/JeQqIasz9DBl
 9sCw==
X-Gm-Message-State: AOJu0YwN2Kx9+ugqWEAJ+FwjiP1AoPcXhgQsdZTfNvcRa6FFonS3rMHa
 BpupZBKkKthduxrW4XoYLUWsKZBB2Sh6qp/cIddFvBeI6WV6b6GPx+0+ttpp7m0=
X-Received: by 2002:a05:600c:1e09:b0:412:457f:7094 with SMTP id
 ay9-20020a05600c1e0900b00412457f7094mr977358wmb.29.1708081403143; 
 Fri, 16 Feb 2024 03:03:23 -0800 (PST)
Received: from m1x-phil.lan ([176.187.210.246])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a05600c11c700b00411c3c2fc55sm1934681wmi.45.2024.02.16.03.03.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Feb 2024 03:03:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH 01/21] hw/i386/pc: Do not use C99 mixed-declarations style
Date: Fri, 16 Feb 2024 12:02:52 +0100
Message-ID: <20240216110313.17039-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216110313.17039-1-philmd@linaro.org>
References: <20240216110313.17039-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: fRgLc6CAFPit

QEMU's coding style generally forbids C99 mixed declarations.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 196827531a..3c00a87317 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1227,6 +1227,7 @@ void pc_basic_device_init(struct PCMachineState *pcms,
      */
     if (pcms->hpet_enabled) {
         qemu_irq rtc_irq;
+        uint8_t compat;
 
         hpet = qdev_try_new(TYPE_HPET);
         if (!hpet) {
@@ -1238,8 +1239,7 @@ void pc_basic_device_init(struct PCMachineState *pcms,
          * use IRQ16~23, IRQ8 and IRQ2.  If the user has already set
          * the property, use whatever mask they specified.
          */
-        uint8_t compat = object_property_get_uint(OBJECT(hpet),
-                HPET_INTCAP, NULL);
+        compat = object_property_get_uint(OBJECT(hpet), HPET_INTCAP, NULL);
         if (!compat) {
             qdev_prop_set_uint32(hpet, HPET_INTCAP, hpet_irqs);
         }
-- 
2.41.0

