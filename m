Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4986135lfq;
        Tue, 29 Sep 2020 15:44:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmNZ1Kp2xjhvneJK+U6MRgrqOvzC1H2c1QabqhgSp5bEmIy5NUKMacRtdTIS3bkXhMSlRF
X-Received: by 2002:a17:906:2655:: with SMTP id i21mr5901767ejc.511.1601419462671;
        Tue, 29 Sep 2020 15:44:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601419462; cv=none;
        d=google.com; s=arc-20160816;
        b=WPEutmueW9XI+HB9uwApV2m7mac88l5jlSLGC9+ecWnoqvdfYVkYiYgG0UyeAYM7zr
         1dBeectkfrHaRGgHTwr5uPGyHdER+GJzOQmdRYb3ybpfLLFWBCw6sDwRcUztd99BV8QI
         TITa9+HHDXygjqfxAjktgRL7nLhWe/ngCnZOtdAA7UTOG5fLYtOe9nliCmxDKKupmyvy
         cuu+h87HmlJFxaDcvnM+GMt0uZIhEb4B/va3mh2tE3v4RXKf5P79g3tqv8tsg8aPhwBu
         JfOu9uLMxQg+aDAE4UPaWcHrnrr2jgeWiLrv/teeucaz9P65SAInMaW9rIspMEGtltLg
         jWsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9dR9Nk0eM9jSf6djV760qyeufq0GIQie0fmgNB3aO7w=;
        b=GuRbRB8enOdkLtFGOiVeUMxw3FPbW81Bz9B+WNV5aAnIGWRFiFlLBFi3LSlVFNrswM
         zYktjiDsvMDXun+t1ReVVwHFOHM+TuKueA+iHw8QKw7fSIlqIdzSntA+2SkrXGWRYJTD
         FQjBWM0LL3kN643/oFBNPnauQF+C75j05eJtD/UBzIiVTIAhS871f81jrip5SgIxe14n
         EOqtJ3ADwv0EHEk4IE2G6JygcwMo4BQCCV7Ogtyqi26OXTy8RvZAHa8RstS6UfCBOLVl
         1463usQyDgqXIeL/FTxr0h1pGHrAJbUlLUSb2hj9YeBRCcl+z3uIIxPqB8sFs5d01Xtn
         U4DA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ABzl7VNu;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id ec11si3612551ejb.540.2020.09.29.15.44.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Sep 2020 15:44:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ABzl7VNu;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601419461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9dR9Nk0eM9jSf6djV760qyeufq0GIQie0fmgNB3aO7w=;
	b=ABzl7VNu1PaIwvHqYBjXD9sL92SzShanvI7/wPHo5VkZ/djlfFseeq/RaRxhCGK9k45Fpo
	Qfdj6qsoHQnDoMYZD2S6+G38u8rIzApA/r7q8/O6F2MBrdjUebf3HXzIgWbHjqR3+p7O2v
	s+8IWxyVrC/kJxl5I5wAcrwgBcf5PkQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-vpT-5EiOOAWSJoi_0LayFg-1; Tue, 29 Sep 2020 18:44:19 -0400
X-MC-Unique: vpT-5EiOOAWSJoi_0LayFg-1
Received: by mail-wr1-f69.google.com with SMTP id j7so2360653wro.14
        for <alex.bennee@linaro.org>; Tue, 29 Sep 2020 15:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9dR9Nk0eM9jSf6djV760qyeufq0GIQie0fmgNB3aO7w=;
        b=C6nT5upVf5RcIgbSx2hfm24ul3p5HGqBnEL1jEgrRsRGSIO4mHfEFy5xfLjz2rc8l0
         QKO6OrNKAIdGQYTM9U3aORoV51L8BMVcbkSrtvR3vEpDQLri2UV3DSIEpb0CU1y+CH1U
         XwSlD7QelA/uguVNvPK2tUgt3MVRioVtWRd9mHSc8a4kiV+4AwaPPbmD8pOYOH1Cy3i1
         uEEEhiJ7aU7cM5EFOwXrQMkQIykKJKlpF95drKiL+mq8005hzvdQpMXiCEgZ8H+X2GMq
         9qnW3oiMHU8eUtK6vpHajSWhIe7CWN6WnccJS/GGZTz4/VxMYNSqlB204iMV0W2TfmNG
         KJVQ==
X-Gm-Message-State: AOAM531vnB9HdyepxAqHZyILnVhUxNyajEyBHpSd+Yox8nPV/H1f0Bio
	eoJPh5f3NjLq459Nteo/QwCAw5e/6wxSRtR+HuxoE7uBD6ak3Qfje2pj+FHveeKG6thAuVo45IG
	5gVKSdnxhsBpr6reC
X-Received: by 2002:adf:fd01:: with SMTP id e1mr6312401wrr.44.1601419458523;
        Tue, 29 Sep 2020 15:44:18 -0700 (PDT)
X-Received: by 2002:adf:fd01:: with SMTP id e1mr6312389wrr.44.1601419458354;
        Tue, 29 Sep 2020 15:44:18 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (74.red-83-53-161.dynamicip.rima-tde.net. [83.53.161.74])
        by smtp.gmail.com with ESMTPSA id y1sm7440740wmi.36.2020.09.29.15.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:44:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v4 04/12] target/arm: Restrict ARMv4 cpus to TCG accel
Date: Wed, 30 Sep 2020 00:43:47 +0200
Message-Id: <20200929224355.1224017-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200929224355.1224017-1-philmd@redhat.com>
References: <20200929224355.1224017-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: NwsdK1+T5Wyo

KVM requires a cpu based on (at least) the ARMv7 architecture.

Only enable the following ARMv4 CPUs when TCG is available:

  - StrongARM (SA1100/1110)
  - OMAP1510 (TI925T)

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 7d040827af..b546b20654 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -1,3 +1,7 @@
+config ARM_V4
+    bool
+    select TCG
+
 config ARM_VIRT
     bool
     imply PCI_DEVICES
@@ -30,6 +34,7 @@ config ARM_VIRT
 
 config CHEETAH
     bool
+    select ARM_V4
     select OMAP
     select TSC210X
 
@@ -244,6 +249,7 @@ config COLLIE
 
 config SX1
     bool
+    select ARM_V4
     select OMAP
 
 config VERSATILE
-- 
2.26.2
