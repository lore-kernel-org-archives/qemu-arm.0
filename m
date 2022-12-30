Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4839888ejb;
        Fri, 30 Dec 2022 03:37:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs4eJurJMnqF3Yy0k2FjvJ0/0Fw8mn9sCg/Mswt7Hso23BJomSYLzKTctaI4QrzGPvndQ2e
X-Received: by 2002:a0c:e189:0:b0:4c7:5c88:dcbc with SMTP id p9-20020a0ce189000000b004c75c88dcbcmr40984061qvl.48.1672400260471;
        Fri, 30 Dec 2022 03:37:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672400260; cv=none;
        d=google.com; s=arc-20160816;
        b=ZcToQPeRSN0t0H0Hqo+q+9ICSy3H6FSSdP0EsEofDxssq9r1oRiET50kiaMi7OUPa3
         hP5/T57QtCyF28sJWZE1/ETUWfwFLhx7i4ajHeiXZREDo8vlbY+bvNJdT30r6XuT/0qp
         kQ/obqTz00MfvYLFeyzXCARxSDZbHhX4t1jCl3ajebOiHEh99VM7ed3ASofj5z19dtjP
         /eDSkNVfaeWEIvRCvt48ROk5JH7Xn19I1JcfB+T+Pw7Kxfy0tLrRZeeXizrXEeJ/HeEV
         JL5C7/XXZitdQ8ZA1pvy5C4a+DaSA/s03c9b6Khp7l8g6XqoLQfmcmR1U7jQFJiNqx0P
         fzdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3bccAPU5/myOuHMuyAoVz6uc/DAhbE8HLrAA8sKeF+E=;
        b=LmBSygAoVcltBOKcq4F18Co+/ZUhBvHjuPcXW/4h5zwdB2s/aAUISz75Dz7/VUsfmH
         uopir7MJGbXIH8aCzQGyPktRcDguhMwbvmjKuWTS93vjj1bOhd5qxmJxRK+awRsS1dB9
         WHAFPx2GtGD9HiGwZJ4P7DWc2GDhN5p1K4sGrQrSVq2b+VA3JDxIZoahg6tMDDKlf5cv
         DtGxxIFpZgCvWCq8jKInWBx4MHAhUcLGx7l/1cr1Lf0e6/bEv9IzGsB9UnER9DcMXDsw
         6ozXawKJEvY2lvXG/Sz46hUayFHM0pzrr/l5kTLZ9aiz8l/LhmcMSea3ikx4mkvCOpZB
         L6Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WYROTInB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w67-20020a379446000000b006eed04d46d3si8954785qkd.753.2022.12.30.03.37.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Dec 2022 03:37:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WYROTInB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pBDgE-0006nc-8e; Fri, 30 Dec 2022 06:36:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDgD-0006lG-2d
 for qemu-arm@nongnu.org; Fri, 30 Dec 2022 06:36:05 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDgB-0003sH-0I
 for qemu-arm@nongnu.org; Fri, 30 Dec 2022 06:36:04 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 ay2-20020a05600c1e0200b003d22e3e796dso15043065wmb.0
 for <qemu-arm@nongnu.org>; Fri, 30 Dec 2022 03:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3bccAPU5/myOuHMuyAoVz6uc/DAhbE8HLrAA8sKeF+E=;
 b=WYROTInB6jOcIpu8X0uTQZZh4POFcA+YoD4qP2gMn4UJJwJcXRKGVJIXFry6LtnZ0L
 FKrGvKg0lAQGAsG5H6SpBn7SfAu1lsYOVB++MwNzTb4szqJ7IaDJucfEJguP0y1li6of
 1bEI0YATmQMYCdDHX7HJCxb82tY+TVTPNFSLjOGfHak9f9hKILarmrPHzCcDkUKeQVgD
 6mK0qkh39cGmmwxYePN7HxamQFwR5sRPOciYPz49nDijjSlqSMJ95WeU7eB9UdH7cSyu
 CUQTLxZKHDUnam7YBULwAXBiC7Z8UlR5slxmQuvLJ7tolAEpncfTJzqKnzFmTirD2Til
 TXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3bccAPU5/myOuHMuyAoVz6uc/DAhbE8HLrAA8sKeF+E=;
 b=qM2RB1tnKesax5gll0ZtkfEdRYjWLVMnkhywlfVgqcrey3RHnFiwdQL2Ew4rRLnuhm
 TG+Q8OLYeREboku/xDN+9fmAcvGO3EXCf+6jmC5nbMJUGy/ixLcEl01EqCZ3uwLNKLdZ
 6lfOkMKNhno1fNKKTd9T5UjbbhwQIP3C4/G5SRqDK0ggE5JOwWb9fXYv68iHC/fe2tnR
 rLm4EqeztsbT9ULgEr39t+Y0lO/QWZ5GyVZhKBdWTP8HqsHUjN6N1cqM9r0WVxeAG/93
 oJksDjfGX5srNda/4hbgrLHQ9BYHC+WYF19fxBN58rjeLI8hmIGQwEa0OAjzK84HzQFz
 tZXQ==
X-Gm-Message-State: AFqh2kq0H+inGhrVeCS8rw2zNSVQdVEcdICtXgdDZhD/7hL0Fj+uuqM7
 GLAs9uroXN5oA/AEzZlZOeG0Yuxoy5bxrzJX
X-Received: by 2002:a05:600c:510b:b0:3d2:392e:905f with SMTP id
 o11-20020a05600c510b00b003d2392e905fmr22768876wms.24.1672400161853; 
 Fri, 30 Dec 2022 03:36:01 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a05600c425100b003cffd3c3d6csm26414700wmm.12.2022.12.30.03.36.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 30 Dec 2022 03:36:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Peter Delevoryas <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>
Subject: [PATCH v2 10/11] hw/arm/aspeed_ast10x0: Add TODO comment to use
 Cortex-M4F
Date: Fri, 30 Dec 2022 12:35:03 +0100
Message-Id: <20221230113504.37032-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221230113504.37032-1-philmd@linaro.org>
References: <20221230113504.37032-1-philmd@linaro.org>
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
X-TUID: YjbpEQvuJa8o

This SoC uses a Cortex-M4F. QEMU only implements a M4,
which is good enough. Add a TODO note in case the M4F
is added.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/arm/aspeed_ast10x0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 7a7443a95b..a3bcbef24a 100644
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

