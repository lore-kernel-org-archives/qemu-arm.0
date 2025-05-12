Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42700njb;
        Mon, 12 May 2025 11:05:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXhaWm2oxrwviqGr4SlCdRV4yrS+4KoxFGsMCggVuKe/Jqa89hWqArI5GeeEOqPORuUJnCDiaeUg5vHUw==@linaro.org
X-Received: by 2002:a17:902:f652:b0:223:42ca:10ef with SMTP id d9443c01a7336-22fc91aca36mr232949605ad.43.1747073126734;
        Mon, 12 May 2025 11:05:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073126; cv=none;
        d=google.com; s=arc-20240605;
        b=GoeKBJCEsGgn1niVZbBZernEwMqnQYKqYel0EEuqa3pJC0oS8x6gIF3cJv8RZs5I27
         vdAZzTIYf7DZAi2azx7nvRUjBSEgZrVgzVDvN44eGJavqrRrydX8U69cSzq4+lAFg2FS
         2isHH5uemoSVmqE3GengLBvTTGkqEHn0WmbwDTurtWWxvNNh4iKVIYTu52c5anYAn1XR
         NtIKuj0r5VMuFsDZzER4NRooYYJkmb4LbIiRTeYgJUndTu6U7/cjMf+heVBWHDhkcMfu
         1ixY7KzCTCKqubEOFxrkgZWq4np3l7ALrNtIkcCX7yTcpwPs0g2QnRvJ5NRBX8cz3V4X
         LySA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kfHS+52V3f05Qs2m5d7Nh2wTK+yUmoJBcA8DI59GOAc=;
        fh=i4yw3PILb+LnTBd9jH+hYje4H0v9Rzceft+VFm47u4I=;
        b=C5G7oIr8WFMUgbqnsUgqvylm37Z1pND0gaCuExf0KdPHLcae0meg0JfADYgd0aJK2r
         4fqt7NIOsvHdddxvYt+EI2B991WDNq43SglnVbrDJllzg65srUf0l9iuAcW5hkDXZ2Ue
         WzZ9af/onKxkS93ntedWJA8LMqt/StIk0SVCiDQYq9BwtwLAdYeWCcnztSaUz5u9wGJh
         KV1MTfe5FLyFTYxqKXesiqD7IRN7CyAncwImW2SpmNGNWBbuGXfhLUOPeex23y6pJYOZ
         p8Iy8ltpgo4ijWBog7jIcOyrVf1VP2LYGLR0foEzAME2YuHXavLnNEgrd8HtKE1xi5IL
         7oCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Myr3rT98;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc5a2bc41sor44938325ad.5.2025.05.12.11.05.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Myr3rT98;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073126; x=1747677926; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfHS+52V3f05Qs2m5d7Nh2wTK+yUmoJBcA8DI59GOAc=;
        b=Myr3rT98dD3KLNq3sbQ2wgyyY7kjWH4lJnct2b+QLl53pa5esD5L9MSw1e7K11/nOF
         c8UCT+ChxBGzUi+eINdB8pb9kB4+SdHoTz54M9L0bfzN9ynVb+hXRp1FP53PrkHd0fML
         337sn+4thjjZaOtKfdIZnoebv1XOMi8/ArDIgpVppZg5Wcrukzz3PNT7R+SJ2ARsAjPZ
         dczBa2Roab53CPibVW+9lfMFrTzVuuDs/SGecvivecGvyCV5LB+KJNZCGqpUYRjsH5PX
         477dMB2F85Pz5/Pqmk0rKJkCvcg0xOtRGz3ZOG65Dh8pvrFAI5Y8DSasHeFPq2ewx4fA
         6fpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073126; x=1747677926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfHS+52V3f05Qs2m5d7Nh2wTK+yUmoJBcA8DI59GOAc=;
        b=UJRbmOBehSD7eUdgbpaq0bfj9QRwYYi9Pzujii2NwK4Y8OiIUSfkJcf3KipzhyBu2+
         xBl1bXYK85DLjfMrwgjQNp+7GKAfc9P2JBFueopmzKhHqD8biqJ4s9ZprVMVYI27BLXf
         mhJctKiHrIvcXXOZXe+aUURxPyt6Az51MunBd0aXabUOJuRVXy+aJBu3IPphlN6Gv1+V
         sM5D8fSKGWcC2biNizI1P+guE+ZTeP3WMtVtbzmq5hxuGtwTTLklAy7lrtcBCeCmOPSg
         h/Y2RmO9TO4my95nOVH7MW/vbFJQlZaMsOm/w9YdxTG2QVwSg/k0XX0I3DqEygIK8bJZ
         j7LA==
X-Forwarded-Encrypted: i=1; AJvYcCUB7jHxH75mtLttd8/4po6wmBnKHSAiq2so13GdToy3Cg093mHY+SZSuCSJ6Iy9XUVHBJk47tterjNXoA==@linaro.org
X-Gm-Message-State: AOJu0YzEEJTgw9odzKItrCgZjfx/228DeFztUUmhpccUP3ry/XVx7IuL
	UNhLlu+6OMv57VLZtLKDQM6rl0XXKgr63SV4//o6JP8UPHBEXnH6vac2xwWwhmg0xtVHWqU7H4G
	D/Ic=
X-Gm-Gg: ASbGnctoocJou3kbN/7XOWXWlMS9sBqstA4uvEYAPwWir9HtC4qd1ySCkKBFxdJWXN8
	QCMPTD//DenIyLiL27XD8JbzAmYqodwsIpq4kgIoHcWlE0pu1yj7eNJSCXXklWyQ8BQEdcGX8VJ
	EdTkvFq+VpTG60Yk00Ax+hkBRYTfqGyy7IYQQYyohg1r5gImEUUdmKzNuKjj6Bp6xOtCuk9HBRn
	aLq3AdsvvyGHHz2Jl4vx6tn/Jdum7Jd4KKckBEtjuVOa3WTfSan+2HUz5EUMdWYGV4XeM31PErp
	esawiEtYVY+3ylwJsEuUPZZlPvChfxmlXRno8MM/vJIhFeYr7gyup+K7YLyQGQ==
X-Google-Smtp-Source: AGHT+IEEH7iAqqDA68fuoaWPuS79K3+C1FsiPNsaDzF/9dqgyPWdEGPHvdAfcxmHtZcyfQ1XFCuGtg==
X-Received: by 2002:a17:902:ccc4:b0:22e:50f2:1451 with SMTP id d9443c01a7336-22fc918fd2bmr202795785ad.37.1747073126314;
        Mon, 12 May 2025 11:05:26 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:25 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	anjo@rev.ng,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v8 16/48] target/arm/debug_helper: only include common helpers
Date: Mon, 12 May 2025 11:04:30 -0700
Message-ID: <20250512180502.2395029-17-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 2VW+1DVXgYR3

Avoid pulling helper.h which contains TARGET_AARCH64.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/debug_helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index de7999f6a94..cad0a5db707 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -11,10 +11,12 @@
 #include "internals.h"
 #include "cpu-features.h"
 #include "cpregs.h"
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
