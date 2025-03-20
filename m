Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1279123njc;
        Thu, 20 Mar 2025 15:30:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUU43j7uitxD3PZXxvRaP/M0q1U573ntFf2u3CznMlp0b036udx4BDrp+iw+/pIA5I3yCSI8L83Ij6kag==@linaro.org
X-Received: by 2002:a17:902:d48c:b0:215:b1e3:c051 with SMTP id d9443c01a7336-227806b8f91mr16743725ad.11.1742509837536;
        Thu, 20 Mar 2025 15:30:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742509837; cv=none;
        d=google.com; s=arc-20240605;
        b=Ulwo0i4bBbnMHTVOjaOTPh9bsAyz0/9HADIVjalE6ykYmCEDgTLxkceIbtPcleKnmV
         n7V0d+Bj2OUcUbRhjzB7BD5Mik/R6GUSLdZ+41qG4gbrJ/NvvOShrmyIe9eWQ5gtwb0+
         w7BnTxzdULl0aglxmwejxIkcP5pXJWiJwaAWdQwktzaz8J1Jlb8kVOrVLHV0z+2lEoXt
         4j/FnsymcNsMb08QhKexZrT/AJvsqlzXh8vsLoHug58cepky/ZzvwRrPFAN/FyWAWXDH
         xFUAMIKY10OIowR4YmBG8H8z8mtvKg653VH1vc4+y5ejEyaZQcRFoLKOAfUaaXnUJ0yA
         jZog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=A+1+7CiGx+iAiQeBUt37G0/UwWZT/ijcOCdLS2QJIME=;
        fh=H4iPa3EXsaJ8dVGXCrcXLoZIL/CBzVbYo8UD1nv4Q4U=;
        b=QYT5SAnNyR+ATAAF3XQmBxFqKt/pzLBARe0Ao/m4gdT01WNctBoH5QiFsOX1KSn2tQ
         82WGDoptC2NNfZ/s5l6WCdth2yUYAkhFzz6ePFuqJ29C+ifq7Vbu79de2L3wNhB0cNiz
         NREQP5dCWi4s/lhz/NUfFVeJrecwNoSa7VBLlqAAZeJRtYPRH6SThlgXLSjkYIA2Rqib
         1n0PQ5Uu5kkGYIwi65wGxqnh5ii1oXLjsgfYSLXEHZoPjvW2u104oNZLCrV3/SCxupI5
         gRNrG9qPDFLOmpCA9EuS89dd5zSzv/mB+RTUE3ouYeaajcj09jDFQb8hiPmF/YbHGJms
         Bvpg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HxuG6RG7;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780ee59afsor2811195ad.1.2025.03.20.15.30.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 15:30:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HxuG6RG7;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742509837; x=1743114637; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+1+7CiGx+iAiQeBUt37G0/UwWZT/ijcOCdLS2QJIME=;
        b=HxuG6RG7xId/IcIhDC7atQy91+78c8yqPw7KkFhjWoOEEj9Sx79cL9YIHyZlIzkUZr
         rJKaBrpDjC9wBAaYbCXMhFqYPHD+iQPh0D7kGQiUE4+dMx8vNE+mLkyXpFk+6oTRNMqu
         qwqKxUYMQKgGoZ6GbOv8fkZr2HHfZ6GdRigKs9wcq2Z0pI+h10JVIP9mRbQjkymcfvkw
         caytG55NlxImbcSl0hnk9PUXDD/HAUw8GFpA+CWVu13+kilZgjydy7TXIwNe79OZPPAo
         xLQESqNLqUcvurAe0/JYdI9nVXXnqnq4MKDqZeAe1ejECuaohUMWU5YPkmtBW+t0BGI8
         OBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509837; x=1743114637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+1+7CiGx+iAiQeBUt37G0/UwWZT/ijcOCdLS2QJIME=;
        b=OhsIGicZK5AhNwODHV+9GFLe20jN+MxtQXKd/u6IF+KsvW8hAS1+MDAFsWT8KVGiR6
         PD0beVVDII2StNEnwtDmsX+UQp8NTHAGe9OSMBWIRsXY2uIBb1yiOQmU+8S3sYVy7VCZ
         VD5pMpRnWHIciKLMFmJ6Ql61jnfGpEtt2IGmh+X2+7TRBY1OmyszWBZ2omzJ1WUbevt6
         eABHagwc4up5GBezD3FLIkvf6oITXpBxDmYo6O9zX6UEawpEMdA4UvoTf5dVq3j8x4rT
         rBxF2eTiZSsWlYVy8etAMMYzkiB+n43epy0YjUdfvqv0ZLnhITwlnoXHeoGgOMzpBNBQ
         3uyg==
X-Forwarded-Encrypted: i=1; AJvYcCXLnXwK9FbPJcNPfE/dt0VSq2fcjwfeU7/VkHT/kY1KAvvq1eu+YJ12zeHYMH4XAFy51sxvt6729d9UKQ==@linaro.org
X-Gm-Message-State: AOJu0Yz/10gCfe0dgFYUmkan9oPdUhozF1d8suDqvQl2y4rhyICpOoXy
	dKL4f/GzJ5+TMAt8pnhpy34zXB8mnCl1HDWhvOK3Jia48XsH71VO/cwbIdSZxVMjgQ==
X-Gm-Gg: ASbGncuMifjFMU+PeWWjzI6yL0eOSHEI8QYijRl7C3sSAjcQBi8cukEGAPsPkpVXRMf
	ivlSd7+qS8kqU8Qaz2aqKSao67xOg5QQjc4SquSEX7lOLqHN1GDzcyyfx7EpRZXs44ezcbUk9N7
	+yKfWLCH3zO9YuWWgU13/pzyyoM2Gq7U+nBLSWBlfW+hEwXRrh+9A4YibQebz48n0Hb+Lr/myQM
	t3t7biMrAeJhtJHPWjav1TpqZ0Mzh++rFOmmkUAKVUfhwWAwlcKEQ9AXW9wc6UpjZYocwxXacI1
	vym6LJ1DucwYAaCBQq9/Ua1399gMh0Iv/j3QF+Mm9G6J
X-Google-Smtp-Source: AGHT+IG0L9vR3TvEwtKsOTQ+jVnK9o/DeH5SAcVF5sO9ApBZUM8ybqvtvKZgXXJTYhMOle1B9x9PXA==
X-Received: by 2002:a17:902:c411:b0:216:4676:dfb5 with SMTP id d9443c01a7336-22780af524fmr17603635ad.21.1742509837102;
        Thu, 20 Mar 2025 15:30:37 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4581csm3370145ad.59.2025.03.20.15.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:30:36 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 26/30] hw/arm/armv7m: prepare compilation unit to be common
Date: Thu, 20 Mar 2025 15:29:58 -0700
Message-Id: <20250320223002.2915728-27-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: /7eoOX75idU8

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/arm/armv7m.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 98a69846119..c367c2dcb99 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -139,8 +139,9 @@ static MemTxResult v7m_sysreg_ns_write(void *opaque, hwaddr addr,
     if (attrs.secure) {
         /* S accesses to the alias act like NS accesses to the real region */
         attrs.secure = 0;
+        MemOp end = target_words_bigendian() ? MO_BE : MO_LE;
         return memory_region_dispatch_write(mr, addr, value,
-                                            size_memop(size) | MO_TE, attrs);
+                                            size_memop(size) | end, attrs);
     } else {
         /* NS attrs are RAZ/WI for privileged, and BusFault for user */
         if (attrs.user) {
@@ -159,8 +160,9 @@ static MemTxResult v7m_sysreg_ns_read(void *opaque, hwaddr addr,
     if (attrs.secure) {
         /* S accesses to the alias act like NS accesses to the real region */
         attrs.secure = 0;
+        MemOp end = target_words_bigendian() ? MO_BE : MO_LE;
         return memory_region_dispatch_read(mr, addr, data,
-                                           size_memop(size) | MO_TE, attrs);
+                                           size_memop(size) | end, attrs);
     } else {
         /* NS attrs are RAZ/WI for privileged, and BusFault for user */
         if (attrs.user) {
@@ -186,8 +188,9 @@ static MemTxResult v7m_systick_write(void *opaque, hwaddr addr,
 
     /* Direct the access to the correct systick */
     mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
+    MemOp end = target_words_bigendian() ? MO_BE : MO_LE;
     return memory_region_dispatch_write(mr, addr, value,
-                                        size_memop(size) | MO_TE, attrs);
+                                        size_memop(size) | end, attrs);
 }
 
 static MemTxResult v7m_systick_read(void *opaque, hwaddr addr,
@@ -199,7 +202,8 @@ static MemTxResult v7m_systick_read(void *opaque, hwaddr addr,
 
     /* Direct the access to the correct systick */
     mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
-    return memory_region_dispatch_read(mr, addr, data, size_memop(size) | MO_TE,
+    MemOp end = target_words_bigendian() ? MO_BE : MO_LE;
+    return memory_region_dispatch_read(mr, addr, data, size_memop(size) | end,
                                        attrs);
 }
 
-- 
2.39.5
