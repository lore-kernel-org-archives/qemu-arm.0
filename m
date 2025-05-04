Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756089njj;
        Sat, 3 May 2025 22:29:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVWfKio8lcGf6H7MD+iSu5DkZ7zjZeyvWeTbw/Wf+KzEfgQpRMzxbWltOjp+oLMiYWfzAB+1+nZVIO0SQ==@linaro.org
X-Received: by 2002:a05:6a00:35c9:b0:737:6e1f:29da with SMTP id d2e1a72fcca58-7406f1b1d98mr4142812b3a.21.1746336566155;
        Sat, 03 May 2025 22:29:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336566; cv=none;
        d=google.com; s=arc-20240605;
        b=T+j0ixM7hq+hs7K2Jk/VwYoaQqIF9neXuJbsTABTGWtE4Ni5j87LgUDrYb2c2Ba4Bb
         cV0HkCKh9R4M8JI/poBlYiM0YxfSYzSMekCHLAdUv0L0iro3X4W0c7q16Tkiwqp+MK5O
         mAzv0mnjmovz0zKSqxwb9hPUbTqpRLMiWkkCs4MIqYerd0M+SV0nIH/ZHkY3CdJP+Q36
         /zlvJQRqW1FcmJP0k0ZdbCKYsWSlQTPV4tLBfhec3Rsuw3Ezs0kPTwJ6uciDQ8Pw0Z9P
         Tle64llXc7sgv//Dz6rBOy1nOGQ6kIbbyeqjaC04E6rdZlgutPOYcLTFqKCpPz/jzGbr
         ivDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hckfD0sziqBh1sSWGP9c0OUCVTgvBeVKgVHtB7xMeJ4=;
        fh=D+JgWa4/IXVty2w0nQ5g2zgtzoCNSV/eYzY1Bl5dw7M=;
        b=Y5gEbD9A4K9TyHjrHkCvftY7/1gg2e49WIPosaVV22qBYjT2Wk9WNEWJcVo74yQ2cQ
         ajTMaV9N8UPmNhhiBs2hd1RnUa4mFI3uYQAi1PFsRd3u/Vcevn/asp1GloUBEESWp6YE
         vrMIFYTc8qEDUNgwdWkK2j2cHIBfeuWz/opTHLnHWNXLVD6Vqho8NyCTcMrovltizCvz
         tXBIip3wHhQyMsuWK1BFgpO5R59ZkSlepwcHj6fnH/UE1aRw//dK+x5XUyaBtU+Im/+S
         0H2/LnYWa48wv5J6xjegCKKTNsH+w/XCd9H9iffQ2QBNEGSUQOGRxoWLTxIvTan6ecfp
         LxgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gOjQOAlO;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404e59f458sor4972605b3a.0.2025.05.03.22.29.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gOjQOAlO;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336566; x=1746941366; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hckfD0sziqBh1sSWGP9c0OUCVTgvBeVKgVHtB7xMeJ4=;
        b=gOjQOAlO/jKjR6QuvfD9Rca0tmou+zBUMhi8CkjRHPY9pjYriZbKlZjdfhASPb2HcF
         UEdGZsl0Axzxb4E84/j7sx+zTIKsiOANpDWvonrN/6RRNlRi1EQZAg1xar2cg9IaiLiE
         2zfDQoqVQNkk9RLSZTLU0R6ds1urX2vWBmCP97p4IZkdODlA2R5vCwpJzBf9Xa0sZjmW
         k1RPXha8eulMYDLwQ83tdclwAh6aZvIsJ56guJ2e+llxokdFQ75OC8e1F0Gnd4c/BXw0
         9jq0Xon66JHos/ZbMPOf5BRvAayosyS8wJVSIW0e72l+DjOgnmcb84Vo80SVLlGNRJO2
         QXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336566; x=1746941366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hckfD0sziqBh1sSWGP9c0OUCVTgvBeVKgVHtB7xMeJ4=;
        b=oazo0dp3PdLZH8kY4K3bjVayc+WYsNB50BhegEB974CbUjzC/reM2xVlFe6JEQruC4
         2DZYoVekb1BxD19GCM7O+bJ2JPjnluAGFnfe15a98aRwLRuAEyI9prE8WkYSOhV0Tx0W
         EwJTNVd9kpiCnWxc9kIYu1cxTTQlQSx+OIKEh+uL7wRONersWAQN9jS1r6VXwZ5UPlHj
         pRsm6vOcV8WlekwFKDPzVciUgWpobkxI/yjueSaYV0MpCJrIYcIlfY2luSICzvmz8Uv0
         SrklJTueSZ2bZfldG7723CW12asAsIKrvfY+Hx/wmsvAkvD+bWBiSw5iIb65Ln3HeyoH
         /12g==
X-Forwarded-Encrypted: i=1; AJvYcCVk4eytti2wfLUDP7k/lgXxz0X6pWdDLbfTOcjzB0ZWdcD1sU1DLg9PQmNbIk6ZEVr4cF9i9stZBGy0xg==@linaro.org
X-Gm-Message-State: AOJu0YyQWvrTxWdfq6UPJ+F4ROwGCxz70rqSLApAwT9iYrE/LQjR+4zy
	jJfE7yQlhVqcCOjUM7mREp/wQAvRairKlUZBEHY7jtDQ3pWtsZsYEMAj8x07i1S+Tg==
X-Gm-Gg: ASbGncsxK+edLbQpe7tdY2DvmxJ9zo4Wz+dPF32g8nwSgb2n+6cq8Y5XxacXQs8brKp
	QzUmRvMRfKEY4CbDPk5J5BOE1lhcK1Pdm2i895O+ekSKuibnr5bOYO07wx2haGaXReTV8mEkVnP
	jBXq+WLM/gyVKDgCaJ780maEeLWLyozpk6lIuKN/boIWlsiaiVysK/hgvDHnK9Vwy32lcjBwR6I
	9oWecStAbpy49MUC9Vr8yktsz/pBfTjQ3idbngT0AoDD2thWVfiwQX6ZArgG6r17ai1FV0rahsz
	RTrzFvF71HmC+WzDUxwZL2YsZv2ki/goUE9Qitp6
X-Google-Smtp-Source: AGHT+IH9DqCwqIyT/DBCwqtOTq25mvsgeqw9qLrc719PnyccXJW5Z6fI1bjRjbsEjGhKSkyNrtOGcQ==
X-Received: by 2002:a05:6a00:448a:b0:736:562b:9a9c with SMTP id d2e1a72fcca58-7406f18768bmr4045118b3a.18.1746336565824;
        Sat, 03 May 2025 22:29:25 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:25 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	kvm@vger.kernel.org,
	richard.henderson@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 06/40] target/arm/kvm-stub: add kvm_arm_reset_vcpu stub
Date: Sat,  3 May 2025 22:28:40 -0700
Message-ID: <20250504052914.3525365-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: rkcqMmHlDJ9K

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
