Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778163njj;
        Mon, 5 May 2025 16:20:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVmV+ulh01B5xhGOHonIl9pe3Utn92iij6oWygEKpxALHCGb1uhWb7W4erldv0qdieoIq7KRH7J29LW7w==@linaro.org
X-Received: by 2002:a17:90b:2743:b0:2ee:db8a:2a01 with SMTP id 98e67ed59e1d1-30a61a6f6f3mr13713520a91.30.1746487226435;
        Mon, 05 May 2025 16:20:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487226; cv=none;
        d=google.com; s=arc-20240605;
        b=Wt5fHpSqvFa6ZJrE159AAMEvPxWG+CTFnmm89MZT+a1a7DDR+oPq48mA+1vvI4iGyt
         38LlCscfcsRFmSftiR1VO3NAr9nGhlWX4Gtaa1BSgMyMecFTcbxwPxd/AdSZumD0j+M+
         A1VdPj9H+kGH4v7pGDQIzbG/viwqoHOD5jOYVtv80qTLCH85isamRhMFHwccDpknrOxA
         XH2bE/gY692v1DOVtjJkHGbGENd9DzBLXx3u+Bzh114pbIyjPGeMIIB0U4llcN+JYct4
         06toglgEVC1QciGIEJZAvkidRdXc6zptscc5BImrwd+2wnA508dsJsqg88iS9P1tXRJQ
         zlmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hckfD0sziqBh1sSWGP9c0OUCVTgvBeVKgVHtB7xMeJ4=;
        fh=D4vC7aP0WnT+EchZ1ceJOGVxgmoKPnHm9o3O7qoKvaM=;
        b=cti27S3QVT6cw0g+mipxQbi5Z6Lv2f+9EuOgXB3JGAAoYQ3dl3mHI+TQAZ/9lrKomP
         TBEG2ShbNJKCzY5mLN6dyzfpmCa1uyY63OkoUCl3TnBvOaoG5oori78JI+pNtLOR9mc1
         q5ekZazDaWb0oksTkNhjq+18oN4spZ+JilBK8frgS9tcdrUppAaZ3BOdsgwbNMWSFBn6
         m3aZqWnE/6XRHu9J2kOvIhA/hd+FY9uwOgket75Yvd1ceeWzssQHdenAu4iTiKtZLtnE
         wvjxvXKfuXle9SdZQjMgOYSAUTgoxNpsFgqG71VizCt9wY0aDarU6AxSIROBhou5ZBXJ
         1K6w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="l/y0wvNL";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30a47469347sor5901032a91.2.2025.05.05.16.20.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="l/y0wvNL";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487226; x=1747092026; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hckfD0sziqBh1sSWGP9c0OUCVTgvBeVKgVHtB7xMeJ4=;
        b=l/y0wvNLsuKtbGGbJEhSlEeTjkMHT49bN4INYYGR180kAdtxBRQEc0bgKyubzeShkB
         k3WJdErvjLhy3+l8wTvIUrRh0NvHfnhuIdtszUYyOjlRGBIDB5NcuauQS8ikLxierugk
         Dswmj+aKu38kWqJsniJgJaC6Db50ecEKkOXNLgLRUsy60PueLw24xhCh98HZ23dJDILm
         RkofLB3gwaPfLQ6OMFhwFIUVfIW3K+W2GlJoOa9Q9bQFHdFcwubH1hecv5qQIOsOSfiG
         Kdmvvx7jiEIG952GePcVzyQRWE3zZ74nbh1J1ak+v/xCxQIDwR7CoIE+pq2Dwqr391r5
         2L3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487226; x=1747092026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hckfD0sziqBh1sSWGP9c0OUCVTgvBeVKgVHtB7xMeJ4=;
        b=mXr0SOsrUeWFE/Lun6/w3/3pkpMfhx+Xz4tX+z5eUMmRu3gC5xMqkoyCfJkVps/dD9
         rxIZjFKLl9agQusXxA49VdNury2bCiluFOC5Xbmn2RQmAfUs7Ebfh+Hu2dOmOBmH1FBx
         HX6FM2DiTFjfxRudKxMfZjPJaKsrXkrAanPwbNDFefm2ZXSizId4VAm3B/QwOkEBOPOo
         ruvz0/oFmw980ujV7TkwRU7pxKj2JVqv3nwqnG+0LqRNuNanEiZsx3tTQIo7K+DfOxiP
         lUyKZIyL5ntn9iCM1Ebvi8i+/MU9Jxf6b9t3tlm9rvW7IVQK8g/0Wi2vvfR7mJ+9C1bU
         ctbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYSNBHLzcftTpfxERlmswK5D02EZ+JGhdesG6Ng2+7mkWWLTYJdyhsrdii7YPF+OjFFV5bi4MDF4XHQA==@linaro.org
X-Gm-Message-State: AOJu0Yyqf743u/lOABZKB7CLlA1tMfE4Jw9YugYjDjQzWyQ4wNHozFIi
	qnSUqDaclGoVfuKH7a5rijKv/MKA2Yx5o/k7eqym0l6D06aV+Nyjv9lH92XWlqdYxA==
X-Gm-Gg: ASbGncvhYA2AkhwaZJDmiZ517WSpRLJUyV5CvP9hLQjZiGkrr3UcFyIqMecF87b43L8
	loUha0wci5hNJRWXp0wBPZMrGPGKTbO+OLqQaG8aferATywcDaPBMD8Ngk6E2Tylv/xkNsNEW+A
	SbyERNUNsbz+SYjHkgYn6J7HhQOfMBx1vQZDG3nq2QcNXaar5/zG8WBPh+ek+8cldhxwuVGCGEB
	lQq+9bHJUARzKIEwnO2kUoGqLvaakUk2QVk7Y/eIKnB3DaJ2LeBeFqj8tXXUk2AeLnepnsPtKEE
	z6wY9Fq1gk3tl7L/POdauSupbc5p7kBcDn0INR4E
X-Google-Smtp-Source: AGHT+IEKId2hWCnJS/+NSIvZmGDfi3jgk5Oq8x6EKCRZTAN5kZeEu43KoC+oMuNp2EoM3sdXTPMLDw==
X-Received: by 2002:a17:90b:1cd0:b0:301:1bce:c255 with SMTP id 98e67ed59e1d1-30a61a50832mr12860527a91.27.1746487225925;
        Mon, 05 May 2025 16:20:25 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:25 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 06/50] target/arm/kvm-stub: add kvm_arm_reset_vcpu stub
Date: Mon,  5 May 2025 16:19:31 -0700
Message-ID: <20250505232015.130990-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: tBpFv5+QPPsz

Needed in target/arm/cpu.c once kvm is possible.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/kvm-stub.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
index 2b73d0598c1..e34d3f5e6b4 100644
--- a/target/arm/kvm-stub.c
+++ b/target/arm/kvm-stub.c
@@ -99,3 +99,8 @@ void kvm_arm_enable_mte(Object *cpuobj, Error **errp)
 {
     g_assert_not_reached();
 }
+
+void kvm_arm_reset_vcpu(ARMCPU *cpu)
+{
+    g_assert_not_reached();
+}
-- 
2.47.2
