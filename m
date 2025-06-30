Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2458747dye;
        Mon, 30 Jun 2025 06:10:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUmelFYgCastDMi7rJC30WPWSBq+Jr1cG+O1X0YkqKKsA5V96xH6F8hUwuPtSktmIBBI6kh4XXa2GXTpg==@linaro.org
X-Received: by 2002:a05:600c:1e0d:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-4538edf0902mr157747455e9.0.1751289013537;
        Mon, 30 Jun 2025 06:10:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751289013; cv=none;
        d=google.com; s=arc-20240605;
        b=WBBssGFiW2no+v/dCkjr/sxV5BLs86WPTkzwRRtzdVBqauOskRE3WZzEuPJaBAOSWy
         MrXZFrIjbYsDeLhtvC3D9k9/tKNerJgZd55eAG1J3LDWSWzk+Ux8IW9kGNSgyTpMqkBE
         Als7z2exUrZqtJNh6U0ZkOELeYTlviAgSZCe80fUJefeGHlAJSBJQuIKKPhqx6OfAjzs
         WiLJCni8xghT2R2gV4a/fWBE+RLCc9RUTGfmpTu3QmH5oRBa8HNCwG5QBGm9Gw3qJO+a
         o4/f2SXqaVzRAVg2RPXrCGX6BenstRZ/PMKUO53vvC8IKfAcbvMecSqknYOvWn6XEBUs
         TxYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=H+FJk0a0cgOcCeztwLwPBBSDzF3OpAdthXdeLrgGRTg=;
        fh=BSFHx4KBofq6qrpjk0TgWuerkQw6DHn0AYs7EidZ9h0=;
        b=V6Ji3gPKDIAyx8pAVIWAkhks7WHdM+sWvrM9DsY8CU0/lkVmFM3C8qmJDMqtLNqy+/
         DLoccvSDcsHyJvWWjnzv4B1nW2ETNOEXo4NS8sBGGgIhjhgMyHcPJLRda/X9S+mXWQqc
         TAGqJTiG0uS1TvDF9IfXWUzACLEDV2wuWnayGggZjO4zrwb3RAREEGaB0G6YmNw5sAKn
         j4IovtecpCiYEW2A5nl9x82Z/xv4pvT728kP19ctQJCrq2J9kYDeTV0Q8fNocPXPhkuh
         5hyl7nOoQIkdY0768oNQj2YNAHlsjIcW0NcbxyVJWDd2GeHMfyZCihMJFg0GeTj6El7Y
         Nucw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hxe2FGTu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4539bf547acsor12429115e9.9.2025.06.30.06.10.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Jun 2025 06:10:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hxe2FGTu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751289013; x=1751893813; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+FJk0a0cgOcCeztwLwPBBSDzF3OpAdthXdeLrgGRTg=;
        b=hxe2FGTu27KVbMPsiFHPthrBUrcrOsUYwAP+QE7D9D+ygB9yYvHrniRw5m3z3YCclI
         AH5wOD96FtJ0Xls7Gnd5KYzzmCzOOWJfg0KZ+ZXocKouUmPTe4dbVK2na491h2H5gziS
         r9PcQ5sRAHfGym2dBtAn5A+vPO7bZA6sf31NOTLzK8HJ4n5T2/hhsSWagJsmaJBf8cBQ
         38bYZ1DCyBt74szWNHuaqBN7Us1L6+KLOoeu/k7PsIPmYANI1rZi0M02+AMxFM6HaJhM
         AhkpK7idQzLgbgQIXT5vkRwUuD2Lj15iJWcpruSwr0iyJXdDyNjaHaInsL1gxTICvIF+
         nyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751289013; x=1751893813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H+FJk0a0cgOcCeztwLwPBBSDzF3OpAdthXdeLrgGRTg=;
        b=tZaUqnKedrklmAtHuLi419tocborMhbn9C9wxt0glSTlPqzFPjLBcIsqdsBIFp80YV
         H1Ep72NiSs1SgMcwsqs49KThBdmNYZxfM1yUi6Ay1EqYwJACJ39nJLf/TEU8upJPBhm7
         rV//kqQjib9kU/tWoBhMRhEfLuQxlgdhBDsqmbnLHe/kFCajVLHDa+162xPsm90/AOWF
         9trcobFlKTi+jGQAr3yFMLwMZVPDnlaw7BtxYnhgZTvEWZljSsvZa2gwV/3aaJuIDq4N
         MkCZSG8UcdiXtecZ7GW2MF2RoEYbl8mLiw2HDM00GxS/ELbf96Xv9Sxz4kxFw8TpofyW
         UcHw==
X-Forwarded-Encrypted: i=1; AJvYcCVi5DgiPHngoyd5uhA6BqNPirwo6QBPzpDtaf5s49bQaKtVPHomddqtu+qjQ9yx/nEL8rQGaEvBP7RPkg==@linaro.org
X-Gm-Message-State: AOJu0Ywt9HO3VSTQzNdA62Up4AL6qknqxRkVIqTm5K+EweXyueSaU4pe
	edGK6z3OXQuA2ODgSpVmrkntssDQGAUG4/zwPT7SqxVEEgCAJFupyJcXTTLIq1JWn9pwxKi8f42
	fMacyu4g=
X-Gm-Gg: ASbGncsaFhs0689bU8SIIDTO8CCBbWiIXjxia7RRYjULg7mRLhdiSpi2Gzi/5vxLDmb
	iwQgt+FI6kjV7r+KpMXDfc3mdLZuNZ8PsTHkHegyABjRJkvGxwPMa0vFVVclLaHFyCQU9QRp+Yf
	uVQX6MpjlXUaufZLZdc4Qa+l3ypPa37aU9v3vcMPJ0lH03pZEDNgrbwBk/63kn9XA/KQtcqWBvl
	qsadV5t4T85NM1foGPCy7v4gKZBl370G3703godl8oULqIB2QLobhF7EL/5OAFbKJYazBmgckMG
	2hQhOCFTPFHIqCl7v6/aW4aZUlUwh52pnnLEeiKf9xgyK1IURbhE/vbe1KOEAPKNpY+oSnNHuaL
	16vx27kCJsgu3EszcJaIvW5i1zROYwo4rfSu9
X-Google-Smtp-Source: AGHT+IEByqu72FkfcvT5uo05D7E1vi0yvvlmhmF3Uteu/Agpq6RjqYSA3xSu6GHZbwfK+UN8hGdH/g==
X-Received: by 2002:a05:600c:c0d7:b0:442:ccfa:fa with SMTP id 5b1f17b1804b1-4538f516210mr90896245e9.27.1751289012845;
        Mon, 30 Jun 2025 06:10:12 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52a35sm10549142f8f.57.2025.06.30.06.10.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 30 Jun 2025 06:10:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alexander Graf <agraf@csgraf.de>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 6/6] target/arm: Allow arm_cpu_tlb_fill_align optionally set CPUTLBEntryFull
Date: Mon, 30 Jun 2025 15:09:37 +0200
Message-ID: <20250630130937.3487-7-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630130937.3487-1-philmd@linaro.org>
References: <20250630130937.3487-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5JRc/qVlnr/E

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/tcg/tlb_helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
index 23c72a99f5c..df04ef351d1 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -349,7 +349,9 @@ bool arm_cpu_tlb_fill_align(CPUState *cs, CPUTLBEntryFull *out, vaddr address,
                               &res, fi)) {
         res.f.extra.arm.pte_attrs = res.cacheattrs.attrs;
         res.f.extra.arm.shareability = res.cacheattrs.shareability;
-        *out = res.f;
+        if (out) {
+            *out = res.f;
+        }
         return true;
     }
     if (probe) {
-- 
2.49.0
