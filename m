Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2515610F9972
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 19:30:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAYWA-0006Kv-4R; Wed, 08 Apr 2026 15:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wAY6t-0007Hb-KT
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 14:58:43 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wAHnG-0006TT-9W
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 21:33:24 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2b256a4c6b5so33862735ad.0
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 18:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775611996; x=1776216796; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2PmDTemLx9BZhTY1nlMucO+h0NhE/77kvX20kSZB270=;
 b=OqrZG3ZKjpgYzwmaLJYF8rs17pPSqqswKTi1JI1up/9ijIDbhJn9G7ZxHRNPU9oXOV
 sQkIj5gfyHyxUJkAR6IjgVOWPicuiiZ9c1oNbMjcjfDBuL/+3D5kEnh3tHKEOSe3a9tt
 aBBYsqcZ3d6ZEJLTpR4awwiBNNSqTxM3o1ak7XmUq0Kh59EkHAT45F/8hIV/IUzJ08DZ
 Cd58p+390DGvNlfSV2znrWVTjxU5FFdIqygMhtdMV+OlYBn1z0DyjLaq0dDwtMInEFUD
 SB9ISNWTJWGNqPbVdO1/P/ZLOFNAHbDpgJUaq7sgtGb91ns+Sppsa5n0oGg0ScKcEt6q
 QkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775611996; x=1776216796;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2PmDTemLx9BZhTY1nlMucO+h0NhE/77kvX20kSZB270=;
 b=Q8GgpmMiG1RHykwgEZOyUfRWsK2MAHrmrUWaWeRAY4I0ibzeYe88ichetDlpTYEjvE
 oJP1023JQi2r505ro7dbQ5cfTKSSzFX1BD0gixEhxPDuj+to10WE6Xc/U1njd++y9aIy
 ttPDDhAoqqf6NmXzSbX02VgXjNbLrDY/5fNPfgKDoqgDWdGF9lL0agNvUyIEN5IEdVys
 sw5FFlcTs8USnIRxgdDeW7r38HoH8VAquPn0bf5iXSkdwKKOv0vAhGO1V3es+yyunKh8
 0UCzshPLbRMqeHeFu7fiNm551NaEfQcyjlCpmOJVN1/TsNgtCM6qr1mXzbTNnZB26/q8
 q/3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTsCBvSPB+R1dZOZAzHoqIMN6rz9ymnlqGfXblBjQUyaap8wHBLfvanJy3Ap1D9rd9oYZ6+awhEQ==@nongnu.org
X-Gm-Message-State: AOJu0YxgtsR5AjbiRJNgtJvpTkruVjC2Bp4zOl3+tAwSFOE3TTvHYIlh
 huvx/bRSAwstp7ZgygAXEN50BhtCqbUgnBY4JL4mW7yS+9xpG8+6CO4Ckj48rQqc/mQ=
X-Gm-Gg: AeBDieudBVEjepIWg0Lv5ioKI9g7ax8UN8WOuyE8AhuTLFNBD2UHZXF3G4QVGHiyotS
 8cqJKcG0QOl9+HYX6YibIq4ts6YNJjCn+Q/MSyZ1IhymVq7l1xMA7N04CwAjsFi86iZ43ozGuBe
 AAACNJCyBbdonjyD5Ap8W0eFFv8KD58bJuViBlgZ2RSLmYBpN/6gSCkMZU4O3PN6ZOsfu8EfS/e
 zSNOiR7Q8QTeUjYn22IfvAT0ThK45tmCkD9d+ECKu8AR78HWSelVpnYsJipa/+O58WoxQilICsi
 hy/slg2Ey3U35fMR729syYS8b13taT+jCmvGWOEYkgVb+zetzsEyd0nxeD7n0aMYebWxkm5M4vw
 tTRKxUDqqAOXSbaCFs+Y0k8Z/rx6scqqNI/Mii02yIAsVzLE98UPjTsCQqwW1ZcdQShc/DHf+Re
 Y5jeN56eur98HOBaXNTf6LpMbtJwECSzI/rTjWdMBY4kNZ7DpYXl34OG6u
X-Received: by 2002:a17:903:2ed0:b0:2b2:5091:1c26 with SMTP id
 d9443c01a7336-2b2816d8626mr213112325ad.22.1775611996003; 
 Tue, 07 Apr 2026 18:33:16 -0700 (PDT)
Received: from stoup.. (124-150-69-109.tpgi.com.au. [124.150.69.109])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2745c480dsm238277395ad.0.2026.04.07.18.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 18:33:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pierrick.bouvier@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH 0/2] target/arm: Remove bswap_code
Date: Wed,  8 Apr 2026 11:33:07 +1000
Message-ID: <20260408013309.56122-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Based-on: 20260407222208.271838-1-pierrick.bouvier@linaro.org
("[PATCH v11 00/21] target/arm: single-binary")

Eliminate the last usage of bswap_code, fix a little bug,
and drop the now unused function.


r~


Richard Henderson (2):
  linux-user/arm: Improve get_user_code_u32 and usage
  target/arm: Remove bswap_code

 target/arm/cpu.h          | 16 ----------
 linux-user/arm/cpu_loop.c | 64 ++++++++++++++++++++++++---------------
 2 files changed, 40 insertions(+), 40 deletions(-)

-- 
2.43.0


