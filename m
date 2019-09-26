Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2269163wrp;
        Thu, 26 Sep 2019 08:18:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqycqrJ/RQY2x0N6hB95vmednL7e5OGg/fHZhPnam9mQ/SIPUPtL8h+HmfYxcjz+TLlhOuSz
X-Received: by 2002:a05:6214:1463:: with SMTP id c3mr3191121qvy.48.1569511090263;
        Thu, 26 Sep 2019 08:18:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569511090; cv=none;
        d=google.com; s=arc-20160816;
        b=QIujxXalgJtnkx62BVC4YMZxcepd7b4jd2g+lKjI3//4kBm24n+DBOd1w8ml3goCpf
         p4N30yv0/uKqEY060KRkgKHP54IeGtvwmj9FCQJaXTkiKbIH0li/konV5shUOQU0mPq5
         ovME02JS9I95krJeLCfpYzXeoDQV7x63wWFQQJNY/6PBoW03nZsifrFr7F/K9olSK1qa
         XNuY03s4vtikKeoEepiJfNVv2q+PzML3Wl5bv+aTN16mgEBuLpORrzzkWJjc87DdX1hQ
         6RWJAgwxOmI36NlQvNsqGO9DLoMv+othPoyRX+ZrUaJJ4laR76cMeMq0qa/YPGykenwI
         RvMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:mime-version:user-agent:date:message-id:subject
         :from:to:dkim-filter;
        bh=GzLQm7XSWPXo3uMyQeXlJy/T6MmunVI7PcUonFBv6JE=;
        b=w/FHhggzWQeQolRiUoJdf7+b+W0asDYVfPnisPf0eGSKcCwQU3FnHMQAk46DuUFZVu
         axwb7bzG9MqVX4t+d/jY7RAXXohjgE/fWMM78NY7YmyeVwJnZCN7HNcoeNeoxsqO3D8C
         H/JkHH62QPvJfsiDPzBWuHe6EioR/iKKu0mPOAd0A/ekP9MDMt3TMrl93nubu/L3drCh
         Pyl76Y7curzFDapXtrRNB32F9u3MZtmCVIx5HTKqqsmEAW5XjkU7JDesHzG88aAY9wfi
         Z8isvscp4MHauJ11+VYP60a25DqxDSKHcvaozUnO5mbnmsrsl2X2daynlzO3LVCctZnx
         AQjA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m11si1920825qke.167.2019.09.26.08.18.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Sep 2019 08:18:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1]:39036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iDVWy-0002j6-HX
	for alex.bennee@linaro.org; Thu, 26 Sep 2019 11:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52128)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nramas@linux.microsoft.com>) id 1iDVWJ-0002fU-5l
 for qemu-arm@nongnu.org; Thu, 26 Sep 2019 11:17:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nramas@linux.microsoft.com>) id 1iDVWH-0004KF-D2
 for qemu-arm@nongnu.org; Thu, 26 Sep 2019 11:17:26 -0400
Received: from linux.microsoft.com ([13.77.154.182]:54380)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <nramas@linux.microsoft.com>) id 1iDVWG-0004JR-VV
 for qemu-arm@nongnu.org; Thu, 26 Sep 2019 11:17:25 -0400
Received: from [10.200.157.26] (unknown [131.107.147.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id 1D9832008710;
 Thu, 26 Sep 2019 08:17:21 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1D9832008710
To: qemu-arm <qemu-arm@nongnu.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Subject: Is kexec supported in QEMU for ARM64 (qemu-system-aarch64) with
 arm-trusted-firmware, optee, and u-boot.
Message-ID: <21633062-b021-a8e7-0cc8-062f4c29dde5@linux.microsoft.com>
Date: Thu, 26 Sep 2019 08:17:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 13.77.154.182
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gJ/JYSWh0Hsf

When I execute kexec ("kexec -l <kernel>", followed by "kexec -e") I hit 
the following assert (in arm-trusted-firmware/plat/qemu/qemu_pm.c)

/*******************************************************************************
  * Platform handler called when a power domain is about to be turned
  * off. The target_state encodes the power state that each level should
  * transition to.
******************************************************************************/
void qemu_pwr_domain_off(const psci_power_state_t *target_state)
{
	assert(0);
}

Is kexec supported in ARM64 QEMU (qemu-system-aarch64) -
using arm-trusted-firmware, optee, and u-boot?

Thanks,
  -lakshmi
