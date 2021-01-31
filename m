Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2576289lfo;
        Sun, 31 Jan 2021 03:05:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzlj8Oarm7BDSOer3C6djuaXKEqyY0bzQic+PhGkS3lVyoLDeMApz+80hoRQD/+Uyuo/2UV
X-Received: by 2002:a25:1e42:: with SMTP id e63mr17743010ybe.270.1612091112668;
        Sun, 31 Jan 2021 03:05:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612091112; cv=none;
        d=google.com; s=arc-20160816;
        b=AhAxVFJZoxTUq10zPqhwsv4yigkWj7EGRnOoObK1SZaH3PHBMl3aS+9FSKWpKTF1sE
         zYdVRG8/rt6cZ4fMRpJ7bJm1Y2bRBZfPQO1YWLKCFskWv6OujCjzxefs6/ZLQ+3tAl2j
         3L7QUh9J8dJlKDbPk/fYwQoUuoE1X11o8mxkvE7CFIveuVPK0ln+CJT1ZFqH6Qqrv7pP
         WSrCPAeC5SyfqqbzZRPQotqUXXEmVV0uQ1kMgyKyl6Xb8RplfCku+DIbE251fkewcFiP
         S2p8Tfz1XbMKaXEjo2QEH1L/IidQr2WzxxuXJhikbP/soG03nnPdiGlkxdYwLafTQ67V
         DX4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jtbqU34AXRgK7JucvFyMPpEvpdP/cEkbkCwJzoZsw+I=;
        b=U+pWfHTcviTYHRZt8AZO0wz9XaMEryGiesPNcRkZn7aVwHVhMy/QrFK63J+J2G0sVN
         preKKP4tsJbtsl7x/cVI//MM8xqnMdLIGf8edQRhavjHt8nyFvY10+EOudnNbeNgYNdd
         srcWqs95eU7RtE1qpZuyPucjhTZKatVWPjMMT1AJH+3Eq3oF8uAmKBQuN8lTvT36Yn+T
         R7fP8bLU4bs0j/mmX9a9O8GdpjH0Qs33wJqnf1i50/DqjV1y/x4KW0S7/AKn2zFe9IDM
         I6BlyIXz5/QOGP6bMsxKSpNkSfKpcqikIsjjHHRT7lTzfXjc0ZLyAm/ui3Y+g828k9a2
         1RHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vFB1SLLO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s185si14049122ybf.68.2021.01.31.03.05.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 Jan 2021 03:05:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vFB1SLLO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:41284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6AXX-0001vw-MT
	for alex.bennee@linaro.org; Sun, 31 Jan 2021 06:05:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6AS7-0006t1-Sa; Sun, 31 Jan 2021 05:59:36 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6AS6-0000IW-Hw; Sun, 31 Jan 2021 05:59:35 -0500
Received: by mail-wm1-x32c.google.com with SMTP id m2so10188410wmm.1;
 Sun, 31 Jan 2021 02:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jtbqU34AXRgK7JucvFyMPpEvpdP/cEkbkCwJzoZsw+I=;
 b=vFB1SLLOVA8z1esZfr+efHXGjtpbRDRKqxEr0+XiTMYueGRRO8M/pprq+Ef4/KsxHa
 joocEje6xS3Gk3xC6E30gOMRzrg25mC0cajUE3Oi70BtKoSyMyAgZXUDlF7GBVlNCTq9
 61Jna5sD+OuCCDAhBOrVn2jnnPRl3UW7giw3RR2JTeKFdDmda3b6dX+IBp/iCXfmzyrh
 qIaHGIih4ZZWSZ6qR98Bt+TagXa1f8hhSldfEor7JpNqQXRrgu+ys/aeMbrXyl9T5AYD
 md2NxvIiSejyxUSLM4Ub1722iSSAsNgCwb7WnJ9kgpk8ed/CM436mCELPCr7/Y9JcS+5
 HzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jtbqU34AXRgK7JucvFyMPpEvpdP/cEkbkCwJzoZsw+I=;
 b=Ca37G05hRpK3QJotXzcvu/+WSvrHZDDt3O7pvdpBP7ItgZJbaX3x9gt5NKz2T384XK
 3TY4oWBonS+fOibt2r/eV1bbAfb4Wr4ZHv7SomU3FxW9akv2JaWZhOULSEexeeJiRWLj
 T2kEWNqSjZAOESzoVolUZFmzdZwKNcNg8YtSOaNrWvrnJeylUombvnSH0wk8wRbvdLNs
 vM1YuUcx8ThS6q1ISiLo6Vqc0GQ6hMALxmpYFwXHfQsJgnKBI4waSdyl70M5aa4Iwzs3
 ZML3KCoiWlIf1bqT++TWJ3RPES+QPP9e9buQRFAkAkVjcff7FyVRNkC0wi7NUeonMHI/
 6J7A==
X-Gm-Message-State: AOAM530O/7FoC3Zgc+XRusY2/dc1fV1fpBZ2E4vQ5gV+heHy2pkesikD
 lLc678xPUeTDs2cR5QHIoUuKhSOfdcU=
X-Received: by 2002:a1c:9d08:: with SMTP id g8mr10683440wme.112.1612090772413; 
 Sun, 31 Jan 2021 02:59:32 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id c18sm27417714wmk.0.2021.01.31.02.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 02:59:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/7] hw/arm/exynos4210: Add missing dependency on OR_IRQ
Date: Sun, 31 Jan 2021 11:59:13 +0100
Message-Id: <20210131105918.228787-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131105918.228787-1-f4bug@amsat.org>
References: <20210131105918.228787-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MYETSJodUXwK

The Exynos4210 SoC uses an OR gate on the PL330 IRQ lines.

Fixes: dab15fbe2ab ("hw/arm/exynos4210: Fix DMA initialization")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index a320a124855..223016bb4e8 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -52,6 +52,7 @@ config EXYNOS4
     select PTIMER
     select SDHCI
     select USB_EHCI_SYSBUS
+    select OR_IRQ
 
 config HIGHBANK
     bool
-- 
2.26.2

