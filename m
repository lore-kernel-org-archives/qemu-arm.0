Received: by 2002:a05:7022:7e0d:b0:70:a3b7:dfe7 with SMTP id ut13csp6659286dlb;
        Tue, 2 Jan 2024 08:05:18 -0800 (PST)
X-Received: by 2002:a05:600c:4755:b0:40d:763d:c7fe with SMTP id w21-20020a05600c475500b0040d763dc7femr4070009wmo.121.1704211518704;
        Tue, 02 Jan 2024 08:05:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704211518; cv=none;
        d=google.com; s=arc-20160816;
        b=OaBnKjq1v6eb3qKXXMy0dFShKS2X/PYj7/4gG8TjrN0h+CZ45mdr3GY78euThdd2//
         oh/Nayl8+0QbTbMfPmKdDlXprN8gVIc4jWR6oPVSh5U6SRgKjjcF+11YBflBG2w1zcML
         X1ApyavFLIswe0FLT+q+WPVnY4MMDHw7WfFehgB2WsCZXuHKO/7uD4b+IcyBHeLYI8Qj
         7c/tUW3ghD8IsKrbBvePKx/+PUe8vSCJZltjdIgx/afv71m7P8hM5m/gVVqRV3q8tTCO
         wJUW9FTTlE8CuijHS6mlUjBHhhiyjsr/Zicf5HpiatLlh1R4dstM7UGwQE/fUOz5P4JB
         QaMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=J38P+ankfUbUztT5GJCTo6FfwFdn7YoTpHgRI5fDY8Q=;
        fh=Fbl4rt7vNadFyu+mhE5sPZ2m5GJmVL0UTbP+h3uuTlY=;
        b=cQpke2JLkYD98EseX4/XDob1geEZp30sf3G/58X+qsBWRaw1ytjUEXA1FSxj/I3KIS
         4g01al4P5SR2kFL5ILOxuX09MQ4p2yZ3PcPRopGPzc74OqPxC+fIKlJlz20aqTPAQGIS
         WjrFLH+gTrhyI6O0vKELLSqb+i9t3i4so0ZMCMhX/OlVmQWxOMHKyM9MzFapd04hkixC
         j/ieGv80UPjDri0Z0YYWE0kmwRkbWO6q+13Zi3/h6Cn9DIWHIjrjWFQeeV8o15RXo9zV
         OKAJWRYYIyj3gVkpucyyDrtXBvy7vEuHMIAqkniBRwQPqHvD7xGm4D1rF0UHX2OQPXvV
         Z6+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qgzZPy+C;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k11-20020a05600c1c8b00b0040d46076156sor4212036wms.10.2024.01.02.08.05.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 Jan 2024 08:05:18 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qgzZPy+C;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704211518; x=1704816318; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J38P+ankfUbUztT5GJCTo6FfwFdn7YoTpHgRI5fDY8Q=;
        b=qgzZPy+CS291f2PyEyed/PiU8N92oDIqwUwFMcmeYIHNcjyIKT4zk6BY1HEmJPP5Vv
         KWt1smdWlq7WsqKqofCDZmWqr6Avrhlni7I8QJXCgHVQ3HyRWsfLkXxmCmxTzgZYlYIB
         KYOx1xd/j5KXyMzO188l0GFbA4lC4iCpGiNrQQo22//I3oNvxNQJFuYY1jI2Hi0zFgLa
         46yRap1lMimag/xh6oJ003iEiOsLx+t25b2WMsT9RSo930pR0Hi9vFxtwjd1jTAmrwJt
         2XpLOU2T+6yJGKlw0u+0Kau7tZ2jeM8W5PSp8cVm00LTmj3yC1gsD/T1aEJlEly3+Vru
         g4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704211518; x=1704816318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J38P+ankfUbUztT5GJCTo6FfwFdn7YoTpHgRI5fDY8Q=;
        b=HOS78u0WdBE1SASpWsOV4/uRUyJ8UToUSRV2uvbu5t/RiAmWfTD5ZeGZzbdzrJKuCN
         uuvwsyBJ/ozorIbzEo05eh3P7GfOlWLxveF1amVXIo5bo1t0gdHw1jlsfCWGC+4SPGNe
         PL8hCFSANgoj5kgtbKn2p3SlF4KTk4JPLl6NHuJ75g3jXVDDyfcZ6bgs99jDR8TvhXWP
         0OcKojDFw34AaH0vsodttfWJNhdKQlKktDSK5fSgyeMUFj0pFIO/tw7Y4sRudkNOlkCy
         8OLMUDf3iFguSNNcqOfwP6UlzGVGlAhD5VFGEP/NUPRU5uXrhoDPv5NIjIOn9lwePqpk
         bPQw==
X-Gm-Message-State: AOJu0YxcbdzKGvuIo7CzE3UfyHKJCkkS9yjU9WXKVM6GisX5Ty3HOMu+
	nrYBfaei7GH7+oSYKHzB7ctMGOO+PPPF71SW
X-Google-Smtp-Source: AGHT+IGK81sSXeAZVigy9QHy8W3v7E9N09SlmUg/+/UeieW3S9EWG4i4DkIxryo3kfAalZFebgBIRA==
X-Received: by 2002:adf:ec82:0:b0:337:37c2:fc57 with SMTP id z2-20020adfec82000000b0033737c2fc57mr2610183wrn.106.1704211518286;
        Tue, 02 Jan 2024 08:05:18 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (sal63-h02-176-184-16-71.dsl.sta.abo.bbox.fr. [176.184.16.71])
        by smtp.gmail.com with ESMTPSA id b16-20020a056000055000b003372dcd739csm9582956wrf.86.2024.01.02.08.05.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 02 Jan 2024 08:05:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	Luc Michel <luc.michel@amd.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Eduardo Habkost <eduardo@habkost.net>,
	Frederic Konrad <fkonrad@amd.com>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 3/5] hw/arm/armv7m: Convert ARMv7MState::vfp from bool to OptionalBool
Date: Tue,  2 Jan 2024 17:04:52 +0100
Message-ID: <20240102160455.68612-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240102160455.68612-1-philmd@linaro.org>
References: <20240102160455.68612-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: NbLcvHqfQ1RQ

We want to know if the 'vfp' property has been initialized.
Convert it from boolean to OptionalBool (which contain the
'unset' enum).

Note the monitor output is changed as:

  (qemu) info qtree
    ...
    dev: armv7m, id ""
      gpio-in "NMI" 1
      gpio-out "SYSRESETREQ" 1
      gpio-in "" 96
      clock-in "cpuclk" freq_hz=40 MHz
      clock-in "refclk" freq_hz=0 Hz
      cpu-type = "cortex-m33-arm-cpu"
      init-svtor = 270532608 (0x10200000)
      init-nsvtor = 0 (0x0)
      enable-bitband = false
      start-powered-off = false
-     vfp = false
+     vfp = "false"
      dsp = false
      mpu-ns-regions = 8 (0x8)
      mpu-s-regions = 8 (0x8)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/armv7m.h | 2 +-
 hw/arm/armsse.c         | 2 +-
 hw/arm/armv7m.c         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
index e2cebbd15c..6c9e65b644 100644
--- a/include/hw/arm/armv7m.h
+++ b/include/hw/arm/armv7m.h
@@ -105,7 +105,7 @@ struct ARMv7MState {
     uint32_t mpu_s_regions;
     bool enable_bitband;
     bool start_powered_off;
-    bool vfp;
+    OptionalBool vfp;
     bool dsp;
 };
 
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 31acbf7347..472b16fc30 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -1028,7 +1028,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
             }
         }
         if (!s->cpu_fpu[i]) {
-            if (!object_property_set_bool(cpuobj, "vfp", false, errp)) {
+            if (!object_property_set_str(cpuobj, "vfp", "false", errp)) {
                 return;
             }
         }
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index d10abb36a8..3610f6f4a1 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -548,7 +548,7 @@ static Property armv7m_properties[] = {
     DEFINE_PROP_BOOL("enable-bitband", ARMv7MState, enable_bitband, false),
     DEFINE_PROP_BOOL("start-powered-off", ARMv7MState, start_powered_off,
                      false),
-    DEFINE_PROP_BOOL("vfp", ARMv7MState, vfp, true),
+    DEFINE_PROP_BOOL_NODEFAULT("vfp", ARMv7MState, vfp),
     DEFINE_PROP_BOOL("dsp", ARMv7MState, dsp, true),
     DEFINE_PROP_UINT32("mpu-ns-regions", ARMv7MState, mpu_ns_regions, UINT_MAX),
     DEFINE_PROP_UINT32("mpu-s-regions", ARMv7MState, mpu_s_regions, UINT_MAX),
-- 
2.41.0
