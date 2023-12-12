Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp864789ejo;
        Tue, 12 Dec 2023 04:34:55 -0800 (PST)
X-Received: by 2002:a2e:9793:0:b0:2ca:6b1:f752 with SMTP id y19-20020a2e9793000000b002ca06b1f752mr2600146lji.28.1702384495471;
        Tue, 12 Dec 2023 04:34:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702384495; cv=none;
        d=google.com; s=arc-20160816;
        b=gMI5Gi99x9JAsMfwJm6+9RedDEFTr9T74boOpDVdG46GtCf7aNA0JMeOi/R9zMYYbm
         QoKOgLT4v4RNRR8sq10OsztBmkfSi1MnMkcBz/OcOd9i2AoLSiLUCzljaU18DLQki4uz
         uIdmlq/XvvKhUmSymjVnTxR0Tj37Rwx1oZ7euvhYYI0RckgD8oWvyPMY72T7xDrrtPln
         p8d6KqS85hfVATI0Jga9nTTxEJkp1MO3rSW6XDeZJGx7hDWf++6pshUS55ISFeILXZUt
         9pQSRG3Jthzejogjno0oMZYq2ODPsiBZRoGXoNlPu7uJSraqwReKMZNfCxpLCkTZ/ilk
         8grw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/FjRv+vnD4PJf/d4rT729kMYrO2SSxTsxM5m/jedirA=;
        fh=vlFEGdij83GYetLrOUaCnR04sbYRvtckD5L7fw5192c=;
        b=jg+e8y0fb+FRF1jaVMLcZsK/dPqaOS1t0pBepqQ2xdwVod1qGmz14tP/fOSarJszOo
         RMP4m8dcY1IQviO6pjBXCRMW5DEazctnucd29boElldME7xR6JdPFh1qLYD1brUPoq4j
         C2or9C+d42yBfeZwegOePRJu2Nf2PgyKdnt3yiIbIka+TUJBVu4nkGggNMH085vOgBm+
         ITH/zuZPuTGrHEzb1ks4lh17vdn/FUBHBk1QZ9L8o5sBg4m9dYxIKmYnzRCO+kjJ8Dxi
         h6ysV/g4sTe+MwRIdmagxu7rBkxchKBtHhdKOEGq09KEdDdUTJo9fgJvx4VJue7Pmnz7
         TFtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pawB+vhH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x15-20020a2ea7cf000000b002cb264417acsor1726562ljp.1.2023.12.12.04.34.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 04:34:55 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pawB+vhH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702384495; x=1702989295; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/FjRv+vnD4PJf/d4rT729kMYrO2SSxTsxM5m/jedirA=;
        b=pawB+vhHY7Afwptrgrz5bIjy9qRIg0U4Y1Yp7RB4WlWkBMn4CgYEDND8AHkCMin1QR
         ovsCMcfDmQXt+t17c5qHortvPNvUjFlTN4Aw6nLJhBykxxNSi2QPoWfYjmbGy9EWgiB7
         d5gIB0m8gBADMNYOWRmmexQ9OKO534OrnsDnSbls9rdFXZ5z4Y9pK2r6xgEVYzKQkdjc
         fAv4TmxyXSJ+/CsDy3FsDFapeHvIl8WEqQW55gXHHpC2O82ha4y9nXGOboaej8Guz1Sd
         HaRYK2abjmUO+NvsXBwNZQ8kmcmjcZwLkbtdF1WsO9HTdxNDhMwrnsP3+oRvFXyRbj+c
         LqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702384495; x=1702989295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/FjRv+vnD4PJf/d4rT729kMYrO2SSxTsxM5m/jedirA=;
        b=vZQE+9w8uhyvR6bAOiKk2qEPI6D0frCjAc0S6vNjt3qL8v0nAuaMdfEQr89qitERSA
         VtXlXSBp9PVBsh3E9QaVDX+bmmkACg10WWxA5gUAhjw1/5DTXxXI/GcYMHQ2tGxEQhQ7
         tK1aDcAwRkSrP8eZBh1jn8jaeEyIQtpXvmyGmQ47iA1XVtRshffmvMdfI9hX7KcqcyAO
         Ti4PfwgHUZlKle8biaaJVsfaVFIgTU9kdlyM40BX9C9QmA8f5cWkFlZ6HpjcasGpkUoU
         fZGbacXWa7PPJFr6/V68J7HbQVV/+c3RUoohDAqrqEdkPwRlyz85+9NYUuoNfkKYHpOJ
         5DMA==
X-Gm-Message-State: AOJu0Yw/2aatJ/2a7GOfH40V22WIn2W5hywnINUhr6o+nV8s4trfydjf
	BD13TlXIyhsI/TLnCKoutaiCUciI
X-Google-Smtp-Source: AGHT+IFExN2m5vaGNnbjku2yUioHYIglD4eGSxmMOFGsUNdvZCGc5nsUzfgEgN+E2fxwONhdqdMZDQ==
X-Received: by 2002:a2e:870e:0:b0:2ca:23e6:7373 with SMTP id m14-20020a2e870e000000b002ca23e67373mr2252314lji.90.1702384495204;
        Tue, 12 Dec 2023 04:34:55 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id bt13-20020a0564020a4d00b00551d6d51401sm42198edb.53.2023.12.12.04.34.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 04:34:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-riscv@nongnu.org,
	Brian Cain <bcain@quicinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	Warner Losh <imp@bsdimp.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 07/23] semihosting/guestfd: Remove unused 'semihosting/uaccess.h' header
Date: Tue, 12 Dec 2023 13:33:43 +0100
Message-ID: <20231212123401.37493-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fSYlTqm/vCL+

Nothing in guestfd.c requires "semihosting/uaccess.h" nor "qemu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 semihosting/guestfd.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
index 955c2efbd0..d3241434c5 100644
--- a/semihosting/guestfd.c
+++ b/semihosting/guestfd.c
@@ -12,10 +12,7 @@
 #include "gdbstub/syscalls.h"
 #include "semihosting/semihost.h"
 #include "semihosting/guestfd.h"
-#ifdef CONFIG_USER_ONLY
-#include "qemu.h"
-#else
-#include "semihosting/uaccess.h"
+#ifndef CONFIG_USER_ONLY
 #include CONFIG_DEVICES
 #endif
 
-- 
2.41.0
