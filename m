Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp368896ejc;
        Sat, 9 Mar 2024 11:26:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUcTYkNfi9CS44BCBPDr9vyMLFjEGwHm5UHY6i3E7V32ln2orIRhu1QMBD085+Rk9L+mLCE2pDAvUyMybFBuJzneQ5xIIa0
X-Google-Smtp-Source: AGHT+IGHHXCMH8md5p7dRkjclQmCDaBMdi+Pi7z45IAwk6dRVzcjdRTYX2rVqRuDY9Csy3YsL9PL
X-Received: by 2002:a05:620a:1379:b0:788:4d24:e02e with SMTP id d25-20020a05620a137900b007884d24e02emr2862948qkl.42.1710012403501;
        Sat, 09 Mar 2024 11:26:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1710012403; cv=none;
        d=google.com; s=arc-20160816;
        b=NEzfeqkhUc0MZnIPv/1rfMZhXCx1qyplwE3014SRORmt4xSvWcz4xuU4DbUf5+3oxd
         sXr0tL9ziKNhXw1XjMSfRCuQH3R+kbsxWWbrHmTjcL6d9L+ixbTARiIKXLX+KtOSJLdp
         9I8HAlCl5hmhUKvwvzegDduS5m1G9/MNzHP+zobFoczoEi8mc2kxpLX3XboyuF90Tzrv
         fkuNDWe+OxlHqFCPWLD3+AQWCu5rAElrpPNKXD3esVDwtm2XVZMeUBmKwGUaghpoeT9r
         yLOXR/t7qzu+QqkAv5cyynzH/6TyAR46kDBDAR0ISC7ITqqLej7ykdgwhl64Oi+axvtv
         telA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LXk2FBAU/I+Gq91SQ8W6u6cQEBqnEw8TniXn77xAtfE=;
        fh=NlDOEFt680eBPvA80vGZs7w+yS9VdznKuU46dP0Ceto=;
        b=JSPId2VK4vhfd7MclXF4uAYLdMGeIudZDdnuVwKnYtyE0Enx4ZdMDbChIkwpRT6V9/
         +RAcZQdHeO0EYnvmL3M2sjUEUWZ2GWyoJzJ/nueTzbvUpTIf7Vc/3sfwJI7eJnLFh53/
         ackuxv1E4RdGsWY/7jvNuAOQjGcOOBNA+WHv82SP5J5vO3Z6aziFQE44N+vjM0vJvb2j
         bEcIyjZmPoLD3Msrc5yfV/5j7tDa1+dZAQqUiwQC8r3zSXZICd9MCOAGTaiXzjFVVL28
         yeFdMHUqMgsT6otdTIT3hm9zoOT56p7rZOZnkqD0CyQdDYAJtPdfghCoh+x6Wp8XUgnq
         mT+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hW/y+TVQ";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11-20020a05620a450b00b007881c30f7c9si2278812qkp.592.2024.03.09.11.26.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Mar 2024 11:26:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hW/y+TVQ";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rj2KI-0007DT-At; Sat, 09 Mar 2024 14:25:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2Jc-0006pH-T1
 for qemu-devel@nongnu.org; Sat, 09 Mar 2024 14:25:07 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2JX-00035R-JQ
 for qemu-devel@nongnu.org; Sat, 09 Mar 2024 14:25:02 -0500
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a460185d1a7so75719966b.0
 for <qemu-devel@nongnu.org>; Sat, 09 Mar 2024 11:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710012298; x=1710617098; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LXk2FBAU/I+Gq91SQ8W6u6cQEBqnEw8TniXn77xAtfE=;
 b=hW/y+TVQNEGOV3R6xUfA6rbqvDgFVTmeyaeKF6nw4CdPPoWGD+YUtJ8uUeHtiSXO66
 Cs4lDp+wXeSNo6TvLWGy7bwR2U0tYGpFudeQ5osJ1nWOQ3I4D7CfbXmVHrHxjQUcln9J
 Joc48+Ki03C4j1Q24MnT9V5pwWHlZHoaTfPlQpZnnC+dYEuQjXF/OeUgUDIC6dRI4k0K
 uiPE1x6fypUQNsMoVcatwmuv53xrDWbnP2xCKz0vmNNJE9nD7Du/f/cGQxOsN8UcAKlu
 iy+1dHnqHFQubWdYPdt0bRL1H6ds8enlTXVFDGAYFJIKb5wvc3uaimWr75QWEkt8KKqK
 ip0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710012298; x=1710617098;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LXk2FBAU/I+Gq91SQ8W6u6cQEBqnEw8TniXn77xAtfE=;
 b=KNpY2RF7NMrfweWKolJNx5xKfK66KlMjAfUIr/0cV3SgU0CRG3cF2gJglTY/588xaX
 RF5XZAMb4QYyuRTtYWqU/C4pNVPr+6JxtsmcktCOb+q+wTzpb+NT3A9VdFX/wR5kkFIP
 bnwfq6uSUEO7h0aCqYdXmejWsF4FOYB+Wcbd273Ah6zto06LjqxE3O3t/8b1zx6Sl5n3
 lw/tPI7BARUtntJYrHAUj0+lfWqwZDrlWD3Zt4D5uqJ0roz9BDhD0mflqq5LjeLRv8zz
 PKfUrST0w5s+8i+/l1qJKonC3MFF/sCcX0LPvvNOAUZKQoMfR5ilcCTxH2CMRwmiEL0q
 4A8A==
X-Gm-Message-State: AOJu0Yy0nX9MBAl5yw6KH+sySnUC7U3BPh40Qx9zViKg3f4awQOaqjPZ
 UxW/umJd5lFtvh7g67E1u8QSfDCz+Z78q9PBp0rkCr9IpsHVBOvV/DBow2Vr0tA+/lHK9GUe8AP
 a
X-Received: by 2002:a17:906:310f:b0:a43:dc5f:f271 with SMTP id
 15-20020a170906310f00b00a43dc5ff271mr1326849ejx.42.1710012297770; 
 Sat, 09 Mar 2024 11:24:57 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a170906364100b00a4320e22b31sm1195761ejb.19.2024.03.09.11.24.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:24:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Frederic Konrad <konrad.frederic@yahoo.fr>
Subject: [PULL 27/43] hw/intc/grlib_irqmp: abort realize when ncpus value is
 out of range
Date: Sat,  9 Mar 2024 20:21:54 +0100
Message-ID: <20240309192213.23420-28-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: fIl8CaAeVcFZ

From: Clément Chigot <chigot@adacore.com>

Even if the error is set, the build is not aborted when the ncpus value
is wrong, the return is missing.

Signed-off-by: Clément Chigot <chigot@adacore.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: 6bf1478543 ("hw/intc/grlib_irqmp: add ncpus property")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240308152719.591232-1-chigot@adacore.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/grlib_irqmp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/intc/grlib_irqmp.c b/hw/intc/grlib_irqmp.c
index 144b121d48..c6c51a349c 100644
--- a/hw/intc/grlib_irqmp.c
+++ b/hw/intc/grlib_irqmp.c
@@ -356,6 +356,7 @@ static void grlib_irqmp_realize(DeviceState *dev, Error **errp)
         error_setg(errp, "Invalid ncpus properties: "
                    "%u, must be 0 < ncpus =< %u.", irqmp->ncpus,
                    IRQMP_MAX_CPU);
+        return;
     }
 
     qdev_init_gpio_in(dev, grlib_irqmp_set_irq, MAX_PILS);
-- 
2.41.0

