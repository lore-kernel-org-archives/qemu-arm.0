Received: by 10.28.71.27 with SMTP id u27csp3691920wma;
        Sun, 11 Feb 2018 12:59:40 -0800 (PST)
X-Google-Smtp-Source: AH8x227q9tJuJlda8t1NDIHRl7VEYYXle6EY0LbNGgx8u3mhc+t9bwUmrJAwn6FfHgyHfckQaxN1
X-Received: by 10.129.238.16 with SMTP id l16mr6453532ywm.221.1518382780822;
        Sun, 11 Feb 2018 12:59:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518382780; cv=none;
        d=google.com; s=arc-20160816;
        b=lzoFmmN3xeHa2vAhBOOQJ/OFL2AU8HTXu/J9YQU0FSM1qq1ByFhovscA6Pr16rN823
         wu9qt2QnZKWSzQGV1LD14HkSdR4wQTLMAIeNYu8CFJ7wA4A+wyaRwSFOQXBsfSbYYaLa
         H3yk3Ru3p1Ea7cg+3PlTOCmdky9rg8qCwR55bOHX31VcWv5josBEZLlXhrhOFyA5NyY8
         W5Bgz2P7xJceanGUfD1M2iwlEwTdFHBB0VGGB+G5TJrZiyUbSrxU7QIlvMyh4YGUwYN9
         RtyLFzU4AQrLUsUbW/Jh8JTHSsoNIKdgMSKcohUXR5dgVrHd1yFOsmL0QURyrvkM/fkq
         SyKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=nL6gPUlDY152kgVDfEyFrw2bQqSTgTyjJgXC6doQ4ns=;
        b=NQZwprI+Uq+TfnjtHbzPXY8Zp0D0gmMtbyndhcCdv2s8LlWmNvvdvQSGz69kssn3sH
         dbaYGsKITsFN3AxSgXPE9950/4eB7m5zG6VzlfxdNW/rcNd9q0uWHBOKInxpdskDUD3d
         nsnP3rDYxpBd0RwuxV9mPAf8YqfepeBw97ddj4SIS0E7IdZpOA91e6SokZrVU8s+64b3
         9BlPmCYvFo9BUrAxEXMH+QNd4t7j5+EE+baTbxYs+/wUW5U3pUF/+oYgRJdMznnRsg4d
         nUR8I8kQpJMlg2lUn54wABr5xJgxyWaO34jyuL8dAyTACbpmz04161xOct/wMtSvRcKq
         QvIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OO+lnWxN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s185si1301925ybc.394.2018.02.11.12.59.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 11 Feb 2018 12:59:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OO+lnWxN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54942 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekyiq-0006t3-7z
	for alex.bennee@linaro.org; Sun, 11 Feb 2018 15:59:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekyiA-0006lp-0z
	for qemu-devel@nongnu.org; Sun, 11 Feb 2018 15:59:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekyi9-0004DX-4I
	for qemu-devel@nongnu.org; Sun, 11 Feb 2018 15:58:58 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:36565)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ekyi8-0004C8-U6
	for qemu-devel@nongnu.org; Sun, 11 Feb 2018 15:58:57 -0500
Received: by mail-pg0-x241.google.com with SMTP id j9so5072948pgv.3
	for <qemu-devel@nongnu.org>; Sun, 11 Feb 2018 12:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nL6gPUlDY152kgVDfEyFrw2bQqSTgTyjJgXC6doQ4ns=;
	b=OO+lnWxNmvkWTzfLrcSIaeRL7n6XLGjyybxXO0HWc9X9/3UddV2hiEVFEw29MlpomU
	OWCLYvtjoblYWTL/TvZwqpwCAv1wDrQKX/N9ZLgzraEPH9xNHpAbGDI+UsOugATlNxPm
	ZwtFixLV+X/aGqcOFLlj/cntQILV0EpsAIoiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nL6gPUlDY152kgVDfEyFrw2bQqSTgTyjJgXC6doQ4ns=;
	b=Vum5WTLnDzuqaZg8HjsZMqg+Y/t08h8qRmofPc3+NvFPCcK3Fa61onGEAUGfnuVfji
	NQ88knhYrUJLrYlvFodJVXP7u8S+N6tFZqJF1CJ/jMLvxCS9HcFWsxqN3L2L8D/ew02i
	JB54QbhB+8C3o6cCSzRhndPydMh+z8k0nJsT0GbVP9kM9Jn4D4iDAOg+5ZDOxf/CT0Th
	a3GMOfOAavtG+J4O8/OKsGHlDDDD4Thxdxusc0oh/7zgOTzlH1fbm8oxnXYvliIpKaOe
	YDkY2eSN406u4QGWtQE3TJcT2c8GT8laLSic4VgRInfZynqtL/8ROW8JzwduscnJnixQ
	ov/A==
X-Gm-Message-State: APf1xPDl85NvyLAwayBRrJhoqY2fn7I14sEZlSNK02muOCCaK8MOX7Wu
	zMI5H29CmxgtBDsqh72ucyrviJVVwXA=
X-Received: by 10.101.88.138 with SMTP id d10mr7978050pgu.52.1518382735654;
	Sun, 11 Feb 2018 12:58:55 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	y129sm8850354pgb.27.2018.02.11.12.58.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 11 Feb 2018 12:58:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 11 Feb 2018 12:58:44 -0800
Message-Id: <20180211205848.4568-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180211205848.4568-1-richard.henderson@linaro.org>
References: <20180211205848.4568-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-devel] [PATCH v2 3/7] target/arm: Suppress TB end for
 FPCR/FPSR
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yCRNt8apa6w5

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

