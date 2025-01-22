Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp654865njc;
        Wed, 22 Jan 2025 01:31:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVtotd62x2iAbKbNX9CdCgoae8N0egw+M4dDas3vOK8ul1uwkqkQNwMQZgSGkTKGQfieVR+bASb722RQQ==@linaro.org
X-Received: by 2002:a05:600c:1ca9:b0:434:f297:8e78 with SMTP id 5b1f17b1804b1-438913cb65fmr203127985e9.7.1737538263214;
        Wed, 22 Jan 2025 01:31:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737538263; cv=none;
        d=google.com; s=arc-20240605;
        b=Jza71JvKhxlVmgglMQzOl6nkqVW9TgWcemeKnNOivgva3tlrJhaqT1h3bxTJxhO8vY
         vMyXdVBssjM5eDU7teIM+wnYOAfIoZMwLSJHFLSaqlQurf819k/xue0H4iHBGgEbBt8X
         M8fO+hei9wZsh936riZC/jmwbcmmAkDoLmS8hxMoDsL6gt50Tnl/UqKOA7vvqAMezvz2
         ZxKS+l6DnWfhPIUv5cUbasATILIttI/hnKtZVGPEKTDpc0TbwkI446UgDjRiilcAsdKl
         g6TyygBs5SuETuKE2wNZVOePs2d6MOrZE99NtUTQXhNd5a79EZKgb3TRsiJLGbv2xMRF
         0q2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6euSBLv31aJZp9lvcImTSgTbDVlnwvaPYw0ieO+1v6o=;
        fh=/IfekhtnFA7STIo1FqJplBCFMBKPt+XWpjOak8MC7b0=;
        b=AzOC+0QD2FYWTCBYLWLRXGVETGKiskELW1zmdxRoGcYPU2VP1S2SkYuBT42aOvUQAv
         M6ux6nZukpK+AEdTEgpWE0vVR9WcEP2RUCDVaSCbM480peMfYOX967+gk5dEtDF9fK/y
         7K6nRJbhINJ+i1BkNMZYLCuHhOzapDLXvmTdOwHAwzTwaYW46UxDhNg0hbu2vWjkbvjj
         LMcgSirV7scO2dqQmP07N8cPxaAdn6jfKuKIQnOw5ClJsmNuWtVfhCCELHGnG4L9CrrZ
         +Bh+tj9F/nn727qhdnRXm352dj5tZLOgoe23PlpfAvOwzUSu3naGcfjqk1HPPULmnE8j
         QWcA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G8KM47dM;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4389049ae76sor51481315e9.11.2025.01.22.01.31.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Jan 2025 01:31:03 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G8KM47dM;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737538263; x=1738143063; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6euSBLv31aJZp9lvcImTSgTbDVlnwvaPYw0ieO+1v6o=;
        b=G8KM47dMn3jTfHphRtH62PA0Ot5lELLURfo9azxtBA4uFDPxmsfzgqVvHvwabCKZqA
         M0WZGuuS1xNs8exd+SfWmuBREGsHkQWvRuw2JcRav6QnSxmRT/i+4M3nLYcMUGCpBGoV
         wm4PaKOCtzmk2rwA9iJvEH8oR5NcGTxN3Sy7cEEmjk6bhrZhNiWquwiIMgfWf8L8OylS
         zptQrltp8rT6qdVkwzwEaS7IDBazwTqAmRoYBvr3WN2oEb1QrsXfw2yAG/2NTvGvMP1i
         ypZi5Vc3mo8nudoN2XvssQT0zJj8d29JcbF0smsm+KnbOGznidwD8jk8K0+xgW95VgO6
         awoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737538263; x=1738143063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6euSBLv31aJZp9lvcImTSgTbDVlnwvaPYw0ieO+1v6o=;
        b=DLgjOV4aZOYER1eNvkGqBVXVuCFL2CtFa1Fl1EwteGNSCVLk1FKr8cGjkF9ydq0z1E
         5wNbRVy1v2tUSHDP9KBciVrkHzinF2cYU0wqHibx4BHp7maW6nl1esP70p4C45PFAztD
         lCGE30K8gc8sSBdNKAMUfd2wXfMxHI2lsSUPkwoowiq8rwXpJvvp8l6efVZ4zgXTfnKK
         Wd+yJdBwygPassY6VvDgh/GsgKF3p5wlrddnweOBel/kiuhRmjhjzz2lzcDtE1C31xSj
         kug4VgalzKYFleDwJZfm2QQxojaeEnIAtpnVuDB3GjjJAdEFM+OdIYsJumFrDp+maIT3
         Ss6g==
X-Forwarded-Encrypted: i=1; AJvYcCURC6WmpIRk3FsvR/v67y5pK59ZSh2QXIasSAYDDPl3EBLuKtmuYh4/pQUexvVncagL8OfCsW5K7YQvSw==@linaro.org
X-Gm-Message-State: AOJu0Yz76HCqrb8IVrDdk6+TBOjQz++wmvjA1qFB4E2LhM7Sy6KLx/9V
	60N7/CDkFTgpDm5uHbMjTbefqn8vzYi0GE47e3Uj3s5jygUg6T6JLhav/uO9Wlhwtg==
X-Gm-Gg: ASbGnctwaGRwiF6RGI6jt7SOQch/U/3keIWOMd7IxRaur8CFVGq8IYb5T3LScCl2Osm
	RiumQLak5NqGE8PX4SO8ky+bWsQf1vFTmT+bV5OxDY4T1KH7hqMUHkvy+2KAWtURbm6vkNqzBWX
	juLy/no29Rg2nEtHT2DM+XtTkOQmEwVlQygXv8pyLmMbpfy+Sv/VyT74D6ddp/yVWxQOmJDExaW
	1FNey9qFmjMF19r79Q5c2WmZ1IER9mXB1tyAMDh4hbyE4pmwYVgnK9vI5n+d1SLXDWse1o83k48
	OaNohPFq0rU8LUxTLDPQm4s/OZJXx1ePE95uo5EHx0hl
X-Google-Smtp-Source: AGHT+IF2JvGRnHc2kBttL0oH/jSFC9d4hSmVy0jmUw3+QS0SDdp5u+fq9MN06CLSXLDViVVLuT7YAw==
X-Received: by 2002:a05:600c:3593:b0:431:5632:448b with SMTP id 5b1f17b1804b1-4389144eed4mr166904965e9.25.1737538262741;
        Wed, 22 Jan 2025 01:31:02 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31adbccsm17547875e9.19.2025.01.22.01.31.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Jan 2025 01:31:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 07/10] disas: Prefer cached CpuClass over CPU_GET_CLASS() macro
Date: Wed, 22 Jan 2025 10:30:25 +0100
Message-ID: <20250122093028.52416-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250122093028.52416-1-philmd@linaro.org>
References: <20250122093028.52416-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: znSv7jGCEYra

CpuState caches its CPUClass since commit 6fbdff87062
("cpu: cache CPUClass in CPUState for hot code paths"),
use it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/disas-common.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/disas/disas-common.c b/disas/disas-common.c
index de61f6d8a12..57505823cb7 100644
--- a/disas/disas-common.c
+++ b/disas/disas-common.c
@@ -67,9 +67,8 @@ void disas_initialize_debug_target(CPUDebug *s, CPUState *cpu)
         s->info.endian =  BFD_ENDIAN_LITTLE;
     }
 
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-    if (cc->disas_set_info) {
-        cc->disas_set_info(cpu, &s->info);
+    if (cpu->cc->disas_set_info) {
+        cpu->cc->disas_set_info(cpu, &s->info);
     }
 }
 
-- 
2.47.1
