Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3316561ejc;
        Tue, 10 Jan 2023 08:44:21 -0800 (PST)
X-Received: by 2002:a5d:6dc4:0:b0:2b4:e5e:1e16 with SMTP id d4-20020a5d6dc4000000b002b40e5e1e16mr12485375wrz.35.1673369061380;
        Tue, 10 Jan 2023 08:44:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673369061; cv=none;
        d=google.com; s=arc-20160816;
        b=B/K6jjo7wuQcBbqfafAHeY1MGYcb8uDboDEZL5oih8RyRIWgViPezTI9RwGf5+UeDt
         nVQtJhu5HexWbClKG6Qzb1UjqTjfJruSffUtU2nHFuWh7VlfCpbodaL/FqPNWlb5JOL9
         f2Vpt/9UtkwWiHXGnpBAcDnsFczYg3ANAh4aa/aQqMeSDCRJA1EjsZSA9/TXDbGAvjeA
         TkJvVnOViMthvP0JgUIwYTJJekNoRArIHYrXW/SyRiu3HBYrxHOrP15cial06Axsmftu
         fg/ahyRru79oPX0lIrwLwnFrrZmZIeGQlxWC+/VTk/HaBqkC/PxqDUanc3cbvWFPbZP/
         RT/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RJ8wFlbkCuBgTPhkpS02wBqGPirVNf3PYtskAr/LCCE=;
        b=ciIF07q5FyQqcqq4GD80e634Nq4AgrcukVO7zz4lKk9axcyFvtUqdFOHpPhE46P6Ja
         BWsFFVaPGHSCp7ID+6gJCusKChbRhcBNv5LnhjeDIoUVzgYVZ5139ydD3A/dG3kd2vyd
         CmIian4ZBIkpuNrrtpxW2krPvEEOPfP+HNd1AETFOevEPp73WFU9QsIDY7XM17f62Q7H
         kEKrOZD6SJKLwB+R56WI/j27x2SDp2MAg0zvWd/35t0dzORnVRX8/GpFV866ZpiAuq0e
         rUnvAfo1b+hye353VAQ9oMFNf6gA3cXKyNDy7BnM+17kIbonLG/tZ/hEV0a8GUTNv25u
         xKrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mRg3DM3p;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bo26-20020a056000069a00b0024200000824sor4449524wrb.16.2023.01.10.08.44.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Jan 2023 08:44:21 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mRg3DM3p;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJ8wFlbkCuBgTPhkpS02wBqGPirVNf3PYtskAr/LCCE=;
        b=mRg3DM3pKklnsH/FYEFsfhVVICQlHUW70TjETQcvRMf14l/KNMtX+nvCCf8J7eVgyq
         hxDRPbdw587WEfdC5vU7DgooInRUJqkQNgJKCswMo6AFclMrjuTzCE9AnnFoTvyQsyxn
         RXSLszesIfnWOVSmXXu+qSARorP8wOcYs84JrrTmtvTGQonQgnXkKOoLPhRKpjpy2cSY
         sqhs3VWtPV9VNTlF63bapAv/ilt3KxELMgEJz1rWAvcPshNn91vJV5W0BkH/BWQO7OsL
         LKPAqSdMSz6IH6tjz45ioRRPWe0YfI0qiCqFNavBPxe+ZYCM62CKWhrPfcuZb7gjipYU
         DmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RJ8wFlbkCuBgTPhkpS02wBqGPirVNf3PYtskAr/LCCE=;
        b=s/DKJNC+P7erNIASgmqnHZlLWxjjJx/+TW8ARAE+blJvIzVtHACUurvLkGdWPtG3J4
         GXe2HdHiJi2JMKKZhUjM4gqUvMYefHnQ/FPR+5lnwRg6h8MJWTPbHlGb4r9v4RRiy8VL
         ByGpcHAPmVW1aA2UJH6zRNh73WlRJ2VyKCKkcJNtZ0er1EIiy9794Ir8mw5KaSENxpbV
         r12i4xOif7jHaxN1qcFuALYWYUg8AWaV9H5YMLErlCfZQTTgZ6a54P+6WujccOXZdL3l
         +EsdGaKjn1mgvEwLg72CS90JGdero9Ju/aIkrcIaGWhUMNRs/x7X7S6ncy1FvSWPL5uZ
         dbFw==
X-Gm-Message-State: AFqh2korzWo1i1TT+k9H76mVthsSd4WRh0GssdQkzrcYmiM+3BZNeo86
	eunUOfQ3VXRbkkRCwxq1iD3UBvek
X-Google-Smtp-Source: AMrXdXsGhVoyxyt0kHlysxuBEsNqCPC8+G7cvksF6WPcgMowSJCh3kzFKBqfAf9irt5iIn1sDNPS7Q==
X-Received: by 2002:a5d:4b45:0:b0:2bb:ebc4:2f5c with SMTP id w5-20020a5d4b45000000b002bbebc42f5cmr6001855wrs.43.1673369061208;
        Tue, 10 Jan 2023 08:44:21 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id e10-20020adfe38a000000b002bc7fcf08ddsm4280686wrm.103.2023.01.10.08.44.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Jan 2023 08:44:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Antonio Caggiano <antonio.caggiano@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Beniamino Galvani <b.galvani@gmail.com>
Subject: [PATCH 02/18] hw/arm/boot: Include missing 'exec/cpu-all.h' header
Date: Tue, 10 Jan 2023 17:43:50 +0100
Message-Id: <20230110164406.94366-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: XiXiiHzDiyrY

default_reset_secondary() uses address_space_stl_notdirty(),
itself declared in "exec/cpu-all.h". Include this header in
order to avoid when refactoring headers:

  ../hw/arm/boot.c:281:5: error: implicit declaration of function 'address_space_stl_notdirty' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
    address_space_stl_notdirty(as, info->smp_bootreg_addr,
    ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/boot.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 3d7d11f782..f5bfb922b1 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -25,6 +25,7 @@
 #include "qemu/config-file.h"
 #include "qemu/option.h"
 #include "qemu/units.h"
+#include "exec/cpu-all.h"
 
 /* Kernel boot protocol is specified in the kernel docs
  * Documentation/arm/Booting and Documentation/arm64/booting.txt
-- 
2.38.1
