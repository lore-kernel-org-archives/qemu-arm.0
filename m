Received: by 10.25.208.211 with SMTP id h202csp1181927lfg;
        Mon, 29 Feb 2016 08:24:41 -0800 (PST)
X-Received: by 10.55.71.143 with SMTP id u137mr20361016qka.1.1456763081471;
        Mon, 29 Feb 2016 08:24:41 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o31si16010426qko.59.2016.02.29.08.24.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Feb 2016 08:24:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37556 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aaQci-0007t7-RP
	for alex.bennee@linaro.org; Mon, 29 Feb 2016 11:24:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49058)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aaQcb-0007sm-R6
	for qemu-arm@nongnu.org; Mon, 29 Feb 2016 11:24:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aaQcY-0004IX-IF
	for qemu-arm@nongnu.org; Mon, 29 Feb 2016 11:24:33 -0500
Received: from mail-lf0-x22e.google.com ([2a00:1450:4010:c07::22e]:35201)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aaQcY-0004Hn-6Y; Mon, 29 Feb 2016 11:24:30 -0500
Received: by mail-lf0-x22e.google.com with SMTP id j186so20581603lfg.2;
	Mon, 29 Feb 2016 08:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=vumYmAEH9uCnaxvbkxM1W+eqvnFHKM+32iJLMf0IlQE=;
	b=qvAAYWL9My453UDd8hLLyidGOL+RjrSAi1Xrj6FX/TRRPitv7f1oySnw7Zmpi1K9vr
	htCa6mdAy4GRxMv4YGSaGqoZrn4Tidb0DrUGmVHG6Uoa6gKJA59c9NtUw3g+Izn8f79F
	glq+V5uUib2mRmbh85T1ui6ZhS+Mrv8OeGj1Dw20eIp9+WXD2gVQU7oBqger4ugxYH7T
	9FFA+0o0fuoq2Z31+BuiklkAc4MdUGrvTd9/JiSRkOx5lDddOzrwmxkoqnBdV6tzAdCm
	uuOYHeJuc7P3oVFkfwQaY8Q53/F45TYSHf9xIzBwkmiUkWiicBCVgEfxom1hpePG5fAu
	JW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=vumYmAEH9uCnaxvbkxM1W+eqvnFHKM+32iJLMf0IlQE=;
	b=GX4jxCj0M2e65mRdl8dpCcnWIRz5YYcoGqrP3M0Pw4hhmMH3trg/xiiH5hZJwHy22H
	ilztAdG20cgbWWmb1I+cfO/WrCCsOvqPNC8HF3x1DX1/FaH+l9HrtgRAlhlf//9XQJFx
	4ZZ/rQXZe4VdA4UewfqDAUNLYwR6PT6Owtxkp4LpxJEl8HB0VsHLzAH+vNnWzN3ZMeWa
	+QYVaLr0cCqbrWWfao7U4Lk+OPoaFyD6A1vbztixYa5Chy8KEYXJNTFaxSs2OwyGGREV
	Q991RDzpYdWIRiIQpaBHWOBGHcvKFDnnj8tSQkIHDw3gMIkw1jiMep0ileanCm9SnZEs
	VN9g==
X-Gm-Message-State: AD7BkJIlGqji/fnft2VVvj34k+rTcnHq8pEFJkxPRUG96jSARClZ/LhxSIk4KL8yoRCSxw==
X-Received: by 10.25.205.201 with SMTP id d192mr5919024lfg.76.1456763068576;
	Mon, 29 Feb 2016 08:24:28 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	y184sm4183762lfd.16.2016.02.29.08.24.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Feb 2016 08:24:27 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1456762734-23939-1-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56D470B9.3090609@gmail.com>
Date: Mon, 29 Feb 2016 19:24:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1456762734-23939-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::22e
Cc: qemu-arm@nongnu.org
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
X-TUID: PPrpRXBkfz0A

On 29.02.2016 19:18, Peter Maydell wrote:
> Starting with the ARMv7 Virtualization Extensions, the A32 and T32
> instruction sets provide instructions "MSR (banked)" and "MRS
> (banked)" which can be used to access registers for a mode other
> than the current one:
>  * R<m>_<mode>
>  * ELR_hyp
>  * SPSR_<mode>
>
> Implement the missing instructions.

Likely, there is no disassembling support in QEMU for these instructions
as well. Are you going to add it?

Best regards,
Sergey

>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> We don't support EL2 yet, but you can get at these on a v8 CPU in
> 32-bit EL1 if EL3 is enabled. Obviously there's not going to be much
> 32-bit EL1 code out there that uses the insns though, as it wouldn't
> work on v7 if it did...

