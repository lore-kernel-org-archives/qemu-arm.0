Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756070njj;
        Sat, 3 May 2025 22:29:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQJOl7Xi5TnMinbJhrhLzBU91Inl/VSkuFSRJ+G+4UoogXBbMlDu0DYewz2XWy3oUzY2apTnp2PBhjLw==@linaro.org
X-Received: by 2002:a17:902:cf11:b0:220:bcc5:2845 with SMTP id d9443c01a7336-22e1e8d34eemr40192765ad.7.1746336562887;
        Sat, 03 May 2025 22:29:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336562; cv=none;
        d=google.com; s=arc-20240605;
        b=A9V410ApV3VC5YNYXNo5AaTsRgb6X8OxJXfgMZIuqS0iCCZki2wsyICzTNMlich/Ey
         D8rLwCEBXVYNk6GQikyxIGc3HR0Jh7hy4AO2IXpzwV9+TRnWJUcpFFqDUpg5TR1nEChS
         c1hELSmm6n7/7/nAGGzeEf+7JdlisT3OeBati4yfR1qPfP60zKn7RetWIiXBaCQQJ2ye
         aT4uhstwELUg701COT9jSl6iyb7+UAtzVA3HqQFl7HblycvYtBcl45N8f3tVsRw1dezE
         yp1TB34wCxpHC771NDXD0JztDJ7a8s6LHVi2n9ElhXZgH79VDOSOX8hXV88Rzkb+nzxo
         NPqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PFP3MpqDIAT/Xkpc6JOppR3V5lexoIXt45Qw9vGPUlk=;
        fh=UiJGqbYP3hyDJDX7LYxw6ZS8C+0m72DnfdI3jl98EmQ=;
        b=ihThDfYNM6OG6Ol+9hwnqsVvSQJ6rOPk5DXVLfJnXLow9kAJGtiCUa36lF7iAWiB/4
         XE0IZ8bkEWeg43Il77hRyoOcodCZK+ibE6xixT54JhMIRNyV/LB86A/HlNtCMZRxx2UX
         kwPVRolmW2+lTz55fLceNsy0V6SmwTMG/09MO4AI5o5TxsFWDHnr4GysEfE1LMKh6Cj5
         /gS1lWvzb7N5ufaSEixfXeYfkpaZl5xvHCQMgSa5+h1hrIfPIKNrdKs02xDh0qYMcyBz
         BuzfY26HWeuuO2q1CdcwlmfP/l3NrSVrVj7PwbbAUwQ76gHYfg/x32CdFmcpDLiKKK5r
         7XXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rsEN8Bx0;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f7c0e04sor3327368b3a.6.2025.05.03.22.29.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rsEN8Bx0;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336562; x=1746941362; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFP3MpqDIAT/Xkpc6JOppR3V5lexoIXt45Qw9vGPUlk=;
        b=rsEN8Bx0sE5aasvM3Z9pRSyzwh2FiNDJ9DNL4LZrF05wrfMpGgz+UdGxILomkOM7m2
         44QjYrNsrTkze/8knu7O+TcOyBDbwuuuyE4YgvgSWRKyiM8srZvxaj7qLM/CgR4XVHZF
         JKPps3kEZKLePmilTTHy20P1dD+15Wc4HlvhVZL2Tob2fEvFnnyhu2j7apaAqA0nFeVa
         5yzSX8vSB+cd00+w4J1hLTyoYhQIe2Y9hCvpqRVw9pfHL0erF9iuLHQglZOxr6dJk+t8
         ypTJRT22BJG4bZDx6N9FWRBYdr+/dRK3KLLlvplcjs60JmZRVYHoNLkuOZ84P4To+mvZ
         r5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336562; x=1746941362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFP3MpqDIAT/Xkpc6JOppR3V5lexoIXt45Qw9vGPUlk=;
        b=Xj/obIrDpG3jn75ad+JX4npFKajYjSVrzd0BVjDrdiO79XX/PkZVVsJ3mnHzEYupOR
         2GclBMnftlq01pfpEbasA8tGbmLl8igF7JkgY/eB22RRT6RcRgVl1lQPa/LLzpDPHxLA
         YF49d18y7ffnG7ImrYOWsbQ6VBP/NT5vnMNyhICoxWkxzmoI/62hpce7DTyaqD/FF96i
         mGMJswRirmnR/BBD5Rt7JyXYlboFvRQ10mPKWgXGWtnX6GgU4dq3v+UeZEVxbFc1FtzZ
         p1QNOS0F3jp4BEZLfpd9M7Am2n6k+Ny5Shb4RJtRr/XBK97868JMfvN5+c24HOCBYVp0
         QqkA==
X-Forwarded-Encrypted: i=1; AJvYcCVmHP+uer14XGdZMCSiB2tnIhuZrPQsFAVpQizrqeE5Phq0rnkoYI8BtytcTaEikdbW74UjjtCU0jjtkA==@linaro.org
X-Gm-Message-State: AOJu0YxarNmTkHSrEO/LGhVRR74aaiQ7z5hKXEDryrtCXbewgjQ3nTVp
	wvfAQ3V3VzuWdHMBJ+Mt5O8Gt6GJ487M2+S7wJdF3tnVclvZAUHNvq4xu+jFgRwiGA==
X-Gm-Gg: ASbGnctWURHepFoZWLCJFNxAfzuPvp7/Gk7SrxcCnFE8XY5zdwIJNxLHgluLnqRbKdr
	MZJV51k4UoV5G/zi0ptinpw90xxnTa4WJg7mKT1MpWrdPV4E9ZpDcH2pzmsdyVfXHmA2PlyLuLi
	TxXvjmTTY29ydx5AnUfLFwLOTXyA4CMG80D53/J/bAAL4s0fMy8UD5vX9Opc1n/K/Ol4XJW/mPA
	+y3A/96M7g21iyMFL/zylKXKmeervf6PTjLVAzGySHpVIFtITu7XvKUhp/cNTFNyd1yVTUMkzpP
	gIhXMEc+j+rQaqdMF3ll9Gree3l3YC+gXIeW7071
X-Google-Smtp-Source: AGHT+IGVK6o8RnQD2bGJOKl+UHtGTQnnp3KoDBZBcEbovmyUrpyvzVjbZzuPCUjgGT+PmS29OCZQbg==
X-Received: by 2002:a05:6a20:d524:b0:1f5:8605:9530 with SMTP id adf61e73a8af0-20e97ac0020mr4372318637.28.1746336562311;
        Sat, 03 May 2025 22:29:22 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:21 -0700 (PDT)
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
Subject: [PATCH v4 02/40] include/system/hvf: missing vaddr include
Date: Sat,  3 May 2025 22:28:36 -0700
Message-ID: <20250504052914.3525365-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8SqDeK+kxPTQ

On MacOS x86_64:
In file included from ../target/i386/hvf/x86_task.c:13:
/Users/runner/work/qemu/qemu/include/system/hvf.h:42:5: error: unknown type name 'vaddr'
    vaddr pc;
    ^
/Users/runner/work/qemu/qemu/include/system/hvf.h:43:5: error: unknown type name 'vaddr'
    vaddr saved_insn;
    ^
/Users/runner/work/qemu/qemu/include/system/hvf.h:45:5: error: type name requires a specifier or qualifier
    QTAILQ_ENTRY(hvf_sw_breakpoint) entry;
    ^
/Users/runner/work/qemu/qemu/include/system/hvf.h:45:18: error: a parameter list without types is only allowed in a function definition
    QTAILQ_ENTRY(hvf_sw_breakpoint) entry;
                 ^
/Users/runner/work/qemu/qemu/include/system/hvf.h:45:36: error: expected ';' at end of declaration list
    QTAILQ_ENTRY(hvf_sw_breakpoint) entry;

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/system/hvf.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/system/hvf.h b/include/system/hvf.h
index 730f927f034..356fced63e3 100644
--- a/include/system/hvf.h
+++ b/include/system/hvf.h
@@ -15,6 +15,7 @@
 
 #include "qemu/accel.h"
 #include "qom/object.h"
+#include "exec/vaddr.h"
 
 #ifdef COMPILING_PER_TARGET
 #include "cpu.h"
-- 
2.47.2
