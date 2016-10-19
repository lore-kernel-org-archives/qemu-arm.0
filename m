Received: by 10.80.166.35 with SMTP id d32csp298356edc;
        Wed, 19 Oct 2016 06:43:27 -0700 (PDT)
X-Received: by 10.55.159.4 with SMTP id i4mr5880354qke.317.1476884607789;
        Wed, 19 Oct 2016 06:43:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r85si24303084qkl.72.2016.10.19.06.43.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Oct 2016 06:43:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48682 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwr9T-0001OZ-89
	for alex.bennee@linaro.org; Wed, 19 Oct 2016 09:43:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bwr9P-0001OM-Jb
	for qemu-arm@nongnu.org; Wed, 19 Oct 2016 09:43:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bwr9O-0005pe-Qd
	for qemu-arm@nongnu.org; Wed, 19 Oct 2016 09:43:23 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:35963)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1bwr9O-0005pU-LG; Wed, 19 Oct 2016 09:43:22 -0400
Received: by mail-oi0-x242.google.com with SMTP id e12so1587885oib.3;
	Wed, 19 Oct 2016 06:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=Uz2cgPpmdD08PH88L4s3rReFl6V0BAwBmEc+4hDch1w=;
	b=UVjiYtE8InWTDkFmlYblXKqVthRTvzevBII5duVuQGAQ264DmwxFvB5m2NlBtfpFgr
	TDRpefGx5nFXuXtkZeM5CCPAuWJQXv5eJAPkEyxb8MCMzsm1cK/M0gg98kcI6CryLGJd
	t5705p8IlbIHMjdkOuOV3h57SLrUM1yTD6SInNhbsrfxZOCi0C/cbGHINO7gyjuwSF1e
	P0eZjiiiC73ZSR6B4m/TlOzKq9MjYu2vDjsch4JGyZVqKjOa8oXxx+vBvECB1FgBOVq0
	sZFDca9wRNRpoMYjZlLtEVyv2SIP3mRE7wc9XmmQ4IQ7GuBGqNuS2ARO0JaZOcr4cSfJ
	1dMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=Uz2cgPpmdD08PH88L4s3rReFl6V0BAwBmEc+4hDch1w=;
	b=E3X1xGupHPNzK5noZUvZEad6STeeOG3D+VCcj093QKIxw9G7z7Jj5tU0vu+OdGz9RF
	0izg3QjspriCZhm/JFdl9a/TcMUoXyIQSnticeIjoP+UbGHiZ4ZXXx9zQPmwHgv70ugF
	rvdqGw51V+bALdglg3Ax/CzpqxT7suDeAoTJtb9d2U8ZRR0XqlKb5DicVX9lzv7T+M7c
	klexeRKdG71r0e9gYub1FWosB2fCJRsL7tGrL97pwIDss00wUrFTnqH9RFrwqchKae3I
	Qh7n87OnpEzkFoJCEROldWxeIXC2pYpfCmRFWLdcogHYkwWRRJWzCVe1W9tHcHcP2J7F
	8Ulw==
X-Gm-Message-State: AA6/9RkWq0EgCiZ6n2mioQr6L6rBWKFPaInAKOO8AJM7Pb1WPPYHjQjQrn/H2V1tLtrn3vZRG1KKuswczMMjzg==
X-Received: by 10.202.84.213 with SMTP id i204mr4650529oib.100.1476884601533; 
	Wed, 19 Oct 2016 06:43:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.78.198 with HTTP; Wed, 19 Oct 2016 06:42:51 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1610191539170.12629@wniryva>
References: <1476784025-27293-1-git-send-email-ppandit@redhat.com>
	<CAFEAcA8hkSJa5rVpNrL1D7w_U-1EKSf-t2G5jKzxceXL2rqRdg@mail.gmail.com>
	<alpine.LFD.2.20.1610182307550.1547@wniryva>
	<CAKmqyKOMrcTAta-rHj-yFbdpPpT_wtpO-YWAqK=AVCuUuJTT4A@mail.gmail.com>
	<alpine.LFD.2.20.1610191539170.12629@wniryva>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 19 Oct 2016 15:42:51 +0200
X-Google-Sender-Auth: mP9O1aIagBM8HEvRb0sLSLJVMBA
Message-ID: <CAKmqyKMLvYDTvofMF=5k2sYNKPS+HtWYvz6RCdsd4AQG97H6nQ@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] char: cadence: check divider
 against baud rate
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	Huawei PSIRT <psirt@huawei.com>, Qemu Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k367nfM1q9wE

On Wed, Oct 19, 2016 at 12:11 PM, P J P <ppandit@redhat.com> wrote:
>   Hello Alistair,
>
> +-- On Wed, 19 Oct 2016, Alistair Francis wrote --+
> | Generally these types of IP just say 'undefined' in invalid situations
> | like this. If that is the case we shouldn't return but just set some
> | default value and allow the other functions in the setup to continue
> | on.
>
>   Could you please point me to its data sheet? I went through quite a few that
> I came across, but none was helpful.

I don't think the Cadence datasheets are public. If you can't find it
from a simple Google search I don't think you have access.

Thanks,

Alistair

>
> Thank you.
> --
> Prasad J Pandit / Red Hat Product Security Team
> 47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
>
