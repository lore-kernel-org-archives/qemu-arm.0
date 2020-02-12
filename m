Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6133116lfp;
        Wed, 12 Feb 2020 01:11:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqyaaICbp2n+qEF3+QFd3xymJifLs7f+5rIBZKKx5K30lGzZfjAP8tehtGTjAbDwjv+yL5tX
X-Received: by 2002:a05:620a:1234:: with SMTP id v20mr5850517qkj.304.1581498705576;
        Wed, 12 Feb 2020 01:11:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581498705; cv=none;
        d=google.com; s=arc-20160816;
        b=eIxIltZbo0kdIS5QOuewvKR0hBDNr+rOF85jkx4N3jfbgm/syJDmReaBBsnDBpW3Pq
         ie61l5dNfVe/f3swcaekjOkAqklmJNB9lqlOABB1Zdtcp+vKQuEt+ByFaLxC6xL8M8nh
         ZxXyYUdf4shVxau/sYiJ7srNQnWAqTQxfx1g9GctRVO/mULu/YbEooYLEKFpYelegOre
         K2cRXPGpAQTLFnyEnzCWxtApaQMwbRjW83JLno4M29lLIVgRbNzRgFaG0oBEeILAtAx8
         dbuiU698I/zkGRwMHNvqbs7Y7vg42IUlN0TUpU+nR0OVUknA8MfghwlHy8WuTjg4ogVR
         S8Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:date:message-id:from
         :references:to:subject;
        bh=5xNt60RBp+wJIOOwMMsYxo96M+H/C8MQByk35kbKu9Q=;
        b=HYwuzGNvaRkYw0ASXGIqr4uID4XPACstGpulEPY5Sl73OVSsP3yzfy++O+meOLAWy5
         qPz4k+boplDk2X5ntjAE31DpVHBLa4ZBeweB9MX1Y3xKJ5VEG4gL2IJerf6mBFsXB6Wp
         Eq5+AyvZuk7CXhfO06dZnnwV7wunAnw2ZCyRN4Yk0ExdScM08wEcVQkJ3dD9SQfGGlng
         m/0WVBHK1Ma6aqw1LUGQDAzWN2ZhAqOA0GEDgos4EK7GukrGpPSdJzOV6b7jjbIy47nN
         j+1Nz2+2c8ic5LYmkFLbYktMVKqEeM4kx7MKa1XVctFnTNn8ia7k++Nvlrcx/4Vmif2H
         aW2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d12si3056589qvj.178.2020.02.12.01.11.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2020 01:11:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1o3d-0005Iz-1B
	for alex.bennee@linaro.org; Wed, 12 Feb 2020 04:11:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44062)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <roman.kapl@sysgo.com>) id 1j1o3G-0005Ed-QO
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 04:11:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <roman.kapl@sysgo.com>) id 1j1o3F-0002Dq-S8
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 04:11:22 -0500
Received: from mail.sysgo.com ([176.9.12.79]:60320)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <roman.kapl@sysgo.com>)
 id 1j1o3C-000286-OU; Wed, 12 Feb 2020 04:11:18 -0500
Subject: Re: [PATCH] i.MX: Fix inverted register bits in wdt code.
To: Peter Maydell <peter.maydell@linaro.org>, Roman Kapl <rka@sysgo.com>
References: <20200207095409.11227-1-rka@sysgo.com>
 <CAFEAcA_vgg8mVw+-vfjWcouyOOnM_qZPdsPFmSgatV4Lq5Panw@mail.gmail.com>
From: Roman Kapl <roman.kapl@sysgo.com>
Message-ID: <0f507694-f976-7880-ced4-aaac72d85282@sysgo.com>
Date: Wed, 12 Feb 2020 10:10:45 +0100
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_vgg8mVw+-vfjWcouyOOnM_qZPdsPFmSgatV4Lq5Panw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 176.9.12.79
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kG5KWwkRf+dz

On 2/11/20 6:57 PM, Peter Maydell wrote:
> On Fri, 7 Feb 2020 at 09:55, Roman Kapl <rka@sysgo.com> wrote:
>>
>> Documentation says for WDA '0: Assert WDOG output.' and for SRS
>> '0: Assert system reset signal.'.
>>
>> Signed-off-by: Roman Kapl <rka@sysgo.com>
>> ---
>>   hw/misc/imx2_wdt.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Applied to target-arm.next, thanks.
> 
> (It looks like we're missing a lot of the watchdog
> functionality in our model, ie the actual watchdog
> timer parts, enable bits, etc etc...)

Yes, but the target restart functionality is the most important one. If 
I've read the i.MX forums correctly it is the easiest way to restart the 
board correctly.

Best regards, Roman Kapl

> 
> -- PMM
> 
