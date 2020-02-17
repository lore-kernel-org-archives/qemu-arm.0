Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4945741lfp;
        Mon, 17 Feb 2020 02:57:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqz67luRSagtVKi3R7CeP1zQeuMcGZTEzqFaQUijifYL8SfLA6B/Al2+fo0uGmNgnawWPFvj
X-Received: by 2002:ac8:1408:: with SMTP id k8mr12471586qtj.69.1581937044236;
        Mon, 17 Feb 2020 02:57:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581937044; cv=none;
        d=google.com; s=arc-20160816;
        b=PqLhaknd3BcX2IZ5SSPA1N54H3HsL16Yy1cXfsN6mXvd/HxtsRVIvNabpd/oIwBmYc
         SA7qqNn+9v3b4UkJirg6e4q+7WORz/XTjd8NBSi4Aekeb+7B+8Vm4AxT4RQLllzg2tfW
         MG/tXQZVkgREHhKkfNDUHgFjaMm4TZEiiLbC10LP0qL0ukAcN+nGia9IJW+3RIlXcGF9
         8TWl7U/poy6OGv0CjxLCHJkyTxVr1N3XM6GFhLhsaayoP826zrhi0ziy0G69DfVidY82
         a3QrorRSzmLNptmp9vybBDDXcphyT4aSegXU2/KnILj3h1UkC3wHyCqUn3Tchyit2s6j
         augQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=QefSIhzsJ5EzH0dIBGDnIAWhsi6Ouz7g5ZmP1cUfx+k=;
        b=OCubJTix+jdUrwNLgqvMVwUFQCcEuEk+JlaXZCsUJMHsBEV3nZJQnrPVcvJ9srCw/+
         lRjuEMSP6Fv0Vv9t0RM7k7X+pk7fnyDK2YbgOoei4s7RSqQX67OL/sjzMQ2NhSYlajq1
         5OyiqmcOQ79ZXb+iXsgTmVZOTyZ6gcPC79RaWwcRUXVREZMH+PNczcqb2UeQrq4kEeDS
         Bt3F0/3OUhG6xt9fFgUuKB3VxkFQ5Elzb6FXtXlpHjjWTqdQpcspDfLeYhREMHQgJyxs
         uTMRhsYQC6u3EBob3fDja1nF+50yd1TcCrDB0dgC1WA8uylqdA3vaQNK5mXt+Ig4JgoJ
         Dm+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qYCGkTjX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b9si112567qkj.334.2020.02.17.02.57.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 02:57:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qYCGkTjX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3e5b-0004wU-NF
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 05:57:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34728)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3e5I-0004tw-Es
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 05:57:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3e5H-0005mv-HN
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 05:57:04 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:35495)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j3e5F-0005kR-BW; Mon, 17 Feb 2020 05:57:01 -0500
Received: by mail-wr1-x441.google.com with SMTP id w12so19135401wrt.2;
 Mon, 17 Feb 2020 02:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QefSIhzsJ5EzH0dIBGDnIAWhsi6Ouz7g5ZmP1cUfx+k=;
 b=qYCGkTjXajFbzKAvzqglT1rLluAgxi+fFNBav4fwQufVtBhNR1sPNNoqW+6q9RYLBV
 IIMdfwT8pQWCfGaOZYSJ2vp24lRg8dW6IhsqG95H3yIyj5vCUcIP/I+5uc45GPtOgeZ2
 /AZbwAq8ZBskxJ0JsofCa8kM6ax5MPT6q7MBzoGXvZSoXznjGYfmI7r29fBnhxb2Anjx
 KRzsNsiPP0dwAsToccwEnmg9qi+EPQa8X0VuG7ff53fB4vymzB9SXLOOnp3/puW696Tm
 BQyZhA9NNx/c2EaOGwtiaLAbc/sQZTDJWJ9x+t9l3Iv6BdCAaCplNkoo46hLR1F7ghnU
 +fOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=QefSIhzsJ5EzH0dIBGDnIAWhsi6Ouz7g5ZmP1cUfx+k=;
 b=kNEWfELjtB7G6b0Lo89NqHe6mEzyRRw/FbSOqqsKksCeNnLl4bexAaQpu7VBWaOfd/
 BeYNTrQsYVdBS3/AX+orJOeZjz9mZqOqExy3T+lpkc/8nsiSItXRulZtSgRKRkHWAmj2
 MenRjcSfr1+HmOGlACKfw2LHzDD8iV0mr9PC+UNOggOqfaTDLxywn8CgvjqU1Vfb4/hE
 ZGnqVkb9LCgzAoQPPJFAlmW1qBdYS/blKwgL3Nsnwefp8B9v7SYWS6iSZygOFpd3YDSN
 ZhGa5y/Vj2y9f136PMvRWVy6BV3omBoYh0lujM8qFk6IyziLmuwu6+WfS9uHLzNXPRut
 e3kg==
X-Gm-Message-State: APjAAAVR0h6xVy3njAPGgRv9CXF4JWSDWPeMwDMjUegnvzmepkkfgNLo
 sezmkdXsA2nAxeC8SQE7CMMjBwGMg3M=
X-Received: by 2002:a5d:4750:: with SMTP id o16mr21335146wrs.91.1581937019783; 
 Mon, 17 Feb 2020 02:56:59 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id a9sm135149wmm.15.2020.02.17.02.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 02:56:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/misc/iotkit-secctl: Fix writing to 'PPC Interrupt
 Clear' register
Date: Mon, 17 Feb 2020 11:56:57 +0100
Message-Id: <20200217105657.31506-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
X-TUID: 6+QDCcc6/iZB

Fix warning reported by Clang static code analyzer:

    CC      hw/misc/iotkit-secctl.o
  hw/misc/iotkit-secctl.c:343:9: warning: Value stored to 'value' is never read
          value &= 0x00f000f3;
          ^        ~~~~~~~~~~

Fixes: b3717c23e1c
Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Corrected bitwise-not precedence (pm215)
---
 hw/misc/iotkit-secctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/iotkit-secctl.c b/hw/misc/iotkit-secctl.c
index 609869821a..43cf0f9970 100644
--- a/hw/misc/iotkit-secctl.c
+++ b/hw/misc/iotkit-secctl.c
@@ -340,7 +340,7 @@ static MemTxResult iotkit_secctl_s_write(void *opaque, hwaddr addr,
         qemu_set_irq(s->sec_resp_cfg, s->secrespcfg);
         break;
     case A_SECPPCINTCLR:
-        value &= 0x00f000f3;
+        s->secppcintstat = ~(value & 0x00f000f3);
         foreach_ppc(s, iotkit_secctl_ppc_update_irq_clear);
         break;
     case A_SECPPCINTEN:
-- 
2.21.1

