Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778262njj;
        Mon, 5 May 2025 16:20:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUIyD9p33yly9AKtL45io1CQ0xu/z43qnsB6dxqMAHcVBzIRpxEGMQGj0lwJKE5nPXUsyxDpsaxvF5bFA==@linaro.org
X-Received: by 2002:a17:902:c402:b0:220:f59b:6e6 with SMTP id d9443c01a7336-22e1e8ea417mr105304745ad.8.1746487237161;
        Mon, 05 May 2025 16:20:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487237; cv=none;
        d=google.com; s=arc-20240605;
        b=A//UY0wWjrjzJymCAZRw4xy+wbZ2h2hI7ca1QvwziplFhkpt+ovom2S/3IHxt4IzZl
         u9ocbcdkqkV8T9O0RxAQ9FUgsK3vXSY+F/vAeUqSJ67FGvDMs+5eN9zoemmVHZRktPnT
         AQdi3MalrKzdXmNcLw8HkNVd6rsytAJcj4Cnk9ZjdAIzgZkXAUc1rra8JBIVPj2J8UXx
         ktpO0zXrJXKYVlYR+j9bce4GU4gefUtUUuQTxpUtykkxQahBM77zkk9GYFLP/bw6EbS6
         YfN5FuJvbeYKbA0CTSS65gCsADbilCnkZ5n3trjO/s+EqxaVLZ7eHdtBT8F55btXaDwk
         +mLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=92Ra51BscJ7plqFLljDp4Imt4ck5QTPqHgH4Y/GteZ4=;
        fh=iwtOTYUZkHcB5WUP55RqGaJ/MHGUsRn77E1kZnMwj5g=;
        b=Z9FtkVPH6Mp68rzD1N0FeID9/atvt+AlE/m7XlTP9h4+9HvuHkS2pZYzaWJ9fdaIvO
         ddSq8Rge79sNnDQpu53jGXM5OOhTxGZwkO/bQrTrEgIDkaUO2sLfBbKGT9shlZmqlIOn
         06g8cWvDHegpJumypa2dJxp9pRSFnt3il65anQY9wpTOGJWYd0yUeiQjRTCWNGv0d6y+
         iV/SL7rlU39ZkoX1AXpvwD//HL4/przbykv+q4plHKL7nPnFL0JCvn/uJ5EFBWAL4Bht
         8lNsh49NxIxlYPmqlCKR8VEsuN/SZ/8ST7j8rlMoIiiIrt8jolA+N1TSOsc3ylYftzlZ
         SHPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iRG55hOb;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0ba7fe34sor76687515ad.0.2025.05.05.16.20.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iRG55hOb;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487237; x=1747092037; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92Ra51BscJ7plqFLljDp4Imt4ck5QTPqHgH4Y/GteZ4=;
        b=iRG55hObeQ4/J84xFHY2ixX07R2vmHd+bfKuwGly6mLjbPf3VBU1FW8t6RpZs/sTq4
         JcMaxyYBbtBh3vZfsmqoA+OLGxQBqQEerfyXd4+CqDSwSflXsBPdxgcfrOkvhXKI5wVg
         BMoCItyk6Z9vGvLEI7Pvf+/7QwGZtwagLuDwvtJ/V2xsENHriWdBr/KjZ5EgaWU1ZFpc
         vdjor+H6VHVkRvPgOld47wW3q6R4YJLLkWdP5Gk+prpJ5jS6VM9Lgk+ueWi+PV9uQ4CW
         iERf7+9ETnEaLvB3OAWKqZdSEeJ/yzVDsyw55r2IKoxfsjDtiwYZkiT/XotwYtka3vvy
         ljCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487237; x=1747092037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=92Ra51BscJ7plqFLljDp4Imt4ck5QTPqHgH4Y/GteZ4=;
        b=FNMZykJVH/AS46y34joFvHwrJyU+FUnAtzAT+g85Mn9I+vnU285fvgsMufc4i1VaO/
         evY/dcpBgV5PCNuU3lWAvkFGNdq/ASLyD5HwdX2LAzaWMMvrNTLuweN4Xfxy9b8k4Pci
         Ej6QK3Wh+HMcwJ6wF3yLcmME6ubNlAkdgfTc/JuTq0w0yYjZv5gq7Aooe/VpYwc8RBet
         4I4rEAYECvbKlgGq8X3gONIrqcuGxN6ciPtcfjoa+0x1ZWjVOq5cjEzTmBVkyTp3BAwl
         z1q0uRxnkLTkYH23ScRQMvCv0pChxXkCycUA6RDAS4JlcXr/bwvi/VYfExwflsrTYVkk
         07AA==
X-Forwarded-Encrypted: i=1; AJvYcCUNJoN0H5nL8HoaBMobX5pJwR+8oKNVitgM0PNz6Ox09r9GY+qkwv4CBLshXvt9e70qtodh/Uy4QyaxHA==@linaro.org
X-Gm-Message-State: AOJu0Yw0IZcO6PaaUx+AEcZaUSIR93e9sMB+q8e7FDlLqnioo4lker0M
	rpj/K9KLxhJRKIGDqYH1If5RxI6LjpNcBXzbq6DUdPoh7on3KfmSBYyqVphuHFOhbw==
X-Gm-Gg: ASbGncvJvU9iOSUckP0PpwJ0tbhACU6cpEy105rFDsYgb7GY+dpTewGoDAqOeRCp4Hh
	SwUIHXy3LsBCjDMzX0TIBfNxxAKI6knxgcgUQ/mrO2AF/PoZPkNRm/53D7fkjZc8ZnFWqLF01Mf
	CsFR0iw6y2ENioPp9E46CyOR9M4Nab/4iCuP4FFV5EyciVr8Zb5FOzwrNeiGrha4AzTJ8FDuaFw
	CXvZLiCUTOkai6wT3N+VlEwRPmjpSQrCk+ArQ8BuVLz8P0DYD92EmaRJF+vTLZcx5JqB6jFzo1j
	oPuw/qLV05zZyu61GXibIRLEGoQ1lxuWkJjH4JOr
X-Google-Smtp-Source: AGHT+IFM1gtQ3Hr3DrzoVupUyM2ejLDN/ZtwY19Upapy3xbv6kMXCNmsmDwbwB0aXMOyoEqCYaGquQ==
X-Received: by 2002:a17:902:d2c1:b0:224:179a:3b8f with SMTP id d9443c01a7336-22e1ea583d3mr125469395ad.23.1746487236721;
        Mon, 05 May 2025 16:20:36 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:36 -0700 (PDT)
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
Subject: [PATCH v6 18/50] target/arm/debug_helper: only include common helpers
Date: Mon,  5 May 2025 16:19:43 -0700
Message-ID: <20250505232015.130990-19-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 2Aa1iXezY7ZY

Avoid pulling helper.h which contains TARGET_AARCH64.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/debug_helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 473ee2af38e..357bc2141ae 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -12,10 +12,12 @@
 #include "cpu-features.h"
 #include "cpregs.h"
 #include "exec/exec-all.h"
-#include "exec/helper-proto.h"
 #include "exec/watchpoint.h"
 #include "system/tcg.h"
 
+#define HELPER_H "tcg/helper.h"
+#include "exec/helper-proto.h.inc"
+
 #ifdef CONFIG_TCG
 /* Return the Exception Level targeted by debug exceptions. */
 static int arm_debug_target_el(CPUARMState *env)
-- 
2.47.2
