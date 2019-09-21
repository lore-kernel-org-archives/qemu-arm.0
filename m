Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp711934wrp;
        Sat, 21 Sep 2019 08:05:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxH0qjB0W8Z3O8L2QP8qEbT29z83uAR81g7r153Hn7q/L6ONRDgUVyasqacOGRU7dDYfSOq
X-Received: by 2002:a50:c306:: with SMTP id a6mr3309028edb.108.1569078305302;
        Sat, 21 Sep 2019 08:05:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569078305; cv=none;
        d=google.com; s=arc-20160816;
        b=niT4Mz+5/tYtK0L1+jqDcB+s/u5TZf2cAPmBKQo8CBwREcBYPKJT0QplQ5JkVnNT4Q
         he45wbu1vchi62RoepiatdlOwxXfQr2W4QpeGjzbBIbUryOpMsDPpP0RAO8jadijj0Bq
         9W9HYoxrYDT8udVG6uzUI23yBdi3lbM5wb+Bzt4Kci0dv+A44+u6SzYBwLy/Q2uh2Y3q
         Uejd/0awuchViKncdhT5bFmzAcQuCFSj641OWyE4k+d9L5EUAjo07EtCQutfIWYWglBx
         Pdx7sSedShfP4N73bXglrPT0LVNzFXWhMTX4qrTwn8ZX1wc1BObuAv8JVuApdupgybfp
         xU7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=yxPoLI4WXKjMG2st4IlBgiG1fv8c5f5tnTKxbeDpcGs=;
        b=HbA0E7gJxfV3fJkXG9uks4ZpP9rMJ5dyZYAi1X3/j4+O1k2BK6owJ717ADvt6Eeqqk
         4p5hM2fTB4ULTEb/9prKUtvpTNvnmp6xeBy06Ej9FAxjHQpixcHqkQAwDXcyi3VDSxWx
         t67/ZDlHNCbHTZ7jKW3YQIAsu9EO3ekE18W1C6NNwXipiuUVWhkiIkkb/ePR54UjpxPb
         27Sxo2LtQ4/SRVe9QnlC2vJp+yJR0lU8B0Mpqb7Ys0OvJ5J8B754La9k4V2dytYI/rmi
         dzkvUY8i5LrwGqT5KAwt8Rvut4lQoj4TANBGh962VTvYNNxto5ELkSc0QtRCyhM7qtVC
         pTUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11si3681488edi.442.2019.09.21.08.05.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Sep 2019 08:05:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iBgwa-0004Qq-0C
	for alex.bennee@linaro.org; Sat, 21 Sep 2019 11:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39815)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iBgw9-0004OH-Fd
 for qemu-arm@nongnu.org; Sat, 21 Sep 2019 11:04:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iBgw8-0003Ef-3t
 for qemu-arm@nongnu.org; Sat, 21 Sep 2019 11:04:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46728)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1iBgw7-0003EV-VH; Sat, 21 Sep 2019 11:04:36 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 455F9882FB;
 Sat, 21 Sep 2019 15:04:35 +0000 (UTC)
Received: from thuth.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA237608A5;
 Sat, 21 Sep 2019 15:04:33 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 4/4] default-configs: Do not enforce CONFIG_ARM_V7M anymore
Date: Sat, 21 Sep 2019 17:04:20 +0200
Message-Id: <20190921150420.30743-5-thuth@redhat.com>
In-Reply-To: <20190921150420.30743-1-thuth@redhat.com>
References: <20190921150420.30743-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Sat, 21 Sep 2019 15:04:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NLLPFjUjVwrj

The arm builds can now be done without CONFIG_ARM_V7M, so do not
enforce this config switch anymore, it's getting selected in
hw/arm/Kconfig automatically if needed.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 1f2e0e7fde..64f5ac24bf 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -1,8 +1,5 @@
 # Default configuration for arm-softmmu
 
-# TODO: ARM_V7M is currently always required - make this more flexible!
-CONFIG_ARM_V7M=y
-
 # CONFIG_PCI_DEVICES=n
 # CONFIG_TEST_DEVICES=n
 
-- 
2.18.1

