Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1480962lfc;
        Tue, 3 Dec 2019 05:09:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqw/8ZXSJODs5Pne/LT7Y1vPb5tU8aJAnXG7v9kF5P81QpvT/v14FtYC2v1rXNVrnaFtPfxm
X-Received: by 2002:a17:906:6093:: with SMTP id t19mr5930558ejj.50.1575378546580;
        Tue, 03 Dec 2019 05:09:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575378546; cv=none;
        d=google.com; s=arc-20160816;
        b=Al2mnGPVQJ/Pd6Sg1zx4waJtmvMrU6LFbEwE5bWQmtRtKt3SB/GnyCUfDjOcsQf60f
         mB/5VKlIn8VCRNP8b547BfDw4IMEmPVSIJQ0nA+E9hC73K47Slhq4g1FytjajK/F/pGf
         qDOQGwB2SB4/HLE8pqfYa2+xGdsG8SXksu/T4UV9efm18UhGqGrMn67Evx3jOGegDQbx
         fmYbJ7pKgiLwyX5xi9j3aGIV9wtJENsirdjaQvwMH3hCSMXOIeVTcNGfsOzKNE2YpOOo
         D6melSCnAAf/nvhpffcNlMS7wkrhAwjghCmC89aa1MGv9yWDwSxek1hRakEpPmJ6OiCj
         y3BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=2fFnz/Aj1Pp+kEJTzCgNJw48MFTE8Uwes9027KPoL0E=;
        b=MO1wIc8jgaCSqOB3QakrEo5OLaZu9maGzX/zdmebSkT/FJMMz6ZvCK3/U+FW5HQoJy
         q067j+6uH0bd5wBkpRoIneyuzbNqxEPS+LCJFczwx31GGhw7+ZFSeRmlnnc5iXnoIFNK
         lcY14ek64QxoGTVxuNSy8T6RxXlL9YJ7RUykAzsagL6QDW4IOejMmRjtAkdwJAwXYJ/P
         BZMfEiXNBvcayhL692/ZuEb+XjUUKskKPFZVzmOw1Gq0m7ydihcweosHht2R+i8uvx02
         sNgZyL4JRshKm0/XuQEC4Qb+jOxwJX6UM2h8w52tOPneRCeGV9eqYTt3xmFO6TFdH8tp
         5d5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Gge1iNbo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19si2226953edw.235.2019.12.03.05.09.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 05:09:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Gge1iNbo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ic7vL-0001Xs-Lc
	for alex.bennee@linaro.org; Tue, 03 Dec 2019 08:09:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57241)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1ic7oF-0006HU-BH
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 08:01:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1ic7o5-00043b-5z
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 08:01:37 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:46618
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1ic7o1-0003uz-HP
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 08:01:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575378086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=2fFnz/Aj1Pp+kEJTzCgNJw48MFTE8Uwes9027KPoL0E=;
 b=Gge1iNbo8exZzMlKDCpWL8Ffe/8h9RZes+gLGBk2+qLj19liXd5l96ApU98A7BmrK6Dnlh
 fA5LwOca5hiXTnrWCamyBAn/sVR0Gi90aZ85acbm8RuhSiaDh1iRtlCK7OgIyoPFXNmdRS
 20tixW5RENOwr1qVhSQVi5kIqhhUs7s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-nbF3ed9yMV-7zY4bN5cvjg-1; Tue, 03 Dec 2019 08:01:23 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAAF08024CC;
 Tue,  3 Dec 2019 13:01:22 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-176.ams2.redhat.com [10.36.116.176])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3267667E5D;
 Tue,  3 Dec 2019 13:01:20 +0000 (UTC)
Subject: Re: [PATCH 0/5] tests: Enable fw_cfg tests on AArch64
To: Xiang Zheng <zhengxiang9@huawei.com>, peter.maydell@linaro.org,
 lvivier@redhat.com
References: <20191203122753.19792-1-zhengxiang9@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <b5ef73c8-fa23-8efe-ef03-1d223a49bb93@redhat.com>
Date: Tue, 3 Dec 2019 14:01:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191203122753.19792-1-zhengxiang9@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: nbF3ed9yMV-7zY4bN5cvjg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: lersek@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kraxel@redhat.com, wanghaibin.wang@huawei.com, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6wh42wRxTzVh

On 03/12/2019 13.27, Xiang Zheng wrote:
> There are quite a few tests disabled on AArch64 such as fw_cfg-tests.
> This patch series fix some problems in test code and adapt it to
> virt machine.
> 
> Xiang Zheng (5):
>   tests: fw_cfg: Rename pc_fw_cfg_* to fw_cfg_*
>   tests: fw_cfg: Support read/write of fw_cfg registers on aarch64
>   tests: fw_cfg: Use virt as default machine in fw_cfg-test.c
>   hw/arm/virt: Add FW_CFG_RAM_SIZE and FW_CFG_MAX_CPUS into fw_cfg
>   tests: Enable fw_cfg test on aarch64

 Hi,

this breaks "make check-qtest-ppc64":

  TEST    check-qtest-ppc64: tests/boot-order-test
**
ERROR:tests/boot-order-test.c:40:test_a_boot_order: assertion failed
(actual == expected_boot): (0x00000000 == 0x00000063)

Please make sure that "make check" continuous to work with all other
targets, too.

 Thanks,
  Thomas

