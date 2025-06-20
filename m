Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp877268njc;
        Fri, 20 Jun 2025 06:07:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUXbaIRpm7HNH084PZIgby/54LyhsW36iawdwX9MyM9ysDKTHhh6xGxL9eNLiDMQr44dFIz5fnw4y0zBQ==@linaro.org
X-Received: by 2002:a5d:5f8e:0:b0:3a5:243c:6042 with SMTP id ffacd0b85a97d-3a6d12bb6b6mr2447614f8f.2.1750424849158;
        Fri, 20 Jun 2025 06:07:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750424849; cv=none;
        d=google.com; s=arc-20240605;
        b=Pg03lV3tfSGYOUaWPnRTjzDsXRrCn3/R9MqIa+VYAY6MD8uj9Dlzr5bKveTBMmL6UH
         ua+kz2+7kSeX3VKDna6/OkhEQUlurmVdztayzinFxq0JS5Rt6zoQdNFxzS1Zxu1lNVBW
         fOEOHhCc5UXDIpPI1bdR3YfX4YQExANFP2QLTP7RMXSQks7Ke4RvNZu6f0uCqFDr32ba
         7TQUwTY1TfiNcuYMol64T2/xSc+SdBH+yUP+vGnndsTEBFbrGkWGuHWGe8iLkeceJVU9
         ncDAMPp4admpQIbznLzl3of1sB0WkfvdF1hobQSjx8rONxrmODBmUouV6XzjfuYH6Pvz
         xaaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=g4jpPoIjWAnN20gltB2a/vOsrmaIk3+mmplMj5/YsrY=;
        fh=W179P++p5bs5QYIx2teMjokuuLSI99Jk3HNUP/wbqwI=;
        b=Pj+udGZNPWMhpk7hwXMeYwGCbkh5uKIjRjXhriF8MfYNkh5IYUxfaCLF2cDj64UUeX
         2V0hxJ25+5+O8gOPEJ5R+cIYAhs9hlmAnFr3ZiNmo0+qUnn21JKSX1U4BbDWXJ6bM1Gc
         1n4DAyhdLlthWE77ezj/A7SVOyFDn+9Va152krlM39s2hnAr+Ih2c4n3dbdwVfEGIznN
         Y7IO3KMzJh9en0kkw8PIyxXbBzbA6hIPiYg5NNYJMWKqresWp9EOS3TmyQXGJObrf4/W
         wkyA7zBQP6aOqpNRQIJ7qYGR5mgfDVXUEJXF597gQqXB0HopyAYEKB8lWTWJZdiJqUzL
         JM/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZrwlE8OB;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4536470ff0bsor8051555e9.11.2025.06.20.06.07.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Jun 2025 06:07:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZrwlE8OB;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750424848; x=1751029648; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4jpPoIjWAnN20gltB2a/vOsrmaIk3+mmplMj5/YsrY=;
        b=ZrwlE8OB8hU2Ne+HXKud/4ZkbSpm5mryge0ZdjASixnI9GQiv21d/viXrMA4ezZnhB
         RLxfIMFgdhLBlhR4BHc6eC8jiH+D12GSEmj+RNDTGU1xz2yazsb0ioQui6/9FjG9Noy6
         LVrNyQQ95x1vUA7T6d1lucnFAeKhstHAEb3kHEE0Auh62Pw37PqRDL3CoMXO67E/tzKW
         3rU/6tqPAcS8D7nz57C6t1JISAfWxpTg49A3iEei8Z6NAxmrkFshDYkIh2Y6iZrNRcfu
         gxypxWRyYyZgTcJnYVVjdj5sJuRTgEHSNmHGBIyCrHx9fDWtLRg6+8HLIhrq5Z1fB3jj
         v+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424848; x=1751029648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g4jpPoIjWAnN20gltB2a/vOsrmaIk3+mmplMj5/YsrY=;
        b=pg/HbH5vh2gXx0UkfOi7rZYGLyneA6YvoI4N1oSkO4AJOdO9H0N2qdnpKfHp3wxxiH
         vEv8Cjx8ULvAwhqpyOKeOK3HmiWnx3tqu2by4tvrBeN9k9Jf5/TTNU0SrIskfRZTqh3n
         3tWWB0pijqLVPbKtXFVcTPv6u/ocrX4OB68imMrwU6IROakRNE+g0UETegp1Rcxi7Q8r
         WB8np8fxxvXDqbeVE6IE+mR9M6F0wFTIHjmJgQ+iA8YUY46Wa2VpkLTRpRpABETrZlAv
         nxWT0xdHbaQQ1Tebtr7OxLq3oovFNZCm49B+s23zspVxWFwV0b+lZeI6WbaQLVjwyiDH
         V3iA==
X-Forwarded-Encrypted: i=1; AJvYcCVOYa9eGCgBRXVCMawt8ypUQLhVyMrBu0As8swYiCPN/mqPwRTXbngrHTLZog8yN88lHdWFvs9M7scAYw==@linaro.org
X-Gm-Message-State: AOJu0YxbGpJlz00s0TvR0+G/Y4KzpwMltq5g0wvUWgAGxicSDkiEwB/a
	5CuQ7EZxIrUXBFUY2ZUCxNW+TfNEan7DbjGBEIQYSxY1A0GS5LT5a9U77l67U0HyDOFn0MvHEz8
	KRER7eP1FtQ==
X-Gm-Gg: ASbGnctN7D5E67OO3X+nXzHrg6EOypmk+Jv7JEdiSYYFGUlQQh6w1qLGBpbYtnyGG55
	ObX7egOi2dWmAWjHTJQ+D6mlKqJJGfovU/dmQ1gtSJrYp/cEwNfANvEpJj1lxNFhzzr9AJ5cnj6
	OZWQbFTQnnYdp4/KNpwT5YOhLVGeQD1qylQKwTkKsWKzv31OjwuGRUHY6tayryX1ZvrdBA1ITxP
	1c4ppcED8cNI0tlN8lVDQd7Tph0uS7/Va9/yqx+MaM7pdeU0nsm5x8dDHrOSxCNZUNCc+8pjRak
	34sxWVe7zIiNwG4QIfDjOj4rtQnW+XYLVTgSeCbzO4jT3e6/Sj3YPpJNir6glPsc3iEzkSVwn3f
	sRvlkjTV5gIP0cIkXQ6syCUDD4TWfe1VzYyQ5
X-Google-Smtp-Source: AGHT+IHvqyAxctyWiDO7wt3FaACda4gkUZk2ECgfjgeswwsSXX3ba2fXpQZsZ/3OnTwR/gx0VWlMzw==
X-Received: by 2002:a05:600c:154b:b0:43d:40b0:5b with SMTP id 5b1f17b1804b1-453659b885emr24539615e9.25.1750424848387;
        Fri, 20 Jun 2025 06:07:28 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e983a4bsm59724925e9.13.2025.06.20.06.07.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jun 2025 06:07:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Alexander Graf <agraf@csgraf.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bernhard Beschow <shentey@gmail.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	Eric Auger <eric.auger@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v2 03/26] target/arm: Unify gen_exception_internal()
Date: Fri, 20 Jun 2025 15:06:46 +0200
Message-ID: <20250620130709.31073-4-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130709.31073-1-philmd@linaro.org>
References: <20250620130709.31073-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0Pt/FC/78/Lt

Same code, use the generic variant.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h     | 1 +
 target/arm/tcg/translate-a64.c | 6 ------
 target/arm/tcg/translate.c     | 2 +-
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 1bfdb0fb9bb..0004a97219b 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -347,6 +347,7 @@ void arm_jump_cc(DisasCompare *cmp, TCGLabel *label);
 void arm_gen_test_cc(int cc, TCGLabel *label);
 MemOp pow2_align(unsigned i);
 void unallocated_encoding(DisasContext *s);
+void gen_exception_internal(int excp);
 void gen_exception_insn_el(DisasContext *s, target_long pc_diff, int excp,
                            uint32_t syn, uint32_t target_el);
 void gen_exception_insn(DisasContext *s, target_long pc_diff,
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index ac80f572a2d..7c79b8c4401 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -433,12 +433,6 @@ static void gen_rebuild_hflags(DisasContext *s)
     gen_helper_rebuild_hflags_a64(tcg_env, tcg_constant_i32(s->current_el));
 }
 
-static void gen_exception_internal(int excp)
-{
-    assert(excp_is_internal(excp));
-    gen_helper_exception_internal(tcg_env, tcg_constant_i32(excp));
-}
-
 static void gen_exception_internal_insn(DisasContext *s, int excp)
 {
     gen_a64_update_pc(s, 0);
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 9962f43b1d0..f7d6d8ce196 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -372,7 +372,7 @@ static void gen_rebuild_hflags(DisasContext *s, bool new_el)
     }
 }
 
-static void gen_exception_internal(int excp)
+void gen_exception_internal(int excp)
 {
     assert(excp_is_internal(excp));
     gen_helper_exception_internal(tcg_env, tcg_constant_i32(excp));
-- 
2.49.0
