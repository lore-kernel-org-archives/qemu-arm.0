Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp26261njc;
        Wed, 13 Nov 2024 17:14:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXk4kng0XNbYkzPkPF1H7Vo7ykStdhj/PSTJcvowoOoRc1RASPNV2CrVU3a+UGmyAhjHtREI2VS/hrSVg==@linaro.org
X-Received: by 2002:a5d:59a7:0:b0:382:6f2:df7a with SMTP id ffacd0b85a97d-3820df676afmr4257067f8f.34.1731546895640;
        Wed, 13 Nov 2024 17:14:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731546895; cv=none;
        d=google.com; s=arc-20240605;
        b=XKkxzrWL+Q+Y1V95kW5Q2cUAUC2s0Q76NfdMMBaW/n8jVNRg8OpuLxZE33qbHUEETD
         FwnhU58KmwF5JtiuoI6sGkZ5dl4WuMJlI8ZuUYNp5sDvrczYlRkgQLTcovhR541GhRjp
         No2s0ysXzzhR9PoIK7g8HwvY12TzO6pRmCpRk/DU3Z/gX7x8diUcOXlItg6r1v4fQWE6
         INPYMCGKLIuOzzJUc2fPloMBBiWdUlt8ZqeTLEAsWgf5Rt7xaEN+pHODKnpESgXOuZGk
         GIwvD44cqN//DRiIVzEmDlvUXXaU/F6b+9b/SVNGF/17/7QZMOTT6Z/6tuN1lNoQaU9E
         UWeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bnHexH62EqsPqSCCVFJiR18Ut4gF1uO3ZfHgDoJH6Vo=;
        fh=ZbInU0Jw5jZtkkkPY5P8i/0se9aBKEkHJQ8KWHFNmHQ=;
        b=FkDW8zJDkPwHAfiOKoPHgSrIMAL1Yl5VSZDpn6c877fFpLlgHBe1T7cZgCKhUaCXif
         A2D6EwRFySZJHW7dPl6fwQJL0+7LFQfomAw/4MakhTTp7lgOIcBqbLtAgLFnuDwb5/o0
         qX0otv+Ox80ajKoYcwSKveGW8R+p6A/78Y0rqewxR3hmROYE9iRAepDGij4iLdQeqr4H
         Wgf5mOtqN8GNcXtD0GSXrel/qxoHoO5yXxD1IE7uW324TKjZkF2t1joz0OrTYFQ6ovZJ
         vkqP4tyEgeyBVhX5swmounL7YidllJ9EDVWkh3W349Hgxe2d0CytWyCPv+/uaJm+43m3
         m2lA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VtdUSeIb;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-381ed97dbdcsor4961912f8f.3.2024.11.13.17.14.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 17:14:55 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VtdUSeIb;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731546895; x=1732151695; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnHexH62EqsPqSCCVFJiR18Ut4gF1uO3ZfHgDoJH6Vo=;
        b=VtdUSeIb3eF81+/H76weAlaQwq6ZQYSMwLi/FFAGw8WIyy2PNxRyT5pCm8MU7mhYLH
         3gTWATChf/4bKe8rtuNiMVC7T0aXFCyQHgS1TkCpDFlFuQ4UmKuy6DkRBb9qv0ebtqXb
         bU190wKEQW2+fTRVY9gfBFU9NdH/E6BqTCy7slm/iGemmkefRr4WwV8qBKsITQA8kpzg
         I+kpB+WxtAg3aH9UoY6jCQNL0aHWPB/9Erxz2H3VNJBKS9CODQhT3qcefnK6XPGPs3EL
         5h19E04DMy5A2yem/3kIClt6+2WD31PnUd2gNTaAYuakDD2A5AHmOdV7bltEBGyNy4Ez
         HRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731546895; x=1732151695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bnHexH62EqsPqSCCVFJiR18Ut4gF1uO3ZfHgDoJH6Vo=;
        b=jAInmIuHbtcRuEsKd4u1U/2g6D285jnDuB/D2PidYwh623LokDcOzrC8QDU4ctvQsQ
         GGQKq+IxhTs4g6r1DNs1nmI8G23cxy27wXlI+gMZw+K4P3tdrzKHHM5rFEk8t+3LCDPn
         CjexSIDcBvYWC8+zo7rcSvh1kxM4qP/7sth32Gxv3VD9FO3eEfbD1dYaY/bZa7Bcn1d2
         ZIfWDd402vUQtDZwS9nb1WlAlb2mzQnb0KZfLAo24PGjg4odF07mAKOF00omA4BR4ILx
         ssUSbJYbN9TI5DrVDJKI3BYLZ+1G8R4WMpZoHtO9DuZFv2m2eEYCA0FcBJXdX1dF7hRa
         eKIg==
X-Forwarded-Encrypted: i=1; AJvYcCUUfEbPQmDUeaK+rI8GSIUgBCc6ATpkVkxBPToE81Mba8aj9282eaFFIndoOsv/D4oF7CzotHzM6t4n0Q==@linaro.org
X-Gm-Message-State: AOJu0YxfsAVFpjw08NUsYwA6o5Kr6xTNc8U3u890IB2WsdWG7RGDI/oU
	GAWV5Lc2c7WgKWF8yGDfiihXk1VUXFV6PI49w9s7hJ2XtJG9VoR/dCKdIDzMFSZhzQ==
X-Google-Smtp-Source: AGHT+IGRRIBLDqHxwGvygVd7DolZQGg3AA35b02RB8xxCyDjdgNLnjdc3+2vgRQgLmodm+ip4IylVg==
X-Received: by 2002:a05:6000:18a3:b0:381:f443:21bf with SMTP id ffacd0b85a97d-3820df5bcafmr3699799f8f.2.1731546895166;
        Wed, 13 Nov 2024 17:14:55 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.209.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab80869sm1502515e9.22.2024.11.13.17.14.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 13 Nov 2024 17:14:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 12/24] accel/tcg: Have tlb_vaddr_to_host() use vaddr type
Date: Thu, 14 Nov 2024 02:12:57 +0100
Message-ID: <20241114011310.3615-13-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114011310.3615-1-philmd@linaro.org>
References: <20241114011310.3615-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: aMIdUfZRExBy

abi_ptr is expected to be used in user emulation.
tlb_vaddr_to_host() uses it, but can be used in
system emulation. Replace the type by 'vaddr' which
is equivalent on user emulation but also works on
system.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu_ldst.h | 3 ++-
 accel/tcg/cputlb.c      | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index a26ab49b0b..769e9fc440 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -67,6 +67,7 @@
 #endif
 
 #include "exec/memopidx.h"
+#include "exec/vaddr.h"
 #include "exec/abi_ptr.h"
 #include "exec/mmu-access-type.h"
 #include "qemu/int128.h"
@@ -330,7 +331,7 @@ static inline void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
     return g2h(env_cpu(env), addr);
 }
 #else
-void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
+void *tlb_vaddr_to_host(CPUArchState *env, vaddr addr,
                         MMUAccessType access_type, int mmu_idx);
 #endif
 
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index b76a4eac4e..080cbcb34d 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1504,7 +1504,7 @@ void *probe_access(CPUArchState *env, vaddr addr, int size,
     return host;
 }
 
-void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
+void *tlb_vaddr_to_host(CPUArchState *env, vaddr addr,
                         MMUAccessType access_type, int mmu_idx)
 {
     CPUTLBEntryFull *full;
-- 
2.45.2
