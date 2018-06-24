Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2446861wrq;
        Sat, 23 Jun 2018 21:09:56 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdYcUB5MrqvroXwSd66CPRWK1HnE3arcF6Z0hmodKTKaSIoNaCbUAQ4xnwLNA+cljb/GRkG
X-Received: by 2002:ac8:110:: with SMTP id e16-v6mr821005qtg.240.1529813396066;
        Sat, 23 Jun 2018 21:09:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529813396; cv=none;
        d=google.com; s=arc-20160816;
        b=mt2Uz6B4IDPWx81XmgNMQllRQhycF0bquWMI9WG1QOc9JWyXvh4hHWS/6y+MhSoB1+
         SpHIXXEo4vG0qIs5w17ofwe39pHvMdsVXFJSVQ56NyE/jPe5w82BKqCQEjrrOHhPmOTj
         UBal0xL1YFFa8zKxComMroBqjjAu4+NvWv3VDKCuM8/9oIV0LqqLrbGuE5VYXfwXx5/h
         qVXx1xm8WZGTnJ/qKrymo0avRaTN2PbFveO3fD7NJW/Qmq4vMMGQrl6Rql5ZRMu0yIrQ
         XGcNC+s67w67DPoPllwKEBbFQlxusKxYA7kZMC7u2FO6P9knthxIb2L2W4MOAnxhqwWe
         Ehqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=9BJrfe3YsXs6O2ov28k+EgGRDFxXxxjtMYmwMWtaRlY=;
        b=y2ppcFqHdjr4ogZcWzvwkglSvVmeWfXKu9m5Z6JP+edAw+DdBeINUhIQZ19En17DBJ
         pzf5E+E31lWr9ciAbGvcw/fmMEBHrPfgxc73f4R2a3uUQ5c1aaGUn9ATUdc5aFlvupnZ
         SEXzwwpYPTO+/aFa+msgBU2JqXajGp4Jo2KWOud0MbO5lHrVhWRr0pq6E4fjZS24tX2z
         taj3pnaOAzOlFYlngXgZAKMHlGwBJwcqeSi3br3mkLBQoNeouDa22Fn5RmP8e8VDBHJx
         RDyJ6JDboNX56NliJN9lYT6TxgpYEFNtAgwe4MGwSnSQi1NP9z2Ffs+pZ8jF9YNq6ZPT
         2JlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=L50UsBP5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j97-v6si7855595qtb.126.2018.06.23.21.09.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Jun 2018 21:09:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=L50UsBP5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40501 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWwLb-0006Ou-Ge
	for alex.bennee@linaro.org; Sun, 24 Jun 2018 00:09:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42297)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIU-0003tu-EM
	for qemu-arm@nongnu.org; Sun, 24 Jun 2018 00:06:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIT-0003qt-Fx
	for qemu-arm@nongnu.org; Sun, 24 Jun 2018 00:06:42 -0400
Received: from mail-qk0-x22d.google.com ([2607:f8b0:400d:c09::22d]:46879)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIL-0003l0-JQ; Sun, 24 Jun 2018 00:06:33 -0400
Received: by mail-qk0-x22d.google.com with SMTP id o2-v6so5822350qkc.13;
	Sat, 23 Jun 2018 21:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9BJrfe3YsXs6O2ov28k+EgGRDFxXxxjtMYmwMWtaRlY=;
	b=L50UsBP56A6kQYytHBgjVB+2IkwYODPRw6w99sCL/dHKfscNTwq7luHrPD10XBj/B4
	vx6nyoL3Cb6Mc+73BQ/Y+vCNrnggzOZs9/qZ9iQ/u9EadCgkJ0xegFqPFOOvwEzAQEMo
	e2T8nNT88rysqiFEaGG3qla70kcxsFdHvEfFa27pXxkyBQKua7yZcxtKxsfunhJWi1al
	1nKYf5WBrjYdkGuVahG+2R3rsNDsR5zSkFhG5Gzm2cL0dO3WEsbfYWVxH6+I/M/NKtj2
	B/vNo+DOWBRsAYYjAtaKfeIfsdlokYQirWEzq8lNd6gy7cUjJwt/g3MXDiTC/Nx0Q1O1
	xH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=9BJrfe3YsXs6O2ov28k+EgGRDFxXxxjtMYmwMWtaRlY=;
	b=oykA6JDfs+zH5TMKKj2lYmImX0syYaTKIEj2ElGAMccVnt+lwVybBVq2ERgkjE/qTr
	QhR5xeHX9kSCrIPrcUoa4m2paweVeQE/SqO3AR93TqiC/XY7N0K4h5eGFCOf3rwkvkNv
	PVm3343y9y3nAMte1kwWfj92df14RCQkc726XL1/w+x7SCNz4cs8H4P5AWOxlZ9/q8nB
	xHFsvwXVd4pVkwNGSv6fjhVXm41x2BHZAcEqyy1USA1A8jkYuPrNyd3RuTuz3ZNVhCCX
	M6VJIe3bx6hcGqSRDEgswVBpMgvba43wEto9hHt0vqt5yRADKLPAd4LjCa2EmDO0yvfj
	q1hQ==
X-Gm-Message-State: APt69E2KkJK9MfJhP2qS7It640fulP9cnXuiBO2POOaa5pLrSU0Qv9gB
	Euoes7IsU3+nCnzZCgA44wI=
X-Received: by 2002:a37:16d1:: with SMTP id
	78-v6mr6700828qkw.271.1529813193169; 
	Sat, 23 Jun 2018 21:06:33 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	d14-v6sm7145313qtn.90.2018.06.23.21.06.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jun 2018 21:06:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Date: Sun, 24 Jun 2018 01:05:56 -0300
Message-Id: <20180624040609.17572-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624040609.17572-1-f4bug@amsat.org>
References: <20180624040609.17572-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22d
Subject: [Qemu-arm] [PATCH v3 03/16] hw/dma/omap_dma: Use
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
X-TUID: RfroIU4nqCyv

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
2.18.0

