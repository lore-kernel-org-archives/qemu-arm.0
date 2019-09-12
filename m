Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1903498wrp;
        Thu, 12 Sep 2019 02:32:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxU6irPs0fFYp71uMwvIC14LrdX5DIJBAdQ6Jk23GMoC8gyRlzyY0kkb7CvcRsonstFrQ+l
X-Received: by 2002:ae9:e510:: with SMTP id w16mr40557125qkf.268.1568280737118;
        Thu, 12 Sep 2019 02:32:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568280737; cv=none;
        d=google.com; s=arc-20160816;
        b=z2Cse6fBl5er4/VxnaKlt65Ik1YBoBOSq69mXQhq3l5rNJ6PTvK9TBUXKS3Xc04t1C
         YCZTbJVZhtyBd0Zan9y3WMtbe85vFezKCjKN+cLmqmHSGC4vOVB8Z3KTGOXVOS1iBnff
         t3CUVKJKrS0EpvPmyu/j4l6SrAMVn321AbTd5IY2pJX5lJ6HYtL3LRH9Pfg0zazThN0n
         eMJqPBiar1DB0tAhqnPU4WyflUCquWPgYiBjKqie6Y2Xe7G5jt+XCc8YrIorQdaZQcO0
         dnnVd2qmy4CIJadiZs81+ISXbblbKkPvyvc60kIDaiIASNQQkxqcBtVOobr3VZ9HytoB
         QQ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=RPI4BNMKkBHi25667EW16CiOTh1DznzeZiVJN2XjXZs=;
        b=dHqD07lnmfvTEserYh8GttzqR3EHvxlsRrzq0To6E2BPn54JQXVnACmT1a+aSTC93g
         SX2nZKCyRjWuIMdzkZWmCJIz0s69NOIwJhmasBc7KRAyfwOQXdj/Z/JhZw8iYPWwnaWU
         8RpDsY3dkPvtjUaced3Ac0JLujAMX+AYgvBdzGTdJB3nmIx+HWle2XuNgv36nx+dZxAW
         7BlgAznFQmlujtHSdHsl0IC5rbK8LjeDdh3DUVOyFWQHDT0VDaBxpJOw+ANHjlTPCO2b
         kvPmeDjxLvdMHiAOkKpio40JNuHnPtJYwVHdjJ+jLAcGPiX7OsTLtM7nNsZviqMlYXdF
         Pnug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c195si18409456qkg.354.2019.09.12.02.32.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Sep 2019 02:32:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i8LSZ-00082N-0C
	for alex.bennee@linaro.org; Thu, 12 Sep 2019 05:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44347)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i8LO7-0004FU-16
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 05:27:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i8LO5-0004dO-MZ
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 05:27:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41388)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i8LO0-0004ZL-Py; Thu, 12 Sep 2019 05:27:32 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9A9F430860BD;
 Thu, 12 Sep 2019 09:27:31 +0000 (UTC)
Received: from [10.36.116.238] (ovpn-116-238.ams2.redhat.com [10.36.116.238])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5576F60C05;
 Thu, 12 Sep 2019 09:27:29 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190911155125.11932-1-eric.auger@redhat.com>
 <20190911155125.11932-4-eric.auger@redhat.com>
 <CAFEAcA-tZJ2C8=ZH5e7tXzigPu3SGjSJbnLybZTG+hZO-7ZV0A@mail.gmail.com>
 <1b849672-31a6-3d8d-b8ea-254e737e3b80@redhat.com>
 <CAFEAcA-xrPP6=dmaee7PZHOr_Fpw-KsCGY5QKHR94wL1uKWL6A@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <7eb28173-122f-454e-ccba-bd444d7b6376@redhat.com>
Date: Thu, 12 Sep 2019 11:27:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-xrPP6=dmaee7PZHOr_Fpw-KsCGY5QKHR94wL1uKWL6A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 12 Sep 2019 09:27:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC v2 3/3] virt: Check
 KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 for smp_cpus > 256
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, Marc Zyngier <maz@kernel.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pzLnJl9iXCl5

Hi Peter,
On 9/12/19 11:00 AM, Peter Maydell wrote:
> On Thu, 12 Sep 2019 at 09:57, Auger Eric <eric.auger@redhat.com> wrote:
>>
>> Hi Peter,
>> On 9/12/19 10:42 AM, Peter Maydell wrote:
> 
>>> Is there really no place to put this check in common code?
> 
>> Not sure what you mean by common code here? Do you mean in a common code
>> for ARM machines (I don't think we have any atm) or directly in
>> kvm_init(). I did not want to pollute this latter with this ARM specific
>> fix.
> 
> I'd just rather we didn't have to have the same "if ..." check
> in every arm board that supports KVM.
> 
> If kvm_init() happens at a point where we have enough info to
> make the check, then you can put the check in kvm_arch_init(),
> which is the architecture-specific hook that kvm_init() calls.
OK Thank you for the hint. It should be OK.

Thanks!

Eric

> 
> thanks
> -- PMM
> 
