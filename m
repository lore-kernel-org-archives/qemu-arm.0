Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp853659ejc;
        Thu, 11 Apr 2024 03:16:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWtkcWHoC3YwD9hQnBl9eHK3/4VSoU8OcKmKCRXBuig7TyHU3qqK7jN6PJ+qexmTSr2E560jAXoQEFjKzPp3Olh/3P9mnxQ
X-Google-Smtp-Source: AGHT+IFDgYwAnMiGrwzY1+JeiuR8o+9kWhptTIgcGk9lZ7dEYp1HP3WVcgtgXxj3maHzyLrEI8h0
X-Received: by 2002:a05:6870:d607:b0:22e:a686:a940 with SMTP id a7-20020a056870d60700b0022ea686a940mr5315425oaq.43.1712830594044;
        Thu, 11 Apr 2024 03:16:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712830594; cv=none;
        d=google.com; s=arc-20160816;
        b=CGgl+MNdguH3GFAGRtWRxLrJKuqVxi0r6U57iqZt1NrbIF4MFU+TpR+RKJb7Dw6eLl
         ksuoyOGv26XU6i+IOqMqy3GRhWJJRQlt/h4vSErcohDG5Jmql+Gxn9vUrxlxxWrql+Qp
         YmpcA2F0Kqf7IUPS1S9ujvu+mw6F87KW2s+tY8Udf+cUO0eFyXAiP7PPkyKbh8rEzRBX
         QS8esLN3BeX4dRdZs7s3EeJKHypLYBUYQ2yF2dtRIXLfWc9tRbs8MNG69v7mnqa2ALzv
         /EptqbhtfQCM+pmQGtygGO0M51WVA5nX8CD9S+hNbAkCsq0CP5Voue+MAnRBrWfPmYJj
         89Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yioT4noxDvhbuL7egM0nA5pMTUC57Trd6rEmG3sDLks=;
        fh=nrO9NFjS9xx3FpRrmsadTA4JiiIct2qNO2tpnCWPNVk=;
        b=PmOWoBNjMVyq79wrYBLrsPvgngPiQWBStQ21tyDUU33ZP/y2w598i7cfTruqaspcuT
         /Pw3kbG07j6B9LUZc3g1ptwfyBBxIEhjDeiib/3DK14sUNSpf19Eoh1w2Z/YjUdMUshR
         haGvTSbPCOW+7tHEoz40T++bER+Wl+DfXr0RE2Rv91e/vr4LLTblqhJ7VNBYSDyCb+H3
         QWupV2d3Aw6IL4uqeWLCGTM1Ity0kzcrqqbrSAk+KuHkyh4u50sEJiSAZYAXoqK0Xq4s
         RZHYMX/OlYz+1XdEnapUJSWNk8y/62prvBoh4zWchO4LrkqlxV6gn4ZJCqTL/QYdlYsF
         Gl9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RXlA8Nqf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k20-20020a05620a0b9400b0078834ca5fd0si1209162qkh.188.2024.04.11.03.16.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 03:16:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RXlA8Nqf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rurTm-00056R-7C; Thu, 11 Apr 2024 06:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurTQ-0004xJ-7R
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:16:10 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurTN-0007SN-2O
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:16:03 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-417d14c3426so4556875e9.3
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 03:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712830559; x=1713435359; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yioT4noxDvhbuL7egM0nA5pMTUC57Trd6rEmG3sDLks=;
 b=RXlA8NqfCIRGixF6bIle6C3AdW0BdiJshvhBe5wRA2l3C552fBE9NNQL/nKckc1gAK
 zunU+pnppiCl1TCioE9iP3M5U/kgM4FEky0qnrFsOM3lWKNJMfoz6fffkpCzK9H7nCnk
 OuUpM3rbjfkjxsOACd8jYbIzhMBPaF/Mm8IixiKqjZxu3F6hECQ771mWzFvyKWfqa+2D
 wy8s+by1GIC/FkvQO2/1fZ78QvYRIMoBhBS+SkP0BuFuzHtwYgTyWweoQrwFNoYa8w5D
 TNXurcnEGIgrHTtexlgWmVx/A1Lf8Y7+RaaPCCq8BVa8CEyXMwrEbUMplz1d4QAt1L46
 paFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712830559; x=1713435359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yioT4noxDvhbuL7egM0nA5pMTUC57Trd6rEmG3sDLks=;
 b=EiRGr9gP9scs9wK6Lav0JpbtyEHpGc9jp/3kICQWwylhn93ubGAuKJf3oooNCswf+l
 hhVXfBGUDWP758g65PNj4Kxiuvs16OyrlqCGdwcyuqGqmTDujegSVkn4faN1nyVapgHh
 IB4jBRaG1rozH5NngABqndhnwkx2ocG6YZVAb5xKmY0j8vAOdq5YzcX38QW770pJte6V
 AM+rTck7z3ZKJEzsSb4SJEtVikuWk6vaJIaON7mOt/YhpyEa5aWwW3f+HnTFOLjKAwHI
 /n3t9nMAGMsLxndneWtmB1iteS5/hit26Ro5EWFnjfoLKXqHT+YMq1SCSBv3AJK6/7pA
 zdmQ==
X-Gm-Message-State: AOJu0YzrKHp02lRcSLNTkBnbAtZ2LbHbne5MUZIbycF3jGzgL9abLZ6q
 9MERUPrtkaHbypjhFyU+70UhjbSB/kS0tqpJbkL8Bid+vSgPAcAC4mGA4xLae6I=
X-Received: by 2002:a05:600c:1d8b:b0:417:e090:4772 with SMTP id
 p11-20020a05600c1d8b00b00417e0904772mr654387wms.34.1712830558952; 
 Thu, 11 Apr 2024 03:15:58 -0700 (PDT)
Received: from localhost.localdomain
 (137.red-88-29-174.dynamicip.rima-tde.net. [88.29.174.137])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a05600c19ce00b004162bac1393sm1848952wmq.43.2024.04.11.03.15.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 11 Apr 2024 03:15:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 01/13] ui/console-vc: Replace sprintf() by snprintf()
Date: Thu, 11 Apr 2024 12:15:37 +0200
Message-ID: <20240411101550.99392-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240411101550.99392-1-philmd@linaro.org>
References: <20240411101550.99392-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: /dUUIIciaQU0

sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
resulting in painful developper experience.

Replace sprintf() by snprintf() in order to avoid:

  [702/1310] Compiling C object libcommon.fa.p/ui_console-vc.c.o
  ui/console-vc.c:824:21: warning: 'sprintf' is deprecated:
    This function is provided for compatibility reasons only.
    Due to security concerns inherent in the design of sprintf(3),
    it is highly recommended that you use snprintf(3) instead.
    [-Wdeprecated-declarations]
                    sprintf(response, "\033[%d;%dR",
                    ^
  1 warning generated.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 ui/console-vc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/console-vc.c b/ui/console-vc.c
index 899fa11c94..847d5fb174 100644
--- a/ui/console-vc.c
+++ b/ui/console-vc.c
@@ -821,7 +821,7 @@ static void vc_putchar(VCChardev *vc, int ch)
                     break;
                 case 6:
                     /* report cursor position */
-                    sprintf(response, "\033[%d;%dR",
+                    snprintf(response, sizeof(response), "\033[%d;%dR",
                            (s->y_base + s->y) % s->total_height + 1,
                             s->x + 1);
                     vc_respond_str(vc, response);
-- 
2.41.0

