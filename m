Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp24579njc;
        Tue, 21 Jan 2025 03:41:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXJtRi7D81WUUEoq/XMFHPyid48Y+P0Rpq8x9f5iZs5JsQzl3X2ZD5hhVmATbLUvhKOcF82zw7biGHwRA==@linaro.org
X-Received: by 2002:a05:600c:8712:b0:434:a802:e9a6 with SMTP id 5b1f17b1804b1-438913ce0b7mr165650375e9.7.1737459704557;
        Tue, 21 Jan 2025 03:41:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737459704; cv=none;
        d=google.com; s=arc-20240605;
        b=LZpjsI3lL2GhGS5Uk9aSVI4NXYRxWmQBvjwl9iI873W5NjIjEE7ugFR0LXxX9XH7gn
         cw59rtq0M9tsov4N3FzZ+CyqTVzB30pTlCyhwZsMbzuw9e3ONoizvrLrhcrOOKty/3zJ
         ERZ5IXJ5HwLB7hlrPzwo7LEOg3nS7kWMX4Xsyv8HAFvrkjX1sHQb0rS5tLETr7KPPsWm
         tDSlcKw9H5DiUSxK/5DM/Vtitv50YoigpfBNbJZFxhEjuG+s/ND7/pQYxaqS33xj/Dfp
         39tKbslEMgJUG4nzEzncNgD90wM2YwOMH+j4uq89RKUZyhir9hUYhvWjquqrd7d5zFOX
         N31g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Yh+UbdQGf2CtgAWqdvcoJx6GX/6Sn3uz5UbIP9DkSEk=;
        fh=4LIzzdE3lQHpbOYz6307vUzr3HooZsXTg6HtDQQtgsQ=;
        b=TstFH3CioHKj8gAK/wzYZepxynfNagmH1I7g/PgnmdN4fZzQLS19X2lW+ApOWj2WXE
         R2vsuKR7o/vLbjt19gJD3BJD290LJGBMKzd5zUcCaCOqyTvAdZfrxBD0t35RZg66ekLu
         3Axhky2lt0H6ro+So1vbOG2h+W1pS2dV5Rt1sgpS1WjKsNjE47ROUdG08btODfigUeGy
         PkltBenImSGp1pfAHojPROdKXIZdxQsZJxkSjs9ifsT48oVHwvY7qCbRcSujCMV74V1x
         pbxYQP47H/fg5P99H4fAgEBb0kmZ+etBjbO5TQU0SpD9RluWD9PwBDiQlBLGdMZFZ4Ju
         1XFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="y4e+aIe/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438904201f0sor45584255e9.5.2025.01.21.03.41.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Jan 2025 03:41:44 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="y4e+aIe/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737459704; x=1738064504; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yh+UbdQGf2CtgAWqdvcoJx6GX/6Sn3uz5UbIP9DkSEk=;
        b=y4e+aIe/EUHh06Zk1AK8/Zs9gTelPTAOwjnqkFeSSZTihILcVHJyNSng8s2Xe+Io1l
         qqdL01KcxQlH2md1LmZE5ddMNqQA99cSWBvkLrnFWxTDnNOv0WiOjCVH8A5JWCMWEj67
         4Lb+HaLNKfdLPCiec5f/+6BPnMPVwem1ganeGjYkWIQIEXLHeF0EzJNCTVw/sC6ob6ar
         NKC58ff5zKAxwV6xSbjuuHovlgG9bXGvfsUML+cymVyz4GfavSDa7em60E2LtgRh6ws/
         TsXGkU6o8MnKid3YDsYzd3tYeZBluMXDUAm5BK2uGP0aPYLYQWVC2TwjsVCK0Lu/EiZt
         O8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737459704; x=1738064504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yh+UbdQGf2CtgAWqdvcoJx6GX/6Sn3uz5UbIP9DkSEk=;
        b=XvCXO8gu04TGDFocs8mSRVmiZFmEDEmNpOM7q8YmcrXoh+4ObtL8YHyTHrOo0BAoNf
         5borvkGae84G/Nxx9kcqv6CAywsIEjplYbxxrBTa0McG9oDBO2TyznQ7/mHihwMO2s4d
         9W73y7Dgvfa9ITe1sP7x6gFNFIv2ol7CWIgd/ZzAFwISPlPaiqXnmlRz+5QhwafQZgDD
         AGMJn2nWicRUjzq7vyQ3XcNQwr/3F1AP3UQHOd8VUFCfm3jTR1NmXnGcXxsoXEqT7X3y
         0VlU5kA7HFpvZskHyIC8EmaxZ8puLefPsDGvJip7rFc0vVPdNzTR8FZO5Og/DEuNKGWX
         9alQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm0MpNN7xpZ2dybXRWzONEN1q/4gYtNiwWqUtc1R+C6KaULOpPcfcIdAkZ1x5QpqG1IcfbxngX37JxTw==@linaro.org
X-Gm-Message-State: AOJu0YxxkyL1uw8UMHl9cUvS3JDe8rxH2JhxaE+/hHI2qpc8jNkBuOqH
	gkDlQRyVvcO8vltISclrA15GLPAGuslCFSxYUOvF1Jxv6sU6Qjf6YweGEzOXOLZv6Q==
X-Gm-Gg: ASbGncvPp5bvOS6lQMN/qDBVObtKwESOwEb3O8UF9l/CRUyjOuFtlgQpLUsCb0C6V9S
	vqQegJ0Nw+G0l30oVe03AzhbTh1a9kfxsH5YqFjWdlqzKPoxhKPi7ABBs/xsT3BRtS2mE5Vsa3v
	OM+xjpmSAufg/l6WK5SHW5TIAg70tbOWqXka50SLYvLMlN0g8OYwvXrSdNgHOSO+dTJw/czbVy9
	j4KeOwMsCgpUAkiZI7dms50pVXkldHP5bSsY+88r+Ry3MnJy8GlV5iZwYcU1cR1noietvPe/TRc
	zLVOCcyGcTwo8tMsrt4T1LRSr5wFtYhv9IYLPaz55q0l
X-Google-Smtp-Source: AGHT+IFpB2rYVUvGYR5mMClkISZgoJI9xiLPY4vVTM3qUpJkrxr1utH7Jel7yEGJjtEsgQDQLXYGqg==
X-Received: by 2002:a5d:6da1:0:b0:385:dc45:ea22 with SMTP id ffacd0b85a97d-38bf57a7746mr18709934f8f.39.1737459704005;
        Tue, 21 Jan 2025 03:41:44 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322ad74sm13306034f8f.56.2025.01.21.03.41.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 21 Jan 2025 03:41:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 10/11] target/microblaze: Prefer cached CpuClass over CPU_GET_CLASS() macro
Date: Tue, 21 Jan 2025 12:40:55 +0100
Message-ID: <20250121114056.53949-11-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121114056.53949-1-philmd@linaro.org>
References: <20250121114056.53949-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: z/kjnbiZ/IDN

CpuState caches its CPUClass since commit 6fbdff87062
("cpu: cache CPUClass in CPUState for hot code paths"),
use it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/microblaze/gdbstub.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/microblaze/gdbstub.c b/target/microblaze/gdbstub.c
index 09d74e164d0..8b08ed5cb49 100644
--- a/target/microblaze/gdbstub.c
+++ b/target/microblaze/gdbstub.c
@@ -110,11 +110,10 @@ int mb_cpu_gdb_read_stack_protect(CPUState *cs, GByteArray *mem_buf, int n)
 
 int mb_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 {
-    CPUClass *cc = CPU_GET_CLASS(cs);
     CPUMBState *env = cpu_env(cs);
     uint32_t tmp;
 
-    if (n > cc->gdb_num_core_regs) {
+    if (n > cs->cc->gdb_num_core_regs) {
         return 0;
     }
 
-- 
2.47.1
