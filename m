Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1398973lfp;
        Thu, 6 Feb 2020 04:51:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqwsMWQQKcU36Io45eAlJSJeYdw+zfKSY2ZbNlWZAMWiVxUL2xHVoKcUhYe6PeIWqcLexk4z
X-Received: by 2002:a05:620a:16d6:: with SMTP id a22mr2377062qkn.266.1580993482500;
        Thu, 06 Feb 2020 04:51:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580993482; cv=none;
        d=google.com; s=arc-20160816;
        b=fpdamh0JzN7VMdWc9k9r2PaHi64AZEJu+LS1KoL33fSDAuWtWMXOZQBOAL5arSRNfl
         mykmfpF/2Ya+gBj3kdvqy+rrNt/R7v4d/uJMGwJAKS/mVVcMT1UOw9ZsSWQYW3tlflYs
         IlcH1VmGbACS27OX3VKz7z1u+VQz1VLQYk+rIgWQDwIZWExR/oHoiy2Dz6towh2aJ52Q
         iuYIpKaOIQhC2SkQEb2pfpreCwMzAbQfTNCIOx1qMJq9mkm16T8CPYZknazstF3sAMO8
         7N/IdRtcJcLw7s5vfAQMVlnjrsI1VCHgUHADZyqXLQMmAaD/SsJ8M7aTdC9MXc2KkjNl
         axIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=9t7WLeOpx45MoGhI7Cdxt42EO2c1dCaz2w0iFhKJHzI=;
        b=eXk/e+LaTs/Qie3yO2/veuYdtvm55hTJ8zN2kAPP9uOpNuB3kX2XeyUj8wumoe6FIW
         N79DC66fOZeLSKs1qTulSoAWoDAIaf9lDEXsiB/t8vjmKZZ/PSjsyd17/MD+53VF4Nc2
         bDyvLC4+1ot8y1K+ixsi6QTJ/dZ9uC5na0xpJk6uZiq7BcZBPV489/9XTwjGxQ3akHB0
         p80pkwwm8RCcI4oan5qSisaq3y3MVlaZrAnm4mkSKqVNJJlrUZThRDtSlNlzfQHI/267
         +DDWg9/MgH9y53OiA9pFeEBJIjIAjJ2vJLbU6g/69htvwwBL3S2DIY+CiWlmhDxpCYWq
         SVlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k10si1412662qtp.358.2020.02.06.04.51.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 04:51:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izgcr-0001TB-Q2
	for alex.bennee@linaro.org; Thu, 06 Feb 2020 07:51:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56191)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1izgcR-0000qH-NI
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 07:50:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1izgcQ-0005cj-Gs
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 07:50:55 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:49335)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1izgcN-0005Oc-Pt; Thu, 06 Feb 2020 07:50:52 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M9WeC-1iuCxl3gQu-005W8Z; Thu, 06 Feb 2020 13:50:38 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 03/12] MAINTAINERS: update Leif Lindholm's address
Date: Thu,  6 Feb 2020 13:50:18 +0100
Message-Id: <20200206125027.1926263-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200206125027.1926263-1-laurent@vivier.eu>
References: <20200206125027.1926263-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LnCs2Zwrs3oEYGRmAL79vhMUiVHPQ9ELLumhY6GrZvtgZo1aelo
 zDEAFWodOyNg4/zBlGQ9vVjC++RlU2i0EsUYX9tnE9mf7obWmxiSJ7Fjy6ArDLUOTJc2Dgi
 hVMKzL50GfidCLdr9m5oGjeU7PWKHM7/55lHa6iqO3Sat7U2xgDj6MotRmiG2VelXQ1+ZeW
 et5i0O75jECPKctRYLMcg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8CryNCQ5BUo=:tQwFVTY+XBI43jyInyv+ZS
 4LGx+adazzJTus460atcRbxr1kDXY4xT484KsktapHBq7o6fpTnwadCGQP6maXZehWUd3yTqS
 zp0ijOHRVgE0SsspLCoFDb38usuGD15CYnKSvbk9aejNqqdc72J8w5zRRevDqzXbbNRnDjOcd
 xgndL9sc/4psHfnFQXuMbU3/uGnlIakFQ19ZX3QhfgNOexPFRla4i6J+Xs0mK+fGIfr7qjGSv
 SILL1m4AXVg8pcZTuM10t2tJLU2oLAOMLtIHJhjfHhriftJoyGkFpjOgHnI7UMSbAF6Io9Gea
 sWMxwFO1+XgHnxL1xvDfO7KVXfnk4Jiw/4J1Anc/h7CY/G7o6oRlTytY7EGz5pXSUvAtbgNoT
 lQBEeeITl+rn8udbi6W4ExUMoqIR7LKvCQgXaPu1HMdMFVdDgfL0UzHi2r/Qh5Yt1E/velHSy
 vchqTybkhOjvF8OcOjdVdgZ2DxuD6fv13V7IJTlwnDH0sNW4q6DZK+6ybJnzLhzm66KSscpGN
 r+xPofObe4KVjqt8tiz9NTOGBbLdAY7ZyR9OlnZ3FpOSWmnNyfaDcSa2+6KFyMyO17NUXlO9s
 Zk4ebdbM/YTKd+YFfKa6Lr3kZ5EC9APdPZyAKMHsoCE2Z9r1IkPRHzmCiPYaeOaMQgq3iz35i
 W95w78Jgp/PWasx4/qPpMqpVbrL3kroD8Q3i4Zu2I5Vy1lObrn1Si6A51VRgXS6zGkkoMZO/a
 C9dCsNzEfrMu+9QIS1oXgr9TNPekn+dmuXtYQvxC5zjeRM3Vj7us+FkfdZBBjktGedorWuyZw
 dPK4ukENDk4U4aS9Z5Yy0J8a0OpSKNBFAIAu9BNGlqwpeRfzGW/WL9VnYK6LOjJsAQ0qOu3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leif Lindholm <leif.lindholm@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 51bVpPBn3JQQ

From: Leif Lindholm <leif@nuviainc.com>

Update address to reflect new employer.

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
Reviewed-by: Leif Lindholm <leif.lindholm@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Leif Lindholm <leif@nuviainc.com>
Message-Id: <20200116174226.4780-1-leif@nuviainc.com>
[lv: added .mailmap changes]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 3816e4effe4f..a521c17b4430 100644
--- a/.mailmap
+++ b/.mailmap
@@ -44,6 +44,7 @@ Aleksandar Markovic <amarkovic@wavecomp.com> <aleksandar.markovic@imgtec.com>
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com> <arikalo@wavecomp.com>
 Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm.com>
 James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
+Leif Lindholm <leif@nuviainc.com> <leif.lindholm@linaro.org>
 Paul Burton <pburton@wavecomp.com> <paul.burton@mips.com>
 Paul Burton <pburton@wavecomp.com> <paul.burton@imgtec.com>
 Paul Burton <pburton@wavecomp.com> <paul@archlinuxmips.org>
diff --git a/MAINTAINERS b/MAINTAINERS
index 1f0bc72f2189..259688174ace 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -737,7 +737,7 @@ F: include/hw/ssi/imx_spi.h
 SBSA-REF
 M: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
 M: Peter Maydell <peter.maydell@linaro.org>
-R: Leif Lindholm <leif.lindholm@linaro.org>
+R: Leif Lindholm <leif@nuviainc.com>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/sbsa-ref.c
-- 
2.24.1

