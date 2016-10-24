Received: by 10.80.166.35 with SMTP id d32csp2501721edc;
        Mon, 24 Oct 2016 00:47:24 -0700 (PDT)
X-Received: by 10.200.38.186 with SMTP id 55mr12882100qto.35.1477295243963;
        Mon, 24 Oct 2016 00:47:23 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t79si10192992qka.252.2016.10.24.00.47.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Oct 2016 00:47:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45132 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1byZyc-00049n-Sw
	for alex.bennee@linaro.org; Mon, 24 Oct 2016 03:47:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1byZyX-00048P-Hm
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 03:47:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1byZyW-00023u-JP
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 03:47:17 -0400
Received: from mail-yw0-x232.google.com ([2607:f8b0:4002:c05::232]:34849)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1byZyW-00023e-CO; Mon, 24 Oct 2016 03:47:16 -0400
Received: by mail-yw0-x232.google.com with SMTP id t193so175400823ywc.2;
	Mon, 24 Oct 2016 00:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=U1NyQ36DAT+dA2DScRg0JsIunwYi7Z2ztfIuqa03i78=;
	b=a4jx4FBNedfU5ri7FbsEg3UKdcYJ9T0tEgj0kXJ0cI4FY4K7GDAMgV5rzv+cXEYZdE
	yKiYozI8GU5glRnEzqC4hNZNTyCtdmUTaSl9pWa4ZBkvAAVIRrwIrNYKUWg8Qg1AU3Yd
	5Fx/hXHfZdc80ttMcpQUa8i+gb1Uv7B3J8sRj3ilOBcrkCsnK8CXy32V9Uu0XzTLuA87
	phEpw71TPhRApbML8EjQgZ1WkRFmscXwu0TMk6/9Kr/sl4XbWg5c8PsdUytWojJS/4B2
	ahtxL6GXoiylpiuLfPaJ0NicQR3JH7s75AjHlzlG7rSOaQm+nrraNgvSGwMPE49GSgkp
	NGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=U1NyQ36DAT+dA2DScRg0JsIunwYi7Z2ztfIuqa03i78=;
	b=USKCRAjh4IBkW0Tgc70O5626L8GrJxPa4AM9NEv0lFpRPCnzcWjlm6NVxeua3Nj7DF
	+I+lsBE4YlekcQbZWMe9j+DGW3Mtgncwh+SmSEraIyWoPCT5Fer+4Z4WjkCElSEwc1V/
	FMflHAALOvVaM2EFsGrftjzE7H+Q6PxHG+h7r0V9JG2yZ7iY9ORhUdijbkxmaa/MZ0iM
	w6Eadx7zyWEF+kaTiUeHkR8/gxbi0jCB0jOxG9YNdztRuOeydVjT8B+uLWY2Eo4ESWvG
	IGwSfTanNaFcwmRkLsvUWFmBi0ZJOZrbDcYcFtej2YTKJ+ZDMgFhly9pAOGAsCQP7mH7
	Fc1A==
X-Gm-Message-State: AA6/9RnNaQ8ysZBVHq+/7imqrQeSANY0VL9Tb4YYqDeos+kgS+fJfZD6LZWjt59MUrX8QtClcr00lDuKkA65ig==
X-Received: by 10.202.84.213 with SMTP id i204mr19060847oib.100.1477295234558; 
	Mon, 24 Oct 2016 00:47:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.148.102 with HTTP; Mon, 24 Oct 2016 00:46:44 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1610211311300.18921@wniryva>
References: <1476784025-27293-1-git-send-email-ppandit@redhat.com>
	<CAFEAcA8hkSJa5rVpNrL1D7w_U-1EKSf-t2G5jKzxceXL2rqRdg@mail.gmail.com>
	<alpine.LFD.2.20.1610182307550.1547@wniryva>
	<CAKmqyKOMrcTAta-rHj-yFbdpPpT_wtpO-YWAqK=AVCuUuJTT4A@mail.gmail.com>
	<alpine.LFD.2.20.1610191539170.12629@wniryva>
	<CAKmqyKMLvYDTvofMF=5k2sYNKPS+HtWYvz6RCdsd4AQG97H6nQ@mail.gmail.com>
	<alpine.LFD.2.20.1610201116520.27908@wniryva>
	<20161020172146.GA25226@toto>
	<alpine.LFD.2.20.1610211311300.18921@wniryva>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 24 Oct 2016 09:46:44 +0200
X-Google-Sender-Auth: bURjQYQrE3S2cACUyU3rEq3Ie2s
Message-ID: <CAKmqyKMMFcbXPv9cE-G5P2n74vXcMtWAb0sFg_J7DP+vkyxKCg@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::232
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Qemu Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Huawei PSIRT <psirt@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7VjzY8VAvi+v

On Fri, Oct 21, 2016 at 9:47 AM, P J P <ppandit@redhat.com> wrote:
> +-- On Thu, 20 Oct 2016, Edgar E. Iglesias wrote --+
> | The UART is described in the Zynq TRMs, I think you can just
> | google for zynq TRM and a reference to UG585 and UG1085 will come up.
>
>   Unlikely for a novice to think 'zynq TRM' as search term for cadence UART. I
> went with Xilinx Cadence UART specificaiton.
>
> | http://www.xilinx.com/support/documentation/user_guides/ug585-Zynq-7000-TRM.pdf
> | http://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf
> |
> | AFAIK, the ZynqMP has a newer version of the cadence UART with a superset of
> | the feature set. I don't think QEMU models any of the differences though.
>
>   I see, thank you for the details. I'll add these to the source file.

Did the TRM have enough detail for you to figure out how the hardware behaves?

Thanks,

Alistair

>
> Thank you.
> --
> Prasad J Pandit / Red Hat Product Security Team
> 47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
>
