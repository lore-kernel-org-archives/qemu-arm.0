Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1665667njc;
        Tue, 10 Jun 2025 13:42:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVOA6ZL7PPZFIH/XSPbweqwIFY9P4HIpoXySoNMuI9uYSJWXfZxIMX06/OTBFkVzspcqDyHuTS/3ueK3Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHbzwH6MFHK0h8KLML6yE9hkPWrDhhciTQFu6ZEq5arQ05oLmUO6mDRDdZPIoDnwBYjHCs8
X-Received: by 2002:a05:6214:29e5:b0:6f2:d45c:4a35 with SMTP id 6a1803df08f44-6fb2c3727afmr15515426d6.37.1749588135124;
        Tue, 10 Jun 2025 13:42:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749588135; cv=none;
        d=google.com; s=arc-20240605;
        b=jMEQdHe4wK/3sssYrlHhPbxPt2DHX8QKRN87P3uFKM0+QM/n3z8+l26NonPRY2N1/7
         Xo72zN1m9NiJnohvTXQlEKJGLt4SXnq7Dmj3bt96LFY5ZW6C+7wU0Fxe0DSGVqTwT/9C
         dW6fyncoG1+1cQesxSWM81Au3qhF7XAalR6gPvwJfKhHRKZU4cu2aFDBU6YX5KbJ3ljK
         4LRVB+5lLBu1a6bG+PvnxmALRGYNLRWtaArgBm/X1yXWdNmNhnzoGTOqY1AbIEsTWzqY
         DswY2fU6EaQf3pr0Q5It254mbTlKnY4pWP7TRaba3TCIyDiXcINCFlJu4UnMCpDHIXYJ
         jFlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OzticwO9+M9wL8d/Bj6sgC4QFwbN6uIsBr7CDbvyKRw=;
        fh=Xkz72nKLaMm1TlNseB9mtxVyD1LUBsBNQAlY2KoOcVs=;
        b=a3o50n4OtnNqxBm4WnQNBLHGNvivMI2Fotqe+nmPQpeKJUPkKQkrtPxDhrIq1Xfh6A
         o3oqzlxQXYpVKkm7KWvx4p5TQ5ZnP3JbYbqrsKgnEl2scF+0yLxGkYIqDf2vPdyq0qNf
         YMnB4E8uofJ45KvSH3T7f0pfL1Zq6lIyalsELJgyynjaE5McBV0ry1k0vth/8vEIpst6
         i03laQVNQnImWoXTvOO+mOq24RjBXP2NNScAunLyQJnXEQ/dZjyXOVlgCXhIwrrxlrmF
         xsKwWc0GL5SqUFGLvzQT40SW2TxXfaKrdELpF9jJDSrjeON2jncSucrwNQwK+QI9MICl
         LyRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="HgXUKm/d";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb09b2fb22si107545616d6.397.2025.06.10.13.42.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Jun 2025 13:42:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="HgXUKm/d";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uP5n9-0006B0-UB; Tue, 10 Jun 2025 16:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1uP5n0-0005qs-0p; Tue, 10 Jun 2025 16:41:46 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1uP5mx-0003Ri-8B; Tue, 10 Jun 2025 16:41:45 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-607fbc13725so3498395a12.0; 
 Tue, 10 Jun 2025 13:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749588100; x=1750192900; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OzticwO9+M9wL8d/Bj6sgC4QFwbN6uIsBr7CDbvyKRw=;
 b=HgXUKm/dmpjxK3MQJwg2a/9d15MgLrHCqmkoSD/B/FqPgnn0pUu35fbcuz9gbdTzS6
 4ajEML2DJvsc2yfzL1AaRocmE95IeaxqxlTfH69T7hLtobj3oBDY1lHJeimfMYcM4Bzv
 A1rdvTvDvrAYlUkul+Y+h/NCLkMshzOKZGpfbmtazh/MEMuidRjw9YB4HSZ+sajAFKVq
 P5qsMwMrnUhpx/x54cYCo82NVy4n/DygrTo2uOZhW/0vuo6zPBd+4sDWQy47nB0i+ROW
 jN9195MRR3JQwIH54x5iHXxRgUqTzgJe6ywFmVB8X47hAaBr2+0FQ6vzLRBJ3qHiEiSZ
 yVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749588100; x=1750192900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OzticwO9+M9wL8d/Bj6sgC4QFwbN6uIsBr7CDbvyKRw=;
 b=YmHgaRmxVvqd+882P/aetmzSdvLubpuF1v4uQncNX6n3EcHBq/yvjeGUH8qZ4CTBlt
 eOwAUa4svH+imxdjlIw5JjGnBtSM+YZJ8RSILY9x9z9qsN3xHpR5U5sU5I764b/Qxz9v
 rQZIpMtfhF/1U9qsHqiCHFZ/XZ9rDpEvM8YgI6yzIlQgO0ekYQcbDOkJKmeej888dZAd
 FnJjcL0HFao3B9NP0v+6xm7C+3xRV8BsZAA8NxO8RiaL8chqw1A5ig69sMWvxPkHDKpH
 oohfuzr25qF+LBdBJxCIGlDEWQQFe8WLdV0PACVZU4GWnF7jKvK0zX29pFgxOHZeOgSu
 arkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLYpoTCiI/MNb3+kcxaJ2suucl64YsGh39NFFRGbm969jKXOQexrl7YNTzR+jhyVVnaFRLSZXwww==@nongnu.org
X-Gm-Message-State: AOJu0YzEvY1hr5kUmWwSiC4OBllxPPQWflne949Wk4RMFAsaVY299IS1
 26TAnRTzxWpTVcOHHB2VmaBegcXs3N/V9qOLR7uuFQLTouqHrz9MGFg/8vnT7w==
X-Gm-Gg: ASbGncu034uzm35PfB0RKJgISDHZ/YBqtUWMk5312/nK4PTgFQL+2ElgIBPthCtXY2Q
 uXRS6E4lUC3R/xQ9pJIWEGcQIIx4SUzNuBPsjEVfNEp2O3evpWZGD9B8sNYFNLP2lX/R8tQG50Q
 7hetMsbtoOC+FsIDI9nS1h8i6P0w8y+GUqiOASagGATatpx1l6o6MP2lWMVH5+BUXEL9C0+wP6C
 H8OQYsiBpBZqff4V6mY826uld4XT8DEypNyoyJWxqjjtY2Afanu/HMJ1ifbR7cLzswkDwC6SOgc
 KXtuP6hRh72sDJmte45+KNES3ZEAg2Hz+BsJujjDifwmRWh8uUwaNTTDwMxCMiuusNSyQowa6EC
 ORdXhYB20/gAmL4OImIfN65q3oUSqeOFMOxQ2PFFQjLPigSW8ZW548cVKIORVQbLxXA/bvSAPnC
 niS0/jaKzWyeUPLiXZ
X-Received: by 2002:a05:6402:34d3:b0:608:176f:9b5c with SMTP id
 4fb4d7f45d1cf-60846c0af2amr529823a12.20.1749588100371; 
 Tue, 10 Jun 2025 13:41:40 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-2a02-3100-2cbf-5d00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:2cbf:5d00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-607783de2bcsm6521847a12.68.2025.06.10.13.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 13:41:40 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 2/5] pc-bios/dtb/meson: Prefer target name to be outfile,
 not infile
Date: Tue, 10 Jun 2025 22:41:28 +0200
Message-ID: <20250610204131.2862-3-shentey@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610204131.2862-1-shentey@gmail.com>
References: <20250610204131.2862-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bRKt8rtFN1cJ

Makes this custom_target() usage consistent with other ones in QEMU.

Fixes: 6e0dc9d2a88a ("meson: compile bundled device trees")
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 pc-bios/dtb/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pc-bios/dtb/meson.build b/pc-bios/dtb/meson.build
index 7a71835bca..993032949f 100644
--- a/pc-bios/dtb/meson.build
+++ b/pc-bios/dtb/meson.build
@@ -9,7 +9,7 @@ dtc = find_program('dtc', required: false)
 if dtc.found()
   foreach out : dtbs
     f = fs.replace_suffix(out, '.dts')
-    custom_target(f,
+    custom_target(out,
         build_by_default: have_system,
         input: files(f),
         output: out,
-- 
2.49.0

