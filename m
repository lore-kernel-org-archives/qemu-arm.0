Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756177njj;
        Sat, 3 May 2025 22:29:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU6C+re2djnFoIw+2GpEoyeZAFvdtCJWB7thZi4nMmAEtuCmmA4S8ETceaPWHQL0FSKB8zLtLM5PtpexQ==@linaro.org
X-Received: by 2002:a05:6a00:4c0e:b0:739:50c0:b3fe with SMTP id d2e1a72fcca58-7406f0b0434mr5126455b3a.8.1746336582475;
        Sat, 03 May 2025 22:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336582; cv=none;
        d=google.com; s=arc-20240605;
        b=DoF54dHuib4c6DT1yVp7UtswOXp+W2TCEGFS7Nlq/4hWkTiaHonv1ewSD2AJhWt+84
         GqqUWaLIV8qDVofvAHlVGVdxlPiffl70wKfkWdHNcKdgW7lYI9NAU352+wxeRKZRIkDX
         D/2F7DH5vG+9s4lNkMfTxdLp0uTjRMa4Hezz0etMFVl4c0TikNrsKfuwRcB6lxGoTocN
         Xmit0DnRk9DPFck3qKQYRcL1UFSU7SS/MPgxmWUFxFDPd8EZ7ThD5frgHBGXBL7wVlXc
         7JOiwAHk/sxes3Xq8SvWriec+wiXoQ/gy3lgiOTbmO4EUXaFvVc8naqYjoHYuT5aOla+
         H90A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4DYtSZEbP1atLGb677pRK4UuiMz1CYlbqC5aWBJkLTc=;
        fh=YNT/43kgDFeELiNpAVu8ivXcbXntqtfBB57QTqc5Bhc=;
        b=DasKEIhXwwnIaY/qpaRicDuCLsg+7D5V2dooVcT7aWUnwowKgMa7iZMY2/Qc5dIAT0
         OBofLdOHQadXowEaMRV7APf5EqkfkW5Wpby1qsf//ujQq+fSMgFBsJTBhz3hL0P4u6AA
         FLja/eme4iNvDnlQA40IS+rhpjlEjPRlRQzG0XcQBPBm9LvJP5/iCEWpfPLAXgrDAHpN
         oTkBfH0U6JvginbFjZZlHEsQ0WA3L5JHIdWBqKFjNs3pUP9rcsAv5IgxT6lFxsAsqpyX
         Kk4Jl6J5wDJDLkaCCx1MDEytrsH3lsjJ3OZqZ3onuIFJSHY9oi5wBjCR4pxXmMc+woRu
         URCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JgIKicve;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404ef0e311sor3556832b3a.3.2025.05.03.22.29.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JgIKicve;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336582; x=1746941382; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DYtSZEbP1atLGb677pRK4UuiMz1CYlbqC5aWBJkLTc=;
        b=JgIKicveiQo6sb/uoOAtHC5nErbf0MhJvcqA3n2hdJIdoutQFtC8sg+4byugrPK0hM
         I/xxt+EAL4njTScSF2x//3NEAL+s+D5bY80+chz2EOWBuNTlCDk3bMXJ6S6gh6iR5Vgy
         wcZPLBkstwWHqf4Ipr6qEG3/Uf8zbT8bTyXvXQWCihwFmamVk27KpIG16OdPab+iJAfY
         nL0Zw6toAS6ExiGoNS+ZvaVZLt7FFnXjdGYB6G6OfI//FTJ5BbXKzWs6UkLOaNx5NB1D
         5AZrn31BOT7fH+17GSsi33uJTL9YDKavO+2wUMCzsruPD0M6usOsIsVQSt5k2e5uKmdd
         Wskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336582; x=1746941382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4DYtSZEbP1atLGb677pRK4UuiMz1CYlbqC5aWBJkLTc=;
        b=TxpDqhU+2CgrmcK1U/f1DvwgVGDhymKTEoqg5DnaA0zebHxPnqMMq7Ba7iAxhXvXwH
         +z6KopDNCNxIAGqBs9I2ss5Z38y4KTmJejN2iA6RzdzNVBNb8ryT3/OVmMmOI8TLHrMN
         VJ6/CwM47bYcLTfnZmygQDtVOXC2H0EQb2HnHeDXzcCt/ay9Q4+T6Xv93VwH5IVWIG2J
         SSHNd0rWnmWxVBYfS4HRROYfYlVz9YPUDaW1O4ueHwLKyjrU31nXpP0UYGRdOKHXLMis
         SITmWVNzqX0mJfUPlHqIfhzZixX5x2/VgprMnHjVhUVrnggfnrAIR+7OEZsn2HjiWFqJ
         zjvg==
X-Forwarded-Encrypted: i=1; AJvYcCUItnVTGSSciIr+cTHT8ED4bqBA0iGs7JS1pWKdNnBsRxgMoUyR4ZqpHFblxI5u1n1uao07YjcQEPMcgQ==@linaro.org
X-Gm-Message-State: AOJu0YwLgbqpa1so2QbJIhcQeCnLZyYm20q3Q5s0ruV6MmCts5EoV0kj
	aypOYIOxSZoIEC0bLlf2iFU26QuuUl6ZEoPggB6VUGVd4TCcZWS/Arin5OyBPOoCeA==
X-Gm-Gg: ASbGncvqdtxn3YZXsA6EZ/atPLZJfZsumjEgxMqJVfsbxP9HVznj4nqieGWybZkfJfB
	ZuNb5uvzM/DHR/NxAoWASJCKW6mMvLb0eyXi4Ks7tKFZ8H2AcXIYXT0bCQ40x0sTjIt2kJeb0y2
	EXPW8feqJ5Q6RazrPTRuZFl4rCKMLa2TAamYrOAayCyShNXSba4GX16hrfgyGzdmuX9XGk5PNNz
	j240fNFjgb2yKnV4479nAbz/qVI9pgcnVEJ3lOjQFfbPe66i5d0Z5UzEJDbh+2PxYNuhS7IkIdQ
	dnJYt44MbGHAeUhwqD6aMql5Z3/Xde6d0PRpZ7zh
X-Google-Smtp-Source: AGHT+IF0vgFiMAHdZTdTEbIL7XDeL5ZCJrzUL1LmXrsR2TgO/FrRqNsHWu2PRmIMZQhJT89uq6uwwA==
X-Received: by 2002:aa7:9316:0:b0:736:339b:8296 with SMTP id d2e1a72fcca58-7406f17a52cmr4455342b3a.18.1746336582061;
        Sat, 03 May 2025 22:29:42 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:41 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	kvm@vger.kernel.org,
	richard.henderson@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 25/40] target/arm/helper: compile file twice (user, system)
Date: Sat,  3 May 2025 22:28:59 -0700
Message-ID: <20250504052914.3525365-26-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ArclVb2DV3ei

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 48a6bf59353..c8c80c3f969 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -2,7 +2,6 @@ arm_ss = ss.source_set()
 arm_common_ss = ss.source_set()
 arm_ss.add(files(
   'gdbstub.c',
-  'helper.c',
   'vfp_fpscr.c',
 ))
 arm_ss.add(zlib)
@@ -32,6 +31,7 @@ arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files(
 ))
 arm_user_ss.add(files(
   'debug_helper.c',
+  'helper.c',
 ))
 
 arm_common_system_ss.add(files('cpu.c'), capstone)
@@ -39,6 +39,7 @@ arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
 arm_common_system_ss.add(files(
   'debug_helper.c',
+  'helper.c',
 ))
 
 subdir('hvf')
-- 
2.47.2
