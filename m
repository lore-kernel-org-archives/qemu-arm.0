Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1271912njf;
        Fri, 16 Aug 2024 09:14:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVjdY24FjmMPh/wp/mFzpSmruiLQdNX9EGnO046Hulii3fPH5IFjvt9HUr9hBUwtRdVs4AxAJuuILdkGSixzL0nB7xAA3aS
X-Google-Smtp-Source: AGHT+IGlXHTzwsBrupGQ2D+Fjfh5YQOm4o6nAxHtDD5cVqNTyjMR9R1Z6UReT1EePZFQjP7P3p3e
X-Received: by 2002:ac8:6f0b:0:b0:446:5c35:d9d6 with SMTP id d75a77b69052e-4537427e701mr43988211cf.23.1723824860067;
        Fri, 16 Aug 2024 09:14:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723824860; cv=none;
        d=google.com; s=arc-20160816;
        b=kI17jU27kv4SZVLTnlpHr2TsXzGlOXWecvHbWb43PgOi/qYnw4AIjq3c4XKL4CZ+Gm
         WDHEOkXSZGi+UxHRK2n3HF4TLTDh4Qne5c4Us9HvtyN4U4itRu4GCPtUZBAY6w3SDX9m
         vHi08Pi/ivJLCQWYdbkLAg4TVrMuBKHlB/O+ZfFFyxyTJKUeGVZ2JYZsip8daxWiNf4/
         ZLOQa7LVlHLLCpCItXCQBLdDU//GI77xO0frtCYTpDYbl9OwAsb9JnZGlXnCJbXVch8Y
         TS8REOR5lrcfIMUZwKcKegouX+r2crfOGZFpckWCbKOJTaWyBQJNJvYWlblpcvIJ3JVH
         GoAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GjWmXs7UD5GkRyRxaGCKBrnzIsbM5XteQpuL4ObGWgY=;
        fh=8716YcvxZZxTMNcQZ0eLGoLGp1r7TadekkZAFKW2f4M=;
        b=mdstsMPePIAhIcFD5XalTAlLCr8EANwEC1K/y9Y0ROg6zM2Ro8fuVqGfD150zhP1aM
         C+jcR7THiubejkGVNr2B2nELeKoZ2kdcvba3T4OxwmQAr6+e+4ghGBneXqsBIcbz3dxy
         IS6ldGsVxj21WpLfSzJfKLmr1ocxrEeOjKy+qNl6I1nmUT9eHWSOwDp7t+a+/EZ+XLG8
         +wtnZBTeghRW/2gyKb6gijNepk1OYJ5jJnQJH7rePfEVNK3jU1V6PvAZmVssgMeDUuau
         FlW4uC8j/SXC4O14YTLE8aK9XXte0gdXMJH38+/i/MpWNEgPKCEusqMKKAA5zjwo6QFD
         XMvA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S6jsYj8g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45369fe702asi45033111cf.15.2024.08.16.09.14.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2024 09:14:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S6jsYj8g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sezaS-0008OL-Bq; Fri, 16 Aug 2024 12:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sezaQ-0008E1-1S
 for qemu-arm@nongnu.org; Fri, 16 Aug 2024 12:13:58 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sezaN-0007e0-Hq
 for qemu-arm@nongnu.org; Fri, 16 Aug 2024 12:13:57 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-37172a83a4bso1060319f8f.0
 for <qemu-arm@nongnu.org>; Fri, 16 Aug 2024 09:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723824834; x=1724429634; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GjWmXs7UD5GkRyRxaGCKBrnzIsbM5XteQpuL4ObGWgY=;
 b=S6jsYj8gPgHJAzOPftR/QOtNunJIGW49g6/2mc6qL2U5WK7oE8LwW+upqiLDayKvIP
 uH+bw9R2kKjNNcWwQdR9JH8XK+Znrd1mkczN8WQ/1FovdawKfohdP4yZPEEcm2cYBv15
 0L7apPjT+GORivv6rtacSWNAECFcOW/jot6AW2I0pT8aUcPIHdvkBD8cUD3JiAlgandP
 Q9lGbt/d7x3+h7ffXPe1Vp4ZsMGL0ewRu/A4IZR0EVz8JqsEV3YV4n/OkvVL5pocssYF
 CqTOjkuatFs1i7YwFJAoEn2GKP3SW/uAI9New8eWRnEBPVSYBAvQ/aas7QbEXcWDJm2/
 vMrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723824834; x=1724429634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GjWmXs7UD5GkRyRxaGCKBrnzIsbM5XteQpuL4ObGWgY=;
 b=OMGQImM7wyEppWiBmE/uHa+jGIbxKUMsOEGdYYGjchpN73nuyojZ9vG6ua6UvhVDYw
 UEGtE2Tm4LYHIY0t1XvYjQyGxqvApQY5zMivyOKLAPYuuEXChlHM0BQiqMJadbeSrAuf
 +0c+zpmSQUafFzXGLVxCU6vUnQYTfP6bdp0zZ0SKERGu83ckH0LExaYTSZ9KhGacpTEn
 564uWwbgrSXnu1hnCU97CB4ExSpFuzBjKlbBfyozO+SH9RIJVtSZyrCiV2H7gnPfvoUs
 1jWgjIbf2IkovrS5otisnayQwM2SPyat9h7XwRGm3O9SS3l+mLxqnt4kJf4horlt3RMj
 ncIw==
X-Gm-Message-State: AOJu0YxGObMV/ZaaU4LRdIFkrnsx3GvZEnd5q/zWTmVJzJQszB0eZwEj
 syP7i3IzqrUYB9Ljc3t3KXF16ZGnBx7ALaRQjEdtYBiXErRyFIhczNtuWjw2zC2x9ig2N6/txAM
 S
X-Received: by 2002:a05:6000:141:b0:371:8845:b850 with SMTP id
 ffacd0b85a97d-371946c2b36mr2406984f8f.54.1723824833988; 
 Fri, 16 Aug 2024 09:13:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-371898bb588sm3912269f8f.115.2024.08.16.09.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 09:13:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>
Subject: [PATCH 4/4] hw/arm/sbsa-ref: Use two-stage SMMU
Date: Fri, 16 Aug 2024 17:13:50 +0100
Message-Id: <20240816161350.3706332-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240816161350.3706332-1-peter.maydell@linaro.org>
References: <20240816161350.3706332-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
X-TUID: x0nuimqbm72w

Now that our SMMU model supports enabling both stages of translation
at once, we can enable this in the sbsa-ref board.  Existing guest
code that only programs stage 1 and doesn't care about stage 2 should
continue to run with the same behaviour, but guests that do want to
do nested SMMU configurations can now do so.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/sbsa-ref.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index ae37a923015..396abe9c1bd 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -621,6 +621,7 @@ static void create_smmu(const SBSAMachineState *sms, PCIBus *bus)
 
     dev = qdev_new(TYPE_ARM_SMMUV3);
 
+    object_property_set_str(OBJECT(dev), "stage", "nested", &error_abort);
     object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
                              &error_abort);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-- 
2.34.1

