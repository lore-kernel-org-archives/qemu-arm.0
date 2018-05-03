Received: by 10.28.4.212 with SMTP id 203csp1807677wme;
        Thu, 3 May 2018 04:56:41 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoe40kbdiD3Z7uXW5oSWN++F/p3SEQmcCL2MtrET7vavoqCdkUPlnKMlhIl9ih5QUeINb+I
X-Received: by 10.55.214.215 with SMTP id p84mr18344705qkl.74.1525348601447;
        Thu, 03 May 2018 04:56:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525348601; cv=none;
        d=google.com; s=arc-20160816;
        b=KbKmeEE61XNtRhAaPiDR6h72d7X2bDh+Z4rUP27h1OC8G2+qYCELIq1uLmZe9bu5EP
         +HZ8DSRl11V5sRVw/dgjbDEDEKSAUIT5hFBTkN/PHI6q/5UgCBASAFyb70rwvkaHQh14
         dIu3jsPFrVdesk+5MD72YVVgjnIVMAdSevJl90JUf6QBvW9C6YtltlsJ+rS+xh2uQ6i+
         yTYG42ZiC8RdPi0mUed/2Jkx/1g3m/Jt7Dzr4lTV3YGN/5tCHhjPm3njBIjfa+5f5xdp
         1L3uk8Wie7m3crlYpnLPrYvPLmzAGDS4fvVwP/PBM3U7cBAldJ01RskYSOXfz8lgOK+G
         8OXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=VsuIftqb9oiT0zJGWF10gqiR4mz8au3KDT5F4swM9tk=;
        b=X9tqhE3mUlFcoQB8HYGmvMMlU1LcwIkGt1vTpuBLy5o/0TS3UkBC2cOW0kiQUiAIuC
         YuauUeqsg9qLKoRDlyjV6/jswE4eI0HN08S3E1YTipsxZKN3PjQJ0rSXVSWpInIBkgmQ
         33AzzAJV4Sczub8vZVtmvkFYuda30PTo4HLDcordKBzUmEJo/gLib/F4xDfzHAJg6+Fv
         6p4zwuT4PjmNv02ZUBvrJIE7VisIovYWCg5uEBm0qtwa0VnGSY4KYHMhEpxWzWphGJbX
         lSYxe0qAoAK9OAc+41of+5cZmAxHEXgWc552SUvRjCYGHxATPQDgVFu/LRoPcVhOlhGp
         7Hjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WteAm45k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x35-v6si3670699qtc.158.2018.05.03.04.56.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 04:56:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WteAm45k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55522 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fECqn-0005EH-0F
	for alex.bennee@linaro.org; Thu, 03 May 2018 07:56:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38440)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1fECqb-0005Bt-Ph
	for qemu-arm@nongnu.org; Thu, 03 May 2018 07:56:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1fECqb-000703-05
	for qemu-arm@nongnu.org; Thu, 03 May 2018 07:56:29 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:44716)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1fECqY-0006yg-Hb; Thu, 03 May 2018 07:56:26 -0400
Received: by mail-lf0-x243.google.com with SMTP id h197-v6so25505167lfg.11;
	Thu, 03 May 2018 04:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VsuIftqb9oiT0zJGWF10gqiR4mz8au3KDT5F4swM9tk=;
	b=WteAm45kW7N3qQf/tr8JM194kLliwyuPtlujL+DfMAUfIP2HkVupb0aOx6PsJKnBhV
	EJUzmlvXpIHJG+gjczT4m9bzKF41HXii1Nh66MoVzz+JxQnK7Af7bNqjoEJzjcrndzyO
	xsZ5Ll0+JslOgGJhpL+TZcFaNvkydTGDa0P8cPbQA2FGugxgTJm1hHkLOtI/2EYA1iOA
	XvvIO4kABB3ws74Pqg2EA3xbjhZPB019XX3Vpy3mDclgyLvgEt7y3KzVivvDAQOGDx9J
	SN0dI4iCiAPy+GlL+i1QW/q/BgEQoCCabfukvjbC042KWjjeVvrCTMLeWWo3SiDabQZA
	Ejuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VsuIftqb9oiT0zJGWF10gqiR4mz8au3KDT5F4swM9tk=;
	b=jMiE1OtRT0tdJCRdCF3x/MAIfGt6Sf9ZZKH8cVFbEFAQID01qRkgwru5BFVyihNXu2
	35V3l3ZYtZE6aKaiLImIpGsGmIGfHmYdfhLqKUWtY0NJe9o1fVJ4Dphwm6C5qDd01txi
	+R8F6GxQw9TSyyk0XXUW2blcvs9kbeynDLZGBGlg7gvEw/Kvc0LkiRLz/2dJbd8JN+fl
	OSAx6oXLEiSRvD4RgGRDI8iMekrT3/8UhVV9ALVAkcLHb3myT2C/dJ6MI6hUrCIsDIR/
	uKdquxU1Qnx86+NK4aayfPvxX19QEVf627+cpCe51nPHn5hiBlgUENnAMajhu+lA2Oyn
	jrmA==
X-Gm-Message-State: ALQs6tAIDvukVE0ALDcReAIk2Ej5ICkirbviUT29W4tlCzglv41Rx30M
	ltl13PpG41gZ5TYeS8Hisesp3A==
X-Received: by 2002:a2e:4dd6:: with SMTP id
	c83-v6mr15380728ljd.126.1525348584922; 
	Thu, 03 May 2018 04:56:24 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	o18-v6sm2774901lfg.16.2018.05.03.04.56.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 03 May 2018 04:56:24 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu,  3 May 2018 13:56:20 +0200
Message-Id: <20180503115620.10596-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180503115620.10596-1-edgar.iglesias@gmail.com>
References: <20180503115620.10596-1-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::243
Subject: [Qemu-arm] [PATCH v1 2/2] xlnx-zynqmp: Swap Cortex-R5 for Cortex-R5F
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
	sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
	alistair@alistair23.me, frederic.konrad@adacore.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a9AFDytjvtk7

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

The ZynqMP has Cortex-R5Fs with the optional FPU enabled.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/xlnx-zynqmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 505253e0d2..efeb53c732 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -116,7 +116,7 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
         char *name;
 
         object_initialize(&s->rpu_cpu[i], sizeof(s->rpu_cpu[i]),
-                          "cortex-r5-" TYPE_ARM_CPU);
+                          "cortex-r5f-" TYPE_ARM_CPU);
         object_property_add_child(OBJECT(s), "rpu-cpu[*]",
                                   OBJECT(&s->rpu_cpu[i]), &error_abort);
 
-- 
2.14.1

