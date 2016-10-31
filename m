Received: by 10.80.166.35 with SMTP id d32csp147454edc;
        Mon, 31 Oct 2016 06:42:35 -0700 (PDT)
X-Received: by 10.55.18.145 with SMTP id 17mr22749756qks.34.1477921355490;
        Mon, 31 Oct 2016 06:42:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o76si17633986qkl.29.2016.10.31.06.42.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 31 Oct 2016 06:42:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35758 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c1CrD-0002Q4-0V
	for alex.bennee@linaro.org; Mon, 31 Oct 2016 09:42:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55832)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c1Cr5-0002Om-GX
	for qemu-arm@nongnu.org; Mon, 31 Oct 2016 09:42:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c1Cr4-0008GA-Jt
	for qemu-arm@nongnu.org; Mon, 31 Oct 2016 09:42:27 -0400
Received: from mail-ua0-x231.google.com ([2607:f8b0:400c:c08::231]:33622)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1c1Cr4-0008Fi-Ef
	for qemu-arm@nongnu.org; Mon, 31 Oct 2016 09:42:26 -0400
Received: by mail-ua0-x231.google.com with SMTP id 20so88091477uak.0
	for <qemu-arm@nongnu.org>; Mon, 31 Oct 2016 06:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HmqBM0AdpWxa9kbD8BogtC4VgRTmaFnTmOvB6TOTyFM=;
	b=GJl9yk9BUoxZmUbGGSIGqu+M7/AvYiUhg7v1RMVHUGf74Znu6i6DwK9DN3fSPG2vrn
	2mQv72CYitlR6/UdyQzLE9pFTVtAXNtN8bNgdaFQJPaenteWzLUUPNF7xIrHiGN95Izn
	C2ExZbM3Y0Z5Ga60CVlhBUH6agHcD6P5vgXto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HmqBM0AdpWxa9kbD8BogtC4VgRTmaFnTmOvB6TOTyFM=;
	b=d0kjbGYLsC7AEduYOAGq8AZBivXp2kQKzapDy96hZhSuUwUqq7T3SdKzMASAteBLSe
	VrPIQmQDP0F+y8CgBmz3V5QKlDizGW2tKY7Fp/C9tN1e7+vDF2wokWoxcJqZ2g52sSSn
	lul6GTO2FzH/QU3mP+mcYyZ3CwVVGmqVYo4xkR4QPBSPwyCw34AvebXrkz3SveIhLlCW
	PKJixx40bwV3L+IvpqIINhkFzkaJuDzakQNEpTsXcr8QuweqbtLYzTmcVrtZ7G/W0lMk
	jL7T5tiubRVpBI2qkfxC3ayO35eOZkXBkYxlPxU/cgf1YAMwI0eF3hn79XgMX7TyPAOK
	UUmA==
X-Gm-Message-State: ABUngvf+3/S6tdHO6oc/0nxKsKtaJUrbXw45w8S5x/MBHnnlg7wXG3DAUeFOZD7hBVw/B1Zv0ScZ6rZ6HwBvFRW5
X-Received: by 10.176.83.12 with SMTP id x12mr22590357uax.131.1477921345653;
	Mon, 31 Oct 2016 06:42:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Mon, 31 Oct 2016 06:42:04 -0700 (PDT)
In-Reply-To: <CAKmqyKOMveh+4Hkt6F5qS8D0qSofhBK1dsTzSDTa_Uj6GOmL1w@mail.gmail.com>
References: <1477596278-1470-1-git-send-email-ppandit@redhat.com>
	<CAKmqyKOMveh+4Hkt6F5qS8D0qSofhBK1dsTzSDTa_Uj6GOmL1w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Oct 2016 13:42:04 +0000
Message-ID: <CAFEAcA-1EG9vG6k5e-bsBQSVw_zUAJKe5RAQNMsGhzStnV9S0A@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::231
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4] char: cadence: check baud
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>,
	Qemu Developers <qemu-devel@nongnu.org>,
	P J P <ppandit@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Huawei PSIRT <psirt@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LG7TXtFMQa3v

On 28 October 2016 at 16:34, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> On Thu, Oct 27, 2016 at 12:24 PM, P J P <ppandit@redhat.com> wrote:
>> From: Prasad J Pandit <pjp@fedoraproject.org>
>>
>> The Cadence UART device emulator calculates speed by dividing the
>> baud rate by a 'baud rate generator' & 'baud rate divider' value.
>> The device specification defines these register values to be
>> non-zero and within certain limits. Add checks for these limits
>> to avoid errors like divide by zero.
>>
>> Reported-by: Huawei PSIRT <psirt@huawei.com>
>> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
>
> This looks good to me. I'll spin up a new patch for the migration fix
> next week (I won't have time today).
>
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>



Applied to target-arm.next, thanks.

-- PMM
