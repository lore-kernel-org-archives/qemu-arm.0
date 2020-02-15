Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3228201lfp;
        Sat, 15 Feb 2020 08:19:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqx9ygqb8sxoUarx0ykYEyA7Mghg2hI6fKb+K84TkayTlmhQcwJ6Q83MpnHnSTZqoQENb5iJ
X-Received: by 2002:ad4:514e:: with SMTP id g14mr6704179qvq.196.1581783581336;
        Sat, 15 Feb 2020 08:19:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581783581; cv=none;
        d=google.com; s=arc-20160816;
        b=Oso4hjLfQ9gHA38JXIQVYMmjXGDvunQmRMV40GrpSp8poVCVcC5pFNQzNCAaWtasDA
         ah2DPgTkVJXPytVbqArdyIAcU7uEImnnKHlRhUnUow7Rnu9MjyI0CEUZaZcHrz/wpbIG
         32mqH58HHXCfsRGir8HUWD9H61gXQfrYpryo2gS4vqlt/106qT6UYAqneAxCHiN1N3Br
         eqbLQwX4yjb/EyCRgdDIVBAvk7sctlup12MWtmOgQOLkPZSvcvWdLLhxg1/Ny+lrR6nN
         sa0GjtUCgXWA/TGEZDMVK3bmBPyQu0GpEvd4Y3Ai73mUIDYgUUDyRbog+kib9hSp30n8
         4mwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=eTn2oK2dQxQzFgBTTAIiys0g5gffJIiQC/GfhEVlsF4=;
        b=VxsJCMLEapeMKaZs9DkDmZaFK2Q9OO1cHgM9Ioprn2P8bh0QjXial/OUTsx0c197p0
         K9dNmiCKXWnKHfaoHickeo2ay11wCG8KwpyCdifrXgxUTtDkjOZph2JtKpBjaZ1gsNRt
         vYITvIpD//A6EqVRJB09Ly00KhjEShOl2ifv7xkSsGHPmfqKvluj0hvWh+68wrGgduzq
         ELObZZtFZfTNrIKEvw7usTNoUaXNm/lYQxi8VxeuS5yR1omBDUMwrxhCQ8DAiVm2+NOR
         nz/ATVmd3aAL4SClJRsDtYi6bODThZQ4+pMXg+0tTm647R38I2bHlw59wa8CRg4ROe5O
         uNqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=H9HuCdzN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2si4270678qtj.97.2020.02.15.08.19.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Feb 2020 08:19:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=H9HuCdzN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:52446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j30AO-0006w9-QZ
	for alex.bennee@linaro.org; Sat, 15 Feb 2020 11:19:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48165)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j30AF-0006pu-ST
 for qemu-arm@nongnu.org; Sat, 15 Feb 2020 11:19:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j30AF-0000EO-0y
 for qemu-arm@nongnu.org; Sat, 15 Feb 2020 11:19:31 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:51435)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j30AB-0000B3-SF; Sat, 15 Feb 2020 11:19:28 -0500
Received: by mail-wm1-x342.google.com with SMTP id t23so13098689wmi.1;
 Sat, 15 Feb 2020 08:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eTn2oK2dQxQzFgBTTAIiys0g5gffJIiQC/GfhEVlsF4=;
 b=H9HuCdzNLNf5wF5E9yZCwWovzZFqAKQ08jQSCepYUtrA+g5tne/7ID+2V6XXf3oDpI
 DtjRFNn3c+BLKf/ssniyT13Z8WBTrv5ze6E1AkSzHD3MIVqu9tvgkUC7DUaG5y4oC0EG
 GjBnjd+/QtzwEvJpBRX1qOSv/P3W1HMGfMDF+4SrTWR07vO1RQbHXl1ufUNpMQ3+6QxV
 9i1+5QAvmsVsMaduNB8HMwuoj2ddXPA2UeZ0jjIxkJdlqRpJDZMN1SYPDmN2xL9g+9h+
 LBNyrJaPZy4zjB1ko8GAnpkfsYkNzOgys/d9FE8zGOaY9gmTUGxzLMQy4M0JEA+Uq2QQ
 HW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=eTn2oK2dQxQzFgBTTAIiys0g5gffJIiQC/GfhEVlsF4=;
 b=VznbnAy+ysgifIkEdkh6oRNzu6+Ezp2jKDvESuUFKsm/cIeJf1VR7JKfu8dNzFK/I7
 Q8lZKrkA2ndSxAz/PpmrUlh4PxEqBYVrL2JPHlQk+rZAYYx20rwlev09ekdNNjX3xTo+
 KQ7mz+C/NIcePRcj4sROdLUcv1p+7genVwwTw3RWyT2obprpJItDPt5l1DqfXyDASTuG
 0YdFwzQ2ccGDun6EgW22W5BfL9nEKoYQWdDKLh+BW7A7XRvWpOl+/p6B0EmnZNOUyDRC
 09o9lCV8gHj8+f2Mn8jS3sgrmAEJfb9GK/+cjZqsDE2oqHE6XCHCxV5tu1G2E7prpJ5t
 GKhA==
X-Gm-Message-State: APjAAAXoUumVMD7IlXEgZH2zEBaRt9sXn7fTHrGwfALGThuj7jYXnVLS
 mgAotUUKBoeoIfuM7BztSrwUsP4/O1M=
X-Received: by 2002:a1c:65d6:: with SMTP id z205mr11205173wmb.38.1581783565941; 
 Sat, 15 Feb 2020 08:19:25 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id c13sm11899255wrn.46.2020.02.15.08.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2020 08:19:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/misc/iotkit-secctl: Fix writing to 'PPC Interrupt Clear'
 register
Date: Sat, 15 Feb 2020 17:19:23 +0100
Message-Id: <20200215161923.4741-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ictJdCPGzckd

Fix warning reported by Clang static code analyzer:

    CC      hw/misc/iotkit-secctl.o
  hw/misc/iotkit-secctl.c:343:9: warning: Value stored to 'value' is never read
          value &= 0x00f000f3;
          ^        ~~~~~~~~~~

Fixes: b3717c23e1c
Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/iotkit-secctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/iotkit-secctl.c b/hw/misc/iotkit-secctl.c
index 609869821a..0d5556dd17 100644
--- a/hw/misc/iotkit-secctl.c
+++ b/hw/misc/iotkit-secctl.c
@@ -340,7 +340,7 @@ static MemTxResult iotkit_secctl_s_write(void *opaque, hwaddr addr,
         qemu_set_irq(s->sec_resp_cfg, s->secrespcfg);
         break;
     case A_SECPPCINTCLR:
-        value &= 0x00f000f3;
+        s->secppcintstat = ~value & 0x00f000f3;
         foreach_ppc(s, iotkit_secctl_ppc_update_irq_clear);
         break;
     case A_SECPPCINTEN:
-- 
2.21.1

