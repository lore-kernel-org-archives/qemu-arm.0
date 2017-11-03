Received: by 10.223.150.237 with SMTP id u100csp243878wrb;
        Fri, 3 Nov 2017 13:27:02 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+Sohkl0hOqpW2PkRyEPfJ3Ney2zNsydD3bR5n1Dwc7cdNvC9PGKRgVL9g0BSwQe0t42BOHY
X-Received: by 10.37.217.86 with SMTP id q83mr5212544ybg.137.1509740822112;
        Fri, 03 Nov 2017 13:27:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509740822; cv=none;
        d=google.com; s=arc-20160816;
        b=CrCTj/JspFkU8vhNPitzxpXmpWuZmr96VerwHLS7D96+YPlPCsiGUfUG513NYzJDzF
         CBXCbmEpjGusLKjEWMS2czzeyAEFRlmiEdLb3GWkYsTcy3l+PHETs/npuXGKYKirBWBr
         ahuYPYR2czlT7pKIrLEH0g7DNvhhZ4n18FzbSfCAKXZkT9LRqf4UY3QLbCr06NIuGYzI
         iZG5ZA6VYorkwjc4tA7J/XD7QByWywpm89Hp0cKdF60jUv+S4XlEwyYxtbXbOeDyS0hh
         tnenQguy9qsb9wNZ2ObR7EgS9nFVKfqftqNOHdl/0Rk0VZVrOghP1KVoixJWi9ha8omA
         tcYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=+oGqavDCt75jxSnBWYKj0dey77GS1nANvSJMHFf9Klg=;
        b=ZTUErebWG0UIJFE2+NFAzGcltI+Yv5bwsEGcGOWCsflVWBm1Bm8fMmyFGPA/sJyso3
         Y4pZLa4gmR16Oh6vuuSqSR9eKbcI9mGMephqTuBIcZGKJCr4SrWpeMTI8xgd/W2E+uqN
         GBMkkIcJIMoLCDGWA6cO/OEjeQrJJL98au3FudxcYAhwCexoRJSq/1Viqt27xfntqYy8
         eZ6VsyTr+nBBYFcOcB3J+1utgVMuqPFhW4aqMhIWYZui58BeVG+tBELgT39zfrxcNLuZ
         oku9a57mF2cOkADYFa6hLFvDbnAcnsD6DcHExd8rGzDqd4FIzT3lrC8Ux9ZOHUr8+OwD
         HtJw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a64si1649625ywf.483.2017.11.03.13.27.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Nov 2017 13:27:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38332 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eAiYP-0001Y6-Cx
	for alex.bennee@linaro.org; Fri, 03 Nov 2017 16:27:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eAiYB-0001WJ-9m
	for qemu-arm@nongnu.org; Fri, 03 Nov 2017 16:26:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eAiY8-0000Ww-6v
	for qemu-arm@nongnu.org; Fri, 03 Nov 2017 16:26:47 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:56763)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1eAiY7-0000Vz-Tq; Fri, 03 Nov 2017 16:26:44 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue003 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 0LtRzc-1d9qwo1HF6-010qMj; Fri, 03 Nov 2017 21:26:26 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Fri,  3 Nov 2017 21:26:20 +0100
Message-Id: <20171103202624.5956-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.13.6
X-Provags-ID: V03:K0:u+P7CfbXo6wneojhqQ1Dm2ZUX2XQYr0rBk4/9OaUvu1jaS753JA
	D4UxEKFTvX/0Bhi1EwOd3JYxkqte4ehz/ppyAVefWzEU+UfvdpdaE5WonsxQYFOGai8R58X
	or/10bid9FMHwQARwIzs64htKgmIEMw44gwOHWhUPApnVJIh4wsr2+8hw0CO9Fh1051v8ds
	i2+NYLZ5jKqtU4t45Fllg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:d3AxEeaWnkM=:61yGKIlfNB46ykyNPgoRny
	WF89YAYyZ/FOrNdHUPx/V9A/XFVOZhOKSs02JBvmao54BEysm9pqqsj03moWV5n7hoyaWTL1I
	RUMEKlE5/l1ufJpr5pu7VBWesElrhtnnT1PfCwhaQlXmzfZtwXAoOIj0ctReNz90TrZx2CEQD
	j7cBOvaC3APr8poQ8qAo58s1S/bIEfzjnR3X6ak0j8t06ESFjZoBCuOMba/01cVUg1JVN5+av
	6sybkX000OP9AfaHa4OKZcjkB16E01LwDd6+5NBD7RJRRd+c2uppzP0c7sFVdJIBJrnvDOmiD
	b2sYoF9nls/a6MdH8i+g8udeadR6lJWfDo84KzS45vTIIc8on5ADUqxd8nL7I1ultJGcCskS/
	rGD+Oad7YqhQjczJRLhquwG3WMobNodmahV1HQ5CXGw/Vo+eMMAjO80TvTAAxTNJPaVgfz6jd
	9GoWLcXFbIO9e6ESOo6yG1WTCrjVMs2DwKMj7IQNjtpnTJSIALLI19vL9fURectJRmYpesW3I
	B+hL9T+1dQEUWyPATocECjxWrrraz4a/YPXWsXGYOk2F/wKu9/d9iYSnG7Y0lT84A6nW8IdoW
	WJ+j71APa7pQnQ04a0AALFn7qQ3Uqr7z1i001NWcwrQrD3DOQAKCYBBD5cyUsf6b12D7pU+1C
	R8ZFpJ4lD6fXMQQ6y+XbiH1Sdh8p3Xrr8NLty9Lq3oXITlo5npU3BFX7rCEeFq5plLZX0UAon
	41Y8oyfSuN3noFhJ7iZW/kP2mAxOFglIAPjDmg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.131
Subject: [Qemu-arm] [PATCH 0/4] softfloat: fix some helper definitions
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
	Stafford Horne <shorne@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l+jHAMCTImxw

This series fixes some errors found by
enabling USE_SOFTFLOAT_STRUCT_TYPES.

Most of them are helpers using int types
instead of float types.
This also requires the use of floatXX_val()
and make_floatXX().

Laurent Vivier (4):
  arm: fix float64 helper definitions
  openrisc: fix float32 and float64 helper definitions
  tricore: use make_float32() and float32_val()
  softfloat: use floatXX_val() in XX_minmax()

 fpu/softfloat.c              |  8 +++----
 target/arm/helper-a64.h      |  6 ++---
 target/openrisc/fpu_helper.c | 52 ++++++++++++++++++++++----------------------
 target/openrisc/helper.h     | 20 ++++++++---------
 target/tricore/fpu_helper.c  | 34 ++++++++++++++---------------
 5 files changed, 60 insertions(+), 60 deletions(-)

-- 
2.13.6

