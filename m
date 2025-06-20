Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp877509njc;
        Fri, 20 Jun 2025 06:07:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWIT1p0pxdsxIy1r3nPV/wWI3ujwN0JBnVDu8YhmbGfzTapzwvBwRCiJwMlVUxzI7jk9xB8LyM6HXPERg==@linaro.org
X-Received: by 2002:a5d:64e6:0:b0:3a5:8d0b:600c with SMTP id ffacd0b85a97d-3a6d12bb37emr2637930f8f.3.1750424865696;
        Fri, 20 Jun 2025 06:07:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424865; cv=none;
        d=google.com; s=arc-20240605;
        b=VghSMG2jAgqfDTIe3QtGezdrzmW4jP8/CgwLXCOIEuFI+uamZ4Tq/chw25EaiQ7SW9
         KjfOmzxz8adu+wE9Jt/azSRf9xJhbWUCn+d5nUn+HcISugWPMADZqWugrR6JSMG3G+q3
         T51On43sjihARP2AZb5R44cz7fE+e9SGTf5Hjr3BHlWz1FHtdetYHJcoQK4ACOGhR8In
         DOoWEH3lK2TXxLSV4LHayCTFRjHtWO2uBmDma36JuSkxsUCJSJ2FftKh/20u0pcXA07U
         vNKMyQnYh9qxcOqVwMg6tY5onoKyQbrMRrm2YbFLyX/h0LbHDx+AqukQfisWlTHF7Yby
         2U0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FtS7m+vqlh7Qr+Y7luF/PvAhAhpP9RBj3It7GX3FL/4=;
        fh=Vj9//Ltt3NEMbkGjwYGXSBfL4uCHYiwtoxiRl2CPKDk=;
        b=P3OK1HQ4Vvk47QJW9wD/xA92SkaAegb9EN8b2XiTo0JtZVPPizy9bwrwe06CrEAAeU
         RD5QjBVv7f84gO+YcJ99PNEkpgOxotQDubkc5C1A0PZyQY3wOALwJnqMKGAVFp6yFmt6
         Lo3+zk/QHh7f4faxGxD3F2O4rXbRskYx9mSFryBuKanIjYmjYaqdT11shwiPBQBAC9OP
         DWDvFp2XnpzkxjoINXNRHX94hCMZqQURvg+AQcaH2jzeWuiKO0Yxdr8w9w55I56sgHWx
         wdkvKBRfcAPjC4iJ2Tl5+QXaSItkUUI7bCB82TPctJV7eDLqGqDILwNWBOznrCnaRaU9
         EcRA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uS8XPUYr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4536470f73fsor7807005e9.10.2025.06.20.06.07.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Jun 2025 06:07:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uS8XPUYr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750424865; x=1751029665; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FtS7m+vqlh7Qr+Y7luF/PvAhAhpP9RBj3It7GX3FL/4=;
        b=uS8XPUYrKTKLDT7YLCppmD8Aty3RxTynM3CBGtOwwZlTpG5ISo80m4+aox+pHKIYZF
         I1XJ/hhLYcMWbxotTV1gcsiA34wofHw2502J0gdxK/JiWmGsnM5TcmP2QnIg7pvUebJs
         tNbwjz2L9zgqwmJk3olZ7kXyxXvZTBgBhpJ19Fn4caeFXLCzfyN0uFF+gaxCDU2+3gFW
         GcFhJ9DvZVUmrAIS88lBADBM4OkJRjbtYdN57y9zqnZZNFSTyrtiet8IdRpIDoiwCVkw
         GkfvhceyOY1W8BtKgbxuWjejGMZxhFfHK8Ms0FoesCMGCpzYLyLhMV+UR9d5d4llEBBn
         bXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424865; x=1751029665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FtS7m+vqlh7Qr+Y7luF/PvAhAhpP9RBj3It7GX3FL/4=;
        b=FbovhYeP9zFKxgH/Irhoin99rTXEdoTrnvFEXg3exx5OYI+i8P6dVIQmG4ghEhfzA1
         Ta/fMrM6hbj91e60LeVzvxkEjC4dMg2+tUaDzi4k2a9oq7Zffa6ZeEQo+jvKR7IokkNu
         t2GBlNNgX9jyxu6LyFE+PlDG/MPo4XdJ9KiARAXGPLM3kVpfeEMAWRGTCb4RtmtKge4J
         iaC1ZUZTNgEpTUgCPOgrcL8qnVTHWs/URViX1mTIywLV+Ptc5R9hvd1k9trWwlIoJLsn
         4/Mx5+D+bkrbLKvyH5yDOC2CMDHfIFNJWGdJ4Yo09DAb7wPPjnJ5DIqW+wj8+1zHfmuz
         0I2Q==
X-Forwarded-Encrypted: i=1; AJvYcCULmOiygrRS7uZet/pi+qYvjj0Hi5A7mrkN6oeFVWtF4ZMI3ua8ncFTWWHIz/fnGn3EYFhGQXz5DcxW5A==@linaro.org
X-Gm-Message-State: AOJu0Yyu4vfhich87TODUhSO6PyPOcjD8RXTOISE1s/nm5q+xqq3hnhY
	aExgNIm32EfH1IZfMk5lk6vcf7y29x7MsKphooim+6lao80tPQE5VYdKf+8dI9dk6VunPA==
X-Gm-Gg: ASbGncu7jyHEQXzkfZeOAvNdkOsMkKih1LkwnEb8mlNOB2hLWSrPa1edonSkh93wiPA
	+8X0AkWHcmwg5NxiuBlmlGQfV/Jpn29DowtY4lBhZGM+GX/8ZN63pO/CoY0iIkFVQO+39449//D
	o2M7vYIJ10Srpm3geysrHNUBHmSvgohT6Sl3xleIWi99ttyQ3hXTsZrhl0mgHCIiXIqABvhWmJg
	EyHI0lo/fn/lnqC/iXWHvkxUysEpl5UBCiWw+CcgFwyXyHrLTk/hNGunK5VEAD4PrvkYUsefOB5
	nCB6S7BkXSm7v3hdXV1DmfzHxZzmEy4nxIZIxy0e0k9PZEpifxnOxY2ooM5RZgIVFBWpYHr4uef
	Jr5m6Dc3ptJVPTyylAGxdzxq87RAD+ntUW/Rr
X-Google-Smtp-Source: AGHT+IEu8ioD15jbsMdE6dCvAm9djKzVzv/o3I1P7WHIydoF4yyDTcP15aw9RWPaSxBAHXijuGZgUA==
X-Received: by 2002:a05:6000:310a:b0:3a5:8cc2:10aa with SMTP id ffacd0b85a97d-3a6d12fbab7mr2059859f8f.32.1750424864938;
        Fri, 20 Jun 2025 06:07:44 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd6efsm24774235e9.19.2025.06.20.06.07.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jun 2025 06:07:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Alexander Graf <agraf@csgraf.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bernhard Beschow <shentey@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v2 06/26] target/arm/hvf: Trace hv_vcpu_run() failures
Date: Fri, 20 Jun 2025 15:06:49 +0200
Message-ID: <20250620130709.31073-7-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130709.31073-1-philmd@linaro.org>
References: <20250620130709.31073-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: VmVsFEoKsJiv

Allow distinguishing HV_ILLEGAL_GUEST_STATE in trace events.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c        | 10 +++++++++-
 target/arm/hvf/trace-events |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index ef76dcd28de..cc5bbc155d2 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1916,7 +1916,15 @@ int hvf_vcpu_exec(CPUState *cpu)
     bql_unlock();
     r = hv_vcpu_run(cpu->accel->fd);
     bql_lock();
-    assert_hvf_ok(r);
+    switch (r) {
+    case HV_SUCCESS:
+        break;
+    case HV_ILLEGAL_GUEST_STATE:
+        trace_hvf_illegal_guest_state();
+        /* fall through */
+    default:
+        g_assert_not_reached();
+    }
 
     /* handle VMEXIT */
     uint64_t exit_reason = hvf_exit->reason;
diff --git a/target/arm/hvf/trace-events b/target/arm/hvf/trace-events
index 4fbbe4b45ec..a4870e0a5c4 100644
--- a/target/arm/hvf/trace-events
+++ b/target/arm/hvf/trace-events
@@ -11,3 +11,4 @@ hvf_exit(uint64_t syndrome, uint32_t ec, uint64_t pc) "exit: 0x%"PRIx64" [ec=0x%
 hvf_psci_call(uint64_t x0, uint64_t x1, uint64_t x2, uint64_t x3, uint32_t cpuid) "PSCI Call x0=0x%016"PRIx64" x1=0x%016"PRIx64" x2=0x%016"PRIx64" x3=0x%016"PRIx64" cpu=0x%x"
 hvf_vgic_write(const char *name, uint64_t val) "vgic write to %s [val=0x%016"PRIx64"]"
 hvf_vgic_read(const char *name, uint64_t val) "vgic read from %s [val=0x%016"PRIx64"]"
+hvf_illegal_guest_state(void) "HV_ILLEGAL_GUEST_STATE"
-- 
2.49.0
