Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1400647lfp;
        Thu, 6 Feb 2020 04:53:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqzaZZ4WbZnlMh+lyMMZs3X0YqqlIf3YE+0uXAGMDbr+1JqORhJmN4vVxkJX0/s/xaX9oj3d
X-Received: by 2002:a37:664f:: with SMTP id a76mr2387859qkc.470.1580993598316;
        Thu, 06 Feb 2020 04:53:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580993598; cv=none;
        d=google.com; s=arc-20160816;
        b=gw4LNBKjfCqkiNwOrlX5rjRP0fD1LbNR17JbzsxwP1QZz4d5B7IAe21XXoS66RmdYD
         oi74RpPbdP8pVHEfAS9zlTyPkSber2Ifa6k5OqGpeeHKbDGchRDlKT52xwZodKs+yUrZ
         zt3MAmEowHrFURn4VxBJZxbs63oBAJZAiOuEsqBAEOTxHj6BWJvcaa70chtOx9hFLD12
         zR+Std8WNJHoms7nR17eB3zBo4YBmDf6uOolmjl0XGR9lYRvnp8339jBnjSSoLIC0hJw
         X5zzW1z+ixTgY5Q+DgBpgyyRAKNMt2JT/+Z1JPTdpJ44865IhbZDyoiTRUk/99ezO/Hw
         hAlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=/ZBcSebeLEMg1cEdUImN+YaWUsUtNVjxAofeRwjuxkc=;
        b=B+040JlkTWL5OKfGZRHudLU3Zg8xdaNd6DyYaEl0ngKAVbZqercoQaYYK7RFy78TgL
         sG7wuRVnAFgRdYfBjcHsvZ1602fTx6WVi1N6AVKkNS9xb1vjBj2tcnN2k+X+Y8mH8Scb
         ChB+EQo6oRCaekdnzxfQUQfAgbjp2rpEmo72RObSgUB9KrzoZQYp++UYB1rVu0qD2LAi
         kzUeFL2YzZaUxooZ8l77iRQ8FhjXBejq2Z8PSdA0yy+4vNYI14azJx5P6OMFxgmhgsRL
         w226iJP4TdG7zvb3yuT00GH1ptIeD7vtwI7fxzg7NXup+K0OfO9wCYUPd9a62W2E0cWD
         1EMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ev15si1465753qvb.98.2020.02.06.04.53.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 04:53:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izgej-0006Py-My
	for alex.bennee@linaro.org; Thu, 06 Feb 2020 07:53:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56413)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1izgcX-00015x-Sp
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 07:51:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1izgcW-00063H-Pt
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 07:51:01 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:57897)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1izgcW-00060H-G7; Thu, 06 Feb 2020 07:51:00 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MWitM-1j1zws2frE-00X8C7; Thu, 06 Feb 2020 13:50:46 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 08/12] qemu-options: replace constant 1 with HAS_ARG
Date: Thu,  6 Feb 2020 13:50:23 +0100
Message-Id: <20200206125027.1926263-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200206125027.1926263-1-laurent@vivier.eu>
References: <20200206125027.1926263-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:oUS9/CdvOMTgMQUxXzkvMUnhIKE+wbz8rdCq2y0WIs9E41NNsNp
 z7d1JpcONN9ivWLRIapo/5quaJv6DrNIaKZhhJwRV7vP/k5OX3aKs9+Lt4LyCf9YrNOIOd2
 pD0rgm5Oa9kTJdxp7craCW7YYT2zYcPnrvQo+5IP8dtR9Ffw62AKYCvlGHRBAWpjgtb9R/X
 BoIZL4WhNC2YlTkt6BXiw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oCwD7SN5neA=:iogWmR6DI49knC4Kql8lrV
 qb2ZwyQK8f1kCwAYiNIK85dPEBIsxLFMxigtpoWedagIzXgebvoEIUfkcnDWO9vTwQIKWQvIK
 Yp42cUwMezy8fX+9kei9Kv4R2OQQphB86nC3HJO1EiSp7rnujPeH2tm6PLETYfLEk+OBpIp1Z
 WfnKCtZI0G2dtUPVsQnm+/kDWPuVg8KUKsYxAEXLnQQY5Mc/pm4stguTiUguAl2XCkThAXcDh
 C1FVnc77/EJB0M+DSIj/wLXOiLd/mvOWglURLYdElhHHTpNotHzwkdvfhYIWX/N2ILpWJJuwC
 Iwy26Rcb4SfWxvcWcLyGwTf9Rd6G6YKYrnlMj8Eym/TR2yCU7Jmfm5u4Sq+dJ5Qfmp9DJ72fq
 uNzYihVBSIJxEfAYKC71rr6T8a25wkQAQ5AS+rQ8QbdrkOwxYDwQK/yp8fuWV5YF3AvAY01Fe
 /9H1JGnswftqUTibxzSHzYxRUPVl6dHIyM7rZOMpOIlr8VfyqV/b+pAP4mTiL3oIKx4dt41W4
 bbjr1mKcQzCvQ+Mkaga7LrLWUvt09bkYCkT0p3rn8dvYWCraNAHKC/af9KwlyGUMxx2mANIRq
 ZcrKW2FpZf7+1R5FN5IGgTWGVbWx1Yti683zkzzakMF4euK3k8dJL8oRzMSkW9nGm93/Vn2le
 95h2H4CssrkJpZM1Sy1JPILQIQOYYnN0cehD6rVuK3tS5uDY1kSyrsu8Ei2y8ATvsdWlbN9Po
 BIb1JUy54dBxydLhm4GLhjxKfus++aSqO2No5UoE6B7z6koGCBjgzLzMuSG+iDZAS0brGL/6G
 Rz0YQir4oJeGrPuhSzCFo6V4JigyLakHqIdBmmtd5ujgjWp9uLZTAxqH4x8VnwBDMmTv3LP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gfqayciUYp3Q

From: John Snow <jsnow@redhat.com>

This is the only instance of a non-zero constant not using a symbolic
constant.
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20200204165638.25051-1-jsnow@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 224a8e8712a4..ff3e806977a8 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1955,7 +1955,7 @@ STEXI
 Start in full screen.
 ETEXI
 
-DEF("g", 1, QEMU_OPTION_g ,
+DEF("g", HAS_ARG, QEMU_OPTION_g ,
     "-g WxH[xDEPTH]  Set the initial graphical resolution and depth\n",
     QEMU_ARCH_PPC | QEMU_ARCH_SPARC | QEMU_ARCH_M68K)
 STEXI
-- 
2.24.1

