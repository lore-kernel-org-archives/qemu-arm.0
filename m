Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp636667ejb;
        Fri, 26 Apr 2024 12:42:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWLxnMVa8TEJBpnlY6k0s8HiqdfsLXq03sqNuP72rL1LIrhsy5e6rYGIa24A3uLasK+ZJiir/V7ySXoC3HB3NbUs8FR5Icv
X-Received: by 2002:a17:906:c254:b0:a52:4edb:6db7 with SMTP id bl20-20020a170906c25400b00a524edb6db7mr2443998ejb.54.1714160576807;
        Fri, 26 Apr 2024 12:42:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714160576; cv=none;
        d=google.com; s=arc-20160816;
        b=aW7jYJbYBEOpDt9Pp+HjHitRCdIJXhrMVAY5wfAdudOSaXd14hi3qhh5gK9n/s0hvS
         g8HudMml+kBpvQPdDC2r+VGK93p21vIw3b6NrHOt2aIxtej+0OBbNdlwAv/5c0WgTaEb
         a3WZEjRuiQ3sgGKZETigqCijOvnaRIGDBh1KkUZDIqUR1AqyWOVy9q80sJMmFzPJAMsu
         ORV/HNWLndCI58X3js5fQRk4Nzi+VnAnHyOLHq7hTxCYDaiL/EvIYa8QGqqOLV3mXR3v
         4mnrz+35qDXxLq5+GB5ziEX1yR/x2bq8QJcNwKIAlMO9mBN6+R3l8XLTMvBcMcPGRP7x
         vDAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=DE5bQD16xfwEMndgjcE7z1cuHvznf4KEW6ZfSJ0m28c=;
        fh=df1Kg2wsyAgkfM5MXWeAk0KUC2ZTAMywxRM9bftXcUQ=;
        b=vSEKeVHZ9GlsK+6mHPnx06MFcdXuqM5j2JgJ9txbVf+d6A8+Ra35JHcKxACfh7r0V0
         VxKgdawVeiA8KLdLycVugUpSNxpRE41bxXBPqyEGozitwtyOChwa24vwavzxWQC7Sx/w
         k3eQBLin3e2FanZWq0I5VvPPyoOjGv+DwXEANxFI3FszhaMLhWPCknv9Tr6Wa0PHtIpo
         cIyaIvXSbScnRWhLxGHPcVoGHPN2QssxFcCnqAt9WVrXkbT05qWpVxc6Pz6RnnoGit69
         dVM9MbesjYaHmjvLW4/NWPF1gPC45gDwougU0sm7iu3JfPxTAGAtxB186n9CI720E3/l
         fhTw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k4gKqYur;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id fx2-20020a170906b74200b00a456839d194sor5376257ejb.8.2024.04.26.12.42.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Apr 2024 12:42:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k4gKqYur;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714160576; x=1714765376; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DE5bQD16xfwEMndgjcE7z1cuHvznf4KEW6ZfSJ0m28c=;
        b=k4gKqYurJV73IhRYxgWmzTbqR5HcpuOmApoBBdn6FQR65oPkUL9Sihc4heE97/Pa4H
         wPhQIdmqbEgyJZ+vVUKs419He+D2KTWk80ugqmesxNInJEqx2RBQBfTx2axtQo0dcU/a
         ILvGFWwCYZh55VpvPt2Vm5YZZVHa9BiM4GyIiAS7O5RiA6+0lFwB11ob1rlnpGwu2xcT
         8U/ZoeNvVQAxRlu3raHV4lJO9upUQ0q5CIME1SOl5ltXvalAe5XrHMYVYA0cL4jvwUAC
         JOhGN7sTcsdJjNqQbj+i77jE/qYvy4rZheJNz5tHLxa9+sJjhZMvyI/SqQlNZtW9RwEy
         pD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714160576; x=1714765376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DE5bQD16xfwEMndgjcE7z1cuHvznf4KEW6ZfSJ0m28c=;
        b=ZB2ETTap20N7tKZHqc1J6Hx1lA4K6LREUx7koIlG3kyxF+N9QYmy9gqozGyKOFTGmi
         KAcAXxhmzcDzJKPC8mLsj8X+J37URyH2NRBwzOOdURiuz1+ny8VVKJGFjoek3Sx6NmCe
         xc3mnk3U0sMDeSWUUpLykH6K3k1qeBohFHp6nYMOcoZVjmQwru2kxzGZI6RNHP5B0unu
         jJIf7JWpgQgdZGICs2Kz2FvJxdDEkXqvvSgX+jeV7tpH+EDw8h8ZDV9HVTJ+ucP86Hb/
         kVPy7VCagqB9EWYJYoMsnZ4qiSGCq9PRRnKM3MW9KF6zO08krlViHjAiXKCyDSSaZGE0
         iPfQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/ekDN42bvYYR+7cvPI2/6RvMV/xpCRRzSvjDMXeXN4uVbnduOl6dgTjGJzMV99enWCy11cTPewzdB+ysmSQLRylafwMEN
X-Gm-Message-State: AOJu0YxsG/jz/kUO+SvHbc2vu7ff/nFzX3lztY+jFRiksGRqMLq/Eezg
	2WbSQKZoGArNX3A7uUR9xdHruEFJz1wmG9YUYKZFLEYq1/d/Gx3ka0O0LnnZKD3N0Q==
X-Google-Smtp-Source: AGHT+IHuivKhc9k4NJGWGfSfiujJsFGjDjDNF8PSddUqhuzyJQcSFexKwQKV1AGdJzYCFcbsEbYqZA==
X-Received: by 2002:a17:906:b0d8:b0:a55:adec:7139 with SMTP id bk24-20020a170906b0d800b00a55adec7139mr2412387ejb.60.1714160576443;
        Fri, 26 Apr 2024 12:42:56 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr. [176.184.11.147])
        by smtp.gmail.com with ESMTPSA id n1-20020a170906724100b00a55bef9ab56sm5775865ejk.120.2024.04.26.12.42.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Apr 2024 12:42:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 09/38] semihosting/uaccess: Avoid including 'cpu.h'
Date: Fri, 26 Apr 2024 21:41:29 +0200
Message-ID: <20240426194200.43723-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hgQnzygYDWyi

"semihosting/uaccess.h" only requires the following headers:

  - "exec/cpu-defs.h" for target_ulong,
  - "exec/cpu-common.h" for cpu_memory_rw_debug()
  - "exec/tswap.h" for tswap32() and tswap64().

Include them instead of the huge "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <42c6471e-8383-45e0-85ee-e20ca32ecbad@linaro.org>
---
 include/semihosting/uaccess.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/semihosting/uaccess.h b/include/semihosting/uaccess.h
index 3963eafc3e..dd289af8dd 100644
--- a/include/semihosting/uaccess.h
+++ b/include/semihosting/uaccess.h
@@ -14,7 +14,9 @@
 #error Cannot include semihosting/uaccess.h from user emulation
 #endif
 
-#include "cpu.h"
+#include "exec/cpu-common.h"
+#include "exec/cpu-defs.h"
+#include "exec/tswap.h"
 
 #define get_user_u64(val, addr)                                         \
     ({ uint64_t val_ = 0;                                               \
-- 
2.41.0
