Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp10326107njk;
        Fri, 3 Jan 2025 09:22:46 -0800 (PST)
X-Received: by 2002:a05:600c:154a:b0:434:fd15:3adc with SMTP id 5b1f17b1804b1-43668b786bamr376433145e9.25.1735924966695;
        Fri, 03 Jan 2025 09:22:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735924966; cv=none;
        d=google.com; s=arc-20240605;
        b=lMIYIoRKkhpHNMpujMfrn0aiBl34sIjkc4SM7TaosGKFn+JJAEQNGn4Bq8AhfuCJs8
         22YfPdpl5DUZTSLAKk1IwLXN6WCsN6acrUGUCVqqvzKv/9LT0fbZzGZe92NEOiZkf21m
         y9H8Cf0XYBGGHyyNTtSNwrrYro5Z4aps11RirCKILDh281Di6ZCj7vvi5B2OhiXdzL1D
         RwFzSGvHbsqleWHoY6Y2z4C6ASil7vyJG7YMCSMg5Q4YltjqrAQ3j0NmFAi1oVlGAsmb
         4OYRCAtCCYRvheXjinDWo4eNClSH7QGcYkHaf3llenxwraZBHHdlmm2ypwVO5jc0dzqt
         btiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MtpMvbVNvoKM9SuvMPCquWt8IFwwWj8rGKGNS/75JWg=;
        fh=sOXhaDUqTNtWZrrLHpwVOLbAyi3Of/7BDc3BkRLfsYs=;
        b=Ngkk53bs1Qj+KGKKVs/i+/VAsciDoD8ESaKn8G6/IkWMbxZfRgMPMVD13jhFBYJTL+
         E0Bc4jUUpgQwGbhmH0R3XPIsQgga5rLL2ISiynxKJ9rChvPUCSMRLgOuHjIpXLNQcemQ
         VggweKZmFygtnzRpS22Jv4wOrMdiBLFG5KlMMKFbkijj6R3XT7kAAOGyiE9NazI8VCGe
         /fu0Z2hIwX88Tja/FctxJGS8fw/fsJQsAPo7aXWHcbs0KqnmuDhrh9xHK4AHCluTj998
         2KbHeZ9B+/1qOsD1cSz7wkXoNrr3f2MH7F1zAiUnyakMHKIMNGETmBI59z6DwpVieC9J
         3UOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eGNanR2i;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43662caf7c4sor93067245e9.2.2025.01.03.09.22.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 03 Jan 2025 09:22:46 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eGNanR2i;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735924966; x=1736529766; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MtpMvbVNvoKM9SuvMPCquWt8IFwwWj8rGKGNS/75JWg=;
        b=eGNanR2i44tTqKPWQT10MGchjTcBnl4HDs+BH04wvLY9TAzXQE+smqVYoWI9SXG3DK
         gJ4o026Wj382ebv5LMT6RNMn1LdVkEG5Bj+TLUgMFuE/0T/FAZB8KlvJiXZ/SBP7o0R5
         eDWI0Q0lkJY1/hI8XWuBfZyQ+y/XqIhUtYwnttnkP1rLHGvtp/HjzXXCQ6kRRDY8WPP7
         lpVpgiPVelyq2PfHQcgI6KqPuLr1qJ88h+xgbmo0321p2JZIHhUwc37z0tTszLnwNiLc
         WgcKe4OoctedEYklzk+GhTvbhy/yt3Cv0IxLOjk7Pud5F+JaOcu/2DcqOuEKOk6RNUp7
         12LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735924966; x=1736529766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MtpMvbVNvoKM9SuvMPCquWt8IFwwWj8rGKGNS/75JWg=;
        b=haUXyi7Wj7Do7bdBKyCBLiuszD4PdqX7JiWub9pFtCpseEXi1L/8DJOZQV75leDf2r
         R4KVvpZy9Ni7KRSCH4BUp/s+qsDVgFglpDIHQVqmWrm1XTlf0ZOEezJu9wzE6UFwDw3m
         E8AxEBWqYS3Pf8Hn4tfXYkNQojUsRgxmLr2OezMuxBZMcFrOS2WdS4WnJK8NbOgHNhWm
         gB03rNiKV8RV8LzorqS9GZerTkka2iDU/IrwRLCgmMq1bxUAe68NZJYJNvRuONVlWL7a
         TdsZjIDMVNodsWLxFuMhPemIz1xHeRzbPWjvScrOrPrNezyck71SY6X/HG/jC8FU1WXL
         pl3Q==
X-Gm-Message-State: AOJu0YzYjhXLwC+EXcA3CZ3g5pY0lj2EtWLySrH2qP+y3iQcWsiwc4dN
	Mjd9zMQ6qmBPwApK10O/HFbrujOjbkMMFa32DckU1xVbfjRJwzhXB4r/xLBnu3O39Q==
X-Gm-Gg: ASbGncsaUfjbYN6UhG74UWQ0LMKhhNPoNmy+X9MFSxqEHti3SjHFD59rc0rI6k1GVA5
	OILJj0857LLly0n+tFzo5NbAuSW6fH46d+avykw8uqpSOKM9tmjUwgp/+k3N/vada/ICSbM9iFI
	qhKfRug8cNeCeX0djU8zt7QggwkmwHgojVJ7OYzXjFi50mzF3uUR7bNoWa906PUnjQe5JUlguaH
	v7wqTMfCTub/Qys6XHCgiwLrEhZ24oFX/RV0jKS2qRpF1Ex3Dtf8I7sJxmxF/GoEU69al3A/oLH
	rgc9Y2+sE+QMlL92l24KjH2BvZnfcNY=
X-Google-Smtp-Source: AGHT+IH11Gn30ZNT6Y69v5V/iRxE5A2dAA5roGdJuSulNNNyJ0JwndcIHeupcLdn7JFSuPNDoRyN0w==
X-Received: by 2002:a05:600c:1990:b0:435:294:f1c8 with SMTP id 5b1f17b1804b1-43668b93834mr341817175e9.28.1735924966014;
        Fri, 03 Jan 2025 09:22:46 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b214sm528921215e9.28.2025.01.03.09.22.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 03 Jan 2025 09:22:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v7 1/4] tests/qtest/boot-serial-test: Improve ASM comments of PL011 tests
Date: Fri,  3 Jan 2025 18:22:36 +0100
Message-ID: <20250103172239.18562-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250103172239.18562-1-philmd@linaro.org>
References: <20250103172239.18562-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: KSnTBpTYADeg

Re-indent ASM comments adding the 'loop:' label.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
---
 tests/qtest/boot-serial-test.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index 3b92fa5d506..a71d2857807 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -70,18 +70,18 @@ static const uint8_t kernel_plml605[] = {
 };
 
 static const uint8_t bios_raspi2[] = {
-    0x08, 0x30, 0x9f, 0xe5,                 /* ldr   r3,[pc,#8]    Get base */
-    0x54, 0x20, 0xa0, 0xe3,                 /* mov     r2,#'T' */
-    0x00, 0x20, 0xc3, 0xe5,                 /* strb    r2,[r3] */
-    0xfb, 0xff, 0xff, 0xea,                 /* b       loop */
-    0x00, 0x10, 0x20, 0x3f,                 /* 0x3f201000 = UART0 base addr */
+    0x08, 0x30, 0x9f, 0xe5,                 /* loop:  ldr     r3, [pc, #8]   Get &UART0 */
+    0x54, 0x20, 0xa0, 0xe3,                 /*        mov     r2, #'T' */
+    0x00, 0x20, 0xc3, 0xe5,                 /*        strb    r2, [r3]       *TXDAT = 'T' */
+    0xfb, 0xff, 0xff, 0xea,                 /*        b       -12            (loop) */
+    0x00, 0x10, 0x20, 0x3f,                 /* UART0: 0x3f201000 */
 };
 
 static const uint8_t kernel_aarch64[] = {
-    0x81, 0x0a, 0x80, 0x52,                 /* mov     w1, #0x54 */
-    0x02, 0x20, 0xa1, 0xd2,                 /* mov     x2, #0x9000000 */
-    0x41, 0x00, 0x00, 0x39,                 /* strb    w1, [x2] */
-    0xfd, 0xff, 0xff, 0x17,                 /* b       -12 (loop) */
+    0x81, 0x0a, 0x80, 0x52,                 /* loop:  mov    w1, #'T' */
+    0x02, 0x20, 0xa1, 0xd2,                 /*        mov    x2, #0x9000000  Load UART0 */
+    0x41, 0x00, 0x00, 0x39,                 /*        strb   w1, [x2]        *TXDAT = 'T' */
+    0xfd, 0xff, 0xff, 0x17,                 /*        b      -12             (loop) */
 };
 
 static const uint8_t kernel_nrf51[] = {
-- 
2.47.1
