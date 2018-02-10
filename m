Received: by 10.28.71.27 with SMTP id u27csp2744301wma;
        Sat, 10 Feb 2018 15:09:08 -0800 (PST)
X-Google-Smtp-Source: AH8x2254g/GJimw5Hilz8JIWNXJAddzzAn2mwwV03HbA6gCaHW+nmei6y5zpX5Ek26swMMePozbB
X-Received: by 10.37.186.201 with SMTP id a9mr4775520ybk.183.1518304148829;
        Sat, 10 Feb 2018 15:09:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518304148; cv=none;
        d=google.com; s=arc-20160816;
        b=eFejqtHOGYRdHVtB9KFrzvUCeDrfZDYyf64E/BZlAULl+ghweI0/P0K7IBNuxQuUOW
         +F/vd8EogKmUudW+uP56Qfr29gkdYRY1U1wV0cvmJH+Pqdvzyu2nbUsBoDry4xainldf
         vTMk6sOECTFinaP3hg8jVUB/LQ5X8DFEsC/4C+Gh6l/DK/ZkNNIC/0lg7i397eevNsbD
         JvpfTrh8PJrusENEoF6sD/rM8SDol3JSe9fUJIBWlNmVPubw6l15unstmzL6+tg4OsHe
         itr7k/JxlWqcjGmVf9q8aSrs+XcsCND54htZQURgbAe1cXBZdo7rNIBumyWNclt9kp1e
         j+yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=nL6gPUlDY152kgVDfEyFrw2bQqSTgTyjJgXC6doQ4ns=;
        b=fQKbeFQiMqNbAYOS/P2IbKS1vyIEXwmjkXRfavXmoLabooYX6zG6KrdGP2jWzrayBz
         zz5qDPUMM1PRE5zj+TfSuHqQxeCUylezA1pVjcwCsbwlAMgYYm0chgEj3MGAzdlLY5H7
         GO6FIG22nMU6h88hulujG47xACHsIrdXfILoiY/opt7dPhU+fQK8307Stk9HfuEd/6BK
         +4AqjzPQcwRCFU6iTu4AOKd8Wodsc4SSwO90iiy/8kF0YRBc5h9Vh4DxteVLxxuJyExb
         YYRYJ9JaZKSRuyf/ah323e/+t1w2BWTy/2X8f4krFJ62oC4B/KRqLjbJiQcUitqqWb2d
         NCKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J++wUl1m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l186si874368ywg.81.2018.02.10.15.09.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 10 Feb 2018 15:09:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J++wUl1m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45878 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekeGa-0000Xv-81
	for alex.bennee@linaro.org; Sat, 10 Feb 2018 18:09:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekeDE-0006VY-CK
	for qemu-arm@nongnu.org; Sat, 10 Feb 2018 18:05:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekeDC-00085X-QQ
	for qemu-arm@nongnu.org; Sat, 10 Feb 2018 18:05:40 -0500
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:34951)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ekeDC-00084D-I7
	for qemu-arm@nongnu.org; Sat, 10 Feb 2018 18:05:38 -0500
Received: by mail-pg0-x244.google.com with SMTP id o13so5479871pgs.2
	for <qemu-arm@nongnu.org>; Sat, 10 Feb 2018 15:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nL6gPUlDY152kgVDfEyFrw2bQqSTgTyjJgXC6doQ4ns=;
	b=J++wUl1mkqmg1ABHuTnPIu5s2IrBMHnmGDWB8GUUo2Af2zjvXOmKyXATr3FZCRJ2tR
	fHBQ7xYkbj89ABEBdlzIBssjiawMRl4G+NFWpzSsSREu7KWhFWEPeiOQu+vfyjy/TIn5
	KNGnOBQrpjO2zDunFZmWIW2yKe0EkSnQoeH3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nL6gPUlDY152kgVDfEyFrw2bQqSTgTyjJgXC6doQ4ns=;
	b=E5+rRrT2TltFgTFE9D5K49RpQ5EfwLFpjlYmRFsPxWUUP8pk4N99KO66J+6aZcj5Js
	zlP0pYn6+FHg/P7MQFj7Pc9DLTiNY+SXHj+z9XbIi+bNCnf+2ekvLkLEoFkSW4QGiEs5
	JmTBFoGIY/MnvoOpmFUEKKjP3knEsZCe307agcTDF+S7cCPN1rJPSNWO6YSXSb1dIMZX
	cr3bIYPCv/GLX1GYtuBznGsZjaXUTnSUVVJj7fwBStCIfqAFN7rS/uGcV76r/i/TYXti
	mubg2PR98buEjsE8GrIv+oXStGcV0iyjndPQi2Y+RR5gLwiD6qFzwrKElRZ6cRLQQHRE
	jzYg==
X-Gm-Message-State: APf1xPD9Xdk2pznH30BbiJyBAmAYupJpekWmInIoot5JeQ5KkLJBJ4ds
	KF63qPJ4DLQs8GxzLearDlXhpfNO7MI=
X-Received: by 10.99.113.11 with SMTP id m11mr5916701pgc.57.1518303937698;
	Sat, 10 Feb 2018 15:05:37 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	w10sm14122374pgr.57.2018.02.10.15.05.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 10 Feb 2018 15:05:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 10 Feb 2018 15:05:28 -0800
Message-Id: <20180210230530.8421-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180210230530.8421-1-richard.henderson@linaro.org>
References: <20180210230530.8421-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-arm] [PATCH 3/5] target/arm: Suppress TB end for FPCR/FPSR
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BwEZSc0mvk28

Nothing in either register affects the TB.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d41fb8371f..e0184c7162 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3356,11 +3356,11 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .writefn = aa64_daif_write, .resetfn = arm_cp_reset_ignore },
     { .name = "FPCR", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .opc2 = 0, .crn = 4, .crm = 4,
-      .access = PL0_RW, .type = ARM_CP_FPU,
+      .access = PL0_RW, .type = ARM_CP_FPU | ARM_CP_SUPPRESS_TB_END,
       .readfn = aa64_fpcr_read, .writefn = aa64_fpcr_write },
     { .name = "FPSR", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .opc2 = 1, .crn = 4, .crm = 4,
-      .access = PL0_RW, .type = ARM_CP_FPU,
+      .access = PL0_RW, .type = ARM_CP_FPU | ARM_CP_SUPPRESS_TB_END,
       .readfn = aa64_fpsr_read, .writefn = aa64_fpsr_write },
     { .name = "DCZID_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .opc2 = 7, .crn = 0, .crm = 0,
-- 
2.14.3

