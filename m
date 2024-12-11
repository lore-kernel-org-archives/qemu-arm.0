Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4417895njb;
        Wed, 11 Dec 2024 15:06:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUqWvhch8+SP9pVkw6FmM3PinrSDX27R7P/D/inQlm59hizDaVzINb6DsRBhf2QxXloYVx5/iIF8WyxsQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHpuVhv9vhAXFP38GTHYuDjbPMGkEJcPaj1UzFcBdl40lvw8jQzne18gvWxTWKV/vnISqzd
X-Received: by 2002:a05:622a:2b06:b0:466:8616:2553 with SMTP id d75a77b69052e-467962843abmr18875381cf.48.1733958376218;
        Wed, 11 Dec 2024 15:06:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733958376; cv=none;
        d=google.com; s=arc-20240605;
        b=Xj+VbC29KowPar+urLqsPzOHHqskOQoF0d+arxO2JJapT9DFUMTr1eQnuFWuG0ld2F
         3H3HS2ZnGQQO1BKRY6UTxGNba0u73sj0Ey5nAXjJHRBYc4upQm2qKTnRm91GbrUSnfw1
         9JqfVlsfYAaYEnuZ9N+czhPC089HM7k8xmGXai9EVOHH0IEKgI9Lz8TYyHgzo5R0GFta
         KCgOKuZAsEzwSyM08bs0Xw68gLfZIEUxVBZRj8huicgsjxT9osOst3+/2nFi6hcW7jR7
         vo5b7Iwd3gBKQbBnPDkN3FZzXcH28GxSlx9y375Sx6iBVBKNRkcOzNLywrlD9BgyaxdF
         jL0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KujEMlgf4sTtMREgvgm8kU4qI7hcBzQ7iBZYjiigW3U=;
        fh=A+9+cJ4tExTzbjI3ke3PZTIOhgEA6deymRrS0cTp4/Q=;
        b=lihy5qJZhc1oKUbrx0DH4A7c1nEHIdbVArmxwZJbUIAUVEajTSbnGNI0Jz4DOUMrvk
         KU3qH0tcFwA0XK9RpbpczzAJCBBbb9HCnKPwibFJbN+nEYn52QbVDDDk9XPYgMz3J/1K
         B/L8n7wGq4k1y/h5CN7+HlA05fVVEmxsHV9Pdygcie/Ecv+Dz4GAZcsf83OvUMb8Gd77
         iA6PMejKGJtbVKb5ZzU29BpCVJjPTdLg3dziNmEJEaaeqPjmlrfe8youDOQ1d9+1p7Aj
         zCKvOpifoRPeo8eIlVobBURq9fBLQjqLJjYK9xZP/PfjnyEEF5+3UMA+NqigmiBTJuyr
         3Ntw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ehh76pDG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46789105249si30630141cf.76.2024.12.11.15.06.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 15:06:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ehh76pDG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLVkd-0002rL-0T; Wed, 11 Dec 2024 18:04:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tLVkb-0002qG-11
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 18:04:13 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tLVkZ-0001uS-3G
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 18:04:12 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43618283dedso19683165e9.3
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 15:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733958249; x=1734563049; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KujEMlgf4sTtMREgvgm8kU4qI7hcBzQ7iBZYjiigW3U=;
 b=ehh76pDGgXM8krjWCraj4aZE3l+G3tJjdHms0Krkpg4Z2AmG2w1Euu3jAIHJfyio7Y
 H6x6XcItkMMWOkE4njc6fWdMXR6APW7YmCDLO1lAPQacUKy0/xqnvm8nEmU1t9xh8X0O
 nPsy6XCqimhDT68/bIpNDKw3kAIXIGITs8SFLdCEp28/Cen/OFQkJfKlhZzjT7iTogkS
 VkAodSjoK87YCo5TVoMgB8X4poR8jlX4Y7ipDTWt1QEZfqjk4fqWy1KaR6gLrcycnvC/
 52BRulV/gpxdDv2TL+9Hfv2uYDf42E7YXVfTe/xHCVe8AkA3uydKMpl5E2FP/QyvXUJv
 9HIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733958249; x=1734563049;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KujEMlgf4sTtMREgvgm8kU4qI7hcBzQ7iBZYjiigW3U=;
 b=n8tr+H61WcLuWTjV9AcmIoDnEZ5AWXYUVnNW5EDzGkuG022DBiMHszDWhtVVxT3TPH
 LgkWoRNvIZXIJ6IoDMvarC+lcw9mgmMSaxJ4QB+PlbqF+Hpe7jnGbotyf6N4ExDdpD0H
 n8FWIR0qIUe8m2jtR/ERbTEn/HeN4HogQWXIwOHVzvtnP7LezmvVZfC+riogWx4dkrSz
 1/VG8Q7rJT4MHJEiiTpUkSkV0HLUcadZXpdnBI5mRItFRU2lhVmFGJWDZZ0d/Oc030gV
 FMP6Wzx9gwRss+o+RsanaqOAVWmxpEI8pR6oB0EBW1XpYjQkSzAlTfNw5LZ+yQiDWdh/
 JcBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoPzHVtRtRDsyDAjSfWAHZ56L2AGwVd9eWpDFg9U7g/rQHXdZalRyCrFn/4dN18eOhhyGNJimHrA==@nongnu.org
X-Gm-Message-State: AOJu0Yy1/IsdAqJRuqjKzYH3RGWHfl+Oxqni2QeMnJMpaYB5eqKkCg/t
 Z4JpPjQAdvP2CJN3BhemZa+JxkvWybCn/kK2f6Z3PkNKmJu7OdXMrREA2kyB+IPql2p03li5Fa9
 J
X-Gm-Gg: ASbGncsUB3SfBNV+1PMn2gm+gJw7wAZQvkgvpgPBJeKyKEXtiuaXXezq/lja9F8ijlk
 gIaPVvcksEidw8W+6YzF2mFdDjDvbTG5186Z/jDDOrsUgaz2UQ7my9c0XjoJh1EcbRou+DsmVwI
 RSUgIHyyzyRm8oLsPE/c8P1JoGBcnnP8WVkRPgNXPze0WB9xO2JtXYUKnPXYK5TJ0knUU8aZ0vj
 GYmrlfmAnivZcRhqynv8Vzt+JW3Cm0fSq8UWGLMtSC12x1Xc7b05ZwDGSETHBwmFeWk7kAWuCHH
 65bXZ4To+7I/DuLl97l5oZIWZVTPz2CBaQ==
X-Received: by 2002:a05:600c:5104:b0:42c:c28c:e477 with SMTP id
 5b1f17b1804b1-4362286383amr10729675e9.23.1733958249569; 
 Wed, 11 Dec 2024 15:04:09 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4361ec75410sm22742245e9.1.2024.12.11.15.04.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Dec 2024 15:04:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 2/9] target/mips: Remove tswap() calls in semihosting
 uhi_fstat_cb()
Date: Thu, 12 Dec 2024 00:03:50 +0100
Message-ID: <20241211230357.97036-3-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241211230357.97036-1-philmd@linaro.org>
References: <20241211230357.97036-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: If+Iv2w6ZRYS

In preparation of heterogeneous emulation where cores with
different endianness can run concurrently, we need to remove
the tswap() calls -- which use a fixed per-binary endianness.

Get the endianness of the UHI CPU accessed using
mips_env_is_bigendian() and replace the tswap() calls
by bswap() ones when necessary.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/tcg/sysemu/mips-semi.c | 43 +++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index 5ba06e95734..df0c3256d9e 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -168,6 +168,7 @@ static void uhi_fstat_cb(CPUState *cs, uint64_t ret, int err)
 
     if (!err) {
         CPUMIPSState *env = cpu_env(cs);
+        bool swap_needed = HOST_BIG_ENDIAN != mips_env_is_bigendian(env);
         target_ulong addr = env->active_tc.gpr[5];
         UHIStat *dst = lock_user(VERIFY_WRITE, addr, sizeof(UHIStat), 1);
         struct gdb_stat s;
@@ -179,19 +180,35 @@ static void uhi_fstat_cb(CPUState *cs, uint64_t ret, int err)
         memcpy(&s, dst, sizeof(struct gdb_stat));
         memset(dst, 0, sizeof(UHIStat));
 
-        dst->uhi_st_dev = tswap16(be32_to_cpu(s.gdb_st_dev));
-        dst->uhi_st_ino = tswap16(be32_to_cpu(s.gdb_st_ino));
-        dst->uhi_st_mode = tswap32(be32_to_cpu(s.gdb_st_mode));
-        dst->uhi_st_nlink = tswap16(be32_to_cpu(s.gdb_st_nlink));
-        dst->uhi_st_uid = tswap16(be32_to_cpu(s.gdb_st_uid));
-        dst->uhi_st_gid = tswap16(be32_to_cpu(s.gdb_st_gid));
-        dst->uhi_st_rdev = tswap16(be32_to_cpu(s.gdb_st_rdev));
-        dst->uhi_st_size = tswap64(be64_to_cpu(s.gdb_st_size));
-        dst->uhi_st_atime = tswap64(be32_to_cpu(s.gdb_st_atime));
-        dst->uhi_st_mtime = tswap64(be32_to_cpu(s.gdb_st_mtime));
-        dst->uhi_st_ctime = tswap64(be32_to_cpu(s.gdb_st_ctime));
-        dst->uhi_st_blksize = tswap64(be64_to_cpu(s.gdb_st_blksize));
-        dst->uhi_st_blocks = tswap64(be64_to_cpu(s.gdb_st_blocks));
+        dst->uhi_st_dev = be32_to_cpu(s.gdb_st_dev);
+        dst->uhi_st_ino = be32_to_cpu(s.gdb_st_ino);
+        dst->uhi_st_mode = be32_to_cpu(s.gdb_st_mode);
+        dst->uhi_st_nlink = be32_to_cpu(s.gdb_st_nlink);
+        dst->uhi_st_uid = be32_to_cpu(s.gdb_st_uid);
+        dst->uhi_st_gid = be32_to_cpu(s.gdb_st_gid);
+        dst->uhi_st_rdev = be32_to_cpu(s.gdb_st_rdev);
+        dst->uhi_st_size = be64_to_cpu(s.gdb_st_size);
+        dst->uhi_st_atime = be32_to_cpu(s.gdb_st_atime);
+        dst->uhi_st_mtime = be32_to_cpu(s.gdb_st_mtime);
+        dst->uhi_st_ctime = be32_to_cpu(s.gdb_st_ctime);
+        dst->uhi_st_blksize = be64_to_cpu(s.gdb_st_blksize);
+        dst->uhi_st_blocks = be64_to_cpu(s.gdb_st_blocks);
+
+        if (swap_needed) {
+            dst->uhi_st_dev = bswap16(dst->uhi_st_dev);
+            dst->uhi_st_ino = bswap16(dst->uhi_st_ino);
+            dst->uhi_st_mode = bswap32(dst->uhi_st_mode);
+            dst->uhi_st_nlink = bswap16(dst->uhi_st_nlink);
+            dst->uhi_st_uid = bswap16(dst->uhi_st_uid);
+            dst->uhi_st_gid = bswap16(dst->uhi_st_gid);
+            dst->uhi_st_rdev = bswap16(dst->uhi_st_rdev);
+            dst->uhi_st_size = bswap64(dst->uhi_st_size);
+            dst->uhi_st_atime = bswap64(dst->uhi_st_atime);
+            dst->uhi_st_mtime = bswap64(dst->uhi_st_mtime);
+            dst->uhi_st_ctime = bswap64(dst->uhi_st_ctime);
+            dst->uhi_st_blksize = bswap64(dst->uhi_st_blksize);
+            dst->uhi_st_blocks = bswap64(dst->uhi_st_blocks);
+        }
 
         unlock_user(dst, addr, sizeof(UHIStat));
     }
-- 
2.45.2

