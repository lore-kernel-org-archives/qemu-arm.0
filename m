Received: by 10.182.158.201 with SMTP id ww9csp2558454obb;
        Tue, 15 Dec 2015 08:56:05 -0800 (PST)
X-Received: by 10.140.106.201 with SMTP id e67mr52432068qgf.80.1450198565558;
        Tue, 15 Dec 2015 08:56:05 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k6si1892595qhc.54.2015.12.15.08.56.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Dec 2015 08:56:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:38070 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a8stR-0003Ie-A9
	for alex.bennee@linaro.org; Tue, 15 Dec 2015 11:56:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a8stK-0003AC-Rq
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 11:56:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a8stK-0005wj-2K
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 11:55:58 -0500
Received: from mail-ob0-x22e.google.com ([2607:f8b0:4003:c01::22e]:35582)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a8stJ-0005wd-TP
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 11:55:57 -0500
Received: by mail-ob0-x22e.google.com with SMTP id 18so11372074obc.2
	for <qemu-arm@nongnu.org>; Tue, 15 Dec 2015 08:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=woLfu2mPFhy6GgRZJTLQmmcftWkE5C+oyQ/2HTfFab8=;
	b=MA501U0fnU8PmwWiugUST1PJTRBzZG6Boo9tlg89Ekr1JGcsNTxONIXguo3rhdnQIL
	0VvC9kCLS//tqUrqqMSgyYEp6x2QRVy60jn26IdC6DQL4EEq0vAXNxH+fFqPY5N3kIjL
	P/5vuGcWStrtHccIRjYto6CQV1pDXWa6bzcxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=woLfu2mPFhy6GgRZJTLQmmcftWkE5C+oyQ/2HTfFab8=;
	b=gkL6QfbYiEM7+bdv4WXtB0cN1jO4FvbItZVAellujiB0ojX52D2hTvNNlEoUAWKu3b
	CTDhcP1qqQCkvXLv2zYEBotIOqWh0mU42/hzB0d6hzsrMPqvbg2pjRxeQZ/FnROk+Pbz
	DHVP5IelRJfozW8rWe2sYlnLKkjg4+wyG/DIQsTPNjD4JHwzIZ1VYPWe1VGGxyOM+eTY
	vVH9rVtr2u143EoQ40KnhCgTY2PeAWdF9Rf0XQj9xvTCD2RAKvhxUP7KKfX4EEeNtWA2
	rJ6wwE3Xg/93Foo/ACh6ZiJ11neY+fB2Nwt6BqgHWMrkeqndegcv9u3DV0+hvf6sG8MW
	66yQ==
X-Gm-Message-State: ALoCoQljCbwQM/YeaStaR06YoIXxvXaMjgrFgB+dp5/u71xJZ7xklzTyJer8f21h+SrvTp1yKZuxtujKm0E5EXBfnV9viKbchoQZO61GuPVFjuvX0AV7G7s=
X-Received: by 10.182.19.131 with SMTP id f3mr32036338obe.26.1450198557432;
	Tue, 15 Dec 2015 08:55:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.52.97 with HTTP; Tue, 15 Dec 2015 08:55:37 -0800 (PST)
In-Reply-To: <1449804086-3464-3-git-send-email-zhaoshenglong@huawei.com>
References: <1449804086-3464-1-git-send-email-zhaoshenglong@huawei.com>
	<1449804086-3464-3-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Dec 2015 16:55:37 +0000
Message-ID: <CAFEAcA9whO9dgSf+yXFxzBDQrz7a7=SBQ4eWh-9_=9arD+VAFA@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::22e
Cc: G Gregory <graeme.gregory@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Igor Mammedov <imammedo@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v5 02/10] acpi: extend aml_interrupt() to
	support multiple irqs
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
X-TUID: Ji6B7aD2bwBT

On 11 December 2015 at 03:21, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> From: Igor Mammedov <imammedo@redhat.com>
>
> ASL Interrupt() macro translates to Extended Interrupt Descriptor
> which supports variable number of IRQs. It will be used for
> conversion of ASL code for pc/q35 machines that use it for
> returning several IRQs in _PSR object.
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>

Shannon, this one needs your Signed-off-by too.

thanks
-- PMM
