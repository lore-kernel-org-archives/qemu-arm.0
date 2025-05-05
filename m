Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778348njj;
        Mon, 5 May 2025 16:20:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWyjT1dJBaMNH95vRfWmEhk8IFrVCxG2Hi3QONCXbgauX2PKBcMp8cEXPKDZrlIebV1rovrMiZLnNdqbA==@linaro.org
X-Received: by 2002:a17:903:238b:b0:22c:33b2:e420 with SMTP id d9443c01a7336-22e328a4440mr15452945ad.7.1746487248542;
        Mon, 05 May 2025 16:20:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487248; cv=none;
        d=google.com; s=arc-20240605;
        b=OGA7NP5OhkhicGNYcKQoH6a8UxumRyzSyy7t6I7yMvVirIW8fc+pgvB93UrYlKnRYd
         qFVfeNezowgRTi1YhV7RDg7k1Sb+jCVNOZ9ZKLg+wfvvT100FuDywePIm5zFBYbu2f7s
         lJJNzknzUa2XHCdGJdeIsWTQpV7fahQTDhRAqnIpq/7ehVBvcTNlOoYkbyXQSof1OlgP
         glvO1Itzjvre6byGUVuycGn2ThNp0sqFanC8IDBDyOpGlwusXFTMBX3+i/z+5M6OnFjd
         AgVGPKV7W7IhFNU/3Qn+fgXB78BGsLVxLkt+QyBtvvI2BeFMuoUTXDJvZ/fqLkot2E7w
         ZP8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oEdUza85WO+DzwzEMeWL7z4M0hhaS2RgQrae4P4VTDk=;
        fh=h3WARkamwPHLfYJofIEHjaq7WLSa3P5FjG0WetSS+LQ=;
        b=EcfIUxxDv0/afjQvEU6cm5I5YvhB5J90U7rJ7t+wLOiM8ef2s6uKQQd4Aakd9ZVTlX
         PnpN7Q5s/W/Hcj85VNcItJIPktVV/Dq+GNvQ6CNzhmNFUOz5c9MuvlcgUgpOyEAwOSK6
         pgT0124Wh12C2b7xYrQBTUdjWW9Z4g3dzo6jEmNw0i67IYGzwPKzSI3P5f+5TtzrlhHc
         66146gRjh59NKNdBudpuO+6UxtVhEvrrZvUn2k4ZP7JP3kqR287diqfCgIOqzFHxTdKK
         MD3IFpczdNmRrlDt9iXOV+f4F7l3nKENbSY5OXdcSQdW0nJiFp/jIiiNGytc7wCvZaNt
         igGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JJ2mKiA8;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb1a494sor6691145ad.1.2025.05.05.16.20.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JJ2mKiA8;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487248; x=1747092048; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEdUza85WO+DzwzEMeWL7z4M0hhaS2RgQrae4P4VTDk=;
        b=JJ2mKiA8C+PvCsNWzz/i8/wBFOPH/87BZF2wPRvw21uBbDEyOQCIUZbER9Zx2tKTgd
         3TmZzxOhPYs8qfpapl+Gly9/OKzMS8yGxnXpohl2twzw6Vf8JVQCfv88bxC1+Ah8ANig
         ca9gb5tSggUT9VVdg9IhFhusxvYFRoSLSXSXyDsx5bLCByCrq+16JdkwwPQ3dCpyBp23
         QXR76AVY8fwaiivuJviyfzP0fiOlXDu7DbijxBdp8wxZUyMmITX9m+wCcKrBwjns5TAu
         53KZwn8ZWsO0Zwd4cvYR8GZYYMtaf/NQPdKHBFvkCTcxcuL3ot59qk37e2kNcHnaDb3l
         7AIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487248; x=1747092048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oEdUza85WO+DzwzEMeWL7z4M0hhaS2RgQrae4P4VTDk=;
        b=TQq7GeflmHESclaHuZfRXaK8vKP0GgLRd+YbuoLp1/1xjsr9F2zEfrRggDYiB+if4/
         XJPXArxNKUJ/EIWcJcMahZbrvB3WNbmrfrIsshUnQlRMAP0dM3VetTmkI0Nb9hlwGiDW
         rtQbVlcNdLUMHI9VGKUwAMp/+4+48SRNC8MPaVukw/MOPqhG8TkzacTORkr1/J8YJ0R2
         hGu7KtI1TFHZZLL7bBSDfKi+szywL5MhtSKvjRJKVf0nNb/TY1CpK63m0+93LQNwjQqj
         T/YPO0+bJ7Y57JTO9C9jNeVBe+uVdB3k1xGv8jl8qrx10k06LtpimM09IcD6ysO0JKP2
         +tKA==
X-Forwarded-Encrypted: i=1; AJvYcCXQN8GpBHzE6Tsj2RMPuc340RGgP6H4jT4g4BNlXmyx8dmS4KQDMGBwN5AoJ60FxKZ6G2DLw6od83F1CQ==@linaro.org
X-Gm-Message-State: AOJu0Yxn/2kiv+s0pGjV7AKk6fTsaJv7pz1aqC2d+iYfRiYvxfehT83k
	qIIzjKWgLrKxgUQYloBCW02jIlrJRUFoqZapW0vuwIsGRk+PjqAcckd3zK/99qWJzKIRiODLC1S
	1buj0iw==
X-Gm-Gg: ASbGnct7XjhntIKEIJy0lQgPX/rcLFr2C78LAfgEcPGeiA8qkSdvhGCzHkzMC68Tc6m
	YTw/wUP/o8TF7eLZl0E0PrOc0qYHRo3jYcOHloeNRy7oS71iN9Wlxn2XIQcBQxI3le96Laukvw6
	+t8Ir7uTscSMnste7q4WQFhVAuHADw0MMQ459HGCcrfNE0fBPTstSVgi4pCE2ZqnwnI15cB9/5Q
	uojiy5MOji/PsTDHrgJFw5q416Q01EOiBVkHEEuMdPpkrENC0YIKe+X9EEeq44i3vrIRiyhBtUw
	XU1rflTEbzRP7wjq01hgWyDj15cmE9ky/j7RxUTE
X-Google-Smtp-Source: AGHT+IG1jiJQxBbzAHV3mqZ6REtUe8lv1QX9zvdPySzs6EmfZn2E2GCfq+CiMq6MLVUXpnJYHzmN+w==
X-Received: by 2002:a17:903:1a8b:b0:224:1acc:14db with SMTP id d9443c01a7336-22e32baa0b1mr16580805ad.29.1746487248068;
        Mon, 05 May 2025 16:20:48 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:47 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 31/50] target/arm/ptw: replace target_ulong with int64_t
Date: Mon,  5 May 2025 16:19:56 -0700
Message-ID: <20250505232015.130990-32-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: gD6gVVTUnY0c

sextract64 returns a signed value.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/ptw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index e0e82ae507f..26c52e6b03e 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1660,7 +1660,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     uint64_t ttbr;
     hwaddr descaddr, indexmask, indexmask_grainsize;
     uint32_t tableattrs;
-    target_ulong page_size;
+    uint64_t page_size;
     uint64_t attrs;
     int32_t stride;
     int addrsize, inputsize, outputsize;
@@ -1733,7 +1733,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      * validation to do here.
      */
     if (inputsize < addrsize) {
-        target_ulong top_bits = sextract64(address, inputsize,
+        uint64_t top_bits = sextract64(address, inputsize,
                                            addrsize - inputsize);
         if (-top_bits != param.select) {
             /* The gap between the two regions is a Translation fault */
-- 
2.47.2
