Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1279064njc;
        Thu, 20 Mar 2025 15:30:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV5pxzy4iyV89tLTJFLJWPCUPu80IvIxVOXbWcXexjLBXBnJa45BqBF7Soj2DQN9MtwULV46wscjtpixw==@linaro.org
X-Received: by 2002:a17:902:fc43:b0:216:794f:6d7d with SMTP id d9443c01a7336-22780e60ad9mr20425065ad.48.1742509832322;
        Thu, 20 Mar 2025 15:30:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742509832; cv=none;
        d=google.com; s=arc-20240605;
        b=YRy6WoEp/NihiJVFZLgvnOT0g9g8f8bmX6S8bcTX8k+d8+KboOnNnBVbnB+thgY15r
         wPT3RKvuu8UyyQpVQ6F9lq0KF5BSjuRwMuDlClKcVBe0Sh/MpfddS37fP+Lna+rmmL2k
         jGi2ezQFUhrPONHLOm/FDhs2fzikWWniARtud+QhjI9fe3m2bIdVZUjRtD8b9y7PNTjN
         /3HuB9f6PIXEWk0TWlhRLd7w2kBpqu1mY/o+v9bOIF4jZ5MM183HB3Pgz3PeQxYjUObB
         ccWcGQMskUL7yYgbFAN8WP6zP+yjdIG/Rw/ufWBgcmn0fbCsQUIZj1nVPBLS/r0m47eY
         bciQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4+5iQ3rOTBSPEFMTgcjt+dky/l4beaGAM9ptuF8lc/c=;
        fh=TFsR6hQJWXdnZZsCKDZyLwh6F+co/J9aKrqtZxO5HfY=;
        b=fVOPOmqUbuzu5zNNYaFJYge/FVC9pVebLZHzwA2Nz6+feXDYDru8DbRpbgND+vE94H
         4OdCTDPTL3wpM4E1nwuuPHua3g2vbzrYze9JqKXltZbzzpBgID6/xLpCa6IbYHe0uegs
         R0Rks+fy4n4J//1i9sEBW79+/W7QG6bcCdOnt4QljGpF9dVVkcKLl/bx1bfO+tqFJWPO
         tDnhU3rBxwLKulUsPpPWz3i8tFT/wrj3zkGM5MuwSWaHFJsWJFaHEZFoOJ60K1cIrn4Q
         RSmOCjLxxe40HBc+qDM3XKJw6G+Dl4boAo3LUCSoEStz1MXMcnXe2NXETVDycGuEZyge
         KfZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jXuZ5xl2;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f7bd95sor3930475ad.13.2025.03.20.15.30.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Mar 2025 15:30:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jXuZ5xl2;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742509832; x=1743114632; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+5iQ3rOTBSPEFMTgcjt+dky/l4beaGAM9ptuF8lc/c=;
        b=jXuZ5xl2Y5QeRdfqXvlCll8PsX5rmE12JXRgRsV2zxDV+lDH5AN1S6yGvi9mdu4+hP
         P15zlVzBAGd0NBpyzX+7oOqrdnYAzDzvv81o55HWUicj/lEHlGzmVvAilmRK60I+uoEG
         392ybWBaJAVjIXps8ns4bOntrJGZPKH/10Oc3sJFz5q5v38kqRUQD1jCa/23t9JpC/cJ
         30TxJ4juwOfyn49V0C3DC5H7LETwTNk1prCSoWCG8+8AqkwhtkIa0+MQo7IicVLot9P8
         WaZ9ZLRo3O7K71PD5ymIcgt09boLorWFMbeBWVQjdmEScsywNxebZmyGEgPnLho016d8
         pBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742509832; x=1743114632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+5iQ3rOTBSPEFMTgcjt+dky/l4beaGAM9ptuF8lc/c=;
        b=YYW3IpwjaBdcovBSjAeQN1kT04vkILHF8IdpJq0pFi4NhzsDGOe+jlUg1dZUwvJTyn
         VJxhywGg4ldmmVHE/3DRxhDz+snlNIEqCZSdCBrI159fIcy6Rtl4MqXmXo65NkNNcA1K
         V0uGaV7TB9GC6TkUjyVhMNW71mkQrXAVsjdKTTosfMeQ7ldMFEqlDfq+ogMJyLtepsXD
         lKjJi3+ElKiy6tZ9YtnCTNz55tvq17HlnIqQfSCv76mbLBia63FOOPS2OKhSPcQcGR1a
         y3gV8nCOfVpamRcppEeASDHtmskO2VP50pyDn0KQBw2pyaXTVZOaGS1LB1pGi3z3wmxb
         mXsw==
X-Forwarded-Encrypted: i=1; AJvYcCV9StDsFHth2ZCwfwFe2h2ZcD+htbKKQXfGAwmkmsdN0OzNSzH2JVbHwiV7V8OiwuraVQ8iFMR+yQr40g==@linaro.org
X-Gm-Message-State: AOJu0Ywf/0A7MHlflb+i6Dabh/R7sk/LBNk1X5+lwPv2MVJMza7vYOXn
	AjOE64OIu5QEF69Pj4PYOyL7TzXYpLVwRsQ82qO1ie9b7FRyl12T1bt/7NZzI37NcTGwtH3gWh4
	fzKw=
X-Gm-Gg: ASbGncsUI/82sZ4kYaphwAe3/Yo4d8Gb7ZUwOspfqHHI2/5aQkGEJdtVaATtqeehQOf
	xcHRTH4rd9rrM/6nbb+zrvNhu8mFBA47XMsothSrlzirEZOvwtwtuzF2sCwJozLOEVLJssnmS9S
	OdPFAjBdymSqDcx8gHugAe8q9qU/ddJrvUhvwekXLzjBTw8B7EblXoa52k/OnHcUk3M0FYFYh6h
	VZ6XMTEp0ngqJ67y1qO+Z4pJbCFPiyp3T5Yx48VzcCQFdiB8ymarTXeY+U7e97ZI2J/8FN1sGE4
	5mcE/SjkoSxxvFQk1Iz2Da3s++9O3kA+yBZ/OVXEE31G
X-Google-Smtp-Source: AGHT+IFZleVXELavrvrw7HY5fmpI4AcmTcQwLh35eXn6L+ltqmgswJc0Gwxa0tcE3YRrZRjHRWIdoA==
X-Received: by 2002:a17:903:94f:b0:223:5de7:6c81 with SMTP id d9443c01a7336-22780db3061mr18350425ad.27.1742509831956;
        Thu, 20 Mar 2025 15:30:31 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4581csm3370145ad.59.2025.03.20.15.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:30:31 -0700 (PDT)
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
Subject: [PATCH v2 20/30] target/arm/cpu: always define kvm related registers
Date: Thu, 20 Mar 2025 15:29:52 -0700
Message-Id: <20250320223002.2915728-21-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
References: <20250320223002.2915728-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: npcHAXwgkdk3

This does not hurt, even if they are not used.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a8a1a8faf6b..ab7412772bc 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -971,7 +971,6 @@ struct ArchCPU {
      */
     uint32_t kvm_target;
 
-#ifdef CONFIG_KVM
     /* KVM init features for this CPU */
     uint32_t kvm_init_features[7];
 
@@ -984,7 +983,6 @@ struct ArchCPU {
 
     /* KVM steal time */
     OnOffAuto kvm_steal_time;
-#endif /* CONFIG_KVM */
 
     /* Uniprocessor system with MP extensions */
     bool mp_is_up;
-- 
2.39.5
