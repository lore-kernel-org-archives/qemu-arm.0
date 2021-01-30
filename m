Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1619036lfo;
        Fri, 29 Jan 2021 17:53:16 -0800 (PST)
X-Received: by 2002:a05:600c:3510:: with SMTP id h16mr5980566wmq.156.1611971596824;
        Fri, 29 Jan 2021 17:53:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611971596; cv=none;
        d=google.com; s=arc-20160816;
        b=K7rHaMI0iC4NYCMHzL1ob3yqr+FlGHYIOPH6tABHgSNCoZuI7iO87ppsBP/Z81S2fI
         22JqhbtSfxG2GHkoTA+fX+Ul2rfl+NJE3LmJgn2cihbOLTjSYWCGDGe7sEjcGlYsjicn
         ud7j34SE2ru4OUDtAJgMMCLf++QViJHeOHTMVFViz3wfUkf+BBIIxxE17CQ3ZW05dA95
         0PDWdoNvqfVcVq2nz1cQfxzakJrbdZbZwR/i62DStxcEl/jtEdxzr8Fqs1ZPB1KLk677
         HcN5CFWHAWx9W8vnGr6LmThc8Dd0cxLdRZoN12GAtbxMC+saO5G7g8XLCNPwQroD6FPC
         ZjjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=sHwmePAwBZnB/6MQG332p6aeurp1aOW9YUVHNzJgQQk=;
        b=YzeNilT+IIhWaHBeK6EmBO2C9uWOYbsuyhvvIa3gLmO2hIbkwdjcgJSor9cLdR4LfF
         llZAgwsmSjpoWwwVvE9gu+Pkm2WPxEPZlZnPgsCzaLUAF1xUn6Umu42dnjcUkdZuQx+G
         Tld1pgKNGveg87/6m31KxKzLrbw06tUe8Fx+f6iq+dl7wS4PWORHxXCdMVzUa+kcGO61
         GLc2/KNINn/E06Hx7Xm6Y+UENtFfKAYdeChz4G1vUy4V2+l44lGngZVyhcqra201Q1Hf
         cfp4DJ/aps/d7KC8EW89tp9CZaLjY9zFCLH6JolEvByIQMFZpvTnvPNQz7NPB+QazSFz
         LI0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=HJZc1PSa;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w10sor5800897wru.11.2021.01.29.17.53.16
        (Google Transport Security);
        Fri, 29 Jan 2021 17:53:16 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=HJZc1PSa;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sHwmePAwBZnB/6MQG332p6aeurp1aOW9YUVHNzJgQQk=;
        b=HJZc1PSaje6m+L7668kBqPcK1wBm9CBsKO2kC1XrobpTcPPnHU6ITs11hbUl/YKjbc
         DzmcMbtXJnzP6jZlLgdJWwpTlE27nSIkIGsIVBfAmCGKQgMB/xWkVmaOqqSFYsifLlUd
         43jJZWsgGnfdPJBE8xZg+aMXkJ51DSQ7epXkB4qfmO1Rp1YXYWGGo76hopz0wEqPZD4D
         B0dQ+lKuMROs0W/ZONElGdzV5hnhFvdWMUgJODm2C2Sdaq2e81ytYWHR/5xXLEXTV9v9
         iQCHMX91/noURZa+VVbdTq8Y8AIgbZ7bd2E4fXynsrlRzci32qoKpvpXMMtBXeUyxVrN
         GbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=sHwmePAwBZnB/6MQG332p6aeurp1aOW9YUVHNzJgQQk=;
        b=oQbk4YZgQvYfBOsJ7CZCaSLT58HLB59nRegsyv6yvJfPonbGSCDyWXJOA6PNhqPJ4/
         XInHoDm7FF4gjS//Pnuv1zYQZzH17taxOYYTXrZg3Zmfw391471tozUDcX78gpdatpUN
         Kpzhz2zyugFf9+qYtc8lg70yu/og67dkrGA54lxUf63+SnIEPFPjs0IOoonHHPIMcsmz
         OEWYfMWNkNbQbBc4AdCMxJVQMb20boiifvG3Z7f2xr66QgsWlKsuzlMU6e8VpJYa9cpe
         Gpl9o6C+GjrtXYHOJmGgmwINd+HJdTs78Um1RWMNXPvCuOSdmj/Ju7BnYn2VFAvWIeO5
         WDfg==
X-Gm-Message-State: AOAM533hY+kLBiVF4wam2hLWDG8M5dFz0Nb1u1s/7aBN+CtB0Ue7qCHR
	nP+LQfGWhzF0j+pZa9uaUEWshpLWWKo=
X-Google-Smtp-Source: ABdhPJytRdW5ApRmNTPnsqDHD7BiuYa2AbAtlk3vbvJPE6VBSMcsUQvRsWX8iwp2BHbkvB+QsXhcxg==
X-Received: by 2002:adf:d4ce:: with SMTP id w14mr7095039wrk.89.1611971596601;
        Fri, 29 Jan 2021 17:53:16 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net. [83.57.169.13])
        by smtp.gmail.com with ESMTPSA id p18sm10429022wrx.84.2021.01.29.17.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 17:53:16 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH v5 09/11] target/arm: Reorder meson.build rules
Date: Sat, 30 Jan 2021 02:52:25 +0100
Message-Id: <20210130015227.4071332-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210130015227.4071332-1-f4bug@amsat.org>
References: <20210130015227.4071332-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FhENMyE6hYf6

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Reorder the rules to make this file easier to modify.
No logical change introduced in this commit.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/meson.build | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 6c6081966cd..aac9a383a61 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -14,31 +14,36 @@
 
 arm_ss = ss.source_set()
 arm_ss.add(gen)
+arm_ss.add(zlib)
 arm_ss.add(files(
   'cpu.c',
-  'crypto_helper.c',
-  'debug_helper.c',
   'gdbstub.c',
   'helper.c',
+  'vfp_helper.c',
+))
+
+arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
+  'cpu64.c',
+  'gdbstub64.c',
+))
+
+arm_ss.add(files(
+  'crypto_helper.c',
+  'debug_helper.c',
   'iwmmxt_helper.c',
   'neon_helper.c',
   'op_helper.c',
   'tlb_helper.c',
   'translate.c',
   'vec_helper.c',
-  'vfp_helper.c',
   'cpu_tcg.c',
 ))
-arm_ss.add(zlib)
-
 arm_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('m_helper.c'), if_false: files('m_helper-stub.c'))
 arm_ss.add(when: 'CONFIG_TCG', if_false: files('m_helper-stub.c'))
 
 arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
-  'cpu64.c',
-  'gdbstub64.c',
   'helper-a64.c',
   'mte_helper.c',
   'pauth_helper.c',
-- 
2.26.2
