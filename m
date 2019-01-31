Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6748805wrt;
        Thu, 31 Jan 2019 03:23:00 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7SNNoljQivb2m6R475+TnwRqTcAEAdrE8QYCkXEtFcmgoNlQnvgc2EEPtG3NpL0rXkjd+4
X-Received: by 2002:a25:e55:: with SMTP id 82mr32535922ybo.101.1548933780849;
        Thu, 31 Jan 2019 03:23:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548933780; cv=none;
        d=google.com; s=arc-20160816;
        b=bpL/HewN2C6Tkc1ARALQ3jxj6Q5IwvJB8vmEPo9exFpzs/Hh+kDRea3ovIwyjHi8UA
         p4znjFJd/6QVdpQLLiJprkkgV5HkHniN9JjySV4E5mOKgh0gJ6zNZQ59CNrhOIbjaN8J
         tflDKg/93yodcTYKyqm1s366K6G4YsUBieVpWH2qBJLZdK+e0/KLQ63Oqo/HkCVGW0vp
         TNLhgTdP0obkKz5YtrsBH1ICtBuSbNXkBpLpBjvZq8o7IR/pFtF1WgEKFmDY5kCtr4uV
         VgC+1wELaKcq5vY8cftDPtCosP4+5ynUsCUVyqwZ2NT6hVso6HqfOrRx8u6lM4JRwbB/
         an+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=6KMspSn5pQ2uKgLYMeJKO75iQe8Dqi6xIeUCCNIRlxE=;
        b=DE5U4Gt5yr8q/N8qTgcSz39nmat7ix/j5v9YN3syeZPwvJxlSWokHcURw6ZX6kMzt8
         DbxL3OGQW+B9f/VaR5TJ3xA4N7yrBcTiQIVTgC02LBTRFBNZj/mzN/IClJZ4FDdy+9mZ
         +LE0YoB+7GwvmgHrmpK0VwnBq0jIMeZwT0f5zcxItK48fx+zQS9WVUBkzMvyxN/dcv49
         onJ3QnKABoDiIB6YFPB5+93nZ24DDUa8USnHAYgbohCssvxLOJDeTWo6hAXlal5KDyZg
         IlgtaDN9S0f1JPg5JwYHCg0WT6R+4nTEx6NR0E4lFJ5T/2iZqOv0ua937EJY5gGh5Mvn
         I3zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UDpazzBq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n207si2471084ywd.335.2019.01.31.03.23.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Jan 2019 03:23:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UDpazzBq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:53023 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gpAQu-0002Dh-8x
	for alex.bennee@linaro.org; Thu, 31 Jan 2019 06:23:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55387)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gpAQf-0002AA-ED
	for qemu-arm@nongnu.org; Thu, 31 Jan 2019 06:22:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gpAQe-0008BA-MT
	for qemu-arm@nongnu.org; Thu, 31 Jan 2019 06:22:45 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:54601)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gpAQe-0008Ah-HD
	for qemu-arm@nongnu.org; Thu, 31 Jan 2019 06:22:44 -0500
Received: by mail-wm1-x342.google.com with SMTP id a62so2076322wmh.4
	for <qemu-arm@nongnu.org>; Thu, 31 Jan 2019 03:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6KMspSn5pQ2uKgLYMeJKO75iQe8Dqi6xIeUCCNIRlxE=;
	b=UDpazzBqY71x+bWquf8pDFz3rqiUWgqW64JKx1AP8J2VQKZopvKmoTJbDITJrXw4dI
	s/qmO0HFUlIP9VrMGWtn64VPVa8l2zxA2eTszFEZwpU5LqsCzDlZEqbovNYVX+2MAX/u
	ko6MWfGLJ9x/On/AhkKHQ/wths2g+ctgWR9Qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6KMspSn5pQ2uKgLYMeJKO75iQe8Dqi6xIeUCCNIRlxE=;
	b=Q+Cz5L8ZGDHFjk05kVt5alZ/CpOgsrYtcRskhf7C/l+nr5phz38qWdgU/2Y9bkgInK
	3Y5NzLVIOYu/o/KUz94/rjzkIejroLToF11tqD4TuUffLUEIsJ+MRCi0rkWglxjO1rfp
	WBdBawjeafZdAFesvzOJQbB/RFsLq0q1aCs54zvrpxH4zVMwlMZIMt9oTHjfpJstgj2N
	8k59SjC/pWLYBjr6oiJeoBEl2WofX5W4Xxb19XgOFZ7x5X+vyxYdXhK9w9PtebqgqPQV
	lctwm7SKZC22/m4ZV6YvoqaMGDJ36nydJy/gambspm2xVOhwbJ2D9ELpA5JTi2R8eH94
	DRJA==
X-Gm-Message-State: AHQUAuZT74Vdzy8o8Oz72XbbSAuOI7mR18y3XWHP4suLV6DG1FuJ3dsl
	HzaQYo640EA9CYmL1S0DRLleSOk4IlAvhg==
X-Received: by 2002:a1c:7511:: with SMTP id o17mr906873wmc.42.1548933763132;
	Thu, 31 Jan 2019 03:22:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id c8sm4078173wrx.42.2019.01.31.03.22.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Jan 2019 03:22:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 31 Jan 2019 11:22:35 +0000
Message-Id: <20190131112240.8395-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-arm] [PATCH 0/5] hw/arm/boot: Support DTB autoload for
 firmware-only boots
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
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, Igor Mammedov <imammedo@redhat.com>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E93RMEmsuvXz

The arm_boot_info struct has a skip_dtb_autoload flag: if this is
set to true by the board code then arm_load_kernel() will not
load the DTB itself, but will leave this for the board code to
do itself later. However, the check for this is done in a
code path which is only executed for the case where we load
a kernel image file. If we're taking the "boot via firmware"
code path then the flag isn't honoured and the DTB is never
loaded.
    
We didn't notice this because the only real user of "boot
via firmware" that cares about the DTB is the virt board
(for UEFI boot), and that always wants skip_dtb_autoload
anyway. But the SBSA reference board model we're planning to
add will want the flag to behave correctly.

The first four patches in this set are just refactoring,
splitting the code in arm_load_kernel() out into a
couple of sub-functions for "direct kernel boot" and
"firmware boot". The last patch that fixes the issue is
then just a one-liner. (Without the refactoring we'd
need to use a goto, which is what I wanted to avoid.)

thanks
-- PMM

Peter Maydell (5):
  hw/arm/boot: Fix block comment style in arm_load_kernel()
  hw/arm/boot: Factor out "direct kernel boot" code into its own
    function
  hw/arm/boot: Factor out "set up firmware boot" code
  hw/arm/boot: Clarify why arm_setup_firmware_boot() doesn't set
    env->boot_info
  hw/arm/boot: Support DTB autoload for firmware-only boots

 hw/arm/boot.c | 166 +++++++++++++++++++++++++++++---------------------
 1 file changed, 96 insertions(+), 70 deletions(-)

-- 
2.20.1

