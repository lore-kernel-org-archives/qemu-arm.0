Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp396548njj;
        Thu, 1 May 2025 11:35:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXAXEQZ9oRVOWTTDSxKdmvEWsqVKBs8TM9UY0xMetkmij0Mpp4GO2xfrIUcWAioxHUC0fj2k7gHNaGyZw==@linaro.org
X-Google-Smtp-Source: AGHT+IHUPoIUR+XjaV4dU/tW5nKZC7m+k4CvDmeBkb71jVlSMZfJVTwfZFwTbBWf4GJLIiPGH0Ma
X-Received: by 2002:a05:622a:2992:b0:48a:b879:998d with SMTP id d75a77b69052e-48ab8799ec0mr90124081cf.13.1746124524690;
        Thu, 01 May 2025 11:35:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746124524; cv=none;
        d=google.com; s=arc-20240605;
        b=fGAuBZePAqUBRK5ndRzApiO9OdEh3xCRIUHmM48cd29MZJXo9vgkDItyXD+uVqnal8
         HPqcfDK+12c2zzZ6JQe3DDmPbMC4jxDZ7zfD75hKJW/k02TZQiWS6624GGUvvjvpe3AD
         dRFBmzk6A1vgd733die2feVsZCy8Y8NVT8X5MGJP0d87Cfld/nLePqp2b3Hxn7xzs9Pa
         oFwwHGwayKepChL7ik8T37J0q1GPzzs6hTRrP5H1vzVk0vgWzaZYHaM3C/zBSYSZP6bl
         PMKIPyqb3MJSP4NJCmZO53nGuPtjEwVEoXlJa17E/GCCE21c3y0iz6rPoxHPXQs8ru1e
         7eww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=a12JZbce1+9GJpbaRrN1N9bSwXcK4gSSRdokzUK1bC4=;
        fh=0iqBRqCR10vuAO3bjiR0+3Yupe5zqIw1MZhIyaam8j0=;
        b=AyPnrvO49hdWDWbdXB+6CPL++PaFdGFIfYo2m8xJx9rZUnNIrv25fqokBS8tbwb86U
         lq4wmHYSKHiHJ6vSZed3uTuF15tkuVxHMKGiM8kbW6h40Yo07YEcm668maYP0yOPfWNg
         ExceRB4hO5sgzoGYtf0Y8hpO2bAQoiqzPh3O/enXgKGVE+tzayErLPfGRsjYRvtB7MYO
         335apPIaE/QGkaU5LMcRqhgz78z7lnofyBqmWI2tl3FCT1kNAYF7s8wLdcblGYFwJmxV
         m5MwaWewUrcopBtk642BdavNGk4HNvYk0z+q+jdM+CSYD4BXRKCAY67HFjY8Nudm7sHP
         H0eQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hhd7RKqX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-48b960ce1f3si11194181cf.22.2025.05.01.11.35.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 May 2025 11:35:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hhd7RKqX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uAYkR-0004w2-I1; Thu, 01 May 2025 14:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1uAYkO-0004u5-Np; Thu, 01 May 2025 14:35:00 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1uAYkN-0007Vm-6A; Thu, 01 May 2025 14:35:00 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5f4b7211badso1908030a12.2; 
 Thu, 01 May 2025 11:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746124496; x=1746729296; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a12JZbce1+9GJpbaRrN1N9bSwXcK4gSSRdokzUK1bC4=;
 b=Hhd7RKqXNBNaDufYsTyhIUFiS0CTOFARE/JCuT9QJlie7fG3S5nUH4mEPLDQ8ywR2V
 qYlPzw+y2J6l7D2qOQyLOSMPVvQWYgTcOUg8qanZ3C/M/SUQSJdLNQ0hV8jAX2d2p5yT
 rfNM6CFSFS9Y9rG4VC0Hky66ibO7i5Nfzc+zEHnwWzYsJ+yGVpiiV8jikogS62Octkvi
 vo8XRYH+kWT29SNmBzP/nSRYMzs9Orz4H1tlE0sB5PNoJIh0MZ4MYUWnV6axhY/ryMe1
 MLrtaR1R/zHPg+hISC06NT87YDYGM37MDf5al+7HsUlkL+2jW8Wi08u3EE7frb0x8NRg
 NmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746124496; x=1746729296;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a12JZbce1+9GJpbaRrN1N9bSwXcK4gSSRdokzUK1bC4=;
 b=mTRJO+JD7PLTRGtSf3fywiEE7gbb258enbxYa39B+KWSU9uHdtWBeby7oGR9kdRp4w
 pDDGWPDT4ubsi2tFSK3uL3aTHqR9VuFvH+han+6DnOxPo2M/4a4/Tlmj1ytTi9hVnVAa
 ip7jfG9YgeHvzmVjlKHFMTdxfGIdUx9cMeXM6dpxIZ9CdxR6rl7DGFv5Q9DOJOHKNjF9
 +oSZrk+5C+DIwVGRSmnrBtX9Ib7V98f/qaTAIiPW5Rzk1wzeR3i22ZFgqCohcBR9URGy
 /DbHF03faSMbziL4rtLx5tDibwfjSrYG1blrvQXITxteo6N+uoEnMy6RlBWNyeBfdL56
 UBQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUCZfFBohrCzKuk6yiq8sBSVu/QKw/NotDDpbT8eep14gznmIPIh6gQASxM2uBex5Wsj+jkCOqkw==@nongnu.org
X-Gm-Message-State: AOJu0Yzk9JrwKuMaZ8O6BEpsZr54RWdPheFN/CToyjPeCja+QSJzNHWF
 UYql4aEKd1JGNcVO0+GVk4/vikZw71M3xRzrMeSaYB5IfxRjFHm6hXh0eA==
X-Gm-Gg: ASbGnctTg6SOS2sJXf2ZV3h04VjerV/Pj+/hCDJC45H8H3VxDb8VUzcWgG9ydpx2SvJ
 7velfR9AmAWLNzEAjnzx6CuxonpP8HHbv+NXC+nEELMS1YfsKA16uRvnJX1PTBon5tmhMrD24vH
 gu83xtgymm5NM80AJY6f/YnmBkal7LoC/XiibC359j12DNC4L+ncs0wE4p8wNyJ04h8hcjgsiBn
 cwh50F9LowAkUujD4CzuJHXrSmaUatYIVsmcBdFMhHzSiddPwRFZ9aEAPNmcvP14aIGU74JWOqR
 f/noWFI7TPSQj0kQaG3OnVxP/zoukKABecwFRXq+aQecFvmFVrkpHB3Q/QtdBMvEk0mX8PhYtr8
 TyPN1e70tZ/Mct6J4Z+PpRySYuW/35kitVcVsheWNhLOTGLaw0QEZ4CjAqtAUgA==
X-Received: by 2002:a05:6402:210d:b0:5f6:f998:3c6e with SMTP id
 4fb4d7f45d1cf-5f89b34d307mr7098971a12.18.1746124495986; 
 Thu, 01 May 2025 11:34:55 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a02-3100-2980-eb00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:2980:eb00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f93000b272sm751709a12.68.2025.05.01.11.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 11:34:55 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 1/3] hw/pci-host/designware: Remove unused include
Date: Thu,  1 May 2025 20:34:43 +0200
Message-ID: <20250501183445.2389-2-shentey@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250501183445.2389-1-shentey@gmail.com>
References: <20250501183445.2389-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EpfBqYo3naUb

The DEFINE_TYPES() macro doesn't need the qemu/module.h include.

Fixes: 13a07eb146c8 ("hw/pci-host/designware: Declare CPU QOM types using
DEFINE_TYPES() macro")
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/pci-host/designware.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index 183f838392..b4bff14579 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -20,7 +20,6 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "qemu/module.h"
 #include "qemu/log.h"
 #include "qemu/bitops.h"
 #include "hw/pci/msi.h"
-- 
2.49.0

