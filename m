Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp24615njc;
        Tue, 21 Jan 2025 03:41:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUJ+RRrNSQq8o7IeU09Lbq7+fAXDyFROVTDeFD2Gu4CDHDpdO+sbxknfa9LooaEaZKrfZ5dkPmXssCT6g==@linaro.org
X-Received: by 2002:a05:6000:2aa:b0:385:fc97:9c76 with SMTP id ffacd0b85a97d-38bf5654fc8mr15857983f8f.3.1737459709234;
        Tue, 21 Jan 2025 03:41:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737459709; cv=none;
        d=google.com; s=arc-20240605;
        b=hqD87r9yJRYy5XnKXH650mjcgNCzQ+v29GPQ/ac2htDSQJV3I9sOWzSBqq8fBAXyqp
         vv1m9FeYvtVtyLseItaCymVVhmH0tkEfzVYPMysolMOa1ljgTzRUTRhnAYztH/wJcqBn
         2QNccVnpK8i7e23/Sdan1hmFr/CTciPrgMSj2JX+qTXlyRy/GnQ6K9MbqUAWbFYV7yKd
         +gnHMnFBqgVgp4e50PeXLj4UZyjEeGpAk6NFkush/ZL0NUdPd5tTZc7toenBIq0qWKAS
         LmiAxWpjpc71E0iCmbx+u7mwqDgRRPZo1JknHd1XKjCEstrzopg38U4wjc5C5POmaYJR
         Kp4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JKO/X1IO97t8jG/iIr5dS6mXwUKP9YiNx8QxL9MbrbA=;
        fh=RQ2oDWEEglq9vOMvmQL2Cke/M8+ZRUfik6X36JaXF6o=;
        b=T9oMOBcDzgXdlvoxgTyuE4G0e+3n4ZIzSp+IuJc7nCTXYh+l3bbhjaYneBMXpFzn8w
         IGP40az1A5Z7KVnqjy8+Qv8NTtWw78jIsc7y4M1kzrCGwOB2W6Ml9niLWLVb4qsCELIs
         6/PdEzp3Zs33RJFwM52PZH7Rb/PvJ86vNeArr2Y47SYvACVGtELvF1L1asF6T+x5ddH6
         IxBntVcXtIgAyeqlSVOC0Rs1zwiTJFvidaO6jR5pSnt2ujVQyPfZOB4kcpD8PpNi7cAv
         cJVksGDngUvM6iqrfPfQAOcXXqy/cV/UkM45GhU1WgO7unUcwe3VtdZqKo1Co2CgcneM
         krFw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eVOZh9kB;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38bf3265764sor2679201f8f.4.2025.01.21.03.41.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Jan 2025 03:41:49 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eVOZh9kB;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737459709; x=1738064509; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKO/X1IO97t8jG/iIr5dS6mXwUKP9YiNx8QxL9MbrbA=;
        b=eVOZh9kBh6vTYmSYCmEFDtrxcRug+V8O3Mv8huhc5+nzGkgBpaSz27qU+LfRr0AQig
         srbDWbUKTdd8SxU0UKpcB6kFcLjtv8hqSmt5uyulDwd5v5si2xW67Ps+SEWpNMBQ/cWj
         LF9EXIs3NXK0vpsjhh59YZhwVe/qXfkXhVanlKaWf2oOZRCEoz0fimTkmn/vYaILP8nd
         Xn8G5Jvd8vlyFQ0t2b5khwqZzYAhkNIhJ2H8GLS0lqZ0yJjxXPDbHC8i0Lg6lvnSLQgz
         A0esttrk8tkEcRviS/UAUbttpyQRE3rIgwleg5DZt61g/4WN7Cx5x8RXGt/fokDqiqR9
         +SAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737459709; x=1738064509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKO/X1IO97t8jG/iIr5dS6mXwUKP9YiNx8QxL9MbrbA=;
        b=lGHR0C1p/ZAraOFR1sbs8aLeYIJQWHkq4HLbetr5gL+FZIOI+QRprtkTyixZbJlSQC
         Oaghuc51iu4XusR2B1Z4el9gnCFb6ZgPfhBUxQMMPwB3zWT0CP5jKP6C+NC29ffnP4vo
         3uy9RFIyJbM68/94rw44UUGaddNP/E89QgrfUPyVcYpbj0Zm/rsXf/ml7i6g7kw9Uuh9
         zvdwOc2ubSuNghwNqYXCIZ3IA27n954vLV/+j8B0YtlS6Cu4zUZ5XP2RzKyzzfZsJYCr
         1Xaw8Yq3tJ9eVZMlcKhVaRHIVhZb+IC8XVuUanhcozLft9sB9FF6E+3bXIq5sVgbyKeC
         JyQw==
X-Forwarded-Encrypted: i=1; AJvYcCXw6U3waUOtSfQWUvoMVLB7T2OMsgapgeM0y+HfqgaG9qGIhFw9ftLfO/IHkn3kyMgI8moRpJECMGwG+w==@linaro.org
X-Gm-Message-State: AOJu0Yy/GxVCZmrIpMhUC88hMubhSNMF9iXFy++CaO6qwvoqYstZQI4F
	0okKx266i/a6CkHi6lEACYsaB35AMw+wQ91KC0gvvqK8i80lcTMySupSoy5lhqY6cg==
X-Gm-Gg: ASbGncsBilCcLs+GxfuHf6M5IkcKdluSyIezLiLre/kgcqVPwnYtICxI4zkMkkSxzHr
	2g6YuOVWYU8E8MRfTLWl7NCXsb5rEp/Ns4xlbtlIE76i443iJtEADTpRN8BN6SzDPKHXpWjkTCl
	ahLqXrb4trGOzuYB/BddxnXozYxmO7ct1M4rsry1tA4zDPkd1q7JKTKMTIGPdoAns1bdm0fIj7x
	bpTaJX3E+sFSoIffekyDgCL0GVVo8ZlZryRDJ5HVsahvoL7FkZw/kf0df4pH8YAwfQZQMTSXDyF
	6xzaq2uK6TcoUS8s6+hYG7qQ8U2IBZTiBQqFnJisl0Iu
X-Google-Smtp-Source: AGHT+IEF6r/BOM15SlwCgbDLBO7CnzXyrWtA2PXkV9Mzb5yTQDnNfIiv2ZYAH4Cn6iQ5ZwFQlubQ1A==
X-Received: by 2002:a5d:64a3:0:b0:38a:624b:d55e with SMTP id ffacd0b85a97d-38bf57a684fmr18798886f8f.41.1737459708732;
        Tue, 21 Jan 2025 03:41:48 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322a859sm12903513f8f.43.2025.01.21.03.41.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 21 Jan 2025 03:41:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 11/11] target/openrisc: Prefer cached CpuClass over CPU_GET_CLASS() macro
Date: Tue, 21 Jan 2025 12:40:56 +0100
Message-ID: <20250121114056.53949-12-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121114056.53949-1-philmd@linaro.org>
References: <20250121114056.53949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: A1Sz6EL+rLqL

CpuState caches its CPUClass since commit 6fbdff87062
("cpu: cache CPUClass in CPUState for hot code paths"),
use it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/openrisc/gdbstub.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/openrisc/gdbstub.c b/target/openrisc/gdbstub.c
index c2a77d5d4d5..7b6a31fc97d 100644
--- a/target/openrisc/gdbstub.c
+++ b/target/openrisc/gdbstub.c
@@ -47,11 +47,10 @@ int openrisc_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 
 int openrisc_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 {
-    CPUClass *cc = CPU_GET_CLASS(cs);
     CPUOpenRISCState *env = cpu_env(cs);
     uint32_t tmp;
 
-    if (n > cc->gdb_num_core_regs) {
+    if (n > cs->cc->gdb_num_core_regs) {
         return 0;
     }
 
-- 
2.47.1
