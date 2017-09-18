Received: by 10.223.172.38 with SMTP id v35csp4141335wrc;
        Mon, 18 Sep 2017 12:56:23 -0700 (PDT)
X-Received: by 10.55.215.67 with SMTP id m64mr22356193qki.315.1505764583434;
        Mon, 18 Sep 2017 12:56:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505764583; cv=none;
        d=google.com; s=arc-20160816;
        b=VOVGdasDiLo36zTZCTym9hVNNWszmaMoIxAKvcxI7Jm7Gimhjw7n7KOtimmlIY/L56
         u7J8ysgeuEY+Q2YGljWFpRBMIn/6+LT7oVE30aPeyVjuq3FF4+0nCXDRYUMAc6b6xaA3
         SQXz6X/goWrj8aGPFtuVHcDhL3kTp1S52DxpOKcDi6LeZa/sl0fdstFNyfGQeYA21SGF
         ehOgRCr+KWrwvDXW2wgArtVp8q8jez+r5zFrUNsAYFvPucWUTMkgIGXBRzFPahw66MPM
         HQZ9unKfHvOC0KxPW2dkEe0SWB41Y/3PUHBsTwIHFy1J0gSNpaVHhqz8Qlgz0W56r4jQ
         FUbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Ogk4glSLUUFcMz+YRhCxIE+lk8AJJwGYtZEpni0jNJI=;
        b=Pj54SqY7TIvYpwFHode5nxsNJEaIixosMv/sMSanURajrS4lYI1EIso08JTdfDx6lg
         AyeQd7iMr4py5ODkF8nL+AriudhOlx6EgJ1qM68ep8UOrq8h2SwNe9LC5YaW8wtRzqwk
         YRsQz8xqALVLfOhmP1VkvvJNY86kCzY+UD8uVymkSV7UDaW7UT0CF8VFnoV8K2w6ituY
         EMdYCFvaVPxtoZr5TVNwuw49Ef34yWQaFfZeX4Ec6g5Oip33e4nTitXgDqapBsit6T5z
         Itb1yGpfWdVnBvXcuxUbUQWCzyoITSwtPtYdW0cgKuxB9L0TRrvxjVdj/f0PqjYJuZUL
         zSPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KRDEtcOh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q2si7467807qke.372.2017.09.18.12.56.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 12:56:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KRDEtcOh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38640 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1du29V-0002WJ-3N
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 15:56:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du24p-0006kQ-NA
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:51:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du24o-0006FX-Jl
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:51:31 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:33183)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1du24o-0006FP-Dg; Mon, 18 Sep 2017 15:51:30 -0400
Received: by mail-pg0-x242.google.com with SMTP id i130so781785pgc.0;
	Mon, 18 Sep 2017 12:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ogk4glSLUUFcMz+YRhCxIE+lk8AJJwGYtZEpni0jNJI=;
	b=KRDEtcOhKRN9ZJNGtIfM2LVyCUaewoiO/QQ3C+Pu53/O35+1T/INqSqfwYkbYAMeO1
	tP+MIqONxPC7575sheeemI1Iquv4zzHmtm7evgvT5UTpbs3sLFGp7CrlpsLLb1eghV2r
	ycCLqpWMrMmZhI0e2BEzPZ7UhfR2jrGpCruv3y58I9udRSu0P+kHniwg4SA+R+nJRSrG
	HcSlgD/SJLxhQJWEJtVN6djL7TsYiW0SZhPYGVtjDFefv1JokqRs0bwHBNKjXeEWytzx
	VIWXmhxERb3xGoAlWSpArND3ENxvU2ebjCyWF9L/kNVNRarW1rTFX0G97trxRMuM8POS
	qcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ogk4glSLUUFcMz+YRhCxIE+lk8AJJwGYtZEpni0jNJI=;
	b=Go0aWpg06Bj32ZTvDAm/rK/mjuvtmOpccCZL/5OQXygR/OiZx2IaeSE8ufGSHJXEY4
	n0DH0xNffMU9fzLYsk2gR6tHTiHoXgxo4sviBVWVGezZj9l4TT2NetBfnpEXXGBM1tLV
	+j2FkK+9urE4801jzrPPX7PLI5nPv3aFHsK7h3FE6iioFJngv+F0eONYbUYczaCl+iXV
	Re+rKZwbuLRZEYWZNmgP/PGNPbTXaC/pzgeoGKM0gGGmCJWHkLmepEGEpht8AXRrU/Rh
	mBUh7Yu8V2OxBoEtUwHPJFyoXIFIt9AkSPMTbwXzw7RVQNIvUfXIrTdIA0mRGZ2o3KKF
	j0JA==
X-Gm-Message-State: AHPjjUhA+Ax2zs0/MsowsGMVnEZViI5qja17QO1MSb6edPyOmTbGxoLA
	fk0xyHDH7J5qc5ESgGQ=
X-Google-Smtp-Source: AOwi7QBZWZ0wVgj6zmm688V+R954QQuXKWt58Jknd9kSWhTvuixBbt2YShOAik6gtVSB95fi6OM28g==
X-Received: by 10.84.150.129 with SMTP id h1mr18981044plh.59.1505764289306;
	Mon, 18 Sep 2017 12:51:29 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	d186sm200791pfd.117.2017.09.18.12.51.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Sep 2017 12:51:28 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 18 Sep 2017 12:50:48 -0700
Message-Id: <20170918195100.17593-6-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170918195100.17593-1-andrew.smirnov@gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-arm] [PATCH 05/17] imx_fec: Use ENET_FTRL to determine
 truncation length
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Da/f1yvIZvM/

Frame truncation length, TRUNC_FL, is determined by the contents of
ENET_FTRL register, so convert the code to use it instead of a
hardcoded constant.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 767402909d..989c11be5f 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1050,8 +1050,8 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
     size += 4;
 
     /* Huge frames are truncted.  */
-    if (size > ENET_MAX_FRAME_SIZE) {
-        size = ENET_MAX_FRAME_SIZE;
+    if (size > s->regs[ENET_FTRL]) {
+        size = s->regs[ENET_FTRL];
         flags |= ENET_BD_TR | ENET_BD_LG;
     }
 
-- 
2.13.5

