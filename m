Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4293983wrv;
        Mon, 15 Jul 2019 08:22:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz46s1ozpjOS7Jf0se7C32YtoyOhdSGpJ+kEDUNc5IwWIjQl22Qz9BqUOJeKw5L5z2rdtqQ
X-Received: by 2002:a0c:d2da:: with SMTP id x26mr19741680qvh.51.1563204162126;
        Mon, 15 Jul 2019 08:22:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563204162; cv=none;
        d=google.com; s=arc-20160816;
        b=pQ1aJNRWWtqWFe5EnihJ/YiYa34m912axAmHKnhogqGZ9QY9H6Yuvioa+fZGnrtpa8
         RTvCh0aFSjJIK5G/eEQlhnCZQ1hljLKr0Kh+DqntVjvvM83Rfp/NHE/Y8H2x/lfxwdgJ
         V2jEQd6kYRK16VkBgpPnc4JC+tJUAGJu1jNfMTz5PXkSII+hqB/oVuhia4OFOjIondgk
         fRGKjBsG0rM9/jtq0A53y/zCwtVrU0Py8FriGUjMhzI7kACitwwCbJOobWUP2/+iw0wM
         sPWWqQQm6U6oLRi+4AokTW3sas6OsidySmuvPcfPgXk3YudBAe+FpxTF8VIOyjQtmORC
         V5lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=dOcEPihSGoiafz6WBMVGKSBUNdnuOrEsy/z6d1WWF8A=;
        b=iYkkjyJUBYkBNzvXFLGXiyf9+dSOozyBrBsTQeWbd5PKsV9p7wfDz7hO3TDntoKzJT
         9NVtj/lxOpLful15aqWQkY96rTwKkrK+4p9fZUg8Fpgd+gKlPL+4HIzs56gbQm9V8LtA
         yebPFmlG4HwYMHAVlQWFeC+4XF/b8ucW5QvA4xMG8GKhEKw8TxDW/v5lY5Z/M69onoBZ
         V2FJ7QNa7ajuZmsTQby5uQLgmH+2MVP6Y0JgX3Hz797P60VACc4/boA83xVfJohJ7rNt
         PQhcAVO9WuTTmBlYHw9bI1YL2YVOIWPHo5NMUuJ1AlTZOEIRjJYpVP6kouKDGwtAfrIT
         8UDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id h52si11722557qta.307.2019.07.15.08.22.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jul 2019 08:22:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C242308FED5;
	Mon, 15 Jul 2019 15:22:41 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.87])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68C086085B;
	Mon, 15 Jul 2019 15:22:35 +0000 (UTC)
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
Subject: [RFC PATCH-for-4.1? v2 1/5] target/arm: Always enable CONFIG_SEMIHOSTING
Date: Mon, 15 Jul 2019 17:22:21 +0200
Message-Id: <20190715152225.26135-2-philmd@redhat.com>
In-Reply-To: <20190715152225.26135-1-philmd@redhat.com>
References: <20190715152225.26135-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Mon, 15 Jul 2019 15:22:41 +0000 (UTC)
X-TUID: 3mDMGnm7ZLD2

The semihosting feature is always required on user-space, and
is also used by system emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 default-configs/aarch64-linux-user-common.mak | 4 ++++
 default-configs/aarch64-linux-user.mak        | 2 ++
 default-configs/aarch64_be-linux-user.mak     | 2 ++
 default-configs/arm-linux-user-common.mak     | 4 ++++
 default-configs/arm-linux-user.mak            | 2 ++
 default-configs/arm-softmmu.mak               | 4 +++-
 default-configs/armeb-linux-user.mak          | 2 ++
 7 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 default-configs/aarch64-linux-user-common.mak
 create mode 100644 default-configs/arm-linux-user-common.mak

diff --git a/default-configs/aarch64-linux-user-common.mak b/default-configs/aarch64-linux-user-common.mak
new file mode 100644
index 0000000000..94c0cdf826
--- /dev/null
+++ b/default-configs/aarch64-linux-user-common.mak
@@ -0,0 +1,4 @@
+# Common aarch64*-linux-user CONFIG defines
+
+# CONFIG_SEMIHOSTING is always required on this architecture
+CONFIG_SEMIHOSTING=y
diff --git a/default-configs/aarch64-linux-user.mak b/default-configs/aarch64-linux-user.mak
index 0a5b08a007..d27232cbc6 100644
--- a/default-configs/aarch64-linux-user.mak
+++ b/default-configs/aarch64-linux-user.mak
@@ -1 +1,3 @@
 # Default configuration for aarch64-linux-user
+
+include aarch64-linux-user-common.mak
diff --git a/default-configs/aarch64_be-linux-user.mak b/default-configs/aarch64_be-linux-user.mak
index a69d9d2e41..7dee7ba4cb 100644
--- a/default-configs/aarch64_be-linux-user.mak
+++ b/default-configs/aarch64_be-linux-user.mak
@@ -1 +1,3 @@
 # Default configuration for aarch64_be-linux-user
+
+include aarch64-linux-user-common.mak
diff --git a/default-configs/arm-linux-user-common.mak b/default-configs/arm-linux-user-common.mak
new file mode 100644
index 0000000000..67acd961f3
--- /dev/null
+++ b/default-configs/arm-linux-user-common.mak
@@ -0,0 +1,4 @@
+# Common arm*-linux-user CONFIG defines
+
+# CONFIG_SEMIHOSTING is always required on this architecture
+CONFIG_SEMIHOSTING=y
diff --git a/default-configs/arm-linux-user.mak b/default-configs/arm-linux-user.mak
index 413361a022..7d45e4d20a 100644
--- a/default-configs/arm-linux-user.mak
+++ b/default-configs/arm-linux-user.mak
@@ -1 +1,3 @@
 # Default configuration for arm-linux-user
+
+include arm-linux-user-common.mak
diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 1f2e0e7fde..ad2debf543 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -1,5 +1,8 @@
 # Default configuration for arm-softmmu
 
+# CONFIG_SEMIHOSTING is always required on this architecture
+CONFIG_SEMIHOSTING=y
+
 # TODO: ARM_V7M is currently always required - make this more flexible!
 CONFIG_ARM_V7M=y
 
@@ -39,4 +42,3 @@ CONFIG_MICROBIT=y
 CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
-CONFIG_SEMIHOSTING=y
diff --git a/default-configs/armeb-linux-user.mak b/default-configs/armeb-linux-user.mak
index bf2ffe7038..485132f606 100644
--- a/default-configs/armeb-linux-user.mak
+++ b/default-configs/armeb-linux-user.mak
@@ -1 +1,3 @@
 # Default configuration for armeb-linux-user
+
+include arm-linux-user-common.mak
-- 
2.20.1
