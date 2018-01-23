Received: by 10.28.71.27 with SMTP id u27csp3506264wma;
        Mon, 22 Jan 2018 18:12:45 -0800 (PST)
X-Google-Smtp-Source: AH8x224i3RZ0M3y1lqfF0JnpC0bIA4o39SzG7AghvngD+Ex0tkp+mQlsS1bpYIBYSlUvNwGrNtEd
X-Received: by 10.13.202.19 with SMTP id m19mr882245ywd.70.1516673565312;
        Mon, 22 Jan 2018 18:12:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516673565; cv=none;
        d=google.com; s=arc-20160816;
        b=yb/0/HNRb6m5x6SKqP2TqXrLiyz7Iz69xhI6Bxqy/V6U1V/bdNcs7q6fkavL8abN0O
         3psLWTGouZrb7fJbOaxy+GdcKXUqL9V1PtqfOAnJgOSlmWiTEyCposvL2VxP7tuaUgHS
         1jwKCXmHBnKOliDtYiKNejNpTVidt5A6geMML6JhRjd089WR8a0/ut4bnZ8eb4IpgSS1
         +dxQ4AJguFzgSh8zRF1ZWsILzRZfL5fyW0YTKciroLL5FOv3eHvnuyBfSU+Gw8fs1Yr+
         zCu2nPqYkmaT3KhE+p30pogmfajDRjAamfQu5FhrjVZGyEpEFLjHAek2aclPWzGtsHEY
         nAYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=BCfxacNo86FeoC7T+O174SqMu1V+9YEWpl45LPElt6c=;
        b=u7ss+cF+XmokaA1MEkYXy02065ufKEpNQy4D06564OjnsYZXNLTnoxdFr6/e7/SpVY
         M0PPrBzUt+n/XK20G1VpTYyoHrOkrwGWJsWGwk8bpXihD6dslp0e1gXoXBq5NNcphP3a
         E7JabY2Zkysl87S1Wc/6a5QHH0DGmOGilEohYxzEcLKJp8xXQqTxoVhVa5ZAnljhYehU
         j7y2uEI/1/FjE3uvdPpT56D/37bDecYdEJU+psUwZIbfV/piaRkGHokBlApmHQMSvp2u
         sKOTIOXrjFiI87Qu4L2pVvdQ3GimzCJKxDMKpPEi9h0GHPvEQDXDVUffx3yto2oITLTf
         5g4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ty5Rg2lO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y12si2231695ybh.155.2018.01.22.18.12.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 18:12:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ty5Rg2lO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55123 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edo4q-0008BB-KC
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 21:12:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edo1g-0005n6-OY
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 21:09:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edo1g-0003ke-0b
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 21:09:28 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:33740)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edo1b-0003ho-NV; Mon, 22 Jan 2018 21:09:23 -0500
Received: by mail-qt0-x242.google.com with SMTP id d8so17517976qtm.0;
	Mon, 22 Jan 2018 18:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BCfxacNo86FeoC7T+O174SqMu1V+9YEWpl45LPElt6c=;
	b=ty5Rg2lOCdGI823iahQmKsTkJ3e1LzKGoMThIDIz0wwHrpGQLYNYvnDZ9TfMvtV+T9
	Gpp4UfqcBJxacZkeOmBpD2gxK77vQzoTDV4ell/zacDhg2XcXqNBBTH8rtz0cd3okxGR
	mmeYhkj+RILhwHbFFyp/I9+46/c7t71B4bzKyRALy3IwJoM/6LR6z+zpEa9/Lkl2Proc
	orFubQ8zC6M4W6h0okNrlFR9SXqLueB8skbog1KLfehRZB5Xkss04rGbjZgRAttr3lnp
	WnGmScC+ce9oXLVUQLWVuRyEMZQO5dAqWonsDeNLuT2FBs3EJgBaXAFb7jwRZVlJ0c6p
	eGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=BCfxacNo86FeoC7T+O174SqMu1V+9YEWpl45LPElt6c=;
	b=ZJVtEmhiuiMk2Wq5QNtgp5HCSArc5ju5Q8FVAYeup1knn0GXKwR8QcyV2/Y926+wLc
	wtPKMfxB5EIyRn1FositJKBepVf8LwG5fxrCUVi6Uk1l/DupqGQ3g+cPhj8CejKYW0dK
	a+3IDEM1X5LX31g/Llfz8sKnt6oSvV/9+mbxC2w52zQxs/kBQh26urhuqNDTuz5sfTly
	txLrzlN5E5UEwS0jehSkgNxSkApGbixRlirfXLYwJOqutygL8ugb6/JFG/PzkGYgOIXK
	9R1PkuAwONvo3d8P8wyCme54a/MoF35Pvlu60aMsuImhQt/B4nrrRMV4kjb3ST8FAEaU
	/HUQ==
X-Gm-Message-State: AKwxyte9gBYWacpMVb6T03YFOYmrp+HlLKwdx8M8jZ7DHNz9hip4JS6w
	ACSMx0vmMuJRCSC/53oEgQk=
X-Received: by 10.200.48.71 with SMTP id g7mr1397436qte.317.1516673363368;
	Mon, 22 Jan 2018 18:09:23 -0800 (PST)
Received: from x1.lan ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id j19sm6514120qtc.1.2018.01.22.18.09.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jan 2018 18:09:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Date: Mon, 22 Jan 2018 23:08:18 -0300
Message-Id: <20180123020820.1288-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180123020820.1288-1-f4bug@amsat.org>
References: <20180123020820.1288-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-arm] [PATCH v9 14/16] hw/arm/exynos4210: access the 64-bit
 capareg with qdev_prop_set_uint64()
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, qemu-devel@nongnu.org,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Kevin O'Connor <kevin@koconnor.net>,
	"open list:Exynos" <qemu-arm@nongnu.org>,
	Marcel Apfelbaum <marcel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8pnEcdb2hqo6

We only set a 32-bit value, but this is a good practice in case this
code is used as reference.

(missed in 5efc9016e52)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/exynos4210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index e8e1d81e62..d89322c7ea 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -378,7 +378,7 @@ Exynos4210State *exynos4210_init(MemoryRegion *system_mem)
         DriveInfo *di;
 
         dev = qdev_create(NULL, TYPE_SYSBUS_SDHCI);
-        qdev_prop_set_uint32(dev, "capareg", EXYNOS4210_SDHCI_CAPABILITIES);
+        qdev_prop_set_uint64(dev, "capareg", EXYNOS4210_SDHCI_CAPABILITIES);
         qdev_init_nofail(dev);
 
         busdev = SYS_BUS_DEVICE(dev);
-- 
2.15.1

