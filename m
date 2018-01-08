Received: by 10.28.173.206 with SMTP id w197csp2613526wme;
        Mon, 8 Jan 2018 07:46:36 -0800 (PST)
X-Google-Smtp-Source: ACJfBovcUBrEmhTcCpa/LANqyQPJ2UXRrGjWtw7bwqdkWYb7FQnLR0kCLLfHaXpr8N1QxdJ4E4hg
X-Received: by 10.129.172.83 with SMTP id z19mr10932624ywj.341.1515426396066;
        Mon, 08 Jan 2018 07:46:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515426396; cv=none;
        d=google.com; s=arc-20160816;
        b=SPzrDPIaAjz7rRUVQdWXXMoUZvon0BPoJIfdN0CSsIJegkVmTIHC8urhooVG8nPL/R
         +7LbFoad+fBUAXd0Uzt8YDW45ZMuc1+R8/Vu7WiIuG8WTfVcLGkTLufvXnKWolHIttxR
         VNoJz79EelFCIaSPVzA1leWtfgOPiRXGOU5Ur9pI1Cvjg1lRjm61M+ed7OcnaMdru6nJ
         +h63YcbYxsl3KhE5qvKUiw1I4HWLTnJra4yA46Y6RgTWViNAS+IdHRhnoAMLidlVMHon
         FJroEXE7cOMkPKoTqXjWAvox9qEqtOdmZHSxPcs2hKulMPjogMDmtQgVhbEI8lyrQIus
         nQfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=+1tN3vBG8qhr/BXrox+jHRQOEKUSwa3Ij3Y0ZHNFJqM=;
        b=wdVUzIXnYIhGK5gxhbsSi6h4XLogiKR2oFbIb6rjYI90I5+c2WRa5pOzyYKU7UJ9LW
         kNlm4APKkISXzBo50YanOPcCkzZGQhu5Q0+R5xcxBofxXbnf/jdeUoKEMoP+AH1Eyprk
         2TCa9Eq0RyM3lVJr2iJS+Fpa8qjsKyjkvoGOYbe5c3Pc12NUFaIpKbOnfckj9pC8DWCt
         6w6fAwWKMSAuiVSu9c8mN8E40Qq6mq6N86JiQtAU66QFFycOh8BrSFOns9dTodaU1Ej9
         loOX5Xv46+0eAA7UchpjB+fhzF2vqGBTt/w074AacdQscmLuFklRwcRGEYHA6f2iWlPJ
         lciQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tCVao7Si;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x83si786994ybg.590.2018.01.08.07.46.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 07:46:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tCVao7Si;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41234 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZdD-00037N-Fl
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 10:46:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZau-0001jG-3O
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:44:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZaq-0007Ql-Pz
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:44:12 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:46510)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZaq-0007QS-L9; Mon, 08 Jan 2018 10:44:08 -0500
Received: by mail-qt0-x241.google.com with SMTP id r39so14068374qtr.13;
	Mon, 08 Jan 2018 07:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+1tN3vBG8qhr/BXrox+jHRQOEKUSwa3Ij3Y0ZHNFJqM=;
	b=tCVao7SiApL9ruOMAGxn1sbmIX9ST3rc66vDm6wx1LU7zXGqvEverF9/HnbzeK1o8l
	XVhNrW1koncLxwnfW779CE9IQLxJd7SDBITMWLgbV280O6eGUB7y2mI40bdqCHK6Chr0
	NF/Kjfxnc925Aq4MMyQcsli5PoH2NErWYpQFS0wgU8m/yrbEfQ6KdvIxt+0jpAtqNnIR
	H0wEuYSBt3i4/SreAa+FUU79TVkLD+tFjQr5ZTmSntTyK1zHhCP0bLq2BmW165CN4bV/
	j9412XRBZYAyQZ0ktmeYHsAOvn6C9QyHTPWtZ+srAUge2pUFP1DOSsilDC9t6WG6Urvb
	mI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=+1tN3vBG8qhr/BXrox+jHRQOEKUSwa3Ij3Y0ZHNFJqM=;
	b=PQhOtCriDtKcj8rUHK1QFzsSGa+KD/3HWYkh+5EuGELV6OCYA7Tm6qr5qTUqhuG7DM
	2EFakSLJeVl61KnL22vmPqqKIL/l6N93d23TyYHoClj/neFT9NoDxnJLCJYAr7u5gNCz
	RG1ltViTsWZ1oL451JCKh5+BHovRZWlFv50v+a0ZAX31bUx2Fz+UukaMoaYagAp6C0Aj
	VIfc4zrdQ3KAMD3kbuEnoLByodbY5z7EEUAOqkAuKHg/JjKXGHB6QAa25fgNJmB/bepB
	V6E02r8/VtVt4vGckMq5ld2Yg4nYm/Bonhww5rpCyjGZq/bNx8B1W2hIB8g+32Md2HU1
	Lhbg==
X-Gm-Message-State: AKwxyteVpeCEKqiRchhMF/VnJTKUEjDYi0v68wUr+idxIuMjDuSCDwH1
	Lbti8+651FSONdGV8XsSSWw=
X-Received: by 10.200.40.115 with SMTP id 48mr18026211qtr.335.1515426248098;
	Mon, 08 Jan 2018 07:44:08 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.44.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:44:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:42:41 -0300
Message-Id: <20180108154303.6522-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180108154303.6522-1-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-devel] [PATCH v5 09/31] sdhci: add a common class
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
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p3O9giBjOJZa

so this class can be inherited.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/sd/sdhci.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 4a9c3e9175..a80b7c0424 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -124,4 +124,16 @@ typedef struct SDHCIState {
 #define SYSBUS_SDHCI(obj)                               \
      OBJECT_CHECK(SDHCIState, (obj), TYPE_SYSBUS_SDHCI)
 
+typedef struct {
+    /*< private >*/
+    BusClass parent_class;
+    /*< public >*/
+    DeviceRealize parent_realize;
+} SDHCICommonClass;
+
+#define SYSBUS_SDHCI_COMMON_CLASS(klass) \
+        OBJECT_CLASS_CHECK(SDHCICommonClass, (klass), TYPE_SYSBUS_SDHCI)
+#define SYSBUS_SDHCI_COMMON_GET_CLASS(obj) \
+        OBJECT_GET_CLASS(SDHCICommonClass, (obj), TYPE_SYSBUS_SDHCI)
+
 #endif /* SDHCI_H */
-- 
2.15.1

