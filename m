Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42732njb;
        Mon, 12 May 2025 11:05:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXGqmLa2EnjghkzZNBBYUvu8JfeEcFgpus+1xvP4ZpSemVmI8soXu08erAOro88KSRcbJXNNNjwqBN+gw==@linaro.org
X-Received: by 2002:a17:902:e54f:b0:224:191d:8a79 with SMTP id d9443c01a7336-22fc8c7b6bbmr201126395ad.27.1747073128520;
        Mon, 12 May 2025 11:05:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073128; cv=none;
        d=google.com; s=arc-20240605;
        b=ZO/hX8lh2cIq7m6jfKPT2r57ei9pX88u53sjbYw+F7thI8kgrWhyrD8wwS9XU3KIlv
         IArM/wOLLHwHFATCjwI9Ed3W5sHaB79MsC/Kr4dIjLo7RvQByXszbcYMacDRqUTNIUyR
         ENBorNze/AonqTC6BljELPDFgj3XHUxguq2qdPy0o+EV24wmh/3VEdtZAMpiA4dBcWya
         Ng8/mnwl9qt7ncX4iw9jaZizXaaHcqs2yFIAaAysK2i8wATN3/BQzkT/wtcADqWed9UL
         KxiWgznBzivbehVd+/C7ekbryPDLE56Iw8QA4esUhQOvKEagH8TEejATallWUUZBkcEX
         JqHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=u/RowU+G9lDkd5OLEKmfnzuDeOXrVzkwWk098+SYGJQ=;
        fh=saPauhKrhFbd9r8uhXqLpe98gNO7ZMEjIJ6GW39ia18=;
        b=Jkeh67kBkNvX/sW+kDAKNuF4oDk1xluV/yRhxN4/GSpnHANYT27aQjcaYg/tW+p96l
         v5cIlB0accEK318VqtR8dxMTg2JBZ+AD405l7mUpF3l/Qs2j1BKGhOPNh1npfiUZsz4R
         V23eK1wJJK1RFbzXaXeNx7E4C/987kFFVF48ugVfdz8Y3S5Beg0+EvUD9IkZ5UN9vSRj
         2MSNAYJ93wrps+mjd03QuRgB927YySSVgYNR3XDc9he4x0qIJWR3rn02Th+lhX6UcXy5
         zJpOkinEGh8NsNJn+MoxsRzQvlAeQSnAyGsXHk5TEEjQ3/rOF8ffmvQFQIbUbHZCV4mj
         +E8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ey5H5l2R;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc5824c3bsor63163305ad.2.2025.05.12.11.05.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ey5H5l2R;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073128; x=1747677928; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/RowU+G9lDkd5OLEKmfnzuDeOXrVzkwWk098+SYGJQ=;
        b=ey5H5l2RBPuqN8quiDWQDhktLGk/aROR1ISm2zJh/+y9A/6XRT3MZ0gF6ti58NtMiZ
         a/ctrn5Jp6DgGMYoeImRD5YwoQAmWyU+QD8BCC0sturhSmFg2BkidCr08sGABljPOs87
         RYAys9LMMSlyGqiQ7TX8ZcKv06GIxcVkCSYzQOutUllRbbsuZTAMXefZsqdDgDMRFDEd
         W1YLYpI//+osiZLZWEyIROxYFDEcaXlLSj4ZJIv1aMCsv4FdurESFJFf6snl9TEdUS5m
         U/HCCu9A8aRCmltSRgfr9vXrA1+rCp9Ydir//OiPlyeYxI3Xu7wxSFyS+k/WQzhbrjpy
         M7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073128; x=1747677928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/RowU+G9lDkd5OLEKmfnzuDeOXrVzkwWk098+SYGJQ=;
        b=s5YrXNml2RVLzRHGv35NCmpoOt5ataLgVldFKX/8vmcX0/fLHhTJaL0aePZMm+Eof/
         j/ZYj8WcfNk0GBMGXwY0bsUErSSBvUAbKBr6yLNXHJ79flJJYX+ol0PnUHe2vyJ43D5r
         D16/v48UAtt6zEGH3CWhjL/rAYRyyqthpFn/R0EsI/TmxJ+llzYnDD886lGYrvOQXyhz
         bYrgsmLGtATj5TSKOznePVfQ2D0TnUNAvZIoyjK5dW5RbsVdQ2f4bNLNlAebr5ihCYzB
         4nV2/yEBDUZV3xxmgeHvR81xUbjsSO1qDRrWWhX8LsWUXCtwMY6+/c4E2T8iEceFDfUC
         gxqw==
X-Forwarded-Encrypted: i=1; AJvYcCUQsnBBNu9ljkY9slFZNgJYZ7kKFQ/zXipaFOwLjxuC02MaUk+lJjgzsjQAwJ/yDYA01YN9/4Zzv1aWnQ==@linaro.org
X-Gm-Message-State: AOJu0YzB7s7BbFpX0fHbCpMfl9ClwQnPzgHSKGbH35eEOPlL0Is0LF7t
	UNKjuybnLK1lYxSdi/oxBQj6mAVL4GaP9PK4/7L8heNFdQbmqNOiOpqzeW4Uf61GUw==
X-Gm-Gg: ASbGncsxHi1eg3+VE4z8t9FugBAQ+GjYMj4YK9hHLJBKA2VO9e+3jg9/OvjFrl1m7EO
	OYTs2jYZyAEb5F7qkL5b2Ng7bZEQvcTRuwNL+q2FMVOEZzetsxT5SDR0Axhvi1r/S9q5s9+qU4r
	O7aAPfDaGidUJvVum9V+Vo4gEUCokiWdu0C/apnVzf0aIPDlWk714RTWpRMkDGfxwnC8OiVA0qZ
	4UpnDlgC1KzUvGAM+/D6UOIcOZJSPx45yjxpxcYbTGpS6zZq+uz1mFDAyV37TM+WE8N8Fcw/+na
	MQfCJYDWeCO/wRfMLrlcWi0Mdd7cazyFa8lp+DISx+4hvqMvDAg=
X-Google-Smtp-Source: AGHT+IGBFLyUXnJODxwQklVoTmHypYD49+fnU1Q9uQoOxl8BDjJ///fY5fDQpGikfqEEvaljvptQSg==
X-Received: by 2002:a17:903:2381:b0:224:1609:a74a with SMTP id d9443c01a7336-22fc9185e2dmr242500925ad.34.1747073128103;
        Mon, 12 May 2025 11:05:28 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:27 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	anjo@rev.ng,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v8 18/48] target/arm/debug_helper: compile file twice (user, system)
Date: Mon, 12 May 2025 11:04:32 -0700
Message-ID: <20250512180502.2395029-19-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: f5c36ePQvlfj

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index de214fe5d56..48a6bf59353 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -1,7 +1,6 @@
 arm_ss = ss.source_set()
 arm_common_ss = ss.source_set()
 arm_ss.add(files(
-  'debug_helper.c',
   'gdbstub.c',
   'helper.c',
   'vfp_fpscr.c',
@@ -29,11 +28,18 @@ arm_system_ss.add(files(
 arm_user_ss = ss.source_set()
 arm_user_ss.add(files('cpu.c'))
 arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files(
-  'cpu32-stubs.c'))
+  'cpu32-stubs.c',
+))
+arm_user_ss.add(files(
+  'debug_helper.c',
+))
 
 arm_common_system_ss.add(files('cpu.c'), capstone)
 arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
+arm_common_system_ss.add(files(
+  'debug_helper.c',
+))
 
 subdir('hvf')
 
-- 
2.47.2
