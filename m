Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4294292wrv;
        Mon, 15 Jul 2019 08:22:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw6rvZEZthIm7YgA3MaBkNTpbjTocM8GDjL2/OuY3zlODxxnkox3drXC29FMCw4sQIJnyED
X-Received: by 2002:ac8:2bf1:: with SMTP id n46mr18153722qtn.372.1563204178572;
        Mon, 15 Jul 2019 08:22:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563204178; cv=none;
        d=google.com; s=arc-20160816;
        b=ReVtmP7PQ1Dla5EBpmRZzP+rk4D62N7dnGNqJf6Wt61JekyVJE97MqbU3pbkn625Fb
         uAmUuRyJZx+2pLbfd1VgLyr6sCKzRPHs09QllADM/YFLW+B6nIMmoO17RxQqfBKvZsv2
         WiIuoaWxGx1mm+cHrb7SXaS2lVF6Ormyo5K1WABRk1EG/HKbfYnoN9ghbV7jLf2Tz6Qq
         FHg156MPNbEF9PNZ9fgWgJODT6OlB+0DY7ifiYW4juCqq2tWVRr8zgdPYZ1lFApT2F71
         3wOoZZWFp3e4H7n+Uelo+PCzsB7hGp2ZSBMuieaFw7CtM+FwJ68oteJAjhprD5PSY2Uh
         cr1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=dCXo/N/emWiO0yHtU3ugCXdk21AwD8P6xDS71/yqCXo=;
        b=gcXqiVVG3UUUacluXxWFACfq5al4WE2Z6PVRlJzT3lh6y3Ry+4Fv2tE8wGzO2KnRhb
         4cU9xMogjVA1CPDpUq5esZmSHCuSwYeKThT0/axHt9RqJSq12sAf8XkDNliuigP7kdOt
         FbQr38P8cVP2chXDq5pqUhW0dbOkREoiu2BVe6LQTDYc13KTtDw0D4FJXsSvU1b4wKNd
         H4e7hYvyOn8wSHbXtJkToYCrR8awZ/pTDeChD+YykGJOuqwGCM8A6ueMOCRyjfsExizy
         1v7msN+1EWOKRjBsK1w3LfrbuTSwZk+Op9OoGuqQ5n55QO/c+Lq8UArif5qKaC5/XdoV
         FX5w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id m10si7211626qte.157.2019.07.15.08.22.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jul 2019 08:22:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A075481F31;
	Mon, 15 Jul 2019 15:22:57 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.87])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8BC3608CD;
	Mon, 15 Jul 2019 15:22:50 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	James Hogan <jhogan@kernel.org>,
	qemu-arm@nongnu.org,
	James Hogan <james.hogan@mips.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC PATCH-for-4.1? v2 3/5] hw/semihosting: Allow this feature to be disabled
Date: Mon, 15 Jul 2019 17:22:23 +0200
Message-Id: <20190715152225.26135-4-philmd@redhat.com>
In-Reply-To: <20190715152225.26135-1-philmd@redhat.com>
References: <20190715152225.26135-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Mon, 15 Jul 2019 15:22:57 +0000 (UTC)
X-TUID: 458ODinKe8qm

So far only the ARM/MIPS/LM32 provide the semihosting feature.

Do not enable it by default, and let the few targets requiring
it to manually select it (Actually only ARM/MIPS).

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/semihosting/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/semihosting/Kconfig b/hw/semihosting/Kconfig
index efe0a30734..61edb4ada8 100644
--- a/hw/semihosting/Kconfig
+++ b/hw/semihosting/Kconfig
@@ -1,3 +1,4 @@
 
 config SEMIHOSTING
-       bool
+    bool
+    default n
-- 
2.20.1
