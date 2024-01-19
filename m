Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp881054ejg;
        Fri, 19 Jan 2024 03:42:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLjBkJhuGNGDx5Nxmo4XqEz9cjsazMSdpZ7nA08dPY79WHhc8UmrGsDzoU9Wh9Ny9wwTxi
X-Received: by 2002:a0d:fa01:0:b0:5ff:5ce0:b726 with SMTP id k1-20020a0dfa01000000b005ff5ce0b726mr2476924ywf.92.1705664535103;
        Fri, 19 Jan 2024 03:42:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705664535; cv=none;
        d=google.com; s=arc-20160816;
        b=dkMBsHJsRIpNnots3gwyOxuqPgrkE6YGlGhBKAwEHkw8Fv+5PLcgF39CNreakusaZu
         2xbaSf302T4GbuK2mjMhY6qZvi7rI4dl0jqa7BtxN2CuIpLAe13y11G1+0HtBF/Puuti
         tRYZ7uX4ZF/zDopGoCpCix0jcR/6yZ+AhxbCcOIwv10E7u6GTtRMCJHnChtXUOLPWECY
         +zVjMduG5ALdA90voHqKpDeInCE98CXYEwEwK1U8hJlwqOcudTNZRiNQFxHeMRNu0YRu
         EwJOZ8T5ByHgZ3KbgM41cxc2UYOTNXYO+cgDwalcB5rU/XCir0tY5TVEHGlv8/CvT4cj
         yyxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lEBY/QoJw39gPaelo1yXBjmSZBtzyiV4TS+i3QbPQJM=;
        fh=W/Vb8UqRsnzMCYza0CrW1oUrBuUNh/GhSShrMZCow+4=;
        b=hIu9ET9rtVqDnGQ0o5rTNxApVnZJSM/8M1Tw4l4S/TXWrffp3zXvCD2arSyP6Z5aht
         pq96zoHCF5lD8BXusaCw1I8OdvirIecVkNPD2vkUKfoex+wxTEBMGJllVZlFh1ztO3SP
         XMgMKLg4L2F4JzDV2txPkH6r5Z9H630J/NhfpbheDc2aS9sXqCvSf6ChqwOQxHKYk9SG
         n7B3a7Ui+37+NtuTmJ85v9yzeAga6w2FPPEdXV8gZcYbArfpoxwQng8o/eYEz9FaonMF
         Jl/2JSIMhSlfP3GgPWxBqIac502Q2B0KJ6Y6XjIW7w3lEV2iopmmMKaWBuPNiNGnUD8L
         AHrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nw+dTagW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6-20020ac85d06000000b00429be28d592si16623407qtx.750.2024.01.19.03.42.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 03:42:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nw+dTagW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQnAf-00032H-42; Fri, 19 Jan 2024 06:36:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnAa-0002sq-N6
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:36:20 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnAY-00021u-W2
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:36:20 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40e490c2115so10781705e9.0
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 03:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664176; x=1706268976; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lEBY/QoJw39gPaelo1yXBjmSZBtzyiV4TS+i3QbPQJM=;
 b=Nw+dTagW1+d6LhKDba/gyndclCxvvQoFFz3LJR/KjY92aNF4CQ9oYOGcrhopwsZy2i
 M1OuBpYsTwB29K00ykYB7gP+2tvj/W21DKkPDUSQzlJXqrVdahY02Ru9ErI8rsO03M0z
 jGg9kSqVOVvbz61D57F7aDEspJh1hvvm6g3c5euD1H4vx5UXFR8W6n7wrscAY8nE4Zhv
 ZVVhofRhrRPgQFDa4C+U/gwQoZdyTgPEKc17+LUbA1T43++wQE8oz/GGJYhXU37Fo+4u
 F69OX4AhqoVSuyyq7SaH6mbTpdT7qLCcXK5A3X3DLyHpabFV3LZokoq5N+8wAjq3gA/7
 Uarw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664176; x=1706268976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lEBY/QoJw39gPaelo1yXBjmSZBtzyiV4TS+i3QbPQJM=;
 b=F6xGjn9q71kCTHt/2uuHWHwJ5f75Hh6fxgV7bQh72yBzSY6psZB+j+vGijJFIbLxER
 yQ9AW413TQxxgGb2dIvcBx6g/2TFq1tcQZfHQ27ZO+alndwf6CWU4XdeFagW1TwYf0D5
 4ls2U3bgIqG+oPrfB7KqLExCetj6ILnoWGXS5MTmau2OeHEVyrLG4vaEM93tIWdu9BuD
 iwQL1G1El9nIGaNoyJ/K7VCWgbcfFAi9GgsFu0lFikTD2AJh37ibE6WCmOQ/IZlKUPJe
 3D5/r0nZHyopUrEwfG+gmvwPeOYhPjoGNpWESlzxq4/rzQvInAxjnwn558tR/eXy6QAP
 MbIQ==
X-Gm-Message-State: AOJu0Yx9CXyCXwwItI5A6ZCxzgJ2iSRZ872is2n3PhIk4R6yVtJSRCIx
 vyUQ/nWsFHhUI8kc8pFaP+Ab8k7m6b0ebY54eQN6fPWHkefEqCebeNTt3wqPUi8=
X-Received: by 2002:a1c:7706:0:b0:40e:84f3:7e11 with SMTP id
 t6-20020a1c7706000000b0040e84f37e11mr477000wmi.81.1705664176322; 
 Fri, 19 Jan 2024 03:36:16 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 r17-20020a05600c459100b0040e88fbe051sm8678595wmo.48.2024.01.19.03.36.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:36:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Samuel Tardieu <sam@rfc1149.net>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 devel@lists.libvirt.org, Magnus Damm <magnus.damm@gmail.com>
Subject: [PULL 15/36] target/sh4: Deprecate the shix machine
Date: Fri, 19 Jan 2024 12:34:44 +0100
Message-ID: <20240119113507.31951-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 982chw0g5wmx

From: Samuel Tardieu <sam@rfc1149.net>

The shix machine has been designed and used at Télécom Paris from 2003
to 2010. It had been added to QEMU in 2005 and has not been maintained
since. Since nobody is using the physical board anymore nor interested
in maintaining the QEMU port, it is time to deprecate it.

Signed-off-by: Samuel Tardieu <sam@rfc1149.net>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240109083053.2581588-2-sam@rfc1149.net>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/about/deprecated.rst | 5 +++++
 hw/sh4/shix.c             | 1 +
 2 files changed, 6 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 2e15040246..e6a12c9077 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -269,6 +269,11 @@ Nios II ``10m50-ghrd`` and ``nios2-generic-nommu`` machines (since 8.2)
 
 The Nios II architecture is orphan.
 
+``shix`` (since 9.0)
+''''''''''''''''''''
+
+The machine is no longer in existence and has been long unmaintained
+in QEMU.
 
 Backend options
 ---------------
diff --git a/hw/sh4/shix.c b/hw/sh4/shix.c
index aa812512f0..eb3150b5bc 100644
--- a/hw/sh4/shix.c
+++ b/hw/sh4/shix.c
@@ -80,6 +80,7 @@ static void shix_machine_init(MachineClass *mc)
     mc->init = shix_init;
     mc->is_default = true;
     mc->default_cpu_type = TYPE_SH7750R_CPU;
+    mc->deprecation_reason = "old and unmaintained";
 }
 
 DEFINE_MACHINE("shix", shix_machine_init)
-- 
2.41.0

