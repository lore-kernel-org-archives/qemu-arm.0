Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp492366ejo;
        Mon, 11 Dec 2023 13:21:24 -0800 (PST)
X-Received: by 2002:a05:651c:1252:b0:2cb:2c27:4245 with SMTP id h18-20020a05651c125200b002cb2c274245mr1663548ljh.17.1702329684653;
        Mon, 11 Dec 2023 13:21:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702329684; cv=none;
        d=google.com; s=arc-20160816;
        b=BHw0cp/1Xgc+BgOuhBEnfQ/7UFx7STcg4e/OfFxseZNkXod6E/asD6Oe+p4Kr8GUDu
         iBtzZW43MHuNJENeGRSiaLKuH2PLmGdvSVdsfmpgfIeS3VS8FBISg3cPJH/jCPVGdOkr
         dBRpY011JYdQ3Cd97rpzSo0vgI4L/xPStxijQYTvd1GFOSQnfVtaPJts7qHWf1k8InMM
         w54+GPmONeKHopBWbNa+zpIFiHUuGAy+ajEwjNhQC0RfmxN/tjhrCZIOibLb7s2y7tZg
         +kRdvWSUtxiBChjbEYboM6FoDEnJJ0iufM1fSP/VhrB+rVc7NnifIDQ7jra7UGAtigs3
         /7hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=r9l5OJKRIKjrnTI1L+t9VvIOzVTPo5liJg25JIXeLpU=;
        fh=F2M01OhdvobOoOOc8NxVc0+1MEpzFU083WsjyBqzS9Q=;
        b=c2f1pxppJPWT51tbudeHWlOX2EI+tIMOyDMFXAXp25cHELCFZrM3jae8JcdFBWMwql
         Sburr7PumNFXtpoXmwLS4/jat8X9IDENLF5GXAeRzcY0OSHahbZ1uxswGPDQ+eSeuN24
         yOIKIQP5r53IRE/NpSLelOyybYpWRrfoMieq5kkbgoaRv4W2Ei4E7YZSBN04qzxoUfYx
         xxLsvHQ+ZH9Mp5AFcUMlSPeCaSYRoqh+8IhSr25ynBg/8JoyND9yvpw8yQelsqHjts0e
         nSkCNgqDigFpvQaUXaAbvoNZwFC9ZrayxQgwuw/Ise2CfSS/0H6wabkrtLnNubDQbN77
         TNNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ekht9M2x;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id by43-20020a05651c1a2b00b002cb26891d51sor1372268ljb.12.2023.12.11.13.21.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:21:24 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ekht9M2x;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702329684; x=1702934484; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r9l5OJKRIKjrnTI1L+t9VvIOzVTPo5liJg25JIXeLpU=;
        b=Ekht9M2xu9SmnmrS+5dX8//A9nlyyZgDNpAjcvJSdkEGkgoye9w14XxTzErs+pBdaV
         n9+56n6g1rRy0a3EHhJM0JIRo1dLkbkuFsqQok7cWV1wvt8XzBqj2IIc79OYXRcd0Zvk
         LMvTqkD9aTDAzy6jk3vx3uMu7ppdOGwG+Vqsk9/XzyHLkEcDvn/fMPuWd4w3JB+D14vx
         C3Ic3ha0a1Qhp9evboHagvvVdEZmjo8jube4WEt6HqCRV4m2HPwGtHZq0vuh/fKKrvWu
         w0qRo6zg3KJk4OYesTmqBxJ/oAwpxk2Wp559QX05iTmqURpkDrerZGKPYLVDXvkhS5e5
         ZFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702329684; x=1702934484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r9l5OJKRIKjrnTI1L+t9VvIOzVTPo5liJg25JIXeLpU=;
        b=xE9EBwbsAbG2r6qEJCgX0hczfisUzxMtLvl4O/RLEflxfzuU11Ik0Ww3SRyUP19JKv
         mF9r9MwEOC0eE0xZLzDk+UgKZWhtdgaA5kV/Gp5tsyzCvjBlqkKXm6IVVWMy0BW6+Zfr
         J2XpvraBsOKpJccDZXkYkj45aHEBw3LsmuZb+60gfkJLhW/Wre77CavR/w7aucNdeyxp
         MU8CLeFkyjeJCdZuuQ2h9+JeZuoyKAceDavqjq1NtV7o2GVGx5lYSUQKtAFqKY9HtbQW
         +Wgt/coTg4tJE7Hr0175+qcrqlq2ozZZ3P9woZoQlhGt6lhzMRHWgQAUgLZ330PFbkzR
         vomQ==
X-Gm-Message-State: AOJu0YwPzhm6w85LPN+dyfJfZbjaTLKY4xz/QBTHPz3lnEcnTaPeHg7z
	zCnjlNai0HJ/FanEe/lk5/0FytOq5UKmXgdaP3cN8k72
X-Google-Smtp-Source: AGHT+IHERZGHbq34ZdZqIRVkgylt5B/nONQUh8B3Nu0uF7C2GwlPlZ/FOolWwrE0SRduVyan7TqYgg==
X-Received: by 2002:a2e:8008:0:b0:2c9:fddd:df50 with SMTP id j8-20020a2e8008000000b002c9fddddf50mr1843504ljg.81.1702329684224;
        Mon, 11 Dec 2023 13:21:24 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id co7-20020a0564020c0700b0054caf3f8b2esm4037367edb.96.2023.12.11.13.21.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 11 Dec 2023 13:21:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
	Peter Xu <peterx@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Eduardo Habkost <eduardo@habkost.net>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	Claudio Fontana <cfontana@suse.de>,
	Brian Cain <bcain@quicinc.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>
Subject: [PATCH 09/24] hw/ppc/spapr_hcall: Remove unused 'exec/exec-all.h' included header
Date: Mon, 11 Dec 2023 22:19:46 +0100
Message-ID: <20231211212003.21686-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qgtDOuVZdMOG

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/spapr_hcall.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 522a2396c7..fcefd1d1c7 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -8,7 +8,6 @@
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "qemu/error-report.h"
-#include "exec/exec-all.h"
 #include "exec/tb-flush.h"
 #include "helper_regs.h"
 #include "hw/ppc/ppc.h"
-- 
2.41.0
