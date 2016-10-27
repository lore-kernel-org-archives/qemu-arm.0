Received: by 10.80.166.35 with SMTP id d32csp783727edc;
        Thu, 27 Oct 2016 12:02:44 -0700 (PDT)
X-Received: by 10.13.226.76 with SMTP id l73mr8137978ywe.282.1477594964432;
        Thu, 27 Oct 2016 12:02:44 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h203si4118509vkh.86.2016.10.27.12.02.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Oct 2016 12:02:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43982 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzpwp-0006cA-Qz
	for alex.bennee@linaro.org; Thu, 27 Oct 2016 15:02:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53050)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bzpwl-0006ak-8g
	for qemu-arm@nongnu.org; Thu, 27 Oct 2016 15:02:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1bzpwk-0004ix-IT
	for qemu-arm@nongnu.org; Thu, 27 Oct 2016 15:02:39 -0400
Received: from mail-oi0-x234.google.com ([2607:f8b0:4003:c06::234]:34364)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1bzpwi-0004gz-9o; Thu, 27 Oct 2016 15:02:36 -0400
Received: by mail-oi0-x234.google.com with SMTP id p136so17661207oic.1;
	Thu, 27 Oct 2016 12:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=nk6FBRJcVhdyXdEkQQVFda8/Tr9PNCG5Yz08c0KKC1w=;
	b=FgBS4TxxMikV3um/McF5qdetjmswSBm7ohXMI/dhY39xmVdX1lo9vpmqLp9vqfrCFA
	6F/cPkb9YbCHGiHS5eo4QqMlILgxFiel0hyZwzxJUce2L69dgWJH0ZKt6wDn+/E+KC3f
	4R7tYEfKJFh56i9V28eiVC+CIgsOzcXWuk9m7zhjXLW3MUov+FWSV9zqQzh7hME8Wzqf
	IgtgrnB0Vb5PuDgSsIDJSc2Tnxukb0jONfmmXmmPPGq7EScM9iY1op4N7Xf2/faaFesq
	d1CGT//K2KXoRAfRFPfEWhI91FJUzNCGywgDXHhvx8kaGQB8vFnLhDwqw5AbTLvBbVmE
	eEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=nk6FBRJcVhdyXdEkQQVFda8/Tr9PNCG5Yz08c0KKC1w=;
	b=aTxwv0d/O8MGd0H3Gc1L6RsMMYUv6BY5Orf3a1tnbnrnAWzVFFest3MIWK/aeBBWiS
	kcAAHhT5ibGucrQViiKg2Sd9To2FF30bSQ9QHqqX3e0R4q4xch0HO0Tr+tX5viR4bkey
	hs0NrfkQ5ZfelF+euXjbGLp4ZJwq10SbS9M4nQWnJIhKYuB0VU+3+b6WAgNQRL+wfmyx
	sRww+Z3OrCSJ48bZSw1r7y9GYyluYuJ9dkdw3d40r7IKprhYndV6kgmgf//R8mD4EM3Z
	SLkTrc4Vx3KA44muTZEJAJDA8J9gXL9ACQ5JZrj1W84C+s41UnWpYzbuhOPwhwWGMoh8
	R6Vg==
X-Gm-Message-State: ABUngvdSHWqlBmGLu89qSg34tTYiDvgw5r6GU51DVWZ/ubdsqRpzfr9o8CIxN93wxSWSsxQJulwL9mAEa7FkzA==
X-Received: by 10.202.76.196 with SMTP id z187mr5923429oia.100.1477594955119; 
	Thu, 27 Oct 2016 12:02:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.122.34 with HTTP; Thu, 27 Oct 2016 12:02:04 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1610271156591.14744@wniryva>
References: <1477516945-9891-1-git-send-email-ppandit@redhat.com>
	<CAKmqyKOuX7cZuYa7xCc69b322S3XpM_0VQMc0DQ4b=Gvq3UM+w@mail.gmail.com>
	<alpine.LFD.2.20.1610271156591.14744@wniryva>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 27 Oct 2016 12:02:04 -0700
X-Google-Sender-Auth: F1CGKKHgVrB23v5YwhMLr7C1KJE
Message-ID: <CAKmqyKOhRws=O=xudFEzvn_51yR3A1XBcLXGDtg9xbtuUT1OxQ@mail.gmail.com>
To: P J P <ppandit@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::234
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
X-TUID: Iqhh1/pEGS3U

On Wed, Oct 26, 2016 at 11:29 PM, P J P <ppandit@redhat.com> wrote:
> +-- On Wed, 26 Oct 2016, Alistair Francis wrote --+
> | >   * Device model for Cadence UART
> | > + *   -> http://www.xilinx.com/support/documentation/user_guides/ug585-Zynq-7000-TRM.pdf
> |
> | Nit pick, I would put the URL under the title below.
>
>   Okay.
>
> | > +    case R_BRGR: /* Baud rate generator */
> | > +        s->r[offset] = 0x028B; /* default reset value */
> |
> | Why do we still have the reset value here, I thought we were just
> | ignoring the invalid writes? You don't need to reset it.
>
>   Wouldn't that leave the registers undefined ?

No, they will just remain at whatever they were previously set to.
Which should always be valid.

Thanks,

Alistair

>
> Thank you.
> --
> Prasad J Pandit / Red Hat Product Security Team
> 47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
>
