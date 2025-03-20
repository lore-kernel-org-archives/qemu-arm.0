Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1279130njc;
        Thu, 20 Mar 2025 15:30:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVtlK6GfdLfzFLW9lgJNhkFs8iO4ZdH3odBqGx3BhEzIuKik6Y4Em71sS8/eIxfSJLD+ZruWFI05+SY6A==@linaro.org
X-Received: by 2002:a17:903:22c4:b0:223:f9a4:3fa8 with SMTP id d9443c01a7336-22780c7d8b4mr13314795ad.19.1742509838498;
        Thu, 20 Mar 2025 15:30:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742509838; cv=none;
        d=google.com; s=arc-20240605;
        b=Z2NH06oOSXp1hZj9dSz1a4H+nbKJrL/1yglW4sZVucO5Vt8ggFl/7hS8KzWVPrivii
         tRxV46amZIUBlL03RE+B/Z4joHirYuYp+AlujPedme+jPjl9ZAL0NegkjjzPPpiohltY
         vcs3Z0yR2yeIJgViTgSG9NLQdyEVo+cs+O7jjpTRxTmIehaAYdyEe1xkRntDXu8Qk3r+
         r8P2HNWn1q/x0Ofxy/gR3RfX5QCmMkgA5ZcwprpoeYBPGx/tGtEm9KigT5ktIopHhTH9
         7J3toS0VMjWnWAVNFGDvAMJlkNsb3v8/7F+gKT67Ap9/GxuHjS++U/Bxh+eo/xUttpcW
         A4Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3u7WNnidYvKn4+ZIVZ2UCzTlyZ6yVz/ThCJ+k4BRWTw=;
        fh=J+EGZ1LEogDlldrYTOnidpm6dDYzDeIFv9WdxwyTDRM=;
        b=DhnANliRvyjVOtRPyCLrmtZXXhT02vAljdA/RPOA3YwzYbf/CEVfkdi0fn/7twkVLM
         FOWcHLd3VAT+FcIsBbTY48q/P5QiT19MumBp1LBYoU3p8DNnHAkqZqbd9hsAiG7RVus/
         E6V5zakuNNaNKB4zCduCIsTC1YPoQNjGLui0JDSVFAglaMTAKQllkNaupsev/XR0CDgP
         bVvPbsmQ/B+qFI2W99kKS8MUeuPJt1GnaJqSVZlCEkpCmq70/SSQzBClvGlpaO1my+jC
         RX2GxyZsa86MKsnkZSzhTfZnZ6x9h+0sVPX1onWW2ILe601rQyxwWw9rTq+rgNOGRa6k
         p8Lw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aXnyXo0L;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780ee9a57sor3782245ad.4.2025.03.20.15.30.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 15:30:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aXnyXo0L;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742509838; x=1743114638; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3u7WNnidYvKn4+ZIVZ2UCzTlyZ6yVz/ThCJ+k4BRWTw=;
        b=aXnyXo0LmNFvaI6uTYhUx+1VWogvUZrW/6Vu2YKRYJ/uTipzypkNFpApnIe8NYVyso
         TyPLIEv0bqehEJcej+Rf7WNaHpxYm87exENffatyZ6XhUK4YTnoQqzN0LGzzTVvMbNkP
         UgxKFmg4xY8uiMBMGofDcY945eoy/GfQoKYOvv8P4lfyvKWycSZKKF9I3xIOMBTpYFqA
         EI5/fNf2O8OJ1qbM2xw/aFsOQsiePEC0Cnt1jkqu3DIHoveSN7EXFpL3bB992aCD1UML
         x2ztngcCWICClHqaw6wbZ/BvYQD1HDPl9hDNYMBJ/oBiG6MKTvHXAquY1fdbLCJ8qz/O
         oRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509838; x=1743114638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3u7WNnidYvKn4+ZIVZ2UCzTlyZ6yVz/ThCJ+k4BRWTw=;
        b=Ln6UBtHLBbuLiJKq1DYJ1TZG+3ZOlhPFGoejlKz5kktAt70MeqcLgruu010OldSZ+u
         TwoZt1ucz20d3lsHkhhssnPumRkay7SbtUJEhs9IW/9P6nYjomZnqsCKjppIx/UsK1VL
         YIAamO4WGcElg/M3MbCnjeddKByTIhxAdjJPIUZwFg/2VJNk6pkiBnVhCKJsO+cKD+Fm
         hyxTKaqRQ0GKMbzcnw3CcVw48sWZ1TrPyawNIDVzMhJAKBpXnDWFnb2dhHaJUp0d0evx
         usJHhUjiohGyI0U0fliJga5uPBUt0Laf0ZilaJqwGhHb+7g+vawj71qpvL5jLp/QrqyZ
         TWcg==
X-Forwarded-Encrypted: i=1; AJvYcCWdsr+VHh4mHpAoi7YeU4IFPPC943QO7ML1kMxd7mx84QPTsYDo0cWftCllM/X5+GCoqE+uY4alXDDWVw==@linaro.org
X-Gm-Message-State: AOJu0Yxpt6N8rG11wCxVQ+V9xSTIyCBmhm+wzKstI3qMl8QB9Yhe+WYP
	iyrbji9ATY+B9vCYiDs+Ggkzl4V8fpV95ngnYkzqN8jMEhSJcRGIif7Xo0L8NuiKtw==
X-Gm-Gg: ASbGncv8F1+5KqKOo93Cu7Rdl7mo5bi0NmYYrxpexZJeWRFEkKy4GNuVpgM6tWCjVXK
	PB5GxEy0jdKAIBZA03/Qdu4OnO66lLxRtX5rYPv5SxxRah2ZWibRrRTZ3sngO3Rp85PdltWnuUq
	07fxNWGshsK0VzE05zkgftdLaZHScCwBCaQw3Y9njKjSuMB0cRTGT+e1byNCCVTXgE5YBJ872Y7
	r5f5kTHBGXC6REUKupb+tJGlDIRzaREIPqfRTjzboGUDhIzecBzqd1SQofXTup9cv/5UexuOaNp
	O2qO6folm9HIOuUUnMzZ4YnuNVvRbsnab0j02IyLi5Pn
X-Google-Smtp-Source: AGHT+IGuUar1bydPBfvUd3+IX5uuws7MRKeT3al1KpzBmkZ8QvPpHkZpK7kYl35m+krx05UHzx9n+A==
X-Received: by 2002:a17:902:ea07:b0:220:ca08:8986 with SMTP id d9443c01a7336-22780d828c4mr18233965ad.22.1742509838031;
        Thu, 20 Mar 2025 15:30:38 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4581csm3370145ad.59.2025.03.20.15.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:30:37 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 27/30] hw/arm/digic_boards: prepare compilation unit to be common
Date: Thu, 20 Mar 2025 15:29:59 -0700
Message-Id: <20250320223002.2915728-28-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: l1OErsOiTKyq

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/arm/digic_boards.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index 2492fafeb85..466b8b84c0e 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -80,7 +80,7 @@ static void digic4_board_init(MachineState *machine, DigicBoard *board)
 static void digic_load_rom(DigicState *s, hwaddr addr,
                            hwaddr max_size, const char *filename)
 {
-    target_long rom_size;
+    ssize_t rom_size;
 
     if (qtest_enabled()) {
         /* qtest runs no code so don't attempt a ROM load which
-- 
2.39.5
