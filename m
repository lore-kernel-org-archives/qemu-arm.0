Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp252560njc;
        Thu, 19 Jun 2025 06:13:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUctocBR8RuE2by109xQh7uRhzcwo+bfOtsGzB6cucSLQvgwAtrBElxDUFYbKMINWGezV1RoZYxMlDZDw==@linaro.org
X-Received: by 2002:a05:600c:8b04:b0:450:d104:29eb with SMTP id 5b1f17b1804b1-4533ca4e09amr197603425e9.5.1750338819539;
        Thu, 19 Jun 2025 06:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750338819; cv=none;
        d=google.com; s=arc-20240605;
        b=B9kDQiCuV0gql3HJFYgiax0gYPSdnYgJHc5iE0SM0B37baJgV5LmeTbwCQSEEdM6RP
         KlD7lwJwWO08DJouaUUUCeqHAoafHFSWV52Pv88IA/hmKgc1HXJMFMcw0EfjXPJ7KP4l
         Xe4G0YayYJsjNIV22CC+Jtr6zcJ3QzxbER6qcBFYfWJx1T+zct6iLYTqaVakIcc9G3S8
         eAxL3UVAo2lTjS7Uc5XPz7RV7u/6PmcBgsXrIvQD4W0VQiPh+r7+jdm6KEGsZrwOiKsv
         wKrHJ6WgmVX0a+3l9k77PZlkEww+jZqSE7fDobwVfkJmpUOu3JmN/P/k1vNJi0+b48gg
         f8yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=m13ygoLDvh6s/fst+7Tr47HarqNeCSRYva1lK7z13IU=;
        fh=o0LaDX8G63FEIfttp0XIRj3Z2bZags4olyWDmyBjjQU=;
        b=VdKtTtwRPjLC7tzQViSmy5KuK3PagHgnRwiQC85KODuHYnWrDZ6WhUZzgilzJwTYaR
         r84iK4aIXuokxGjMRzuFd8VoO05KDXn+G/YG+ACkWbu0EavTI06M6hQcbxsqlxLlzzD5
         CMe+WQ77oK5hZQwtHRY++IZGvgtka5pK3Ahr9SQ1FRwRmlz3Zgu3W27JHsSw76TGAZAe
         jZCVksOZDterxjO2V5tHSefUKGlsUDqktv7uYhsdoj87aW2sT2XwnT+coTMjpqIwTthO
         lKs2OcYGFwXg8y7m0O3AUQBW3oepTfhWjGkMebyUDIrzP5ySWCMeH0AXrhmZWFpeH3h+
         Q3Cg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YiVekvgb;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4532daa1990sor74710085e9.9.2025.06.19.06.13.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jun 2025 06:13:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YiVekvgb;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750338819; x=1750943619; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m13ygoLDvh6s/fst+7Tr47HarqNeCSRYva1lK7z13IU=;
        b=YiVekvgbNh0Aa9QZKiU/CSgZi1SudUk9HyEThUPO/0DFFlI1NS2kur54xGqYpcgd3w
         yMJg7c58GfcWNLj2eBBXnbqz72DqayzwObMHQVElEbUA7PTqTVi7kcJpTjMeEQ/HXtEw
         or1VMCkB+ihg4t+anDIzjbptqpLIY7kM44a7lglVZr7G+i6ZurJsJGKUpcV2uAprvEUm
         3Ou3KpD7jVz/W+6rFoGMglKicEKKhhDiwczmjhpCsCIZ9Ggjd5PIAO97pxxrqpoQR5mj
         FG3ZxNC9FnSnLJshaBXAvBgPcYkjaH+wuz/pyqTajfRcHdp4GzJKBcUQeQg4afOok24t
         43SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750338819; x=1750943619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m13ygoLDvh6s/fst+7Tr47HarqNeCSRYva1lK7z13IU=;
        b=M7WJPq0MjoQa5+a3P5n0WC4vBqJ3yD7w4YjpQwEFcS8MepeY3k3VUyWwKyKrU+F19p
         8ClYnJmBiBCuN8g27PQ5PiOmpozvu6t6Sj/Wbe7cjnTb+wi2BahA7LLqFfmjiFLYaiSu
         0AFOSZIpxPU1nl6VgrDWiLaXnqUWzBVVeiXuuoksDxK/B7YTDvqKArFZ1sj+w8BV53Pw
         c/ZRTFbKnH3izfauJ1dLf5CLird0d2BqRuXcGtvBe4wixuW/ydiQv2NhSQaIWrCChX/B
         mwUIdldhDEGr0+4B4lujzpPwqGd6LxdnvEVe75o4+8FxtdGKKJEuOO9vI4VA+5YqaerZ
         sIJw==
X-Forwarded-Encrypted: i=1; AJvYcCUc9qdFaLadX4CQXFfR15dOHdTH5edztzqNZnn80Rc9QxbUg5htu1TeS2a2d79C8yv/bXF0aczINK6/BQ==@linaro.org
X-Gm-Message-State: AOJu0YzA3Ewk5dYiMAa244kheRZPXabVGOYE4nxGsq2FCYgdE7Fj2CBZ
	GSr/SKchYnCZBPocenwiNjb67Z2YYExaIk2XfPsH1dVfTLI+507MjunSdB2yDC02bgGQxg==
X-Gm-Gg: ASbGncsHeSfDvtotFyVN7ZYw89dTjV3oslobbnpSqiYFTjkToPlKYAjHKNo7FSV4Gzk
	T7dKU4jRiKYbReHcrNptRlaMzB7akA0pGPnkQvjxHRFsZtC99r3WmQGih+G3hTR3zWV3A7fes/m
	S7BcuxGYks7aLzvbBUmOcMHZtCpEi+FEyyTHN2+AJ5HqXUDlnSD5fydzRgJ6uv2P6ItS+UjLWOR
	yTq8hwJOA5PgMtgFZori6UOE2/XvxMvdff0DdrS4kCKe/CKzW1aisvrRF2QlRAt96cfJkyRhwGN
	B5i2hem5rfDL75AYDaOq6fFnx+LHjLYX5eEIrIt9Z57Mf4CJ2dZleYYVTBZ7nKxvGrB5xOWklgv
	u8VL5WS9RxXjg4lPkpnohqKoKYkCcmFTzikhq
X-Google-Smtp-Source: AGHT+IEO8Kjb4Mvn+BDG+XfJmXx2Yihaw89GQo0uaRCmp6Vgs4sSa39n5dXH1LqYB+JVnKA8de7+Fw==
X-Received: by 2002:a05:600c:c16a:b0:450:cea0:1781 with SMTP id 5b1f17b1804b1-4533caad471mr208337255e9.16.1750338818974;
        Thu, 19 Jun 2025 06:13:38 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a63a42sm19432884f8f.28.2025.06.19.06.13.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 06:13:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Julian Armistead <julian.armistead@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Alexander Graf <agraf@csgraf.de>
Subject: [PATCH 03/20] target/arm: Unify gen_exception_internal()
Date: Thu, 19 Jun 2025 15:13:02 +0200
Message-ID: <20250619131319.47301-4-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619131319.47301-1-philmd@linaro.org>
References: <20250619131319.47301-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xs55geVtZeSN

Same code, use the generic variant.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
