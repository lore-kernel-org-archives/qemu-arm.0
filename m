Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp1004555njm;
        Wed, 30 Apr 2025 07:58:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXynSW36u4yE0wT2dUt1+CWEqgHRrMzSvSZHXj7009d+B8e4Q6BA6xYQAb9ZSplnZAaOWMnyVWJbps1Hg==@linaro.org
X-Received: by 2002:a17:90b:2dd1:b0:2ff:692b:b15 with SMTP id 98e67ed59e1d1-30a3336fa2dmr5823455a91.33.1746025135394;
        Wed, 30 Apr 2025 07:58:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746025135; cv=none;
        d=google.com; s=arc-20240605;
        b=SM3075snMsM+AasJUzLikIENdJlJ7NE2YwknRdmXvU6SZiC58Eq64haJvc0vJjT4FS
         nqZ3RL0bHD8sOBG39kL5g0XBsTzH/uE8ZUSKgnj5RKvH031cnwR4TNdqPg2/8ifYoTtK
         KisQam37hjzr9GVObj+pkYAuCpHtZaezwXL+mgi57B9d0l1E1jSzB7cH4oYy+LnG9ioZ
         6erpF91pMrJ/o9domWDmqlnlmRS1uXXA6iCGcsqQ2VMkRo304n4XLxslZvoSvrdpdBxI
         tJW0DOuH6vZSKIIGJKWrHcNo//WZHf2U/paKnyA+dLTH3+wdomCyB9os6fT/6gr+SY5r
         Bvlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Bo98cnrbBzZhIVM6McCtIYbYMjUhtLO9PiS/H/WvU/o=;
        fh=UKHiRe+/L7coNjdc021bVxN2+XfMhBzT7xtKb5lS5jQ=;
        b=Tx9tn8R8YSKAwwtTSdEhGuTnbPPu7hcWXXhWa+ielnETXAXJ9xPwnpnNyhM0OKch2s
         62628ke/urSedtGzVrC3bBhhSm/tA32LFxS1VmocUw64oI4NccWd22Jk++0Z2ZWsolyM
         MXArW9lTeZeH9JFxVfZNdojUST1Ynphd6l4CsFsZ3efRuoKOd5Y0hQiACOqjB2k6w2qa
         2tT6nWpp6eJJEUNqbRob0G00hIHsFmTmMlYTZ5W2uCsvhoLdBD8+l0fSmV74oBTBetAO
         ttGiNIiY1DW4bQ/HLfJYmJCco19TUJSgb6DXDtF8d1ZutANNxQowkj3OsJV+qIbf3rDx
         C3Rg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K4SojtJs;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-309ee835230sor10349445a91.5.2025.04.30.07.58.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 07:58:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K4SojtJs;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746025135; x=1746629935; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bo98cnrbBzZhIVM6McCtIYbYMjUhtLO9PiS/H/WvU/o=;
        b=K4SojtJs8DRr4nB2HekKXrYH8+OBIs1Uo7gHKLDgRxAIBKW/zx/GCtGYejW3i5imJ0
         7TJGW7SllEAjj+G8m/Sgka/39lzYHg83PXyzr5bV+i0PCoEsIziYod01pIpYAIclXH15
         mehS8wmcISmabpJVjS9YdXRoZ/lT+880b929pBG9qjMfk37LeD3muojIFa2VVynBXZum
         vJmhWI8beUZxHnDs+VL5LIcR2ktWrPaFFNKu6FMcZxu8tDwid8866O7Q7wBT8/5tMVFr
         XwIILyL/DahS/cnwpyy0lC04mbsoVr3qE9T5YXjKvT2DwKbVw2XWJenTy8Gzx5K+R+yD
         8eOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746025135; x=1746629935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bo98cnrbBzZhIVM6McCtIYbYMjUhtLO9PiS/H/WvU/o=;
        b=BnskRmEC5qKZWZuAsBAsese6wPalSOCpL5aPrNnssQzipV7vNjB1jqUsBSGvEmfEy2
         mRVH47r48yyCbV9WptJaRTEWfJJFs66vGBASNSKTs8730EWKyJDkbVExonJ0Q0CCVMsX
         fQ/HnFuyN/mQdOW3PbURIeqPSbjnt8k5D11mra1rinCfnVO9JA/fXc7o+7+sTnDghJ6Y
         6qT75gyG+Z8d5RQoCpZ8XzWeAtA58e8ekoEZAl3/3DkwpmDkkQYHEVde/vo0kRK5Mjmz
         sFQlbheX3JJNZk4KyfcZQHHlEslkYM43UE5OqsV87RVVdedV71Vv7WlXheC+SQADks/g
         UpNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyDBLqtG07mQzBviiNkF9lRlUN1CmMpwkEl6bCP7WdYSa4nDqMyRXex8/VcgOH+T+cXr+bJtzMJFJVSw==@linaro.org
X-Gm-Message-State: AOJu0YwooqMS0M2Ml3PGi0M3vbULxW7YNztA5NV+n9eT1nKaEtbWampJ
	mloTBKp5ggZ1S9r9kZSXaG6SyvCiBiLzE3X8GdO6BQCBl6Q2q0JaDLALTdmkvkZhNQ==
X-Gm-Gg: ASbGncuQWAhx5hiiB6c/Mq6nV+KuT7/bcdMSzzVAfY7WZ8gTqvhy3RZLYUnmtJBBDeN
	sTtyLU25EU4LyoqIlkKdwAv1g8s+yT/jS1t6MNlThviR8ScvzarREWHbOkNEPbVOUXksq5usrDC
	RyXVuD0hV8+MupFWHfqNvWhckKz8mb+jj0pF7wynfg1SYawSE6r04ai05rk7W7MZv7xrUzNDgOh
	TbzIB10FPLSWnlKVU7POLfYC6WSyp+zTmhQmSP7XCEM4Bhz+UiTq9bFKO8MQOt1Xbm5OmBgESTk
	U4qxmQhXBBaXGcxw7cUQDhrZ0gyG9jiF7aG4zK7ig+FFvE2KMOg=
X-Google-Smtp-Source: AGHT+IGh+xI14t/EUkO03K5gb8Q/Zyfxn6CDYU6KjQw8SYsR7H4FRtVnj3pTQL/XPPn0r27PGqn4OQ==
X-Received: by 2002:a17:90b:2dd1:b0:2ff:692b:b15 with SMTP id 98e67ed59e1d1-30a3336fa2dmr5823412a91.33.1746025135001;
        Wed, 30 Apr 2025 07:58:55 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a5bd78sm1705652a91.42.2025.04.30.07.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 07:58:54 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	richard.henderson@linaro.org,
	anjo@rev.ng,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 05/12] target/arm/kvm-stub: add kvm_arm_reset_vcpu stub
Date: Wed, 30 Apr 2025 07:58:30 -0700
Message-ID: <20250430145838.1790471-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
References: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Vt2kBRRj5E9I

Needed in target/arm/cpu.c once kvm is possible.

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
