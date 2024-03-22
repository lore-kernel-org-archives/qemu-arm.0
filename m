Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp1285650ejv;
        Fri, 22 Mar 2024 09:14:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWNGG6SoqVNZesALUbDJdEibIM0yBmcmWqeknz7Fxu/x+LWCUmSWC2gHrdZJeuRIIJrdmrJbUoy9fFWZuwyMxrV7m3R1Faz
X-Received: by 2002:a05:600c:45ca:b0:413:133c:b9c8 with SMTP id s10-20020a05600c45ca00b00413133cb9c8mr2029492wmo.33.1711124089524;
        Fri, 22 Mar 2024 09:14:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711124089; cv=none;
        d=google.com; s=arc-20160816;
        b=W7mw2R5qbXLaCYier7lFzLOr0S+p2fxitPsBwysAlVLMDho1ajJB/tn10UrdZe8a2s
         bP7L+6cV+1iozXxOwqDJcn55ls3SPO3ydV08wK8sLf0guH/iMff07TL9pZ6OcuEtLh7k
         QP6rtsMXJnyg9PNnrRSq9BmGoFj9lLcTinBK7F9HD6e/lSkFQzNsorMwiqWUDUK/sihX
         PAPpLc9gRLAa3KS9NB/6IYtd2AefEp35O13jpskZd4SD/0WAcaPoKbjz7Pibsy2dMuSZ
         e9ffncNfcJ4hmjnOyWSKlOx4JOz/pVFeRjZyt3X5ws0n4Bo0RvSd95xwVETXer0xGS/g
         WNoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=M3jectw/kExol21Tl/VOhcbnait7BaHf+x9145daJsc=;
        fh=Nth/sfpGyAYSUAYurQTL8Pod1z+fOOJaLGPKwEqTotA=;
        b=fenFyotrlqa8+0IjpJF7RWXGPCl00scELusZfuhlarhJk+Xzr/dNfk5f8XZlm/BFy4
         kYHUlP+2/YUlbaa8gA1yCROcsMu0mGvAXgcXRQBl3APSr/TWV3rxbmMY24In8fqxXe9D
         icEAKsdj7tuG5ouCkM/H4FsXRxKW17UZ1ep/hh0DSkn7ViZtuxuIm+g46V+vyuiKt/uM
         fJBG/3dOpm9CgTLVNFjHkxPuHi+e6Ac+Rg0ExiBdBkxnG/Xc2FKN5TrVAI44mSL4UZLZ
         yZFQu+tKUPNj1c7WwZPvh8W5TU35H4OZIVwGebgouq2d64Dh4y6o6BFmV+06BqP4i6XR
         S1Yg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=luIrw2w1;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l40-20020a05600c1d2800b00413fe7628cesor721217wms.0.2024.03.22.09.14.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 22 Mar 2024 09:14:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=luIrw2w1;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711124089; x=1711728889; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3jectw/kExol21Tl/VOhcbnait7BaHf+x9145daJsc=;
        b=luIrw2w1qwz8UJmp07pzItoFFGviJeHXofiMeevcLKuYKTC+tgDnfxF0G4G0WUC5yA
         mjnznBVAn2mGCbJjOGQbjveb8kuuLJ6qF0f05weWxGIMN2Nd1H7pyyYRWrvgaKtVAO7v
         o0mcxdh7gwBGiyTO5s1nzmKmyTmY+/JeEvT1AlSrefACJeUWodkO4mYB1fkvwl9HNLdg
         2Pu1clgEz1ZrggSZ8aqnDd02vXsFjGvpfch6a3q0NqU8Yb/3qvGqdXC+O0TO1cr88sU+
         iYnUqlhKvj/xpJO87qQ2L1H9D1H/EjC1xVenrhJCXiADzCEvOz8ZaKwcrn0e5dfaR33y
         H/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711124089; x=1711728889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3jectw/kExol21Tl/VOhcbnait7BaHf+x9145daJsc=;
        b=D9vuM9punaNvJeUgqzvIAlka6Ehs4T2wZlMEK2WL9lkNXBW2SYsDMh5NlDuOWTcH8H
         T9mLYy5Qp9L19qn5CCZKNn3+EnOpLtuppV2zu0IAD+tVy0d0Kzyrp37U4TsG/t+VmBzq
         t8nmDIN66IDXOOeJKQb1WNSyMUYlO3n385TYynE3948BTo0+E2KzwAB3c0GwRXGfZCnD
         UattY9xPtEBdi6Xb8LVa/vwOa7eBLpT+Wxnk1hq31OoWe4m9m9xs9KliT+79vW9moHFL
         a2mbTyJyeVP28e/YKEHmSr7+olNvpiqv+bQ1tADFYaSUVK6CbZVwy8ksvvSPJkdoSf2c
         Ly6g==
X-Forwarded-Encrypted: i=1; AJvYcCX+hknshJhJktaQQNET1xXbcpAXgEAnULRPrLtDYzw7d99p9ziK8w68lVaibMbKnOMPSQa7OjB7yv6F72Za16VrvzDJnRGG
X-Gm-Message-State: AOJu0YxpxvK1VzYV/W22E+bhidCeMQhYDmppGTMEd2aSa0/E5Pm77ZAM
	w1tzApNYUvgb5aeHatvyCyNSbR4Mp1KDQ2hvAMNHJFeyNLQzutEic56tUmMxYp0YyUqneGNFZa/
	/ALY=
X-Google-Smtp-Source: AGHT+IHnzpEOVwPDsBW32NjuihDhDnLtCe0iw73ewhehZA9lITU/6L8eY957zXmL0DGUCSwgDESxUw==
X-Received: by 2002:a05:600c:5617:b0:413:315f:9e8d with SMTP id jr23-20020a05600c561700b00413315f9e8dmr1991336wmb.18.1711124089140;
        Fri, 22 Mar 2024 09:14:49 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.178.251])
        by smtp.gmail.com with ESMTPSA id j8-20020a05600c1c0800b004146bcdde06sm3530094wms.6.2024.03.22.09.14.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 22 Mar 2024 09:14:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH-for-9.1 v2 1/3] gdbstub: Simplify #ifdef'ry in helpers.h
Date: Fri, 22 Mar 2024 17:14:37 +0100
Message-ID: <20240322161439.6448-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240322161439.6448-1-philmd@linaro.org>
References: <20240322161439.6448-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: RblxPSOmq++r

Slightly simplify by checking NEED_CPU_H definition in header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/gdbstub/helpers.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/gdbstub/helpers.h b/include/gdbstub/helpers.h
index c573aef2dc..53e88d807c 100644
--- a/include/gdbstub/helpers.h
+++ b/include/gdbstub/helpers.h
@@ -12,7 +12,10 @@
 #ifndef _GDBSTUB_HELPERS_H_
 #define _GDBSTUB_HELPERS_H_
 
-#ifdef NEED_CPU_H
+#ifndef NEED_CPU_H
+#error "gdbstub helpers should only be included by target specific code"
+#endif
+
 #include "cpu.h"
 
 /*
@@ -96,8 +99,4 @@ static inline uint8_t *gdb_get_reg_ptr(GByteArray *buf, int len)
 #define ldtul_p(addr) ldl_p(addr)
 #endif
 
-#else
-#error "gdbstub helpers should only be included by target specific code"
-#endif
-
 #endif /* _GDBSTUB_HELPERS_H_ */
-- 
2.41.0
