Received: by 10.28.4.212 with SMTP id 203csp5139473wme;
        Tue, 1 May 2018 11:05:29 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZohl2tIxF40Ozcm5Q0n0KFNPtMI3+6dkvWbUo5+3sn3+HoWknfnLj4c6jJBRZo+iEvm1gfU
X-Received: by 10.55.12.133 with SMTP id 127mr13446945qkm.257.1525197928955;
        Tue, 01 May 2018 11:05:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525197928; cv=none;
        d=google.com; s=arc-20160816;
        b=YXJs2C0l0o21ifZ62utAxiYQejg6qMnOJuwgkBpuBvYrxzmDpgKEDv6NkkQj5iWDAo
         EF3Ir4tmrVOsiNVqLcrqgsyxhmxdHiVc/HA7Q8Cg9laizMC1XvNbosPv1RMY9ZGHMDfx
         Ng3E5Z7qOfCIOhyA1R/jE+kGmBbqGgF4PwmVTf0boTROhDBSHH9MWUBx3M05Eou+Ml4T
         p3cjcGXQNhkVu44/w75zT9HES4UG7PRqKhO8AKYjRAVqNNZXpbOLR+L3DmkBDKy88yev
         zh/cdPKP4JzEUrx9NO4QnxP3CRBKktEX5eh3jPGezG+c8IUYLhvHwSkNbRxuH5pxUWq8
         z+Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=B7Tp/8To9S3Hke3NcXQo34DBSqtfSx8QkH+6ZItMU0I=;
        b=LJao+AyhLieFPM/IXnWnI+vRyoLQ5iXm3kCFPN7HzFzg3sg2ymyFBurDa0+e2knn8K
         Q+KW3o2bl9H/gef59kJGShJzpMkY8D4qoXJ38pjH/nAfp0uV4JZr/ctruxLLrKX1t9Kd
         A0/jRl9EDbtZJmLkbfcfEKKVh34fQMomli268eglcN64BPB3dPKGHmF5j6iZ2ExejpHP
         Bx/+ijYUr5PVg0ao84g84MicZKGBTAC3MroXR5UsZzDQ2V/ZdkcILfeAYTW8y+qTAcUF
         fe802HAm829tgoRNgJgu3un8C4kedr3GYrlw+bt4dlpiUr0w039g0NtFuG004I7eGRGk
         iltQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GimsKsc3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f48-v6si568303qtc.196.2018.05.01.11.05.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 May 2018 11:05:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GimsKsc3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45535 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fDZea-0008Ra-I2
	for alex.bennee@linaro.org; Tue, 01 May 2018 14:05:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fDZeC-0008HX-GU
	for qemu-arm@nongnu.org; Tue, 01 May 2018 14:05:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fDZeB-0000aF-1B
	for qemu-arm@nongnu.org; Tue, 01 May 2018 14:05:04 -0400
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:37418)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fDZeA-0000Za-QO
	for qemu-arm@nongnu.org; Tue, 01 May 2018 14:05:02 -0400
Received: by mail-pf0-x244.google.com with SMTP id e9so5636960pfi.4
	for <qemu-arm@nongnu.org>; Tue, 01 May 2018 11:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=B7Tp/8To9S3Hke3NcXQo34DBSqtfSx8QkH+6ZItMU0I=;
	b=GimsKsc3bAYbCkfo4EdomUuvX0X69H+j1yh/hrEVLj3Ef40ImYErixfn2X5q+xVZnT
	T0RcUc/CZzuuHn7dmbloEuOYl/8ZwBBmB7Ex+ET/wzplxXyfvvp8QlEGJDfa71G061v/
	/K1Byvjg2eGpwUWy1HugnNqUHPdT79mpHM4ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=B7Tp/8To9S3Hke3NcXQo34DBSqtfSx8QkH+6ZItMU0I=;
	b=PwXh+VOpbmVQfQiU7AVmFrCbdTLHXBBmfJR/zDf3QVsHU9gC2Yr147TZnR/VNrEuYi
	t8/cp/Z7fQrDbs0KIO/15OSZT+h7dGdTxL+S/+zdqB17x/97zx24CJH5EDP+AT62P0PR
	ItBa3J+SAmGjK5lXjfvcrzEmFVMmhmhfPM2uh42Whvp3KXJl6btB9kTuDbGIUj/hHEG1
	FmxzCjV5sauPR/OdY7g9JEF2PliYWZN+TANGav9iaKPwofwtlGlVSvZhS1x0fvs4E+kf
	nPrgkva2bOCuA28vBw3vAS+T4Esp4Iki8NetEYIbr8tEax6BIBJoOcm0cRPQ4Rt6C1bB
	BxNw==
X-Gm-Message-State: ALQs6tCvrCgsc1Rk8TXmsdy0QDabnDYIl1OTsu9IkLKEUze2Jp58N+Af
	teSb2XhaxZHY8Ow70sb0TSZT8A==
X-Received: by 2002:a63:7a05:: with SMTP id
	v5-v6mr13803160pgc.184.1525197901877; 
	Tue, 01 May 2018 11:05:01 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	j5sm23732224pfe.119.2018.05.01.11.05.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 01 May 2018 11:05:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  1 May 2018 11:04:55 -0700
Message-Id: <20180501180455.11214-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180501180455.11214-1-richard.henderson@linaro.org>
References: <20180501180455.11214-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-arm] [PATCH 2/2] target/arm: Tidy condition in
 disas_simd_two_reg_misc
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
X-TUID: zOLLk1cTY5+y

Path analysis shows that size == 3 && !is_q has been eliminated.

Fixes: Coverity CID1385853
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 97950dce1a..6d49f30b4a 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11473,7 +11473,11 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         /* All 64-bit element operations can be shared with scalar 2misc */
         int pass;
 
-        for (pass = 0; pass < (is_q ? 2 : 1); pass++) {
+        /* Coverity claims (size == 3 && !is_q) has been eliminated
+         * from all paths leading to here.
+         */
+        tcg_debug_assert(is_q);
+        for (pass = 0; pass < 2; pass++) {
             TCGv_i64 tcg_op = tcg_temp_new_i64();
             TCGv_i64 tcg_res = tcg_temp_new_i64();
 
-- 
2.14.3

