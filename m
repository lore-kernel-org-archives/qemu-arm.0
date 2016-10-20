Received: by 10.80.166.35 with SMTP id d32csp947715edc;
        Thu, 20 Oct 2016 10:22:04 -0700 (PDT)
X-Received: by 10.37.68.193 with SMTP id r184mr3130286yba.198.1476984124644;
        Thu, 20 Oct 2016 10:22:04 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j2si6828770ywf.239.2016.10.20.10.22.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 20 Oct 2016 10:22:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56257 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bxH2a-0006yW-0i
	for alex.bennee@linaro.org; Thu, 20 Oct 2016 13:22:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37376)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1bxH2S-0006rJ-U7
	for qemu-arm@nongnu.org; Thu, 20 Oct 2016 13:21:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1bxH2P-0001XW-Nz
	for qemu-arm@nongnu.org; Thu, 20 Oct 2016 13:21:56 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:35366)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1bxH2P-0001TX-BM; Thu, 20 Oct 2016 13:21:53 -0400
Received: by mail-lf0-x242.google.com with SMTP id x79so1133420lff.2;
	Thu, 20 Oct 2016 10:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ezCeXFsgtNR/NzlHln6ZXEAb8bMcxkrAbEi7l5bhnPI=;
	b=siG+QDJQWoMjhpRIkpH0rNhzIW1xqauyx358KLQavKGYg81GhvDD8Y42qA0ey5fXo/
	JJqnMext3Gsf+kaueFW2WnzD34cT5sAg3Qja+6HbseO/hnoPJpEkIz1ml8ah/rWupOxi
	nO9jwzWtXTtyHv0TH+qatILfH7eVdCzrBIp4W2frw126QfuFUXbOBB2AsQxz1FmEDXaA
	26nRx2HYQw/+Iiyo/aIxcnLhlKQL9cWzOs9B2PH57Pv5pHL2TxPq79G4TfgRQ9XmwWnf
	3JHnb1bbBWEsH0krAm/SZ4NIw6cRrfqGRf7kNJ9AwmDjxDQQiq55G7v48a/WjC4FptHW
	80Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ezCeXFsgtNR/NzlHln6ZXEAb8bMcxkrAbEi7l5bhnPI=;
	b=AbYk5MGq64PoUo1ON0vvaAqWSlMaD01Zk7C98I+hQS1xrxWfzmtdCEQ/E44gtbGkun
	IyF+hD/0joJWDhLtYuJa2JmP5I1wbI8wu4ZKUoIFTgVc5b2dV7qyFtfvyR/R8PsWJiZn
	xpTI5MiIRE0kpVfkiR9kAaxR8vnjoMCSQnKAcnQ1wRSC/Dq8PXfLGS6rjytOSDJn5Dei
	2QZ/STCXWrs7pA/LtfK3VNsfyhl8iU9C2rqtcTxiFeKmRPgFkerXCkKW1aGGEMEjTQQj
	ITJIC4CTRxAGB4/XHPhpruKdQt+nUDMeHXjPoQFrTTxpO9jH/0oW4ABNYQYOLz69itZp
	6nnA==
X-Gm-Message-State: AA6/9RnpocjuYNmmjWkASf7rYASklnOpq6y9y/UXgqVEgmcvV5bJjAsmDn+d+bWDHNx6vg==
X-Received: by 10.25.75.65 with SMTP id y62mr3277110lfa.118.1476984107560;
	Thu, 20 Oct 2016 10:21:47 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	o194sm7310540lfo.42.2016.10.20.10.21.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Oct 2016 10:21:46 -0700 (PDT)
Date: Thu, 20 Oct 2016 19:21:46 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: P J P <ppandit@redhat.com>
Message-ID: <20161020172146.GA25226@toto>
References: <1476784025-27293-1-git-send-email-ppandit@redhat.com>
	<CAFEAcA8hkSJa5rVpNrL1D7w_U-1EKSf-t2G5jKzxceXL2rqRdg@mail.gmail.com>
	<alpine.LFD.2.20.1610182307550.1547@wniryva>
	<CAKmqyKOMrcTAta-rHj-yFbdpPpT_wtpO-YWAqK=AVCuUuJTT4A@mail.gmail.com>
	<alpine.LFD.2.20.1610191539170.12629@wniryva>
	<CAKmqyKMLvYDTvofMF=5k2sYNKPS+HtWYvz6RCdsd4AQG97H6nQ@mail.gmail.com>
	<alpine.LFD.2.20.1610201116520.27908@wniryva>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.20.1610201116520.27908@wniryva>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
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
X-TUID: 1TdyJ25oJxBo

On Thu, Oct 20, 2016 at 11:25:47AM +0530, P J P wrote:
> +-- On Wed, 19 Oct 2016, Alistair Francis wrote --+
> | I don't think the Cadence datasheets are public. If you can't find it
> | from a simple Google search I don't think you have access.
> 
>   I see, okay.
> 
> I think it'll greatly help if device emulator writers include a link to its 
> specification/datasheet resources in the respective source file. At least if 
> these are publicly available. That way one knows for sure which specifications 
> to follow while debugging, instead of searching and sifting through multiple 
> different versions. OR Maybe there could a field in the MAINTAINERS file which 
> would point to respective reference resources. (just a thought)

Hi,

The UART is described in the Zynq TRMs, I think you can just
google for zynq TRM and a reference to UG585 and UG1085 will come up.

http://www.xilinx.com/support/documentation/user_guides/ug585-Zynq-7000-TRM.pdf
http://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf

AFAIK, the ZynqMP has a newer version of the cadence UART with a superset of
the feature set. I don't think QEMU models any of the differences though.

Cheers,
Edgar


> 
> Thank you.
> --
> Prasad J Pandit / Red Hat Product Security Team
> 47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
> 
