Received: by 2002:a17:906:3119:b0:a04:79f0:9a0e with SMTP id 25csp532932ejx;
        Wed, 22 Nov 2023 10:31:13 -0800 (PST)
X-Received: by 2002:a5d:60c3:0:b0:32d:b8f8:2b18 with SMTP id x3-20020a5d60c3000000b0032db8f82b18mr2194849wrt.32.1700677873108;
        Wed, 22 Nov 2023 10:31:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700677873; cv=none;
        d=google.com; s=arc-20160816;
        b=fustPTFN7vhExJPvtArnrP+Y1yhjkcRZa8wSCKKjnD6ju3X5Yn3/6C46p4aBqN2nAn
         32bdx2P5khkfHSmNi1bQWhak6XoJGzf7Cke+Fe08hQh4io6kPsiaExe3TVf39cm/M33z
         iF51BcYZqYXC/cSJHb6aJ3URlPLWHxn5AFMqH0ER0iXlguokjDQ5tLdVK8GlEMf9T/Qj
         CwfqQGq5I7vNdec1YZN5t6wdpmqdaONnb3bt30YnRN/Celys4TQpKy4w7aUJuwFNqr5H
         k0r+SV2efiFGjx/0/U94jd5EnzOlz3QPtPPF74JNArbbzd0yFNOaN4XCunUzOngxrqMn
         th0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iZrZRIxKP0fr1EzlYqN5VDWsI9Qt1x4ludh/rJlYbBI=;
        fh=aTzmneatFEDiKMS1saCdxZb39+p//OutFupiUjvLGTw=;
        b=n8x3xnXdqvDqLIWAkOTv9BmjH6P8Dgs1eBpge4hJNPqXg5teYeeEIay2s6ELOjTdC1
         uq+PNQgrfrr+xlEoBo2OXIkbMR4P/oPRNOW4uYCZRa02fZrSSMygEGUz0AUgyeJCWpje
         adpHKqd4IyVMuGPpipqoTxhRV91zlF7sLItKUj4+V7RZliX1E3Y7mbs7ZB2ndWOPnQbv
         rx8SYI2gcWukM8vgfLZ0/YUJWKBBUjvYq3wlqez8v07knEQMlwKGT1kHLNwGD0c35A0M
         B4fW/FIZKfSNUzkcHS1kwrLpwx2jTAW5eISNMm9v09hfGrxe4GweKZ3lb/Y+340LMRz4
         Dm+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ygjjomsB;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i18-20020adfb652000000b0032fa9fd7c31sor9850wre.3.2023.11.22.10.31.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Nov 2023 10:31:13 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ygjjomsB;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700677872; x=1701282672; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZrZRIxKP0fr1EzlYqN5VDWsI9Qt1x4ludh/rJlYbBI=;
        b=ygjjomsBc5ybmfolhCD6/W0TmCSbeNKC8bH8NaF64ZwLk4fRcakYtOH1At3qmnoNvM
         uQawN5Jpjm3XHRWrosEYd6CzUaARtQkvK02/6iYR2Fm74FBujP0TXG5aQNDrqsm+R4/s
         WgtrketlFiGE49i7A20+BZJ7ldGH6h1uPmYtJKCQoWCo7YDC4FuAlDUC8ldzP8Nm6SXq
         4z25B3q5quJF3Ce7I6Q4qy+pvX5J0wrSaov0k0e0hKutBba1/iEHBQf+KQYJTq32LIPO
         dXnymzHP/N02q4culKlVZuFdnT2qtrIkfkk8xn95SqNLnjhpqmozdjRmz0BK2PXbKuxt
         JpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700677872; x=1701282672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZrZRIxKP0fr1EzlYqN5VDWsI9Qt1x4ludh/rJlYbBI=;
        b=VcuGGaY2FzPlJFCi1f1C3tVkYuomBedY3tV3T2Dz30I4kJ3r/tv8qzbK8YovCBi9lC
         3nlvy46KoD+cRbzjUQWiv0145tvcTw76WURYUDunX223rt+sDXdFvu7JXm7oOWCooHQe
         4++zoabJ9A4XFUJHRsSXb8wFi9mAOV33WEI/w1FN91n/BCn1+i04oOLrSwpwBaWZQee/
         y8AYFJUHXl3j5KT77wpQw0RU0Udu9XSNmUwpVho43UFPGh47ZUaGVufv74/rCxGQdyjX
         +sQfk6NF4HLS6OFdZFI9SGzdKpsbyp05QUOl3IoIepsrA9/vhAHsrbdXfjsKwf8CHp4x
         ML1w==
X-Gm-Message-State: AOJu0YxbO68RwJccNYP1hNBH7NAmnsIpCJeIQ8di34Wu5F5/Adxi9rqk
	N+DbI6sTvvobs2kyQ9xbvUuIyxNT
X-Google-Smtp-Source: AGHT+IFNiUEJEkxLFSoN2nQISIoUWkaNr4GSVPoaUIOGvxDTrhIxSw4N0ObW/C2qtmDB5en+mHW2tQ==
X-Received: by 2002:a5d:6802:0:b0:332:d0f6:60fc with SMTP id w2-20020a5d6802000000b00332d0f660fcmr1992106wru.19.1700677872654;
        Wed, 22 Nov 2023 10:31:12 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (pas38-h02-176-184-5-64.dsl.sta.abo.bbox.fr. [176.184.5.64])
        by smtp.gmail.com with ESMTPSA id d11-20020adfa40b000000b003232380ffd7sm36991wra.102.2023.11.22.10.31.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Nov 2023 10:31:12 -0800 (PST)
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
Subject: [PATCH-for-9.0 04/11] target/arm: Move ARM_CPU_IRQ/FIQ definitions to 'cpu-qom.h'
Date: Wed, 22 Nov 2023 19:30:40 +0100
Message-ID: <20231122183048.17150-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231122183048.17150-1-philmd@linaro.org>
References: <20231122183048.17150-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ngYLp7zq2JBI

The ARM_CPU_IRQ/FIQ definitions are meant for the ARM CPU
QOM model. Move them to "cpu-qom.h" so any QOM code can
use them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Or do these definitions belong to cpu-defs.h?
---
 target/arm/cpu-qom.h | 6 ++++++
 target/arm/cpu.h     | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index be307037ff..38030450f7 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -36,6 +36,12 @@ DECLARE_CLASS_CHECKERS(AArch64CPUClass, AARCH64_CPU,
 #define ARM_CPU_TYPE_SUFFIX "-" TYPE_ARM_CPU
 #define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
 
+/* Meanings of the ARMCPU object's four inbound GPIO lines */
+#define ARM_CPU_IRQ 0
+#define ARM_CPU_FIQ 1
+#define ARM_CPU_VIRQ 2
+#define ARM_CPU_VFIQ 3
+
 bool target_aarch64_available(void);
 
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d369275827..124d829742 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -107,12 +107,6 @@ enum {
 #define offsetofhigh32(S, M) (offsetof(S, M) + sizeof(uint32_t))
 #endif
 
-/* Meanings of the ARMCPU object's four inbound GPIO lines */
-#define ARM_CPU_IRQ 0
-#define ARM_CPU_FIQ 1
-#define ARM_CPU_VIRQ 2
-#define ARM_CPU_VFIQ 3
-
 /* ARM-specific extra insn start words:
  * 1: Conditional execution bits
  * 2: Partial exception syndrome for data aborts
-- 
2.41.0
