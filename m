Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp9054071wrx;
        Fri, 8 Mar 2019 18:32:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqyCuMAqT4GpXa/8NB28S5s0fXXENHaqoYEJ/f7/Bd7FKDuFtdZEnbu4dmBu3dVZO+7fWScL
X-Received: by 2002:a81:e52:: with SMTP id 79mr17262149ywo.367.1552098754934;
        Fri, 08 Mar 2019 18:32:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552098754; cv=none;
        d=google.com; s=arc-20160816;
        b=shQW/xxIcl/4rXhVMBXXkk16HVDwtkqm4sCUPVnIVlowVBET6la3G4kgoyNijlCev/
         v0GGy1HWRG73Uw9g3nMsyAzKjStYsvUR1UhmmM+Z1X1x15gmC2Z517eV5HMIEkg0GLTR
         fkJPyDD1Xo08xGVpaIbk7KUcH8lvfYaONIBpUC5UYDJ8Xv5yFZA1PsnLbT4ww2JljPxX
         p5+BVhVv1alCpnK5a3i2uA5qufqMLUoFNmGV1tbG4+2QsNGX5rBVFsDAVCAZrJh0kxU1
         3/q8hs0BYi8Ns62W1i3rsk+uCk3OYJnQL8kP0PcIsVmIXPeCtsUY0Vkg40OPz15wFZRw
         +KtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from;
        bh=PHGZVsFVzA3+PFbo31vVkYENzQSOP5kz+amsvuM9ebI=;
        b=RvbLeyI5qEpAE0J3wPaVz//nZ2D4VffZDqHzf8aKasusc1RbIQeETdV9haR4osQ0z4
         vd0M9WYzt029kpWhAvxgDMBw4zxmBZ2tIHO+LUlJ6oUyzS3F6CSGxFQUodabF3NDnqoW
         OlMiN2UoqAbYctEpOdNQvE2trWZIT5vgQPhw3to413eRsoVkH4mt2ahBiqF51kblnBK+
         +f7bXGK0Dg3OWefYHux9h1KecVUWdIHRV5MBKunLxy8qhgPRkz2VYwT7+SuaHaBRxYpg
         +FSMj5m1FjPWEYYaSkULkLuBSm8BnWEDa3ro60DDo5YQvyJzTDs1d9ouq/MJkXC8AUPw
         2N0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b4si5494358ybk.344.2019.03.08.18.32.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 18:32:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:52946 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2Rms-0000ia-Bf
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 21:32:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h2Rmc-0000iE-QT
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 21:32:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h2Rmc-0004uE-5G
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 21:32:18 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:40098 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <guoheyi@huawei.com>)
	id 1h2Rmb-0004kz-Ps; Fri, 08 Mar 2019 21:32:18 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 034DC530C9D161BDD26A;
	Sat,  9 Mar 2019 10:32:09 +0800 (CST)
Received: from localhost.localdomain (10.175.104.222) by
	DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server
	id 14.3.408.0; Sat, 9 Mar 2019 10:32:01 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Sat, 9 Mar 2019 10:30:47 +0800
Message-ID: <1552098649-28341-1-git-send-email-guoheyi@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.222]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH v5 0/2] arm/acpi: simplify aml code and enable
 SHPC
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Heyi Guo <guoheyi@huawei.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r8z4qvWMZj0T

After the introduction of generic PCIe root port and PCIe-PCI bridge, we will
also have SHPC controller on ARM, and we don't support ACPI hot plug, so just
enable SHPC native hot plug.

Igor also spotted the store operation outside of bit and/or is not necessary, so
simply the code at first.

v5:
- Refine commit message of patch 1/2

v4:
- Improve the code indention.

Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>



Heyi Guo (2):
  hw/arm/acpi: simplify AML bit and/or statement
  hw/arm/acpi: enable SHPC native hot plug

 hw/arm/virt-acpi-build.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

-- 
1.8.3.1

