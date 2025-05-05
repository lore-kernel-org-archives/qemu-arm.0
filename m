Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178887njj;
        Sun, 4 May 2025 18:52:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVSxI2mf5z91Cqv/4xQ0ZC81JsJf9Mr/uQMSytjkZW7p/L/AroA8+gnGzoGaU+9RGcvT+2SL7ueAL433w==@linaro.org
X-Received: by 2002:aa7:8b59:0:b0:736:b3cb:5db with SMTP id d2e1a72fcca58-74049264140mr18925850b3a.11.1746409979466;
        Sun, 04 May 2025 18:52:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409979; cv=none;
        d=google.com; s=arc-20240605;
        b=Ht8lDrsXV7Z+N24dXtZZLr04gNFTOvXoun7GHhL43DLc7LASceCq2K2WPtJgbxgn3F
         IhkchKNt9Qx4XeK+ZPfkn8ibZxod+QaWFIysnv8m0J5GaVNwPY9Ga7fGAY2RuJw9fVLk
         OHrdto+PcUacul+FPfrA2yhjXd2YtRtRvMHKKdabeRRDxvRluV3LbRYnOU0kzkuWQRWy
         nGU4vqT074oNPN+/bT5MSqN3c5D8uWwEJ8qPneqq9X5zR50CvzwQfq29kzjuAWJcfYLq
         u4LqcVA2NAsmf0EczU9RpTQ7NtuVGfu995inmcoirbY8I1aQYv80okb0Zr8sxC2bJUT5
         Gctw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=E27VnLHwdjjgu7+qzkSpdD6sP1u8J5fzfB0GITxze0s=;
        fh=5xCFNdDue9IJY29DTyqYs/7rd+pK5gUBlfqQrSE4sIE=;
        b=cOqGAEkEdwNyskobVghZEnuTcsV3gksm9J+A1HHSRvGgWQFvOA6tLF5kiOe2gk7yul
         +P5kbcJQXOA7k1las6Jn5J0lL0mtxt2VPwwuxaq7gsvjC9ITY1fYTbPXuNg6ggbPQm1x
         X/B6khJWZduH7TYbqs8Gs7ncK1F3U6QLxug98UDY3GHby/enUbtVkwQIfNuLQtfh07uY
         K1UD8Wk2NLV8mwVQ7MtoyYgmnirbmjpMZ3oqpMrWamGMOpp7gvd0dqDD6/EIYqTToSWk
         3W4Ssf2a/QxVw73UVky3IYbfjLfYop/8qnQBIvcnKhFFnERxMhqdnj2+ltTP58DaJzBR
         4cJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aGGDIk93;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404fa16a8dsor3598159b3a.5.2025.05.04.18.52.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aGGDIk93;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409979; x=1747014779; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E27VnLHwdjjgu7+qzkSpdD6sP1u8J5fzfB0GITxze0s=;
        b=aGGDIk93aYhib0LOxpgrXgV4lYznOO9tCTAEFmWcln98eLzAsc1P6zzvohybOaBXUV
         9JBkjUUo2XWSUXkS6NboolTAZ/fADk/RGeeSrk/j7z2exThn6hmE6dGHLrsdW9BPZ+zq
         7bD8JpBx8FHMkzKDJsCEqbY7c5HNiCQNI8fbcLWchmamOryUm/U3AoEd8mgYWg+81S75
         2TlCgUvFx7byutqV6sUL1CNVJBC8h/XmCq67/4nsBbZ5Ky22tfBQiT9sCILWQETz6h4u
         REsgPCPOmAVW+Iexj3GdNXacJdyoEBcrdMgeyRv0cLdSFkH4OGl+Zj1lrJcE9CaV9a/W
         P2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409979; x=1747014779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E27VnLHwdjjgu7+qzkSpdD6sP1u8J5fzfB0GITxze0s=;
        b=QWm87B/Sl/GbQnRfe6zNSwQdcS0WOpgbb6NQWmLZPxNZjhCnexNRjvEfN50Frupeq5
         URgggTf6qk8r3r/iL7A46m0PFKdmT3NnfKbsMkm0ZsnL5WsrBcKt+jeMudtqSRClsZUy
         KdxfDru7NVVjvSM5FU02FBd5mAJYxrJbaegVe91jMmWlO0uUXiSUbqAqB4kEqYF6ps5p
         NQexzACUAidBiPYBMgjugTRAVHyvvZb+hoQAvD0djXtR3sPUgQQCNTgVywWSHC/IGpSb
         16dPM5abb3Z4y8jwF74wa7z69bqXqDTfmm2qwj4H0fBatdeIaxH0LglBT6qkidwoNIx3
         PmMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvlpSBcCkoG8zsH2ObThsVptGYGZ41jWPuBr3VU5z77a93sZFOQXG6h6AT+QJq/KLtd5Hn+5kn+cZnbA==@linaro.org
X-Gm-Message-State: AOJu0YyN365eNCbURGOROzLtSUCucJr+PdEXIAqMuo3KNAcBPskv9jNA
	Ty9DAJj914IPkBigLTL8miB81Hxa8Dfg9QmKoAcvaH6EOx3pbbXV/KAKAaKLvaLL0w==
X-Gm-Gg: ASbGncszmD3iLreHGAxoc4+ZDsfJqSRZwivjkv9xbwzuDxqJQvGg/nvBIseyH4LxQPO
	8s6Aqzi/xO27e/erKcSMTtCbufIgORga6y5UDEb2ob/n8NGp+r8XUTxGuOib2JD+kpOQngL9BFM
	hvExspIyM8Tas6ep0Vj2ZgbPI5zwGcxxTbXA5mWGZ7nGG4T5xV4ifwiIU5SRremsFCFyTq9Jew9
	xCaNVTHJkBR/q18M7HsfBDE3f5+q3hCGxi2sTwGGe0CMO2s98LjLFM5vRkrk2VxeVGYzPKP/0bp
	0CqTLqyOk4knMe0HQO9AT2vU+FyvNq8GpnASgFXK
X-Google-Smtp-Source: AGHT+IEBqSWAZSrJB6FCEJYBOGMoQn9NjDs/eddpBPADMLAHWe8pda3zWyhyviTYa40vpwkWQJSf5g==
X-Received: by 2002:a05:6a00:440e:b0:73d:fdd9:a55 with SMTP id d2e1a72fcca58-74057beac3fmr17689934b3a.8.1746409979095;
        Sun, 04 May 2025 18:52:59 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:58 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 33/48] target/arm/ptw: compile file once (system)
Date: Sun,  4 May 2025 18:52:08 -0700
Message-ID: <20250505015223.3895275-34-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: EdGK+YVmnrp2

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 6e0327b6f5b..151184da71c 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -17,7 +17,6 @@ arm_common_system_ss = ss.source_set()
 arm_system_ss.add(files(
   'arm-qmp-cmds.c',
   'machine.c',
-  'ptw.c',
 ))
 
 arm_user_ss = ss.source_set()
@@ -40,6 +39,7 @@ arm_common_system_ss.add(files(
   'cortex-regs.c',
   'debug_helper.c',
   'helper.c',
+  'ptw.c',
   'vfp_fpscr.c',
 ))
 
-- 
2.47.2
