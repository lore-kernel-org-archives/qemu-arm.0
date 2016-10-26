Received: by 10.80.166.35 with SMTP id d32csp220723edc;
        Wed, 26 Oct 2016 11:53:57 -0700 (PDT)
X-Received: by 10.55.155.7 with SMTP id d7mr3228137qke.81.1477508037518;
        Wed, 26 Oct 2016 11:53:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 138si2001288qkl.88.2016.10.26.11.53.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Oct 2016 11:53:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36890 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzTKn-0001t7-40
	for alex.bennee@linaro.org; Wed, 26 Oct 2016 14:53:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bzTJs-0001Iy-5u
	for qemu-arm@nongnu.org; Wed, 26 Oct 2016 14:53:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bzTJp-0005gr-1I
	for qemu-arm@nongnu.org; Wed, 26 Oct 2016 14:53:00 -0400
Received: from mail-oi0-f46.google.com ([209.85.218.46]:35710)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1bzTJo-0005gV-RF; Wed, 26 Oct 2016 14:52:56 -0400
Received: by mail-oi0-f46.google.com with SMTP id i127so5449569oia.2;
	Wed, 26 Oct 2016 11:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=3zXQIvH9VX9XZ6Th9f2KTzDcbCsybHdT7I5dwN9AzVY=;
	b=JkacbVeSBQaN6R+Vz1cW0GEFYsUkvBS7pUTg73jAh1gIpRAM8ihN6tktY332VYrhak
	MHKcediz7PBUDUz3ElnkCv9wp3UfbpTOpt2QxNWwyOv4fzpfdxMLI7iLeyX2GrT2K9Sv
	H080oO9ITgAlCVZ3nrh66QxEPazdpCNRi0xhPbrw05QuL/81V1WgqELRyGWARzv0wj82
	x8WLqsRmE6QOguAJNH9xx7sDE1GIyr9pJK68pZ78bTJXv+bfYA8hwImy9DTKudKyg+L8
	5LKN0NIhNdMGV75Nk6cwj/dvH6ffvCFwSZqPQaa6VnSXut4wSPqrzUeVE1Te3ERcV0fV
	Klow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=3zXQIvH9VX9XZ6Th9f2KTzDcbCsybHdT7I5dwN9AzVY=;
	b=Au6W014UuvfMBJIyfsFEBDpkBQN6j/fVyN98uHnvOKvemsBsV5Oc7otFQKtUDhml3S
	dooAZObzGIpBY021jgPrYSdU5JOW0FKdx7J6QC2xUGFOwpJW9QmFRRUpMxvIquyU5huS
	jJmyS+fLrxFFHFE2/aQX+H+I/rHpOH0m78d9KhUGOqdKvRIQk72H1gWtOYtIrEP3hHhZ
	swWotrbxTo5IYzqDHExe91HOZtFTLVu984WK1pNU6J/Gh+cFNX6TzmhIxERHMlPC0ahR
	uDQOS+iTXPQdp3N89EBN/Jn+mC+Sbw1oMD/QL5825ZHrrDRMcTFRgyF+q4LkfyAbwaBq
	ep9w==
X-Gm-Message-State: ABUngveeq3ibddehPbhcYGNFoWLb51QXbtlPKla+lgCvIH5jUIVxCPhBUwg3kT2jBM4g9PhgbBIxe1aTi/3xVA==
X-Received: by 10.202.104.214 with SMTP id o83mr3050720oik.100.1477507914672; 
	Wed, 26 Oct 2016 11:51:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.122.34 with HTTP; Wed, 26 Oct 2016 11:51:24 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1610261210330.21732@wniryva>
References: <1477315364-15134-1-git-send-email-ppandit@redhat.com>
	<CAKmqyKOXQhAh+5pK4XbvkJ664fAzRXqBGYfq61u7RV2kjOU6QQ@mail.gmail.com>
	<alpine.LFD.2.20.1610252318530.15276@wniryva>
	<CAKmqyKOHh2q-qMGvL3SxesD5Tx3yiWXddf390M8mwu7+2ZK8jQ@mail.gmail.com>
	<alpine.LFD.2.20.1610261210330.21732@wniryva>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 26 Oct 2016 11:51:24 -0700
X-Google-Sender-Auth: rKycQBHRIBa61s03MmaAbXRSoB0
Message-ID: <CAKmqyKOeT3eEOkjdnxN-fd_Ubnn+kjD_cr2eT-+LxHPKQg8SdA@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.218.46
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] char: cadence: check baud
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
	Qemu Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Huawei PSIRT <psirt@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UHmEyXJsinQD

On Tue, Oct 25, 2016 at 11:50 PM, P J P <ppandit@redhat.com> wrote:
> +-- On Tue, 25 Oct 2016, Alistair Francis wrote --+
> | I think your email crossed with Peter. Have a look at what he said.
> | That should clarify everything.
>
>   I saw, I'll mask values with 0xFFFF and 0xFF; But it's not clear if ignoring
> values 0 - 3, means leaving registers uninitialised and adding checks at each
> usage point to ensure their value is valid. If so, do we return from
> uart_parameters_setup(), when either value is invalid ? Earlier you'd
> suggested using default values
>
>   -> https://lists.gnu.org/archive/html/qemu-devel/2016-10/msg04397.html

From what I can tell I would say that any writes to the divider
register that have a value lower then 3 are ignored and the register
isn't updated.

That way we will always have a valid value as the register is reset to 0xF.

Thanks,

Alistair

>
> Thank you.
> --
> Prasad J Pandit / Red Hat Product Security Team
> 47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
>
