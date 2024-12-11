Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4417376njb;
        Wed, 11 Dec 2024 15:05:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXqbWgohGtsJ8s7QMq4hHFMbq/IW53s0FkkhpEBfHt5GG+E7w8DDcexg5xUG7kmJjZClPPth9vSVIjofw==@linaro.org
X-Google-Smtp-Source: AGHT+IGVuJoOg7G/iOu9rlVYClPzsUJ4WhixAfm7trE8TMfNirMlF6zf6sKZEw/hTF20eXLUgOo2
X-Received: by 2002:a05:6214:4008:b0:6d8:a9a6:83ef with SMTP id 6a1803df08f44-6dae3b8daf0mr19039906d6.20.1733958322184;
        Wed, 11 Dec 2024 15:05:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733958322; cv=none;
        d=google.com; s=arc-20240605;
        b=VStV+AUhQTa1Q1+nFGKaE9YxponBlcDoDywwkn180CBhrWfkJMF+pNbU2gZDmNryVy
         xJRM9mnw0S5yY6pkF83vKC7JTAwvInr6YOXlKO6buX8d0AsFQasW3V8nDa7rP7vJtwQ3
         TsabYQ1BSGP+PbA3aIA6mviVf1Kde11u3rIs4XsGaROmSLxtqE/C2AOSALxH8v++pvmK
         slsTJVASfxi03dFfYg9qVBkyfwQ8rwiIgnMOAgVLC3StPOUvJP3aaNCntc7asCjRgEQq
         nqdlDWLwu66/f+B3WAHeOsQ6l6q2Vq9spbwhvnsPRlIStEHZCRrHMwBpkhpPJ8z7RAy1
         7wYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=J+4/L4+9GPQca3Ynp9H2GzuGT1XQzOn/jP/hpV92NZU=;
        fh=cgIb/hU58hDawgnh7iFJx3r25Lq3FOfhFPBQD+ws8NA=;
        b=QJNhVZmj6JTQagLjqZbX0kLAJl1vHxBGjYZdcpkrN9OB7rdFARgNdWwlg26RI4Hecy
         pRXb0OzGlIRYRXc5jgknOaVZIctnnP/PWNX9M+rwYeWc06FrS5tS5mUUmEHxB9edQCra
         9pYiAc5/kg/oBgLEmosWneklJGMI+rG6fUedE2wI5eTBuA83gxCduxRsOMmOXSmZBjmY
         CDtd2NqQgJWwWiIqMe74k7CO7VoNqH9QT4+V5lMVT7l/K+LaLbJQbdSWAn1pyG9WUB52
         h5W9oHudvCTNyExS4ZovQmw8B1/x81qOkDTjrbE72SaL6A2Z6mreO+ZXnyfN5tUTGH/u
         DKkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fKgJrvMZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d910a403c3si106555596d6.306.2024.12.11.15.05.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 15:05:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fKgJrvMZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLVkx-00038X-6N; Wed, 11 Dec 2024 18:04:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tLVkw-00036N-8K
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 18:04:34 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tLVku-000269-AR
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 18:04:33 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3862d6d5765so3331994f8f.3
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 15:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733958271; x=1734563071; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J+4/L4+9GPQca3Ynp9H2GzuGT1XQzOn/jP/hpV92NZU=;
 b=fKgJrvMZpvXa1FAvrauWPhM35j3CnjBlytfeLBMADbmhyWdAJIARj1IG27+Y/ZA4uW
 sfz/D3i6vB+znRddS7qVBOlIqhlQGIHeGQ5olL3U8EWn3sX3yMWdPaPbN0Q+YJsZ5bMY
 5zDFyRjmYn4RtqvoAFgFj2Duj1Mg60n/I/znmuNGoyx1hiaxTxGmMLC2Da1n4XFVDyfC
 Qpx9FsK44Qczmm2Q04GxrM7LjPXP/I7jLSnpnVprl9mgmjsbCL7yibr55ZgaMcQabI6b
 3sUJjrHraOdla7jK/LHjtdHsWkLuel19hD4wBLV39Uk5l6G0+9l6gOPDxZuQUlEvJjJA
 +pJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733958271; x=1734563071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J+4/L4+9GPQca3Ynp9H2GzuGT1XQzOn/jP/hpV92NZU=;
 b=Vqodh/v5rMpv9EPNFzcrKlB1NU2g+Oifq/JQRvAsOmJTGWM1QNh9GlsdWXIA+pNdtE
 SYwPWznZSB0Sup/7Xmf3TSUVUdjH0ithrRpDavBSTSYodQ9LICPC35FocXYTWiXNnNsO
 77d5TvCrQ0YDgS2hfeA2mirwRJyyBEhDKYZ2ViaNIXIQaDaW3b3frxzbUP5U/LUQzMu/
 rp4rxVAf2DUk+sGAxG1tlhVh5nBCOmxMx6iOdDTOkEhovvcbUUur/HKIPiWAc2fAaFxW
 VeZkUQuGJPTJtFj2FIsQ47sSj2QFiSmvaqEK19nReym1qfUdjcTUH2agxxpfx6dxXAjS
 IebA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYb9jzULe27wsWUZ+03sCD1CRK/g0V8EJEpe7th2wFwMEVZlim1fP6vaPfwVZcZipbBjNrUWg+tg==@nongnu.org
X-Gm-Message-State: AOJu0Yw6rz6SlhR91QEPSoGmuBb+jqOV+Fkm25N0GMvM2YNmtKaRW6a9
 f2gyaWkyTG86L6ni3AwGyb/asY10FqmbjRLkF17DNGFPA6/9IelPeihKwl6c0w8=
X-Gm-Gg: ASbGncvWWAyh8M571URZ07cOB/x3Z4Yfsjhlb7rOm7jH8h8Jusc27D8w0AnQVinl0gK
 RQqvr4ydQ/ihtsDbTqudcMKTx5Gg9q3XneLsM9LEDj0qPnQaDRUjQhU3BqW4CZOuw+U917sFNAg
 FIQFwECcvBT1DSGNUarAD7a0OzuA/zSptw667p2VvJJNShFupkFi98nwDN55qaQn0C7Lp7HbSa5
 WECi+R0W5j5f6ywvJMp2/hq2Lgjg2HQLQGLbSukokbb5W05fGODin1BCZ6zPzW/ACwyMv7rNJvz
 ejIi+pRnIwpYr7p0EoGsJjfNs3sUQfODHg==
X-Received: by 2002:a05:6000:2ab:b0:382:450c:2607 with SMTP id
 ffacd0b85a97d-3864ce495a8mr3829234f8f.4.1733958270738; 
 Wed, 11 Dec 2024 15:04:30 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38782514db8sm2347116f8f.84.2024.12.11.15.04.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Dec 2024 15:04:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 6/9] hw/mips: Include missing 'exec/tswap.h' header
Date: Thu, 12 Dec 2024 00:03:54 +0100
Message-ID: <20241211230357.97036-7-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241211230357.97036-1-philmd@linaro.org>
References: <20241211230357.97036-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: TDhEt3aS9gB6

Some files indirectly get "exec/tswap.h" declarations via
"exec/cpu-all.h". Include it directly to be able to remove
the former from the latter, otherwise we get:

  hw/mips/malta.c:674:22: error: call to undeclared function 'tswap32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    674 |                      tswap32((1 << 31) /* ConfigEn */
        |                      ^
  hw/mips/fuloong2e.c:89:23: error: call to undeclared function 'tswap32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     89 |     prom_buf[index] = tswap32(ENVP_VADDR + table_addr);
        |                       ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/fuloong2e.c | 1 +
 hw/mips/malta.c     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 7fd8296ccb6..904c10b90e3 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -40,6 +40,7 @@
 #include "sysemu/reset.h"
 #include "sysemu/sysemu.h"
 #include "qemu/error-report.h"
+#include "exec/tswap.h"
 
 #define ENVP_PADDR              0x2000
 #define ENVP_VADDR              cpu_mips_phys_to_kseg0(NULL, ENVP_PADDR)
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 198da5ba3d4..834636dae59 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -28,6 +28,7 @@
 #include "qemu/datadir.h"
 #include "qemu/cutils.h"
 #include "qemu/guest-random.h"
+#include "exec/tswap.h"
 #include "hw/clock.h"
 #include "hw/southbridge/piix.h"
 #include "hw/isa/superio.h"
-- 
2.45.2

