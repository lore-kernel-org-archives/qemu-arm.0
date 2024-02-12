Received: by 2002:a17:906:2499:b0:a38:6d10:c5dd with SMTP id e25csp17747ejb;
        Mon, 12 Feb 2024 08:35:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFnVtj7no4tAxYeWoo6zXaj3rOhTjPgBy8bIXbIA+A4P9EUWE8wah2PxK7baFVl/hh4+9l
X-Received: by 2002:a05:620a:22b3:b0:785:a232:6fee with SMTP id p19-20020a05620a22b300b00785a2326feemr7227977qkh.5.1707755716602;
        Mon, 12 Feb 2024 08:35:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707755716; cv=none;
        d=google.com; s=arc-20160816;
        b=y5zTiLWwUhi8Oe8ghQ16Q/giUT5SbJOmwW1Q+O+H0nwvt+g9nussw2Rz+uGbNDT4qd
         EyC7a51+aTUI++zaSdy5jD0YVJB69BhAemzkwroe9LsTmyRK2mQM0YJVWYuGgLVkRwq4
         BHi6sG6wl3K7atHG7A/N08cF7qNIC2I1sf8cT/ocVPOWX9ammpYyGm6DR3wVaS52Rl+w
         FiYpK8MeGLfc8f/eJiVGYpusny+ApAjhZTwhYH8fgcjwx7yKrIinbQS8huWr5nfAOIsL
         SbMw6oBn/DjnTKnj94+kxAcMR+syCwISexfBng4S2BYaqzvNcSYaFi48a71kRvT1raZc
         26mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=XTbusDoko4+deqOm+fSdKoIBKSVRBD05pQwlOS2R/6I=;
        fh=R7xGQG8FhU9As8zKwAL5EH2aBaMhsN8ljI+mON8ckUY=;
        b=uwOeR2P/iX4QoCfpkVsVdsG9QZf3PlAZB5RiByHB6shUB+iypke+FUYPNGVuY1oaHl
         qitLrBnF1INrOR41cgNaxXrgf6rPDKIU4SgyKzf+rtJr4o2xcAfmAU7WE8Mn5J1gtuic
         xtALH+xauCmqQIFJym5AAuCnRqEanecLjJJN3k6EO5MQRLVhpSwNq08SaZFr9IAFJxYC
         DHC8hZDPn9rlDfNGA5CZ7Fx/FjMbUXE2V6jrdpUI5Qk3BBlzknhbj3nvzBT73Qcfl8LD
         I62RpBAwNHq09hIt5V1aQIrllnJHlNha92ir5jUq//AjqpMFyaJq+jKVfL6qTMu/nacl
         2Qew==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=oVcSKfO3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
X-Forwarded-Encrypted: i=1; AJvYcCV4JYNnlevQd6V+pT1Jk0XkxU4jEiwzexJR7S0CJZ1psk2/mCFd34QfDFrvlyYLO3YCQ8P/WJ9VMLiA8nwWmgW6DaLHHs+r
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v15-20020a05620a090f00b00783e2eb9b2fsi6323864qkv.491.2024.02.12.08.35.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Feb 2024 08:35:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=oVcSKfO3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rZZGs-0001od-LS; Mon, 12 Feb 2024 11:35:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rZZGr-0001oC-9J; Mon, 12 Feb 2024 11:35:05 -0500
Received: from zproxy3.enst.fr ([137.194.2.222])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1rZZGp-0005QB-1f; Mon, 12 Feb 2024 11:35:05 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id 206C8A05C2;
 Mon, 12 Feb 2024 17:34:58 +0100 (CET)
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id cKuKfBSK7DiA; Mon, 12 Feb 2024 17:34:57 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id C8DD9A0590;
 Mon, 12 Feb 2024 17:34:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy3.enst.fr C8DD9A0590
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1707755697;
 bh=XTbusDoko4+deqOm+fSdKoIBKSVRBD05pQwlOS2R/6I=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=oVcSKfO3oMafVmtbm3jNPts+VuYCjwQJPTa9v1Yr+btfGRaIFb6Xo0KW9/IE+mnpb
 5qyFhAd3fdH4pMhh9nEqFF8y16nRT/0kHDPcutC6jrIJiadn6Jd+usNLSvWyZZ+ocZ
 nBKpnZLu6Iwvo6fh7sXYOlGp21WpBLvqzrfarC0Y=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id QKIZWi2MHzfJ; Mon, 12 Feb 2024 17:34:57 +0100 (CET)
Received: from localhost.localdomain (74.0.125.80.rev.sfr.net [80.125.0.74])
 by zproxy3.enst.fr (Postfix) with ESMTPSA id 6B10CA0562;
 Mon, 12 Feb 2024 17:34:57 +0100 (CET)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
Subject: [PATCH 0/2] hw/arm: Fix STM32L4x5 EXTI to CPU irq fan-in connections
Date: Mon, 12 Feb 2024 17:31:17 +0100
Message-ID: <20240212163446.227802-1-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=137.194.2.222;
 envelope-from=ines.varhol@telecom-paris.fr; helo=zproxy3.enst.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: n50QbvcUweZi

The original code was connecting several outbounds qemu_irqs to the
same qemu_irq without using a TYPE_OR_IRQ.

This patch fixes the issue by using OR gates when necessary (1st commit).

I attempted to check that the problem is fixed by using a QTest (2nd comm=
it)
but actually the test is passing even before the fix :
when any fan-in input line is raised, the output is raised too.

Fixes: 52671f69f7a4 ("[PATCH v8 0/3] Add device STM32L4x5 EXTI")
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>

In=C3=A8s Varhol (2):
  hw/arm: Use TYPE_OR_IRQ when connecting STM32L4x5 EXTI fan-in IRQs
  tests/qtest: Check that EXTI fan-in irqs are correctly connected

 hw/arm/stm32l4x5_soc.c            | 69 ++++++++++++++++++----
 tests/qtest/stm32l4x5_exti-test.c | 97 +++++++++++++++++++++++++++++++
 2 files changed, 156 insertions(+), 10 deletions(-)

--=20
2.43.0

