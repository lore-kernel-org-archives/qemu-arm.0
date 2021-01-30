Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1619081lfo;
        Fri, 29 Jan 2021 17:53:22 -0800 (PST)
X-Received: by 2002:a7b:cc16:: with SMTP id f22mr5888076wmh.131.1611971602106;
        Fri, 29 Jan 2021 17:53:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611971602; cv=none;
        d=google.com; s=arc-20160816;
        b=T+9s6V3x8Zy2Lq3d4FfdIrSTX90HNXcgvvlX6wdtlYTUspenlZ5zNuKDouuZCDfkkS
         bLJ2uS851+WNYVm2HwYUaWTgfWSjmlRPSWnR2Q+IW9AuqO8ZV0napkPo5kd6dYxiZ+r8
         QxEjtfrK0/pyA88wiQW9RpqBiShRXIoSf7LM6aFF5LWMQKepxdMOFt3P8Rz25syMxH9m
         5d6qtj+qxeWBPypGdCRgMeRYXNOFg55Bj0Tv9xIlHLjRG8UYDjiEeTYyiDQJ0f+rAShC
         IbkDCTNE23HpoNJ2qni0iv3DqxnB/Pf5UdGjCvJ80uxJuNABIS+9H9WUr23vSEHUHeSV
         JKyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Rd+PClqm9GCes/hSRY8Vwer9UM1+ZxmgnVmbkhC6bwQ=;
        b=fuKjHDq9kype/NnjmoCVzHILTnDRD4ui13zqg4BJgChHQuM/GgLD0HFMYUB5g9RULC
         /StiBjBZdoRCggMiUCNEEH25dRDBYSdMBqKknXXmJ804b2t/UkXOOtasTPKTkqG3yocP
         Kw5DJzfzYDWyKPWL/bfcoszf9SZZwrPjwRLUi6zCs8V0xoI9xaoAxsuDZ8t/vrpMnv/T
         NUXdrmlAJCrOL1bfVHnArXz2Tp7Z6DnqO8zEPRel9keDcJPCuPFgRYLm7g34FNty2kYo
         i4sTquE2awKa8PZnSBAU/92hT3dmzwZR2ONkd3DykkTrVrRgSv0zFhdzkWGIM4kMqhj1
         x9wA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=S8gP7rmC;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3sor5280690wms.24.2021.01.29.17.53.21
        (Google Transport Security);
        Fri, 29 Jan 2021 17:53:22 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=S8gP7rmC;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rd+PClqm9GCes/hSRY8Vwer9UM1+ZxmgnVmbkhC6bwQ=;
        b=S8gP7rmCHgjQ7YTM/ADW7lbRknMIzFi/kvGjnDTBiXVwxuHAweAduqVLnoWGJLI2Ik
         JfdEKMmuSM3Uo8wpGPc7O5efkIfwempgLB5LYyAxcpbOduzxSzOy25mGYctn0157CNuf
         zV0ZhHXDZP2UT03nYTizMXR4Vs40tQPbvbnOmuxLCvtPCrY0PMsdGMwTdM2ArhKkBchH
         TWyvRrzcqLAWdaanShYSz+sOqcrd7NvfsPGFpWW+5oIunY8vE5ZXCX2iLvPjoaAaSoPR
         DrMJQdIPKVgaAINimQlPBxGcMGIfkres1tY3aYap3kkTCgMibqAulTso5blHDtdlfoUu
         cwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=Rd+PClqm9GCes/hSRY8Vwer9UM1+ZxmgnVmbkhC6bwQ=;
        b=TL0m8oB3mdQAqBwlXBkFM+SgXJ3zq1TH6Q5jpVDgmMd4B+/Qorf8vUYwnxviP/A06X
         yDEx/Sx620svOIXTwPq2R6UJMMIaN+uOQBXlrju2EJBHZvbliRiflFESptZHg7dNbdmT
         8gV3jvGhupfhOqiMI+szr6xFmwpLj8aeLIEtl0B8p7cCR+ZGd/Gds3fwUBu1K6dh3R0w
         skq5vaArSqXRaNk6ju2CNGhIolONYi/dGUTXPANpQtOZA4NtTk4E+sBvxGN/LYUR7I3k
         6UPVcOoteZt+9fgMXbeo/sk4/G2VZtVQgI7gn3NmnjE6Uv6d2T+DoCGESHYtyh04ejGg
         Mv/w==
X-Gm-Message-State: AOAM532pq5NElDU61+cE2J6Z9mxOqvPX6bLkg3fJ3vjCuuxSwNTxJp3p
	kO3leiXliqun36QnLs+P0Dk=
X-Google-Smtp-Source: ABdhPJyiwfRfgUFvof6J96IEb3nlU6yPh2kst4/42gIlUzuKzVr51L9y/LCynY6WSCm+1mWXoo7usg==
X-Received: by 2002:a05:600c:2204:: with SMTP id z4mr5915886wml.138.1611971601791;
        Fri, 29 Jan 2021 17:53:21 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net. [83.57.169.13])
        by smtp.gmail.com with ESMTPSA id g1sm15181177wrq.30.2021.01.29.17.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 17:53:21 -0800 (PST)
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
	qemu-arm@nongnu.org,
	Samuel Ortiz <sameo@linux.intel.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 10/11] target/arm: Do not build TCG objects when TCG is off
Date: Sat, 30 Jan 2021 02:52:26 +0100
Message-Id: <20210130015227.4071332-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210130015227.4071332-1-f4bug@amsat.org>
References: <20210130015227.4071332-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: cpfocS4lVnSd

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
