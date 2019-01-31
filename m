Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6752663wrt;
        Thu, 31 Jan 2019 03:27:36 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6+8fC9hVk9kZ3Q8odZv84KR4Tpk2dJt3Nrdrx5jC/w9mYs6myZ5aZchk7C7CShE2wtPAoD
X-Received: by 2002:a25:7909:: with SMTP id u9mr32151119ybc.451.1548934055993;
        Thu, 31 Jan 2019 03:27:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548934055; cv=none;
        d=google.com; s=arc-20160816;
        b=c/sspfnoxtDSNuQm05a2IGr+seRe317eY0U0YPcZ23mAhTne+FfF/z0lcIKMx8Xs0s
         N3IlAz7zBJer3ieMHZhEMVwGwH6BMEKiWxjnvljZ/9kRkIZ5PILu0M8RXfwvsiOJ4d/Z
         dCbKDbK6CON+NQvTPMJmpOh1SaKKyAO8mVQ7URGYa4DSBV+s8hl2ZeoYv9zDkvEKf5Cl
         xG7L53W4d+xgI0BuL88UtkL2EyU/z10D/fV4FHqEqPu49xNMej7vXnsuWhYnNQ++ON1g
         qstkY6+yRkOFCJvIJ4D/34YfJ5bzx3MurWIdX68f+Pe0hwIBHa29cCJsThraT9xHO5ct
         MXEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=gyxX1X6cDLYlEibagFDko7Cs/zrt8AkVbdYa/LmUQe4=;
        b=ougUN+1yhRAxjReRzAswFO8J1Hpz5kflqUY23ePltuZTGxPO5jPMqyzJPFhzVkas3S
         opStDV9V5aIwDZbhBc+iq8gWGiAtVPOnYweEDYu4FMQUCnGMTG5PCadco3BhE9K9TmKp
         by4dpI4naYLiMOdEW4J3WUv3ogx5jZMiO+yqIialqiIqc5uyF89oVzvCb58OoPvN+4dU
         5OXeXwCRWbioz/rRj3FMG+sOFW5qcbivygwDzlJ6h0DOp72ojJSZDR6VLnXbPbmSnyT8
         kcgnMVtJQhBIP36mFmyFpv33xmBq0+7irmeqr+X/YG4Npr3AvUlVItJWscdJwEvUyn2x
         pwRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N0mk2ZCF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p68si2403486ywg.370.2019.01.31.03.27.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Jan 2019 03:27:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N0mk2ZCF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:53121 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gpAVL-0005mc-HT
	for alex.bennee@linaro.org; Thu, 31 Jan 2019 06:27:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gpAQk-0002G3-MX
	for qemu-devel@nongnu.org; Thu, 31 Jan 2019 06:22:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gpAQj-0008F4-Ug
	for qemu-devel@nongnu.org; Thu, 31 Jan 2019 06:22:50 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:34786)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gpAQj-0008E8-NY
	for qemu-devel@nongnu.org; Thu, 31 Jan 2019 06:22:49 -0500
Received: by mail-wr1-x444.google.com with SMTP id f7so2898380wrp.1
	for <qemu-devel@nongnu.org>; Thu, 31 Jan 2019 03:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gyxX1X6cDLYlEibagFDko7Cs/zrt8AkVbdYa/LmUQe4=;
	b=N0mk2ZCFvKLSO5H9Og2pO2fJxST75khTk9FfLt1KDNij3dsFzpgjOVzYNO4z2EYjx8
	+bWeaRsDRBeIgEGSsxURkLYAardH165jZI4WnASVR7zf25zPxLbQA+7RLmWkEGsTvT6y
	4Vq6xo9Vn8dwP1wAG25tpxZANbfJKxq4IULlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gyxX1X6cDLYlEibagFDko7Cs/zrt8AkVbdYa/LmUQe4=;
	b=ZV6BXRH4FzPqqc6itMldxC6sYh7JY9UZiuM8MxOmLmSAnIutpntNEtTVMvxJNYbTDL
	auyWpI3sKXe5jVx3l9yh59e30x3rtyt4z3sMK9MAuXa5cm+7rr0yXNtIkSk3gBBASh/3
	94/67wy2tf96TM9RxbrT/YZNRIIoRhrRbuRBNNxD5xOm59qTJrL2v2CtFqGh0aZot4WA
	no183R1xkAm3zGGq556BbytzOWH9lTnC+Q0T0IjA5vQq4np2f0rcNJMHoUUs5wHHEv5D
	N+ljN6dx8jSjwoJLcR8I0uHy7ZZNzyjgt2QIrRV3VO6acqBWbb60n/FqMeTREfmpgESv
	DRFQ==
X-Gm-Message-State: AJcUukcRJ5iFJZaCFAeQKg+wov15KkvUM3RDw4nrs/USWXPuVGb1g6bR
	k2hIODlnsfyla/QfMwo4z5c+Iw==
X-Received: by 2002:adf:e911:: with SMTP id f17mr36025418wrm.126.1548933768789;
	Thu, 31 Jan 2019 03:22:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id c8sm4078173wrx.42.2019.01.31.03.22.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Jan 2019 03:22:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 31 Jan 2019 11:22:39 +0000
Message-Id: <20190131112240.8395-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190131112240.8395-1-peter.maydell@linaro.org>
References: <20190131112240.8395-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH 4/5] hw/arm/boot: Clarify why
 arm_setup_firmware_boot() doesn't set env->boot_info
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
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, Igor Mammedov <imammedo@redhat.com>,
	patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GXcLGRz0yt9d

The code path for booting firmware doesn't set env->boot_info. At
first sight this looks odd, so add a comment saying why we don't.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index a2e724ac68a..cfcfdf421cf 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -1186,7 +1186,8 @@ static void arm_setup_firmware_boot(ARMCPU *cpu, struct arm_boot_info *info)
 
     /*
      * We will start from address 0 (typically a boot ROM image) in the
-     * same way as hardware.
+     * same way as hardware. Leave env->boot_info NULL, so that
+     * do_cpu_reset() knows it does not need to alter the PC on reset.
      */
 }
 
-- 
2.20.1

