Received: by 10.28.71.27 with SMTP id u27csp1037786wma;
        Fri, 9 Feb 2018 07:11:44 -0800 (PST)
X-Google-Smtp-Source: AH8x224/hFalSrLsPrwgTSvxM5r1ehgJEOp7wlDpipsz2UJNB/YlE87sch6hmOurNa2ffMOIL8rL
X-Received: by 10.129.41.129 with SMTP id p123mr2145130ywp.175.1518189104327;
        Fri, 09 Feb 2018 07:11:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518189104; cv=none;
        d=google.com; s=arc-20160816;
        b=Fl8f+p3XPv9QfT+lAOS53kh1tWwtrCt9gZ0x4mHraLWTPj2UZsmU+cKpu4o1S7mzBA
         JrfoWXgaqGjGs9xnb4NT+OqV/4zU73Y4pO0ioyROAUivnAijZ+NKYtImFqK8lJEsEqcz
         lHrCiCNFNd7BmcDpYZqCH7uDaFxTLO+Zpr9KIxnvamGBc+FXPSszSTSJNSWjX9jidoTi
         +BvfbgKi9Fgt0Z2yk1fX32D7E3quPxgR8aDgGkmxRr+i8F78hiSgci34EsAcrMsWzJWR
         BGXaWUaLsrw1Boh/Z45vBhqFzXeNcIEfD3U9qlsjZgpuFYQC6un0keoiMFhLjm51L6Vg
         ssMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=v457jH8C5UirGQbVe7z02s40zgDFDhiKAvbmiOY6FF4=;
        b=xWibLcuZvI+PBtJ6sXY1AumUfzYp+IbWoWZKeNCltScG6rdl8zgVQo6+eqW0mCPCUH
         nE+OftjOCNuYkHuIXb2Ihw5Pc2/tqvb+mFHWIeKwPm+vmgfsvYUZgatUsdpE3aKfN1qq
         wFmwWs/vIvmDJMV7BfIDirvTc98RvpsG1RUY/cbxrV9Ly26jtqslEKgqsgVbPgOizOMa
         Qm/HNUhOdTt6kl1LXuzOruZdoMegpp7OxyPGmfoS2aShwiUeoX/lk/M31CNx7O6cUfuh
         +k7G79RMBO9y2BT0u/ef9GABUmYkSK6waZhVWhNM4Z9dvw5w5Hj664sL2A/K58IOBnoX
         iB1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=H27zWaZN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y8si429616ywa.330.2018.02.09.07.11.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 07:11:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=H27zWaZN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60336 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekAL1-000717-Lc
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 10:11:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ekA5h-0002hd-G7
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 09:55:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ekA5d-0005oS-MY
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 09:55:53 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:46976)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ekA5d-0005oD-Hg; Fri, 09 Feb 2018 09:55:49 -0500
Received: by mail-qk0-x243.google.com with SMTP id d144so3450388qkg.13;
	Fri, 09 Feb 2018 06:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=v457jH8C5UirGQbVe7z02s40zgDFDhiKAvbmiOY6FF4=;
	b=H27zWaZNY8GNDzY1WoEnLkistvkC8MgZDHYDxhXmTdpDHqwg8C1FjhPO21rfpbDkob
	gq2YpsiQ48uara7fr973FfpT9eXAhPE/pe2YLWoSXr3naqAGGipCKM50Fkr5ooNn2ffK
	SByI9tCTacLmlz2zQmEZPstvNhqnCyt19aiHo2yK0p+ltSucP39A91yhWrA7bNOV+fDE
	SwlNd4vMNRRw/xjt7xJog3VQKMrcHzmo340lzEFbxGx9v7gUqaxO5/IQuRqPbzULs53o
	m3CDJzk4irtqi0/hde8eI52yZBYf3EdK1c0989c6toWqaQgGTANBCBUGlysk8K7XHqbU
	BqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=v457jH8C5UirGQbVe7z02s40zgDFDhiKAvbmiOY6FF4=;
	b=IHgPjAAhNaJ4Mj9D6DeMdDrIewK/u7AkUMGZfvucek0DnruF8Lp1hsvF3ReyJpbSB/
	M+ruE/hEBTvRVzsLNgTmMPLWaz09w5ETZSiESkFAqVxLeUaHQjOQ/1WfA47PV+mWAgVa
	VmXpE/Vd2LF+d9Zp96Dfq7bPYQE4IZE1/8mZxx0DlxQ7cFkkFE0fuGwqyxYhm1Q9IjsI
	FQGKEONLUxe8qbfKeBZZUwSKmUPGNzQL4asOzPUITGQLXaCHDQ67qK3kpK6od9V8Nayf
	RslHAopdJ6SvjMLKp06TpZ4US8nDm/tIXUCrbPloOWAaMDxVN3AkcVV7oCEQ/6E4I6Qr
	rO0g==
X-Gm-Message-State: APf1xPDGqjLNTyZ7+AW6XWNgEATQMLcfYWPVkXABSLgOMyha4iSvJYPy
	H8GcYWzoIn3i9yxtHCFvHWs=
X-Received: by 10.55.56.84 with SMTP id f81mr4477279qka.25.1518188148903;
	Fri, 09 Feb 2018 06:55:48 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id b29sm747841qkb.28.2018.02.09.06.55.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Feb 2018 06:55:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri,  9 Feb 2018 11:54:25 -0300
Message-Id: <20180209145430.26007-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180209145430.26007-1-f4bug@amsat.org>
References: <20180209145430.26007-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-devel] [PATCH v12 25/30] hw/arm/fsl-imx6: implement SDHCI
 Spec. v3
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"open list:ARM" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Br2T2g40VBXb

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/arm/fsl-imx6.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index e6559a8b12..b6ac72de27 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -27,6 +27,8 @@
 #include "chardev/char.h"
 #include "qemu/error-report.h"
 
+#define IMX6_ESDHC_CAPABILITIES     0x057834b4
+
 #define NAME_SIZE 20
 
 static void fsl_imx6_init(Object *obj)
@@ -348,6 +350,11 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
             { FSL_IMX6_uSDHC4_ADDR, FSL_IMX6_uSDHC4_IRQ },
         };
 
+        /* UHS-I SDIO3.0 SDR104 1.8V ADMA */
+        object_property_set_uint(OBJECT(&s->esdhc[i]), 3, "sd-spec-version",
+                                 &err);
+        object_property_set_uint(OBJECT(&s->esdhc[i]), IMX6_ESDHC_CAPABILITIES,
+                                 "capareg", &err);
         object_property_set_bool(OBJECT(&s->esdhc[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
-- 
2.16.1

