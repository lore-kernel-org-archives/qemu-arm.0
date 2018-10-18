Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2012272wrt;
        Thu, 18 Oct 2018 02:40:13 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61w96TUkWoa3b4w2ZQ3DEiWKlBwDFiYHTcXAJNUenenpbX3F56PR1M4/EoTthbSv8ISnsJg
X-Received: by 2002:ac8:2278:: with SMTP id p53-v6mr28679642qtp.200.1539855613504;
        Thu, 18 Oct 2018 02:40:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539855613; cv=none;
        d=google.com; s=arc-20160816;
        b=ng8C9cJ2fVcEkBvFMYQ9rJ/qv3CWlEyn8cN1m2xFzwR7QfMh+dtb6v5oHyF/Ciy0Z/
         F2/OZ/wZpij/371XWm6BQPNpPi3NJ3CUimXficgFISFpmYhleC627sSSzLR5n5GalB/h
         m4D2BxZIhNFToo5w2Q9iHwhvazxIPcv9VowCvnqgcJwhuAMCsHJwOOl5lV1uWb45v+NC
         CcZ7XhbUXwr6WXpV+7BvFM+ar54G2U6eAMjcZ6acj2PaT3JH3gaKA5is+TeZrFZOcCL/
         K75fxomCi8IBMLCXy2dULbArvmCH7Ji1Ija06YSdSknPC0JSgk3pTa0ajNDwi2gZBNYa
         lZ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:content-language
         :accept-language:in-reply-to:references:date:thread-index
         :thread-topic:to:from:message-id;
        bh=uQXLneX3hg22k6x7iaU4ThguyMxemJnlUKW4CA6S2rg=;
        b=Er/P92zgdXtVRpav5G95CAiOg0AXgvPJljiCDcv6THtW8t7iD86p5EfvsrCFX/wlGZ
         XZ59acJiqrtOsCGX/RplHEcIFV7zV8gTKmZ8xN8NLNja6tiv84E6pE5W9EzCt9YE/ku6
         0UGJn75gitZjuPHbi8GL5Y2E2lAhb4/1IIi5c408Fr1xN0mWFxEeq4s9Mj4vKH8ite+6
         UMoKrF2lg2osFCrW9SEltx6O38TMSKpwpVq28FGFWm43Ukk9wmcRfm7e+RE5C0Ol+coZ
         eRYn0L200DGtKHrd6aDkIeWhGtj3RfvbmtuDqvMOVhAF74tTBdn9Z1pnH6yIOBkrzPHF
         qzOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i16-v6si12634780qtp.400.2018.10.18.02.40.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 02:40:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Message-ID: <5bc854fd.1c69fb81.da06e.4142SMTPIN_ADDED_BROKEN@mx.google.com>
X-Google-Original-Message-ID: 9239E1F2-6FF6-4C64-9A3E-C71F0D9F5479
Received: from localhost ([::1]:41283 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gD4mr-0003e3-1E
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 05:40:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42498)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1gD4ll-0003I1-3V
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 05:39:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1gD4lk-0007zh-78
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 05:39:05 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2285 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1gD4le-0007vC-44; Thu, 18 Oct 2018 05:38:59 -0400
Received: from DGGEMA403-HUB.china.huawei.com (unknown [172.30.72.57])
	by Forcepoint Email with ESMTP id 82AFE6D6A223B;
	Thu, 18 Oct 2018 17:38:45 +0800 (CST)
Received: from DGGEMA523-MBX.china.huawei.com ([169.254.5.214]) by
	DGGEMA403-HUB.china.huawei.com ([10.3.20.44]) with mapi id
	14.03.0399.000; Thu, 18 Oct 2018 17:38:41 +0800
From: gengdongjiu <gengdongjiu@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [PATCH RFC v11 0/2] add support for VCPU event states
Thread-Index: AQHUZU/pyQ+uVrGW0k2ivbQr6T/c16UkwhND
Date: Thu, 18 Oct 2018 09:38:40 +0000
References: <1538067351-23931-1-git-send-email-gengdongjiu@huawei.com>,
	<CAFEAcA97eSpOzU_xJZLFgFBZUCW1Z8mYDMzYsdpK99S5WiPf=A@mail.gmail.com>
In-Reply-To: <CAFEAcA97eSpOzU_xJZLFgFBZUCW1Z8mYDMzYsdpK99S5WiPf=A@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 45.249.212.189
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH RFC v11 0/2] add support for VCPU event
 states
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "zhengxiang \(A\)" <zhengxiang9@huawei.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, Andrew Jones <drjones@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R8fWJW+pYec8

Hi peter,

    Thanks very much for this comments and very sorry for my late response =
due to business trave.

     Yes, the reason that tag the patchset to RFC is that it just  hasn't b=
een tested on 32-bit. if someone else can test it on 32-bit platform, it wi=
ll be great.

    I do not have 32-bit environment, so only tested it on 64-bit.


On 27 September 2018 at 17:55, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> Support KVM_GET/SET_VCPU_EVENTS to get/set the SError exception state, an=
d
> support the state migration.
>
> Now the VCPU event only includes the SError exception status, it can be
> extended if needed. When do migration, If source machine has serror pendi=
ng,
> the target machine is also needed to pend this serror regardless of wheth=
er
> target machine can support to set the serror syndrome.
>
> Note: Because I do not have arm32 environment, I only this patch in the K=
VM64,
> not test it in the KVM32. So I need someone else test it in the 32 bit KV=
M platform.
> Thanks.

Hi; could you clarify why this patchset is tagged RFC, please?
Is it just that it hasn't been tested on 32-bit ?

thanks
-- PMM
