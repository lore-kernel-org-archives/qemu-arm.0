Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19598njj;
        Wed, 30 Apr 2025 23:24:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXx3s39zLvIcTs/2uFNzl2Ms/IwQJYYn1hINYG+Ij3yWhnXntlzX4oMULJiPQGrie2wm9iQI8bwzpLpIA==@linaro.org
X-Received: by 2002:a05:6a20:43ac:b0:203:ca66:e30 with SMTP id adf61e73a8af0-20ba8d5796bmr3590192637.37.1746080646320;
        Wed, 30 Apr 2025 23:24:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080646; cv=none;
        d=google.com; s=arc-20240605;
        b=SOr9IXIaWAigeBZlU08rGzOuve/evtMUYJzPfjToHQgrRC9Ovaq4miQi5TcpZMdvqs
         4VvxXhSU3XXRdzqNqSZXvvDy4bEXs7eNbt1Y07aApo61/3ofKVsIdTyoNkCJfPONOHLJ
         J+K/6fbXhzN6rJWLJ8yEb9mcFOxWdzAyQl846CFwygH0d+khDXStwflJgSY8cu8dBVhZ
         n8vGJwJQ5zlP8BWYUOZJkL6/GaZdkbfewxfvwedwmSiKZXDGgfnSZjsLbv52RLl4rWsr
         1HHmxXfx3NkfsMjH3gZUGFJYJSb7BRshpFOzn4URNnteh/CXQGQDGAx+thXeCIB3b7JP
         fswg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PFwygMkwhCb1ZWcyfCzBjn8oVpD1D7KxEaoA5Pyvsy0=;
        fh=liqa/Ovui/aCmt7A5yeEd8JWQwYoSepgbgu2FFWMGRQ=;
        b=JOjySG6q6GXBJ2NFKnaRxG+6K9/F2SnV8FylziD9Lnx0OwB6ZyPQDfZW/HWqCzh/ZD
         APQUIeX3+XhtT9/aoZy4FApLxmH8E7GdrGm8LjGgD/sB2KSiD9mNwYT5rV07hwIve03t
         xT8kpuPmKANnQYnvxbVygR//yTq5A0AlLaZWSsuu3PIAXJVKVBp6KvmfVdgKXuXrL7dx
         wmcKsrYIzuXGxOqfrnju19Y0/ty6OHLptTj4LGYeOWrmKFtNuYzQ4rRo+1+O0fxwvgHU
         I67njNYqviCvRLhX7lgF9XNwXfYH5vczd7b54+1elqNYHL9fq19AywO5hpzr3bqOUXxM
         4nJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="x/AvpI2R";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f9e9bf0sor102944b3a.7.2025.04.30.23.24.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:24:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="x/AvpI2R";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080646; x=1746685446; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFwygMkwhCb1ZWcyfCzBjn8oVpD1D7KxEaoA5Pyvsy0=;
        b=x/AvpI2R1uIpkmeiTk5STCuX8UlZLwdug9YdheW2OaP1eEB4oCfTVwOw+pv9R0Bv6/
         JIYqXVzgqJy8uGzXkxhCE4XSUQw2EfmoIrs2bBbjCvn+fvSwYaHMVsop3UP4IlYMoKZw
         yPBw8G4JIOXorT4wtVgb1bjXDBbjxlhyV9e3w84Hmk9JyMuF+BBc+e6N6thiFgvCqiFb
         fkB9/5wKu85RRW06Ytqqwc49fKQsolu5hZfROgOSos7j1KAmQM9Zc+reTQG33jGYNzdb
         X7ZTaoGWVP8fpS5qbxtTbEcK3gk7uW49apRuPT4RZ/RVlv0DLEHJjRraluCnyajy/nV/
         MuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080646; x=1746685446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFwygMkwhCb1ZWcyfCzBjn8oVpD1D7KxEaoA5Pyvsy0=;
        b=QyvLnbTTPC2bMvNgjiXLboEG/xHl+hT6Xns800xxEAHWSlkx0GSxyk4cUAEEw1v+HM
         dQWgLrWn/BKT11F9mIbAbJzAqIjPKAQLNRtHqEbCFLPzKG+XffZP5nVOISZDeUHmSmNO
         hvUyNf3duPNucoEFa846yiDHanRbEgL7DlMobKo0Naz36XZPkdHbia8vEUw+ngfL8jiK
         3lmDoKOpgX/5aTMcfov7aq3GgD6UQb0unORLQSPhTOuxrbBvbFm2c5T4XPG+l+1xe4j7
         1oKzqdlygwK/nzITfyBgKeL3v+1wvYPCNMhdmnI1VUXQ+S9LT1edAKjMgVoVt6MIc9OH
         CY6A==
X-Forwarded-Encrypted: i=1; AJvYcCX0YbuxFJM6E1DrLthn9QRH3fFJPjy0PNcXSsscnkdmcm/2RfnmP+kn4QhskI+3WC5TtjEl7GfEbwgf4A==@linaro.org
X-Gm-Message-State: AOJu0Ywg7cXmUKo9IewSycLvgs4HY3NvJqtb3H9U523ZY+vR+uRZ8QNE
	XcPfVt8K4R3SWn1+5Kk0lK7DFN6hbi80g21S9HP9O591RnP19kKLsJOr+7Nuqpnr8g==
X-Gm-Gg: ASbGnctH5EYqK3RcA2ttxFOWj6898wNb4ppBv03NpEydOd/AB65mu6kkaGtA+KlUlzt
	SbDwDUq5eZiq1TB2rhSLQQdVYveZSpkb5+1RS0TW+2swG05XLSJCfHf8FecMl1z4HWGnHk7u5uU
	Gkoo4M2MnVpMal5mlE4uTgr50mvhhf96AD8zP5Qlx7vYf8Z+SpzlUb2464R8oInKg4rWI7yZy9F
	2cmL94ErD10nuVUfg9iM85bUOAC+7PJvkq761XftXzJ7eYBhBbMmrz3ovKfx7WP8wxGG5XzvA8m
	aiN5HL9u/XrdXjSehqgsFd/1q4fsTZnZUi4D38bh
X-Google-Smtp-Source: AGHT+IFADJB2FcXdHj/QO2Pd1O841YT7LfIvcgx8grnyZrHZkJ2z2++hnDO5xALbvSxtkTgFKdc8yg==
X-Received: by 2002:a05:6a20:7f8d:b0:1ee:d8c8:4b7f with SMTP id adf61e73a8af0-20ba75f00f2mr2951744637.25.1746080645877;
        Wed, 30 Apr 2025 23:24:05 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:24:05 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 16/33] target/arm/debug_helper: only include common helpers
Date: Wed, 30 Apr 2025 23:23:27 -0700
Message-ID: <20250501062344.2526061-17-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: WUU70WqlKP0v

Avoid pulling helper.h which contains TARGET_AARCH64.

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
