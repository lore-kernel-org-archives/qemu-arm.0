Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp613324lfi;
        Fri, 3 Apr 2020 05:47:29 -0700 (PDT)
X-Google-Smtp-Source: APiQypIS3yHcbapq9Q/YvUCdvdGmgQwjUCJcC9fzeJhwiCu62pYNMW5e8AzOsp7lgDLdewtWt14g
X-Received: by 2002:a05:620a:20dc:: with SMTP id f28mr8567611qka.216.1585918049103;
        Fri, 03 Apr 2020 05:47:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585918049; cv=none;
        d=google.com; s=arc-20160816;
        b=wEpbzajvrUS0Y36XZF/cSC16zq9Mixd3bj5Np6Er5XXzw15fgQm/gF4CnPpBnx79uh
         ywOJxn4WCCPYeqQOob0bejkwYA607OwfEg1ieG0+4Tb8IaiK5xTH8isqj7pe5ZTL0nO0
         uuesGl+Lg+6jXCly/NbSvt1ilqHt+wenH/nKz6tfy7fUVsLavKK/j6gL0HYAfsEZHP/O
         Nxjm6dsotLNGOTqEEyuLSdRhEqzQzgI4+/ByiWZ6JxoBuzxHIDGpaF1M+59Y49tuj39u
         GnJ3Cn20DYOKzGTCIDGa089QPcbLKksUd2z62dG22NxsUHVviZ5pMuXnKC/WssqlG+1L
         su/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=u+FnfsREkBRJl3VAFQFO7/rhMNP/gbYDcVI3CY4e8PE=;
        b=RknXxOSKdJxz7BVZT+6sOGeRrZtZYxaR9N5mewMM99ggvGrJqbwf+m4Yb50MVbRQ38
         lQ5BnXV4tomhkLSnSfkV46RP6SbCXmaTquWHSWIwRxJ18IGicwbw4x/5sKpgOD7aesui
         S2qi5csCIW1yADYTeXpRZ7QGEMkKWSoALjDgHxXDMDM8qpDoFahRVXM3KGj3DoHRoFE4
         /RIdSRlXbmvAg/DvFoeBlhssP8bYa25NM4Ib9NlVYZPNXheU4b2R25TOH8njegPCitcY
         KBac7V3F7vlAeOkVB4Xq1MDWPX45tf4HMbS9SDEymZvxCQ2H6GOgshJEXhNWgVtrFjsB
         4bmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="PgTL/Pb0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x36si5292549qtd.247.2020.04.03.05.47.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Apr 2020 05:47:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="PgTL/Pb0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jKLjM-00016Y-9M
	for alex.bennee@linaro.org; Fri, 03 Apr 2020 08:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55420)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jKLjC-00015M-EQ
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 08:47:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jKLjA-00008R-So
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 08:47:17 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:33360)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jKLjA-0008TP-Cs
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 08:47:16 -0400
Received: by mail-wm1-x342.google.com with SMTP id z14so2041285wmf.0
 for <qemu-arm@nongnu.org>; Fri, 03 Apr 2020 05:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u+FnfsREkBRJl3VAFQFO7/rhMNP/gbYDcVI3CY4e8PE=;
 b=PgTL/Pb0SOeEMDUp0NePfinYOOQkE3a5HBzVeobNPbfD7pksOAt0+qo33w3g8H9Q1s
 K/BZ6BWnj5tSACiupDysAKCT1gg9cuEkTTZkWWCj7UfQLWA2xhihx0Lo0dg5corp3G0E
 9Neib7BRaRow0rg65Qck4lSUhyEc4R1ITpyERggUM5CZh7Mrukko7ORx/eN05loK+2F1
 a2NxeVK3XXYXt2XEmFckciNGBraiVsRs5qk8dGcd4gj5koeHh/+r8AypCR6TaUdXsNPA
 482mSP5nLlm1dAky6ve/n9Pq67kKb3bw4liAMNzOSZw+sg8XQv1zDs7ZVXZZAkko6yEw
 oaXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u+FnfsREkBRJl3VAFQFO7/rhMNP/gbYDcVI3CY4e8PE=;
 b=MrwoDLm+LSekVSVFW5LMirGX7WsmVfdgRZZ3dt0jFvmpE6RMkGvni82lMybqoQYBTL
 dP+ok1zpW8bOVqbTHL77E511+tVhjQDgn+r9pa4aUloKC4e4U0AUD2CwM0/PY7xrybEh
 hQOyRqgkUZX2ZPGiF3CPIkrqGyqs0JdIPMKGoudenJ6EjkhQmauKYi15+aJNYHRgUm8h
 P0cTaR7YN2SXE787qz5c1GodIcvpNGX25puNN9FImAbXxTxbBRRua4MZEgzvU5ytTq9W
 yz9sQ/jS1IuN45CDLnYGWrieKN4yJC/IyapVttCkHAaq6bWd77hJOopT7SwH4ljurKPC
 uB2g==
X-Gm-Message-State: AGi0Pub/5Wl4tFmtb1o7R7xU/KZefRVdX5Y/F7YEqtZXywzgOiq+kbQP
 M5Hy4ErL2SDG9Mw0SLxI6VS92HN2gSTf9w==
X-Received: by 2002:a1c:bb56:: with SMTP id l83mr1855836wmf.144.1585918034297; 
 Fri, 03 Apr 2020 05:47:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id u17sm12896255wri.45.2020.04.03.05.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 05:47:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-5.0] hw/gpio/aspeed_gpio.c: Don't directly include assert.h
Date: Fri,  3 Apr 2020 13:47:12 +0100
Message-Id: <20200403124712.24826-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gh6tcRmm6jZP

Remove a direct include of assert.h -- this is already
provided by qemu/osdep.h, and it breaks our rule that the
first include must always be osdep.h.

In particular we must get the assert() macro via osdep.h
to avoid compile failures on mingw (see the comment in
osdep.h where we redefine assert() for that platform).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Reported via a random comment on our github mirror...
we should probably do a proper clean-includes run post-5.0.

 hw/gpio/aspeed_gpio.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 41e11ea9b04..e52fcfd9a03 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -6,8 +6,6 @@
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
 
-#include <assert.h>
-
 #include "qemu/osdep.h"
 #include "qemu/host-utils.h"
 #include "qemu/log.h"
-- 
2.20.1

