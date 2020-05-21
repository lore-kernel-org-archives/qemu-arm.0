Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1888169lfb;
        Thu, 21 May 2020 12:59:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaxEKvz9N0L0Uqy79fP4giaF46AgkqQsoDBH8/6ehcXkq4RF1MuMP9gJT56oKqER0b5OqV
X-Received: by 2002:a25:3608:: with SMTP id d8mr19102699yba.11.1590091197482;
        Thu, 21 May 2020 12:59:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590091197; cv=none;
        d=google.com; s=arc-20160816;
        b=acpuZPKYsE+lp2HgbaZKx4GexugFgYgJNrzARxHDSIe0klibPVhsvQbApKQKXppylm
         cNZD3XOhdNq7LXnloiJRNlk6Kp7WjoYz0T9HO34nHAA8qS9MaOvE6BIagJxaY7Dqhrcm
         5uz0WhimgmVMdxw46plzo+ogaSpenBn5juLAp9Sle4ZwheI/MU+O0hpG6VVCB4Ub37v7
         bGfRE5s0/2ISPmu0Njx6YyrjK93yGKM60cyznXGzVylpyTzZz6t2S0k6J3cDhPFkr5SC
         Wl11pjJFWVgVj6KNUdnnCcrzqUUkfH6PGChUFqEIjU9b1LhnE8+Fj5HsNTUtVxDFBusm
         CLlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TyEDe8wylZalxNMNSz6RpL3nleNnTxzk4iV0Jrd1pvo=;
        b=HPcGL+lM4K3Er4wKqLK/Vp664bbYxsxjUyjgAGrfLLN53H+7rdzZ8y9bupl+15kUza
         SCJOijmYwSIJl56E3W9EjMxxCkNgy3jETIOZnXg4gYwiK/QHkf1HlLSrQXzKlQvH92OP
         4sd7879LxqNJs9/ZmZxoc9u3cBPNcOEI/xJGKnTYTBHBUdfPRYQ/hC+9sMC1/JaRBJo2
         NE4wD64V78YkjmiKYtudyGpY6+IYnLVsfxr2+PnCGWM2F75SRtKITaeC4ipx/g6J6H0l
         eehwKvbMC2zKt1y9e0bQWZQJZmAXNMRRfKbnkNHeL3NLVEGuPLVCkhVeGP0mMPHLkIm/
         B06w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M87gvzmO;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id e188si4228097yba.285.2020.05.21.12.59.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 May 2020 12:59:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M87gvzmO;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590091196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TyEDe8wylZalxNMNSz6RpL3nleNnTxzk4iV0Jrd1pvo=;
	b=M87gvzmOPS0tFmF/cG/WFiwcixStoxj7rfj37+8tkkhrT+D5fRJXAoUAyx0te/rzyOvNnh
	XHJBB3SQnHJ4EDsN8WxwCHHvt/GE8hscVivQJYYF76HYRYB7gSFf9f4IQ1rei+PSscuO0E
	ZKl1/frHEBXN/hoZuGsbgDKg03C0vzE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-y3YoqTOeNJWQkkBP-7VZSQ-1; Thu, 21 May 2020 15:59:53 -0400
X-MC-Unique: y3YoqTOeNJWQkkBP-7VZSQ-1
Received: by mail-wr1-f70.google.com with SMTP id y7so3347252wrd.12
        for <alex.bennee@linaro.org>; Thu, 21 May 2020 12:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TyEDe8wylZalxNMNSz6RpL3nleNnTxzk4iV0Jrd1pvo=;
        b=SIubYERnYY9gAgOhi046Pzs+UrX7dveS26n+Q1XqrBJ2+ZSVxGvpF6Rqme/MZiAmjP
         nrsy2jW2teWkGBogfcNwY1D+gAjhOKLAVPg3h2LdYp9aigbpE7wmuEP/BKpWaRD+mSkk
         FltfGI2WYYRX2QgxMYwc+9CrmA2JmfPbuPnyeoqqsh5INlUNk9Nui6BjiNwLScdgxtfS
         WPJjmjbGlou4yENc8UCxsmpAqcvc/OxHPlu9NOtgCfxfX96FUy2uIl3TEvwZC6KBRH4B
         Yd7Qoua9+zX07ZQcSXJPaBCR03GsshOrynJqFrBLyQbJ4M6F/2Ngp2j0Z5y0Q5Xiv3+x
         AUwQ==
X-Gm-Message-State: AOAM5324mFDmGbkISKUWxwfmKZSDU2SBGp+gnA9mk+jaRJDih+A/IxkV
	UoNA67yiHLysMYjdGh5XUuguoPWjcfPgKsH0XlnGA5XzwKe8M2EDZrvUczrv/uqcPlT5a8bx+1U
	ZZ4LSWFel5/y1gVG2
X-Received: by 2002:a05:6000:1107:: with SMTP id z7mr202691wrw.93.1590091192446;
        Thu, 21 May 2020 12:59:52 -0700 (PDT)
X-Received: by 2002:a05:6000:1107:: with SMTP id z7mr202668wrw.93.1590091192251;
        Thu, 21 May 2020 12:59:52 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id p9sm7364946wrj.29.2020.05.21.12.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 12:59:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Chris Wulff <crwulff@gmail.com>,
	qemu-arm@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>,
	Marek Vasut <marex@denx.de>,
	qemu-riscv@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
	Richard Henderson <rth@twiddle.net>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 07/11] accel/Kconfig: Extract accel selectors into their own config
Date: Thu, 21 May 2020 21:59:07 +0200
Message-Id: <20200521195911.19685-8-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200521195911.19685-1-philmd@redhat.com>
References: <20200521195911.19685-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: x/O5mkufRa3M

Move the accel selectors from the global Kconfig.host to their
own Kconfig file.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 Makefile      | 1 +
 Kconfig.host  | 7 -------
 accel/Kconfig | 6 ++++++
 3 files changed, 7 insertions(+), 7 deletions(-)
 create mode 100644 accel/Kconfig

diff --git a/Makefile b/Makefile
index 7666f81e8a..648757f79a 100644
--- a/Makefile
+++ b/Makefile
@@ -419,6 +419,7 @@ MINIKCONF_ARGS = \
     CONFIG_PVRDMA=$(CONFIG_PVRDMA)
 
 MINIKCONF_INPUTS = $(SRC_PATH)/Kconfig.host \
+                   $(SRC_PATH)/accel/Kconfig \
                    $(SRC_PATH)/hw/Kconfig
 MINIKCONF_DEPS = $(MINIKCONF_INPUTS) \
                  $(wildcard $(SRC_PATH)/hw/*/Kconfig)
diff --git a/Kconfig.host b/Kconfig.host
index 55136e037d..a6d871c399 100644
--- a/Kconfig.host
+++ b/Kconfig.host
@@ -2,9 +2,6 @@
 # down to Kconfig.  See also MINIKCONF_ARGS in the Makefile:
 # these two need to be kept in sync.
 
-config KVM
-    bool
-
 config LINUX
     bool
 
@@ -31,10 +28,6 @@ config VHOST_KERNEL
     bool
     select VHOST
 
-config XEN
-    bool
-    select FSDEV_9P if VIRTFS
-
 config VIRTFS
     bool
 
diff --git a/accel/Kconfig b/accel/Kconfig
new file mode 100644
index 0000000000..c21802bb49
--- /dev/null
+++ b/accel/Kconfig
@@ -0,0 +1,6 @@
+config KVM
+    bool
+
+config XEN
+    bool
+    select FSDEV_9P if VIRTFS
-- 
2.21.3
