Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2288507ejc;
        Mon, 9 Jan 2023 06:15:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv7Uze/Gxo1W8RWg9duQYq/N4lRDb7bD644Jf9cC4y8HPu2wWzHEc85f+44nEhutxMyFy1D
X-Received: by 2002:a05:6214:c6c:b0:50e:48cc:a95a with SMTP id t12-20020a0562140c6c00b0050e48cca95amr120124080qvj.43.1673273748877;
        Mon, 09 Jan 2023 06:15:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673273748; cv=none;
        d=google.com; s=arc-20160816;
        b=ADYoOWNKpykvW36exDG2h6Zh4WhDbbdxHFgTjXi3tvrc3EI+Vm+l8N6aAmK7pmngyr
         mq2XctA3lYNkHzmk0O4HE+RA34jLtHmP/Fr6fQtBSIkS2/UwLSdK4qhSclHJ8vmnYmTd
         /GMeMEiOCvWsViLgBnDFDzrN0AcRprbNeeq+LlifNuKzY7AofEPq1c/OT5KpsQ/7zGFd
         HNcECnum5TH4aGdtTSe4Dr39TW1QXQDxEv2cu9mmlHXPZMomy5UJ1ai85gyvriLV7cug
         VhNP6SabzJ1Ny9mmfp3zJxmoYGaWmVaeYNJqQIS5AfbZr4Ls3Ji8L1MN9oESFajwIbP7
         ev2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bwgSmpYYfKNOJH9VNo91pDyRjQC6uHyPY7rBYpr5GJw=;
        b=M6IRsEZq6rfQKg0HlllCVZFQg8AA8EcP8SzhoNFvZtrjkWdVl7MpvWhrWD9DPbsB3d
         GGjdupiWWljWGKzJ2oiesuN1fpe/5FzALkpjVXVtfj9oys4pjI6UZ486hdHk4PLyXGGB
         MCaPVHo4VvzHb0xtU+bd2TmuN80NQ3ZFbW8o/V4xhVQqp2T4ROYlOuQCx87kO6VK7DTw
         hVLTZXrQ+nUEAXoOPg0v16eIWMoM9V3gKGX9gG5FgpwxWPqunzKT/qEeRz4deiU6YPeh
         N89hgfxetMAUdx9pH3S885R7TA1zceF6DQwSRUO+k1cZMWkkxNBQVX827Wc+HQ5tSaSs
         HPIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n5l0+iz3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g8-20020a0562140ac800b004ad365ed00esi4041277qvi.577.2023.01.09.06.15.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 06:15:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n5l0+iz3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEskL-0001Wa-Lm; Mon, 09 Jan 2023 09:03:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEskE-0001Ur-8j
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 09:03:22 -0500
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEskC-0006PD-Mp
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 09:03:21 -0500
Received: by mail-lj1-x22b.google.com with SMTP id p25so2760487ljn.12
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 06:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bwgSmpYYfKNOJH9VNo91pDyRjQC6uHyPY7rBYpr5GJw=;
 b=n5l0+iz3gjBqrKMaIv4+T2CnMxiqzpa1hiMPKWzCyUfaTtojUJTY4jj5noYtmix0PU
 WS+D4c+1/EkUT4KFu+mj6Xyn9iJ3AruoKivNMKkPV4Ay4HFppmY85TjPqPkZdlUWZ6vP
 hnVu5URMcS4CxhN32ApAlobFr7VBiX81tgtQ8IXZYaYxsZFp6mMmA/gZQu3yAmr8Z9tN
 Bh/LbpRBx+vWNau7Q24i2UBR3ipVIv+dkh39gH9fwMvER3FVriZ8gV5dHX+xQSCC8Zd+
 CX1JTGRTmuEePqgLJLphOq2M68TEql69VtuudYcS8/cM3kuslBZL3JDP7+qhuZtnt05s
 FHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bwgSmpYYfKNOJH9VNo91pDyRjQC6uHyPY7rBYpr5GJw=;
 b=EFKYdV8Mol3Hv/7s0QXjuQ7gbAcEr/Modat11/ANVhmpUBUd2cB08i7UcxZHHo3kMr
 2J32Xv6z3eYPThmD0KMgXVA3vGDhkdjznea6yyMMOzg3VWX5bWjgur56kIX9D5NU8oiq
 VWleUaUhHcAB25KT5IO1x+sInDL4Hr7pu0zVTFWw6k0lTkdqq7QJGS4Y8dJhJdy5g5uh
 KYj7t2/oOu/KcLE4uATMeA9Bpzhjud2gw0KUaY5e35YVuROmKVEKFsKOERoTW353qDmV
 QfNTIy5ckbfcoDcwlcMzvHLr77V5VptPa8+ndhLOhmBx6wLkVsbQWYDfckCT4FYEgSCW
 nf5Q==
X-Gm-Message-State: AFqh2ko4bFeVdJlfHXHBa00c5WNthT9leXwxGsAPfTpT916GdqixbcTM
 kP0O3tJ4kb8KYWwRhqGR5tTQyQ==
X-Received: by 2002:a2e:9e57:0:b0:281:789:7ee5 with SMTP id
 g23-20020a2e9e57000000b0028107897ee5mr4320882ljk.6.1673272998739; 
 Mon, 09 Jan 2023 06:03:18 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a05600c4ece00b003d9ea176d54sm8462614wmq.27.2023.01.09.06.03.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 06:03:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Tyrone Ting <kfting@nuvoton.com>
Subject: [PATCH 02/14] hw/gpio/omap_gpio: Add local variable to avoid embedded
 cast
Date: Mon,  9 Jan 2023 15:02:54 +0100
Message-Id: <20230109140306.23161-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109140306.23161-1-philmd@linaro.org>
References: <20230109140306.23161-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22b.google.com
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
X-TUID: NMXqk9pQWnsj

Add a local 'struct omap_gpif_s *' variable to improve readability.
(This also eases next commit conversion).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/gpio/omap_gpio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/gpio/omap_gpio.c b/hw/gpio/omap_gpio.c
index bd0841d57f..12ec16d1b0 100644
--- a/hw/gpio/omap_gpio.c
+++ b/hw/gpio/omap_gpio.c
@@ -53,7 +53,8 @@ struct omap_gpif_s {
 /* General-Purpose I/O of OMAP1 */
 static void omap_gpio_set(void *opaque, int line, int level)
 {
-    struct omap_gpio_s *s = &((struct omap_gpif_s *) opaque)->omap1;
+    struct omap_gpif_s *p = opaque;
+    struct omap_gpio_s *s = &p->omap1;
     uint16_t prev = s->inputs;
 
     if (level)
-- 
2.38.1

