Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp724313wro;
        Thu, 14 Mar 2019 04:31:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxl2oHPgnfQkbJYhtE5asrh2VDQPWObk07aC7g8FkTjRJ/HyqGzbx2bgGBpDU++2Pwt+Ujg
X-Received: by 2002:a81:4b90:: with SMTP id y138mr16755279ywa.80.1552563096677;
        Thu, 14 Mar 2019 04:31:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552563096; cv=none;
        d=google.com; s=arc-20160816;
        b=vI+yaT4/jaBYCQ3lHuMvDm6kRuO/I5sgqVIi6q0PIAsSUCaBSqXAceA8E5las1tVmx
         6bbper0Tdco9G/OiKcI0afgxFvtWJNHVzVNBjSf5o5DREQU32ztuAR/AOKmYyNBX1hia
         qoHNJm1wIkNEca5m0BcQvnibSuVQ2hzD1SqtUrjuIYhCZGnwxuTXa8PC79uK0E/LFS8o
         wg2E/ktDhabMbZwr4hHU/j3w2YoayfJ1y5ZWEXkL+XukZCdMC/xv3y56SkPly8cfisl9
         41Y5iGlZLwZPLNe+6QBDzIJUA+q1KEN6VWY2Vc1F632V5BLGl5kI4CM800xbr4AQ2sTi
         +Csg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:from:to;
        bh=1dAOFdV19fHWx2cjATtecaE0rPCs11G4NMI3B7wAZHc=;
        b=xb8ztLu4mkaQrWNpO/yh00Siczr1IbZJ44V4bBgj54ENPt5ZVtEY9/VvY/jOgLT+Sx
         iAvRszZ8d6Fb4/ZgN/Ivgrg5KfpZI52KcB2WmxoIWTu/3dkFSCKhYW+VyElRYJ3v1s+L
         k9XTapi4ewIYHM24hFfiuUkZuGCgEFkDgliTfJ6B0ZTrou2874+jdftrMHJIgdOWXIxX
         Xp0neQsLstYlmec7hnJ9e2haLZwbsbm5tnGWYS1asVkIt4ueT0EMk8QHb0qD0954ekNh
         tfNlsb3kbMyO8ImDBtA3M644ENjbEpnKHYCl5WMMoXC11HNCKrZfAlR002kKo2aDGWtz
         yDAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 130si6628140ybq.293.2019.03.14.04.31.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 04:31:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:34702 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4OaG-00079O-5M
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 07:31:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57432)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1h4Oa6-00077H-LU
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 07:31:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1h4Oa6-00075O-1F
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 07:31:26 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:42892 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1h4Oa5-000714-HP; Thu, 14 Mar 2019 07:31:25 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 7A530338732DBD1044CD;
	Thu, 14 Mar 2019 19:31:17 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS405-HUB.china.huawei.com
	(10.3.19.205) with Microsoft SMTP Server id 14.3.408.0; Thu, 14 Mar 2019
	19:31:12 +0800
To: "peter.maydell@linaro.org" <peter.maydell@linaro.org>, Eric Auger
	<eric.auger@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, qemu-arm
	<qemu-arm@nongnu.org>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <93dc7574-cfef-e556-6349-f6976c4bd914@huawei.com>
Date: Thu, 14 Mar 2019 19:31:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] About Revert this patch: arm: Allow system registers for
 KVM guests to be changed by QEMU code
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h5rdhL0e+pPG

 Hi   Peter/Eric,
   I think we should fix the regression issue instead of revert this patch,  I think the reason of
   this issue is that QEMU modified some unexpected resisters, we should find out.


    Revert "arm: Allow system registers for KVM guests to be changed by QEMU code"

    This reverts commit 823e1b3818f9b10b824ddcd756983b6e2fa68730,
    which introduces a regression running EDK2 guest firmware
    under KVM:

    error: kvm run failed Function not implemented
     PC=000000013f5a6208 X00=00000000404003c4 X01=000000000000003a
    X02=0000000000000000 X03=00000000404003c4 X04=0000000000000000
    X05=0000000096000046 X06=000000013d2ef270 X07=000000013e3d1710
    X08=09010755ffaf8ba8 X09=ffaf8b9cfeeb5468 X10=feeb546409010756
    X11=09010757ffaf8b90 X12=feeb50680903068b X13=090306a1ffaf8bc0
    X14=0000000000000000 X15=0000000000000000 X16=000000013f872da0
    X17=00000000ffffa6ab X18=0000000000000000 X19=000000013f5a92d0
    X20=000000013f5a7a78 X21=000000000000003a X22=000000013f5a7ab2
    X23=000000013f5a92e8 X24=000000013f631090 X25=0000000000000010
    X26=0000000000000100 X27=000000013f89501b X28=000000013e3d14e0
    X29=000000013e3d12a0 X30=000000013f5a2518  SP=000000013b7be0b0
    PSTATE=404003c4 -Z-- EL1t

    with
    [ 3507.926571] kvm [35042]: load/store instruction decoding not implemented
    in the host dmesg.

    Revert the change for the moment until we can investigate the
    cause of the regression.

    Reported-by: Eric Auger <eric.auger@redhat.com>
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

