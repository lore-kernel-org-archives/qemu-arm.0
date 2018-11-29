Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2553937wrt;
        Thu, 29 Nov 2018 08:40:32 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XFcuR+OHWBwHGQ8GUYDWH6nr5u04N0oQVfnC6WbpHL/V24AunxQx+Sdgx3+nVvF3nBeXYV
X-Received: by 2002:a81:202:: with SMTP id 2mr2110954ywc.291.1543509632228;
        Thu, 29 Nov 2018 08:40:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543509632; cv=none;
        d=google.com; s=arc-20160816;
        b=S9bFoNIgKZ8VNktrmsicBGaBCRx91w5TG+FLHCyyZNNMIqzLFSd+s60ffgyQ8Yjr5t
         VbzYmteL1pI8p9XvZat5NIjS8o1hvcCdEQ7vfhHlFvFFvmXLvQ1+8aDS3Hr+EY0oIswS
         /snFlAItiw0fy1tn5kPUhIWswDFtjkaOLeud/2x9T5niVvBU9y8T1svarSALbV545AzQ
         Xc7487Ypez+v0EOQ0M83Tv2tiUJT+78FOtNhw6oV28V0O7vzpYFYmVD7j6j8sVDjAKgi
         yiQupeked6vrVUFl2RRK6nLExaurvVo84gQ0XVPjKL4lYCNnVh+9/IJtEVGfGtnJn3Vh
         p5RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=ogI2h8u6kEdOrFVll8offp5G4ixW2/tAMhTAdtZ0rN4=;
        b=PP19aAWhDIVUq+0AIiTRRxM7fASgO7PdHbWyOZbN4r6fxjNoJuiVRgUB7AtRd3jicB
         NVXTig7sZ/IkCZ3cpBcgqafDUYRegVaU71Pjy8Oq+ME97XemwvqoaUI/wA24tFj6XdeF
         ali+tyky+oC70uHAfbGINUncLroNVCKCxG6l3vYT4FphT5y2B7EjcS4K0eX0g1QfPn7O
         5B2csjScvrzobklPrJwl2gJ+IyVFqWmMeX/iYm4wdtFy8j3YTPQJiGL7WKWJ5yHgF4u3
         M8qJbG5pQ+JrzU652kfWK8kjvCRlck7th1B8PRSp5SUtdjfqTgdyvwb6tdzH/QqTjzmJ
         B0qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ttAKojWd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t6-v6si1446435ybo.152.2018.11.29.08.40.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 08:40:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ttAKojWd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55179 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSPMd-0001Nz-F3
	for alex.bennee@linaro.org; Thu, 29 Nov 2018 11:40:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gSPJM-0006tl-Pz
	for qemu-devel@nongnu.org; Thu, 29 Nov 2018 11:37:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gSPJM-0007Jk-5D
	for qemu-devel@nongnu.org; Thu, 29 Nov 2018 11:37:08 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:40494)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gSPJL-0007JE-OY; Thu, 29 Nov 2018 11:37:07 -0500
Received: by mail-lj1-x241.google.com with SMTP id n18-v6so2316963lji.7;
	Thu, 29 Nov 2018 08:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ogI2h8u6kEdOrFVll8offp5G4ixW2/tAMhTAdtZ0rN4=;
	b=ttAKojWd7OBjteTESEIBiwcRk8aAE1HgwbsGC45hwqjtHnTgR/I9FAPBSwLOQTD8vN
	SjMIJvtYdszI6elu60GMlAcRI0WSiFvzAJT1FMtt/RxoIIR55p7jpwvqSW8HD40EbJPI
	cxHO4JIVBxO0CS+sznyrtA+zYIRhqNZntYxfPdUKStPNIygj7vhNEvnDdRzS2iCuC3Wn
	nzlFyrHOZkoz4qZ3713M+41rd//FBV14SXFcDLl3Se38hTuIKj1Ou+qPi5puC+UqAPyq
	MyiVtfgMF40U7GWf30Y8Yf6MVPmQtjjTpTrnlAJkECYp4XkRGKORhSp2V1kbxXCmfCH1
	Hpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ogI2h8u6kEdOrFVll8offp5G4ixW2/tAMhTAdtZ0rN4=;
	b=LpuCwPYaqxqrBgkP9SisIj++ojruaktc2UlShk0ptqvdNpCXIndsRda7u+G4rkJiJK
	o+juaCSINjR14ZbDD7Jk6k82SOT+C0uj+MrduFWN7I4lbxCOcT2Atf0OoKU2HQhQgFbY
	s0zpm8fkH3fMKsTwurGfNIm8y1X0R/k4z7hWtHs9Pe3BiZ3lHLaz9FLhcmsqViHLugq5
	XZT5Lf8roYbDgQoMFVigSyQNTRUzWb7mSgvNmHJlDMDo2YzescG60P2jyqK+JCwpX2lJ
	cqpQtHHFUaq0yArSXL9lfbQbSrj3hYOQxyuuhbTEJEUO/a14DozrSW7n+eBVvSzdhlm8
	1fPA==
X-Gm-Message-State: AA+aEWYtlliU5MuDnk9jVec20J0WJSFH4/LjayPYOQsIjG/0Ir9l3wLq
	882onbN+xTgadeRVwYrdBikv1tOg
X-Received: by 2002:a2e:90ca:: with SMTP id
	o10-v6mr1588361ljg.134.1543509426313; 
	Thu, 29 Nov 2018 08:37:06 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id c20sm374121lfj.67.2018.11.29.08.37.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 29 Nov 2018 08:37:04 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Thu, 29 Nov 2018 17:36:55 +0100
Message-Id: <20181129163655.20370-5-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181129163655.20370-1-edgar.iglesias@gmail.com>
References: <20181129163655.20370-1-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: [Qemu-devel] [PATCH v1 4/4] hw/arm: versal: Correct the nr of IRQs
 to 192
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	frederic.konrad@adacore.com, muhammad_bilal@mentor.com,
	philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rC8eG9f8qDbr

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Correct the nr of IRQs to 192.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 include/hw/arm/xlnx-versal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 76fb9de391..ec7c859d08 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -22,7 +22,7 @@
 #define XLNX_VERSAL_NR_ACPUS   2
 #define XLNX_VERSAL_NR_UARTS   2
 #define XLNX_VERSAL_NR_GEMS    2
-#define XLNX_VERSAL_NR_IRQS    256
+#define XLNX_VERSAL_NR_IRQS    192
 
 typedef struct Versal {
     /*< private >*/
-- 
2.17.1

