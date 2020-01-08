Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp924038lff;
        Wed, 8 Jan 2020 08:05:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqxy8AvsoyFLARcGWiSrNYridc6cF/IRbXSDFlKFAA1UazeIfbcsIng/1tY8qis6gPfVulkt
X-Received: by 2002:a05:620a:b06:: with SMTP id t6mr5198826qkg.373.1578499542353;
        Wed, 08 Jan 2020 08:05:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578499542; cv=none;
        d=google.com; s=arc-20160816;
        b=OFOIqeDk27EsXZmWtHNbJLdaXY5LwL3saIllM9R5OJcwHRu0v1VLT0YouJhJ1ucgU+
         WwMAnlXaHJmzNZAGj6NtDyz1DR/GM1gQGqVd/ZvR8gckDjsneAwEOke8rDdP+GHZEGpN
         p+fCObKMlrrH4js2BwowtnKDpO9cVlAv1U3QIJlIqHk6x3/rxOQSjlsFF4YGw67hpWsI
         QMyoTcXZrK5mzwPQfbgj1og/QJB5aC1po0XZp9t+AWAVMTq+OzuuW7LFHd1U9T5gc5ma
         vAXEYlWo678XY8A8cWnAjAasd4eUTUcKHvU8Kfd2RZKiPFhk1b4bnnnDkV8eBJHvmIHy
         dPTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=F7zcUI+jh2djnUmMELhj0bFLUUsFpRSX11kJz+N/sro=;
        b=KpyI2G58tdDxnK2/8gWT+pkbAAwgJ8QYPvVckYlZmp2CMfvZvb7cycVeAK5XSlCaTp
         87myCg9ddn/Fn2ipr5hg5tNbDiOqmsNgF2vH55jSFt3zxb5BQAJMR7lTKWJfwUg2vuAm
         mP36sO5D5IM9PpFD3rKa6XfFuezr/MefDSbcGgmd8M0Q2eb0hodHRGbx+e4WanWvV7J6
         8nSlNLOwJWpKyCs00PdX3Sq2uUVMzg99tMYj/Brccv4b4ZodkrYhPSqEvFNmHJUbmxI+
         QnyL30IJjpQbjfyfrnXLKlQ7K6RN7nspOVK0h7Cf4wD7/twVrXbZ5mYPSHrWaz+GI7Hi
         3+dw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 21si1794735qkf.293.2020.01.08.08.05.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jan 2020 08:05:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipDq1-0000QW-7p
	for alex.bennee@linaro.org; Wed, 08 Jan 2020 11:05:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36366)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1ipDnH-0005e2-Tg
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 11:02:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1ipDnG-0001q7-QQ
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 11:02:51 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:56181)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1ipDnC-0001l3-9a; Wed, 08 Jan 2020 11:02:46 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MuDHR-1jgcim0EdZ-00uddu; Wed, 08 Jan 2020 17:02:37 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] MAINTAINERS: Update Yuval Shaia's email address
Date: Wed,  8 Jan 2020 17:02:29 +0100
Message-Id: <20200108160233.991134-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108160233.991134-1-laurent@vivier.eu>
References: <20200108160233.991134-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:etpxR2CQD/P8Mx74yZqxCD10NlNlT1WxkMSCMaddz7551USEPww
 JdezFtWmzZj7ETLfTm8o7qVnCFImN4PnMpPFSxqsz11/AN8GkGKQwFbYG42Mp3PafEDluI5
 Z4Co8PtSG1JA6264e9ZeYjYwd7NwDRj66+g0P7n2J0S+3gyEfU9TgdNEYVq79+DKrY+bWTn
 rCS6ARUf+jxjsw5Ku5aKw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:spc/qM3I/Cw=:DF/no3hmC0l74czZf9S96B
 aRY7ZFUhvkSprunFk356cmbXDclEOjkdkTBekbdQcH4I4GBGDKHNcTNkFVqhvnh813xtLpn0G
 hvANNHFalnIOFjPGomGhVJ0fY4WCC/6MdRWwTzQxIOQ39niJ2vlPAPCtAQAHyu90Hq+6klNK4
 BNpKXlcuiS3HY29WAKmtaaQgUsHk/lDYLCGoVJpdgAw3/Xg3bj85sDcwEOO8x73VWKXPSU7SI
 zgCUCc8s9UUOQu/RgkQuM0F6Nfmw8L2bpciyUGzJRiAH1N82gUP+XT7FqDHFrZQtJdrqCqI4X
 6lnU1bQl28er20h836YWjmh3FbPNS1K4ALaDA3TzWml8km6mNln5HGa7pNbM9jobnmjAemuaD
 4nxHHqpVMxLmQd9w/N/h812oyodORg+GBDPEKKejeuYZJ0m94/QzLKGScOmPtrHoXdbVG6POa
 PiATL2ogNnx4Y+L3BBUO0yebNjBLOsZpXX4QH+/+Gp1MbxK2QHmVBTRvUU9By4Ki1eHCF9CfT
 NjbNGwLPPtT6iWcvamcaJ3X/3StqaPbBBIFSWleUSZk6abLjoM4S4SrgB2JMeSNaR3gt0lGhy
 XGeLqTiuuTbIJauVKkVxLKnUdbeGsrWerBSv8SKXWv7vOSadYnBzhg+H3xKC4H3hMcGqooabH
 ObAKKouRnuG5aaWdicwaBjipsU3IPz/hfyKJes57b64/aY1t8qYtc+twfc1QJQcA2L0RZV20L
 2S4+koinZLYbycTph3xtEohGIaoe+7Yep3uZhUqLzdAj83232Pb1R62wTUv1Rg/nuUm5xKI6D
 UuLpgzdzIUOgaseQX43iAo8zR3rFRkNQ1RC9Zlk2P7AW0YLwo+EsCPgzeldlynOdXJghrusdm
 Oxs3Ozn3lKFiy6VclLYw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.131
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Yuval Shaia <yuval.shaia@oracle.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +D2wTNd+XFS3

From: Yuval Shaia <yuval.shaia@oracle.com>

Use gmail account for maintainer tasks.

Signed-off-by: Yuval Shaia <yuval.shaia@oracle.com>
Acked-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-Id: <20191126102637.2038-1-yuval.shaia@oracle.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cd2dc137a3a9..df0893cd4cfe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2659,7 +2659,7 @@ F: tests/test-replication.c
 F: docs/block-replication.txt
 
 PVRDMA
-M: Yuval Shaia <yuval.shaia@oracle.com>
+M: Yuval Shaia <yuval.shaia.ml@gmail.com>
 M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
 S: Maintained
 F: hw/rdma/*
-- 
2.24.1

