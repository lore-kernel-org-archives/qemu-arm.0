Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp686278njb;
        Tue, 13 May 2025 10:44:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXS0a9+vhIpJr0wF8thh79ibSPQcXyyDrd6cpuLlR4+FwHpYaP1ZxJMTAOP4HaDnnKw6pfqqtode2kPnA==@linaro.org
X-Google-Smtp-Source: AGHT+IHlX1EAsMU6zfySGIrnSuXbP1Doh0SWR2GxBxjQBvFTLJzV87UgGTR2GMzZXvpV2X3dGTbN
X-Received: by 2002:a05:622a:59ce:b0:476:5fd5:4de7 with SMTP id d75a77b69052e-49495d18528mr6134461cf.41.1747158257914;
        Tue, 13 May 2025 10:44:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747158257; cv=none;
        d=google.com; s=arc-20240605;
        b=FH3qTC2LaaMAaZ26ujdoz+wy3n9LEqDp4tkc58fRv5xlgKcN7e47ed3ee9NV9wZldd
         vTHBOxMmmintnEERos8SN9OIoLt5c1dkqXWk7fWuUaFpQqyCRiOMeXI1jMMu8k4PgGkg
         nOjWDH8w4USYLftURmslNO+pzgjWZ19WJmEyIZnDrxau1fqrHn/IG7yEm9HZ2orSSbCw
         egIMCB2MAgpJAfLOIr7EeDW1oWyyWR/q6j2ayRUK3pB9oXymlb0Cegr0DVSSwpJfHq3j
         +8pdALT+ETN8A8DG5iOk7R6MkI4ZwG8PjRtKQ+JH3Ofr93wQzpT0D9e46/Y+7yJM1CcL
         DX/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=P790GYrQJv0XpWOMoTqY2JnOtiqfx1x49LfX4aa1ATQ=;
        fh=TjynR8bVWcUM2XsqwxY+mYTmagLwsb45uPwx7NKBbS8=;
        b=GOsge6vDjlpH1nSFUfJjvxyo0Qv330M/PB81hmxBpoBP0f8gl16tUB5a2idSa/StJa
         3ELVruVoKQMlpnu6yP07iWRCsf2HwLN2GR0cDohFdEaO49O/jwFtjfIxYwgQoFqPRVRZ
         NWo4s8XH3J7N3vawnF1RlTYNmLy+BNCRgGh6x/LRiDp9IVR6EP8NwX3thzV6pHGj9/Ps
         VCQ9puc4CRPU2yy/lJ2jN46aG3khU+MTVPykwrH8xqrb8wKK0SJX/FBG1ZoZS0c+Lfcf
         qqpM55+rCckhU0l1ouYzSXDR6st+ulI3kzc3gbNZLZvJG2u9NwxEk05+tlVoS6YbENV7
         ZrGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qB1mZ8Vf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-494866029e7si26365881cf.55.2025.05.13.10.44.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 10:44:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qB1mZ8Vf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEtfl-0003Hf-Uw; Tue, 13 May 2025 13:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtbP-000849-TP
 for qemu-arm@nongnu.org; Tue, 13 May 2025 13:39:42 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtbM-00037C-Sk
 for qemu-arm@nongnu.org; Tue, 13 May 2025 13:39:38 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-441d1ed82dbso62733235e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 May 2025 10:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747157975; x=1747762775; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P790GYrQJv0XpWOMoTqY2JnOtiqfx1x49LfX4aa1ATQ=;
 b=qB1mZ8Vff66cIOudrdueggv4Cld9RwQ+w0Srpfd1F4rn9UdTMpzexomU7Rh6hL5Agy
 kDPTLEx43rtfP0l8w5HS5gHhHKgMJISeNuFObjhR6B1Txw2iruugBcXUkXpyAih0wEeM
 tZvnTz9BGbhkFLozlTxZ9bFSNUyfbJeS/1hflHY86XqeEJ08134f6bjIJbM2N9yKXd0P
 +jAyn0Fbvq9uw/YbUHLn+rT+mBrrVKvqb8MI3wv448cPcqc7DWdFcwfZkFrds9NYw8/m
 8aHZpRBQ7m17za/W0ZXecxR2v/ihO0IVFNCAWjJqch2Vt6tm3DKjh1yCxP2HFBfh1GhY
 9miA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747157975; x=1747762775;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P790GYrQJv0XpWOMoTqY2JnOtiqfx1x49LfX4aa1ATQ=;
 b=NMkkZNeXesouend8V8YjddAiPThqWI6YzJfuYMVhwjla9AIIYLuyQJpySOWTI/E1iR
 Z/82C5warFgSGT1zaz+kt1mZXjNYjzy5zV/txK6GoYuNKNOvhR23Xyduw5kJFkGCKP4q
 2Uh7anvwQtREsKtywbHXgZc0Np89Aj/3UP/wxjIjUFRkVIBDPH9Tn0vrTzzNZuKEzgHs
 +Wca37KVjE9uarF755fUiRIskV5N2NXvWUWM5mVGzkTPWj0BTeSxweZxxdaPVaGMnI6B
 4u10RUt1+Xa3dfNcEBB8qQcL3URrFz7p5EBo/uoleIaGu/0yIOGbr3QKWIop05FoRgYu
 TBzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW453XcvQH7GGcwzj/2Wm42CAvHHJnhfy85oYPKo7uUfqYy3EBru1lR/QOS7k/kPxwnMInFksVsYg==@nongnu.org
X-Gm-Message-State: AOJu0YxVbPWe80PNBrqB97T7jasKjAyDj7VZC/1JpUHPvaNET15LuBQH
 bSy/uaZ8EgqFXGhFPIKbXaG1IYVzsLwmghXrixHHoe+jGtweQ0LbKuuFT4C09hc=
X-Gm-Gg: ASbGnctH/0gotoxiY8ufHOUM2y+ObyA4m//u77Zl2RHLUZywYOkXzDzoXdPVaRDkS4C
 cO08Qsltcuq4PLxHzgrSbZQD2dyqHT/qOGldPJIcsVWa1Y8eidy9zIJk+pv/ZPjqjWcXG+r+bgy
 eSDK4ySaW/mxmPRgDuEPWGobKBb6b8bgDjjiY5JvMGQjNz4W8TrFAMZJNinUktzMcOVf1LLAr7h
 lJ6bvh8qSo3CVEOO3Is3q2+weQkVfTnrkVgGJHTd2Y5+op8FYDhp11SXTveaGPa286EJGfMgnoT
 RGVOSXdFpiOCa6tvKv5ZpPw6bcLKw3q4yTejbD/INskpMdikG3tFA/55fqkZDnF5ITyjUDBbrvn
 /8+oeLCFm/bCyuQZCEoyAV+mQ0xVm
X-Received: by 2002:a05:600c:1c19:b0:43d:412e:8a81 with SMTP id
 5b1f17b1804b1-442f217986dmr1181665e9.28.1747157975324; 
 Tue, 13 May 2025 10:39:35 -0700 (PDT)
Received: from localhost.localdomain (110.8.30.213.rev.vodafone.pt.
 [213.30.8.110]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442d687adc0sm173416585e9.35.2025.05.13.10.39.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 May 2025 10:39:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 01/19] target/arm/tcg-stubs: compile file once (system)
Date: Tue, 13 May 2025 18:39:10 +0100
Message-ID: <20250513173928.77376-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250513173928.77376-1-philmd@linaro.org>
References: <20250513173928.77376-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: IgDCohRBsw6X

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index b404fa54863..e568dfb706a 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -48,7 +48,7 @@ subdir('hvf')
 if 'CONFIG_TCG' in config_all_accel
    subdir('tcg')
 else
-    arm_ss.add(files('tcg-stubs.c'))
+    arm_common_system_ss.add(files('tcg-stubs.c'))
 endif
 
 target_arch += {'arm': arm_ss}
-- 
2.47.1

