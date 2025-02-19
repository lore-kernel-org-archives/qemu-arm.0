Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1628107njb;
        Wed, 19 Feb 2025 13:09:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX/yBEMBZmMYwFPbXwK/5VzvHr7MP9MeKfT/3EZ4yKa/+Ww2Lv7yEt66MGzFVG05OFNnHQXGZQ5BPv7LQ==@linaro.org
X-Received: by 2002:a05:600c:4ecc:b0:439:9f97:7d6c with SMTP id 5b1f17b1804b1-4399f977ddfmr31644675e9.29.1739999362617;
        Wed, 19 Feb 2025 13:09:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739999362; cv=none;
        d=google.com; s=arc-20240605;
        b=ESCwt7MGlEDTAxHMsf7GQQIOtjfFIT2VQizI53hZaZMZnrOMhMqm+Uomrptd6Ojyn1
         ABoMBp5c4Zo70NJpU+XIB2kjvmzgsYj5ZOR6Uaz3s1w+KZzmkJWIadUosXoMIaSU0dzr
         2QulEfNPvQuqvi9/E0CaCv0SrpcqwbT5kJwujNyby8hSh7BV/+OVMvzk5+YEmcsPs5sX
         TKaKQ3w6gN0G2SiIdCGjKK08pcAyw1jHSVNbhw0GfRi8Utep1zu6fVzSXMlKhsTaE7vF
         yROKN8RCnLn4XXgmAwm4DJmAvxaW7UHm+HiXfIdSmgc9LzQaKihBME62OntXECWIeTkS
         dsww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ncwU6cIOgR/ePA4sESjtym4cDIkeSMiSmL8ykeDbSSE=;
        fh=ozKfRHSvfurvKMOpdBh16mwTW+Y9tz9fEs29ysO1pDY=;
        b=Y7Vc/Mg6K+aau/gvpjNjt7ZByTNNV4DV1jnsGpb901zBlaKhQJr5DVw0CklIMjigXe
         bZvKAbOVsrzh2UFuiZvyACwLih1Mfgk4GKpGMz25IEJAQHN8GLDzvp0CetWbleYFvAym
         bylMUmkqq1QMsL8H0iHfZB60hdHPK5wP9eEIQ1W9bJPc6Y/hwWfnbL+MVmkmYhB65pdm
         Zlz6EJFUUv/XjkRilaS2E9m/1PmTI1k20nNd6qgp3xi4vmYOj8MwX4OYaEqM/XYeDb9R
         9Q/L5pYW91iPg5jrK85hfG9J1WmlMNgJ3DAEojHe+EMy0CLD8OJ7hMzJI5OKZTTvgixs
         6uWw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HRM31yiW;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-439832ae264sor32007125e9.2.2025.02.19.13.09.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Feb 2025 13:09:22 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HRM31yiW;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739999362; x=1740604162; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncwU6cIOgR/ePA4sESjtym4cDIkeSMiSmL8ykeDbSSE=;
        b=HRM31yiW7wzAC7xQB0AAqJDmrik1FIUm9b9to7cR/VK04hyOZVm/YV6N6Tvdf33Ho5
         AjTwNngoIZeEf6JVFhdhyX+QYZbOFkjW8UG1kgwco9gOPB5YUITVWxBc/HgQY4L20tAx
         zEnUg3P/d9fKqOcd8fol1X0IuImonjwYUh9qPrh+AnCtt9xsokFFqHULU+EeWPEa3Kbg
         YXKYwJX4gol9uXgcf1H4ehLXxlerp/P1MMxnoR3J+qplSz8V5hGv02xjP2OHqTYk1q05
         yHLApKsDNJrDtdVCWJnd5aEE71diU5h+QBco+28SQhWeILWIv8nzoaZwRKVQI6rFC3Ku
         f1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739999362; x=1740604162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ncwU6cIOgR/ePA4sESjtym4cDIkeSMiSmL8ykeDbSSE=;
        b=p3gIKr9M0SiTq6JKObOwz8KQ3dPffHdyvZXiFvpjxpdqi9lksV0oobFe7zT/ZsMfpu
         1iomorKbO67/xAPvDUzMgcCRNu7jalSRVylgLO9sLDUrlqDBw8JgVXd8LTbKFDJoEy/d
         fvzkrDs1k9ePVrYJNovzYSuRtSceuJH3AzL6O/1S+feqFEt2VMG4u5Q9FtyRitX+on0G
         cGbyaaarslavCbnkIjRlWgT3xVtEkCQdDRGaEeaEEKKGmkle5YyFqXq5GevmG9DoC2B9
         9Neki3GGKO3pqYNDwJNyjhHYtJwlmh3iV1vqNG2R+FrBlIib5lXqH4XydxQkJTHpkUEC
         pYtA==
X-Forwarded-Encrypted: i=1; AJvYcCURdMj12ZmwmgXxJw0ztdOvEO/4YeCPAvrObGPrQftKJ042jQHWX0//IqDNBeD2p4d9b5YlQVJ9wtIVXA==@linaro.org
X-Gm-Message-State: AOJu0YwO3h0C7Y9Vk5WFfXUjNLl2xksbsGXwpAI3GnuwIwr5JJabAjdH
	Se5PTEceED62e8BfTalDPrBA08lr8iHcisHeg/Rkv/1/lZT93v2qBm3eknBIEQFCUw==
X-Gm-Gg: ASbGnctuzU3C4IKnkG0yh6CJIcx5LfTCUsccJQ152yJbkwCrAqJ0mXGCr2tPdMpA3tT
	8ddBAVB71nw1b6q3t+8SMoXHfuB5RPnoiYkFkDNG1YaUp6xw0Dsj6UzK8zSpMoS23tNK6l2VUxB
	V8DEOd4BsmILft0ykQ8kazNZQSMmOXf+E9u41lkOSO20gg+MDSj7BhvnTSYxNoIatGRoapyeTRu
	wXZz4jX89zK+VWFhm5QWYQzSdEijhyXwWIIUNgiQLmDLBmlZciZS1xpJag7eLEIGWJ0u7RtFlSi
	o0OaePylyVFUvFMISJehp2WUdIe/otV2PX4L6eSGgh+LOfdYGDlTzfGCGxZBg+mwSg==
X-Google-Smtp-Source: AGHT+IHLn2DhGG+7Yh/k913XG4CFtz456lhGRiGEqJ6Nc1tDG2VfSs35DS+XKl2GKFUDG/NXJIFQaQ==
X-Received: by 2002:a05:600c:3591:b0:439:969e:d80f with SMTP id 5b1f17b1804b1-439969edc14mr76162405e9.31.1739999361993;
        Wed, 19 Feb 2025 13:09:21 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f7987sm18500465f8f.87.2025.02.19.13.09.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 19 Feb 2025 13:09:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	Rayhan Faizel <rayhan.faizel@gmail.com>,
	Luc Michel <luc.michel@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <huth@tuxfamily.org>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH 7/9] hw/char/mcf_uart: Use FIFO_DEPTH definition instead of magic values
Date: Wed, 19 Feb 2025 22:08:39 +0100
Message-ID: <20250219210841.94797-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250219210841.94797-1-philmd@linaro.org>
References: <20250219210841.94797-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Z3BJwuQakJ2I

Defines FIFO_DEPTH and use it, fixing coding style.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/mcf_uart.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/char/mcf_uart.c b/hw/char/mcf_uart.c
index 980a12fcb7d..95f269ee9b7 100644
--- a/hw/char/mcf_uart.c
+++ b/hw/char/mcf_uart.c
@@ -17,6 +17,8 @@
 #include "chardev/char-fe.h"
 #include "qom/object.h"
 
+#define FIFO_DEPTH 4
+
 struct mcf_uart_state {
     SysBusDevice parent_obj;
 
@@ -27,7 +29,7 @@ struct mcf_uart_state {
     uint8_t imr;
     uint8_t bg1;
     uint8_t bg2;
-    uint8_t fifo[4];
+    uint8_t fifo[FIFO_DEPTH];
     uint8_t tb;
     int current_mr;
     int fifo_len;
@@ -247,14 +249,16 @@ static void mcf_uart_reset(DeviceState *dev)
 static void mcf_uart_push_byte(mcf_uart_state *s, uint8_t data)
 {
     /* Break events overwrite the last byte if the fifo is full.  */
-    if (s->fifo_len == 4)
+    if (s->fifo_len == FIFO_DEPTH) {
         s->fifo_len--;
+    }
 
     s->fifo[s->fifo_len] = data;
     s->fifo_len++;
     s->sr |= MCF_UART_RxRDY;
-    if (s->fifo_len == 4)
+    if (s->fifo_len == FIFO_DEPTH) {
         s->sr |= MCF_UART_FFULL;
+    }
 
     mcf_uart_update(s);
 }
-- 
2.47.1
