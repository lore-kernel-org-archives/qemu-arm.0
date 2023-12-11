Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp491860ejo;
        Mon, 11 Dec 2023 13:20:18 -0800 (PST)
X-Received: by 2002:adf:a1d8:0:b0:333:3b91:19c0 with SMTP id v24-20020adfa1d8000000b003333b9119c0mr2475484wrv.129.1702329618395;
        Mon, 11 Dec 2023 13:20:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702329618; cv=none;
        d=google.com; s=arc-20160816;
        b=XalGuN2j/WHp3cft0vTLWgJ1U/zoOlFFa5ng++DpxWyM/KxEiIPn7G4ykHP5LYpU3v
         Gq8ClGZsMdceZmQpRG/rzGdvaZK1py1NhxzzMc6r4JQSR3Rb9G1gg1ODIXe9DbOQkyVI
         vkB5bnjxF1EpmJwzlIE95Kqv1pGnYnHJ0VwPSKlymyDedg42jUQ39RR2t4z1rApTlUK9
         IzFp/CG+kCxeHgkAdbUQia8RhRzQz8LkRD5UwDeNUMGweogjppHYtMZeTTKpxA6NMfO1
         lYzhzU4DGXwIRgx7jgEJS/DBlCoC5FgW5sWmrvU1oUSC1ZOgv0hg3FNxpTdYP+SoeW2/
         X3cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+O6qsD4iSikKX7LlQ9zhnH8XNtR1+Zg+F3UQkLugJvM=;
        fh=6uA3yvXeN55FEhLQ+7xhayEyGzy+Y3z2qOYV5oRrcR8=;
        b=K9Vn4cQcI3MdGxJrIUJZGVjWxXpJbhM2eIr4BQkB5WX4aD2PeUYduB1reaGmOIqzxT
         UcjPBFb6vzPacSZhwHoE3d5BrSis4rmfmWnaczlMzecGApiJth6VVTbNVZxjUa7LUR7b
         60JwmVFaI/++araZXNLcZWT5xjUtAY9IpWST64QrhWT2l2tZ+FWd4XCasaXSYFtwZeLQ
         tRlvwn+4/zOjUHxYgWH77Uwd1GERbTzdaCwMes51crrYDjVFmiQ+e3EuplNganRxGuEg
         2bCHGLaDhBOZA9fWeww5Vp+65a95jSaUgMI58DBwcIPi66GsiFzXivjEsBfcmAJNMonH
         cEpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LJLuoXD4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a13-20020adfed0d000000b003333bd93dd6sor2189839wro.6.2023.12.11.13.20.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:20:18 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LJLuoXD4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702329618; x=1702934418; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+O6qsD4iSikKX7LlQ9zhnH8XNtR1+Zg+F3UQkLugJvM=;
        b=LJLuoXD4YUffT7BzFT+jieY2dxvVsFRjiBCc4wYRTcrp1cLKq0hrsSiHFhpRYiyiqV
         AybkJ1U8+59v5/CCKax6HneeA7BU+24SHLoR9KPGVOl1kn2JhLfMphBznDbp1b3yIZW5
         pcIfhisS+AeYktFAX/OZIF5V9d8pM1fWHxlWSWK+/6+ouZ1jYuCcZvHyry4+vli7e3or
         CeTgn46S2p6L85p9Y4FnQ+lKj1PRQsvu1DeRJ9iZzZfd9XcJ/XYQO0dXg/TBEPyzOmKN
         UOK4KWiTvSjeMUaYHgQ1tV4o+Aj8/XAbZhcdilhw2418Nyq4fDwT+Za9Iul6GTOMlTjp
         FIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702329618; x=1702934418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+O6qsD4iSikKX7LlQ9zhnH8XNtR1+Zg+F3UQkLugJvM=;
        b=C7V8tymLKhP3wTAh2bdRyZQEf3BRvpL6yiIWMwT3Bbnz1aTdSgw3UebLb9OQWHokKM
         SaIiz/HLsAS3WqwNtK97/RB5X1VOgflNQI1HNr8jRhpzuC1u0pW9JGw5sM5TPLLZDI6y
         MGAdapUcQK5UmS/TxRwwN8d1iycmd+GEKA1BtbxWMdDhpiEfm86l4o9MABCvaP3jZokA
         M5Rcl7ZEY7LxPljs9fJ1gB9tKzoeWyeWeDyJ4K7IXSy243ULpkk/2KhbHcu5/ZVuvdHl
         oRx+ycqGOlAHt7dmUWgjRCJzi2YlNx2vdbGr/5trxOu1lVZKmo2nEm3oAA/tB0PUVyQa
         PvVw==
X-Gm-Message-State: AOJu0YyKdyCLjceDpbzq5Zkfk/EWFJIsEZTgxxPjMnEsIW0POO+MxjBL
	tuYqoHnjZIaszqbOpz4VuwmvT1qZ
X-Google-Smtp-Source: AGHT+IEGytrQy7Ystfv6RnhfSOauiZ+iRUKsQm3VCDpsIUm30ILiQ4RfEMueOEJ4nTVHKHcn3ji8CQ==
X-Received: by 2002:a5d:4d8e:0:b0:334:b24d:c18 with SMTP id b14-20020a5d4d8e000000b00334b24d0c18mr2975705wru.2.1702329617610;
        Mon, 11 Dec 2023 13:20:17 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id le9-20020a170907170900b00a1e2aa3d090sm5264476ejc.206.2023.12.11.13.20.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 11 Dec 2023 13:20:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
	Peter Xu <peterx@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Eduardo Habkost <eduardo@habkost.net>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	Claudio Fontana <cfontana@suse.de>,
	Brian Cain <bcain@quicinc.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 01/24] exec: Include 'cpu.h' before validating CPUArchState placement
Date: Mon, 11 Dec 2023 22:19:38 +0100
Message-ID: <20231211212003.21686-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kfmd7uVzwXPz

CPUArchState 'env' field is defined within the ArchCPU structure,
so we need to include each target "cpu.h" header which defines it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu-all.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 5340907cfd..9a7b5737d3 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -411,10 +411,6 @@ static inline bool tlb_hit(uint64_t tlb_addr, vaddr addr)
 /* accel/tcg/cpu-exec.c */
 int cpu_exec(CPUState *cpu);
 
-/* Validate correct placement of CPUArchState. */
-QEMU_BUILD_BUG_ON(offsetof(ArchCPU, parent_obj) != 0);
-QEMU_BUILD_BUG_ON(offsetof(ArchCPU, env) != sizeof(CPUState));
-
 /**
  * env_archcpu(env)
  * @env: The architecture environment
@@ -437,4 +433,9 @@ static inline CPUState *env_cpu(CPUArchState *env)
     return (void *)env - sizeof(CPUState);
 }
 
+/* Validate correct placement of CPUArchState. */
+#include "cpu.h"
+QEMU_BUILD_BUG_ON(offsetof(ArchCPU, parent_obj) != 0);
+QEMU_BUILD_BUG_ON(offsetof(ArchCPU, env) != sizeof(CPUState));
+
 #endif /* CPU_ALL_H */
-- 
2.41.0
