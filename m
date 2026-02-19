Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8B6E9A03B
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 04:03:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vsvFQ-00005F-Jp; Wed, 18 Feb 2026 23:02:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vsvF8-0008Py-Uz
 for qemu-arm@nongnu.org; Wed, 18 Feb 2026 23:02:23 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vsvF6-0001Fl-GI
 for qemu-arm@nongnu.org; Wed, 18 Feb 2026 23:02:22 -0500
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-c648bc907ebso265716a12.3
 for <qemu-arm@nongnu.org>; Wed, 18 Feb 2026 20:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771473739; x=1772078539; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w731RNlMT2uStSKIDhJqip6UtoYH7ZCTQWwr2BG+eck=;
 b=mQQJBsispO1L/Pb0ywPLP+8P5rX4AvyYj/oQT4JhTMEdkEEZWXAeHiQFRF98DVkBLk
 pCPhALDIw/ir7C12TXPL0BXCYWzovjTfnw7OtbnI2/Okg4pPDjzS8tc7taJTqC9yMezA
 6nuUI5kmhAcKXy0CZ+q+DL+6BKt+0paM8O1ZHvgiI+jGsHkcQaOHhYTQpnC4KaAgXlNg
 D0RMrlS0qQ0vBMqu1ugeJTzsKH5aT15pW1fKdi+DOJW3tA7NfvXKQmkr3t7h1IxAWiDG
 l1XWcjttWikqhagsJE3qkSZWE/vcuknLEDxmj5FN/vj+Aj4gbMwTBB4T7nKKzKetALgE
 8JoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771473739; x=1772078539;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=w731RNlMT2uStSKIDhJqip6UtoYH7ZCTQWwr2BG+eck=;
 b=HE/sB8J2bborwW0Rh/pDs05FbJCbCJ9XtONzKmuCDRGn+WAvnnXOkAYQX09jzU69MJ
 IyIGTZ8gwiY0MbED79xwhlthvVYYbFfRyoSZOvbEHJTgTQZWypTFxtVbvPaJa0d+TojR
 lUs1e3BKL8wENXTQot7pFzkt6vcbykIV5qbar0nIl4FMnNACWKr9MLKbFtbRt9eGOC+c
 aM3op02akSp7KWh4Sew+0V3hiCex1FKk7Nt3p+RJUHUa1JsH2/2ApbmOeMJNqJK4PYwv
 2/yqEZgU+r21bfYjg4/sbF9z6Pi5T4vtXIULelhaxnPTFy9k4Y6JbEkGMX1cWSf1KuxH
 6/iA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTcw9RzVJEnGTB5vKb8aAU6GhKyEPpgrIGQdCqQpUmJ/ciA8Kqg821w30zou2+aTLdFGON3D1W/w==@nongnu.org
X-Gm-Message-State: AOJu0YxXG35M5wZP1pJgAeME3PaAztXIUMw1/GuOClTwiSvEAmtUm030
 eGUi4FEffpc5ry6uy6wYpgQBUEp8su5grmEkWoqIiaDvLQLLflAvhQ9rMqJ9Hnpfzts=
X-Gm-Gg: AZuq6aLpYqXL8t3ZwkI3LDb9W1gsfq64Mvl68VQQLIcdVDoL0A9IsuWZOcPG6mH7Coa
 4HU4PzLGtIn/caqXygyvMvDNyu/IyYD21UDPi6QDO+1abOdzv55Y+uvFaDX4n3z9Y1Sv2Gj3vvC
 P0zBk/bsPC1iOSc6N8Nnez8hzHBP+Bn1luVbl8QzJ9GayEKYXJ2VQmFXNYXTcPHsOOslkaLztnP
 B58XD56q46jlIVkLH1I5f8SKSS8UnaFLXkH8RmOklEkFHe5YuCo0xolR9NV0TM4ySAUuBfpxO6L
 khiLDyt+1EjgR40et0FqrA6tpf5EttoFA2PIxwCwcfT8FMgKn7jKiD7Vybyt1lNeq2pI+sS/Rgl
 VECSsmjKdGB9H3OjJzNHQl36WeqBlqvtstJoKnEZ2wa03JyXYf8fu1K4+4HPiA4Gys09l4ZmZAm
 ficFwtf9tg2FGUBsinSGpC1fN3uN0w0aKQ1bJyQrdUNPHuUMzKtWeE26WUNZeuv+bfEDcCI8lPG
 OQYTpjjG0G+Cfg=
X-Received: by 2002:a17:903:244a:b0:2ab:3cba:42fa with SMTP id
 d9443c01a7336-2ab4d06157dmr205990305ad.46.1771473739025; 
 Wed, 18 Feb 2026 20:02:19 -0800 (PST)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad1a73200asm147636225ad.36.2026.02.18.20.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Feb 2026 20:02:18 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, anjo@rev.ng,
 Peter Maydell <peter.maydell@linaro.org>,
 Jim MacArthur <jim.macarthur@linaro.org>
Subject: [PATCH v4 10/14] target/arm/tcg/cpu-v7m.c: make compilation unit
 common
Date: Wed, 18 Feb 2026 20:01:46 -0800
Message-ID: <20260219040150.2098396-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260219040150.2098396-1-pierrick.bouvier@linaro.org>
References: <20260219040150.2098396-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x536.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 85277dba8da..cabf65e6236 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -49,7 +49,7 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'sve_helper.c',
 ))
 
-arm_system_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('cpu-v7m.c'))
+arm_common_system_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('cpu-v7m.c'))
 arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files('cpu-v7m.c'))
 
 arm_common_ss.add(zlib)
-- 
2.47.3


