Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4327195ejb;
        Thu, 29 Dec 2022 07:25:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuDnTg/3dqpgVgpzUcvAMoLG1Mpm+PPJU8a8QY/eJy8GfAjBeucZsk4v9LVxxaUUyWMBmV1
X-Received: by 2002:ac8:7c92:0:b0:3a7:eb36:5cb1 with SMTP id y18-20020ac87c92000000b003a7eb365cb1mr37931571qtv.36.1672327523361;
        Thu, 29 Dec 2022 07:25:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672327523; cv=none;
        d=google.com; s=arc-20160816;
        b=yX+Xv1XW4tB6JvpMxd6ZdpcxNF+XTU5qzidA+JAg80F/OEUStKhPVWiD52jFucNC8W
         OS0n4QIExLnlBKz6B8jvvl+aZL90ApZl7XY4+VvPhefQm2aCOKAnV8/IAjBpd+BYYQMc
         sU3pbSRcFKiuB4zU+NB0WLofvSCQFZcekg2+Y1936QrkVCmlafe4yA1rhAI5YF+YUzlu
         86C7yugF5VvGglGtOCOJUrSFXSRRb6jW/YvgOhcc5fLhOHoebpsG9tdAjg5srFZfrdDr
         4v9Qe+fkOgQ5jKuqqZ+emJufoYYGmeVNsQ87XTqGhsTBDVdz4XEkMdC5FUAC6E8rxiD4
         wxAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=y0IR45+1k3KGq6akeAAYqfenh8SpGHNSxj9mXYNisiA=;
        b=V/0hLDXkS+xIUW4i+HFAsp3lYoFBA7GdzHJ64VUaFgXLgvxl9zkR/dWJd+L4wHALGf
         qU4bSyuQfWa7arEGXGShh2npWL4gZkNSUxsL/rgVsll/5+yZf0RrOuvbZmkz0R5md2Dk
         tQDaU2f0IYaicY9RUL4s6GcS7173CurYukW26Tcj3/FBclgaAfy1xqEiRfijBajRcYXZ
         Pa8yzl5Pc3NSTq1U+qUzDEolQP34ckBIcjO6hSBoGbwvYhCkH0yVvFYTHDcM6yTVqSYu
         cMtkhsTNC7r5OEubWGY+825Xmfb/da2OyG+MDANiZTwXdZKHECQzb0pEnFCjJ9LgjjA3
         yCrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gY1UHiIO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fv15-20020a05622a4a0f00b003a69a6bb1c3si8635301qtb.273.2022.12.29.07.25.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Dec 2022 07:25:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gY1UHiIO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pAulW-0001TJ-Bo; Thu, 29 Dec 2022 10:24:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAulU-0001MR-GH
 for qemu-arm@nongnu.org; Thu, 29 Dec 2022 10:24:16 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAulT-0007zx-2i
 for qemu-arm@nongnu.org; Thu, 29 Dec 2022 10:24:16 -0500
Received: by mail-wm1-x331.google.com with SMTP id m3so4452521wmq.0
 for <qemu-arm@nongnu.org>; Thu, 29 Dec 2022 07:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y0IR45+1k3KGq6akeAAYqfenh8SpGHNSxj9mXYNisiA=;
 b=gY1UHiIOTezzuKxOHGwrjy4/sPHP5UwkD45Y4v8JkZnsbSOVLcv1UGS8hDsQtj/n9e
 3rVJiWXabt3HjcdQlbA9kE0oJoJ9+r+nJHNNj7caQgNTk+XsTjwTTKQynoRWFSOKBd3d
 kJe/KQK0BLvMdkEpNnrC4y6Y9sHieuGz2lc26fUFjMwCbbYc1JQptfUA60hh7j5PqfFp
 /9CDMSyqUALg5FzopukQ462tiv69gvvCgkCTOJZupFwZZpgbjqAmEm/wOM/aOrxW8x16
 yVsIvg+d0BD0vHKVOz1Frxwd9XvLixoWrMd2uBRzEPsiQ8YpGSpzVKYU3nhZSdv2DlVA
 bbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y0IR45+1k3KGq6akeAAYqfenh8SpGHNSxj9mXYNisiA=;
 b=7ctFC/haqWG3eAADWO9zWZdJ//Q4K7PUfIZOki7ZKSZlYb9i5Zi3FNagY4tJMtOixU
 0oLnq08DXwjujt9p+MjvyFatCuiZsapJJvwc/+PRWfI8irv1Jie4W8WJUoL6Br47mYOZ
 9xyihnxrWXBxaTWz6KCtOtfnFAc76j+2pT00PjRyoTi2arRsDsvY9yYA/7qKj4T8dm5O
 eBLiQykOrapUQbgh/aQaYvDZME0df5l2SyNa4T3Iwh14vrSWB5Kj/iWUGxSPHg+ZvA9u
 AABG+CULXYtI5eE8t/l7kW5N46tywawS1AXBIwvmeFckgsAf9UNbxpenWsEHa+e0dhat
 Co0g==
X-Gm-Message-State: AFqh2kotlOopTWbEMrjRM8iA27/FulPWtZEcNIMVt8splKh15ap+LvGJ
 t9cdZRjEkdjGahw8fyHKbyggWE18hfMblDaO
X-Received: by 2002:a05:600c:538b:b0:3d9:72c1:62b7 with SMTP id
 hg11-20020a05600c538b00b003d972c162b7mr13091743wmb.7.1672327453689; 
 Thu, 29 Dec 2022 07:24:13 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a05600c444d00b003d998412db6sm4185679wmn.28.2022.12.29.07.24.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 29 Dec 2022 07:24:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>, Peter Delevoryas <peter@pjd.dev>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH 8/9] hw/arm/aspeed_ast10x0: Add TODO comment to use Cortex-M4F
Date: Thu, 29 Dec 2022 16:23:24 +0100
Message-Id: <20221229152325.32041-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221229152325.32041-1-philmd@linaro.org>
References: <20221229152325.32041-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: C9f0aAPZk5gH

This SoC uses a Cortex-M4F. QEMU only implements a M4,
which is good enough. Add a TODO note in case the M4F
is added.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/aspeed_ast10x0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 02636705b6..788827ca9d 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -421,7 +421,7 @@ static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
     dc->realize = aspeed_soc_ast1030_realize;
 
     sc->name = "ast1030-a1";
-    sc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
+    sc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m4"); /* TODO cortex-m4f */
     sc->silicon_rev = AST1030_A1_SILICON_REV;
     sc->sram_size = 768 * KiB;
     sc->secsram_size = 9 * KiB;
-- 
2.38.1

