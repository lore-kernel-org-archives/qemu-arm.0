X-Received: by 2002:a63:e30f:0:b0:373:a7d2:608b with SMTP id f15-20020a63e30f000000b00373a7d2608bmr1425064pgh.102.1645655526915;
        Wed, 23 Feb 2022 14:32:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645655526; cv=none;
        d=google.com; s=arc-20160816;
        b=yl1NSpK88P6R8EucaueYm1HTXjNKn79qtlKrgi71ZCDa+4lRryZume9iDPLETtQc2O
         1pYezGoWX5iBTs1jtLNNwfy2dgHJsHcP9Y14QBU9x6Oka7S+F5ZcHAzMaQFe/oUE4vQJ
         q1PcBvi74NsNqNuaz8DUho9hfAnr9NF/1gVyt8TUXRnOx51HfmXv69Q4vMZW3V7vX0ct
         UxWvizOwc7UWA5O8U2rdaq3o+Pu9jZcQl/dZO/eiEp2PU8ywsyfqXUHITSCINJXyDHCc
         q6VhpHMYD1kW2SMzurRzbFu7uU2jK4+Tz2AYhWRE5mcFVHzssqfLxQTQFBfkzni1Tzy8
         IIow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mWBxuwt8V3FGFQ5JHqGb8ST2XOZhCQVYfBFh0OJ1LZY=;
        b=Gl5W5hGypAU2BYC8cx7GNBlpbhW3rc+1b0C9X0m+wcUoydjreKx12CfmTlkDyffeYb
         ReQyHnDX02EPrAEteLJcByhWeBBEiqZgMxgW5SIOuLPrmlMSf9jtpOLf6o9/uOGtb7ke
         7eB1/iZPZfwVqYyPvlYCcFZUXlqvJHIHAEwixjvAMoK/4/PsEeTMnio8nZwSXGGzx+T3
         XXcaYl6yr4UqJmcTXvWBdwhGgW/HEuj3ehkvWi70/3two0B9etSeAd8tXdRWn2DVSp2W
         uVNOuzxQCPAZtLM3pVdJk+yVm7S1YTuWYIUHgSGLoLBN+eF5jjBdNf5OVcs/VMU6+TF8
         Yzlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hTKynpU4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y24sor554157pgf.67.2022.02.23.14.32.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 23 Feb 2022 14:32:06 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hTKynpU4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mWBxuwt8V3FGFQ5JHqGb8ST2XOZhCQVYfBFh0OJ1LZY=;
        b=hTKynpU4Atz5CQAPq4e1VBoM/n3yAK6l9EAAFoCfoay8cSuB4Tqvb+K72ISi9BSJX1
         XlWvYbk560KMVvprHxfct4DKelHCbncfqoPiUZxmBCw24AmTFEc7KP6s9+gWrUF/HpsK
         bsHc7w82jzDe5F6HmTRYqE5YeHrhTQL5XdcI6tkzcqCTlwcvLTOUv1+wTxqAQyVUZPKB
         jlyFXmdAYAwET/LhRgq9Y39iL4ACpgUdwOpGMzPQeuv6P7bPjOjiHz+N1bxuS/+37dyu
         Eaz878KttbQb6ZKenbSz1RJYdghtWV6NA7yMI3KPVMbKXHGXNEx7PrHnfuVvWqtVqT0r
         RKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mWBxuwt8V3FGFQ5JHqGb8ST2XOZhCQVYfBFh0OJ1LZY=;
        b=Pa5xWSHvyBnp9208eLRV18dIxDvoK8Kdc/vdCPGfvtuwOJP7C8XKujBLRBfDS3zd/J
         AXGMs4o6+pXeBEAYqx0FS8GgHr3Rri/Xrnv1NHNlC09w0RTVPwBbZHPBCj0UxTgww1ZC
         TTOkjDyfg7GH4Le5G+rP34nB9eAjlCJA/9keSTenvTh8S1yb1luq868yzc5Y0njfq6Gn
         57f7aNGZGrIG38yWaxbDQwslMSJ6YvXdBsAAEHqgkDjDrepja1tTKSFGCVTlqFoBx+w8
         k/aCG82Udgmbplze/+Nc17wLbKz/z3HDZjVTHPc+kZc3A8zWs+ew+6llSGgWb4av5/Ww
         KZ5Q==
X-Gm-Message-State: AOAM533wWOlDour5N0KSFi7Fkgt/wPg4Zv5fJB1lVNLswrDfFteb97np
	LNhz5mT0wGQoCIS/9SRQl50eIGsx
X-Google-Smtp-Source: ABdhPJyDa/xjUALxa1rvwS6unEKstiVIJF/hykpcKCeCxQVD+2aJpKco1a33yBn+3TYwlVNX+bGNlw==
X-Received: by 2002:a63:9d44:0:b0:374:a18a:17fa with SMTP id i65-20020a639d44000000b00374a18a17famr1383122pgd.293.1645655526475;
        Wed, 23 Feb 2022 14:32:06 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 14:32:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v3 16/17] tests/avocado: Limit test_virt_tcg_gicv[23] to cortex-a72
Date: Wed, 23 Feb 2022 12:31:36 -1000
Message-Id: <20220223223137.114264-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3IWqo64zpbxx

These tests currently use Fedora Core 31, with a v5.3.7 kernel,
which is broken vs FEAT_LPA2.  Before we can re-enable these tests
for -cpu max, we need to advance to at least a v5.12 kernel.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

Fedora Cloud 35 uses a v5.14 kernel, and does work with FEAT_LPA2.
However, I have no idea how to update the makefile/avocado combo
to get that to happen.

Cc: Cleber Rosa <crosa@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
Cc: Beraldo Leal <bleal@redhat.com>
---
 tests/avocado/boot_linux.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index ab19146d1e..a79c1578a6 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -74,7 +74,7 @@ def add_common_args(self):
     def test_virt_tcg_gicv2(self):
         """
         :avocado: tags=accel:tcg
-        :avocado: tags=cpu:max
+        :avocado: tags=cpu:cortex-a72
         :avocado: tags=device:gicv2
         """
         self.require_accelerator("tcg")
@@ -86,7 +86,7 @@ def test_virt_tcg_gicv2(self):
     def test_virt_tcg_gicv3(self):
         """
         :avocado: tags=accel:tcg
-        :avocado: tags=cpu:max
+        :avocado: tags=cpu:cortex-a72
         :avocado: tags=device:gicv3
         """
         self.require_accelerator("tcg")
-- 
2.25.1
