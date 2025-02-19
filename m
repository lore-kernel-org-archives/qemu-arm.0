Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1627765njb;
        Wed, 19 Feb 2025 13:08:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVlC++HswqK74OBp4+QhCx+O3HYDKKT1M5uCTp1zTmctO3fTBO62hxbTnaYiH1YDlX+jWzK/FFOPJPy5A==@linaro.org
X-Received: by 2002:a5d:584e:0:b0:38d:cdac:fc02 with SMTP id ffacd0b85a97d-38f33f117bbmr12277819f8f.4.1739999330010;
        Wed, 19 Feb 2025 13:08:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739999330; cv=none;
        d=google.com; s=arc-20240605;
        b=dwl70z+i7ta0wzxP9wjP3A3i7nPLq12xXADVcK3vDzcEoYtnZPaOuzhylkcaohVQUR
         dOyChbIIStpCfbrlHn68Hx8fCj9xUs5rHIx5YU8mXBLs4S9NEj6mIDs8lO7N6f7ZHOS3
         Ea6s5OXsV6E08gq39g/LiJoivL5lggVbTWURojdzcEGkJZp26pd0QjUGYZPZbZ7WcpiH
         GzUb0VLMEWpwHCVjqrNMShBHot/iMrFTxyrmt1V/ytAypGqBh2QyWIXHZ+I394t9S8lo
         HctrAuzvfFKG/RYGDeUdp1WpQU/yRHSeCgf7aWJFNWSNsppOatkWeHXNjU8AjXdtA8j5
         gaDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=pnDfQ0pDNHjagyoidO1nQy0wbrzE23spPhP9nSEJCp0=;
        fh=NBDBmNsLKNG3mx2MNvGHjOIASmzqnWaLI+PZClvzdO8=;
        b=LwbRyYsTbGe7kDeHV1kEj5oXUNIAxIracKuz/Vh7GlShqGogaI6iNcoSTJy2a8kqj2
         sr24yuSH5QQxAsKJizaeZZUXVYs5EPNKZC57qdHAdAU+/P6bRV5GkTkjhFQmpF5sfnSs
         EhZV/xKensmBbKim2FYAyI5cvBe7b2be8r2c9rHcRMnOXdBJ9zdVjwC1hCqRqLxCrCk/
         qmA6BE0S7tG1D+Grw9a6WKyje4F6erUK82LQA2R8uGhpCMMCE6Edx19LD2gaWh0Awyl5
         gZWKpR6fCwNHz5+t8qfpsEx340ZS/bbe57LBRqGJMc4mmaEtTycKYzPkImfLOBrCNq6k
         iwjw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VPgHqm67;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4399ac0e09csor9132225e9.3.2025.02.19.13.08.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Feb 2025 13:08:49 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VPgHqm67;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739999329; x=1740604129; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnDfQ0pDNHjagyoidO1nQy0wbrzE23spPhP9nSEJCp0=;
        b=VPgHqm67XVAdO507SIUax4Iib9FNqMImXrbYWp3/+C8m8jx8KERyDA/3p8hVsFPgUS
         H+ZS1rmnbyJrxPynUdZGhxRxBtulrF240z3pIwJmDURKp6iZCerA9Ujw8Inv8zeTfvtX
         mnGkcfxXA+ftWK8XMWSRc/tesBKopMG+Ak8SluNpc4085M1O1T+kiXD9LXJ3fCxELAIj
         KpTwHB/AAyAUvRSlAApZx4TFYibgpPkspvvwf9TPZAMen1tvRp7eKOq7EMJCnyV4FFZ5
         7dLgqViaXKHF5e5PIk42kmPAl/u0SwKxkkNA47+yow7oXGyNZWL4G8XCa5QFLNUS/MNS
         3N5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739999329; x=1740604129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnDfQ0pDNHjagyoidO1nQy0wbrzE23spPhP9nSEJCp0=;
        b=vYHS29rzaH3NdPu+GXxAC9iV/cx4sf3Rsmsu5khH9uGCVmwvf3r70O1cFnL9dn/jeH
         ywuSYDLrVq+td/9YnNoRT9XY9ssU8aBnFAVbl0n1faZNtbGELBH4ZY3WM41C9ESrpeTX
         XKkQbxAmCbEscL+azr6KioBWbOC3wYmV/QUpnSj1Ox9NYnHtMLj3sYxghirijKLfB+r2
         2huA9xYuTu5OacXMaowEEXaP2mOcGnTshGF6iNGCQaYeBCIwqgHB7FHCxABKePsVy29/
         EOdmwuyJdpFlOk2EQ6TKE8maDKjxnnnqx91SoDf4NMrcDXzH/qbu7r4/plDAuU/cZgTW
         gi/A==
X-Forwarded-Encrypted: i=1; AJvYcCVFn9RZpIPK/NBFaf+ZQRhK6iljL8mKsfgBWzOBrMEyfuE+8BURasOx6SIAI+4thZKEwTlOfhal+M0Kwg==@linaro.org
X-Gm-Message-State: AOJu0YwB4FnfifWgcm6roIibypvxHH4H/c4vEd7eqEeI6SuJ1+KJztaj
	HOQ9xeqn3Dd8PAJ/lOvjvRCwgHFFS0M36yds3tQ02aBCvov8BGc9HR21DiJvCtbN/g==
X-Gm-Gg: ASbGnctHC+InB2sEQi6Gr8lEDP2hayMKvh0xXkM3z+LsI5RFD7XsS9tRZ7obwF0iEVm
	8xi8jZz9e/LOB30bfHIA+puKjIxhPV/L6JYdyeqf96r6tQxu2j2APXTTZIgpaofcTu2XN2n6vzA
	xtdvEkDyDsHFh2TIqMnGXULBYvnagYY+WkRAO4avWZxXio2wVYhe5xqIIQwxXSlIhfgin7mvzxc
	1xjrbKtMypmFiz0Jjt4MMTFKKPtpe4VELpvL6qPWf2w3P+TT/jenhjW7IOkyDL1MvUGgucXJT6m
	54uz24msKvTql6ATdynZ7OxczPx4BJcusS28+bqLyaEnqoxaxH6oTt84KlwUh2g4TQ==
X-Google-Smtp-Source: AGHT+IFkA47+n1j1DG2COTtp0KDSYC++hjSRKaos4pqLnwlps7JbruZUJquCqI0DxmNT/FpiZUB9lQ==
X-Received: by 2002:a05:600c:1ca8:b0:439:8a44:1e65 with SMTP id 5b1f17b1804b1-4398a441f98mr114220365e9.7.1739999329390;
        Wed, 19 Feb 2025 13:08:49 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4399b430912sm30933125e9.0.2025.02.19.13.08.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 19 Feb 2025 13:08:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	Rayhan Faizel <rayhan.faizel@gmail.com>,
	Luc Michel <luc.michel@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <huth@tuxfamily.org>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 1/9] hw/char/pl011: Warn when using disabled receiver
Date: Wed, 19 Feb 2025 22:08:33 +0100
Message-ID: <20250219210841.94797-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250219210841.94797-1-philmd@linaro.org>
References: <20250219210841.94797-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: NpFnPlXEVQVM

We shouldn't receive characters when the full UART or its
receiver is disabled. However we don't want to break the
possibly incomplete "my first bare metal assembly program"s,
so we choose to simply display a warning when this occurs.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 06ce851044d..60cea1d9a16 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -85,6 +85,7 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr)
 #define CR_OUT1     (1 << 12)
 #define CR_RTS      (1 << 11)
 #define CR_DTR      (1 << 10)
+#define CR_RXE      (1 << 9)
 #define CR_TXE      (1 << 8)
 #define CR_LBE      (1 << 7)
 #define CR_UARTEN   (1 << 0)
@@ -487,6 +488,12 @@ static int pl011_can_receive(void *opaque)
     PL011State *s = (PL011State *)opaque;
     int r;
 
+    if (!(s->cr & CR_UARTEN)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "PL011 reading data on disabled UART\n");
+    }
+    if (!(s->cr & CR_RXE)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "PL011 reading data on disabled TX UART\n");
+    }
     r = s->read_count < pl011_get_fifo_depth(s);
     trace_pl011_can_receive(s->lcr, s->read_count, r);
     return r;
-- 
2.47.1
