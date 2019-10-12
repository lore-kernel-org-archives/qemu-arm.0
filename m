Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1938122wrm;
        Sat, 12 Oct 2019 02:46:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwUE1hsFWcuxCgqiPcbqwTqygStI0SoXsTboaF97YLAQ27pHROxNYnVLTpBKYrGzLwKdsRZ
X-Received: by 2002:ad4:5441:: with SMTP id h1mr7025868qvt.227.1570873602615;
        Sat, 12 Oct 2019 02:46:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570873602; cv=none;
        d=google.com; s=arc-20160816;
        b=C9Ajg5+q0alT/s499mHxejR3j5jF1uMisH7FQYM1p3ZVWTkiQ+pD7f0NMZR8NONMpa
         PBmsy3dlcnO1/73ncu/nztowa20FpLniFo9kxEu45qvan7Sn48IesShUwYRtCAdxuX/+
         OaiJzOajSRgKAMSeuSHHxHsVK1ACSLCMhAB4KYlDwWclwoQBbaZUb5T+cuj35xto/eOc
         6O3AvKjeYWvbgI5aG9tI4gR/b4vsmJ9epzWtTVFZKrZbB8d5X3XZD3aoXa/p+klv5t1e
         8B0VBJ+MNb+306rnrH9XA3HvudRnevGA5USAmUvZuoKPN/lEPYI/JSeBuN280umlWklO
         9dQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from;
        bh=ADaPZ/S6rPpo7pWewRvWx4KTUCnGquHC6zj+aPPdV4E=;
        b=KZI7uXat+0VQxLBK12eRHUkGYSXe/t2hZlgDH0PdGG5V8a0oegBTKIffqcHqXEjGsL
         wKAHeUXSRq2Pte+cfgLatbbJzpYhxGVpUfweb/xWvRlPsltJZrCh1W3Rsc+oroWcInq4
         4v9xbxBhTGbxYep0fm/qgbfrIDXk8HcHEEvuMZYN7s0ANopWgYrekbrT/4k2Y4k8Q5/j
         P/ZluGrR1eV0kOMklSgFz9RSksyrYQlJ5H/rkR8AcGi8V0aO25L2+IZXTmyqXpgpO7pJ
         gJZ9VHh5lqKjtNxVlzLOY89LCwgGYqe4qVSqh1PgG0EE0OUg72XZth0gJK1dYdAQvoiR
         xkog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x10si11978244qkl.274.2019.10.12.02.46.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 12 Oct 2019 02:46:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iJDyz-0006hl-JI
	for alex.bennee@linaro.org; Sat, 12 Oct 2019 05:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32964)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1iJDwU-0005TK-Os
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 05:44:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1iJDwT-0003VS-Fm
 for qemu-devel@nongnu.org; Sat, 12 Oct 2019 05:44:06 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:33528)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>)
 id 1iJDwS-0003RV-Pu; Sat, 12 Oct 2019 05:44:05 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.13]) by
 rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee75da1a04dcc5-4ed06;
 Sat, 12 Oct 2019 17:43:41 +0800 (CST)
X-RM-TRANSID: 2ee75da1a04dcc5-4ed06
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.149])
 by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee75da1a0478f4-669ae;
 Sat, 12 Oct 2019 17:43:41 +0800 (CST)
X-RM-TRANSID: 2ee75da1a0478f4-669ae
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 0/2] use helper when using abstract QOM parent functions
Date: Sat, 12 Oct 2019 17:43:21 +0800
Message-Id: <20191012094323.234788-1-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 221.176.66.80
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
Cc: eric.auger@redhat.com, hpoussin@reactos.org, f4bug@amsat.org,
 Mao Zhongyi <maozhongyi@cmss.chinamobile.com>, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M9palQEb2VSr

Philippe introduced a series of helpers to make the
device class_init() easier to understand when a device
class change the parent hooks, some devices in the
source tree missed helper, so convert it.

Cc: eric.auger@redhat.com
Cc: peter.maydell@linaro.org
Cc: hpoussin@reactos.org
Cc: f4bug@amsat.org

Mao Zhongyi (2):
  arm/smmuv3: use helpers to be more easier to understand when using
    abstract QOM parent functions.
  isa/pc87312: use helpers to be more easier to understand when using
    abstract QOM parent functions.

 hw/arm/smmuv3.c  | 3 +--
 hw/isa/pc87312.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

-- 
2.17.1



