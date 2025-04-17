Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp1115748njk;
        Thu, 17 Apr 2025 17:02:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXRnURGRmg6PM9+wePxMBte0nq2NSUKq5cjxsX04Yb+9c2bdhqF85j8AhWV1089Sz21MLyYbCy1i/ZRKw==@linaro.org
X-Google-Smtp-Source: AGHT+IFz9eq3LEWBa3FcGttEELUrcpwu8RuQtKk6GE2iA4TeXJd03eN4Z1kX9TUn8EHOSuxB3QGT
X-Received: by 2002:a05:6102:22e9:b0:4c1:a049:27c7 with SMTP id ada2fe7eead31-4cb8014e97emr966111137.13.1744934532918;
        Thu, 17 Apr 2025 17:02:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744934532; cv=none;
        d=google.com; s=arc-20240605;
        b=ljS/ntCMr3VpKbs3KvUqvVqGwiKgOElfe2wMXRWbeU62/OqoM7Gpl5Lt3p6J4xq505
         HrNqXc0xVVmizgzbGCIgsjKIvJi+jOAK8SsV9vzhFFolFhRc3xLmUCCen8WzvdsY6mKP
         dDHCjju2jXJ2P/Wi1i16zcDA64KnuQdNdrOye/ypFk2xfBo0eEI3E66UV4qAVSDb3DVS
         eoZacDjXcogryg4yInDa20geWblYDnZq9EJV9Jj1isa0UDVKEgZnnqx28UuLozedlm74
         xOYSb80S55LyLiCrheC5Q2Lal5lUM+syGmCArQoAR2KwSLRrIV+lj+3VMWDPeBHBHn4t
         lQNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JwNdCVQK4SCHhqiHgDn0u2GpHg+WdyoIk2s3HtNhdH8=;
        fh=7HNSvDcu6Zgxfrh9VMGZw+eLHH3RkTElbwUBs1QRNag=;
        b=JQ0HoPSmo60gn5JEBOPWeliwaFFSt+IyFBw/QwWXgsWysXUNQrxUEM9CJ6xg+jp5uX
         xSz7moyZpsbOJBzyCT0G/kxNV47PktHYhIUwpsBkW2EefdrCmPzYfmoFnoPPtvEJ+K/z
         8u5zhM6D6DQ3ZO+MwVrjw0oaZweCs719Q1ieGIGGandFKqM6FEAswl7MXKwewf/1F2W6
         Ljv325e7kMkgk2AQX0sNVHM/GNGu7KHLYZEkfQilHl5UThIacbW90/Y1mlQCRiHZBeQi
         sVspOWh+wNg/SymjizW4lsmg2DvvAdaxvrdthIZj3bAqHrBXMlB9tFyYTal8sm3h3Gda
         nwxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CMfc+wPP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4cb7dec1a47si419447137.268.2025.04.17.17.02.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Apr 2025 17:02:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CMfc+wPP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u5Z7s-0006qr-K3; Thu, 17 Apr 2025 19:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u5Z7n-0006m9-Dz
 for qemu-arm@nongnu.org; Thu, 17 Apr 2025 19:58:31 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u5Z7g-0003nd-V0
 for qemu-arm@nongnu.org; Thu, 17 Apr 2025 19:58:28 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-39ac56756f6so1368686f8f.2
 for <qemu-arm@nongnu.org>; Thu, 17 Apr 2025 16:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744934303; x=1745539103; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JwNdCVQK4SCHhqiHgDn0u2GpHg+WdyoIk2s3HtNhdH8=;
 b=CMfc+wPP1hV2v+nhzRNG8aPPWaCzFaCnBCyTsYgyuai+m+tSaVswu2aBMwV8bPq2Gv
 sPKV3jcadd7SSPEZgDgxLQjNBklNCqQu0HAnjbJ3TWA98XwF6opPi2i1DJArFHfJWcyH
 jQUObieQadHb8YKA98CmoN1c92YIDXQ7FQ9g65R+zZqZn4OC6z8jR2C35FUQAJZhjA9v
 VcRAE9fI8EGtvHXfiMA3ZWBtQsjhIts7zUyajKn1GZQhcejZVENZdBHnLOp7aYApb3PK
 BPOUPV1A2HA6MZU7oDvvVCkH+HfAsICBh8vneG/k7vXj8DOA/MZOg2/PZjhVwqs4TaSF
 YDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744934303; x=1745539103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JwNdCVQK4SCHhqiHgDn0u2GpHg+WdyoIk2s3HtNhdH8=;
 b=fT1aRK8vNpix2rQr8Mk/kt321R6u8ugw+nOffKj7PnDnMtiAlOxYo9gH4I6/2gjZ3a
 uOHsy8qfWNDdzglFeV/Pb67FAUttu4UdVOh9GrGPuGJObacn3E0mWxoSPlcgeEmDY/Mb
 qqMpM3YUQpjIhA9S3TXEVw/fBu3hqPtlUggQG0aJg3KW9M5YT5uUJBtx0zETbNAri8OY
 vfmlCxbMNkguoPeowm2U0Gqb2PT7e96dOe1mK3B7umcgcWl6N1NlJCQvpUfLIL8WHkub
 pwqnkjtkcsyXLdNS3Ak9e6JzVOEVVirrE3z/rPtE5XUUEaLTJU0DviCx/BvDfZMVanWm
 Uj3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpq4IvsC+yaEBEkEtPYLMUh76ArFBWOoRJkndeathYRe37GG09Sy0cnpq1tgx4l1G14MqTTixkEw==@nongnu.org
X-Gm-Message-State: AOJu0YxTgPQWMav9+SWU6IfCwBlMLuG3g9oNntOJEPg9co00Fg1LgVxO
 QoQ25rUIBuCGHAjnV0JGlGcczJBtPE6lf6rn8P3WsJtE3WCZGa8VEVWx/8wpAnU=
X-Gm-Gg: ASbGncv6YZU6sKYt3U6seEG8zJyTQU2HHMcWY7etubtKnvgRK+vitdM7OLK/1By47gt
 1OZphXci2OElzN+iBP3NYDLeMo2zWW1G+s4AOED7b51x4ntRPe9qndEKmPDyKLZQZrFx8yOlm5i
 XI+hBfv9CjloaIXBPTOj44inGqKI9FKS4Z7Yv54V8PIda2/I1HV2cbJusm6A2yQ1643PVOxz9ch
 QAg6jZKKYEnZzQcDcKfanfRmnqUQSB5dBSSVI3R9VYmO+9tHJQnQRTdckEpWxMRpkCNMXzQ+KIY
 BCnsUV1z36rWHeYcS23yj6vqfOHouPpx+y0iKviD61XVkoJaBk4JInoAJDi6PAwCp9+5x7l65sC
 hZanm9hSqPgG5+4fUnwSi
X-Received: by 2002:a05:6000:250f:b0:39e:f51d:9cf9 with SMTP id
 ffacd0b85a97d-39efbb01f56mr501047f8f.48.1744934302803; 
 Thu, 17 Apr 2025 16:58:22 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa421c79sm1074033f8f.1.2025.04.17.16.58.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 17 Apr 2025 16:58:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Felipe Balbi <balbi@kernel.org>, Bernhard Beschow <shentey@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Alistair Francis <alistair@alistair23.me>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH 01/11] hw/core/null-machine: Define machine as generic QOM type
Date: Fri, 18 Apr 2025 01:58:04 +0200
Message-ID: <20250417235814.98677-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250417235814.98677-1-philmd@linaro.org>
References: <20250417235814.98677-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_XBL=0.375, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: N5Nuj6xVwRLY

While DEFINE_MACHINE() is a succinct macro, it doesn't
allow registering QOM interfaces to the defined machine.
Convert to the generic DEFINE_TYPES() in preparation to
register interfaces.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/null-machine.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
index a6e477a2d88..1ccaf652eb4 100644
--- a/hw/core/null-machine.c
+++ b/hw/core/null-machine.c
@@ -42,8 +42,10 @@ static void machine_none_init(MachineState *mch)
     }
 }
 
-static void machine_none_machine_init(MachineClass *mc)
+static void null_machine_class_init(ObjectClass *oc, void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "empty machine";
     mc->init = machine_none_init;
     mc->max_cpus = 1;
@@ -55,4 +57,12 @@ static void machine_none_machine_init(MachineClass *mc)
     mc->no_cdrom = 1;
 }
 
-DEFINE_MACHINE("none", machine_none_machine_init)
+static const TypeInfo null_machine_types[] = {
+    {
+        .name           = MACHINE_TYPE_NAME("none"),
+        .parent         = TYPE_MACHINE,
+        .class_init     = null_machine_class_init,
+    },
+};
+
+DEFINE_TYPES(null_machine_types)
-- 
2.47.1

