Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3747306wrg;
        Tue, 18 Jun 2019 06:45:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw77w+Ru1XNq+BamUOCuEUxtbFqkGzHkF1nF4rZphWsw/gxJHsMY4Yb7GgXh/VYeWlDsf2Q
X-Received: by 2002:ac8:2d19:: with SMTP id n25mr61950656qta.180.1560865506249;
        Tue, 18 Jun 2019 06:45:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560865506; cv=none;
        d=google.com; s=arc-20160816;
        b=d66SnyXQJZy5AOlbfcTVIggg/+PSB5os0ifs2d8s1htZPc09o/JTe7pYiVMn4GtgUL
         acXeq22+VrwFRW4eO46dW8F+In2jUPjxSI/+HcXCH0t31X+t2Jx7qqeIaS5p0+3MQeBq
         LDLpund6x8hbEupD8yQHc4uTSDZbZvPI5hdGpyrKw2QkYsHadget1EOnTxfnIgpXEf9f
         SWcW/W+GaEW7Cr1cRAof1qxJ926SJs0NgKC3ic59xhTYZm5nXJGmewAUOjBB5IVkDoOv
         luMs//HwOKHwYzovqPsMBUKBXLMDcNck4q018gGf885HYxKZUUH4XelVr2zjFk2rEUYU
         Ut6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=1Xfb27tsU7ewHiJiG16QFhMV0ppcl5A35wmICKyamPg=;
        b=v7rAWJBIVyiur/gLhgOod6r4JKxIAm1P7j+xg+Ltqntt/H3Np5Bm0CNK4yI3xwtD6f
         a0Bn4WIGDwPEJ1q4V89gA+gduZDku8ZADkSBis4jVEHMbWCS/urSzONEc9rfSNQC1aoO
         Kyu+5JXhmSrQTSUIC1gu4+QMxSIsHuWl2Io2OuotL1GjPXE/hiPPhg8VdavoreU6SLJS
         450T4eliBEF1VsrN8qASlzRzQmIceGz1SGgXRAj7fNVhPokf7nJ6hxo96wgR9XtX+N0V
         VBtS3z5RcoiYfdGozMN6wuxrPc/XbOXU/th9blL8WSTy+bMIjjSA7XdnnwsrTLPJSU/I
         yO/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k129si10301369qkc.35.2019.06.18.06.45.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 06:45:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58172 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdEQ5-0003xZ-NX
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 09:45:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53690)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hdEPw-0003vF-D2
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 09:44:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hdEPu-0002a6-Gj
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 09:44:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55218)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hdEPs-0002XI-Kk; Tue, 18 Jun 2019 09:44:54 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 53D223082A9C;
 Tue, 18 Jun 2019 13:44:40 +0000 (UTC)
Received: from [10.36.117.84] (ovpn-117-84.ams2.redhat.com [10.36.117.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70768608C2;
 Tue, 18 Jun 2019 13:44:35 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190522162252.28568-1-shameerali.kolothum.thodi@huawei.com>
 <653a6b3c-ac1a-f197-1240-a28f59890fa8@redhat.com>
 <CAFEAcA9g=9u1Cj+1gqWqXWfg1phmZPw4=y7Ks_EzbYOEBW-WOA@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <2c08ff88-7e94-6f24-33f1-173957cee2ba@redhat.com>
Date: Tue, 18 Jun 2019 15:44:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9g=9u1Cj+1gqWqXWfg1phmZPw4=y7Ks_EzbYOEBW-WOA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 18 Jun 2019 13:44:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v5 0/8] ARM virt: ACPI memory hotplug support
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
Cc: Samuel Ortiz <sameo@linux.intel.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Linuxarm <linuxarm@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Xu Wei <xuwei5@hisilicon.com>,
 Igor Mammedov <imammedo@redhat.com>, sebastien.boeuf@intel.com,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MXfq0XeQbYD+

Hi Peter,
On 6/18/19 2:57 PM, Peter Maydell wrote:
> I'm not sure we should carry across Tested-by tags like that: any
> respin might accidentally introduce bugs that make it stop working...

OK. No problem. I will test the next version then.

Thanks

Eric
