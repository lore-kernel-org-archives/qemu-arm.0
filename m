Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4294143wrv;
        Mon, 15 Jul 2019 08:22:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxZ92JR0AEHwVeND7d6ZsHnRwU0+liP5q1xlJIS5cvtf4eFI1BxTgsAP9s4sn//8AeJdJcc
X-Received: by 2002:a37:bc84:: with SMTP id m126mr15680174qkf.303.1563204170881;
        Mon, 15 Jul 2019 08:22:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563204170; cv=none;
        d=google.com; s=arc-20160816;
        b=DnhDeG3V0ZIT/PNC4Jl16sHfbjH3wZE0Wi3Jd8+xJ02rdu6R6A1YXR/3kJaHkHLB3X
         N1V6pXtivK2SXbbFzB5OUIp8K82AFh2TqFvnBh/zh4H5mjhat39AUqTwM/YPf7L7FAQP
         6YyhVR857fmjiv9G+9JWq90/haBwVGrOjAwf7vT4hFi5XEYUTX6TCAC+RWTepmpN3EVU
         HpkhhxeczVewXwHXorSs4AjNLrQUX6OcYeZrboRLVp6W/6zeob5tS/X1oM38M6QDYbIC
         z/PUTULtOJvQ/xSl8vfcsf+eCetQK1e6eSVg0J7K7g+IIEVpno5eQqE8of6+aHBH7/6G
         XEUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=evpxvohgS/rhpy10McYF1sN1eLiQD//XNcZPlk4MtUQ=;
        b=GxY7I8Usmc6M9F8CD53+6g7zjHaO+GXpnFMudvZGBRL7N/cO/7/F+Hiwpuy4s2MEPq
         0y7Eebuy9oSahtohH/aGEZugddP5fy9DKMQtdVAGg3uhNXnW8r+quxtr2/AXPZuiN4kP
         fx6UfVdd5xuAgesV5ypn//zC0llcu7+uJu+W1O0jp/2lZghp5gZL4tUFch6+umOkuBFY
         jdu05809BfaCCVCrJBNAfLS5GTY5dyTqtft9mP2yJUiqtGqSQqZr9N8Hsn0cTkTgUN17
         dMaPCHXTRL8mggEo5On33iWAo6LoMGtEfnf8K3aF5fF4UHYk5fXSPc5xwenpv5TAMhxp
         NsJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id h47si12289693qtc.37.2019.07.15.08.22.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jul 2019 08:22:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE909811A9;
	Mon, 15 Jul 2019 15:22:49 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.87])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA52C6085B;
	Mon, 15 Jul 2019 15:22:41 +0000 (UTC)
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
Subject: [RFC PATCH-for-4.1? v2 2/5] target/mips: Always enable CONFIG_SEMIHOSTING
Date: Mon, 15 Jul 2019 17:22:22 +0200
Message-Id: <20190715152225.26135-3-philmd@redhat.com>
In-Reply-To: <20190715152225.26135-1-philmd@redhat.com>
References: <20190715152225.26135-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Mon, 15 Jul 2019 15:22:50 +0000 (UTC)
X-TUID: uCxaHTiYGFAo

The semihosting feature is always required on user-space.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 default-configs/mips-linux-user-common.mak | 4 ++++
 default-configs/mips-linux-user.mak        | 2 ++
 default-configs/mips64-linux-user.mak      | 2 ++
 default-configs/mips64el-linux-user.mak    | 2 ++
 default-configs/mipsel-linux-user.mak      | 2 ++
 default-configs/mipsn32-linux-user.mak     | 2 ++
 default-configs/mipsn32el-linux-user.mak   | 2 ++
 7 files changed, 16 insertions(+)
 create mode 100644 default-configs/mips-linux-user-common.mak

diff --git a/default-configs/mips-linux-user-common.mak b/default-configs/mips-linux-user-common.mak
new file mode 100644
index 0000000000..04947706e8
--- /dev/null
+++ b/default-configs/mips-linux-user-common.mak
@@ -0,0 +1,4 @@
+# Common mips*-linux-user CONFIG defines
+
+# CONFIG_SEMIHOSTING is always required on this architecture
+CONFIG_SEMIHOSTING=y
diff --git a/default-configs/mips-linux-user.mak b/default-configs/mips-linux-user.mak
index 31df57021e..c606e12444 100644
--- a/default-configs/mips-linux-user.mak
+++ b/default-configs/mips-linux-user.mak
@@ -1 +1,3 @@
 # Default configuration for mips-linux-user
+
+include mips-linux-user-common.mak
diff --git a/default-configs/mips64-linux-user.mak b/default-configs/mips64-linux-user.mak
index 1598bfcf7d..81e16ac2eb 100644
--- a/default-configs/mips64-linux-user.mak
+++ b/default-configs/mips64-linux-user.mak
@@ -1 +1,3 @@
 # Default configuration for mips64-linux-user
+
+include mips-linux-user-common.mak
diff --git a/default-configs/mips64el-linux-user.mak b/default-configs/mips64el-linux-user.mak
index 629f084086..6399af3fd5 100644
--- a/default-configs/mips64el-linux-user.mak
+++ b/default-configs/mips64el-linux-user.mak
@@ -1 +1,3 @@
 # Default configuration for mips64el-linux-user
+
+include mips-linux-user-common.mak
diff --git a/default-configs/mipsel-linux-user.mak b/default-configs/mipsel-linux-user.mak
index 4d0e4afb69..4a27d30b45 100644
--- a/default-configs/mipsel-linux-user.mak
+++ b/default-configs/mipsel-linux-user.mak
@@ -1 +1,3 @@
 # Default configuration for mipsel-linux-user
+
+include mips-linux-user-common.mak
diff --git a/default-configs/mipsn32-linux-user.mak b/default-configs/mipsn32-linux-user.mak
index 5b97919794..f3ac967463 100644
--- a/default-configs/mipsn32-linux-user.mak
+++ b/default-configs/mipsn32-linux-user.mak
@@ -1 +1,3 @@
 # Default configuration for mipsn32-linux-user
+
+include mips-linux-user-common.mak
diff --git a/default-configs/mipsn32el-linux-user.mak b/default-configs/mipsn32el-linux-user.mak
index d6367ff987..63fe4de4fd 100644
--- a/default-configs/mipsn32el-linux-user.mak
+++ b/default-configs/mipsn32el-linux-user.mak
@@ -1 +1,3 @@
 # Default configuration for mipsn32el-linux-user
+
+include mips-linux-user-common.mak
-- 
2.20.1
