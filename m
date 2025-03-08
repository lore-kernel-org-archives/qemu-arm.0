Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp252378njc;
        Sat, 8 Mar 2025 11:04:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWk675XmAHozWqQA7OjI1WC9QWud0g/u+Az1qvY2htW+YxN3pYsBQb7eAghchrCYuzPGQaqq4lIjRa8zQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFJyeLMiJPTjtEnqH04x/99s+/XrWZJj6v0yojqMlSKGBUTQsnJgiUXTYQhSFtrQoeLHFew
X-Received: by 2002:a05:620a:8a05:b0:7c3:9846:c611 with SMTP id af79cd13be357-7c4e6113811mr706955485a.34.1741460663105;
        Sat, 08 Mar 2025 11:04:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741460663; cv=none;
        d=google.com; s=arc-20240605;
        b=dI5T8z5Sn4eXh22pR4YbRkcU0HUy7n3xzS2ThT/9nOwZyBa7BGgI/s28j3tqJ0bTx2
         3F73HfZTgJcqnjRlefnosepNQ4sAPVIBVWOJNBmfwvZhcUGkefF8n8qvz/jn5bCFe7jb
         +6sUP4R296u1synT5ky8PGHaejMpWEv7EvRbu4ZVvExiBJQGcU+DcNU1sntE5/BadkZS
         FYpvHQwg2U234dddkYAkx0T9J5vwdRjcnhgjN1tEeWQh62RsIwy4eHJSqoWNuSn4iUb4
         FiZVVDWnoiPuqGvVkSopGKRuKWrHM6/LYAYnZaf9e7dCsRdP3GJ2gQc1SK8nmVv/7/bO
         i5BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pF2WPF4xppL7qEVeYgXT9lZoDPpMUXtxJ+GDygppA/w=;
        fh=K3sxxABndW/ZUCY8ERQZzm7PKH+FKLDRRYN7V4K3ZS0=;
        b=fSWhiK/88LLebkS0iecN3eLYnrqkIysH3L4SlbXnLcyym2jC9e63/nBC1KZQIuWluc
         5mwZpLtIwDeH3D9XY23kkZvetG4gffRJKhTOxmRuwxrF0QNPmtFlAEoCHpPnbrGLPJ1S
         fk/K1OVmmyj6d9hwJGVcGAhVZ37AQ3xT5P7iLw4GS+3Vx+Vb+7jid3SzAq/nvNtxdcBa
         3tiHDgZ2yI/h3wZN5F7hJm3t2a+7DgnyP6OrYKg7JeCtL3wm1QE1ZLO1RVvi+UuL69jx
         61ors6jQJTp8B1m89Bz1VRT+v+y5To8LgQnPFzx8uIgpNpyGR9PUDRzbju31TTP81QfG
         V/pw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cj9MSuMZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e550f419si582933385a.341.2025.03.08.11.04.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Mar 2025 11:04:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cj9MSuMZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tqzSJ-0007Yr-Vl; Sat, 08 Mar 2025 14:03:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqzSF-0007RA-S4
 for qemu-devel@nongnu.org; Sat, 08 Mar 2025 14:03:25 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqzSC-0003dH-PT
 for qemu-devel@nongnu.org; Sat, 08 Mar 2025 14:03:23 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43bcb1a9890so24927235e9.0
 for <qemu-devel@nongnu.org>; Sat, 08 Mar 2025 11:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741460596; x=1742065396; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pF2WPF4xppL7qEVeYgXT9lZoDPpMUXtxJ+GDygppA/w=;
 b=Cj9MSuMZzQAM4JK3z5pwIg1BcS6PWnHfy7LwgDyyiV/ks1Ea1D5j/c2QuxB+qn2icQ
 JIZee6lhW/0sLWWX8ivwfzhAyJ6jEULr4GyvMRrFAzwmca1sXYlk7Tb0gzIJ/UTrjGWv
 al9aCQLI5Nj+Ns77hU7Tj+eSNtNu+YQRZMwyXFOxbnag973IXaocW5CH+7eBSbRYAPs0
 igN+Yt3PtU+iL3NfGtw9Fgn9TG5RMmjvDAWSVaT0bu+i9IqbiTxtW1jv4HoxGy2ZVhqh
 +kpMmGoa8s5qzGBEGz0/E6GCbY8uODwkxd9vdGw7ix1J/SngEg7o/rjATEG5O9SmE7W0
 vNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741460596; x=1742065396;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pF2WPF4xppL7qEVeYgXT9lZoDPpMUXtxJ+GDygppA/w=;
 b=go0Mx/jjSLoqbYue6rBlWmvFVdkHj4SxU/xb0jVy2GxE2XocK6JNsL/sZPflFJEPyd
 PhvX8S9nLxK/vwPdt+wZ0mWDpWCwNKK8Tx7gN2UZ5X7aihvQ4ZA3VdpD2ewEN6c9Q42h
 UscpuZtZHz4eRhKOyFIKKUkI7CQtNmenYvxWniBhTX/Pf9Rk+dlQgC3LR+blRvEAaWFp
 ATOxat1LGfclxqYizQyJu3z/Z0kiDEZweBMjv3lCi8EkmSzrscUmZnY2L8w8ByqcgAn+
 KHFzP7Q/6fBR/V664Nm5QbhjsBu2nr6PriKGZBL1/oVtfJtk7lwPoRO8bow8c1WMSYAh
 6QdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPHOARO+ztJ2Lt9gS7A8t8VnQtFxMPkMuB9Xkv+0vCSKd2/zsBx4lEzMIIWS3apumfLKvHmZgEitUE@nongnu.org
X-Gm-Message-State: AOJu0YyNUO84Fs3klOG4vzBlh1Ad1a9dwIusRxLioCCYRAXnX+W+bXE3
 MnRXdebpdiLClD6OsxvSyp5RHNkRQy6tC5Z8AvwD30ZapCjZDbOv+lURC/bLiqg=
X-Gm-Gg: ASbGncvnnL6FPBmSPHdlC0sz054n1dft46NlLFFcozyvZQSqleSkoVNldhhK5RJwrNN
 uF4ZTGdsRReqyYf5yYKZF2kGpSpvA1tw+8XsdfrtIOCLNS1zFGIR77fXDjXXNqkOOuVSh/cShnc
 l0hU1z7SkxuNVAfhGUR6WwqOJtQhmecqKVkTaUuSsZDUbqDq2PYU2Z0nDcKqihCEXcK7g/QdTww
 YYXTujh9FukGvXnfUdpbd1V15IZSDcs/5OPO8gAUl3vjNDXmWteIh0Cj6MEZyRvRW+8QJS6m/YJ
 N1DmrxkKaMKCdR3hfa4zjWEv1vw/UomiBSPfBfJw9KM/O3h4uNFJwuGJrBTgVDyWKP0zJ9hRwbf
 Eo4o8jgtgBrRtFwScVr1s1o+VfbK9RA==
X-Received: by 2002:a05:6000:18a9:b0:391:bc8:564a with SMTP id
 ffacd0b85a97d-3913af2dcb5mr2860927f8f.22.1741460595830; 
 Sat, 08 Mar 2025 11:03:15 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ce8a493d0sm30603875e9.1.2025.03.08.11.03.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 08 Mar 2025 11:03:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>,
	qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 09/12] hw/sd/sdhci: Add SDHCIClass::ro::capareg field
Date: Sat,  8 Mar 2025 20:02:27 +0100
Message-ID: <20250308190230.7508-10-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250308190230.7508-1-philmd@linaro.org>
References: <20250308190230.7508-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /K6+b9SO5l+Y

Capability register is read-only.

Since we allow instances to clear/set extra bits, log when
read-only bits normally set by hardware are cleared at
board level.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/sd/sdhci.h | 5 +++++
 hw/sd/sdhci.c         | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 60a0442c805..53aef17ad34 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -115,6 +115,11 @@ typedef struct SDHCIClass {
     const MemoryRegionOps *io_ops;
     uint32_t quirks;
     uint64_t iomem_size;
+
+    /* Read-only registers */
+    struct {
+        uint64_t capareg;
+    } ro;
 } SDHCIClass;
 
 /*
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 15e6976220f..f08918587ef 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -73,6 +73,7 @@ static bool sdhci_check_capab_freq_range(SDHCIState *s, const char *desc,
 
 static void sdhci_check_capareg(SDHCIState *s, Error **errp)
 {
+    SDHCIClass *sc = SYSBUS_SDHCI_GET_CLASS(s);
     uint64_t msk = s->capareg;
     uint32_t val;
     bool y;
@@ -208,6 +209,11 @@ static void sdhci_check_capareg(SDHCIState *s, Error **errp)
         qemu_log_mask(LOG_UNIMP,
                       "SDHCI: unknown CAPAB mask: 0x%016" PRIx64 "\n", msk);
     }
+    msk = sc->ro.capareg & ~s->capareg;
+    if (msk) {
+        qemu_log_mask(LOG_UNIMP,
+                      "SDHCI: ignored CAPAB mask: 0x%016" PRIx64 "\n", msk);
+    }
 }
 
 static uint8_t sdhci_slotint(SDHCIState *s)
-- 
2.47.1

