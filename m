Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp835634wrt;
        Wed, 26 Sep 2018 08:53:54 -0700 (PDT)
X-Google-Smtp-Source: ACcGV628WJfdwOAZSzZ+UBbPnkD9BJeJIBSBm56Iz5Ma2Y2/QE21pqcZG9tsQiME6DxXvUHyGwF6
X-Received: by 2002:a0c:ca06:: with SMTP id c6-v6mr4818744qvk.64.1537977234694;
        Wed, 26 Sep 2018 08:53:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537977234; cv=none;
        d=google.com; s=arc-20160816;
        b=N6LP4PJORyuvDLTx2yvuGUmKrqVkEWWaz78kWEk6T9QQitfLD/6CnTIi8FA1o9NJY/
         RSv7CZMy691N7kzYJobZPrRZrJ6VeEsFbFm3ijp4cUQuin04/CdiTnTU4QCKAUv5Ny6u
         bHUbV1NkCshaVlrrqSNypL1Uv8Hq2lXOQYhomIOIl+lHhtFjAcY6aSWanxAM4WZoR1uF
         6IfOIZ5uJVL0Im4fg+PDqW6q7/I37zhSNWgxZCowKndqLncke2Gfq/6eHPa9Z/1LPAyg
         HvKRU4WyaBSwVybJXDI8sVgLq5Kmo0d8R0VZB56xXJ3Cfh+FnfOsOYo2JHs0ByoV85QF
         bZfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :message-id:date:thread-index:thread-topic:to:from;
        bh=BBLyzwsX5wBvRbb2G3FE/JShfz46l2xmui5UR5/4Ao8=;
        b=F9I23uN0e58GHZK3RsoBqZ+u2xPQtDQqJxVREVcAbT5ygb3Kjmsnt9t0G9g5mpjBU5
         Jode/k//0tT36Z0eTRY/rbriEwBmy0ibzXJjF6274QAIbgHx84zCgp/TOOJgS5hP/4WW
         4vUu5A15pnqPIVLaZgWcF1MT6jF8/LQQMBqMevIMl+9pWhvNtZedgw+2y9DT643mQ4H+
         7EZSfTi1dxiBlw2sUNMgUi8XJ+5oJ+C6xxgW+p+UMVQSP3ySeQsIvElbO2pYX2qnHFAU
         4BsJulrDjHPTry8CrwO9lt+fdlxrT656RqAQwdS8GK3S/TSNZj3C/4UlfRl7TT7vfqKY
         5zfg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f15-v6si4025242qth.269.2018.09.26.08.53.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Sep 2018 08:53:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59444 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g5C8Q-0003aL-9M
	for alex.bennee@linaro.org; Wed, 26 Sep 2018 11:53:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59007)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1g5C8H-0003Zy-TI
	for qemu-arm@nongnu.org; Wed, 26 Sep 2018 11:53:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1g5C8C-0000LL-Sj
	for qemu-arm@nongnu.org; Wed, 26 Sep 2018 11:53:45 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2340 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1g5C8C-0000JS-BX; Wed, 26 Sep 2018 11:53:40 -0400
Received: from DGGEMA406-HUB.china.huawei.com (unknown [172.30.72.56])
	by Forcepoint Email with ESMTP id 689225FD55E86;
	Wed, 26 Sep 2018 23:53:33 +0800 (CST)
Received: from DGGEMA423-HUB.china.huawei.com (10.1.198.156) by
	DGGEMA406-HUB.china.huawei.com (10.3.20.47) with Microsoft SMTP Server
	(TLS) id 14.3.399.0; Wed, 26 Sep 2018 23:53:34 +0800
Received: from DGGEMA523-MBX.china.huawei.com ([169.254.5.64]) by
	dggema423-hub.china.huawei.com ([10.1.198.156]) with mapi id
	14.03.0399.000; Wed, 26 Sep 2018 23:53:31 +0800
From: gengdongjiu <gengdongjiu@huawei.com>
To: Andrew Jones <drjones@redhat.com>
Thread-Topic: [PATCH v10 2/2] target/arm: Add support for VCPU event states
Thread-Index: AdRVsPXK1rydJzRdQE6qsvAk5dztMw==
Date: Wed, 26 Sep 2018 15:53:32 +0000
Message-ID: <0184EA26B2509940AA629AE1405DD7F201E96C46@dggema523-mbx.china.huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.45.52.120]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.188
Subject: Re: [Qemu-arm] [PATCH v10 2/2] target/arm: Add support for VCPU
 event states
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WrB6Xivvb5zI

...
> >  };
> > --
> > 2.7.4
> >
>=20
> Why aren't kvm_get_vcpu_events() and kvm_put_vcpu_events() in
> target/arm/kvm.c, as I suggested in my last review? There's
> no need to duplicate them for kvm32.c and kvm64.c, afaict.

I misunderstand your previous mail meanings. Sorry for the mistake,
I will put kvm_get/set_vcpu_events() to target/arm/kvm.c to avoid the dupli=
cation.
Thanks again for your pointing out and review.=20

>=20
> Thanks,
> drew
