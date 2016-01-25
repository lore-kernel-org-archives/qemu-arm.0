Received: by 10.25.159.19 with SMTP id i19csp1328023lfe;
        Mon, 25 Jan 2016 08:02:33 -0800 (PST)
X-Received: by 10.140.93.166 with SMTP id d35mr21715423qge.29.1453737746988;
        Mon, 25 Jan 2016 08:02:26 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t67si11595854qkl.123.2016.01.25.08.02.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jan 2016 08:02:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39420 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aNjb0-0006vr-Dq
	for alex.bennee@linaro.org; Mon, 25 Jan 2016 11:02:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60889)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ruslan.bilovol@gmail.com>) id 1aNhY7-0002JX-13
	for qemu-arm@nongnu.org; Mon, 25 Jan 2016 08:51:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ruslan.bilovol@gmail.com>) id 1aNhY6-0003gE-0A
	for qemu-arm@nongnu.org; Mon, 25 Jan 2016 08:51:18 -0500
Received: from mail-ig0-x234.google.com ([2607:f8b0:4001:c05::234]:37387)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ruslan.bilovol@gmail.com>)
	id 1aNhY4-0003fc-7p; Mon, 25 Jan 2016 08:51:16 -0500
Received: by mail-ig0-x234.google.com with SMTP id h5so30469277igh.0;
	Mon, 25 Jan 2016 05:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Ds3Cfd+OxlwPocmTv7/hNQpvuuQI4R3SXbEpE/unAJM=;
	b=scDsSQM75bla/G5/tFybBapTHQG/8QgbhHwFkrJfUQNHnbwOjQigr8SK2Zc0Dzvttq
	pVoOhSEpZKEFP5XBzUpq7GQ9T9zN9+5jSisOl8aLI+dnZpPq8EyRcBmPFgFnYnzaNxmP
	zEOfFy3Z3pvtHwdJPMn/yJg1itTnBduf5uXxCeN+ZR2CwkfzOXcB19wRaISl1PWz9F9N
	sPXKCDpafc3RkE4IrwpZykDCx+ZMUl+b9x8+wngvjB4XLHuoEHdhWSzm4Ey+BOX3RQqI
	+vF9gEAUNonOzmuzRWxeYwwq4JyTq1Wv1+KIm/L5QLHs6OjNBPzX3PkHxMfPTLoabHvo
	HMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=Ds3Cfd+OxlwPocmTv7/hNQpvuuQI4R3SXbEpE/unAJM=;
	b=JYTTL34ccqwSmrNhfzSg4i7JY4MUBRLRhREenMrDij33udnI0Q3/56kkhZu5Upc1Y4
	5s8kXnidgQ/TcL0Az1SDV8LGEUdeagct9jrJZeLlXA4LP0Q5IPxWZKnMib3Afwq4qRLJ
	zvEyh8wltR1EEpx0ASpH7jCRu/fOLVr3YP1oHn/kmGsqfWF60yJnURu6g/kdWOWtp3vx
	28ckqLn4Vv8EIYT9j3lVFh737QodLlQeJfhp/I1N/jk98zv/LsNzSTcqKJ1i/Vc6MkAS
	doQq1nAN5s/wbxSwodoXmYdaXaaFhBU9By6fmjdXaxFuQs+Bkm4c4Xxy03TuSZLoAgL7
	+a7A==
X-Gm-Message-State: AG10YOTE62UkV51pDBr0m5dNRzg8Kh8//BTyN2P2Zl0i/Y7+TUQAvB290WInytVzpBRyt8ZhXBnW8AxjRcGMYg==
MIME-Version: 1.0
X-Received: by 10.50.111.111 with SMTP id ih15mr18026844igb.78.1453729875664; 
	Mon, 25 Jan 2016 05:51:15 -0800 (PST)
Received: by 10.107.130.228 with HTTP; Mon, 25 Jan 2016 05:51:15 -0800 (PST)
In-Reply-To: <CAB=otbRNpbTr3TK1RQrcaPWSr_SjhXwpDEcD+1LsYX6YmFReGw@mail.gmail.com>
References: <CAB=otbRNpbTr3TK1RQrcaPWSr_SjhXwpDEcD+1LsYX6YmFReGw@mail.gmail.com>
Date: Mon, 25 Jan 2016 15:51:15 +0200
Message-ID: <CAB=otbRXOcFOkiom5NdkZjD14q8EJ+URqaac1O6UmJv2AOdCyQ@mail.gmail.com>
From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c05::234
X-Mailman-Approved-At: Mon, 25 Jan 2016 11:02:26 -0500
Subject: Re: [Qemu-arm] Does QEMU support AArch64 Big Endian emulation on
	x86-64 host?
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
X-TUID: nI7wbBtJ7rCh

CCing qemu-arm list as well

On Mon, Jan 25, 2016 at 3:48 PM, Ruslan Bilovol
<ruslan.bilovol@gmail.com> wrote:
> Hi all,
>
> I'm trying to run AArch64 Big Endian image under QEMU that I built for
> my x86-64 Ubuntu host from latest master branch and when I'm running
> kernel I'm getting next error:
>  > qemu: fatal: Trying to execute code outside RAM or ROM at 0x500208000080ffff
>
> Similar image built as Little Endian runs fine with same QEMU tool
> (qemu-system-aarch64)
>
> So I'm wondering is it possible to run QEMU AArch64 Big Endian
> emulation on x86-64 host?
>
> Thanks,
> Ruslan Bilovol
