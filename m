Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2509248dyb;
        Mon, 23 Jun 2025 05:18:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXB/1s7BlS2UAG16rj0KDT4fOdN/kR95PQvfzAi4/zyyreh7wAXPkdg9GvbYm3vnGP+laIZrOJ17/hLnw==@linaro.org
X-Received: by 2002:a05:6000:984:b0:3a4:dfaa:df8d with SMTP id ffacd0b85a97d-3a6d12c2913mr9297848f8f.9.1750681133716;
        Mon, 23 Jun 2025 05:18:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750681133; cv=none;
        d=google.com; s=arc-20240605;
        b=j4T24AgVEjv+TVqP3u6P5wJRh3nmMllPGJVkQyT3W10ljZPu/36FkNAtqKRNe2A0bF
         FHDYLrJgJBrehrKjd8yMqp31LK06wxU8nfApnM9+4tyGhKOeu71G7SvFbtHy/zrFA8tk
         qTulVOzkADGsiYhsgNdMRKecX8Ya3HbI7JmVgGoAY5Y5BwV/o4KmbQwg5fG/PJB2cgGb
         WJTNLSvUW1odOQ0c+gd68ZXqBGX2fHLQZ3ePdPuOvZ4bHeC0SERk3mUCG2X4VkV76oXK
         T+Wzn1LuL0ocCfeQ59bOCRJwh0gL756gN1jXHLo9l35GmC8ja5fQezWAHsHi2CxAFx1V
         wN/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tBZvBlUJJ4ZZzRhwp1RRYC3txHSba+iTcUIOSqbdq4E=;
        fh=yvKuAnCJQKK+4NsyT4QyosimptU6xjrKeXxifmWzeoM=;
        b=lmVav4ADAZklP4gzL7O5qteiX476u0K27txVDENtZy37wN2OEtRo2FZrR2BJlpyMCO
         7YcBeIzaIPsCrpwr0IlQwCsNlihp+h8VShHVKBanw/VjT4W9NptbN0/FLbDH5wYg1NuR
         GZYjC8Yu2l7n2ey+CrKxvEf06fGeCbBLjrf72GHrKN0NfID2ixU9Jr7vHlroTLzIeY47
         OdiQ7cAvFiEoHYODNF7tvqlJ5gCFuYjLtJjf0ABV/SunoEGZAWUn+lMFWH0egzcc8pWc
         DEfD4znEPryiIXhymqJUhcFn4XqML1lPPoQ2JxZqavIpQmk+k/8sBfo89zA16fezhaqK
         AoPw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UeGbnSRs;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-453646cf2a8sor22408825e9.1.2025.06.23.05.18.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 05:18:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UeGbnSRs;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750681133; x=1751285933; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tBZvBlUJJ4ZZzRhwp1RRYC3txHSba+iTcUIOSqbdq4E=;
        b=UeGbnSRsE6dmdLRVa2veg5tzpYWQiUtlBBrxXzkHxecwCoXPHE2EiEJTQoFZoZUdBs
         xNybgrmGdqLVAPrMIKW4wCXJO+Aey9A4FQ2HMr5eW8WqooDm0lCXN70oRp4IZ95wEIGC
         Ak2V5Ocr5cKUrB8tQcbRG8D+/+yiyCyNQua9QgwNvXThGr7Bi7WGErH+vusLY55ANTk/
         Ksuw6oTPRk7g+USUkZnd6Da+K9NVWQtRMAzSIYxGZ128el6pBpgDAjb2aodtV7AFOwcJ
         r7CRjJ0W8aUurkqduDOZALtvHfsYPlKrK5jUNsMkCS05/Hbsg1qGen+BWs2n/QV22Sys
         L4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681133; x=1751285933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tBZvBlUJJ4ZZzRhwp1RRYC3txHSba+iTcUIOSqbdq4E=;
        b=hl7KnHpGeyR4vwmaV0fIQDyetZS1iDHv8Fh6zrIupltxJNqWBMyusM8MY00FVmGbAn
         KJS906nc9/p+pXzd1/JGJsu/oAckNtxE5KtoQyuZTt1MP4iiBVavgf0pZN5wWbfpDlLJ
         xbzIompYLU73kXq2cG+fR348Yk5AR3bCLxKmebdL8SVj1RseCTX/tFwwlTx5+iRzULiz
         GxAV/8ZktqqVKoWAZE9dKNkGlAygkHzhUvna85gV8Q9dFb/WynEmZYvr+mQJUAD6J+Ot
         OUrqK2+qMv1wqdI3fj4M0vd28UC8VRePHviZyUDVFgJgsRmwlvlTtWrDKYxEWfZtpF5r
         OVhg==
X-Forwarded-Encrypted: i=1; AJvYcCXix9MMCqAgs+svN9DoRsJ2kFF35MpN5BMeILLRLTQIOD++uRuEFJhd2UBDA3n25i4zdb/ud2S5ZvuTjw==@linaro.org
X-Gm-Message-State: AOJu0Yyi45xHmTyrjRmcbw38ioOlADvhOY0CizStVMscYx1rPFvz3bW2
	CtJgDqMFHT9bH1gl5fG2g0TJDFAZWEZ89AJOVfK3TylMJ+8/qLEK5htPi0PICLZsXRJDCg==
X-Gm-Gg: ASbGncsgfPAzUT5/nWjhVFIsjTXmlxjQ3waLTA7C/JJk0MI/isVzGLfESAFYSuNalPR
	/Th3h2ysjmc2nvP6VKbOx7bZLhT7/gHuRCWys0WgbC+/k+9xJzzjfS5L1e89aTooKkS+YKnCw4J
	qmzjq7Pgtp8eys/v6XgHrKPm/iAaizz7aQNvSXDggiPs1Qr8RmV8iqFT/Bty5nSQoRLf9TLoPmD
	cgY31AwLWJ9kqbM3ytqli6jAg3Ntom1kQFFEr1YtRSXHv7701AaPteNB46GWbyCnVJA1mMaxg8Y
	wyMgyOqYxdoAKaqJzc1PmmjDS2yBXFzfk8/IsDwm4nlUzgnamv4+L/YxyWNR4hS/YQKYYhPPJUE
	xgzBHP7eyFgSUgsVa6xssXbyUJy+NS1ruvIdC
X-Google-Smtp-Source: AGHT+IFC7OEULrZU5qbGkE5mHTI4DDkyLTxB305hu8Ey7qsg+WC3Ig6FIv2n+cvmO2DD/y8MEEbwgA==
X-Received: by 2002:a05:600c:458b:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-453655c6142mr118583055e9.21.1750681133114;
        Mon, 23 Jun 2025 05:18:53 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45377aebaddsm15398735e9.1.2025.06.23.05.18.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Jun 2025 05:18:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Bernhard Beschow <shentey@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	kvm@vger.kernel.org,
	Eric Auger <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Cleber Rosa <crosa@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 01/26] target/arm: Remove arm_handle_psci_call() stub
Date: Mon, 23 Jun 2025 14:18:20 +0200
Message-ID: <20250623121845.7214-2-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623121845.7214-1-philmd@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2Kes5t8D6DcX

Since commit 0c1aaa66c24 ("target/arm: wrap psci call with
tcg_enabled") the arm_handle_psci_call() call is elided
when TCG is disabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 3360de9150f..5ed25d33208 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -650,16 +650,12 @@ static inline bool arm_is_psci_call(ARMCPU *cpu, int excp_type)
 {
     return false;
 }
-static inline void arm_handle_psci_call(ARMCPU *cpu)
-{
-    g_assert_not_reached();
-}
 #else
 /* Return true if the r0/x0 value indicates that this SMC/HVC is a PSCI call. */
 bool arm_is_psci_call(ARMCPU *cpu, int excp_type);
+#endif
 /* Actually handle a PSCI call */
 void arm_handle_psci_call(ARMCPU *cpu);
-#endif
 
 /**
  * arm_clear_exclusive: clear the exclusive monitor
-- 
2.49.0
