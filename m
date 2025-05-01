Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19703njj;
        Wed, 30 Apr 2025 23:24:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUSA2UxEQhEUnV++cxxulFzG2v63zlPNNzNXivkep/Q8iV6HoLysShc5kqQplisHxqw58CR6DhsoxZKAA==@linaro.org
X-Received: by 2002:a05:6a20:258f:b0:1f0:e3df:fe1 with SMTP id adf61e73a8af0-20ba6a201dbmr3105587637.4.1746080657695;
        Wed, 30 Apr 2025 23:24:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080657; cv=none;
        d=google.com; s=arc-20240605;
        b=MdgAgt/QtQKoBYsWa5NnTjn32OHkyHHGUQw+iy+bPIgN1IrOd1ncmkG2gpinBUnh2o
         wDK2MUu+rOJS3HiZS0I2tVC8en3X5nPgvXMYAfkinqFToown/x22cxdFFjPwyPFLUA/8
         n9sj0nfk5wzNBe2PIJHtzPs+CKVp2wUUSYgAIrfvSBcmv4WhCRcpWnXaz3A2wLGKimbs
         gfuiU3l9mPmFZRQUCBqB8LVzl2nXKzqKj+gTQ1x73BOCngt9M7s1mE2LmrZn7T+Qnxa0
         R2vNZs0Frf2m9szr8G9htxeoWFw/kcmHltFzHyWQcp6Vh/JMI/ZkPyhPHHjR3/cDNWWQ
         ufGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/+UcETAhnH3DlTkfNI6L/xaOrQDoZAiJi/JTij8z890=;
        fh=oUSyYcsHEKrGKYNyynWcONB3lVFgYANupLXxEU33kdo=;
        b=jopaSWnjtk8SNKdFELEn2XLW/ubh2GuxMHyRR9F67OMyVYrhrQqo8LxoggY9CEk8su
         bVS0/G1HnC3kBaLLQifXZaEyb/C76GsDINhWl0tG0SeF3HkZazN/q0iutV9Rdcp2NLHv
         yAfhmPBWScP8kio4irFuiDn+p+YH8aen/r/egY4QNiiP2WOrZfz4ZIrY+K9s3ExxT56b
         1IS6/+cFLH7sM0pUSUfrjII7TlwtCCMtAkfyfUBaZ7FlexQcK76iXMVX7v0mCRwBefTE
         qnS5wkYivGnpE6+Xw7Y+T/c++c4JlX4IWhXctRFdRUbeFMiz869NqpOZpZXzqRwGmpfq
         0krA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Joyf+JnR;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404eea59fesor70566b3a.2.2025.04.30.23.24.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:24:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Joyf+JnR;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080657; x=1746685457; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+UcETAhnH3DlTkfNI6L/xaOrQDoZAiJi/JTij8z890=;
        b=Joyf+JnRsxYWUgA7au0s2ecRikamEpO0rGtPLPsXRK7k2BLAoqbVmi9YF8B+n6c1gG
         J/YP2K+cYqM/nXp5yLw2OQSKqI3b7qyPEvjI8Tb7ttQpf5fXcxBAPagJsVuTNb/TSeHl
         fAJMsNwu4/Rn9RR24vcgHSbMEquLWqtFB6LGO+w4T8XQlXVVgUMsxetMeCTcK3QdSEu0
         23uLqAyhkcjxfOZRHzPav7sKX07G0WK6JLF2E2dfEiCt4Y+rKidIbIay9y6ChvaKyUcJ
         mNsVqZBonGlkKS29aa5+VRVattPtoC1pmZ5Kc0qtvBNRw3I7uAL9SNdtq9OS7AVUizoq
         I3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080657; x=1746685457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/+UcETAhnH3DlTkfNI6L/xaOrQDoZAiJi/JTij8z890=;
        b=KfRHf9+EbcfU9+prBOQ2pJ1d8gFurkvAmdW7E1STO7RVXm2jcJO6tFfcoSFieMgvMo
         uIP0Myz7HqZgGFuETZFuWFLxCs2OQKc5MtN8c3fIcs7tfy+j3TEMYZAs7+FaJjiYpov6
         4F8ick1NPVP+ewNapYh1LtlGyFEfUOqwmCoM7AcrOJfWFk1mQUZFD69pQFiQsyesmr6g
         soLdasSAgBoMKZ+MebCF4vtB1i97aA21pFErvmQOlMGgf72wiY3OItaJQVFuohUngSDa
         d4YqsJ3tsqRFNbY8Xp3OfdBbnCltHcTlB2sOZ+RmrNoXd9EppM7snp7476g0L9FM3NYv
         QRPA==
X-Forwarded-Encrypted: i=1; AJvYcCU9mE9zHN3q+U2Rr/MKi+FdcH7kN4/wzOcZPR2wCdVhAwkb9aw48/5ztUtqh9ToWAwXkPc1CMqF8lsT7A==@linaro.org
X-Gm-Message-State: AOJu0Yy0DgcyreaoDGpXdc6PShGJPnfVPA11LZbYFcYkHPqMZz6ip/BO
	HlljIE11HA+qi9hJuZEWGLpwPQPQO6cDruIdgdxen3GW5qrPbh/QjGFvjTgg4MJ7dg==
X-Gm-Gg: ASbGncu0UoTs7RNEzxmdqD0Trkg1IvTMqCF5F9/oS2mAF/0W/gOh8zVgiBhD2zs9pOW
	/dx0UwQkqpygn4/lP+BnxBvSunWAAv9HnB8WZKbvpLhQ4aZ5HzhYJwHos5mxJyAiWZkzQ/+aVUj
	D6e8ido+aM+VrZMC92X9sUvNRBFrMndEXkz6aWCGkbotZ+CXPWwVVz0LQNBfs4wQFRbm+CfYsXw
	iunrxke6q53Y5HJFsMQlEuxk1oGUsz3dJenIG8YP9ml63PP87FYEy+kLTOcMEIt8RB1NVGQcdaB
	Cn+lZ35EkRhrrGGXy/go/wD43UFyCzae4U1hw5TZ
X-Google-Smtp-Source: AGHT+IFO6fCxSsP/dkbciCPmyGC6hhrBvi4oVC/NIhTt06uVNHhT90PcCmbCBk2ph/cAM14rqRmSmg==
X-Received: by 2002:a05:6a21:6802:b0:1f5:839e:ece8 with SMTP id adf61e73a8af0-20ba6a201b2mr3247198637.2.1746080657340;
        Wed, 30 Apr 2025 23:24:17 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:24:16 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 29/33] target/arm/ptw: replace target_ulong with uint64_t
Date: Wed, 30 Apr 2025 23:23:40 -0700
Message-ID: <20250501062344.2526061-30-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: npQY3++M5E85

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/ptw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index d0a53d0987f..424d1b54275 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1660,7 +1660,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     uint64_t ttbr;
     hwaddr descaddr, indexmask, indexmask_grainsize;
     uint32_t tableattrs;
-    target_ulong page_size;
+    uint64_t page_size;
     uint64_t attrs;
     int32_t stride;
     int addrsize, inputsize, outputsize;
@@ -1733,7 +1733,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      * validation to do here.
      */
     if (inputsize < addrsize) {
-        target_ulong top_bits = sextract64(address, inputsize,
+        uint64_t top_bits = sextract64(address, inputsize,
                                            addrsize - inputsize);
         if (-top_bits != param.select) {
             /* The gap between the two regions is a Translation fault */
-- 
2.47.2
