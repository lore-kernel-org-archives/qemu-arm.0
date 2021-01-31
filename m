Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2599843lfo;
        Sun, 31 Jan 2021 03:51:21 -0800 (PST)
X-Received: by 2002:a7b:ce92:: with SMTP id q18mr10620204wmj.113.1612093881187;
        Sun, 31 Jan 2021 03:51:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612093881; cv=none;
        d=google.com; s=arc-20160816;
        b=M3u8OVxxbifrp473RmjxTIIQVut84gBEzy8+NExHZ9Ybb4sek18Zs98JJ3jQDMQf2g
         z0yF/qZ8xMaHukJ4iHEeCTfImvU4q2Vt5+9mnha6wzHHhoyGd3vz31ZBXpAuxSVu/9TS
         B69iFdeKj21LHX0XVmWZWly1YtvnR2EXhMc9+Tl+1p3z1e7ZCgdYonUcZKRinEZtOTSH
         lmuREb9L/Lfxnk4YT4Al8R2SQhDrbNlZyG0PEA3x1A3i8TvDz1ACT+mRZbkelAYNFhcq
         9lddXauRfTQ/+nUNZHT/ixACEUbcHoD0zAO3lr9RJqtMMLt3MTPDJVd6XRzooHoupa1A
         9yHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Rd+PClqm9GCes/hSRY8Vwer9UM1+ZxmgnVmbkhC6bwQ=;
        b=g7N+0o8nosqiYbNe83+yAWYiGatSfQ+BaMjvEQlJhdpliqCsQdvymK/52zXruiT0Ul
         +BCqN0CjQqtLwLx2WDCDmslF8wOUwaMyFHPxHUKZKoiw1/tfdnxMjfR8GkJFrCFH52dF
         ZfXjS+vd/RVBokVptTUGo5r0PsOXKsgGom6oCXAJEpd9hDTRtHmNa45jjfZ+oBCCFFdJ
         mtFYuPwMuSUcDLTLqOwmiEvRigNUZe7Hbr3G5lREcD2mUh/9Av4ADJUhpOYW64RAexPi
         lAdgOXnQ34BepaNoWunNlEohrlt8bKlttOiIqe/dzMoBf1ksoq6hB4CgRFIExAVIvy/D
         GA4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="slxe/n+g";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k5sor7197660wrq.55.2021.01.31.03.51.21
        (Google Transport Security);
        Sun, 31 Jan 2021 03:51:21 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="slxe/n+g";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rd+PClqm9GCes/hSRY8Vwer9UM1+ZxmgnVmbkhC6bwQ=;
        b=slxe/n+gWVTJ0YqCL3Bn1rdJcLxnKsXS1n7WF9oDy93hJBrTu2I3a2iCbMx2QDDRf6
         cvW4fsFH+RBNOH8Xizz/iAt4S26E5y/x/GNkhqNZmKoFK0IiYXFUyThdM4/jwqc/fgDh
         Y8sSf3tw+ovhP/bOMS00qPGcsrcwEr4MAVjaD4Adx0t14YzqI1NvnOJU9VgFgQeaG54O
         V+6f04a2Rwu6cmu95TNxszsXA3x1TBUu0rBat0w9gSOTxcp7PNPqNvAJyHXskdJMCaKx
         yFY9GcHTyxHSb+UJ+i+xVssw6kxrn3Nc/CZDLYpgrtE9kqvzklrUNMRkM1Y9GXFVF1zD
         r1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=Rd+PClqm9GCes/hSRY8Vwer9UM1+ZxmgnVmbkhC6bwQ=;
        b=d1Eln2pTn/h8m0G575K1fnh0LqQqyQVejtBSfLG86KEHBNyvvQUWmG22kV+P9tIAxm
         6+NdWY0zMHkcJ3fX655yf02OX7aJTKpSeySbCicLVAwbnHtNOHHCQhuILcLYoSIMKphC
         G8Sug35qFoXOBEl8F7UWSQ9CHPYZ1Mvkb3PR1gLWOgAtrySID5SOFtkhsT9BblCXwmYf
         GOczlUYJS68VOiySw2wJbyy958ynAi2yo4yRydG+7FeZOtPkTB4tUqr6O+UBUXlyqH/X
         7bavjxA0pv3hT/mCb/+ak6K6C7SXSHziOVd9tk6XfxpnSn/ApcvN+DFCYXtsdnMsG2Hf
         /ffQ==
X-Gm-Message-State: AOAM532XL6grMUSCHC0yvTzAeIhhunE8/P/sDeq5+ZoEhNSN6wycZ3F6
	bmvGRUBxxuO5+Vjs1moRf3w=
X-Google-Smtp-Source: ABdhPJyhH4FzLWznIwV2JMINXQ8Kq1HB+Q7Ewfh1h/EdNga37TZknXhQRMlYya4ZrjBKEH1uV/ip3A==
X-Received: by 2002:a5d:6c6b:: with SMTP id r11mr13497246wrz.38.1612093880944;
        Sun, 31 Jan 2021 03:51:20 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net. [83.57.171.7])
        by smtp.gmail.com with ESMTPSA id h23sm17669371wmi.26.2021.01.31.03.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 03:51:20 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Fam Zheng <fam@euphon.net>,
	Claudio Fontana <cfontana@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-block@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Samuel Ortiz <sameo@linux.intel.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 10/11] target/arm: Do not build TCG objects when TCG is off
Date: Sun, 31 Jan 2021 12:50:21 +0100
Message-Id: <20210131115022.242570-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131115022.242570-1-f4bug@amsat.org>
References: <20210131115022.242570-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kcb7Bpd31PmK

From: Samuel Ortiz <sameo@linux.intel.com>

We can now safely turn all TCG dependent build off when CONFIG_TCG is
off. This allows building ARM binaries with --disable-tcg.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
[PMD: Heavily rebased during more than 2 years then finally rewritten]
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/meson.build | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index aac9a383a61..11b7c0e18fe 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -27,7 +27,8 @@
   'gdbstub64.c',
 ))
 
-arm_ss.add(files(
+arm_tcg_ss = ss.source_set()
+arm_tcg_ss.add(files(
   'crypto_helper.c',
   'debug_helper.c',
   'iwmmxt_helper.c',
@@ -38,12 +39,12 @@
   'vec_helper.c',
   'cpu_tcg.c',
 ))
-arm_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('m_helper.c'), if_false: files('m_helper-stub.c'))
+arm_tcg_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('m_helper.c'), if_false: files('m_helper-stub.c'))
 arm_ss.add(when: 'CONFIG_TCG', if_false: files('m_helper-stub.c'))
 
 arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
 
-arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
+arm_tcg_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'helper-a64.c',
   'mte_helper.c',
   'pauth_helper.c',
@@ -52,14 +53,16 @@
   'translate-sve.c',
 ))
 
+arm_ss.add_all(when: 'CONFIG_TCG', if_true: arm_tcg_ss)
+
 arm_softmmu_ss = ss.source_set()
 arm_softmmu_ss.add(files(
   'arch_dump.c',
   'arm-powerctl.c',
   'machine.c',
   'monitor.c',
-  'psci.c',
 ))
+arm_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('psci.c'))
 
 target_arch += {'arm': arm_ss}
 target_softmmu_arch += {'arm': arm_softmmu_ss}
-- 
2.26.2
