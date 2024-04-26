Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp347499ejb;
        Fri, 26 Apr 2024 05:30:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU60b/PQx9XrZF68SIMeICMG6efMaAvnxDsPuzm+CVX1IcH9FWO2W6tje3ysoi7KHKX8v4a7ShlDyPtAf2GhUra9zQgZdfc
X-Google-Smtp-Source: AGHT+IFD7jaAmaTZUY8syBb2aWf1DyJse9R+Pyf7aDOIAG8MAnarXlVxdQHWW2llwEm7vANFHgrw
X-Received: by 2002:a25:aaa4:0:b0:de5:5040:ea12 with SMTP id t33-20020a25aaa4000000b00de55040ea12mr788782ybi.32.1714134607637;
        Fri, 26 Apr 2024 05:30:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714134607; cv=none;
        d=google.com; s=arc-20160816;
        b=M32sGkCCXJKHjDSIcqn8Bc2ezMSTUIztkC/LE/xdiogywm4ocVzSTbEdCUtKEKjj1E
         bewwWx0nwfD1y/tMbifkEAoHelvX4d3JXz+hdydnudksPLbfj4hcss1QR7wE2ly8O27+
         lNrWQ623nsSvI9DIoo7KH37MdPV2uFnUWyqiz+ol71Ec8CJDV1STlKQ2z+AGOhDrNDIE
         3hE8K51IBwLn65fdTctwECDzQuCQOHCpxfIYnPb85EF8L6xsboimvJa0vSIZ/U6+ezLQ
         yE4oYow0+hc/CVR3lMv7itRMAsmwKybEBIP1t44FxljGckvmRhtZX+qQ206VEUhvoBgX
         W2+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=N0nd37JbIqFWOk7TVvpZsBjDnU/+rTPYGOgPUq3SDrY=;
        fh=ccPkIv+ASOOBZ/9yqv8QUMFw2GtqYDK2ik0zYMtkoQw=;
        b=OIp+MZzsrU6pxKXAMT9iRqpTsjndIxzZB4fD8D/Z8x2tl2bqlk7dLubAAex6ds/VUt
         zb2fj9ncW1AD1Y/86M23/kB7pixgIbxmGeHamEk7/EIdDnQbrtdUKF2im3NKmRCwDPxa
         vxmBo06yz51ot7QxFvAVUWqPpFWo3hi8l4btyBnxFcoK56BEgYcc+42wlhnHuPtxAvkC
         BADKGGAjsWKtXoJFFmMYeklK1rcIN7ffvRHtDRoi7sEHXcSOIo9CCoL6/PJt1iCbZi61
         44MKwne2IFI2N6H7U6x/ikgdQGIU3k/umQf//PbicNqs55gholpFHqgpgmPwEQp2/bAk
         7NgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AXqnKx4F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x10-20020a05622a000a00b0043a037426e4si7725069qtw.190.2024.04.26.05.30.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 05:30:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AXqnKx4F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0Khg-0003Bv-Eo; Fri, 26 Apr 2024 08:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s0Khd-0003A1-UG
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 08:29:21 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s0Khb-00064l-3N
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 08:29:21 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41ba1ba5591so2421245e9.1
 for <qemu-arm@nongnu.org>; Fri, 26 Apr 2024 05:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714134556; x=1714739356; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N0nd37JbIqFWOk7TVvpZsBjDnU/+rTPYGOgPUq3SDrY=;
 b=AXqnKx4FbHeeJXfIuj3UCBTL1pLdXSthtg832dHJ9ggZerQCNOUDreXyKJEUulqhRg
 oecRk88yZNhLXtPdJ7vdjTgNsA4w1Rsxt5rtaT/OTgWJCTsIqP+TlsPQO/j3/KoOqrz5
 BHsct3d8bFj1vxYOxVjj02EZS94M3Jjkw6iKAcIEIZA9PJq1lZ4RZRendNhSX7XZ30qy
 REj9BZkzeQhkjgM4KJlCAuOf8mAcwYJDRteFgQBYoEaVjXSNuul2zc6P8SDUMCgIvDI6
 gg3efamYVpL5agODwePI6+r1rvOzucEg58cVlDpWUnk/T/AGX1xHikUl5iUmrQVgzQz/
 sgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714134556; x=1714739356;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N0nd37JbIqFWOk7TVvpZsBjDnU/+rTPYGOgPUq3SDrY=;
 b=Y0je2V17pmjjkwZySQfPf5Fk+FACF4pqQw6TtCbwx+XxSAbMuc6FpHgv0SSAZVFYYv
 v/tfPPFt0c8rxgxDPnWuMdaeqrTYJ4dTTc8ncmtdg1MLV3Kk1Oxf/piyNCBtXJhiOhsQ
 C/EEAVYu398huMnaZttf2TUbHbshkkwFY/EqXuzehM0mx2gJOfF2eZBmuBU0GY1zD4cs
 RAQJvcQ16DBbxCY511iClxu/g4TvZ4izgBD2L/OakyrkCsiUpMeeY+fUU9/0JvHot8dV
 sMsNbZ/Wn+9MNbTephkSKXltN58DV80KVOenlU3bkeos4OpSED9S0lW3pi7eUeGD2TGh
 /S2Q==
X-Gm-Message-State: AOJu0Yzs+AagI0NySy76kZOV/7ykx7RBbTrA4K3dyQzO89+KQHCCWPpO
 ZvT3C2wgIBsR37zpvlXiVC7OwlDZY8nPagG8DpXze8W0sD4rtnEnvIjlOVnfrFnizqDaXh/pfRk
 m
X-Received: by 2002:a05:600c:4e47:b0:41a:e995:b924 with SMTP id
 e7-20020a05600c4e4700b0041ae995b924mr1758805wmq.33.1714134556360; 
 Fri, 26 Apr 2024 05:29:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a05600c460f00b0041a964b55ddsm1397134wmo.1.2024.04.26.05.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 05:29:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v2 2/4] hw/arm/sbsa-ref: Force CPU generic timer to 62.5MHz
Date: Fri, 26 Apr 2024 13:29:11 +0100
Message-Id: <20240426122913.3427983-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240426122913.3427983-1-peter.maydell@linaro.org>
References: <20240426122913.3427983-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vdu/QX54K1Sa

Currently QEMU CPUs always run with a generic timer counter frequency
of 62.5MHz, but ARMv8.6 CPUs will run at 1GHz.  For older versions of
the TF-A firmware that sbsa-ref runs, the frequency of the generic
timer is hardcoded into the firmware, and so if the CPU actually has
a different frequency then timers in the guest will be set
incorrectly.

The default frequency used by the 'max' CPU is about to change, so
make the sbsa-ref board force the CPU frequency to the value which
the firmware expects.

Newer versions of TF-A will read the frequency from the CPU's
CNTFRQ_EL0 register:
 https://github.com/ARM-software/arm-trusted-firmware/commit/4c77fac98dac0bebc63798aae9101ac865b87148
so in the longer term we could make this board use the 1GHz
frequency. We will need to make sure we update the binaries used
by our avocado test
 Aarch64SbsarefMachine.test_sbsaref_alpine_linux_max_pauth_impdef
before we can do that.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I leave it up to the sbsa-ref maintainers exactly when they
want to shift to 1GHz (probably after a TF-A release with the fix?)
---
 hw/arm/sbsa-ref.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index f5709d6c141..36f6f717b4b 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -60,6 +60,19 @@
 #define NUM_SMMU_IRQS   4
 #define NUM_SATA_PORTS  6
 
+/*
+ * Generic timer frequency in Hz (which drives both the CPU generic timers
+ * and the SBSA watchdog-timer). Older versions of the TF-A firmware
+ * typically used with sbsa-ref (including the binaries in our Avocado test
+ * Aarch64SbsarefMachine.test_sbsaref_alpine_linux_max_pauth_impdef
+ * assume it is this value.
+ *
+ * TODO: this value is not architecturally correct for an Armv8.6 or
+ * better CPU, so we should move to 1GHz once the TF-A fix above has
+ * made it into a release and into our Avocado test.
+ */
+#define SBSA_GTIMER_HZ 62500000
+
 enum {
     SBSA_FLASH,
     SBSA_MEM,
@@ -767,6 +780,8 @@ static void sbsa_ref_init(MachineState *machine)
                                     &error_abort);
         }
 
+        object_property_set_int(cpuobj, "cntfrq", SBSA_GTIMER_HZ, &error_abort);
+
         object_property_set_link(cpuobj, "memory", OBJECT(sysmem),
                                  &error_abort);
 
-- 
2.34.1

