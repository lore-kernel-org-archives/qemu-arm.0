Received: by 10.80.166.35 with SMTP id d32csp784359edc;
        Thu, 27 Oct 2016 12:04:02 -0700 (PDT)
X-Received: by 10.31.21.3 with SMTP id 3mr7866643vkv.48.1477595041936;
        Thu, 27 Oct 2016 12:04:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j34si4128056uad.114.2016.10.27.12.04.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Oct 2016 12:04:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43986 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzpy2-0007OD-Nt
	for alex.bennee@linaro.org; Thu, 27 Oct 2016 15:04:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bzpxx-0007L5-28
	for qemu-arm@nongnu.org; Thu, 27 Oct 2016 15:03:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bzpxw-0005IB-Be
	for qemu-arm@nongnu.org; Thu, 27 Oct 2016 15:03:53 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:35129)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1bzpxp-0005AW-Q5; Thu, 27 Oct 2016 15:03:45 -0400
Received: by mail-oi0-x244.google.com with SMTP id n202so6090903oig.2;
	Thu, 27 Oct 2016 12:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=7q6Nv2+UsmxgNeO4mALXuuIj8ZiljZ3gYcStNY50uUg=;
	b=ZFVUeZsCb9qb+UtWvlMGN2h1XYjSZGi7GiQ1gbM/y83LpCvy/B8LdCNingwobnW5Ny
	D8oz/yNK+3L7dsQTjwyP5X64ii7GTgkBRnMVXsyjjxI9aUqrDTlqa7a3Q81gSVErVAVx
	si7yveyTcl0M3qYJCnNNjMpxYQMPryuZEgK5oXWRPNpEZMzMrhTMp5vbbrpqA0UP36V+
	3Nl+q7qWs7bGqDk50Fv6ixRMTM2ffOp4QrfNELwyy688l/t+nHaThrascDy/tZO5s6ak
	OV0N6qINKy68O2ijRpjpuvfLaAyhqMHUdQVh1FgWO52TicNAfcXylJaRaPO4m348rV0D
	P+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=7q6Nv2+UsmxgNeO4mALXuuIj8ZiljZ3gYcStNY50uUg=;
	b=N7a+c/A/y8V5O5TkkYngZElTf0+e4lU3sr0lt3iRYzkPDgPtTbXckEjUGbobi8MNAJ
	QEE+wREqeEZevxeN1N7xPUBGr/jXBRMVRFx+uuekLYP7/vmhBLX7ZvYPBOfhmxmYmbIL
	cEe0nYB42hZnUj29FtQ0w14gy1ikgDnwP6GqIc3cxa8uR2X7oEA9MUACT6Af/tiQFPbd
	it4dKqN/2BFDw9/Zuxe5gl7UejZxShQLpDlOpjlri8tva6ywLXIaLMfMO+PhwtL6fpWx
	rEi84RD+a8k3Zqiv5e5mt032Lcmdgt95CiVzYEamXy5s5PdanX0UxomQsYnBIgMVVDQw
	sHlA==
X-Gm-Message-State: ABUngvfmRILAgQEC3ni4PfcdBtHbulP1C6HMBQcxI5iqbN8/wwMkRXcTDag4qXwly+d2sGmjoifqq6Ao5YZ4Iw==
X-Received: by 10.157.9.6 with SMTP id 6mr7167455otp.87.1477595024239; Thu, 27
	Oct 2016 12:03:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.122.34 with HTTP; Thu, 27 Oct 2016 12:03:13 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1610271201040.14744@wniryva>
References: <1477516945-9891-1-git-send-email-ppandit@redhat.com>
	<CAFEAcA_VLx0vtOJqzqdmo8RpvGa7VR6TAb+HtpbL8woTy3kENw@mail.gmail.com>
	<alpine.LFD.2.20.1610271201040.14744@wniryva>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 27 Oct 2016 12:03:13 -0700
X-Google-Sender-Auth: VA3mQRlNYdtHwkcOOgajwFjMj_4
Message-ID: <CAKmqyKPnKR5g38Y2dpXJcpooNoJJLRr_H8BMdyxh96Qg6T9Pgg@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3] char: cadence: check baud
 rate generator and divider values
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Qemu Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Huawei PSIRT <psirt@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q1N5966HWneX

On Wed, Oct 26, 2016 at 11:35 PM, P J P <ppandit@redhat.com> wrote:
> +-- On Wed, 26 Oct 2016, Peter Maydell wrote --+
> | You're relying on the register values never being
> | invalid to avoid the divide by zero, which means
> | you need to check them post-migration too.
>
> @Alistair: @Edgar:
>    Would it be possible for you to fix the migration part? I'm preparing for
> couple weeks leave from Monday 31'st, so trying to close other tasks. I'd
> really appreciate if you could take it over.

Yeah, I can take this over.

Thanks,

Alistair

>
> Thank you.
> --
> Prasad J Pandit / Red Hat Product Security Team
> 47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
>
