Received: by 10.28.173.206 with SMTP id w197csp2625938wme;
        Mon, 8 Jan 2018 07:59:33 -0800 (PST)
X-Google-Smtp-Source: ACJfBotu+lv79pkQXeIl13g1uQ+PuEeUzp5pPGuZtmTthpgL7p9zYwdnkClAvn8sdcyX3erW0AZJ
X-Received: by 10.37.239.11 with SMTP id g11mr11205216ybd.146.1515427173623;
        Mon, 08 Jan 2018 07:59:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515427173; cv=none;
        d=google.com; s=arc-20160816;
        b=NElBZREVL1H5JaJckzhoWSEAho0noYSN/Qn05hPKVRDVqTXK3obtjxoCzNad266y1j
         m98eQLZrjh7+GyY9+aJOtlb9QEohPEGlryWo9/ohbTuzATCVyJcPZww6OPy4NBxldfFQ
         xTWDIzBbOe0+F0JXkWm+PhsAvfXQWz6Q/uWZCbc+d67iziN+oGP5MWdfKB7PEAAwJD0H
         cArgsSj6Mr5lubP2dtKFW5G/9+hYds+CMHz1SGKMUqz26B2Po1r8PCFRKzQU6++Q3xlR
         k8RG1rZSt6G0HDT46KitYvz/hvNKMAThoh2zf+3HPk3TybUDCJuOOh3DSSGbw2xkWUH8
         Q8XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=sdasKPjyoac7pDqWSK2PJXnMQJ3q2/Kt3koVAAmzdmY=;
        b=BSjEKynT1nA4nmasygFmptjo569D9YX5BkkKwFoiKyEw+7pa/CF1KOFayMJEiMnQTC
         NmPtY6afZotYIw2ATguyNO92aXrMBaf/IOdw5PObcL6p8yZm3N29PpxC+wa6n3pnTxzx
         Lg47nnjK36N1PVFPcmCUUAr9lTZf09/hp4Tfo1VuRrd2yR8sKHpwY7Tc4EBoIeqRm17d
         sAGv40DLGYCpdhPhJtVvI1u5Pr/2ATngt9cgmY/I96RtpxGFt3QJf/l7Rv8NUL/MF5Po
         1e3EIkHF7RzYZ5dBDspgWHF1NsQT/9jey2H79ROTMaioZPfvkgPbTKA5khyXF6qfj8UU
         5uYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=P0rP0FiZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v7si2470246yba.768.2018.01.08.07.59.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 07:59:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=P0rP0FiZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41387 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZpl-0006eS-1L
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 10:59:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZc3-0002uK-CU
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:45:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZc0-0008Nz-9O
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:45:23 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:40748)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbz-0008NU-St; Mon, 08 Jan 2018 10:45:19 -0500
Received: by mail-qt0-x242.google.com with SMTP id u42so14083070qte.7;
	Mon, 08 Jan 2018 07:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sdasKPjyoac7pDqWSK2PJXnMQJ3q2/Kt3koVAAmzdmY=;
	b=P0rP0FiZ4CEMjJTDDcfqg40y2hVRiv4ect+sKoC1M8GU1nxTGe/ZtZqKzwemqRfNjk
	3MiMrkOGh/NNmb9a+s42YEx2ZfMZHvlOz+IxuJ86Ghkhq3e8UHpxNc0k+5lGejIjR9XY
	2hEp/1rzhBGvGvp+hTt1+uXayhTxW91khnSretwS78MEbYTunSPtydYBpceqVocfTMWn
	+7dhYrgm47fpt+6Lj/6ZaOuAQSDgg1Any95++LGB7/pxjMyVg6YROHmMQhrTMIyl4LcJ
	fE/csLMcYTdWB4rABZ7teHfHgEnRo9RgH2OIb3xqAT7AyhQ9k9Lw9LgMxFSSgP95bLkE
	ozCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=sdasKPjyoac7pDqWSK2PJXnMQJ3q2/Kt3koVAAmzdmY=;
	b=ZSS4rRAFQbRD7MJbfTv++QGeEOXspvq//9xNIVtm92ZSABx8AiUZ8SgStfBkUVtdKR
	wgceHgDV/9lkSGAIdScoCci+oLCgQbGp+QOlgrLewD+WD+hJad49yvK7WgVYhmYNhIm0
	dV50XguMHF9niQj7sgNWQOz09/AIWHv94/HbawSnL4AwiuzPGYFQzgxsuBKVuq8hfwAB
	yqba38pEuR8/0NXKFZygNlXO3CvT5EIBKJWyW+FM9PgAMdC728wc/vdqeWkDZ820HeM2
	v1EPFyVZ3mDn3vtB54ABq05+bpXn3wZjViC60u+dBORqEZ66aIcXeYEzVuobYLD0pARN
	Sk9w==
X-Gm-Message-State: AKwxyteY8+GJEUu+IjbBc0HLO/+kH6Z6m4+SFI2stYEMM7teUbzE6f//
	i/Pc2mNo0RiJKBUz9MKng3g=
X-Received: by 10.200.47.237 with SMTP id m42mr16943900qta.170.1515426319356; 
	Mon, 08 Jan 2018 07:45:19 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.45.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:45:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:42:55 -0300
Message-Id: <20180108154303.6522-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180108154303.6522-1-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-devel] [PATCH v5 23/31] hw/arm/xilinx_zynqmp: use the "arasan,
 sdhci-8.9a" device
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
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	qemu-devel@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fknSz9c7P9mO

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/xlnx-zynqmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 325642058b..e4f9193adc 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -164,7 +164,7 @@ static void xlnx_zynqmp_init(Object *obj)
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
         object_initialize(&s->sdhci[i], sizeof(s->sdhci[i]),
-                          TYPE_SYSBUS_SDHCI);
+                          "arasan,sdhci-8.9a");
         qdev_set_parent_bus(DEVICE(&s->sdhci[i]),
                             sysbus_get_default());
     }
-- 
2.15.1

