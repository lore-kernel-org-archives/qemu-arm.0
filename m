Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2918717njb;
        Tue, 18 Mar 2025 06:16:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUx39KarFn0CRxYcjesxb9IqS+wdgaR/awWgixROpMSMJSMdHfKK2jK6ZjVsgX0ejlXVpim5VuJWp0Hww==@linaro.org
X-Google-Smtp-Source: AGHT+IG+NvxG42CrPFLS29O1DNFxtqX2HHY0BSKaAp43HNjJvS5eEdiTcQ89G58DQuiRcNM2ZwNh
X-Received: by 2002:a05:6102:510a:b0:4c1:9e65:f904 with SMTP id ada2fe7eead31-4c383237196mr10420493137.23.1742303785112;
        Tue, 18 Mar 2025 06:16:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742303785; cv=none;
        d=google.com; s=arc-20240605;
        b=XUFCM7oY3wnywUQUW022IG9xGR3jGelOiIEBHvNXK9AWUa2D+UggAuJ8NV5gxqearT
         WuEsvM0ctbwuDifuFYElyT7qskSk3FA+78q0Ctn3hR1vsetYitUJSeIaJO083Y2g9yKg
         Y4JyfhkbhTNMdpzBFyDYf3fUpyCI93ac6NgNd+EDRmoDL2jmBxTIbXLa8VuhSE9ZWwgR
         /ZUaj1QFXm912q5sVixp7qqmoHmtzBBRVw59qrL6zhRUDzmzOBob0aZwk+pmaa5CGqpL
         NcGSiunAX8Vc8KHXAItXRK3JbSKhRkie8hj8yNP1l3mvxY9/vBQ1hJ21eHLtdORdyiQJ
         hdGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=thjTRy17yqeXC7hJLQ3q6JhWsNnlTRLfGO55CMsgDr8=;
        fh=3rVXQwxu/Ety03nQymxcFcCpR126udX+WkvQywSbGsk=;
        b=EFcFrkXjUAUtLDxAqWT5kGDL+hNhf45qQA+fcr5zXZoyjfITyqxCSkzg847qr7txlB
         J9xCsoidsWlPZlPN7Y4RQq4fZBSzk802hXtWKv2fb17nxFFKMVsPaXLwZ++warcDu6zz
         ohlh/faylUQvCRDVAzVAubyZ3IukZtJY1YPzqKIx2oPu+1FqY0eSlTt0N4x/PgUHIdyO
         grq1VwXymzZYlpGGBfOE8wobGIoSTCknesVVG0zEeWWOZRVu4gUoeLaYwjmxf8kGtbMj
         W7kMOcKfGtDCxmQTxovjcK50aPLI8nQ4ZWfzSFdHp2opa2Y1H1AuSLsMBmyE+Pl9USd6
         qNUg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=c16QddkD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4c374b19103si3000211137.607.2025.03.18.06.16.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Mar 2025 06:16:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=c16QddkD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tuWlo-0005M9-Ra; Tue, 18 Mar 2025 09:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1tuWkL-0002qF-LU; Tue, 18 Mar 2025 09:12:42 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1tuWjw-00041J-Ur; Tue, 18 Mar 2025 09:12:18 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ac2aeada833so1094994766b.0; 
 Tue, 18 Mar 2025 06:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742303534; x=1742908334; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=thjTRy17yqeXC7hJLQ3q6JhWsNnlTRLfGO55CMsgDr8=;
 b=c16QddkDenQayHHAkLf4oa/Ls3DNBZ5JfApZeHj/V2E0Y2J8eD9sGFdq1Z3OTi8pDI
 gfO8mv0Q1bEm940+KnuoJqFUa+CNnsEyi7V7zj5CDJBLdlWBM2p64ppTlAS9KQG9+P77
 Y9Opm82OFHCCTcxOyOhWdLg+5WWG/diU6TI6IXj7iAZHehYE2/KW5+VmNlQUodxjtmPt
 ttMzliMelk9ToqoFzD0H2eQ0qul/d8yD92oRcYGZcSxnASe0a0YOj5EhOl6VQhWniWwI
 zu2Ku3+cnfWUFaceoIqvywl3DYcZ3OzSnG2lS1/rFs0Iz4A7MiImlyWBqdTFIRhHzctL
 4C4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742303534; x=1742908334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=thjTRy17yqeXC7hJLQ3q6JhWsNnlTRLfGO55CMsgDr8=;
 b=ihZGBnKh0RY+FlkcP/jWabFC+tRTxv9vX+m03OcY7AfbvO/7MVHXECvbYEsZDNkifr
 MQXOomyp6fGIx3DNyOSCUXL5rX3dx4URMR3IjRa7JkMrlv8jlXoiHzChnySUPlm8yYTW
 X0uBUL0g9GgXN6Jg67OiUIQgrqlmRgHAURNx79HM7ewrm+iV2G2R93l0878Z3zO2FTP0
 xSbuScajiN+KnXrLgSmWi+0ClAQp+syc8TrILyX1kxoS0wTGtFWY46byWxh8tDeioDTe
 nWJkg7ewtyLmXmwDMvuvO23fuV8Vs84kCiG1Cqz7/6M4CPRxLpVA3SRQKl5dmev7wIhK
 +JPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCcFoDcauZwi0PMZs+9gNH+H3FlZFTEZGwfnxa96IJ4UBUwTFkSi91rsq4qhqnUygM20rjmuqu+g==@nongnu.org
X-Gm-Message-State: AOJu0Yw81DENe321HmPsbfiwijq4kth0S7Nas+NtY0+XHNl3P2vx5tt4
 vFIA01ACxtljrvpyccrbu3GxpMw+TcNYjTdgC9EDz1cR8YMsgz6ddE1fvlgN
X-Gm-Gg: ASbGncu7SrXm9MgM27VWX5Xol04E0yNqO6bKAZD3wodMU47ULqBYANYzFWpO+/MRrW1
 7Zw/3F0txkPdO+2HHjuN7sgvdnF96MgslTBdsbYRz6mVZwmRMX3VDoLlQKu0lE68coyvzF9h9w4
 PNkD8iuXlYj2VVSLD+PezzZwRk1tcf6HpWHSVoqmUJJCjaeXptlam2a3OY/oJUJ+2bABgN2H3sc
 xuR4PonFAvzZE0e4BAGxNCvemuiTlxPl63mLVxM71DO7THOziWHH5RS3OsSEi3KSMMB1vRoN4o5
 6UzacxHc8BOT/W90k0gN4SpI4lWkZREAzsFbyyUK3T6Y5zXY47nw1weuOE6z10QB9/OCwK2m65D
 Ibg==
X-Received: by 2002:a17:907:2da6:b0:ac1:e45f:9c71 with SMTP id
 a640c23a62f3a-ac38f709234mr314946466b.1.1742303533896; 
 Tue, 18 Mar 2025 06:12:13 -0700 (PDT)
Received: from corvink-nb.beckhoff.com ([195.226.174.194])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3147f3101sm850678066b.69.2025.03.18.06.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 06:12:13 -0700 (PDT)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Yannick=20Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 21/21] MAINTAINERS: add myself as reviewer for Beckhoff devices
Date: Tue, 18 Mar 2025 14:08:12 +0100
Message-ID: <20250318130817.119636-22-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318130817.119636-1-corvin.koehne@gmail.com>
References: <20250318130817.119636-1-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=corvin.koehne@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HwSH/1UWK3Vz

From: Corvin Köhne <c.koehne@beckhoff.com>

I don't have commit privileges, so I can't merge any changes. However, someone
from Beckhoff should review changes made to their board emulations.

Signed-off-by: Corvin Köhne <c.koehne@beckhoff.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8f470a1c9b..88d1d51e2a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -720,6 +720,13 @@ F: hw/arm/b-l475e-iot01a.c
 F: hw/display/dm163.c
 F: tests/qtest/dm163-test.c
 
+Beckhoff CX7200
+R: Corvin Köhne <c.koehne@beckhoff.com>
+L: qemu-arm@nongnu.org
+S: Supported
+F: hw/arm/beckhoff_CX7200.c
+F: hw/misc/beckhoff_ccat.c
+
 Exynos
 M: Igor Mitsyanko <i.mitsyanko@gmail.com>
 M: Peter Maydell <peter.maydell@linaro.org>
-- 
2.49.0

