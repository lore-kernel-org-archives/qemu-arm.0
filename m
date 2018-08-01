Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp701319wru;
        Wed, 1 Aug 2018 05:34:56 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc9UyfgfS6lAb5IsW34CmvquRZd1IfC0IjShWrJkSiOwgCOhqN7lwsZiXgJPyNYLAeucswA
X-Received: by 2002:a37:9c94:: with SMTP id f142-v6mr23815004qke.180.1533126896695;
        Wed, 01 Aug 2018 05:34:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533126896; cv=none;
        d=google.com; s=arc-20160816;
        b=Aqf26e22YK1fu5KIGSx4UDZmfSrYtwoEJwnfSEFl8S3fadULJnKTvLUNThHs5K+6kj
         fkQKpaewcKlxfZd+WqQGy35szmCxkRS7y958xRCFwwIGFHV0b54Fsll6F9nSZnuHCv35
         Nh/UXugKFZ14rGKsmlkrwYfwtvwbUDYHxSX8EmeTc7y4YHOOzet9p1rKznVwdyAyHGfG
         6c+fpmHMesbGaD/Uw+WIQsIcpVGBRPDo1jWmUiTFd5ddITufw82/drj6wqiun/xrlCPT
         MjUZGn/d2bNmcFUr4zRvJKui9lvgGN4PM53VLq0eScaYMXn1T6/3Pc9VaDaJ0bNe3Voh
         uu2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=RjWB24CfHHwazw6nmvjHvKW+AktiQYvHixMnI+ZWPTY=;
        b=xtu49Rytn08F0krCdIeWaFb3KmHpZilJC8CzlhD7TcWxhxiUrySpkoOWFGE9OIjOcM
         MlNymbOtG2eJ7136izck7crnUtO8UtACevpSxjykQ9t6G9cnpbl2V6Dp5sMO6bw/eu14
         RoWvAmnAGrT8SnJAWEi5+D2vNKAo+pN7suh5HP1Bj+TBYz9myOHrxfBbkXU4SwZrjCPb
         2c3rY9i5cYJ5EkHMSwoa+Nt73a2ZtxMTDzA0OErICEGGfEDvJG0iBjbAekL0bjLbhwsK
         1MHw/ZRtbT+hhgB9yyKdQ/bKnPB2C7MGzIzTJDfwa5zmuUvjIfcX3SUUVRS6S2VTIRCB
         CpOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Au5LamOf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d5-v6si7331280qvj.63.2018.08.01.05.34.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Aug 2018 05:34:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Au5LamOf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39629 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkqLA-00087u-4D
	for alex.bennee@linaro.org; Wed, 01 Aug 2018 08:34:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52259)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fkqHm-0005po-45
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 08:31:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fkqHl-0004Wd-9n
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 08:31:26 -0400
Received: from mail-vk0-x244.google.com ([2607:f8b0:400c:c05::244]:39867)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fkqHl-0004WH-4a
	for qemu-arm@nongnu.org; Wed, 01 Aug 2018 08:31:25 -0400
Received: by mail-vk0-x244.google.com with SMTP id e139-v6so9172998vkf.6
	for <qemu-arm@nongnu.org>; Wed, 01 Aug 2018 05:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RjWB24CfHHwazw6nmvjHvKW+AktiQYvHixMnI+ZWPTY=;
	b=Au5LamOfXCquq1zXmk3d8Ck598RZclsLaAnHFVcB0vIej2LhyIKO4V/yso5niLmjqs
	1bKwV8ciXv9NjS+LOZBc9wjOhDt6tH2ARbl0GgRKFqlUe8BqFzm2IFUZEFajmfByWEgX
	rX/kJ5UXRKOW1fvS/PgcxkG4u0WUt+/j5M6IA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RjWB24CfHHwazw6nmvjHvKW+AktiQYvHixMnI+ZWPTY=;
	b=arS7nITSzOCu3hjnnoqpZSnBgDBvQzuj3sEzi/SaCc5+vViGFBYDY0urPyQG3aOPsC
	V9TxEWSAoVbYzRt0WZvpXQCjoTbRA76Lw1+s7Ai/OPIHVBsgLzzEphTPilphJSt/lFcs
	M8xAxnIWuvsV6zB6UnAqqWVgnBuYTZ5h1/kSWpm0TJBQ0zuqYL2WGoK+h4VVZndtodAa
	0AW+hzHFAAgKXYBovSHZU/wGYersIFEgzM+jgZGQo2EIVl9V446NNd8nANNLaM+ouD/Q
	JG46pgXilk9xoWn5hwpX+bMkUa4Rjvnhq1tscExC0Hur1y1yo9a6TtGsCJW77itCIdb2
	6l/A==
X-Gm-Message-State: AOUpUlH7SI9Q1Cxkeo2+gt53a6YeprRm7ANQj8ouFLn4LWpJlHiy+DjL
	gA0hWJMVe1kISdmMcUAYQP5OAA==
X-Received: by 2002:a1f:430f:: with SMTP id
	q15-v6mr15803628vka.92.1533126684567; 
	Wed, 01 Aug 2018 05:31:24 -0700 (PDT)
Received: from cloudburst.twiddle.net ([190.166.236.188])
	by smtp.gmail.com with ESMTPSA id
	f60-v6sm4247847uaf.10.2018.08.01.05.31.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 Aug 2018 05:31:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  1 Aug 2018 08:31:11 -0400
Message-Id: <20180801123111.3595-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180801123111.3595-1-richard.henderson@linaro.org>
References: <20180801123111.3595-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::244
Subject: [Qemu-arm] [PATCH 4/4] target/arm: Fix typo in helper_sve_movz_d
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
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tu1vbHi7+0cB

Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 87594a8adb..c3cbec9cf5 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1042,7 +1042,7 @@ void HELPER(sve_movz_d)(void *vd, void *vn, void *vg, uint32_t desc)
     uint64_t *d = vd, *n = vn;
     uint8_t *pg = vg;
     for (i = 0; i < opr_sz; i += 1) {
-        d[i] = n[1] & -(uint64_t)(pg[H1(i)] & 1);
+        d[i] = n[i] & -(uint64_t)(pg[H1(i)] & 1);
     }
 }
 
-- 
2.17.1

