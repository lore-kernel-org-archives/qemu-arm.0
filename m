Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5956975wrt;
        Tue, 16 Oct 2018 07:06:21 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63OpMwgSB/KAsglIo3Pr5DMRxYmjiiJlqTg3CDv7GWpHv2yXB/Ek2zKmM1ZiwzKbRYf38+1
X-Received: by 2002:a37:14db:: with SMTP id 88-v6mr20420607qku.217.1539698781556;
        Tue, 16 Oct 2018 07:06:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539698781; cv=none;
        d=google.com; s=arc-20160816;
        b=q/ppMJ4zexhGCXeklJyoJQmUbRUCGmbrFPV3F2GYusmpzBKr0Fh41ekhSFHxj55rrx
         RV004J4ZFq5ArYjZbe0/VWG/BXYDFnmXp8i7rEWb5uLeT7SFiRKskakKCvhDQ+Rt20Me
         /uaI9iCMcihtZjm/iHv6/AkJIkIwre4MzSY0bWkNGRWGFIWA5x5rOXB8FVa0erPF6fBF
         Pp13bZvqfQ12fcEoiW2GGnL3OniYoWMbk+DQyVYBjpYz+P6RBsRp5c/6jB9+qtOYxL/Z
         4C2OHZZA6SP4eklxNl/x8l1u2HvmYIUXlP9xtOvh0COq6hUu4CDrvAySAeAuZ1dR5PM7
         KMwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=NmUNawHiWwC4vFbSgAaXGpBDripmr1Bvz0ajMdjuYjM=;
        b=KloVmCzhWopPXLhnKhvaO9NStAZRUHboOfzi+43VOmrcQakvsOdOnxeb9ElqvIXdBe
         D21lx6ULYKMhABI4xIAJY/h8vDxP7VTAvKtREo3rwYqpWMTrTeMYeu35WoBa/SwHaiWG
         74EeVEnbaaP7GdGN2zOSL7GM/cAjxJ0+0lNAWM/zVLrx92TQ3f6odetZoO/ZZvl+EQD9
         GPYYkBAhxd9hDyC4LZgjjHjNTPUSUMs50h6Ie77DAKA0r4MQ5LixskG16bZglhaVzEiH
         GAcu46mX7eJlOLYlqUzTlB/8Hfqfyp0/ld7CyvRCHSnwVGDsAvrbrCfs88RkoF6AkC2A
         3VNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d602lGnI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x4-v6si8922792qts.359.2018.10.16.07.06.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 07:06:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d602lGnI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58240 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCPzI-0006PP-UC
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 10:06:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gCPz9-0006PG-PL
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 10:06:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gCPz5-0003sQ-54
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 10:06:11 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:42698)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gCPz4-0003qc-UF
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 10:06:07 -0400
Received: by mail-ot1-x344.google.com with SMTP id c23so20851679otl.9
	for <qemu-arm@nongnu.org>; Tue, 16 Oct 2018 07:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NmUNawHiWwC4vFbSgAaXGpBDripmr1Bvz0ajMdjuYjM=;
	b=d602lGnIGBxx3aDfybUouagUuumZ+I8Z0v8GSG8whPfuWAc4kiU/QUDA2dtsfBBgZe
	Bm/bI1rWnxWUOU6qSJNjeWhdjb5k0W+Ei7GGP5i2fp8Y02jtEXRtOzinaUuguV9Yg85c
	5wrIjrFmwioybervxeoMhEqVQTzgHMzh/mrv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NmUNawHiWwC4vFbSgAaXGpBDripmr1Bvz0ajMdjuYjM=;
	b=WAxf6tkd9WDCdwwulcj56CV6C8p+7JrIOp/VjqEyc1ecnURWaNXUjsuEIl6FhsAwSs
	7tjLDaoMdZwGgF7kC2/70N3hSONjAh0EiUUUf1QOD0zjTV1Cvsvnml6WB1dJkCNU26yD
	OnucA2ZM9v/YiE0UuK79V3Qb1mEMP2t3OfFccEcwUAAdfPmlO42tKx0+Fb84nnV7h9JF
	f/+dopnW+07BwwOH7b8Fj18pV3hC9l/hwUJdzgBfoswIEmRUKbyyjrlzYooees62sKHa
	hJIgdIrkMeFL1+mPUTj2SR+LNQ8Qtfa1+ziCNm4zTni2QHxNO7tUvj/zZ22x3/8VRCr/
	4FuQ==
X-Gm-Message-State: ABuFfohV8LM989H193HLTXIqPvqdu9XacLGiynaZ7ByKQ99+C75SxC44
	P0hm1X7buOriY/mKS2Svx0QCZxBwC9CE7bkl1m2/Iw==
X-Received: by 2002:a9d:2377:: with SMTP id k52mr14267341otd.238.1539698765869;
	Tue, 16 Oct 2018 07:06:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Tue, 16 Oct 2018 07:05:45
	-0700 (PDT)
In-Reply-To: <1538067351-23931-3-git-send-email-gengdongjiu@huawei.com>
References: <1538067351-23931-1-git-send-email-gengdongjiu@huawei.com>
	<1538067351-23931-3-git-send-email-gengdongjiu@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Oct 2018 15:05:45 +0100
Message-ID: <CAFEAcA83hcHqsZRzn8+PiVCTyQT=H_uXubxZPU=0H+tycoia-g@mail.gmail.com>
To: Dongjiu Geng <gengdongjiu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH RFC v11 2/2] target/arm: Add support for VCPU
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
Cc: Zheng Xiang <zhengxiang9@huawei.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, Andrew Jones <drjones@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: amNhFJzIgdyW

On 27 September 2018 at 17:55, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> This patch extends the qemu-kvm state sync logic with support for
> KVM_GET/SET_VCPU_EVENTS, giving access to yet missing SError exception.
> And also it can support the exception state migration.
>
> The SError exception states include SError pending state and ESR value,
> the kvm_put/get_vcpu_events() will be called when set or get system
> registers. When do migration, if source machine has SError pending,
> QEMU will do this migration regardless whether the target machine supports
> to specify guest ESR value, because if target machine does not support that,
> it can also inject the SError with zero ESR value.
>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
