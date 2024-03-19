Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1383373ejb;
        Tue, 19 Mar 2024 08:45:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXIvKz7Zdyc4s2VcOvyeK0IasSveDQ4BTxRaq4zqeJp/5atOz/+lpKS+sTYZHcKJCJShyJub6fgQGPNlMoVQhyyRW7CS+Rl
X-Google-Smtp-Source: AGHT+IEHwAN3Jg5HU0oi26KEJVwMy0f0sOQXTHvKuhx9unpPBNfk9sn3VoVYReL9F9B9w7jwEoWo
X-Received: by 2002:ac8:7447:0:b0:430:b674:8ebd with SMTP id h7-20020ac87447000000b00430b6748ebdmr4625615qtr.16.1710863154636;
        Tue, 19 Mar 2024 08:45:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710863154; cv=none;
        d=google.com; s=arc-20160816;
        b=DpVbh1cC8a8Avf//WZgTHqaDy7dX1rQNBLOxXINPsvDVte7AOEoysxnupjdCwI1cEi
         OkvmrQs9Fmjx+C1Y7X5oGtI7XxCF/KYJeYRa95tBHsi3ddDIfl9PaNzhbzL+JJTdARRb
         qCyijtH8D1t66P20zr0V/oQQW1BtOqynvDK5WZkp5WQXhRWifLdVF2OUKxN+dT5QAdP4
         5hDVzn0glPRciE3jTH/xneikCI6xNFWJKnc/bkUncGfLRQW+2az3yEW9on34FO8Xi1fC
         7z+z1ZNtTtwu9b+vdGUMhQhah3ydz0TKowSXA/RE/LEmFKwRRacFe7ohcRM8rhMRVIBs
         XNfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NgNkzc9TKRqSufr7q2jowH4Mnpr7+ZnLD1X9Wx4INOA=;
        fh=5fNSFNAuk301KaEXxT/2OucOFB6RD3KVO4Oni5zLK68=;
        b=KCYE0XjGaWpXog7w5sx1XzgEnL72Ydbe5g+AEk+u1Rs6NyWJrRfoiZgiR5WUS+OW6s
         oJolStUXLg+10Em6fGg6ajkz6M6RQzJfbBzrL2iVyAQK7KvlJzPfyKG8xfJ8V6mTzcdh
         DQsqIf7nnEM3nMfERWjg6Kc98f1Iyu4nLUHfxESmCxNCYM8k20nws8Wp6Bs+zdsWKM+o
         4UvTqzGbmUiAewCVqeDiJ9o+5PPL7PV9QpzRQy/aDKLqis1ArYzVTnTK4NeijdRlGssA
         pycMVAIpFrMSHM4H1BCCR/Ym6Wx9Aw0ZaT4QcD0KQVuIqG7QaowwppV0vXV9VGmQa1qC
         s/Jw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r+Ok3mal;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14-20020a05622a064e00b0042ef575e321si2306419qtb.451.2024.03.19.08.45.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 08:45:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r+Ok3mal;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmbcl-0005TF-4p; Tue, 19 Mar 2024 11:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbch-0005R4-HS
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:43:31 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbce-0004q3-Lp
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:43:31 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-414612cfd82so10849765e9.2
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 08:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863006; x=1711467806; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NgNkzc9TKRqSufr7q2jowH4Mnpr7+ZnLD1X9Wx4INOA=;
 b=r+Ok3maluSmr1kXNeSb6q+w2dnmADv5ccASjV8CDE+7/CC0JR+4XYf5Wx+pJsVAp5G
 7ycRFblmI+65NJGgSyctH+3RikgJPieiGOFOMC92Rw9oUVWGha3O8RK1fuT1+MhHcuil
 6BCvp1qe6w46x3+BfR8B0KmeOQFJ/NCYDnDcqwe/jdQC1S0X4O8ilL+WDKWdSN2P1FmW
 LVDW92fCzYsfUiiU0uJ3uxS2BZNHAFzDfkwDm2/Vv4yuQBGgmWGD3QUz0WB7neve9JSl
 aTJToG/YN9JQWmXigoStSc8u8eEI5rNtdzNgpNQjpn1IeAQvPeCzOo2F1mfR0i1sDIjb
 iHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863006; x=1711467806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NgNkzc9TKRqSufr7q2jowH4Mnpr7+ZnLD1X9Wx4INOA=;
 b=txF22Uj0PpK7AETSQyAt03LncWsNXEidckta+tu+mV/4bXetxP4xRX2T2cC5wPdw9d
 I4GIGSoT4r0+I7UA4ezCHzuFcSEIFayqJsWzmLqPPBq8x4+/8R5FW+6K9JlOsyG+03Cp
 Xfsv2brN+ERpQnQDDxQPAoqVu0xcZ8J69YzPAyoE23QTuOfkZ+OY0QMEzkFP1JUYhJVw
 Mmunx62mWYCHjtbWwj4BmrC7qaYYKB2kIcpkg7yASkYfHlctIq9knvvVx5sbNu+QsLsy
 97yBtUVY0bsCEiLIeikHiIczePBlTx0ccuaNS92epg7ZEM3TlBYEpT7leH0Pts85nVoA
 +5yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0KZVC+++on5VkEursQmB/JJGsdXTZKGbqoQo7s61Lc9RH5UEjGiS5gEPKg2Kxus9+/X0Z6fW7tkgSkkbjjQ6HfS2o
X-Gm-Message-State: AOJu0YypwzSEYKJEaa3aHdWrBwVO6qTFE/LHnBIjF/jUTuZAnip9oxHl
 IMdOH1JBhyZKDcILGYC/QXpWjukw7A4wfEPjmyiUp/ADtFx7koqKbsXnkjHZVBc=
X-Received: by 2002:a05:600c:4f11:b0:414:1eb:3010 with SMTP id
 l17-20020a05600c4f1100b0041401eb3010mr2169239wmq.17.1710863006089; 
 Tue, 19 Mar 2024 08:43:26 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a05600c474900b0041408af4b34sm11116488wmo.10.2024.03.19.08.43.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 Mar 2024 08:43:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH-for-9.1 04/27] target/arm: Restrict TCG-specific declarations
Date: Tue, 19 Mar 2024 16:42:33 +0100
Message-ID: <20240319154258.71206-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240319154258.71206-1-philmd@linaro.org>
References: <20240319154258.71206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: MreDxF6688a3

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/internals.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index dd3da211a3..087caaf2bd 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -346,13 +346,13 @@ void register_cp_regs_for_features(ARMCPU *cpu);
 void init_cpreg_list(ARMCPU *cpu);
 
 void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
+
+#ifdef CONFIG_TCG
 void arm_translate_init(void);
 
 void arm_restore_state_to_opc(CPUState *cs,
                               const TranslationBlock *tb,
                               const uint64_t *data);
-
-#ifdef CONFIG_TCG
 void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
 #endif /* CONFIG_TCG */
 
-- 
2.41.0

