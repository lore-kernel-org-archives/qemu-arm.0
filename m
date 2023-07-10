Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp1351220eje;
        Mon, 10 Jul 2023 10:51:12 -0700 (PDT)
X-Received: by 2002:adf:ed43:0:b0:314:14be:1004 with SMTP id u3-20020adfed43000000b0031414be1004mr12865536wro.63.1689011472247;
        Mon, 10 Jul 2023 10:51:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689011472; cv=none;
        d=google.com; s=arc-20160816;
        b=zaOEautn2EhOf5XCcIdwsrgE+hgQfuPE4NkX1WHGORSLTY1hjVRPTDiyqDEFphu8U4
         4sFwgOpBTQS9LDpqN12RoNoQj6+Ya4DXuwv+htcmS6h+e0+QQWSvKl6XvzkWNrWc9unY
         cVY6Q/Wc6NnHBNXPimlEHzcFa0QU9SDIyQOvqVQiqxyP7fO5HgmH69ruDT/2BgFa0r6h
         cwjOuyr4MUcG3A9wc2uA1zCzKoDI380nDgVzWnVaK+mns56E5HfXTiocOf6WrjS+arIf
         XqFcNwZHbbdl+jaJCtmYkC09d7MtYC80WU1ofdJUfw8ITGXCOMiEj7Kp9GPtGcYg1X3G
         eT7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3N6F5aMrOUR9NN4jQ1KnUxsit6lU8XCjQJ4gcKL1MRw=;
        fh=4TWVGTMFk+XB48cTX7H3L2FEUZf3X6lSQ5h15kr1III=;
        b=umg7aJVSnqM+I9638PASqMY08kaqcjUxuntd+vtWVAQ46T4/dy899bXwjUl3g6hIG7
         gwxVSio0joOGk6Sruwf19MQlVQzhYbiv0WxKHUsQFgnnyepnZG1CIdEZNPQOYgYLYXgg
         wTKK6oTXqKiupdWPjb3v6nk4TI9wyptUc9jc1Ue2TZNfZ5Pxq5eSPY9KD6ALHuHW3AaL
         dgHLFblJIFpe5c69eRVc06Bc/BB8HGDjMfFFuipe/8OhxEAxsSIQ6oIVzbfKm2EAird/
         TtqJXSycfh9l+GVjr4ZiNZPTkv1uxQKrkL0Dx9B/z5pScPAPDQsKA7PcCzymAsoYMtu6
         RR9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V6m1EVPS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g10-20020adfa48a000000b003145603b062sor10996wrb.9.2023.07.10.10.51.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 10 Jul 2023 10:51:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V6m1EVPS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689011472; x=1691603472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3N6F5aMrOUR9NN4jQ1KnUxsit6lU8XCjQJ4gcKL1MRw=;
        b=V6m1EVPSeqCVWicO+/rHjnCcNpkhEL/iqv2RogAXrTB1U7YrydIjf4GrICKB95LUt6
         dmVndOyKeDp9ipw3v14498l33bPCm18TdAV8oJWPCi9dIma6Fzsmje4pWLuZ9RA1vUQt
         hoH80iBQYE48fJzeou89Wpv28rCzjlWI7V+affJwiV9sdxBF8Kwgr65ZBePTaUsXtzBS
         LFmTrOxCTe79GlNIc0732nFXNZHb7UYGoaE/nYjlBX40LNxDrsUfWx8rVPxy2s4nWbT+
         SqMREOy02GAhdeHXABjkj7SI84cNaYIKdV8iauriivt6oBlRo6k9VPxPBYym7qw2j8VF
         pzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689011472; x=1691603472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3N6F5aMrOUR9NN4jQ1KnUxsit6lU8XCjQJ4gcKL1MRw=;
        b=AZQoeH8jMMeTKMMfxdOMXVfEtuqJp6PJxOlX2XBmHPhVaEuBOaoiJelx0WWi1Q4enm
         jbHkZr8h4AaU4q2fDY7+4TkhVwVcxzDQjQvmBYVk+EM01iIJVLZ/C9qSxOYDcz1KzLs/
         GM87/tlRlAmFDe6ZXoLzXaw6hC8o9wLYl94MEsJbJmN3cy5E6plwmSHAPR2l05abgMKu
         OYEeHaWMOcFqyOEfP0rEM/VER81WOKQ5duD/JcLSMNKT+89lmbt5Gm5YHJqHH4GGj4rd
         itDpSVLdhIYUQlbSOI8J+1J9gmHYAwgwGwDGk8mtxIPA+uz3NMuLgWh9+ARHev8yc0kD
         Izdw==
X-Gm-Message-State: ABy/qLZfKRQ2HKHf7Hut5WvIrZ/7/Jsl81a/O2dbEV1lebXPIMhz4PpJ
	IB/PS7eWJpYq67NG8obxkloorJs1
X-Google-Smtp-Source: APBJJlEMKhigl9zNVvFziIhj5wOws/JGU3Th/RSu6I2YRCeySmK5ZXEtsWfqvzp6SIW6Npv5GvbNFQ==
X-Received: by 2002:adf:f602:0:b0:314:34f3:10af with SMTP id t2-20020adff602000000b0031434f310afmr13287777wrp.14.1689011471834;
        Mon, 10 Jul 2023 10:51:11 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (mst45-h01-176-184-47-225.dsl.sta.abo.bbox.fr. [176.184.47.225])
        by smtp.gmail.com with ESMTPSA id f14-20020adfe90e000000b0030647449730sm18811wrm.74.2023.07.10.10.51.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Jul 2023 10:51:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gavin Shan <gshan@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 01/11] hw/char/pl011: Restrict MemoryRegionOps implementation access sizes
Date: Mon, 10 Jul 2023 19:50:52 +0200
Message-Id: <20230710175102.32429-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230710175102.32429-1-philmd@linaro.org>
References: <20230710175102.32429-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: uT1mcwe+JMBS

The pl011_read() and pl011_write() handlers shift the offset
argument by 2, so are implemented on a 32-bit boundary.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 77bbc2a982..73f1a3aea2 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -358,6 +358,8 @@ static const MemoryRegionOps pl011_ops = {
     .read = pl011_read,
     .write = pl011_write,
     .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl.min_access_size = 4,
+    .impl.max_access_size = 4,
 };
 
 static bool pl011_clock_needed(void *opaque)
-- 
2.38.1
