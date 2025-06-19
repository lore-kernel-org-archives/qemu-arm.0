Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp253107njc;
        Thu, 19 Jun 2025 06:14:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUfcCrc4JBO+3XotmPT8jnxj6kVMDaL7mgJphXn7UTFviUB4fzWeEWjEET3SX7GjENP2NhFoujGcDzBlw==@linaro.org
X-Received: by 2002:a5d:5f4b:0:b0:3a4:e5ea:1ac0 with SMTP id ffacd0b85a97d-3a57239782fmr17234493f8f.5.1750338872403;
        Thu, 19 Jun 2025 06:14:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750338872; cv=none;
        d=google.com; s=arc-20240605;
        b=dZjgssrv7q4XYpO8lMxmp3CXaf2QzbTCJz33oizYCDQwwneFTVHWtQoZuRTEs931zu
         1ljQnuOyHzL56eoea3X78V0H1xuLaLvmNdglUXeFV/Isy9EzAVpWTmkb85Fxt5wipGiW
         lpAzaB23T+zzVzB53IjWwar2OuY8Eqwh5bYUDSnCnKaqE4UzzOxIhT5Kmz6O1o57F257
         AdK3S3rFHOikt84tSN3u12fLpiwZbFoST4LtjJLAf5iQrRFLpKLoonNjs8EDXaEmzKgf
         NskyB65563aUjO4uQGyCShx1i53Aj/80ia1YqsJanCkAhzYt36qyOvAbwKT+Szsaj0Pf
         xN3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Fteu42QoSrS1hfDvjcW70gOANYEhePCaBpCVcvmvL2M=;
        fh=caml/WCUy257VZEhGMN1+pG1WeycHYVO0iNHgH/r79g=;
        b=JSj87Cw2Ry7riPUgq9jYh5G033/3xyXOVxgDvcY/Wq0G3DEqyJps3YYibrb2K+k67n
         7JcvWyJVy+hAmYHsST1RlTA6UyoaBgKjbFNE2DgwxB+r8235aMjAMU9Xn0HUNAqW+Ina
         6UVtnHdHf6WkYbSHtfHaBiNBEdHZFpKJXbMgCluWbGfPVvIPFNmeAc+G51XYa5WCSIe+
         pL6H9I9qygViVeQ6sZoLNv/FHSVHqs9bHVnIUEXYC0agHvhSc43g5+aCRw9HB/qnL6LM
         k9FaspeWznmSWli5vBXY8LaM2ePfi8If3AgcSZrPC2v+Dbm9rFm8G6IaiVJ/m2DW+RlP
         3Z2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=liZZtXUE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a56196d746sor4801367f8f.1.2025.06.19.06.14.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jun 2025 06:14:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=liZZtXUE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750338872; x=1750943672; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fteu42QoSrS1hfDvjcW70gOANYEhePCaBpCVcvmvL2M=;
        b=liZZtXUEaGcNTzK16EQHJ0UcRfRExjlvsA2BZLUp46TLQclPlzduHN/bEBFPdUXARL
         wulSATHeZh0PoMNRNamBUrGUkESp3fPASlid1CtY9RTOfgIwvEvwEKCK+0RjqPMGy95r
         h8KlMRbNNlHB/0TQ8LSt8zrR1WLD+LzRtihWhFUGxmcf/Yft0opg0WelV8ht2oBQmOBs
         8DAIuBpNhrQRzv5O68SUY73LvB3GfzKfh08F2DhAWWOsJJD28+Dcw3BXLoJAVCE3hxfq
         lH8MtCm5s/oNgBDusU2GFgPbHRShsT/LXyt1ZEAQoJ/Ibx2Vl4jOJT/+Hm7QGUMMfwLz
         wDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750338872; x=1750943672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fteu42QoSrS1hfDvjcW70gOANYEhePCaBpCVcvmvL2M=;
        b=kFVDuuhCtNLM2AO6Q4y1TWnNdVigeELFM3AmyCuTCfwXd34mreTQTRM0gHP7AycoXt
         l1vWxfQXMknNdmEHGw6HCskOPMpJsChXuBJVytWpAYkioV8+7X1HvZVZDqh4GnvB4hzh
         VBezs3h4W7GT4hytL9YM3T4gcYoHu5Yo5Zxf2SZaU/sLeW5BqSLeG4hOb1P8UwKd6GiG
         5RGRbCF2jaC2E1k8zmnz821Zg8nK71skt9NZ+Xrl9X7MykVSKR+F2si8z7kdolHQ27UR
         l6XXxRTBVmnWWzsioixtUvBUziSE5JjW7gV073fB/2VnK+PD5YkcPvZeQHU+zr20X9iY
         naRw==
X-Forwarded-Encrypted: i=1; AJvYcCVv/Zvn+CyooflpnaTmyhx/5f4jkU2sM7ltAM9/XMBeejoD/DJ2xzH+xPG6CLUgFbvm9zkgvqHjX92zAA==@linaro.org
X-Gm-Message-State: AOJu0YzlYFhiRmYOwrnMX0qxIQr33LyXY0hBEDG0DR/qMHO0cMmjNtqd
	jIzxA8ISJd4yyr7bAm6HJAjhZqlMsJHDRpep7SKXqX3QEUNCn4kYOavNDNdcXXYXK/N5WnAZEcs
	nWWgBIrfqHQ==
X-Gm-Gg: ASbGnctuOgsQYYyGke82qM5jUOBE9L59Kuu2D3rNq3lzZCw4bXq9k1zndZm8CYjUC9o
	NH8egmpT44KC2R2/G/+fx0+yunJ/TjN0Ruat82FqaAR0ooaU968Ecf18MlxuvPWoZSAzJMRMYUp
	pPBLHonjv+RMqwRBHrhM1a7u4gmQ8aEYZcHLXm6H1+J7adyinqKmW9azRMh1G8pekLT7TN6vfyx
	S3doZRUIEU+En//nxknD+PSQRfNLAz+CFl8/LZhK8uTtuVjVmFETvXJxMZ50WYbV/o+oMaDdIwO
	z287TF3oYqBcQifGOOIeNH517I99UpyJvQdKWfgNe4cUU8YcapR35884sCr2syz06OM5qP78ym0
	rJ65XpY27lRiOHjIzzTjZKQYCrrEPJTQA5TSB
X-Google-Smtp-Source: AGHT+IGFsjyeXWntOOT6DxV4WwpLZcxrPw3Vv2X9REiOSlt/evxYNtcIXAR3/IHz9oPPkw1DpS+h9g==
X-Received: by 2002:a05:6000:402a:b0:3a5:27ba:47ba with SMTP id ffacd0b85a97d-3a572e925c6mr18063847f8f.44.1750338871833;
        Thu, 19 Jun 2025 06:14:31 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b1bc97sm19654066f8f.68.2025.06.19.06.14.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 06:14:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Julian Armistead <julian.armistead@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Alexander Graf <agraf@csgraf.de>
Subject: [PATCH 13/20] accel: Introduce AccelOpsClass::cpu_target_realize() hook
Date: Thu, 19 Jun 2025 15:13:12 +0200
Message-ID: <20250619131319.47301-14-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619131319.47301-1-philmd@linaro.org>
References: <20250619131319.47301-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lGOC2dRCm+5l

Allow accelerators to set vCPU properties before its realization.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/accel-ops.h | 1 +
 accel/accel-common.c       | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/include/system/accel-ops.h b/include/system/accel-ops.h
index 44b37592d02..a863fe59388 100644
--- a/include/system/accel-ops.h
+++ b/include/system/accel-ops.h
@@ -35,6 +35,7 @@ struct AccelOpsClass {
     void (*ops_init)(AccelClass *ac);
 
     bool (*cpus_are_resettable)(void);
+    bool (*cpu_target_realize)(CPUState *cpu, Error **errp);
     void (*cpu_reset_hold)(CPUState *cpu);
 
     void (*create_vcpu_thread)(CPUState *cpu); /* MANDATORY NON-NULL */
diff --git a/accel/accel-common.c b/accel/accel-common.c
index 56d88940f92..55d21b63a48 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -105,6 +105,9 @@ bool accel_cpu_common_realize(CPUState *cpu, Error **errp)
     if (acc->cpu_common_realize && !acc->cpu_common_realize(cpu, errp)) {
         return false;
     }
+    if (acc->ops->cpu_target_realize && !acc->ops->cpu_target_realize(cpu, errp)) {
+        return false;
+    }
 
     return true;
 }
-- 
2.49.0
