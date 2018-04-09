Received: by 10.28.71.155 with SMTP id m27csp2841169wmi;
        Mon, 9 Apr 2018 11:03:11 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48LVYtbj2OvJFY8nd9DbdWUJMgYuMr8pVey1VoTyklU5bNtevqIuW4FwD9DBD6woZkHDJJs
X-Received: by 10.55.192.20 with SMTP id o20mr49725565qki.257.1523296990915;
        Mon, 09 Apr 2018 11:03:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523296990; cv=none;
        d=google.com; s=arc-20160816;
        b=t/YivW6S0QART7O9UzG0ycPMGim3IGHtW8C+iD1Qm0cFR+jlwfWq9iY0lP+nUDqyMi
         Y0b9rph5C9ViA+4FR4dEXgRtkFp2+Nbxrv3AoKtYfS9li2R5u80k0dDl4INWOVq+Cpyb
         I2h4aRiJjAeprYgPtfOc0lmRzTXeqoAt/TBeEG9Ch2xIOCr352ZxPE4LRMwgGCzgh+c3
         3eZ+Np2JFUgZpAdmv6S069aMhyHXaQ7qtgcNm6vtpK0CtbdhvEJpp3XMwCv2k2S4B4qH
         NQS/JxyyhS46TVTlErY+p3S5iXIbCazTvFjN/cDOyTxUT2ViPU7/nW7u3WqHLsTBkEwr
         6/IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=RsciH4etfqBjWUZxN8yvrJYSxoquLZaxpzUmv4yj+0o=;
        b=wqfX2qJ9i1cJFjooixL4rsNs0Ph6cShpN9ZiIMXTkxZyfXSgyKI4fAFdvYPtM6WGTg
         TVH6RWOpBWPVouYRyLDfF1SgeXbdP9JcAgem9vP7Ynj3HY5TpG8b8lzBSyhRmpDSLJ6J
         A6wvBdnWLaDAAo5ASPCtpM4RxtjjeYLm8GfhT5n6TSW3G7EpkQIgH3cp+55lALCFoyuj
         Mu7BM2BC3tD4mSwKsq2mXcao17FbBUCg9HmvsqXgWgH+t7BXMxbBchRaLS6ptRZnStdQ
         +EJekZSY1viqdMGa02X715EBZif98LxzaVnFyMfwWX0vOru/Y0VPm3WZ4nqQgVJqi3+I
         gsAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=dTcTuj7g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u64si1095636qkg.16.2018.04.09.11.03.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Apr 2018 11:03:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=dTcTuj7g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56143 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f5b8I-0000na-FS
	for alex.bennee@linaro.org; Mon, 09 Apr 2018 14:03:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38655)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ajaygargnsit@gmail.com>) id 1f5b88-0000n1-Kr
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 14:03:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ajaygargnsit@gmail.com>) id 1f5b87-0002R2-R2
	for qemu-arm@nongnu.org; Mon, 09 Apr 2018 14:03:00 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:42505)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ajaygargnsit@gmail.com>)
	id 1f5b87-0002QY-Il; Mon, 09 Apr 2018 14:02:59 -0400
Received: by mail-lf0-x242.google.com with SMTP id q9-v6so7860100lfk.9;
	Mon, 09 Apr 2018 11:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RsciH4etfqBjWUZxN8yvrJYSxoquLZaxpzUmv4yj+0o=;
	b=dTcTuj7g7QiiC4Y1ohj6oQkBTa7upRCqood0QDhD1W9/kooiIjiezWrUnLAq3gkCRn
	M9HONCVIl788Wvoewq50mhO8SzJdMqKOCaYL52bvuzHFcetJBSivtuQHf7on8q1qrfHJ
	8/nCxqmz7x/g08R3YJwve2CgW4W8i7O+Vkh8numek5z+AjGxe9IktelRlqMXYP7/dbQh
	T7Tilt+4l+fcelv2DRwOmDXshftKgNPcDR/tMQKbg0bSVzywNRmMBzHp6/I2tPlxXw8u
	otMBL/6PL4mlPpS46oLeyLYYCjzL8KMqtn+Xtr5QmpXVsjknaJfDgFgmk4pH/gVpx63e
	ZZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RsciH4etfqBjWUZxN8yvrJYSxoquLZaxpzUmv4yj+0o=;
	b=Hcb+FP7027locNOxDMc4Sqo3zMIzYHd2o2aY72HsoT6bgJFmmPtnUtxlyGJw6lMiOn
	qzFo+UNhPkL/aM7XFv9CMffCkIaqk+XhmRsyr/vU8+xQ0mra9rIXtPp/umiGycXpnaJE
	V+IOxt3CxB71yq1Hm5NxRGs2rUl31xLtIGge652EC7h+EGzqYNXmm/UGPRQ+yJic6RSR
	p4O/maAHkDDGooVgkmrH/R7YLVAPyPppCfyJkMPsOogSBl0gs7f+Yehmj0t0RxbGRdRq
	cgHeKLCv56JWplZezBogpPUUgv0tKTbpfDmNUYv4DbLDvNLOreFGWlhv3nCubtPli8OO
	hZeQ==
X-Gm-Message-State: ALQs6tBHAa/IY0lB2eiJjukBjlgrNnwIwTNvurQ+piLw1cOPKg58AtXG
	5E8Eei96jDOts2BRIcZ3VY/8grdbyXodmKrbanU=
X-Received: by 2002:a19:ca10:: with SMTP id a16-v6mr2502lfg.25.1523296977970; 
	Mon, 09 Apr 2018 11:02:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:1708:0:0:0:0:0 with HTTP;
	Mon, 9 Apr 2018 11:02:57 -0700 (PDT)
In-Reply-To: <CAFEAcA_WOvTLnyOTWdO-PhoXsOWkUbayutxLr0jthowOfNgaVw@mail.gmail.com>
References: <CAHP4M8VVWyNqi4yLS3S0GXaDz3j8QvUiC=aoJ_DfZLtZBaFwqg@mail.gmail.com>
	<CAFEAcA9stTjg3Wpq5x_vj63jm1DrxAQREk4XPeFWb5rff-Uofg@mail.gmail.com>
	<CAHP4M8X-Dus1Z8UegDTaab5LvaiDAgQa8upsx_KdnPO+A-XoTQ@mail.gmail.com>
	<CAFEAcA_1X1AQ6j9pZQ8fEHmQCxRNK7EhGkohuLbTMpoPONe5PA@mail.gmail.com>
	<CAHP4M8WUd9QKTCETaKNa+VQ6hMLcND8dfdDAZ3QutieDaE1WKQ@mail.gmail.com>
	<CAFEAcA_WOvTLnyOTWdO-PhoXsOWkUbayutxLr0jthowOfNgaVw@mail.gmail.com>
From: Ajay Garg <ajaygargnsit@gmail.com>
Date: Mon, 9 Apr 2018 23:32:57 +0530
Message-ID: <CAHP4M8WLXqvCVGxVyaTiCQbwcJVXEPCnRL1DTzzNZq1Cbu0v1w@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-arm] Use of -machine when running via qemu-system-arm
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lreZzkJ/4JRm

Thanks a ton Peter, that cleared things up a great deal !!!
Thanks again for the quick help !!


Thanks and Regards,
Ajay

On Mon, Apr 9, 2018 at 11:17 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 9 April 2018 at 18:41, Ajay Garg <ajaygargnsit@gmail.com> wrote:
>> Hi Peter.
>>
>> The link is pretty good, just that I am a complete noob.
>>
>> Maybe a more concrete example on the following, clearly specifying why
>> things work on x86 without the need of -machine flag, will make things
>> crystal clear :
>>
>> Because ARM systems differ so much and in fundamental ways, typically
>> operating system or firmware images intended to run on one machine
>> will not run at all on any other. This is often surprising for new
>> users who are used to the x86 world where every system looks like a
>> standard PC. (Once the kernel has booted, most userspace software
>> cares much less about the detail of the hardware.)
>
> For instance, on x86 you can always find the UART for serial
> output at IO port 0x3f8, and it's always an 8250 or compatible.
> On Arm, the memory address where the UART is will be likely
> different for every board. And once you know the address of the
> UART, each SoC likely may well have its own implementation,
> which has different registers that do different things.
> And there's no way to probe for what's there -- you have to
> know in advance. So you can't even usefully print bootup
> messages without knowing what you're running on.
>
> thanks
> -- PMM
