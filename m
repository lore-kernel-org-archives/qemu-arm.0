Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2179383njj;
        Sun, 4 May 2025 18:54:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVBVrscDWh8LoeFIqc2GjuN0waKe421ctgNmArf0EG2Z6ebzolh8aOKvREzif6X3faT9dGRYmKyunliKg==@linaro.org
X-Received: by 2002:a05:6a21:3a46:b0:1f5:9098:e446 with SMTP id adf61e73a8af0-20e96206073mr8965094637.2.1746409985092;
        Sun, 04 May 2025 18:53:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409985; cv=none;
        d=google.com; s=arc-20240605;
        b=lBsroyHVOD2BA0NTDh1yOm8QNdGUy1QLuL7A4Xo7pWHcPv5sZKu8R+/jRCrJ/0uXF0
         rB9JRd/Lwy2+6swflW1lZa0dRlBjn2HKUF+TsIM3/Ujj6/qM4AtBk0I7U1lfeo3SAw2L
         Bo4c3ez/4AQp1EIBpxnSFTPfXS77ZcyyfRZxawpMowPAx5x/CVFwmlTF28xrDCDE7Foe
         iQBa34H/4YBY5NC4fReRFTU/yzeWWonKPytlrA41LLKl/bk+p25iDh8ZMjxF09dw9whm
         115PNjayyZaNScRgM1ELYnQtDlojqWBOiQx1MUCLDDYbo8trOHyxEulJdiU8JN/lJhC1
         pd8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fjvN9GkUlSXmzEXtUb9+tptKE6zBbBhkZRx0p6n3iY0=;
        fh=BvH4hqTXAF4osTUYoK6I3Yid86TFzMItNwt9ymy3KMk=;
        b=fVDZfoguBmJUEPhzZNB+6G4P3gLRkUHxcLYQo1UB9R0R1zAQaHD5megHHwk53xLT4g
         1CZeq8460t0qPbhyOVw+i/Yqi96mYMpQJqFD/Z0vIvUTAYZ3dzoRxc4T+mrEyL+ZC48J
         dV0PFGVhrPE9F6rOf/BN2J2uTRpjlTt1LbukxUefnWEa3npRE6dPjcNCtSb0rT/iCXfJ
         5GaHi0ZGAEZ8AFCuq5qk4ISEfczqFnc00PSXBHvVSznP7z/scYAWfebNxvGnJ+od0nnO
         I+9+nrJMoYxRFwrwdgE7KoMbnhDftsgNzyvY+WT20KpkkrhOYoXMgNsl8eVSAThI9zef
         vMKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aX9TtqGp;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404eeb748fsor6170827b3a.1.2025.05.04.18.53.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:53:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aX9TtqGp;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409984; x=1747014784; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fjvN9GkUlSXmzEXtUb9+tptKE6zBbBhkZRx0p6n3iY0=;
        b=aX9TtqGp9HVK0NOc+YXUKkuidQW/GKb7x/zJkla1Hn8o6GMSuvpTkU1hasb1gZeCWC
         663jsadAe7M6HapzQZDbXMOKC/sekrQwTt/y12lQ36wJOB0njq/0Eu7pzJwVDpHWK9de
         tZ3gTHBLnB48pWJN6uIxBkRD2QAZD8nQXD+QsJtBqY64kK3eXKiFpJvWMDhTPe1nv+P+
         DYUH2vQR28srr5pY43BORklvDKE1+Nuzpyj4pqczUuEkyESeosla3IkAx8p/Grmy6Rs9
         36WLXPTQJOKQKiAmzRCcPsusup2iXd2/gn9GuESxT5whgH7XkBsbmj5QD9mHrq/HYaC8
         DI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409984; x=1747014784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fjvN9GkUlSXmzEXtUb9+tptKE6zBbBhkZRx0p6n3iY0=;
        b=p6he13VxIEBoKMA95+pnffTz3fyY6UjsvRtqmKf/TO5IAnqtgUBUOpzkXDPpoyff6B
         kzf8U9ZIDUI0cMw69DY7FCBWgzDPhpYCGfWwXHfi7SOzl6ZXVH/Yh/J39AtAoRYvrkGB
         GzpLr1v0bB3ahPlpEfS7W5TQM6TQDNH1aNk0QkpNJkMnVZ+RJpgXJGnUmhXN/i2GF++X
         vh6AGnS4eRGWL2P11rWn/a8hib/lmEs3Fx/XhlcBZTpN7xEDIy4OmDYY2G5a/DedDUVT
         jqmasacNRLBlVpL0kvHx56P8ZfCMFjUmyxMs78QiRt5z6mdpJxWWD45jBm5K/Kqwgzj+
         oltQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7Pdk5WLCj8m/CqOeAXo+YzXPFEWnCgtsuYi/lrtI0t5NWkIaCzywg8gzM5twqY33rJEqDdfVnDnpLiw==@linaro.org
X-Gm-Message-State: AOJu0YwMgo9rhw2LYwBWVPDbyQHb6WaXzHUoTvicFG8gCuRGaIUdBJdo
	Eomgl0U13rpDFy2iOg7XZ/ENpQR8nmngLpDFhQ7wybrQLnAAzVW+Dc08gI3EJ3ljTQ==
X-Gm-Gg: ASbGncuKTN0Xmq/nGu2skEQMHGFqW0TZ3/HphrQ0gGx32zaSERboaYIy8iDRoK3JTXp
	LXOlzu2tX2mcC8RJyfrnlbKiU2KMvlsGrsbEFUXi0tdzFM+wVtwtJVRLoLnxQ/P2T9rDHwUJZ8m
	smmfYuzZuRIELOhF5u31BA8ZFFMt9pko33q/9COANuJ5OrauT5YS9ppQQj0GcNowXsOUpPeqTFb
	jvDqu4RAwD+CUajoP7/nYe7LiwuHmJ7cptqNzMkzgIUO98nzpBklIEtLdSUpwB7OaajQiAfKLJb
	IHttj10dQwtveChmH868OocwfZu64umirNOQ1Y8O
X-Google-Smtp-Source: AGHT+IHdz4XoM+G4ZSlVLLLI9T3NP/Z5hYlsd9kBRP8xO98/byZhhHtRa3EcBoUSJs9k3C7RjNhANw==
X-Received: by 2002:a05:6a21:9186:b0:1f5:874c:c987 with SMTP id adf61e73a8af0-20e96605740mr8115462637.15.1746409984740;
        Sun, 04 May 2025 18:53:04 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:53:04 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 39/48] target/arm/kvm-stub: add missing stubs
Date: Sun,  4 May 2025 18:52:14 -0700
Message-ID: <20250505015223.3895275-40-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: S0jlxC+1WyN8

Those become needed once kvm_enabled can't be known at compile time.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/kvm-stub.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
index 4806365cdc5..34e57fab011 100644
--- a/target/arm/kvm-stub.c
+++ b/target/arm/kvm-stub.c
@@ -109,3 +109,13 @@ void arm_cpu_kvm_set_irq(void *arm_cpu, int irq, int level)
 {
     g_assert_not_reached();
 }
+
+void kvm_arm_cpu_pre_save(ARMCPU *cpu)
+{
+    g_assert_not_reached();
+}
+
+bool kvm_arm_cpu_post_load(ARMCPU *cpu)
+{
+    g_assert_not_reached();
+}
-- 
2.47.2
