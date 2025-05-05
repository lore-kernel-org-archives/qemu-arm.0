Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178799njj;
        Sun, 4 May 2025 18:52:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVj8hUbykNvuQ+z5zTQzO70KhuCRSYLQhyVfYX4NfMaXs2lbArbAhfGzt9fH7e8q6VmlMHKN8du3Xjwpw==@linaro.org
X-Received: by 2002:a05:6a21:670f:b0:1f5:70d8:6a98 with SMTP id adf61e73a8af0-20e035fae69mr12334745637.0.1746409965711;
        Sun, 04 May 2025 18:52:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409965; cv=none;
        d=google.com; s=arc-20240605;
        b=S/syVYmhukDX2XWPzFnVvPKJxFfkefooacuk1Ne6+JOWFTcYZ+fvkCJnrkVH5WbAZt
         TTNlWAPRAQqqafhhjgu3oCeTScmHKN+o3wrzs/1kpypflCpZkRqRLGYfSKT3PlTST4Pm
         V2DFdzqJlxBNZrjAQfGS0X1A2CjOPygkKs7u1iBii4fYR2a4z2yB9zdJuOAWVOKgwcPS
         1C1NcHWW3PwyLXoOmdemFaUqM3xA8vPSvNP0N5KEOU8eV3f7EpkNKytUZP0HsnAVdaEU
         HfmsJ72LmWR3nJj7wf1VYuL8sns84n6CMXaQZv+eh7INQx0eU5UZKSsq5td1RWBX1i7A
         2uSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fgL5ekQCPVNJfHfcPabdFrIvM+ux1exN882JD3eB0JI=;
        fh=/OhwPxbVBkPkbeQVTuOEBMdDotqMgVOr5l+Q2f+vZ4A=;
        b=c9CZuwZe9h8UYglgaYpV/aJv7/2/i02fEQZ3KvsEq0h0AxaurClZXnLQUoaloMGRoM
         y3osTdwHWp2eyFc5QSOgbtmu0tVZp2lzP+esb1ZnIUFsR5GZ+MZk7nsgqY2eSwnFezAg
         cKpU2zceOgfNXXIdAU8EnzwyzsTs/qIkspyfWJkLkhjwpEhZ3EE2w+j91PREgoD1srnO
         wvGtPURG3QrrYu/Zw8k44S6vX9tWQ6TVF3lIl+oE3/XXydBVgDELixrQgrNLsooJg18O
         d02W9gDb6hAtFxAgtk+dyjfeF+vt+zqr5EPSyoNZ6F5DeCcPPfCguISTrJPb1tLwvmFY
         RLFA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ezR1YiTC;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f9b325bsor6690445b3a.5.2025.05.04.18.52.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ezR1YiTC;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409965; x=1747014765; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgL5ekQCPVNJfHfcPabdFrIvM+ux1exN882JD3eB0JI=;
        b=ezR1YiTCywXtmaDnvhSYLZPcMy8yr12A93C4ciOKjEUV44ucu65cqkr98jEjvY26u6
         8MAep9CPglQ+STFv2BAnNi8up1AdNqFTgp+bmcFacjMKRp7j5qJU3WPsezuuZTO82us2
         IspBkTM/hiFe2kTjOXXeVqSOWGUseZUlKTPc8/c0/2GLRiZqDJobgMbzU4n0lXTLKih/
         24wKBPp8CUPnwVpsdW7Ied/Eb9j/QVZg8R4349k/u2uTW1JP7PIaworTljFvowbny4fk
         zrtxfBZ7plDmc50v5c3cFjnFXCinn3dmW5hMg+A8hY4+ucLfK9HWaCKzOGWIYo2qKXTZ
         M/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409965; x=1747014765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgL5ekQCPVNJfHfcPabdFrIvM+ux1exN882JD3eB0JI=;
        b=ZSe3PH7aUwj/6mKfS6ssbh6pgxsNFSNzVXXwp+0LaJiZI0h7CFS/E9D/9kWSHpAGOT
         q7HzmVDeLTAlTnUgj9/2tKxsFmh9EB21xZMbwk3IC9ixcxcO3mAbVbERydyU5dVR23Gn
         7kMf1inf43YXZPaZP9+qZRonu0Sx46fkcmQO8L+tNRfzTfGZhclg3pLU+j6SU1BYrOsC
         WX065fZXzRpHPULSmxhIM82aZvgWhI4pKlBr9S5wXikbsBFdQV4L254xmGJYZgycpfZo
         ajXYOq8+A5gTrl5D9cFCDjo2KzuNKszgdiq298gxTUMcd5/MgkjGeNn3g/+IVyHdaYyE
         vD3w==
X-Forwarded-Encrypted: i=1; AJvYcCWd7cXvg6A7NKXN7RY+FdnzkcGCI31bXkHEl/h97zLbHr9uB+y29RTIxQrzE3ZaPpl8+7wxqQoE2FAb4g==@linaro.org
X-Gm-Message-State: AOJu0Yyvsgiq4yA2we8PTmJ8t9I9DMfQRQgrhbi2LfsSkciNtEhcpEUn
	7Sf8SvSZuAl6mt4cxKaDl7g9opLxlUJsZ42dDV0E0MfKkybApJqni/FaUZk6XO2AeA==
X-Gm-Gg: ASbGncvJA4SNAUeKIvVCPUcQsFDdGTEKJlm1uD0JN3ZMbCkSrHLMPCXyNMRF6D2SU70
	Gwblwr4JBQCN32HH4TXHrLrhv+1TcsNIJP30Y8eYC0kzZnExx7yRapYWiRoly6YOpX1s5/6fO8B
	yv9/GTPVh4rLrPHhZpXtDKn2xLe8RTSIMcD9HTvPeW9F2jpe6K2HfmTVUYaQGRPnqCx24YKvBj9
	lL7kh1nr/S6zkYlgsuuzdgVeL8cHKoYJ0Qauo8dMjdIaTLvpzRcTRTxtHmUE7+W4Le2lbRPsKn2
	fmBvTFkEYCunvGDR7YlBq+TK+pGQsbD+stE70g1t
X-Google-Smtp-Source: AGHT+IEdEQhyDtvpOmBsbLxVZ35ACEJ8Qp3GYlqIZlG1XakJNo2D3KbXjIylsJzSXoYN2mahc1rK+Q==
X-Received: by 2002:a05:6a21:31c7:b0:1f5:889c:3cbd with SMTP id adf61e73a8af0-20e078fc982mr11730268637.35.1746409965255;
        Sun, 04 May 2025 18:52:45 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:44 -0700 (PDT)
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
Subject: [PATCH v5 19/48] target/arm/debug_helper: remove target_ulong
Date: Sun,  4 May 2025 18:51:54 -0700
Message-ID: <20250505015223.3895275-20-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2M5Cz+0ODnH+

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/debug_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 357bc2141ae..50ef5618f51 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -381,7 +381,7 @@ bool arm_debug_check_breakpoint(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-    target_ulong pc;
+    vaddr pc;
     int n;
 
     /*
-- 
2.47.2
