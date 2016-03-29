Received: by 10.25.208.211 with SMTP id h202csp2228003lfg;
        Tue, 29 Mar 2016 12:02:01 -0700 (PDT)
X-Received: by 10.140.22.101 with SMTP id 92mr4894401qgm.64.1459278121770;
        Tue, 29 Mar 2016 12:02:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a40si115612qgf.66.2016.03.29.12.02.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Mar 2016 12:02:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49328 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1akytt-0005Om-9r
	for alex.bennee@linaro.org; Tue, 29 Mar 2016 15:02:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37827)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1akytq-0005LY-KH
	for qemu-arm@nongnu.org; Tue, 29 Mar 2016 15:01:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1akytl-0003Wk-4I
	for qemu-arm@nongnu.org; Tue, 29 Mar 2016 15:01:58 -0400
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:36751)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1akytl-0003WW-0h
	for qemu-arm@nongnu.org; Tue, 29 Mar 2016 15:01:53 -0400
Received: by mail-vk0-x236.google.com with SMTP id z68so31848403vkg.3
	for <qemu-arm@nongnu.org>; Tue, 29 Mar 2016 12:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dB92e2XQR3H57lE/ptjL1X8IVKtjiJQku57TYAx3Tjo=;
	b=io0ozyQPbftW5wkKTYqolJa9NtWDLedi3DxY0cMkOFqQlV2zkpXQgLQeZM4TxAyiFi
	z7NR+01KRWoyoW6t1fIfyD9j5nrN5HcAuII9+rigrt1aWRK9fIv+iM+VSlXhsvHHTiQr
	xGMmOILgN5RcJ+CqqRqEnGSx1IvOMwDVvlWuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dB92e2XQR3H57lE/ptjL1X8IVKtjiJQku57TYAx3Tjo=;
	b=RztdaGJrnjTItf+9OyIUXsN76w+i1FDgcKzflFugeYTlRzuQJ9ZhdDqfCScMy1T+CB
	JobBC8agdXCCW550aMaa1O1pk1N/DSUlq678S9Q2e9RNeCTHUmq51+NrxQud2TlUEbjt
	NmoImgjPzPMrxuILnHP/EbSBdkabL+ECB6IS6/OpPZceF+ru4YIklboY07PCRNmGQ1F3
	tbNlJjPNxhQ80Ewu/Oc09jacdZyP03DAD5yqr/VmWMJgq4lvy7CPB0DFWvKCjA978Cdt
	nhhdgG96QcBJOY+45+QvmWhNVxQWs643GMOZWCyB25XiNUjnviZHthwb5tI1Ms3UMcxz
	ND4g==
X-Gm-Message-State: AD7BkJI6QgQVAJs/9xzih/8f871ECO5cvQdHVPq3vHVkYud5zNYPdvCP900W4Ifd11A+aOemLYXPxSyGkZRNj3kc
X-Received: by 10.31.8.17 with SMTP id 17mr2271364vki.139.1459278112547; Tue,
	29 Mar 2016 12:01:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Tue, 29 Mar 2016 12:01:33 -0700 (PDT)
In-Reply-To: <1458899181-17896-1-git-send-email-zhaoshenglong@huawei.com>
References: <1458899181-17896-1-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Mar 2016 20:01:33 +0100
Message-ID: <CAFEAcA-Z2PF+D2=Af6238b94xEz2v3Pjt_a=BQ0Viv_V3OUt2Q@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Cc: "Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Subject: Re: [Qemu-arm] [PATCH 0/3] Add guest PMU in machine virt
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VU2bTVPnzXmX

On 25 March 2016 at 09:46, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
>
> KVM-ARM64 supports guest PMU now. This series add the support in machine
> virt so that guest could use PMU.
>
> Shannon Zhao (3):
>   target-arm: kvm64: set guest PMUv3 feature bit if supported
>   hw/arm/virt: Add PMU node for virt machine
>   hw/arm/virt-acpi-build: Add PMU IRQ number in ACPI table

Given the timing, I'm not planning to put this into 2.6.
(It is still on my review queue for 2.7.)

thanks
-- PMM
