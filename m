Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp686292njb;
        Tue, 13 May 2025 10:44:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX2kW5JsCWlhFCyfApCyZ9ng+cKFXGUdx2rCknS4aycZ4ZEZVmud0/hXdJ/nn9pB41sYrIHolBBQpl/9w==@linaro.org
X-Google-Smtp-Source: AGHT+IEnyAwwhBZFl0zZWofGRCWG/sLzAc4Tw5oMJK/MMA28Z8EvLAwPSqIvKF1A/mjT7H8p0sRD
X-Received: by 2002:a05:622a:989:b0:476:95dd:521c with SMTP id d75a77b69052e-49495d1c2a4mr4972961cf.45.1747158259346;
        Tue, 13 May 2025 10:44:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747158259; cv=none;
        d=google.com; s=arc-20240605;
        b=fmtwHNYlKUfnmEaG4w/6SlAnmPUL4iVqOQHqhx0N0AP9S7VKtxgG75yJch5TIhyQYj
         roscZL7thc4uFizPgG9A+cQ1OGLgIKW5mkEyvuz5U/Hp+sSXiS/XqSPfq6L8i+5RNqGM
         +quEzGwtEuP0o4+gXRlqOtFRlfDEKMn5Zmj9Pe7580YuH8cI1m1k4oriOofeFx8jAC8c
         uXYaxQ3YFt29Eh3505PGJJYsoxnZlTiRV48oimkKPV3Thpp5DgJUBCwP4JCaePAkTqRv
         uGCeOhIRQohafeu0GXxJt4STcZiNb1H56wLODFKCUUYrmXB1VP6GGUYsYsaT9fhtU9PS
         ACQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FlgmqWinD7NQwKFSRiJub8ZlgVYRN5tlN02/pnlcz3E=;
        fh=rWr3/RxcQ6hZYC3ZZpwll9FK+dfEf61S04arp2Ykbvk=;
        b=WkzEdqfzBQGihOh/+O/P8vFmyBit4Zd0Mi2yLJYq5UllvtXhgSDKh3TibGS43xSx87
         hltVlUH5e8Ulxoip9B8JpFUwpmVEadJC4I0uogG1wQhJeNWtHImUyPZEheMvUPwSajel
         JLKDPHXa+gTUh6BniN8AJAtuqkXIrr+9qJTNcXPNXvxZSBXmdC8jdfEtp2wxnwB19it5
         8CKjA1di1eld9OBjrkLmmKBUEUvdiLFj6sulVfaRamzuvtTzPqUTvSTnjJHPO745rYbt
         vTFwIknG5dovKG5oYRdLVmZyFC5HTlniDNpJElZp6VrRMt6AKECkvAL+2Thd9aTC/IKW
         F/zA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H2lcgZv5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49452479bf7si110371011cf.171.2025.05.13.10.44.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 10:44:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H2lcgZv5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEtfr-0003Qr-Si; Tue, 13 May 2025 13:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtbk-0008Pb-Ha
 for qemu-arm@nongnu.org; Tue, 13 May 2025 13:40:00 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uEtbi-00039V-Mr
 for qemu-arm@nongnu.org; Tue, 13 May 2025 13:40:00 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso38909365e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 May 2025 10:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747157995; x=1747762795; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FlgmqWinD7NQwKFSRiJub8ZlgVYRN5tlN02/pnlcz3E=;
 b=H2lcgZv5lkwQ2TjE6djdysechGwVmP+Mfhq/Bc69c6e3mNH8PDEikqxA/89a9pW9vG
 p5zgZXWqpEqkb1Axq+a5HOtUIRQvHNmBFnELZZWOwrhG4YAeCpn+o+4CUuJvbbfP3CjT
 Ar/F8Xfyo+ihd6Y/kPz9Cw5dyqmt0fbVHdpR5izTdi9n8gKjNEExChNCIKO0JxJ77jfV
 eY+LU3B/Qbp6r2+zBgfpCDF2sg69hWiO1vEy9p9Q/NbG/w3rJgL6cUmxozs/dSlrHI2D
 KT84aze0O/kbafG/OjHmVITlGHrjqKM4gfxORqX9wRvGo9RDkZq/iKvt3RMtDfDgtwTI
 oqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747157995; x=1747762795;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FlgmqWinD7NQwKFSRiJub8ZlgVYRN5tlN02/pnlcz3E=;
 b=ZDbak+dPkt7bzCtVWaNqJCJYpkHjzUnVrsrfau9e7Mlruh4/3bwlzhiLGHJXNAvkBQ
 U+clKPYyHhsRZKn8U12hWiUbZceRBkEX5UX8mHOdP5Ej+E+Zqm0QJDowbGrnvnoqy1hW
 eEGVOlFocZfrzaC+8R2wInL+EsCGl2N1sTm1rnjaMB/RXPoqp6joIYPP8oUZsuahjPSl
 Xp0jcobV1y5MUBQwHMmYYtuDmfAj78Ws21bUW76CKbkxvg24SI59Nw6CXrXwzGbGiKno
 q/UBvsJhJYIOXDPIEkRKz+JuhDkCE435+KaDmGm7hyf/+R5of99otCxS3M/TrqAqhaQN
 7Elw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz6Dkmg8u2ItRLdh/aWRiit20kyfm8NOkiQ7l4+jSsLJ+t9homTIMMzlpfuonI08LGWuM/sG2LzA==@nongnu.org
X-Gm-Message-State: AOJu0YyqIo5vPs+f3iUfY2pBA596E9QGmhEa5i+vRulDVzD8wehvd2vu
 4Z7gne8KvDQaUQrlySNskQ4ANH6Ptnwk4w2cEi1L0F2YTnOv6nr7eklbyZQ1Q0Y=
X-Gm-Gg: ASbGnct5RkGI2xy59Bfk/swBnEZBcYzsJkRDmUV+p1ZzGnfJG4g05roFcxi/fBKt9rv
 WqNYHr/JHCqwTOHdzeua8Ob5kx6TMWgPh/d6p7+i96XPZVZCNpg2jITT0yB3pPQULnJMZ9Evc7W
 Y0/jt9Vwbfi2sdeBidDLAr2eq08ObL4BjNek3W6ipORjRmjW4o16m0RmkAhuGtnsIJCbN0nKjEO
 73uhH0VMJWqllupUI8dzOoUD4ZotXgOExn3BtnlVFG+E+b9KcjJjIERhrkwkytFKT3b/oZT3rsc
 QOaPAGQ+rDmMY3GEBQuii2ItocryEQAhOOX1D8RtQdLjb3UD77ykPZc4u8J5FcvwXy7wbsspGo1
 NjL+pTe2wpwlH6zNs+PDIlVFaKyez
X-Received: by 2002:a05:600c:1c12:b0:440:61eb:2ce5 with SMTP id
 5b1f17b1804b1-442f20ffcc5mr2233185e9.17.1747157995571; 
 Tue, 13 May 2025 10:39:55 -0700 (PDT)
Received: from localhost.localdomain (110.8.30.213.rev.vodafone.pt.
 [213.30.8.110]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58f2b29sm17198563f8f.53.2025.05.13.10.39.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 May 2025 10:39:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 05/19] hw/arm/boot: Include missing 'system/memory.h' header
Date: Tue, 13 May 2025 18:39:14 +0100
Message-ID: <20250513173928.77376-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250513173928.77376-1-philmd@linaro.org>
References: <20250513173928.77376-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: x37u+3SR7yo3

default_reset_secondary() uses address_space_stl_notdirty(),
itself declared in "system/memory.h". Include this header in
order to avoid when refactoring headers:

  ../hw/arm/boot.c:281:5: error: implicit declaration of function 'address_space_stl_notdirty' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
    address_space_stl_notdirty(as, info->smp_bootreg_addr,
    ^

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/boot.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index f94b940bc31..79afb51b8a5 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -19,6 +19,7 @@
 #include "system/kvm.h"
 #include "system/tcg.h"
 #include "system/system.h"
+#include "system/memory.h"
 #include "system/numa.h"
 #include "hw/boards.h"
 #include "system/reset.h"
-- 
2.47.1

