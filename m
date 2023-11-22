Received: by 2002:a17:906:3119:b0:a04:79f0:9a0e with SMTP id 25csp532851ejx;
        Wed, 22 Nov 2023 10:31:07 -0800 (PST)
X-Received: by 2002:ac2:5f43:0:b0:50a:a82c:a5f2 with SMTP id 3-20020ac25f43000000b0050aa82ca5f2mr1912856lfz.66.1700677867610;
        Wed, 22 Nov 2023 10:31:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700677867; cv=none;
        d=google.com; s=arc-20160816;
        b=pTe5T5o8OI77q+lTLXdj4V+7zpC0CoEZNQsKlIe39stS63xezNzBu9ZekgHCDRuoyj
         Ktw1UIpVvwh1PsPm9joxGwB3ykMnMUBlxhx8OIb2vzq2cVwaIuHxRx8K7yWU5RPk3Qz9
         YMRnO5sC3rW0EJdX422zADHGR9KRJSG70ue3Ky1leE1sGi7xXgFC2ocugZ/pnUyXkUNm
         PGWU6ajlvXdZgGHcnrRYKhkH+aZS5L+rnBF3DQJpkFCTIGtzp3pRJ6codWAUJ/Z92vuJ
         iuui2Q5Hf9LEK9Bdq3NynkDOnfAdyKjlYW/aNjDcaZ1Wy4e0dUws66kwjw/Pn/E0n4Dp
         +omA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=aGx5XygnULFFxHYgrgUAbmNY2b76PBI4xDcz2zCtY2c=;
        fh=aTzmneatFEDiKMS1saCdxZb39+p//OutFupiUjvLGTw=;
        b=AnzhuPFMZ8iRi3Z7woF8YjqvcLLz3yAMhUtna8nvl0G5X7mYVVwavnsV1uzbQ61rAa
         y2ehISYidk6QlpiiE6RUri0OpvCqQArSBbN/rorV/uJJLAqobWtqiRuPQ5GApGNbLEW3
         QSvIgBkTxaoqOTD5+UFSGuI6GFJqKSojcgjL1f+g+e4HQ1IIPjeVCldAV7XOMuTpsuGM
         PrxwnGWra04nL5exNcHN94/O5GG/IXXwaXXgp2Kxp4bG1uluSX6kLioPHfqzLv6GdcWb
         UO9s+wEfwkQXFI3GCC/jiZ+VLJtnHC74nCv9ywfovhhCMG75HtX8ic6d+G2Cc9o5DW2i
         ZJcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pym4YDMh;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t25-20020a195f19000000b0050947c7c8e4sor3231741lfb.11.2023.11.22.10.31.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Nov 2023 10:31:07 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pym4YDMh;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700677867; x=1701282667; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGx5XygnULFFxHYgrgUAbmNY2b76PBI4xDcz2zCtY2c=;
        b=pym4YDMhpkL/TaoB0rgzv5pKeiitsLwhO2NCBDsvcLXizHPZBTmCOr64yVqTPGASw4
         6VE938ThioezcXWGrYdO2N9UN4U5TzUTRZvhlarwMRgYAgDvTKbyZFTHEmc1vF6qJxtS
         gZhXNgAFR2/x2EYP60hzLDm3rbN4dqJYE/6C2QP4WkqgD0/lAJmVHyzETJJiEvrk8N5I
         TD4AaJQlLTjgT9t24d5PYBjhVm8ja1xJqn399ZMJNtRnj/yMnuUP0m59Cz8EbhbBZiFw
         /IXlJ8YbY+ry+MzWKd3eH5T/yrLowIfkWb/AWHtxkXJX7WD8F03laydhX0dh2TKBxI6t
         RfmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700677867; x=1701282667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aGx5XygnULFFxHYgrgUAbmNY2b76PBI4xDcz2zCtY2c=;
        b=FsyHwnfUThcjL4Kb4glrheoKS1MxO3SKGtLW7j7FnShyfigOY4USNngdu0K2nhK7x7
         UWO92AILn1osimaLW0ukTuDj3+sC0BKJkF5Bna02piUeJ5QKwOoDchDRUJGH6sGhQR1G
         DuE1ARn491k6XncwbKUIoM733lzKkbH0zRl7T8csSsecAY9RIHLje8c0bj0PVDAlmN44
         78eV+cP2Bn+PBQd2heyUYiZyAqGel+Vco9AIu6XnzT+YDtzzS9mKnoU9uW/jFRxZ00Vq
         dLs3VUFckB3U4m2xvjzAjjityc3GEcrkL07JZZDgBO/gyf9k1gRQfJfYSMSO09mkupLh
         rB0Q==
X-Gm-Message-State: AOJu0YzYVrfh0al8AqhrkF4jhRNdqfXn2G2yIVOJt2qUxhjwEjTQHQjS
	hPFBnAjnodYGbRkKtZoZSjHOBRtF
X-Google-Smtp-Source: AGHT+IGXiea0r3oI+ORFeqbb0Tw5S/xHce2rzUHHnseNrrpvUnoFaJ16nWaBmzGL7TIfeQ4Ggblq6g==
X-Received: by 2002:ac2:4a84:0:b0:507:9a49:2d3d with SMTP id l4-20020ac24a84000000b005079a492d3dmr2124262lfp.31.1700677867269;
        Wed, 22 Nov 2023 10:31:07 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (pas38-h02-176-184-5-64.dsl.sta.abo.bbox.fr. [176.184.5.64])
        by smtp.gmail.com with ESMTPSA id dh10-20020a0560000a8a00b0032d8eecf901sm61377wrb.3.2023.11.22.10.31.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Nov 2023 10:31:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH-for-9.0 03/11] target/arm: Declare ARM_CPU_TYPE_NAME/SUFFIX in 'cpu-qom.h'
Date: Wed, 22 Nov 2023 19:30:39 +0100
Message-ID: <20231122183048.17150-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231122183048.17150-1-philmd@linaro.org>
References: <20231122183048.17150-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: g4frWhqgHxPW

Missed in commit 2d56be5a29 ("target: Declare
FOO_CPU_TYPE_NAME/SUFFIX in 'cpu-qom.h'"). See
it for more details.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu-qom.h | 3 +++
 target/arm/cpu.h     | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index bf6b3604ed..be307037ff 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -33,6 +33,9 @@ typedef struct AArch64CPUClass AArch64CPUClass;
 DECLARE_CLASS_CHECKERS(AArch64CPUClass, AARCH64_CPU,
                        TYPE_AARCH64_CPU)
 
+#define ARM_CPU_TYPE_SUFFIX "-" TYPE_ARM_CPU
+#define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
+
 bool target_aarch64_available(void);
 
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a0282e0d28..d369275827 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2834,8 +2834,6 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
 #define ARM_CPUID_TI915T      0x54029152
 #define ARM_CPUID_TI925T      0x54029252
 
-#define ARM_CPU_TYPE_SUFFIX "-" TYPE_ARM_CPU
-#define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
 #define CPU_RESOLVING_TYPE TYPE_ARM_CPU
 
 #define TYPE_ARM_HOST_CPU "host-" TYPE_ARM_CPU
-- 
2.41.0
