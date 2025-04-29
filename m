Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp22944njm;
        Mon, 28 Apr 2025 22:00:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVeIIiTWeaotR28xEn3JmZnIoA5p9po92+oJhfBOID1BHKtwwEj9ReF/e2ns97qbFHzlcDixqro9lOioQ==@linaro.org
X-Received: by 2002:a17:903:2ec8:b0:216:6901:d588 with SMTP id d9443c01a7336-22dc69ffb69mr175280405ad.15.1745902822152;
        Mon, 28 Apr 2025 22:00:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745902822; cv=none;
        d=google.com; s=arc-20240605;
        b=ja2Vx8xHn4mkmZU9Hzjr29dGcpHnAFOV3TeZ2Jt4ydhoEhJvjTGSRoXhbHe0qj9Zsb
         QMX84DE3CDzEQ/1vhZmTkvQkFKxMP958g6jaKyOClsLspHUyP0Z55dLMG5bWvvyElk6U
         s3afwyyEH+5xKkSUwHsasGI4mstqfJGqljq8I75Ae9yzaE9KAbABlbC4GfllyFxRFgnq
         RpeWERcfS1TqIHeIzrrdA85AShoDWeY8ZyF3NctFxNFr1OpNg8MvyD2kWatMKBcczCy0
         b14MlGvL2z8j+IEFv+wlcmQ/mt3JnMqSJq+pF0mLhBnJNLynGGSFCnNWIw/CjcsB0OJJ
         qOdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZmDBK1mwNkNbnmEBtgMmVcGSzIRc7rMtBzbRfWVwQJ4=;
        fh=i6qNRjqc4rp5diB3kBMomF6Oz15QqO7Kpd5Ii0x0Cxg=;
        b=OVYDxUZeBMzQ2Qfb+A01yuoId3r2emglemNlg48enlh7PdTS+84A/dqw9jXjL3f+jt
         hha3Xq8eA6sW66+DFvmpl5gwNHTdCd6C/Ls6a2rfmLD/jCYjLBOiyRwy/9l4SQlSHj/u
         GWLEnxugt4aDVZSFqqdpISuJwOS+U3i6x0XLIusqldPsGvxpnkkLOeR/oZeCV0AJw5wZ
         aQb0zdbPi0mSGqsMV0SyHVDLpQ4qyF9Lr+VByAJGn30wEYGsDrKAF9i89iPnQTyHWPQ9
         jfp0I9ASxy37b7DM5geaDsFCiK819+aqEAPx83ocBFT8PGjXwN9JcBFM9LpStlPU4mgW
         eXzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=THcyMcX6;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db520e350sor73633075ad.16.2025.04.28.22.00.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Apr 2025 22:00:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=THcyMcX6;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745902822; x=1746507622; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZmDBK1mwNkNbnmEBtgMmVcGSzIRc7rMtBzbRfWVwQJ4=;
        b=THcyMcX6O1KV/Qm0I2BQO+mI1ntPpPECuqWJnud5Bev4RTnFORKdpF5Is4agbM/MJk
         6XI5vSdJaO5xlDNB1coOyC4oAPUNofMQF4Kbw1IiTf6iNUecMjTK3bVlpX4AFKkl3jV9
         xI+P+9V4SafuONlDRri0yfwT6SMl6A77RetT6dIQCptZsMfyRU8Zhn7asEHe1GkzCGFa
         mc5h/kKpJPD1Xo1rLgygf5TM/Zue0Llxcy5dXMDUpy6fXey8EHH3gsnrnfur28gjDPxf
         aQrv0OVxUh9yQQQHCDolyvR6H1a3xaEUIf6NokPJ1yvDJKJflVmiP43l21GBfTyPPVDG
         Q9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745902822; x=1746507622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmDBK1mwNkNbnmEBtgMmVcGSzIRc7rMtBzbRfWVwQJ4=;
        b=pHmu9Y2vS4joujWrJ6FB0ibgeAfVzuReRfqc54VkDW0uF9RL3o0Gvt1SQNZpeKx3ih
         Ui81/d4zBTmYHTeYaMneMnLhgM0lyZyxIt/pTiAZqkDexO8HfFXDJhBrrU+luaBIOqra
         ALzpyuM42b058Mmfe+JKOWUKqU2ajCHLWzMbgsLfO73yJUTIya5escGDDIuZG7oI1nIz
         S/c2IIN0hVTF/e9F4nFcOQa3fn0IRAe6WN0hAoLiJmfNH3dieQ3x34qXO/yZEVq6phxE
         926djqoaryxHDVzdITYVUiLAiM7kW/VrWEhaxVlK4vpMoasPmOVl8igm33FG40ZT2sW8
         MBkg==
X-Forwarded-Encrypted: i=1; AJvYcCWV6VPa+1+6iz4FSd6wAjYmEMYYVM1AGqie4zTFIEWzpAKQThs8vDiaKnT1u96aqoC68sG1S5scCuSg1A==@linaro.org
X-Gm-Message-State: AOJu0Ywrb9P1LAP28cbVXnTEBJRitaHOZJ0go0y7Qd7BrEgqWGE8if3+
	jp1kr4f61ppgXr07VnPXm3kt6blGn+KdUvjCv+N3QGGMw50PUqfTWJtzXqshV/Zx1w==
X-Gm-Gg: ASbGnct5OMBGdZ9b7ZtxUmfeH3iUM4rNC5qY2BMwG09rypArXrLzeezjdEe4OhGWa+e
	D3GwSF0UZ0ixRKFCcWddcUt1GybzDcurPas2xyiViB4gaziooO9JfkDk4o8OzPeHnEt8DGwiSKm
	5umGoBXQ6ROb3uoT8iF2dF1lthHmQyEIBudN72gP76GTd2WLAuJJRTNSoQJ7Xb+NDoRdOEgZLGC
	ZLieNCJiecAFHxq/8a31w1mKt509MxHAB14XDKnfB4s2ZXhquCuLYBcwDYJdSGQb5jYnthKbRwP
	Y+SxqIm+qTdQEGMsdcbGoJ3NDIQiufDlxKBLgyGR
X-Google-Smtp-Source: AGHT+IFu3N+jj+Ept4mXyFeiTkaqrsFaktsu0U/CH8Tvkf94SUE6QCp5G/0psN7lUde/shvF6Qz/Rg==
X-Received: by 2002:a17:902:d2cb:b0:224:93e:b5d7 with SMTP id d9443c01a7336-22dc6a546bcmr176908975ad.34.1745902821676;
        Mon, 28 Apr 2025 22:00:21 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd6f7sm93004015ad.76.2025.04.28.22.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 22:00:21 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	richard.henderson@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 06/13] target/arm/kvm-stub: add missing stubs
Date: Mon, 28 Apr 2025 22:00:03 -0700
Message-ID: <20250429050010.971128-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
References: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: BPkS2L6rmBup

Whem removing CONFIG_KVM from target/arm/cpu.c, we need more stubs.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/kvm-stub.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
index 2b73d0598c1..2d369489543 100644
--- a/target/arm/kvm-stub.c
+++ b/target/arm/kvm-stub.c
@@ -99,3 +99,13 @@ void kvm_arm_enable_mte(Object *cpuobj, Error **errp)
 {
     g_assert_not_reached();
 }
+
+void kvm_arm_reset_vcpu(ARMCPU *cpu)
+{
+    g_assert_not_reached();
+}
+
+int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level)
+{
+    g_assert_not_reached();
+}
-- 
2.47.2
