Received: by 10.28.4.212 with SMTP id 203csp336606wme;
        Fri, 4 May 2018 11:34:10 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqAHod2bCjviYtlPaPu1O5TmV5awjjtfkrMuS3dAYvp86Ts+xTOG7h2MCbnFLXFJVDPDVqu
X-Received: by 10.55.132.132 with SMTP id g126mr22016140qkd.108.1525458849947;
        Fri, 04 May 2018 11:34:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525458849; cv=none;
        d=google.com; s=arc-20160816;
        b=DTMw/6TiLUga/Wz9rkDgUV/HAT5qNWIIcd2RytY/hHrUPokDmDXM+6excxLYCjXe3E
         BOonXutsqW770ZGfM0ZDAHGYwtXttVDxB/ZarSfLxuRFbc128IYT2f66UcQBsS60WS9B
         QImM8tZS5s7dDardNDKJkcs+eZuX8QSx5/ohf2k1M/VKN/IYCk/+P1PdEFc8ndtjuBwv
         dY5z8FZzaVxV1w93NipMrJUS627BD56FcDAV/Q166BMSMC0ImMn5G77d5i4crJmsCuVJ
         SvHov9WPa8tjCHTWTlpUwq6v+WKc+698AEKbmki6Kq49tUo3U/W4moOZw9E5L0jA2Qv4
         wqrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=2OINtN/zuGI/xN0qhS4Am3G+0D2/hLRY6vwsOrAimeM=;
        b=KXzXZyG8EoAeiAkMa3jnZ6gEW3y1Q5Ks0HET3UIiu3INm9aA/7T/L4TPNUBmUA7QR2
         huvkBhJJoP0bzoUKAbvBSCwZ8md0tZvxdrfUlcApyhjJzDCVsAEcLUFk9n7T9wUSkBV+
         Xz2nukfJYKosf3kFdL5SQjJLvc7lilbk94pLMxUAI6OMeEkQkMMUed8cI2vElskr9fnx
         mgpqamimO17lciWBM2VmHpmq31dYPvIDRs9VhdAw53+DBC1qDZ2WQge2NFt+6J4CIPob
         bpJChzVKIBOekqw6ABipbBRSxYq19umSmydktNNtSliIp2tcj1glt3VYJSVLlsZLQyf7
         ZBiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SSDUz/2D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t63si2353610qke.155.2018.05.04.11.34.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 May 2018 11:34:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SSDUz/2D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35990 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEfWz-0001lp-Cx
	for alex.bennee@linaro.org; Fri, 04 May 2018 14:34:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEfTb-0007cD-93
	for qemu-arm@nongnu.org; Fri, 04 May 2018 14:30:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEfTa-0001GO-4v
	for qemu-arm@nongnu.org; Fri, 04 May 2018 14:30:39 -0400
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:33408)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fEfTZ-0001FA-Vd
	for qemu-arm@nongnu.org; Fri, 04 May 2018 14:30:38 -0400
Received: by mail-pg0-x241.google.com with SMTP id i194-v6so15978520pgd.0
	for <qemu-arm@nongnu.org>; Fri, 04 May 2018 11:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2OINtN/zuGI/xN0qhS4Am3G+0D2/hLRY6vwsOrAimeM=;
	b=SSDUz/2DR+ElLsJB7v9S8gIdY4tBjobWQw3DBOyRpbKu6/eMN7q4SgnV9FLHYRUCFU
	mmU9YSVxNraMdX/BL4XxoMVQBDpeZiQxyLvkWhEZn2ejjErBVN7fRutdJjqRbaEYCnwk
	g23ieqjfKPRve8jVOPz9pdQ+nex2zy9+rjFzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2OINtN/zuGI/xN0qhS4Am3G+0D2/hLRY6vwsOrAimeM=;
	b=fdYDfPxVNr0RApj70XO4qCeWJuU5NHhwidxpjLOmGCTwxynJkHhKWDDMy4xQX63+lR
	jB7aQv2KqrEcDwwIe5STXZQHM51oWKzD3XRooqOuKZH5B/+Mz0ELRuA245Dy1ntnrHXN
	vY234763Dn9WNgCEMZn+HFWbHExSyhTVIwVvUoKfKryqhxU8ChkPh/gsQOwmOw4hpRwh
	RzLYY3IczKYO2vNAuw9jBB8XKsK4ij8fiyk5YzcopQilr/u5fpzmBhTDNwxzls8b2MKa
	LEbxIrHybF8iOvlsBKUfGYiSdXaeGG4AcEAYlXhd5S4iHwlX6opKPCiHMJv2QjPGZD9U
	aTgA==
X-Gm-Message-State: ALQs6tAdMTeR2QRUMEVVU1nREaB90XRyYPH0Co4XcI9rceAJSOfiY7qQ
	xQvOOxm94W6kSQ8taEHYEqTZIA==
X-Received: by 2002:a17:902:bc48:: with SMTP id
	t8-v6mr28880227plz.133.1525458637090; 
	Fri, 04 May 2018 11:30:37 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	r8-v6sm16987413pgn.2.2018.05.04.11.30.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 04 May 2018 11:30:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  4 May 2018 11:30:21 -0700
Message-Id: <20180504183021.19318-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180504183021.19318-1-richard.henderson@linaro.org>
References: <20180504183021.19318-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH v2 10/10] target/arm: Enable
 ARM_FEATURE_V8_ATOMICS for user-only
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
X-TUID: J2pLeG4kqXPM

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 991d764674..c50dcd4077 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -248,6 +248,7 @@ static void aarch64_max_initfn(Object *obj)
         set_feature(&cpu->env, ARM_FEATURE_V8_SM4);
         set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
         set_feature(&cpu->env, ARM_FEATURE_CRC);
+        set_feature(&cpu->env, ARM_FEATURE_V8_ATOMICS);
         set_feature(&cpu->env, ARM_FEATURE_V8_RDM);
         set_feature(&cpu->env, ARM_FEATURE_V8_FP16);
         set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
-- 
2.14.3

