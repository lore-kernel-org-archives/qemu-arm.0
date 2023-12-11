Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp492656ejo;
        Mon, 11 Dec 2023 13:21:57 -0800 (PST)
X-Received: by 2002:a05:6512:a8a:b0:50b:df3e:ee79 with SMTP id m10-20020a0565120a8a00b0050bdf3eee79mr2667130lfu.101.1702329717580;
        Mon, 11 Dec 2023 13:21:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702329717; cv=none;
        d=google.com; s=arc-20160816;
        b=mooyB+ff3PW3ZNoE/9HhVK1X176jg6nIBYKqGN9r/IamEnUI0yySMOyCuWAvkXHUyr
         8WefT3dmO6rWfqhYsmZxMt3vSMA8gRIYshjUP44rXxeRJMacK8YJdhj+kfdNRnXyxf6M
         rRTnTgz5WqRMcp9JikyX8J92GfI1rrljzYXk+9ZfVxhAOeOmoMnhby5vkqi2wpm0Np3t
         5BY5wfnZqGtyXo/nH4GQnfa1BUQ7uXVgmseXg5t/Jv2MNFMJ3SZV/BhhCfd2WlDgbF1r
         2468hJIn/jH28ZYR5YPMTEdZRhQzHZ2KyZ4QBQir1ou6TwMzKsqEV0uSocLYSy62fVnY
         5xQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Sxk2B1Wo2pXRo42/SYBVVIycoetyzxarj96J9gTlCqc=;
        fh=6uA3yvXeN55FEhLQ+7xhayEyGzy+Y3z2qOYV5oRrcR8=;
        b=OJnnuSnc8zcv7mN+0iCpYufG9OdlzBg1GuFFOYzYYR95r1ZBRO71xq8w8qZkjMOf2L
         dvxO9oQtnNOSC/knDzcDpshVOmcX0HY6ChWZczWjmorERCCTGPhSGzcvyc4sXE+trHsF
         T7/qWcTBLMl36pAn0BT72MRsn/KLUrYWubYBpDJ0X42V6CIScA2CFYhMWDo++oKZTrbq
         fVmnfbjCU9Le0g/iQY+PfS2905acYgFgxztn/8Sbx3asW9jQvq/yLzkwDsglUhJC7fFK
         snJH+FI+VYegKXBHOzCtLLvo69cEhQ3CFO4opkD/nh2Y+O+CnemUIvATXwnphkTDatqi
         jfMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dyHQIk75;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i13-20020a0565123e0d00b0050d185975cdsor1250623lfv.1.2023.12.11.13.21.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:21:57 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dyHQIk75;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702329717; x=1702934517; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sxk2B1Wo2pXRo42/SYBVVIycoetyzxarj96J9gTlCqc=;
        b=dyHQIk75lCzZBXUvOTgN/pN0nd7zkgB2JOqo3xTCFhuqJPvS32daVg7O2MwFownyVr
         v8ZP13KXSQxHcKABxSkGG+SOYYoc/s0+g+2t7d5aA3h8aZmZSKJEv4c8vz7w7WERBBSG
         LWTaULa0A1NXRfnElY3nNJB+fABlM/eVw5c1236sq/kuHMiygrsK8agtfdfNs4p0oKYk
         iEIS8dyZw+/YkQpzyV4QHTggPJNKOsHEE5ZhsBi1jY0/hs24Wc5GB0nJwst7z5oBJu4C
         jueTmPv5YaxNs6l/FexXVdyvfLBbGDFTUfrIWX7SfbdG42yBqWlPdrlbftlDBsuZw3qU
         frpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702329717; x=1702934517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sxk2B1Wo2pXRo42/SYBVVIycoetyzxarj96J9gTlCqc=;
        b=Z8iKc+1np/Nvmg3Yf8+kIEi8Uu52Eg34dNUNF5wVNmbLQKuOEeOxKW35k3+mcCxx0Y
         i0nmUQI4Hu7MEP2KsHfMbVBZtZfwam8MJdyqhKWPxA9PqXQXxHxbJ/nvyenlx6cpsUPc
         XF5zL0BicnyVM2B0C2WUznpKGiEExVgIkqa4VplWjSEPxIPJjmQ3l1EHmyv0qCtPye25
         AOD53J1L8UODBw1/UisMu5AMAiWi6xoZmOgKUbkNXIxQgcQBpqCPgm9OGFN1JbpheHbV
         SWgWv1S5J8vHIN66WgpSpF5japKbNutwvVIjJiKdjzcYERopU52kA2jUA3E/fATrNxh/
         D9Ew==
X-Gm-Message-State: AOJu0YxkU8jTURytTVbrIBozoef2DQQLid0/EWIhdRVQpt0t6dnOvqfi
	lTCGhzt8o+8IVSiCT/SBaAgEOp5YVknrjIm836kHXZsg
X-Google-Smtp-Source: AGHT+IHDtXevlZvMNcceTNwUeCFzqJEEEwa7JQhvUomywLsfSZUsIRjfVyrIBQtVafs/CsiHw3FjpA==
X-Received: by 2002:a05:6512:b22:b0:50c:c8b8:6689 with SMTP id w34-20020a0565120b2200b0050cc8b86689mr2383978lfu.12.1702329717143;
        Mon, 11 Dec 2023 13:21:57 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id vh2-20020a170907d38200b00a1be80a0b69sm5333806ejc.58.2023.12.11.13.21.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 11 Dec 2023 13:21:56 -0800 (PST)
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
Subject: [PATCH 13/24] accel/tcg: Include missing 'hw/core/cpu.h' header
Date: Mon, 11 Dec 2023 22:19:50 +0100
Message-ID: <20231211212003.21686-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: q6Z3Qo/f82Gw

tcg_cpu_init_cflags() accesses CPUState fields, so requires
"hw/core/cpu.h" to get its structure definition.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/tcg-accel-ops.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 1b57290682..58806e2d7f 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -37,6 +37,8 @@
 #include "exec/tb-flush.h"
 #include "exec/gdbstub.h"
 
+#include "hw/core/cpu.h"
+
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-mttcg.h"
 #include "tcg-accel-ops-rr.h"
-- 
2.41.0
