Received: by 10.28.173.206 with SMTP id w197csp3161318wme;
        Mon, 8 Jan 2018 18:05:12 -0800 (PST)
X-Google-Smtp-Source: ACJfBouAMR1AmeTgveCCsZsS84Aap8dxsTHl5w98tS66lm63MV6MMn6VOZMc8bYQxbMv610wIBOZ
X-Received: by 10.37.39.65 with SMTP id n62mr12975026ybn.481.1515463512191;
        Mon, 08 Jan 2018 18:05:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515463512; cv=none;
        d=google.com; s=arc-20160816;
        b=vP1gDauW2O3mE98h1Bxpwl3xmwuFAT12p1wVlyxSFpWdQB9T9VAst0gK/pVkAlsoqA
         W7sIHz3+4BwJa2yeWj72j+Vbdx3qrpZlVboRStsEDf5kKc+aSFEW1ZiFYG2ZOk6U2ORB
         Hdc5b7YnizrMjx9TzWuU1+rgzkK04UWHhaRUcMei2KgEA1n+GWqUeNmkLSFomdG9rZWH
         5Tx6uRfexlGgRTpsjqQUE8YXSfI8bqnUu7mBcfwwgPmefd0X+SBkqFUrI3mH/3s3/gj8
         ywmOIOUuUZ6Xmr9xvLtc8qBdmmOtiroFyxBkEEqKopI96MxWB68ZvZRtWkkRtCpxqplm
         F65w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=oae2SWApKLqkuUll9RGV2Qitv4xndwNT2cDaoOU48eM=;
        b=Q1uYsWxJ3NGTwOPftLPYxFmnhkflqfUj02HAP6XhfqRvyhWrMvD/IdkJM9uRFJu4nt
         fvF3m57UBNFRHnaGSCJnKq6UNdqT5wb34xIMfo5ksi+GCJqveoDwQLwjwHosTG+/XTDs
         tH4oETpWkEh3oo/ypLTuW893hpO1uhK0P2SSqIaG/mY8vB0mHb/Ms/0uNvNlX4rDcAZz
         /AQgKFNIYI+B/wODE8ulrBYELTBI0w5Jwhtme+hyhaBwNbj8YqpvIA9vPIAxoff1kxgK
         By6v9iTiTb3ZJZ9pTvx+4XLqHUd6ECGkOPG0LFPU4cc97ykXfuXUeiNCVMfCygYIkAAz
         9eCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t5/MNeTf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p75si1256698ywp.76.2018.01.08.18.05.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 18:05:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t5/MNeTf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45791 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYjHr-0004YB-KB
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 21:05:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYjEJ-0001vD-NQ
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 21:01:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYjEI-0002GM-PJ
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 21:01:31 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:42076)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYjEI-0002Fo-GM; Mon, 08 Jan 2018 21:01:30 -0500
Received: by mail-qk0-x241.google.com with SMTP id d202so16711259qkc.9;
	Mon, 08 Jan 2018 18:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=oae2SWApKLqkuUll9RGV2Qitv4xndwNT2cDaoOU48eM=;
	b=t5/MNeTfXMMvbJHFklnBWs+7eIPKs2T2LT/qi0OkuuJTxa5STHQS6c2qCGIT8wfNsu
	VC0QnO4HsaViN6/r0ol2TwgaySETjvdc20YQ0Ycn9kr3sMThkp2+XPDIcIektxDIZPww
	yJahLxoZXbeXkHBMI4vtYhwsjWlbJ8mlDlih2a0eXhQePd2NLk4wEE52nsumlI9OLODk
	yw4y2ZM/FD6WN7dxIepP6ifLl2TEV6kPHDbSXYtbx35axIMrf/nXB2PSO4SUYDbfKW40
	hjYHbu3QHJGUTGbbCCEUzPa3m2FrXFJDo92G9ffU2LjQ2QrBdBYVAszvVF+sRDj7z0el
	3zmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=oae2SWApKLqkuUll9RGV2Qitv4xndwNT2cDaoOU48eM=;
	b=El+lQEQKBq9Anmy2pO+VVR+vY7Wu1hAPQ7YZB512KT6vcBGRDTyFnkCWHCUPTWpeHj
	O1qZC/OGpUmEL+C0HsmyG7L5PHObYkkh48rghKBwqjdHYLoDw71OwCD8HeQ8moQan7V+
	eeqhrS62f0Q/hSr0Kgd/z1eop0jbdDI3FC1fw5RfSDLzPcHwWQzZMjzbieK4ORhbAdRQ
	Qc614TDDNIOhYXVj72J4CcOZ6bhOgFslq2wiqfuu9GeIKDfL3SEpldXh+02+L5gOBAmE
	pTsOK5TbpkZJxZkDRPiw7KoUEeiWMAYxW/bJTwaRcZNlMwcfqudVWAb96dbBkDKZ6TWr
	1eYQ==
X-Gm-Message-State: AKwxytcy6JgZOKU/RBNiOUuskLNFLfavRdar0ifoxg97e+FYtJdZD9vH
	Yn7xviNF+ySxKjHuSeN0I90=
X-Received: by 10.55.16.219 with SMTP id 88mr19785670qkq.151.1515463289897;
	Mon, 08 Jan 2018 18:01:29 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	r22sm8605027qtc.71.2018.01.08.18.01.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 18:01:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Date: Mon,  8 Jan 2018 23:00:49 -0300
Message-Id: <20180109020054.32553-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180109020054.32553-1-f4bug@amsat.org>
References: <20180109020054.32553-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-devel] [RFC PATCH v2 4/9] hw/timer/cadence_ttc: add FDT
 aliases
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yFz3BJRp20Ta

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/timer/cadence_ttc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/timer/cadence_ttc.c b/hw/timer/cadence_ttc.c
index 5e65fdb5a0..9aff19d3a5 100644
--- a/hw/timer/cadence_ttc.c
+++ b/hw/timer/cadence_ttc.c
@@ -18,6 +18,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
+#include "hw/sysbus-fdt.h"
 #include "qemu/timer.h"
 
 #ifdef CADENCE_TTC_ERR_DEBUG
@@ -488,6 +489,13 @@ static const TypeInfo cadence_ttc_info = {
 
 static void cadence_ttc_register_types(void)
 {
+    static const char *cadence_ttc_fdt_aliases[] = {
+        "cdns.ttc",         /* Zynq */
+        "xlnx.ps7-ttc",     /* Zynq-7xxx SoC */
+        NULL
+    };
+
+    type_register_fdt_aliases(TYPE_CADENCE_TTC, cadence_ttc_fdt_aliases);
     type_register_static(&cadence_ttc_info);
 }
 
-- 
2.15.1

