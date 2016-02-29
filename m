Received: by 10.25.208.211 with SMTP id h202csp1182391lfg;
        Mon, 29 Feb 2016 08:25:43 -0800 (PST)
X-Received: by 10.140.135.84 with SMTP id 81mr21918674qhh.26.1456763143270;
        Mon, 29 Feb 2016 08:25:43 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k93si26492737qgf.62.2016.02.29.08.25.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Feb 2016 08:25:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:37570 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aaQdi-0000aP-NJ
	for alex.bennee@linaro.org; Mon, 29 Feb 2016 11:25:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aaQdf-0000Zq-Om
	for qemu-arm@nongnu.org; Mon, 29 Feb 2016 11:25:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aaQde-0004dN-F7
	for qemu-arm@nongnu.org; Mon, 29 Feb 2016 11:25:39 -0500
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:35010)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aaQdd-0004dE-VD
	for qemu-arm@nongnu.org; Mon, 29 Feb 2016 11:25:38 -0500
Received: by mail-vk0-x229.google.com with SMTP id e6so138844676vkh.2
	for <qemu-arm@nongnu.org>; Mon, 29 Feb 2016 08:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0PmaoiW1eXnnLqaUTZ+uOwJHRC8a157cbKUl57W/fdU=;
	b=WBAWlAmx98h6HbRER9l6heyjTGPyVdxPKh7RHzesZ2qdiA3TI+O+54mg7w5dXTQOIJ
	ycHdiSmn57+Vy/0aWVjDjwSvte7eoCGAjSrDzf9K4jTCme5KSsK38xVKaWRe4UYmhPDp
	lTv/TFR1nzWkdq8f9dTlGDqoauZE+WA3s0BWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0PmaoiW1eXnnLqaUTZ+uOwJHRC8a157cbKUl57W/fdU=;
	b=YPVv8b+Zw3n0ybOTJVEaNTcClt9r1qAhR5V9Ln7REvHQz3Vv330L+xGtqkKP4M6B5j
	1U8oNYKeXQcF5D6yTUPLqQfbngptVIMJcAh5R4CZ4xh78EV1ti5dNrh/CWLfp9L+ckFw
	LaO9beTYIjbsFCrpfC3YGvUH1zIMTX169ct0uFtfH4aw7TvzjcpmQe69Zan9D+ENFUuu
	0OTVGRfgWp8YHAbFoX/PuDXi+X7/PM7OUKpvbJqx4NOTTzrhpstHPPCsJ5NInAFPjDvj
	VGkIo8OgHo5hIDG3FICxedcuwTRXvXtRIWNL31z8d83tteS4MXPHcfpYcWIdfJuseGUQ
	jX+Q==
X-Gm-Message-State: AD7BkJICpbR7cwQnP+ENyL2LZWQ1Kn5/M5WXBhgAH4kdz9YFt/N6JLnXHhOGm38AqZKGgxhxV8AxYk68Ctv9cbGu
X-Received: by 10.31.131.199 with SMTP id f190mr12212905vkd.90.1456763137433; 
	Mon, 29 Feb 2016 08:25:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Mon, 29 Feb 2016 08:25:17 -0800 (PST)
In-Reply-To: <56D470B9.3090609@gmail.com>
References: <1456762734-23939-1-git-send-email-peter.maydell@linaro.org>
	<56D470B9.3090609@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Feb 2016 16:25:17 +0000
Message-ID: <CAFEAcA9pPUKi1q7rvKi=iixKwX_-gcB=DfawMybQsono73tJdw@mail.gmail.com>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH] target-arm: Implement MRS (banked) and MSR
	(banked) instructions
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
X-TUID: 5X9aPJ8IadEe

On 29 February 2016 at 16:24, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
> On 29.02.2016 19:18, Peter Maydell wrote:
>> Starting with the ARMv7 Virtualization Extensions, the A32 and T32
>> instruction sets provide instructions "MSR (banked)" and "MRS
>> (banked)" which can be used to access registers for a mode other
>> than the current one:
>>  * R<m>_<mode>
>>  * ELR_hyp
>>  * SPSR_<mode>
>>
>> Implement the missing instructions.
>
> Likely, there is no disassembling support in QEMU for these instructions
> as well. Are you going to add it?

No, I don't plan to.

thanks
-- PMM
