Received: by 10.28.91.67 with SMTP id p64csp3505201wmb;
        Tue, 20 Mar 2018 00:28:08 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsqFmYsES6s8bkzI5S1JgL5VmGhE/LjD9rHYuizJkUbEiczWDk6yPej+O7it7W+/YJXQSOd
X-Received: by 10.237.50.100 with SMTP id y91mr22873707qtd.327.1521530888151;
        Tue, 20 Mar 2018 00:28:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521530888; cv=none;
        d=google.com; s=arc-20160816;
        b=qdgA2FWzf1BI2KSaxTXXRz5kbddRDCHBZ3AkfYARMGHk3CAAPOQMyNixkiyHc0u9av
         8u+O9r4ydEd5rVSaNyRFEtuobi6zpH1+Sshasv/O4usxh8F9m4F0wiATEGlngLs9mDKi
         0jwWrHoUFqOhfVIyQ6701seBIZ3Bw5E6xfuYk4Abxwqfv7B8ejeZ/XphWFZO7HAmAWWW
         b+VKdqnUJjH2R0wUqNmHETLWiIyKGCmVnvbYyfDkYTEQOC+yAvRo0WCXnjHvxIzaKSau
         sp6BS3J172Y9cxWr4w94P1LxZTbQOn1JRRuX2Iw5CRx0eaINST9RkH7isEHuM9aaOguN
         KO0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=ZIPHiznMpF1ImuChS6Ah/oOFn5plCsrSuSmBF1AqRt0=;
        b=GPNTDsmsOz7iST7Z0FGkfqPutHXgQ92imrndOmzT9wUly7fxl/IYS3xMhD4QVWhQCI
         K9FjHeop6MDE6N2x3yDJNruYumtM9pGrSTBZDhiiiqUdqc8yBjggATlRrYBGrRZmyy17
         ryMUYQ+11icdaAvOIAcVh0iNYABSK3QFZ+OFfhTOy0sgw99FyzzAc/rC9L1KUt++3kHc
         QR7P9DO51SKxTDfiPbfNKna87Zte6nWCQLpDaWc3M5gHxS2FLVn7dFlhYwAPPaZglvxb
         dvhbOSZxFa+PrMOGOEYjMlnVoUCpoglKDCwM8Ygk0zChms+rVpvrkMKRunEOVLR2IfJY
         r6Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t20si2228695qki.303.2018.03.20.00.28.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 00:28:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46618 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyBgl-0001Iu-NU
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 03:28:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47854)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1eyBgU-0001BQ-Hd
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 03:27:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1eyBgQ-0008Sc-Jn
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 03:27:50 -0400
Received: from [45.249.212.35] (port=43376 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1eyBgQ-0008Pb-8V; Tue, 20 Mar 2018 03:27:46 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 608B2B7871CE1;
	Tue, 20 Mar 2018 15:27:41 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server
	id 14.3.361.1; Tue, 20 Mar 2018 15:27:34 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>
Date: Tue, 20 Mar 2018 15:26:47 +0800
Message-ID: <1521530809-11780-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH v2 0/2] two fixes for KVM GICv3 dist get/put
 functions
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oDtcKADl2Igb

Changes in V2:
* patch 1 use the existing variable
* patch 2 add more comments to explain the problem

Shannon Zhao (2):
  arm_gicv3_kvm: increase clroffset accordingly
  arm_gicv3_kvm: kvm_dist_get/put: skip the registers banked by GICR

 hw/intc/arm_gicv3_kvm.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

-- 
2.0.4


