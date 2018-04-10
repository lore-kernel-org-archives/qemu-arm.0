Received: by 10.28.71.155 with SMTP id m27csp3785176wmi;
        Tue, 10 Apr 2018 06:42:17 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/KmOU8FW2lyYGuTnoCTSLiV14/DA0pIl4DWDlsuYdW1FpneBFZ38tiqMlGi3JoRj9c6A2O
X-Received: by 10.200.42.217 with SMTP id c25mr731314qta.310.1523367737718;
        Tue, 10 Apr 2018 06:42:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523367737; cv=none;
        d=google.com; s=arc-20160816;
        b=iPCeH1ea9ot15/04do5TWycUTCmajlyIaiCAvYKVJ3ACtYjTHK64kkGUpHNskPu5rY
         hjFel3A7G9G/+BdP5kxnArecZpuqib8ttMn7+Og9XRKcMjwTYDO3VK5+6ggUZyziUBI4
         f30qDEuV8Cr8nFxQ7N5eqWOHw2bxv8U7l5JKnVVVp5IVwrz0wJ99qq9FmarKIaVekIeO
         Fa9QqShVvBOY5Fg7TcDavRqtnT5LZgVq9nb69REvRJI8xgiy2r2rL6/LfgcDEnDrjGBn
         TnAcVVBlTTLn3yPPiZy64YaR5yDaY+jomHEhtv3sjT+F4BmtsuTgpXy1RE9VT4bZnH9I
         37JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=AzmQhTlrVyFyR6dp6J43afLMOXMX7x7hURGBlD6tEcI=;
        b=LvvHPaexxKCW7pnZjxA83QY+xhy6I7s562nnK8kQR4I7nK5N/tgL1b4XtZXjqAZuDT
         FFk0aSXpZO3SHXd+41DH5xxpWQXsD1sPnsida9K8tQmAgz5Q23DT8I2EQBD4tTny58Al
         ZWwauevPkI54yQf32qxpWrPh4xtmk0XQjr3VP3jaDgym/nvvISCLVP1+XQccGLGWRDMi
         JqWe0X9VIVUmfD/taV3p8hLIyaEdanymE69runbnEkTfjwhNtSzRJbMMIDNS95VGbSMR
         JAyNddgMWr2/ISHKc/9HoFesGSISatczO+yF5znwxiwY26fK0epoMyWzqYDpde6mKIe4
         x9LA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k18si1129538qtj.115.2018.04.10.06.42.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Apr 2018 06:42:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46002 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f5tXN-0004ao-7E
	for alex.bennee@linaro.org; Tue, 10 Apr 2018 09:42:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45492)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1f5tXE-0004a6-Vs
	for qemu-arm@nongnu.org; Tue, 10 Apr 2018 09:42:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1f5tXD-0005Mz-TH
	for qemu-arm@nongnu.org; Tue, 10 Apr 2018 09:42:09 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:40766)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1f5tXD-0005MC-Jp; Tue, 10 Apr 2018 09:42:07 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1f5tXB-00005I-1D; Tue, 10 Apr 2018 14:42:05 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 10 Apr 2018 14:42:03 +0100
Message-Id: <20180410134203.17552-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-2.12] hw/char/cmsdk-apb-uart.c: Correctly
 clear INTSTATUS bits on writes
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-stable@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DgAvcEveTjwL

The CMSDK APB UART INTSTATUS register bits are all write-one-to-clear.
We were getting this correct for the TXO and RXO bits (which need
special casing because their state lives in the STATE register),
but had forgotten to handle the normal bits for RX and TX which
we do store in our s->intstatus field.

Perform the W1C operation on the bits in s->intstatus too.

Fixes: https://bugs.launchpad.net/qemu/+bug/1760262
Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Not a disaster if this doesn't get into 2.12, I guess. I think
it's missed the rc3 boat, so if we need an rc4 for some other
reason we can put it in.

 hw/char/cmsdk-apb-uart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/char/cmsdk-apb-uart.c b/hw/char/cmsdk-apb-uart.c
index 1ad1e14295..9c0929d8a2 100644
--- a/hw/char/cmsdk-apb-uart.c
+++ b/hw/char/cmsdk-apb-uart.c
@@ -274,6 +274,7 @@ static void uart_write(void *opaque, hwaddr offset, uint64_t value,
          * is then reflected into the intstatus value by the update function).
          */
         s->state &= ~(value & (R_INTSTATUS_TXO_MASK | R_INTSTATUS_RXO_MASK));
+        s->intstatus &= ~value;
         cmsdk_apb_uart_update(s);
         break;
     case A_BAUDDIV:
-- 
2.16.2

