Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4377008njd;
        Thu, 3 Apr 2025 13:40:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVC/q6y6jOIIhWYJu/vHMpziwpWu49U55n1KneF8D6n5l6DUwdT0hZmy8UbPAofl6ECOeKmiL3VMyDbBQ==@linaro.org
X-Received: by 2002:a05:6000:248a:b0:399:6d26:7752 with SMTP id ffacd0b85a97d-39d0de66ef0mr157023f8f.38.1743712848866;
        Thu, 03 Apr 2025 13:40:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743712848; cv=none;
        d=google.com; s=arc-20240605;
        b=G3y4aEqrdPmauRIiK0FT+iftBOAInVXl8DqVCVAe03RCn+7UTOW2hakGI8Qqtf/TyW
         hn5GuTJPlA8SfesBvOBzzg2JvzvvKAKazGTBwSeSW9yR0X0I5X1aHBusM0gB+j+TWQ+C
         /9zD4EJAEeFFzmkoNuyLqRnNIr3U6ts07wxsnfTXGjVTh/WhXlvvHi33pq0JRzZ1+WBr
         I+3snezvZckoECxLdVFlwnfDk9uNlQ2pluKQgZ62A0fqjjchCB6JeWFl48Wt4DAiz+rI
         lgAFgwkTaX9rc4fq/xFktc9f/+F6kQg6dILNGmYXIjaGMjKbLlrLwM02tSlVnghUOitT
         /aMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=SuT3rRChRQlFqOt9wOfD9dqVNsRbmscUvrlQveNmeCQ=;
        fh=vH87eeI8eZ3qcr42zbpzdjgeOdAZgnDK945y1P8Lcjk=;
        b=jD9wJ6bBKfJQrG3IYTyh+E/d4p4FPVVrqPudwmMg8YBouoogokdh75xsipKklW7PF3
         SuUpC/u2lb7gPyLtJ3yescXVxF6KGPLnW7yepCZBTrXatJcdewWu65LDhLrbSdLxfYE5
         yQTeBBC6mlevqykg8NaVhQmOnKOLLO3RGFgUt8qiKOOm01u4sgIrIFy8QVU2e81K69ha
         S1XBnDUJ1f/n1jFKEHU83jSeyjieRFngOV714c+2q3lKMvxTUVjR7uMHO60W+jxSSXgG
         61S13EeKg3HAhoJmaP5qoStfQKQFDbXgKcMsWwzaWhW3Wg03F14ouM3tqX3ZmKy6lbIV
         UjaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qkt1Ozi4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-39c304a0506sor870510f8f.9.2025.04.03.13.40.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Apr 2025 13:40:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qkt1Ozi4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743712848; x=1744317648; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuT3rRChRQlFqOt9wOfD9dqVNsRbmscUvrlQveNmeCQ=;
        b=qkt1Ozi4JS1YF03/sDqAjqyD9VT1YHgKejiwPZgYEI762sA6xjk35/Uhfj7KVHXOIp
         0pkpDVHf9EF2tH2oKwEviKwaLwgwpWrs0c1DbEHW1V4fjd/84FBJoF5USp4s2J5KIDvS
         KakCWvnrLMiixf7ZjVa0e5eNcmCQNBkWaMSgP0QkhWUfotGm5uP4vICJt9n5UFfC5K+0
         zF/dzzQsNcO6lmsuZSscT16h+SKu2AfSoURdUwnotfhpjip29dluYSL4nfAUdjX7kde0
         ywv0PAdZQt4l8ipyEpOR2dfQbmFpbio5ZExsraP7tT1ckBO0kg6WD+C5eFlLQ25h+wNg
         wkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743712848; x=1744317648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SuT3rRChRQlFqOt9wOfD9dqVNsRbmscUvrlQveNmeCQ=;
        b=Ym7rhOY9A94F2oCCBHdBIvj1HEr5nh+mWRee4BLmwtvgfMDSqGf3OvFnPD297NkdZm
         HVLyRw8gAI8WEB3M4Xit7joV0HTi1WG4inYm7lfl3ggRYt6Xn8YquMAn/W3NnQ+b3mv9
         r4aBIm+WEQvlSjUj/kppip0lPQU6JShShWcwiUn2JdvG2EI7giO2bb4HTPvKVspYh0ZZ
         hN6dbWipMWLOqlfcR936AGnwakAm1eKrtV7eXa84iwVHTWv3wVYEHyaiKWEpTraUXEc7
         8FFNc+STxN9YdBFDjVGVP5RQd8hcVi4NSWD+cfcmqYUuvYbdoGPol1zPhz+Ue6pCNrIj
         L7IA==
X-Forwarded-Encrypted: i=1; AJvYcCUYmpATt5MfXcR2ZK4qN8HCekM0V5+nLsf3deWYEdtMawwgkJajxWdmw6Swb6BZ2S6hG7gGq3Gh8oWa/g==@linaro.org
X-Gm-Message-State: AOJu0YysQB3igSP10daNULbIWe37YSN4ZdF8owz4oW6lKbrL5wKfOEB0
	SebTa9Hb8yoZKrZhPdn73y6BleZYB13s2hMZyB1doeiAZ/ae4UNzdfwI+Q2TR16hmA==
X-Gm-Gg: ASbGncu3HFTkn3+tJdfqxPnMVLywjp7JlMtzpC5GfM0N+Tz8vIoSpuz9HlPTIPjW5iZ
	CN1BMjj7P65M0nDGHd+h8KGEvyD6y+NSj01941ej5pBpjyHbw6MMZUFZFKV7NLtlPuPl3ekHyLM
	RnOja2eLHXv6JnGKwwAyWeyZ8KHGocJUZCIaNfeFvK8mEWUdiu+ZGO/4qFtl9TKJ5SGj6pEvePK
	/WtK6B5gnY6FKd5ce1v0anBiyvcly0dG/6izlu0iPw7bQ6fVZFS/MVYKQGqjfPOprLBnNPxkUtt
	RE68KdwCHc+B98Lj7BatAxUQHGDbL7WtyP6NM158w+7mMs7SRdVE3fSOqyXJalm265ExsHbVx/r
	eHyeYkTHlD+wzEw07MPBnhVCs
X-Google-Smtp-Source: AGHT+IF2VMf4EDjDDN59fjDN+tbSx4iQ6z95AwQIjihuuUbgWCnpzmAUquWXDrOlNBosmQV55armwQ==
X-Received: by 2002:a05:6000:4402:b0:39c:1257:cd3f with SMTP id ffacd0b85a97d-39d14663264mr123060f8f.57.1743712848318;
        Thu, 03 Apr 2025 13:40:48 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34a8d67sm27667955e9.12.2025.04.03.13.40.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Apr 2025 13:40:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-arm@nongnu.org,
	Udo Steinberg <udo@hypervisor.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Igor Mammedov <imammedo@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Ani Sinha <anisinha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH-for-10.1 v3 3/9] hw/arm/virt: Simplify create_its()
Date: Thu,  3 Apr 2025 22:40:23 +0200
Message-ID: <20250403204029.47958-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250403204029.47958-1-philmd@linaro.org>
References: <20250403204029.47958-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4ZUdZouGSsaH

No need to strstr() check the class name when we can
use kvm_irqchip_in_kernel().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/virt.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 177e9e0eadb..326986deb16 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -711,21 +711,15 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
 static void create_its(VirtMachineState *vms)
 {
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
-    const char *itsclass = its_class_name();
     DeviceState *dev;
 
-    if (!strcmp(itsclass, "arm-gicv3-its")) {
-        if (vmc->no_tcg_its) {
-            itsclass = NULL;
-        }
-    }
-
-    if (!itsclass) {
+    assert(!vmc->no_its);
+    if (!kvm_irqchip_in_kernel() && vmc->no_tcg_its) {
         /* Do nothing if not supported */
         return;
     }
 
-    dev = qdev_new(itsclass);
+    dev = qdev_new(its_class_name());
 
     object_property_set_link(OBJECT(dev), "parent-gicv3", OBJECT(vms->gic),
                              &error_abort);
-- 
2.47.1
