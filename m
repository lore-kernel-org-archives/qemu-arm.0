Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp492704ejo;
        Mon, 11 Dec 2023 13:22:06 -0800 (PST)
X-Received: by 2002:a17:906:3f19:b0:a1a:bb89:e2ef with SMTP id c25-20020a1709063f1900b00a1abb89e2efmr2759726ejj.16.1702329725912;
        Mon, 11 Dec 2023 13:22:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702329725; cv=none;
        d=google.com; s=arc-20160816;
        b=hbKz3GotS5eBXQC8sYCQ1KcLs59Jw188JCbJO/UoJgXxk9AdDInawyZXJqEvSQX5Nq
         EGYqWASLOjmK4qUw0R1VFnizPBXvCIQPj8sZ/0J5YfyurDHQ4i8G4ESlwIfYAAkeBThR
         Ysz27RQ5uTuGJTbLpc2+L2af2iUmeIuwx/Hduk3Bj27wiGSdLJnpEuziXl7BbL3ycgE0
         6TpY8bHVUflONkVCwyHxofFL4Wm/eB+1S/WX48Fog492n6oq2eZXnDdjmDPE0QOsFGLf
         FkxMhfu1CNh1bli9QdG8rcmcEoGWP31Vhs127f65KsIXEaBfeZkq1fvzvoYvVvcyCSRw
         jbag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=U3EU22bNfiIc1b+ZyOtnWaIQVzLfNzz6gZyDB25Dnbs=;
        fh=6uA3yvXeN55FEhLQ+7xhayEyGzy+Y3z2qOYV5oRrcR8=;
        b=jL95GwVb+U811kTfL+acUdinaZe5RpPLrvfDLZRuSyVp571TwozNOa0JnCQKshuqMj
         qAwTKG0umDrpLpDi5t99+jS7cCi7lVisrEKPCBv+ldWcD1XUfNhFbmK23pqOwlgMgclu
         QHJ3sw8KpdD8lD+3min6Za3ZA8iSg5MaUGrkdi3NcpWE9yZLQDuNWUkffehrnUdJt+Z6
         VRjvFtRrwzfi3duJcMr+DERn/6FEts5pUuVu/+/CJAsN0e1s69VSOx6ZfgQabEDF6mk7
         uABqtP09Z4M1Bt9Ze4my5F67ai1jXhbJDNtmZpdYGCs44PoHURVIO3z5toZgW+k3ifWE
         ssUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hcy2WyDn;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jx15-20020a170907760f00b00a0d7291f034sor1992901ejc.7.2023.12.11.13.22.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:22:05 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hcy2WyDn;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702329725; x=1702934525; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3EU22bNfiIc1b+ZyOtnWaIQVzLfNzz6gZyDB25Dnbs=;
        b=Hcy2WyDnH8n3buk0kul0imYAE1TxRHm8sklYbaPQbhWWqxPKuTOD7k2WVXJyiaLkM0
         zCDGwRT4alK2MQirNCSOq5ure+NOi65mhlctZX1BAwfe4HLUjOat0cufVAMQPgbWUl3G
         mKtcRtaZMAatrc7B5vKfhe0yv/NluVATCXFu8n5qqHuQSyfhOl/EpQmV2rY5yrHdyxxu
         e3uaTYcV0o4FKvbbYqF8L9pHFHADgvaRObtn8e8dJs//4cwmkVWptYMZec2/2IN2YlTP
         o6gg6MLQ4VHrKxGZ1w2KuzS/2uMMDEJeMeS8t0rE18tUiTuZtMCWfLf1k8ognbBd/WPa
         O5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702329725; x=1702934525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3EU22bNfiIc1b+ZyOtnWaIQVzLfNzz6gZyDB25Dnbs=;
        b=PIV3WJK3y/WmQVIqBxGu7llvOMRVwzlwRoSBShPHssO/X3Cp+7mNbEB5FT+93Gu5F9
         WooQN4KBi26b9zs1UaGocfRpM3jj3g5e3yeawJ8kRziOx0UNFjDkTo53IGk03/l3IjD5
         hllLRWUsPIWMNZK88DvU230Zej3inknBr32ldbvPnhTfiE+0S4R+6CH1NxlFLouKyqD3
         yHon0K/tX1TWzyp86sbPUornKXpcJqsT+Y9kI4JbPwHlTHgmfGCgtiI5ju0FViVBewRX
         GWzIfE0C/1obo/KwTlqLCiWwUlpSEvnkOg5YMltyfpdt3XQXRrHVuLJf6YMvHVS0HguE
         eusQ==
X-Gm-Message-State: AOJu0YzZyrtRUIMRQUT8BWQZfhwbqLrRC70xvRmCOEwE8beClwAMyJ6C
	4CaJAwT3k9FbA2JPbBzmT/5WHsOK
X-Google-Smtp-Source: AGHT+IGzl3xQjm7C+9LNWEf4YaTjOxsCCunkMYfPCy1U1wU+AE7F8A7uN4M+yUT3A/jdokc1MR9z5A==
X-Received: by 2002:a17:906:c2d6:b0:a1c:1f65:f4b6 with SMTP id ch22-20020a170906c2d600b00a1c1f65f4b6mr3223070ejb.144.1702329725658;
        Mon, 11 Dec 2023 13:22:05 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id rm6-20020a1709076b0600b00a1db194b777sm5310183ejc.78.2023.12.11.13.22.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 11 Dec 2023 13:22:05 -0800 (PST)
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
Subject: [PATCH 14/24] gdbstub: Include missing 'hw/core/cpu.h' header
Date: Mon, 11 Dec 2023 22:19:51 +0100
Message-ID: <20231211212003.21686-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Fk1CCTsCXDqL

Functions such gdb_get_cpu_pid() dereference CPUState so
require the structure declaration from "hw/core/cpu.h":

  static uint32_t gdb_get_cpu_pid(CPUState *cpu)
  {
    ...
    return cpu->cluster_index + 1;
  }

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 gdbstub/gdbstub.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 46d752bbc2..034a4ac211 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -37,6 +37,7 @@
 #include "hw/cpu/cluster.h"
 #include "hw/boards.h"
 #endif
+#include "hw/core/cpu.h"
 
 #include "sysemu/hw_accel.h"
 #include "sysemu/runstate.h"
-- 
2.41.0
