Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp853407wrq;
        Fri, 22 Jun 2018 06:47:24 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf+SsWZQ/zGVBPv3wlcnME4I7BXByQ727zOSzZrWC95SUN4+R8PN3DlMzBQ4JTyc4/dSS1+
X-Received: by 2002:a0c:ae0a:: with SMTP id y10-v6mr1434254qvc.157.1529675243925;
        Fri, 22 Jun 2018 06:47:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529675243; cv=none;
        d=google.com; s=arc-20160816;
        b=m58kdW0fODveai9ZGbmFfNBdURYrgUNFJGvKejXC8rxT097aVLY84RFhaE43LQaed/
         jKnsWQSgWTD/n0BL1czHksWPDSl4NeS+dFcHHI8QPYyIY3Ral2k1Mo9lXX+jFgGWeZwo
         naSnd+7ccf+WkrQhCwH2e9MaEaMUPGsQkw6nnK7DWNhkzFpA4cSjFjIZvfFYnL5BHCTs
         SkGzeG/V2bXbmZ9LmnAK096Bgt6Qim1f9j1QFCSb0dqTv9UY4/K36mDA18wklFNRyc+s
         N2KsjFVZ27sVzVqSuEc1bV5uBXx01PDmNpxKt2ofxIrlDn28+unybK1dAvAL2evljE2Z
         o+ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=fHiQErN6yopcx1uS9Z7wFWgWzQ8k9MSYNeu5WE6YAp4=;
        b=ap7Vmo0V4eg6uWvVTw929T/KyMLGEDSeJrRyaZC4z3I/fOJniwQAzR1LWOtuM2pd2o
         xxdAyzho5Bju7JNos5DXO4SphvNCHH7JTbXGUDeM8h8k+5jdIstwbL3P3HkUp3/IHs12
         5EwJJQxCaLV428GjSj0gxWnD3oSEH1WMjijAITI1UvjBCe+9uyS7qVOzrLoR6hHwIoKD
         UiZM7PAha4TAFhDhMLWgKe494tS1iX/d4AponhtabOarET1bEW8k1reb6KilvYAxDGjN
         cnEb2JIgDAiecTYUZ7StYrmwAX8Q5/Cie50M5LsXT9fIGOu7zYwsr6qujTRM3ZpRnc7G
         YJbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="l/p9whak";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 9-v6si6807844qtp.121.2018.06.22.06.47.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 06:47:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="l/p9whak";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34062 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWMPL-0002vZ-3n
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 09:47:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJB-00062W-M0
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 09:41:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJA-0003GG-It
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 09:41:01 -0400
Received: from mail-qk0-x230.google.com ([2607:f8b0:400d:c09::230]:33658)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJ3-000301-AS; Fri, 22 Jun 2018 09:40:53 -0400
Received: by mail-qk0-x230.google.com with SMTP id c131-v6so3676450qkb.0;
	Fri, 22 Jun 2018 06:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fHiQErN6yopcx1uS9Z7wFWgWzQ8k9MSYNeu5WE6YAp4=;
	b=l/p9whakpVaCbIZ3Rfd3dHpN+FREe7/YUtk7I7CA0EgNdQC6cxfDpU/1nfUM3gI1SG
	kKSAxfIqJgvbqYcRDUeuiBH61kgfuMRtkB/Y2eSSatxleduM+XfOyRM5zxYEfxItTQln
	oldgAkRK0vjOT3tqwpQAm3Q7tNQEH36GWeCn0YMA5xH+OD55XkZN8c8NyAJmImoVfXVb
	Mu9NHrr79JDnbhGOTjYHtJDPXudEnOjjm40uVTU1DqLJ4IXGjyv1E6IX+4R5t15vyhaU
	nvOMUieYV5CGddXMacEJljRhJcDnxsGj85ix1nyMYPWnHnf++dKE8kuZ3u0nYCUo2jzQ
	hm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=fHiQErN6yopcx1uS9Z7wFWgWzQ8k9MSYNeu5WE6YAp4=;
	b=Akg6Jklffz8aLit5VGG7KSTxJ3wul0IiFFUFPaf45YLK4wcjKtb9jTLMp9PrDnW2SZ
	Ptgx9eHpEMRCcTdLKLPPAG4hjpgZrjqal4aPpmV40hNDHfJhBxTCqsU8yHTtZO6vPIe+
	hXU08GqB60LlHn7L7LqW5ORnbs2fNPhAWNsrrp4lmUThJDcjlXBCG8avBpmDT65IUKq5
	RzAMpZi8AHkX59zu6RQ6Wv1xP79NumYVb/UvR/L1jMQ5sYp1ola7Vl54Cfwd0duP9lNF
	fxCwZPn8DZYA7hn4stN4kmjWxleCc8Rmv9dDqyUlQJBOCIXlqLiDt7Bxec2O67RxN4pe
	o9kw==
X-Gm-Message-State: APt69E037U8SScE8CEyOZ5t6qleqSDU4i//wINfsTYYw4NqQ4YMEsiju
	mNQatxoFqLGDiP85X1zNGg4=
X-Received: by 2002:a37:9846:: with SMTP id
	a67-v6mr1280582qke.219.1529674852708; 
	Fri, 22 Jun 2018 06:40:52 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s39-v6sm6006629qts.42.2018.06.22.06.40.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 06:40:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Date: Fri, 22 Jun 2018 10:40:25 -0300
Message-Id: <20180622134036.23182-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180622134036.23182-1-f4bug@amsat.org>
References: <20180622134036.23182-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::230
Subject: [Qemu-arm] [PATCH v2 03/14] hw/dma/omap_dma: Use
 qemu_log_mask(UNIMP) instead of printf
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: taxIgDRJwugP

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/dma/omap_dma.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/dma/omap_dma.c b/hw/dma/omap_dma.c
index abd18c67ea..ab3a1b0451 100644
--- a/hw/dma/omap_dma.c
+++ b/hw/dma/omap_dma.c
@@ -18,6 +18,7 @@
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "qemu-common.h"
 #include "qemu/timer.h"
 #include "hw/arm/omap.h"
@@ -1439,8 +1440,9 @@ static int omap_dma_sys_read(struct omap_dma_s *s, int offset,
     case 0x480:	/* DMA_PCh0_SR */
     case 0x482:	/* DMA_PCh1_SR */
     case 0x4c0:	/* DMA_PChD_SR_0 */
-        printf("%s: Physical Channel Status Registers not implemented.\n",
-               __func__);
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: Physical Channel Status Registers not implemented\n",
+                      __func__);
         *ret = 0xff;
         break;
 
-- 
2.18.0.rc2

