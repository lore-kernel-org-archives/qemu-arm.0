Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2694587njb;
        Mon, 17 Mar 2025 21:51:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXMT2DxjP3PSecQe0W63EDsf9i/bp7E886CyPWDwmWaKZGAsxEagC+RPJYMITDHtBaDRvWkrq1YoDjhIQ==@linaro.org
X-Received: by 2002:a05:6a00:10ce:b0:734:ded8:77aa with SMTP id d2e1a72fcca58-737577c6e8fmr2778739b3a.9.1742273496358;
        Mon, 17 Mar 2025 21:51:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742273496; cv=none;
        d=google.com; s=arc-20240605;
        b=c8xcMoGNzxRXFd+YFrC5Vjt8QJyKYOF1o+MFIcWybChZRDxWs1sF0QZ68zFaLBZVk9
         Xm5zitCNKXd/+roWp3rjyF3Pv0T/5IYu90/gbTRHXIrdYyT7KLoZ34IgtgSq0Q25OMN8
         MPdJzf/vwiPZxVfT3Y26P0SBuiuLE7Jtvt5m1p0uUUZSndlZk+WKL4WJ7h5hgzb+2Vm3
         ARO3nDTwQZcbqFQolVIg/aB3j0dIeJL6iO1PL4TFTG/9GML8z6SNz4naj+2iDizCkcjn
         NgnShleFh0ZWV+VHFN9BcKDeakcu8nk0GLqXWYw2CFK0YkR7+TI7MH/Uxa6gw6JZbtX9
         TZBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7b7Pa/XivG7M4hjK9jqso2S4d+dz1DGry6GtvIR3C8c=;
        fh=fX6tbuDD/SDsIOwOiibbeXPTQPQ2IKYYqIoT9UI1XbM=;
        b=LneSHkk4twfAYauY364R1BKSG27ccEXvMsaQRatm0DTk0hz05tvTDhZ5pl1brbpnyC
         6XI3n76LPiFsJStQ2mXIbMdigjwaVbPp+9EElTE/++TSww4ATgXS77HN7Tw+QM3i4fB5
         m8uFgwMQiAIt8j/khn9bgQOnbzhTNzPrSc50DDP3K10mwuCDbNPhrjYH6b1OT+B2NFwE
         ldqDcfhir9tJLfF53dMv6m8mgZ6mdcVrmgASJA4dyP+GpVXgQ2SIBB8hnKIxvL9Ym7Py
         LZRSjvWe0xVv8p/AMDBFDPq+Gu6rp7hEb7BZ3DecO2ny2NgyoWgFbLOf+0ocyBsIRkhE
         x6Kw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BWjrrCia;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-737113cc572sor5428385b3a.0.2025.03.17.21.51.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Mar 2025 21:51:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BWjrrCia;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742273496; x=1742878296; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7b7Pa/XivG7M4hjK9jqso2S4d+dz1DGry6GtvIR3C8c=;
        b=BWjrrCiaWuV1mhy0y+LM47yNARnEw5k+I5YD9aLWrXa4dD6CTwN2+7IuyC474E46/a
         mBf0bB60XVQnXvtySi0FpTxerH2l9mugldLsZiDaqrpeTXUv68OLq+Txkxzx1qeoAW+H
         +ZJSia4rsoN3sM2VVklTk/PSkjEcRee1zx5KfJm6ktyRnE675IMJ33VaIrCTWsr62CrZ
         bW9MggGWgzyPzhpOfm3YiAdE4it5NRGA+gIgMC47KwzKqNRK4Fl/r82Rxm/1v6xdEFv1
         J9HTVIs47l4Ch9DVSqBpwNk49/ZyvFSBY1v5X1e7w7p/fmY+qYTDnYJhrdx3z0HJBjpI
         6/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742273496; x=1742878296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7b7Pa/XivG7M4hjK9jqso2S4d+dz1DGry6GtvIR3C8c=;
        b=UKB9nWZRunzMszwXPBZygtFRn1TuRwpLTZf+NbHYQGmMp+t4M4+N+Dk+l5cnVHN6/t
         vYE+kwufS6bq3VQQvCYl/+L3cvslQXUKBfJNsusO3wZ7kmj+1MpkAWbSXJ3DyQRva1sM
         pC8ACgNexsFG/rMtDdxuLVd8+1aMQJzMh58GeDD2JFyEhE8ll9A2/MMTr3gDHjntddF1
         gr7evv9/QJuolorFppmxVQVPgLqvF2tfi4RfgsMd8bX/dRSlavC32WlVr3gOTZwIM6mT
         ErXd0aXKKhH2W/ij4yUcLX2HCPgxS4fJZ6aALvuOUBDEL2Fgv7dCCjH9o6Q5gC+lQHuX
         nurw==
X-Forwarded-Encrypted: i=1; AJvYcCUvZdfkgJN2Lm5rxzUd9Fwgk7JHyZcT06iyFcQ/FZehZqjA31VvNs2cWomT3gDxqZsKCexFCHGXI87/mg==@linaro.org
X-Gm-Message-State: AOJu0Yy4Hy7GkeHPbUGofDEu+ykNYGszhMYDBH+wogoVdpazrALMGYeR
	ejuAJWTMfRlDkVhBiQvHtrfG9/LFS5u7dzpekr+wjciD4+MUFbXJ/+hzHpYAJo6/zlEyioO5LpX
	SFCo=
X-Gm-Gg: ASbGncsRIlg3bSeYrxAkejRHlM8KlSNVlsceWQLvw7w7PUWXZIquAjc/tPsu7cAUcRO
	Xqsunr5Oitft0ZPnEGlYgCjjP94Wi4ek0NHsGxG9+yyTbW3hjLtV9DuuMNHeB/ti0Ddprkoyhg8
	chE+GMkRrJfmkoaLK7oQ73yy4J9SrJglaSH2IQjJWnWNrQS9jNEf13pGItLy8+N3ZATdnlq7CS1
	i6Is84TiP/af5Mcx4EoBAR+rbC6FcTCTKIfyfRRtT5ASNxoqSNm6nxe8zsneO2Kg0gM8mPuAhZp
	LjZZw7cOBntwzT1q4fY+WNHFaSlvZ9TNVCBQ9zqSB+ON
X-Google-Smtp-Source: AGHT+IGfy+Qdd4zIdkaKpSIgsiwDKH+mdyBXjzWe2NY8Kt3gZWsIWhQbMwLpqie8RWdAjPyywqbjZw==
X-Received: by 2002:a05:6a21:1f8d:b0:1ee:b5f4:b1d7 with SMTP id adf61e73a8af0-1fa4f9540cbmr3123721637.7.1742273495989;
        Mon, 17 Mar 2025 21:51:35 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711694b2csm8519195b3a.129.2025.03.17.21.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:51:35 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 03/13] exec/target_page: runtime defintion for TARGET_PAGE_BITS_MIN
Date: Mon, 17 Mar 2025 21:51:15 -0700
Message-Id: <20250318045125.759259-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: DXuGBg2abZi2

We introduce later a mechanism to skip cpu definitions inclusion, so we
can detect it here, and call the correct runtime function instead.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/target_page.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/exec/target_page.h b/include/exec/target_page.h
index 8e89e5cbe6f..aeddb25c743 100644
--- a/include/exec/target_page.h
+++ b/include/exec/target_page.h
@@ -40,6 +40,9 @@ extern const TargetPageBits target_page;
 #  define TARGET_PAGE_MASK   ((TARGET_PAGE_TYPE)target_page.mask)
 # endif
 # define TARGET_PAGE_SIZE    (-(int)TARGET_PAGE_MASK)
+# ifndef TARGET_PAGE_BITS_MIN
+#  define TARGET_PAGE_BITS_MIN qemu_target_page_bits_min()
+# endif
 #else
 # define TARGET_PAGE_BITS_MIN TARGET_PAGE_BITS
 # define TARGET_PAGE_SIZE    (1 << TARGET_PAGE_BITS)
-- 
2.39.5
