Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19486njj;
        Wed, 30 Apr 2025 23:23:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVUlhTvQt0L4WODXreAW1C2iCBHKwCwsGsUK5JMu4xEpWirWljeeSR0lrOcIjQmZDEWDYZxZm/aeDfVsw==@linaro.org
X-Received: by 2002:a05:6a20:19a1:b0:1e1:a449:ff71 with SMTP id adf61e73a8af0-20bdbfa2c80mr1556459637.1.1746080633653;
        Wed, 30 Apr 2025 23:23:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080633; cv=none;
        d=google.com; s=arc-20240605;
        b=c4TZuF9bwIUqWh4T/VT3StEpP8vDQ6XunRsDHHD7DkYKjMJlNJcBGn8cR3hootIlQ8
         035X5gjJ4/5CMEz94DcrLOEcJPglSObXzy1N/ioGWR7BOQFisGVHCTCT25PfQgvIHZob
         LLXXMaePzKK7rzwBeHht5lr8G+hBiI5JKfxyxCdaC7WGJH1nqEXv69PpTtI8vHZFo25i
         wxBLKwow/e6xtmiI/dUcs0stksSqg5HubGxdVUC7z4cc24B0jVgiyq16t1OGOY9751n3
         nrdq9kN/4nmNqwm/Kda5uXmScsBOcAlKjvLJgrgsawK7oATg+FUOkxEaywHXAsn1yG1M
         cOjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PFP3MpqDIAT/Xkpc6JOppR3V5lexoIXt45Qw9vGPUlk=;
        fh=BaW12k67g6MElKIIEgULUnrbtqJErUsz8wD+4leRgQQ=;
        b=Czw6aVcysRO56+D1+YtJyOt0YLaWPP0vdt2fcP2u1ZNbSXz0AhicwXytzYx3LHtOzn
         sFaWisMk9nB+whSB7au0S43vNrftagEYGEwvQJeMhcS4i/DfugPgDvAy4ON/a6ZoNXSB
         GYUksPwZn+6s7LEUcDaX7Xb5ruzc5ht+Z2CA/SyDSB3fFPkVpoZYJFl+GaxAt964YJlK
         Nux5BpWQFcwo7K5xU9KGNjGEYmpr0eJPbEC7n1u4r9TXfR96p+andEOu0k3+RoB4KqYq
         wuORh3EAkJ4FGfACy2bQzsDTRCguckzLYbmXA2JEOdVxrboanouVdgDgAgs1RV8rY1SK
         YXsQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Azwk5YDN;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404e6a1edcsor83973b3a.0.2025.04.30.23.23.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:23:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Azwk5YDN;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080633; x=1746685433; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFP3MpqDIAT/Xkpc6JOppR3V5lexoIXt45Qw9vGPUlk=;
        b=Azwk5YDNVcREGmS/FaqeJ7HqwEynEm8et8GtRMM9fbCtLp7VR6g+NMDZLSm7x+JPHo
         BLVN6Skb8FOQd3eN2uBYwq9E71/Bhl0gH2zCNuT+IzQqzIBn6bRCgYPo9Oyr/hH6Y8XI
         ph31hYnP5gtxT00BiCs0aPT9LHhNcyM/c2iQh9lpL3GEUYLst8ZvTbMZvBLjiaLRjZZQ
         F5pCcKJZETeag0Db0lT6I8HlgnHF5PNroJQ3BjDImE+sHpzHU2BYXSd/a5X+Mo2ESnqI
         a5L5wDxd5DFFwWrCAhUWdPVKlfNyyQRE73MsJAgKL9P7Yk7iuor5/NTf7z/YO0HKPANm
         SYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080633; x=1746685433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFP3MpqDIAT/Xkpc6JOppR3V5lexoIXt45Qw9vGPUlk=;
        b=qFvKMfUHoUEnjRkYcf6F4Y94QPC/nI7jlSfB+MZ3MoaY8u8IHVfhPs9CcjGjdXlznv
         4uQE5ahUQHTlcDvUbUxn4IMPZeOqFLk7TvD7AhrSl+r4C/q7ga88tjSh/xo2XEuWZOqW
         2KWqwEcV6my+Z/eRICwWMlzAesgjxp1eMDdGikN+VsGJZKJb8Sl5m3Nh3LOCp9t4t8p1
         Q9YizdSbNG1CqHw7OLCSGCUDjZ47+/2uxVOT+TcCWcaX+0l5LAJbPmCsuxeIdYhp+Rnf
         GhJPgIE9iJ77PH3UyORIFnzeUS7AGhRzGd+k+tod7MaiqMdBi5CeXD6mF5rlAMb89hKB
         7/1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3qipTzLL1gzCE5olU+SwDTYb+VNJqQ5DmtAw+pdf7LZwFNrpHKjh4JxR6va1/CdQ0YxNrtiaEVipc1g==@linaro.org
X-Gm-Message-State: AOJu0YyUTF0tl8QJlh1nEa7+4EKUz/RVvhedH2cb0JdVES81tZhMk/M9
	ihEUknkkGNB+ULOFFTOXBGHSJMHWutwS3l4yuGE+IqkAcytj/zR9P1lfoKT6nLL90A==
X-Gm-Gg: ASbGncvvPyRN5AZSr44OyCVZe29Mjxl7jzyNbEDJoDdpW8kwhYfEN977/t41WSQxRby
	jWZIFSxs810vUK0HXvMpwpNPGz2HdILIVpUFdmYX6feE2caX7wzeWn5ulhsGY0FnC7TzxBdjyX9
	h7jz8lwiXbWNGSUuUONif+XbGtL01OMTCoNITaLBTqZhp/hNXLfFLLDdRaSqla+/yrktJu8AC+u
	1vV7k6CUK5Tzae+CjIx17P510K/mOpdDua0tsH88SdX5tBoTVMcGbSVQTN9qQzr9+0CWOzT9j9Z
	4d4+DuvIfoq4RpcYu6yoohlxlDS3DakHL1EYNp87B60DeSu0MHQ=
X-Google-Smtp-Source: AGHT+IHLp/Trg8oMhYx6nbkeIUGb3hwNnThgpDTal4sQohjTHqVJXTQEFUpkDpackSyscwLCbu/wfA==
X-Received: by 2002:a05:6a00:39aa:b0:73d:fdd9:a55 with SMTP id d2e1a72fcca58-7404944e683mr2015130b3a.8.1746080633256;
        Wed, 30 Apr 2025 23:23:53 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:23:52 -0700 (PDT)
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
Subject: [PATCH v3 02/33] include/system/hvf: missing vaddr include
Date: Wed, 30 Apr 2025 23:23:13 -0700
Message-ID: <20250501062344.2526061-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qQHsD4Ez0MV0

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
