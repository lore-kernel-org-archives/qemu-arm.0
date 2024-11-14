Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp25771njc;
        Wed, 13 Nov 2024 17:13:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVJSNT+641YYdLKww9fKxXpbTq2mMLIsAEkXX+/T8j1vlxw8RyE3VaKA+rsJ96wVuRFpGM0cIc9YOOx+Q==@linaro.org
X-Received: by 2002:a05:600c:3115:b0:431:7ca6:57b1 with SMTP id 5b1f17b1804b1-432b751c564mr178462275e9.32.1731546837527;
        Wed, 13 Nov 2024 17:13:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731546837; cv=none;
        d=google.com; s=arc-20240605;
        b=MLXy22hbMQCN+dscRDchOrchC9RZVYXiVQJ6bhMvTWZ0T2jTY/3Dq96IC9NgN6pksv
         NAAATft3POVclE2w+GDlsGBRnyqTQ2ZfMhIDaMe1cxpCnZ4RMkUtB0PCkVa4mxawP6cG
         YXzrsaVQRN8Y2/MGLPzJiFXbHFGZlgYnCMjrLNZV3cF4+GRygKF7MJkJniFgveh9mkxq
         lvcb022Ik8jji660nhdfc4KQmz/hSFRM60we65UFi2s6q4qgjTdip/hNAm7OBTBtq4wM
         gs+aT0DjEnSfK/S1C1F4F29uoFMJBv1goCfCerePMg8yYM7vCdAQbpAPsx9ppDl8sklt
         wy8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=X3oqMeHT71R3KdP9eZWoYcjlbOfOwEShX9l191wOq00=;
        fh=tCffexmiQ5+QaEIRGgOOaP9xA1rj0JuEzTqlsblOv3I=;
        b=Jqzi0cMZHi7ZTXNwNpXgZ13hv3Kr7pFxJd1TypMqZcnPvg9YXwpTUNpkv3iPJckc6T
         8vCAtXiDpBNGJrG7o2JofySfmzEcu5l9W2ad6X/DW5m41km3o9SAAbEIBR6IQT0Uz4HB
         Hw5/Ps9FFihT6xSxWnXPHQNgxTxu70ok2z7FuqWDrqEUUZoCzkGo/sDA6pPldjQeYA6V
         yhY1gDA5r3qKJq0DKMfj2HR8yRMJ5MS/xhsFlXNHCsc5pYjJNzzvYKK7/tQ11HJIhAMf
         0Pl6R9yAPLkz2cBxvL5tAWBmGyKljF1Nj4Yzeqv5XGvM0ouhwMMKB4k3XqeUQR0K/zPW
         wMHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ixpTpzuO;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-432b0ba964csor63063885e9.10.2024.11.13.17.13.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 17:13:57 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ixpTpzuO;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731546837; x=1732151637; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3oqMeHT71R3KdP9eZWoYcjlbOfOwEShX9l191wOq00=;
        b=ixpTpzuOcO7jq94valTRKH5SmD3oezoklHTVnuYTe78PToEO0aJ07op+kbW553ycSn
         8DyBkY2se+s8QUyJQnWgLQh9b66uII5zOLVRe8yyF5G30J8twOCr/RY/jOfmog/W+lvT
         lI+/ZmHbufdmje9xT16aspvA3q7jHzNUZaPwam8gJJhV07GPd4dOeTTOU0bfkM2m0AB6
         3pcsGUqBlGqlDcLh9ERGHmaY4Kpz490d62iZ+bHU8XRmf8MVWLD2fYdGuLMHP/ev/Ppm
         NwsU+BhgsuMtG0ELv82zGOz9sid7nEQaTKp3PkpykRPiD7ZpBU+aUah75W1b092lYN9J
         NjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731546837; x=1732151637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3oqMeHT71R3KdP9eZWoYcjlbOfOwEShX9l191wOq00=;
        b=SnmmfONBMkhtxLPDB+n/SnjoUCZYFZ54u3UEu1X43EAnPiuATYGDQehwBKk4fDJgbN
         ZD2LnDnW9NAj/BitI7HzRvDha8gLUqldsUVGfH9R767GX494JLbMvOPapvr7rIqtonkM
         Q0ysWSAU5ePFBpAkzKlnI0gTmseOylj3fpeMXkVV0hAbTB73+sTX2bUBdGmdL1ALRJrp
         pCXFysVmG0iRa7RwBe5X2C2+G+VqzfMPJx4KnbqpkGDUSatvdyOD8xqhgQElu1jkcexg
         yGS+FJT76+nVDrJnl4CUJ5648TJExkXaTvcEzg1v1Uw6yBteA0QaeiE1c8CsveTcBDit
         CO2w==
X-Forwarded-Encrypted: i=1; AJvYcCVPclLxXu4/AV5VkKHFA3CJU9hEi7qy6tbVjCPb5d8HeUaUC9X3XyvlzWhbAYpG5Befd6+9tbnqCyd5sw==@linaro.org
X-Gm-Message-State: AOJu0Ywez2fntmhdX2ECdYFBBuMbZ0XaoIjzQk9KFK/6lKwr4Gs3lIzk
	1lUVQe4WVyLiJnBiQKkIyCX8lwteghN5q8WPfTeBZypQ+mSo4DyD3cpd36Zf6IzSDA==
X-Google-Smtp-Source: AGHT+IFH/9CySRShC94nFw9UunKX2sRCoFuNlkS4DCoQU46r6V+s7M3YfRcJ8MxE5SjH5yjXwvy3Zg==
X-Received: by 2002:a05:600c:a384:b0:431:1868:417f with SMTP id 5b1f17b1804b1-432d2730ce1mr69929325e9.17.1731546837008;
        Wed, 13 Nov 2024 17:13:57 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.209.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dac0aea8sm1385325e9.31.2024.11.13.17.13.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 13 Nov 2024 17:13:56 -0800 (PST)
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
Subject: [PATCH 04/24] accel/tcg: Include missing 'exec/translation-block.h' header
Date: Thu, 14 Nov 2024 02:12:49 +0100
Message-ID: <20241114011310.3615-5-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114011310.3615-1-philmd@linaro.org>
References: <20241114011310.3615-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: G3j66HS7zWnS

TB compile flags are defined in "exec/translation-block.h".
Include it in order to avoid when refactoring:

  accel/tcg/tcg-accel-ops.c:62:36: error: use of undeclared identifier 'CF_CLUSTER_SHIFT'
     62 |     cflags = cpu->cluster_index << CF_CLUSTER_SHIFT;
        |                                    ^
  accel/tcg/tcg-accel-ops.c:64:26: error: use of undeclared identifier 'CF_PARALLEL'
     64 |     cflags |= parallel ? CF_PARALLEL : 0;
        |                          ^
  accel/tcg/tcg-accel-ops.c:65:34: error: use of undeclared identifier 'CF_USE_ICOUNT'
     65 |     cflags |= icount_enabled() ? CF_USE_ICOUNT : 0;
        |                                  ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/tcg-accel-ops.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 3c19e68a79..22486c5dff 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -35,6 +35,7 @@
 #include "exec/exec-all.h"
 #include "exec/hwaddr.h"
 #include "exec/tb-flush.h"
+#include "exec/translation-block.h"
 #include "gdbstub/enums.h"
 
 #include "hw/core/cpu.h"
-- 
2.45.2
