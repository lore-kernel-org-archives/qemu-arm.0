Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1993218ejb;
        Fri, 24 May 2024 16:23:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVTsLg3dENxh/m9BdZkS26IKU9k7TUShOvV+V+YxFfpr9P3j2qM0ZkHECzDjA/L8PWZBXrQG751WQtzVis7COJLNBxsdFni
X-Google-Smtp-Source: AGHT+IF8exNPs12MslZCzCN6G7fHpPeTu4hln8M0Mt1A9HX4xfy6fZpyHVa7l5+btlMWORIhX0WW
X-Received: by 2002:a05:620a:288a:b0:790:8656:8427 with SMTP id af79cd13be357-794a08fbe82mr1104262885a.7.1716592995347;
        Fri, 24 May 2024 16:23:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716592995; cv=none;
        d=google.com; s=arc-20160816;
        b=Uu5dI/lUUO847aYjghUrhEPiD+xBficKC8TJQ+d4GtNtQkyfONWe1wVXcqtu7fUeJ0
         bSR2V2DsylHDqpnJXT0nICX7233LIXnrMo5jhxeiJY6FLAZ3oTwxGqvrU3OLp/MksrQQ
         tGuBG2NsFot5FQTlTDF6BmTBayD14q8AByvum9DZNYOkt7/5t7mdeXBZv9ppZtZtJyFn
         SzPU/v0wh7+vcfGimAtVmb8B9x1UQw9bZ20Gf0DJ6xHChdwWZn2gzUvovjbf3X+a1gqa
         NjYnemARseMV6a6sfcaWDqh5hp0uL1WwKxfEfk1DBTcPbqWy5OPTqqki1YNga9hj+n6k
         b0jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KUNkPH2LlhkOxE/FhJQAuoTP7MfTsPeCObETyK8mLHE=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=R9Z7JPy6jubHAT+6cTJE19FjYwW5dCR1OzCrLIPj4d54UfgpvPeD8+Zn1AiDb5X+BN
         IinVy1Uab0eBzFRdOve+eNabeiZWOQBYuUaDHJX7gqIlXQQ3MGT/6oMLn7Tt13ripSKE
         g4aGd/5xIztNFD/6MHs4XvUX7jYa+pZi601uD17+pOExRrUR8KlNHXZ8VrfFU1Zbyb5+
         S49vD5rTvXlX1JUTbuw93zAoVY3G2o939LG7hf1Go8naNtZnrBxghqDFDy1z9+3MVRaw
         bZKq1XBGtBKmKsJM1GPSk2YM4F1E9WHdrdEP0uAUttAJ2XB0Y09q74xxx/mftjhLL8/Z
         jq3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T6dpvyZU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794abd6013fsi292614785a.733.2024.05.24.16.23.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 16:23:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T6dpvyZU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sAeEB-0006SR-Pr; Fri, 24 May 2024 19:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeEA-0006R9-28
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:21:34 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeE3-0005gW-Qr
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:21:33 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1f449f09476so8483285ad.1
 for <qemu-arm@nongnu.org>; Fri, 24 May 2024 16:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716592886; x=1717197686; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KUNkPH2LlhkOxE/FhJQAuoTP7MfTsPeCObETyK8mLHE=;
 b=T6dpvyZURTbpAR1qSKze2Qr0APB2/2lXn2HAIN9Pe+I0xYnCAHAI1h0E19Tng02TqV
 PNXDFxppY4bQhXluOzeBZZ56LbmQcJjD1eGs/dbG3baPL9Z8EKfct1fINN5B3j8lRgbz
 Nqpo5tyCW5+k0Nh4iVzd8DRy7yhYo5zGV6JCWEcyRkWxRdW18xisKmF5POi0CeuP8Fp9
 qyq+BsREL/9gvIbD4rCCbYI6s2RTecp7ecPKaOCCPsHDiDLSdNTyYEsP92avXQyBiA1C
 2u9j4KhMFW0jnCjQF3DEngHxIwTyHqmQ4LF03pGjDcM9pmxrK0x8DFIsoO57gSwD1iVs
 tChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716592886; x=1717197686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KUNkPH2LlhkOxE/FhJQAuoTP7MfTsPeCObETyK8mLHE=;
 b=NSP0m2W9SXyXyeFzIMEnpRelx4dE/+9b8QzcUWqwlaaP8VOth/kC4Op8vjo/b6xuOW
 CAJK6rlbD5655wffesiy1/ip/9dVkx0J0nIT3bDRC623pWm6pcycR5rO9qSnGejIoD5F
 Zvx8/Lz/k8d2zhNJmnwm6iGFVEONPXyMjhrRClz9/INgwfk6MWcvZJr7dqxuHzu4ao30
 i2vADamPdFQ2M5ZFp5sw/8sPirvN4zO5WU5ZomCsxG0UuNoDfL52sdasphQTBadWxkRA
 jMeNtE77F4r588gj8t9MFMQi5ddDkQotdqOTYJbQgvqNYOwfaufZi1M0nrqqZBRJMhG0
 b9cg==
X-Gm-Message-State: AOJu0Ywf9gBSXuHjGrg4KXSY69o21Q85c8WBgF41aPi7U5cEVV0ufBGF
 BTdy/Ia+7LI32QR9XBRoDrEU/fVEvj8YzfPYJxFkU5GzfPsb4hTBOyVmgpgAZ0HpwpUdLh/VFCp
 o
X-Received: by 2002:a17:902:ce8f:b0:1e7:e7ed:cbd8 with SMTP id
 d9443c01a7336-1f339f51964mr95547375ad.22.1716592886285; 
 Fri, 24 May 2024 16:21:26 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c759ceesm19178305ad.10.2024.05.24.16.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 16:21:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 04/67] target/arm: Zero-extend writeback for fp16 FCVTZS
 (scalar, integer)
Date: Fri, 24 May 2024 16:20:18 -0700
Message-Id: <20240524232121.284515-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524232121.284515-1-richard.henderson@linaro.org>
References: <20240524232121.284515-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Is9WiYb0IMn9

Fixes RISU mismatch for "fcvtzs h31, h0, #14".

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 4126aaa27e..d97acdbaf9 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8707,6 +8707,9 @@ static void handle_simd_shift_fpint_conv(DisasContext *s, bool is_scalar,
             read_vec_element_i32(s, tcg_op, rn, pass, size);
             fn(tcg_op, tcg_op, tcg_shift, tcg_fpstatus);
             if (is_scalar) {
+                if (size == MO_16 && !is_u) {
+                    tcg_gen_ext16u_i32(tcg_op, tcg_op);
+                }
                 write_fp_sreg(s, rd, tcg_op);
             } else {
                 write_vec_element_i32(s, tcg_op, rd, pass, size);
-- 
2.34.1

