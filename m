Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2497117lfb;
        Sun, 6 Dec 2020 10:55:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzP/yn+SUmTdJIS6d6dK0E3uyoCbCOBEJm0MDlOhqkB/1poA6hY5ahBHqUwhx2DFocxv/+g
X-Received: by 2002:a17:906:c7d9:: with SMTP id dc25mr16363622ejb.138.1607280926702;
        Sun, 06 Dec 2020 10:55:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607280926; cv=none;
        d=google.com; s=arc-20160816;
        b=J3YwgXxAlZM3s/y0BqPzebM/Qye2Z3Alr8CNlw0K+V10ApvuCQiwWlhnuJgs95aOYz
         +YzESVyvZkov5zEhMmhmRKnOhaZNI6E5PnD6q0Q71FwRKfHvYBxRmBiyjBv6jT3GcpK2
         XaCZjWGpSQ6BccrZb9ECkWoyNfyG+DaUpn0VpFSYO99lSj+mfH2Q+mllUlBH+jH9jBOy
         lJiiXdRY7u7Rb/0jGGW+tVHglyNTfTmuYKOvg/TeVsKtN75BDGQEzEhM458gxtuYDBFv
         TVYIsH6dUItmmefLzXwNXPRlXEFB7tIHDU3vvhJ+LYmburLsSAgfaxEFyXjvoFq5aiUq
         SNRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=r0Lqr22l7ATKhofbc7EdyOSapxnrV+ynGfxlD6q9jNk=;
        b=YXZdmbyKxysuM4ET+T3CM2qkI6Odb+2lCQAo+FFhAvyIFqAWDT6T34S7F5+6QIrKNX
         3l/nUBm+5G4EC0AzuRgC10CiHMZnIiqbbmgRzyYhEEcWgCcrVXMNHREyda3EevmRCENV
         qPyo06AX69c1/kZNYxdosZWh6LhA0DIh27G0Iu7dkV1BpVFL3GcvmTMbrFWMstQHs92L
         CryMdmwXISLyj6QxFdRzICGMt91L4M7Ceso4nYFfhX6TGaaJm5HUjf6PFaiRDHA6e8r7
         dOyvxJ/4l3CgT3Wuj7sczhcO+SMGsZWNx1mJooB78I/HSmw/WUfLESLXk6fnIcqXjByN
         sauw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SSnMWYCs;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id dn16si5426922ejc.482.2020.12.06.10.55.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Dec 2020 10:55:26 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SSnMWYCs;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607280925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r0Lqr22l7ATKhofbc7EdyOSapxnrV+ynGfxlD6q9jNk=;
	b=SSnMWYCsfN1oznTMN5e15j3msdb78/4wuJHDZJ3IjSJEqQglO8DyMUIEBmhwVjg/Epa5tu
	6qhnX6SOH82ORSDjgM9XAZkp1VinVgATzFdXRr+OEq6XSgAhS1CuCCzhgYu4jgniL6t3Vy
	6vPfZEEvJ0lreixQMVUmvjlz1T0R7Fc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-8j7AWND3NWG0Hn9EPymxGA-1; Sun, 06 Dec 2020 13:55:24 -0500
X-MC-Unique: 8j7AWND3NWG0Hn9EPymxGA-1
Received: by mail-wm1-f72.google.com with SMTP id v5so4349223wmj.0
        for <alex.bennee@linaro.org>; Sun, 06 Dec 2020 10:55:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r0Lqr22l7ATKhofbc7EdyOSapxnrV+ynGfxlD6q9jNk=;
        b=GWJ5S417I2vn9EBaNvMKz7mgaZGDbP3StmXZqkajojLhTKZj2tg4I+TguGKPvhpInd
         3YM8LPcaBUmjAYf/TLJVMtkWoq3ELwSZllYcgb5ad/BWmb8YeRHb/0bzkg2svyIenjU0
         9Q4uBUfPjeM2stagVCzpW0hPpKwEt5eQxl8g/HI4W3r6syxavcaqoIhOR8PKPGmkhUl2
         PMgfwIP982dcsuEgYTr/fa1vtUHNA5nEdg6FlhUMqZLtwINsZVwnKymc56SpNY78fRrP
         DmT6gOaZwraEPoHCF8ALDz668ORCmpYBixDZzz7lslUtzOwu4pBkQ3dit1KpybHAZZHC
         eE6Q==
X-Gm-Message-State: AOAM5315zVw93TWOlPpHjA/efRca67wwcjkdmDRPxw2ozNHMAocX+Yh8
	ksvKxsMZFvNh6E/CFpsLC4vcPV+wV1mDrubb/aRyRH58NqKzSmQpgJgWvZZ5s7ScNquIa6lVOd4
	Rji2lSe2cNUQ9evam
X-Received: by 2002:a1c:e084:: with SMTP id x126mr14748207wmg.109.1607280923045;
        Sun, 06 Dec 2020 10:55:23 -0800 (PST)
X-Received: by 2002:a1c:e084:: with SMTP id x126mr14748201wmg.109.1607280922898;
        Sun, 06 Dec 2020 10:55:22 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net. [88.21.206.101])
        by smtp.gmail.com with ESMTPSA id m8sm11324488wmc.27.2020.12.06.10.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Dec 2020 10:55:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Willian Rampazzo <wrampazz@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Huacai Chen <chenhc@lemote.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Claudio Fontana <cfontana@suse.de>,
	Halil Pasic <pasic@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-s390x@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	qemu-arm@nongnu.org
Subject: [PATCH 2/8] gitlab-ci: Introduce 'cross_accel_build_job' template
Date: Sun,  6 Dec 2020 19:55:02 +0100
Message-Id: <20201206185508.3545711-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201206185508.3545711-1-philmd@redhat.com>
References: <20201206185508.3545711-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Xh/Gw7fh9RZ3

Introduce a job template to cross-build accelerator specific
jobs (enable a specific accelerator, disabling the others).

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 099949aaef3..be63b209c5b 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -13,6 +13,18 @@
           xtensa-softmmu"
     - make -j$(expr $(nproc) + 1) all check-build
 
+.cross_accel_build_job:
+  stage: build
+  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+  timeout: 30m
+  script:
+    - mkdir build
+    - cd build
+    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
+      ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-tools
+        --enable-${ACCEL:-kvm} --target-list="$TARGETS" $ACCEL_CONFIGURE_OPTS
+    - make -j$(expr $(nproc) + 1) all check-build
+
 .cross_user_build_job:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
-- 
2.26.2
