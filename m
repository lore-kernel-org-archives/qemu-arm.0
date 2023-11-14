Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2082596ejc;
        Tue, 14 Nov 2023 06:38:47 -0800 (PST)
X-Received: by 2002:ac2:5ec1:0:b0:509:8fbf:7af0 with SMTP id d1-20020ac25ec1000000b005098fbf7af0mr6274059lfq.69.1699972727678;
        Tue, 14 Nov 2023 06:38:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699972727; cv=none;
        d=google.com; s=arc-20160816;
        b=kKJRuoLv4GAuvOWqbkJjN2i5XI6Q7XARxEiL2V2R4PFXB23YNLlMwhGQrPDdlYRxxD
         uyC1G2GaqWrD4dtP4LFeBpzx4EcL8rYKIhEU9PjITS4IbVefDyifRfvsORnStMjUrWFl
         3SrJfrLqI2M28KmoiAk+SzQGURl2dY2LmSzcASQODY/w3x082oTFQS7AwmGUBlH9WGMy
         CHNpRewXDGotjpnW2cjdy7QwWRjUxuc8OgMjfe6W1uwpYNc0H/2mPBg0cmmFQBMIQ/qd
         J6CUhQ3yormdvD7XV9Sa1HUz+Vz0KS4FsJFVTiV6pJqsHB7bDhcpbiNqf1CFPVQrLtUj
         nl5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=UVR+oDiuZU+TW6PLxAmD0Xj/DK6BF5fQU92EHH5K3Z4=;
        fh=ztskp5hIhfOCNxPFXdx834x7FKrpLw8UMSRnvoM7Mpw=;
        b=JVpuklDzq9OJ8vzBMOe3WNfk6A+eMZ4KaUNfGu4vCI/WSFVzRXxvBi7sMBunkU8Gw/
         ULJx9NBR0DXYcsPIDJAZzV8UngZohjTjA18nYjxk9ESPrEQS5wju/HHwkBAsAJ7sM2mJ
         NKuONsQkIlOg/SMsRxGPhnuVrcjTbZHG73jF78lG94WPSY9582vO+7RPiSZjKSw6RXJt
         1nxUG0jUGXALePrHHi4E35SspWQvKviQ4dFq+2APEhVethy3FmYGJ0sU/qIclu3mg13l
         9kjUBP3J2KIQwGdHs5EQujgbuZbaHZrGH2lsijipUfJoFvwcgpQbGqH9xzk9Ae1QNBz9
         tCSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZkNwRtXN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k24-20020a508ad8000000b00544a175fc22sor1742774edk.4.2023.11.14.06.38.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 06:38:47 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZkNwRtXN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972727; x=1700577527; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVR+oDiuZU+TW6PLxAmD0Xj/DK6BF5fQU92EHH5K3Z4=;
        b=ZkNwRtXNFVdwOM8yXaV02P16bCpjsGq29bKaTmJkj16dvvxRmM5gTJzUN5g4cgTjvG
         ZODqNY7nYsgDVKf33ag2dwf+RZxkNB2+DI9LHfzTmdSiLwNZVeI2K3h9YeapGCeMMvje
         HA/RfNJtt/zl6kiQ6uGJDTvDPbx1LZ1h3hLzevKiWUvIDCr0guzNS4KVNuig0Gagnwel
         0eUITApMkY9piXM8tHmQSwh6DEMVrQSBQIt77Z/MQ7On4/j1oyKtR0Q/iNl86TOIdL+U
         hkHBnP5UuLLVAhrTW6KjhvQhucKn13bb33P0mb6EHks6VqEQDXKm6IuQC1xrL+Iyr/Dn
         ysew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972727; x=1700577527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UVR+oDiuZU+TW6PLxAmD0Xj/DK6BF5fQU92EHH5K3Z4=;
        b=rtyxcXCfWcpuGwqqUksOiLB1qTkx3r5ricyEUqx4m35nTk4QJR/eqwGDHWsV8zR2q4
         C96HmUslIECSy92x6d3fqDrmt3WMCLpSDxaI4nJ0pIXCxRjMSz9M6vpZbuNQCM5lZxhp
         i445Ok62UG/jEr53rU8SQlH1dh7ugxSaf3yokl0cyWc3FiBFLw0aMcp3mT344/RLxtWX
         G6AfZNcaCvQlhQgjrfKRC0GVKvOzhot22h8QgRwNk0qGgDqxdlii7gAW9M4nhm++QdXo
         XQLNvadKqeXII/dYHN3w62TxzwBENxfTDfRORgS/fMIrcuFAG+NBB8QKYjfrEaz6xtfE
         Fj/Q==
X-Gm-Message-State: AOJu0Yyf8sSeiNGSkmYhxqZEoKnWS+TtIlMct6SGHGAx62MAlWQYpW5R
	43Bpz6Mihm4VcRxkgOn7RkQnO7hf
X-Google-Smtp-Source: AGHT+IFU6fMqnyRTdYcaSZcZeeOvXEQ5/pqyJPjwVu+SyaMG1cEZXv2HxBOf7hgBnVZ045SVB8RX8Q==
X-Received: by 2002:aa7:c759:0:b0:543:5a91:a8b2 with SMTP id c25-20020aa7c759000000b005435a91a8b2mr7512514eds.19.1699972727421;
        Tue, 14 Nov 2023 06:38:47 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id m13-20020a50930d000000b0053e3d8f1d9fsm5267242eda.67.2023.11.14.06.38.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Nov 2023 06:38:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH-for-9.0 v2 04/19] system/physmem: Do not include 'hw/xen/xen.h' but 'sysemu/xen.h'
Date: Tue, 14 Nov 2023 15:38:00 +0100
Message-ID: <20231114143816.71079-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: aqq3+l+2Z/RE

physmem.c doesn't use any declaration from "hw/xen/xen.h",
it only requires "sysemu/xen.h" and "system/xen-mapcache.h".

Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 system/physmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/physmem.c b/system/physmem.c
index fc2b0fee01..04630711d2 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -35,7 +35,7 @@
 #include "hw/qdev-core.h"
 #include "hw/qdev-properties.h"
 #include "hw/boards.h"
-#include "hw/xen/xen.h"
+#include "sysemu/xen.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
 #include "sysemu/qtest.h"
-- 
2.41.0
