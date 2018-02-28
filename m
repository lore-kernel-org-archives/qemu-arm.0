Received: by 10.28.91.67 with SMTP id p64csp984249wmb;
        Wed, 28 Feb 2018 11:32:18 -0800 (PST)
X-Google-Smtp-Source: AG47ELujKGWAtSqOEaDKOtg2wV219Ms6/WWg5RMZ9WmbwxLIWP1zoI1S8AEvL5X0DgW8B+rFwMPW
X-Received: by 2002:a25:d9d8:: with SMTP id q207-v6mr12894348ybg.81.1519846338426;
        Wed, 28 Feb 2018 11:32:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519846338; cv=none;
        d=google.com; s=arc-20160816;
        b=xxgIhwvI4BIGrimOS5h1r/sm7G7VU30wxIw4MKRApbR/reIEmSts+UkVq0NG3h/QTO
         mKYOTvgB2RUEOdC8oKALsDTPiGRE72o5lKyH19fLRtg9tAfuRtR5Ok39IYfro8CdMT/n
         SNXSwJkEDVPqMN4V7gJ/s3r5VBU7NWmvqfk1f1iHWq5F+/9FF3jEkc3IskRgMEFDFrUF
         FPxdtZzbmnsHAduelCDDuxwIeihwthFSrQ4MuGSsXyNNObZ9U/gmsUkDjvgPqp543ybe
         SAiwjUaf3RuwKFFAY+g9Yoe5xtF8xQjoOINmgCx2I8W1bRJY1CFALj6RqAF+M2E3m6r+
         lOxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=VY2SHt2NMnHZ6+67E8Vaq0+6JvR9HM95+HBMyMjHN7Q=;
        b=yPjKPWPBRNVEzrim6DkFDVPpdKhelz1rh/i1wROPLqiDRhc23aWQfWy7+DaNeAavCI
         QCMwwca1qvTMpNQNLmkMIpqU3P6Xu5kL8ai8TKREHwtpcZ2TPhRpqvpUOrbee6z3umLU
         qWA3b9Q/FLd4UuTaCiXYvfBtLKQJnpQ5BDYngry+VrsZyK4awwAmc3GV84PVrEzTJjuO
         n63p6vp4RXiJTcQMCYwiWwUzY5KwghemK5wOR8xgz5a1n2IiOTjKWe37qYDet5f67zHU
         S3RyBNEaQuVr6wjtyNCwHmWp3R4kTSRpahTc1yc8EC2pG+jQ4YRDV/0kKo9pWohc6maJ
         qThQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZHnuK2bW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l188si366953ywf.683.2018.02.28.11.32.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 11:32:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZHnuK2bW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46404 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1er7Sb-0003GJ-NB
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 14:32:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35407)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7Rs-0003FE-MK
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 14:31:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7Rq-0006EV-Hn
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 14:31:32 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:43932)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1er7Rq-0006E3-Bt
	for qemu-devel@nongnu.org; Wed, 28 Feb 2018 14:31:30 -0500
Received: by mail-pf0-x241.google.com with SMTP id z14so1408329pfe.10
	for <qemu-devel@nongnu.org>; Wed, 28 Feb 2018 11:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=VY2SHt2NMnHZ6+67E8Vaq0+6JvR9HM95+HBMyMjHN7Q=;
	b=ZHnuK2bWQXMRUck8eNQkBOzCYZHQYW1e72qRRvv0FxwPt7lJ50L2fUKm7OPVd5MSN5
	aBL2WkgGL+D6DxKxb0h4pDWRuSBr3L4/sLs4UL0nj0u0EzZg4Bc1PYNebMsysasid30a
	vyaKvu5cUupwKnVfTDBGh9KSGXD0FnjZYHoMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VY2SHt2NMnHZ6+67E8Vaq0+6JvR9HM95+HBMyMjHN7Q=;
	b=Bex29+ICqp8aDw1rtiYz6kd6O2749e70/tjSDAGhd/pzcxYD+N6q9+ojC7ouRQY+Qi
	i7UosPh4deXwtOP6kqHw3E8Fy4UDTVbrikJgIorCTr39CFsLWsS4Nsz1VGfSKXm2m2Qw
	2XNOczwFMpUgAS68xFAfqv5uVHnqsT0/BRvZJ6E5huxtJNu0xwS4AXrv1XVZrliZhf2m
	cHySTnPyyn8b8qGjlJEljfeEZm8bzcAXPidU50pdkjdmcbSjK8NazBkZRs5arOrZZRcH
	f61JTbCWYNstdjGYZglIxz452dd2PpDd6m+GABSmDdDeWF/qCIsCPedfswMhgCQEa1L/
	sbIQ==
X-Gm-Message-State: APf1xPDvLi4zNxY9EJ+9n8Iw5ReOnnJRngGU1KV9DNsngo24vh2AZCXS
	NFRz5EvdzlIMwa/GXgSGavLEYiGrMkQ=
X-Received: by 10.98.139.145 with SMTP id e17mr18732299pfl.53.1519846288962;
	Wed, 28 Feb 2018 11:31:28 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	k185sm4200212pgk.94.2018.02.28.11.31.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Feb 2018 11:31:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Feb 2018 11:31:10 -0800
Message-Id: <20180228193125.20577-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180228193125.20577-1-richard.henderson@linaro.org>
References: <20180228193125.20577-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-devel] [PATCH v3 01/16] target/arm: Add ARM_FEATURE_V8_RDM
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yAZoHHF4YMEY

Not enabled anywhere yet.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     | 1 +
 linux-user/elfload.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2b9740878b..7c8e87544a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1427,6 +1427,7 @@ enum arm_features {
     ARM_FEATURE_V8_SHA3, /* implements SHA3 part of v8 Crypto Extensions */
     ARM_FEATURE_V8_SM3, /* implements SM3 part of v8 Crypto Extensions */
     ARM_FEATURE_V8_SM4, /* implements SM4 part of v8 Crypto Extensions */
+    ARM_FEATURE_V8_RDM, /* implements v8.1 simd round multiply */
     ARM_FEATURE_V8_FP16, /* implements v8.2 half-precision float */
 };
 
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 8bb9a2c3e8..63cadae1b4 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -551,6 +551,7 @@ static uint32_t get_elf_hwcap(void)
     GET_FEATURE(ARM_FEATURE_V8_SM3, ARM_HWCAP_A64_SM3);
     GET_FEATURE(ARM_FEATURE_V8_SM4, ARM_HWCAP_A64_SM4);
     GET_FEATURE(ARM_FEATURE_V8_SHA512, ARM_HWCAP_A64_SHA512);
+    GET_FEATURE(ARM_FEATURE_V8_RDM, ARM_HWCAP_A64_ASIMDRDM);
 #undef GET_FEATURE
 
     return hwcaps;
-- 
2.14.3

