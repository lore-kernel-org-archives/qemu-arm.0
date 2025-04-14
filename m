Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2126172njc;
        Mon, 14 Apr 2025 09:40:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUrzIVlqXIggpOxzfIRP1+sCf/3NW/Lcdda7AlUnTgmhKOgjHh+FdzLSdLH2YBwdysASnGlOiDGGO2ypw==@linaro.org
X-Google-Smtp-Source: AGHT+IEvLJz5a+OeTEtLnhsilewHX6WiJ2g/ZaG0vR4Rmzr5eAx4Nd7vUEFYhX54XV/LKrgo9Rgo
X-Received: by 2002:a05:690c:7347:b0:703:b708:e15c with SMTP id 00721157ae682-705a1f52944mr932897b3.13.1744648841720;
        Mon, 14 Apr 2025 09:40:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744648841; cv=none;
        d=google.com; s=arc-20240605;
        b=hpCR6V2HoQTTRNnLp+koEHxUNjaI66zB7GxI1VZ7TxoWHIro1pXaiWKTj1/nBGJb5N
         u077ZYv7T0/LKTQc4IVlGm+wb6PNBkHPoAcN1Bb70XybReQUsmEjI7wt4pY/P7XHYzeg
         0NLsVTN7m5pDcGKebp6Sy4p3SLHob8hWfORaL1ShcVzXu+kem/kn+9l5CtNh4XIkK6iR
         0ei+mz+kqtw7mtLISyCCjBIJIWbyMhgKycHXX+/mZppOZERKbxODkzzk+znN2a5SB7Cf
         knPvCa5++xgyklQ2zYfv+hczEHINuLptjh7xzRScd0xbDQ4EpCd6c1sz8VhTV6I1on8Z
         /VyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=g9wxNH81JIH2IEDZg20aj6k00TZH42Y7fo7oUdlKPTI=;
        fh=6xsxbRFvSPtT8TG3B9HOEDad133GF2zMAz688Nd5+nE=;
        b=lRf0Y1KMS4i2qpBGO7USkkBf4QSk9A7v6QGr/erhEwo8ch+mSWh1D7X8AOLGVtgY0E
         XWfWMRZy2peJXumfU7dRwjlsMDfi69q1qP2AWvZeLGC4gmXOFYy3vhyBGAz+8dDzNhKq
         mZcL73s/ac3UAfRxGof3mG649IZH1lEM9qmWzl8/YzmAfGHmAGBiw9Dqwa+ZN1OkRE8p
         XNk1nC0JVmDdh1W5G0GE0HtMU62vKRk6gipY9l2W791yOvjnnjQkOJSo2tPbLruNTZeR
         uVwCqGeo4CfprihqCDUPlyTnVTGsjjw+iPtuR1IgTYcVOeiIg6mJMPWd/puCKAexWqij
         kt0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QR2NxLLU;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 00721157ae682-7053e3802d2si181886147b3.430.2025.04.14.09.40.41
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 09:40:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QR2NxLLU;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744648841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g9wxNH81JIH2IEDZg20aj6k00TZH42Y7fo7oUdlKPTI=;
	b=QR2NxLLUFYG1FU5Sh7UCaIfvoAHlJfi3bbuLeAm+bWzjhdzZEnh7lm877hfUiHKkgq9qzM
	tUa05dmb5FBIeABevWsChhNG1tEcnQohyeQt++P8JAqiGNOEOGoatvKHXpWvM3DvecM1i8
	FzpZFHUXZhNlPFb5ElKBXyeYTbxk06g=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-498-AgPxKZf3N3er18B2CtWUSw-1; Mon,
 14 Apr 2025 12:40:38 -0400
X-MC-Unique: AgPxKZf3N3er18B2CtWUSw-1
X-Mimecast-MFC-AGG-ID: AgPxKZf3N3er18B2CtWUSw_1744648836
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EA5F41956065;
	Mon, 14 Apr 2025 16:40:35 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.67.24.14])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A9EA8180B487;
	Mon, 14 Apr 2025 16:40:20 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvmarm@lists.linux.dev,
	peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	sebott@redhat.com,
	shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com,
	berrange@redhat.com,
	abologna@redhat.com,
	jdenemar@redhat.com
Cc: agraf@csgraf.de,
	shahuang@redhat.com,
	mark.rutland@arm.com,
	philmd@linaro.org,
	pbonzini@redhat.com,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v3 05/10] arm/cpu: accessors for writable id registers
Date: Mon, 14 Apr 2025 18:38:44 +0200
Message-ID: <20250414163849.321857-6-cohuck@redhat.com>
In-Reply-To: <20250414163849.321857-1-cohuck@redhat.com>
References: <20250414163849.321857-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: uXCmj/jh5blD

Also add conversion between the different indices.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/arm/cpu.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index bbee7ff2414a..775a8aebc5d3 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -876,6 +876,13 @@ typedef struct IdRegMap {
     uint64_t regs[NR_ID_REGS];
 } IdRegMap;
 
+#define ARM_FEATURE_ID_RANGE_IDX(op0, op1, crn, crm, op2)               \
+        ({                                                              \
+                __u64 __op1 = (op1) & 3;                                \
+                __op1 -= (__op1 == 3);                                  \
+                (__op1 << 6 | ((crm) & 7) << 3 | (op2));                \
+        })
+
 /* REG is ID_XXX */
 #define FIELD_DP64_IDREG(ISAR, REG, FIELD, VALUE)                       \
     ({                                                                  \
@@ -923,6 +930,17 @@ typedef struct IdRegMap {
         i_->idregs[REG ## _EL1_IDX];                                    \
     })
 
+#define GET_IDREG_WRITABLE(MAP, REG)                                  \
+    ({                                                                \
+    const IdRegMap *m_ = (MAP);                                       \
+    int index = ARM_FEATURE_ID_RANGE_IDX((sysreg >> 14) & 0x0000c000, \
+                                         (sysreg >> 11) & 0x00003800, \
+                                         (sysreg >> 7) & 0x00000780,  \
+                                         (sysreg >> 3) & 0x00000078,  \
+                                         sysreg & 0x00000007);        \
+    m_->regs[index];                                                  \
+    })
+
 /**
  * ARMCPU:
  * @env: #CPUARMState
-- 
2.49.0
